Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A7F606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=CZ7OMUrt
Received: from list by lists.xenproject.org with outflank-mailman.1463712.1674470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMCj9-0002bX-TL; Wed, 28 Oct 2026 23:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463712.1674470; Wed, 28 Oct 2026 23:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMCj9-0002aq-PK; Wed, 28 Oct 2026 23:06:39 +0000
Received: by outflank-mailman (input) for mailman id 1463712;
 Wed, 28 Oct 2026 23:06:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMCj8-0002Vj-W3
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:06:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCj8-00000000oyw-24N5;
 Wed, 28 Oct 2026 23:06:38 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCj8-00000001KpM-07RY;
 Wed, 28 Oct 2026 23:06:38 +0000
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
	bh=V0LyJBxVk4KD9HGsd+/rOvk7kIUU4yEoOtzPVbAsy4M=; b=CZ7OMUrt0B+0YK9aGFFnyswUnJ
	5J+fJCVrQov+Pv64T22thEqJaVzrdrcv3UtnKsyKZ+f9coqUVibPlJ06pmbKgh5xav0FZWzuOpJpI
	Ltr9bIw8b68c2g9iMx9gI3IzcJVrUbOoYXRqPcvl/Gc3r2cVWUNJ1Y3dyVHTYtZvfg0c=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 02/45] x86/mm: refuse to promote an L4 while the domain has no per-domain L3
Date: Wed, 28 Oct 2026 23:05:16 +0000
Message-ID: <20261028-asi-hvm-v5-2-13b908e0df0b@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

init_xen_l4_slots() puts the domain's per-domain L3 in slot 260 of the
L4s it fills.  Since fcf91ce9de66 ("x86/pv: don't populate the GDT/LDT
L3 slot at domain creation") a PV domain gets that L3 with its first
vCPU (pv_create_gdt_ldt_l1tab()).  Only mapcache_domain_init() makes it
earlier, with the domain, and release builds skip that unless memory
hotplug is enabled or the host's memory reaches past the part of the
directmap PV guests can see.  So in release builds on most hosts, an L4
that is promoted before XEN_DOMCTL_max_vcpus has created the domain's
vCPUs gets a slot 260 entry made from a NULL page (0x803e900000000063),
pointing far beyond the host's memory.

Have promote_l4_table() return -EINVAL while the domain has no
per-domain L3, before taking any reference.  The other callers of
init_xen_l4_slots() all run once the L3 exists; have init_xen_l4_slots()
check that with a BUG_ON().  An ASSERT() would not do: the case above
arises only in release builds.  libxl is unaffected: it creates the
vCPUs before it builds or restores a domain.

There's no way to trigger the issue from the current toolstack; this
is just belt-and-braces.

Fixes: fcf91ce9de66 ("x86/pv: don't populate the GDT/LDT L3 slot at domain creation")
Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- Test for the per-domain L3 itself, not for vCPU 0 (Roger).
- BUG_ON() in init_xen_l4_slots() if the domain has no per-domain L3.
- Retitle (was: "x86/mm: refuse to promote an L4 while the domain has
  no vCPU").

Changes in v4:
- New in this version, split out of "x86/hvm: introduce per-vCPU L3
  page-table": promote_l4_table() fails while the domain has no vCPU
---
 xen/arch/x86/mm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e42cd33c0d..f00f0b831d 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1721,6 +1721,7 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
         l4e_from_mfn(sl4mfn, __PAGE_HYPERVISOR_RW);
 
     /* Slot 260: Per-domain mappings. */
+    BUG_ON(!d->arch.perdomain_l3_pg);
     l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
         l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
 
@@ -1798,11 +1799,20 @@ static int promote_l4_table(struct page_info *page)
 {
     struct domain *d = page_get_owner(page);
     mfn_t          l4mfn = page_to_mfn(page);
-    l4_pgentry_t  *pl4e = map_domain_page(l4mfn);
+    l4_pgentry_t  *pl4e;
     unsigned int   i;
     int            rc = 0;
     unsigned int   partial_flags = page->partial_flags;
 
+    /*
+     * init_xen_l4_slots() puts the domain's per-domain L3 in slot 260, and a
+     * PV domain may get that only with its first vCPU.
+     */
+    if ( !d->arch.perdomain_l3_pg )
+        return -EINVAL;
+
+    pl4e = map_domain_page(l4mfn);
+
     for ( i = page->nr_validated_ptes; i < L4_PAGETABLE_ENTRIES;
           i++, partial_flags = 0 )
     {
-- 
2.56.0


