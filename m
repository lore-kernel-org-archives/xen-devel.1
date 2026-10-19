Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBC2606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=63LyVTQD
Received: from list by lists.xenproject.org with outflank-mailman.1454770.1668329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItGb-00077m-N3; Mon, 19 Oct 2026 19:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454770.1668329; Mon, 19 Oct 2026 19:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItGb-00077P-Fd; Mon, 19 Oct 2026 19:43:29 +0000
Received: by outflank-mailman (input) for mailman id 1454770;
 Mon, 19 Oct 2026 19:43:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItGa-00075p-Uj
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:43:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGV-000000022kX-3WZT;
 Mon, 19 Oct 2026 19:43:23 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGV-00000001FjN-2Sl0;
 Mon, 19 Oct 2026 19:43:23 +0000
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
	bh=gqNXY0Fy96nvsg760epSXdia2CmgV3Q0H0of+zL6Uo8=; b=63LyVTQDDFyWxylg9QAQV+60RR
	TRY0KrUZ9LOs/OHxzML/8JqcEplHlg58VVMmb3npyb5+EEkvMQfHoj/tL3fPaCP5Qxua+Nz4rTzaB
	Hded2vk533sm+6IYu68eAeMFdcyruOXYscOFW97uCChL2xcm87zyS2OJ5O/N2sMdqgtE=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v4 08/30] x86/mm: have init_xen_l4_slots() take a vCPU in place of the domain
Date: Mon, 19 Oct 2026 20:42:39 +0100
Message-ID: <20261019-asi-hvm-v4-8-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A later change gives the vCPUs of some domains per-domain areas of their
own, and slot 260 of a table private to one vCPU must then hold that
vCPU's L3.  init_xen_l4_slots(), which fills slot 260, needs the vCPU
for that.

Have it take a vCPU in place of the domain.  A table private to one vCPU
passes that vCPU; tables the domain's vCPUs share -- promoted PV guest
L4s, PV shadow L4s, and the PV dom0 L4 under construction -- pass any of
them.  promote_l4_table() passes vCPU 0, whose existence it already
checks, and its call is reflowed.

No functional change: slot 260 still gets the domain's per-domain L3.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v4:
- New in this version, split out of "x86/hvm: introduce per-vCPU L3
  page-table": init_xen_l4_slots() takes a vCPU in place of the domain
  (Roger, Jan).
- Reflow promote_l4_table()'s call to init_xen_l4_slots() (Jan).
---
 xen/arch/x86/include/asm/mm.h  |  2 +-
 xen/arch/x86/mm.c              | 16 +++++++++++-----
 xen/arch/x86/mm/hap/hap.c      |  2 +-
 xen/arch/x86/mm/shadow/hvm.c   |  2 +-
 xen/arch/x86/mm/shadow/multi.c |  2 +-
 xen/arch/x86/pv/dom0_build.c   |  2 +-
 xen/arch/x86/pv/domain.c       |  2 +-
 7 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index c9085214fd..de45a111f3 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -370,7 +370,7 @@ int devalidate_page(struct page_info *page, unsigned long type,
 
 void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d);
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
-                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt);
+                       const struct vcpu *v, mfn_t sl4mfn, bool ro_mpt);
 bool fill_ro_mpt(mfn_t mfn);
 void zap_ro_mpt(mfn_t mfn);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index c6bd53354b..ac074cc62d 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1687,14 +1687,18 @@ static int promote_l3_table(struct page_info *page)
  * This function must write all ROOT_PAGETABLE_PV_XEN_SLOTS, to clobber any
  * values a guest may have left there from promote_l4_table().
  *
- * l4t, l4mfn, and d are mandatory, but l4mfn doesn't need to be the mfn under
+ * l4t, l4mfn, and v are mandatory, but l4mfn doesn't need to be the mfn under
  * *l4t.  All other parameters are optional and will either fill or zero the
  * appropriate slots.  Pagetables not shared with guests will gain the
  * extended directmap.
+ *
+ * v is the vCPU the table is private to or, for a table the domain's vCPUs
+ * share, any of them.
  */
 void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
-                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt)
+                       const struct vcpu *v, mfn_t sl4mfn, bool ro_mpt)
 {
+    const struct domain *d = v->domain;
     /*
      * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
      * directmap.
@@ -1797,6 +1801,8 @@ void zap_ro_mpt(mfn_t mfn)
 static int promote_l4_table(struct page_info *page)
 {
     struct domain *d = page_get_owner(page);
+    /* Any vCPU will do: a PV domain's vCPUs all use the domain-wide L3. */
+    const struct vcpu *v = domain_vcpu(d, 0);
     mfn_t          l4mfn = page_to_mfn(page);
     l4_pgentry_t  *pl4e;
     unsigned int   i;
@@ -1808,7 +1814,7 @@ static int promote_l4_table(struct page_info *page)
      * PV domain may get that only with its first vCPU.  The domain has no
      * vCPUs before XEN_DOMCTL_max_vcpus.
      */
-    if ( !domain_vcpu(d, 0) )
+    if ( !v )
         return -EINVAL;
 
     pl4e = map_domain_page(l4mfn);
@@ -1887,8 +1893,8 @@ static int promote_l4_table(struct page_info *page)
 
     if ( !rc )
     {
-        init_xen_l4_slots(pl4e, l4mfn,
-                          d, INVALID_MFN, VM_ASSIST(d, m2p_strict));
+        init_xen_l4_slots(pl4e, l4mfn, v, INVALID_MFN,
+                          VM_ASSIST(d, m2p_strict));
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
index 7f72b4b7b2..ebbf4a12ce 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -974,7 +974,7 @@ sh_make_shadow(struct vcpu *v, mfn_t gmfn, u32 shadow_type)
 
             BUILD_BUG_ON(sizeof(l4_pgentry_t) != sizeof(shadow_l4e_t));
 
-            init_xen_l4_slots(l4t, gmfn, d, smfn, (!is_pv_32bit_domain(d) &&
+            init_xen_l4_slots(l4t, gmfn, v, smfn, (!is_pv_32bit_domain(d) &&
                                                    VM_ASSIST(d, m2p_strict)));
             unmap_domain_page(l4t);
         }
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 24f2fa0b7f..dcb1d407ec 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -725,7 +725,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
         l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
         clear_page(l4tab);
         init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
-                          d, INVALID_MFN, true);
+                          v, INVALID_MFN, true);
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
2.55.0


