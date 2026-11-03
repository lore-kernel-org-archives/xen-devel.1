Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED7F606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=rRG6C2ZL
Received: from list by lists.xenproject.org with outflank-mailman.1470718.1679380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONnp-000423-Uu; Tue, 03 Nov 2026 23:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470718.1679380; Tue, 03 Nov 2026 23:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONnp-00041h-O5; Tue, 03 Nov 2026 23:20:29 +0000
Received: by outflank-mailman (input) for mailman id 1470718;
 Tue, 03 Nov 2026 23:20:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONno-0003YQ-4G
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:20:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONnn-0000000Cog2-2oTn;
 Tue, 03 Nov 2026 23:20:27 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONnn-0000000EMFa-2ElZ;
 Tue, 03 Nov 2026 23:20:27 +0000
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
	bh=SDb1ZxgXV65R0hZws53PbRDvNFXyUOAfc8HwZa5MEvU=; b=rRG6C2ZLVRCc123dGWHhe/NrTD
	xjKc8krAbf/HysLL8U/tZlG9RpnYBxdTARxYTQq5GBaLrcbNdWcZBr5Z9RAJC2kws3NBf9pUlH7BC
	w/msqzI4mS1BQj8/ImQ0fnQODZ1Q5HD0hubX/pnfRYcZSUMhTSWIRzLof4BzDsN68vkk=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v6 07/44] x86/mm: have init_xen_l4_slots() take a vCPU in place of the domain
Date: Tue,  3 Nov 2026 17:13:29 -0500
Message-ID: <20261103-asi-hvm-v6-7-59dbc5ce9615@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A later change gives the vCPUs of some domains per-domain areas of
their own, and slot 260 of a table private to one vCPU must then hold
that vCPU's L3.  Eventually, all guest types may be able to support
either per-domain L3s or per-vCPU L3s.

HVM domains always have one root page table per vCPU; this does not
change.  So init_xen_l4_slots() needs the appropriate L3 at vCPU
creation, either the domain-wide L3 or the per-vCPU L3.

PV domains with a domain-wide L3 should behave as now: the Xen slots
of guest root pagetables need the domain-wide L3 installed.  But PV
guests with per-vCPU page tables can never run directly on guest
pagetables; they will always need some separate page table, which can
be initialized with the per-vCPU L3.

So, create two versions of init_xen_l4_slots(). The first is used in
contexts where we may be initializing a non-guest root, and must have
a vCPU L3 if per-vCPU L3s are in use; this takes a vCPU as an
argument.  The second is used for roots that all of a domain's vCPUs
share (a PV guest's own L4s, and their shadows), which only need an
L3 if domain-wide L3s are in use; this takes a domain as an argument.

Both wrap an internal function, which takes a domain and an L3
pointer, and leaves the slot empty if this pointer is NULL.  At the
moment, both always pass on the domain-wide L3, but in the future this
will change if the guest is using per-vCPU pagetables.

Otherwise no functional change: slot 260 still gets the domain's
per-domain L3.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v6:
- Add init_xen_l4_slots_pv() form, which only takes a domain as an
  argument; promote_l4_table(), the PV dom0 builder and the shadows of
  PV guests' L4s use it, so promote_l4_table() no longer needs vCPU 0.

Changes in v5:
- promote_l4_table() checks for vCPU 0 itself, now that "x86/mm: refuse
  to promote an L4 while the domain has no per-domain L3" tests for the
  L3 instead.

Changes in v4:
- New in this version, split out of "x86/hvm: introduce per-vCPU L3
  page-table": init_xen_l4_slots() takes a vCPU in place of the domain
  (Roger, Jan).
- Reflow promote_l4_table()'s call to init_xen_l4_slots() (Jan).
---
 xen/arch/x86/include/asm/mm.h  |  4 +++-
 xen/arch/x86/mm.c              | 35 +++++++++++++++++++++++++++++-----
 xen/arch/x86/mm/hap/hap.c      |  2 +-
 xen/arch/x86/mm/shadow/hvm.c   |  2 +-
 xen/arch/x86/mm/shadow/multi.c |  5 +++--
 xen/arch/x86/pv/dom0_build.c   |  4 ++--
 xen/arch/x86/pv/domain.c       |  2 +-
 7 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index e85a6db203..0d2cecf1c7 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -370,7 +370,9 @@ int devalidate_page(struct page_info *page, unsigned long type,
 
 void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d);
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
-                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt);
+                       const struct vcpu *v, mfn_t sl4mfn, bool ro_mpt);
+void init_xen_l4_slots_pv(l4_pgentry_t *l4t, mfn_t l4mfn,
+                          const struct domain *d, mfn_t sl4mfn, bool ro_mpt);
 bool fill_ro_mpt(mfn_t mfn);
 void zap_ro_mpt(mfn_t mfn);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 61bd4aa02a..10106d9f03 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1693,8 +1693,10 @@ static int promote_l3_table(struct page_info *page)
  * appropriate slots.  Pagetables not shared with guests will gain the
  * extended directmap.
  */
