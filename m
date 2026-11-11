Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880F7606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 17:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=1AuoDiOE
Received: from list by lists.xenproject.org with outflank-mailman.1484429.1687747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRBuK-00083m-FQ; Wed, 11 Nov 2026 17:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484429.1687747; Wed, 11 Nov 2026 17:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRBuK-00083f-Ct; Wed, 11 Nov 2026 17:14:48 +0000
Received: by outflank-mailman (input) for mailman id 1484429;
 Wed, 11 Nov 2026 17:14:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xRBuJ-0007qF-3t
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 17:14:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xRBuI-00000008UY1-1rve;
 Wed, 11 Nov 2026 17:14:46 +0000
Received: from [217.155.165.12]
 (helo=4b664947-eb84-4a1c-9b91-21fc87073f93.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xRBuI-0000000FCa8-2mts;
 Wed, 11 Nov 2026 17:14:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=6sigdkcnP39HsyMQhy/xtQeXT205mn8LadX7d9oCFqc=; b=1AuoDiOEflW7A6IKtTVqn+Ky4G
	epu+lbgWj/cGlLobkP3AJ9gW2dROP4ZxhEKFJDEsNlOq+ZJWAHFeGty3EJ2ft4fRSrpMvQrv1nf99
	oLdL4aVqZ2jM/nUT2fbcO/Pi1h4B9il9aGdWNQ717mOtW4lX+zUTChNvH97cJHIlmCg0=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 2/2] x86/pv: free the shared_info page switch_compat() replaces
Date: Wed, 11 Nov 2026 17:14:41 +0000
Message-ID: <20261111171441.23101-2-gwd@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111171441.23101-1-gwd@xenproject.org>
References: <20261111171441.23101-1-gwd@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For a 32-bit PV guest, switch_compat() replaces a shared_info page
above 4GiB with one below, and drops the old page with a bare
put_page().

Unfortunately, this violates the expected
xenheap-page-shared-with-guest freeing discipline.  Xenheap pages
don't start with a reference count, and aren't put back into the
allocation pool after their reference count drops to zero; they're
removed from the domain's xenheap list, but someone needs to
explicitly call free_xenheap_page() on them for them to return to
their pool.

d->shared_info here only has a non-zero reference count because it was
shared with a guest; and the thing that holds that reference is the
PGC_allocated bit.  Dropping the reference without having been the one
to clear the PGC_allocated bit puts the page in an invalid state.

If there are no outstanding references to d->shared_info when
switch_compat() happens, the result for pages moved this way is merely
a memory leak: the page is removed from the xenheap list, and nothing
ever calls free_xenheap_page() on it.  So whenever this path is
triggered, a page is leaked.

Theoretically, if there *is* an outstanding reference to
d->shared_info, *and* that reference is still held when the domain is
destroyed, then the result is a reference count underflow: Because the
reference count never drops to zero, the page stays on the xenheap
list; then during domain destruction, relinquish_memory() walks the
list, sees the PGC_allocated bit, and calls put_page() again --
potentially dropping the page count to zero.  When the other reference
holder drops their reference, the count underflows.  (put_page() only
ASSERT()s that the count is non-zero, so this wouldn't cause a crash
in a release build; and the page is never freed, so other potential
hazards of general ref count underflow are avoided.)  Fortunately this
is impossible with the in-tree toolstack, which only switches a domain
while building or restoring it, and doesn't have a mapping of
shared_info that it holds across that call.

Release the page the way domain destruction releases d->shared_info:
drop the allocation reference with put_page_alloc_ref(), as
relinquish_memory() does, which clears PGC_allocated and takes the page
off the xenheap list once nothing else refers to it, and free it with
free_xenheap_page() once an RCU grace period has passed.

The free waits for the grace period because do_settime() writes every
domain's wallclock holding only wc_lock and the domain list's RCU read
lock, neither of which excludes switch_compat(), through a pointer it
may have read before the switch.  The RCU callback uses the domain's
own RCU head, d->rcu, and holds a reference to the domain.  That
reference keeps the domain from being destroyed, and its struct freed,
before the callback has run.  It also keeps d->rcu's only other user,
domain_destroy(), from queueing the head in the meantime; if the
callback drops the last reference, domain_destroy() queues d->rcu
again, which RCU has finished with by then.  No other reference to the
page is expected: with no memory, the domain has no page tables that
could map it, and the in-tree toolstack holds no mapping of it across
the switch.  If something holds one all the same (a toolstack that
mapped the page before the switch, for instance), leave the page alone
and leak it, rather than free a page that is still in use.

Freeing the page relies on "tools/libs/guest: re-read dominfo after
changing a PV guest's width on restore", without which restoring a
32-bit PV guest maps the replaced page by the frame number it read
before the switch.  Once the page is freed, that frame can come back as
one of the restored domain's own pages, which restore would then write
the saved shared_info into.

Also allocate the new page into a local variable rather than straight
into d->shared_info: if the allocation failed, a concurrent
do_settime() could dereference the NULL pointer before the old value
was restored.

Fixes: 8a9255405ca6 ("x86/domain: adjust limitation on shared_info allocation below 4G")
Suggested-by: Jan Beulich <jbeulich@suse.com>
Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- If the page is still referenced once its allocation reference has
  been dropped, leak it rather than free it (Jan).
- Depends on a new patch, "tools/libs/guest: re-read dominfo after
  changing a PV guest's width on restore".

Tested on an Intel box (debug build, PV dom0), with restore's steps
replayed from dom0 in the order libxenguest takes them without
"tools/libs/guest: re-read dominfo after changing a PV guest's width on
restore" (no 32-bit PV guest here can suspend).  Once the domain's
memory is populated, the replaced page comes back as its pfn 0 every
time, and maps.  With a mapping of the old page held across the switch,
the page is leaked with the new message, and the unmap is clean.
---
 xen/arch/x86/include/asm/domain.h |  3 +++
 xen/arch/x86/pv/domain.c          | 43 ++++++++++++++++++++++++++-----
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 634d0710bf..906078641c 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -302,6 +302,9 @@ struct pv_domain
 
     /* Maximum physical-address bitwidth supported by this guest. */
     unsigned int physaddr_bitsize;
+
+    /* shared_info page switch_compat() replaced, until it is freed. */
+    void *old_shared_info;
 #endif
 
     /* map_domain_page() mapping cache. */
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 0c42ae58aa..3bd6b6f6d7 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -231,6 +231,14 @@ unsigned long pv_make_cr4(const struct vcpu *v)
 }
 
 #ifdef CONFIG_PV32
+static void cf_check _free_old_shared_info(struct rcu_head *head)
+{
+    struct domain *d = container_of(head, struct domain, rcu);
+
+    FREE_XENHEAP_PAGE(d->arch.pv.old_shared_info);
+    put_domain(d);
+}
+
 int switch_compat(struct domain *d)
 {
     struct vcpu *v;
@@ -256,16 +264,17 @@ int switch_compat(struct domain *d)
     if ( virt_to_maddr(d->shared_info) >> 32 )
     {
         shared_info_t *prev = d->shared_info;
+        shared_info_t *next = alloc_xenheap_pages(0, MEMF_bits(32));
+        struct page_info *prev_pg = virt_to_page(prev);
 
-        d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32));
-        if ( !d->shared_info )
+        if ( !next )
         {
-            d->shared_info = prev;
             rc = -ENOMEM;
             goto undo_and_fail;
         }
-        clear_page(d->shared_info);
-        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
+        clear_page(next);
+        share_xen_page_with_guest(virt_to_page(next), d, SHARE_rw);
+        d->shared_info = next;
         /*
          * Ensure all pointers to the old shared_info page are replaced.  vCPUs
          * below XEN_LEGACY_MAX_VCPUS may have stashed a pointer to
@@ -273,7 +282,29 @@ int switch_compat(struct domain *d)
          */
         for_each_vcpu ( d, v )
             vcpu_info_reset(v);
-        put_page(virt_to_page(prev));
+
+        /*
+         * Drop the allocation reference, which takes the page off the
+         * domain's xenheap list unless something else still refers to it.
+         * If something does, leak the page rather than free it while it is
+         * in use.  Otherwise free it once an RCU grace period has passed:
+         * do_settime() may still be writing through a pointer to it.  The
+         * reference taken on the domain keeps it alive until then, and
+         * keeps domain_destroy(), the only other user of d->rcu, from
+         * queueing it while the callback is pending.
+         */
+        put_page_alloc_ref(prev_pg);
+        if ( !(prev_pg->count_info & PGC_count_mask) )
+        {
+            ASSERT(!d->arch.pv.old_shared_info);
+            d->arch.pv.old_shared_info = prev;
+            get_knownalive_domain(d);
+            call_rcu(&d->rcu, _free_old_shared_info);
+        }
+        else
+            printk(XENLOG_WARNING
+                   "%pd: leaking replaced shared_info page %"PRI_mfn": still in use\n",
+                   d, mfn_x(page_to_mfn(prev_pg)));
     }
 
     for_each_vcpu( d, v )
-- 
2.56.0