-void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
-                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt)
+static void _init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
+                               const struct domain *d,
+                               const struct page_info *l3_pg,
+                               mfn_t sl4mfn, bool ro_mpt)
 {
     /*
      * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
@@ -1723,7 +1725,7 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
 
     /* Slot 260: Per-domain mappings. */
     l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =
-        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
+        l3_pg ? l4e_from_page(l3_pg, __PAGE_HYPERVISOR_RW) : l4e_empty();
 
     /* Slot 4: Per-domain mappings mirror. */
     BUILD_BUG_ON(IS_ENABLED(CONFIG_PV32) &&
@@ -1770,6 +1772,29 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
     }
 }
 
+/*
+ * v is the vCPU the table is private to.  For shared root pagetables, use
+ * init_xen_l4_slots_pv().
+ */
+void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
+                       const struct vcpu *v, mfn_t sl4mfn, bool ro_mpt)
+{
+    const struct domain *d = v->domain;
+
+    _init_xen_l4_slots(l4t, l4mfn, d, d->arch.perdomain_l3_pg, sl4mfn, ro_mpt);
+}
+
+/*
+ * This is a version of init_xen_l4_slots for shared root pagetables;
+ * it only propagates domain-wide perdomain L3s, and so only needs a
+ * domain pointer.
+ */
+void init_xen_l4_slots_pv(l4_pgentry_t *l4t, mfn_t l4mfn,
+                          const struct domain *d, mfn_t sl4mfn, bool ro_mpt)
+{
+    _init_xen_l4_slots(l4t, l4mfn, d, d->arch.perdomain_l3_pg, sl4mfn, ro_mpt);
+}
+
 bool fill_ro_mpt(mfn_t mfn)
 {
     l4_pgentry_t *l4tab = map_domain_page(mfn);
@@ -1878,8 +1903,8 @@ static int promote_l4_table(struct page_info *page)
 
     if ( !rc )
     {
-        init_xen_l4_slots(pl4e, l4mfn,
-                          d, INVALID_MFN, VM_ASSIST(d, m2p_strict));
+        init_xen_l4_slots_pv(pl4e, l4mfn, d, INVALID_MFN,
+                             VM_ASSIST(d, m2p_strict));
         atomic_inc(&d->arch.pv.nr_l4_pages);
     }
     unmap_domain_page(pl4e);
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 0ede4181a0..aba4f77df9 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -407,7 +407,7 @@ static mfn_t hap_make_monitor_table(struct vcpu *v)
     m4mfn = page_to_mfn(pg);
     l4e = map_domain_page(m4mfn);
 
-    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
+    init_xen_l4_slots(l4e, m4mfn, v, INVALID_MFN, false);
     unmap_domain_page(l4e);
 
     return m4mfn;
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index e6fb97c4b6..0b23326214 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -760,7 +760,7 @@ mfn_t sh_make_monitor_table(const struct vcpu *v, unsigned int shadow_levels)
      * shadow-linear mapping will either be inserted below when creating
      * lower level monitor tables, or later in sh_update_cr3().
      */
-    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
+    init_xen_l4_slots(l4e, m4mfn, v, INVALID_MFN, false);
 
     if ( shadow_levels < 4 )
     {
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 7f72b4b7b2..1831091b95 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -974,8 +974,9 @@ sh_make_shadow(struct vcpu *v, mfn_t gmfn, u32 shadow_type)
 
             BUILD_BUG_ON(sizeof(l4_pgentry_t) != sizeof(shadow_l4e_t));
 
-            init_xen_l4_slots(l4t, gmfn, d, smfn, (!is_pv_32bit_domain(d) &&
-                                                   VM_ASSIST(d, m2p_strict)));
+            init_xen_l4_slots_pv(l4t, gmfn, d, smfn,
+                                 (!is_pv_32bit_domain(d) &&
+                                  VM_ASSIST(d, m2p_strict)));
             unmap_domain_page(l4t);
         }
         break;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 24f2fa0b7f..dd64af5616 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -724,8 +724,8 @@ static int __init dom0_construct(const struct boot_domain *bd)
         maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l4_page_table;
         l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
         clear_page(l4tab);
-        init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
-                          d, INVALID_MFN, true);
+        init_xen_l4_slots_pv(l4tab, _mfn(virt_to_mfn(l4start)),
+                             d, INVALID_MFN, true);
         v->arch.guest_table = pagetable_from_paddr(__pa(l4start));
     }
     else
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index f3c711b85b..f139d8f83c 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -127,7 +127,7 @@ static int setup_compat_l4(struct vcpu *v)
     mfn = page_to_mfn(pg);
     l4tab = map_domain_page(mfn);
     clear_page(l4tab);
-    init_xen_l4_slots(l4tab, mfn, v->domain, INVALID_MFN, false);
+    init_xen_l4_slots(l4tab, mfn, v, INVALID_MFN, false);
     unmap_domain_page(l4tab);
 
     /* This page needs to look like a pagetable so that it can be shadowed */
-- 
2.56.0


