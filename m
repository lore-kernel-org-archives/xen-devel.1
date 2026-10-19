Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6123606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=W+PqlqQp
Received: from list by lists.xenproject.org with outflank-mailman.1454856.1668524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItSN-0000KN-Uy; Mon, 19 Oct 2026 19:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454856.1668524; Mon, 19 Oct 2026 19:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItSM-0000Ez-A2; Mon, 19 Oct 2026 19:55:38 +0000
Received: by outflank-mailman (input) for mailman id 1454856;
 Mon, 19 Oct 2026 19:55:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItS9-00069w-Ox
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:55:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-000000022zc-3Ntj;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGs-00000001FjN-1xGS;
 Mon, 19 Oct 2026 19:43:46 +0000
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
	bh=SZ4nI3B+cfhVuPJjziTGQrpW0Hyptt7NpOiIzFtpX7o=; b=W+PqlqQpK+K3Lw7iJrW1j/i/j5
	QO+dlveS1cxCuWZyhrteNvtWuE79JLCnXXahUMQtT0RNOZA/zKjWsoQzTcKl7hnz4VU7HyHfqGfAI
	CrWEh1pFPLrtdmWHWk0NWHdx7r/hOJZKvaaqvJpygjgQ7jjVOkYL6wJv/F27eCH5ZtRI=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 29/30] x86/svm: allocate VMCBs from the domain heap behind the vCPU state window
Date: Mon, 19 Oct 2026 20:43:00 +0100
Message-ID: <20261019-asi-hvm-v4-29-b68b66652266@xenproject.org>
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

The VMCB holds the full guest register save area, but lives on the
xenheap, where it stays reachable from every context.  Move it to the
domain heap and map it at a fixed slot in the owning vCPU's state
window, so that under Address Space Isolation it is only mapped while
that vCPU's page tables are loaded.  Hardware is unaffected: VMRUN,
VMLOAD and VMSAVE address the VMCB physically, and vmcb_pa now derives
from the page rather than from virt_to_maddr() on a directmap VA.

A vCPU can have two VMCBs: the primary (nv_n1vmcx) and the nested L2
one (nv_n2vmcx).  Both move, taking the first two slots in the window
stride.  The nested code's swapping of svm->vmcb / svm->vmcb_pa
between the two works unchanged, now swapping between two window VAs.
free_vmcb() takes a VMCB out of the window with unmap_vcpu_state()
before freeing the page: without per-vCPU page tables the window is in
the domain-wide area, which outlives a vCPU whose creation fails.

The window VA is only valid in the owning vCPU's context.
svm_vmcb_map() and svm_vmcb_map_one() return it for v == current, and
a transient map_domain_page() mapping otherwise, which svm_vmcb_unmap()
drops with unmap_vcpu_state_page(), along with this CPU's translations
of it.  svm_ctxt_switch_to() no longer touches the VMCB, as it runs
before write_ptbase(); svm_ctxt_switch_from() keeps dereferencing the
window VA, as the outgoing page tables are still loaded at that point.

Runtime-tested under QEMU's SVM emulation with a PVH dom0 on two vCPUs,
with and without per-vCPU page-tables: VMCB allocation, VMRUN from the
window and context switches.  Nested SVM, save/restore, the 'v' debug
key and a guest using debug registers remain to be exercised.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v4:
- New in this version.
---
 xen/arch/x86/hvm/svm/nestedsvm.c |  8 +++---
 xen/arch/x86/hvm/svm/svm.c       | 10 ++++++++
 xen/arch/x86/hvm/svm/vmcb.c      | 43 ++++++++++++++++++++++----------
 xen/arch/x86/hvm/svm/vmcb.h      | 15 ++++++++---
 4 files changed, 56 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index dc853e5f1a..1599a9908d 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -71,10 +71,9 @@ int cf_check nsvm_vcpu_initialise(struct vcpu *v)
         goto err;
     memset(msrpm, 0x0, MSRPM_SIZE);
 
-    nv->nv_n2vmcx = alloc_vmcb();
+    nv->nv_n2vmcx = alloc_vmcb(v, VCPU_STATE_IDX_N2VMCB, &nv->nv_n2vmcx_pa);
     if ( nv->nv_n2vmcx == NULL )
         goto err;
-    nv->nv_n2vmcx_pa = virt_to_maddr(nv->nv_n2vmcx);
 
     return 0;
 
@@ -95,7 +94,10 @@ void cf_check nsvm_vcpu_destroy(struct vcpu *v)
      * of l1 vmcb page.
      */
     if ( nv->nv_n1vmcx )
+    {
         v->arch.hvm.svm.vmcb = nv->nv_n1vmcx;
+        v->arch.hvm.svm.vmcb_pa = nv->nv_n1vmcx_pa;
+    }
 
     if ( svm->ns_cached_msrpm )
     {
@@ -113,7 +115,7 @@ void cf_check nsvm_vcpu_destroy(struct vcpu *v)
 
     if ( nv->nv_n2vmcx )
     {
-        free_vmcb(nv->nv_n2vmcx);
+        free_vmcb(v, VCPU_STATE_IDX_N2VMCB, nv->nv_n2vmcx_pa);
         nv->nv_n2vmcx = NULL;
         nv->nv_n2vmcx_pa = INVALID_PADDR;
     }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 3de8da7ea3..6cb3ff4258 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -265,6 +265,10 @@ static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
 
 static void svm_save_dr(struct vcpu *v)
 {
+    /*
+     * @v is the outgoing vCPU, whose page tables are still loaded: the
+     * VMCB's window VA serves, although current has moved on.
+     */
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int flag_dr_dirty = v->arch.hvm.flag_dr_dirty;
 
@@ -942,6 +946,12 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 {
     int cpu = smp_processor_id();
 
+    /*
+     * NB we cannot access the VMCB here: this runs before
+     * write_ptbase(), so the incoming vCPU's state window is not
+     * reachable yet.
+     */
+
     /*
      * This is required, because VMRUN does consistency check and some of the
      * DOM0 selectors are pointing to invalid GDT locations, and cause AMD
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index f5321b03fb..4b398742a9 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -6,6 +6,7 @@
  *
  */
 
+#include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
@@ -23,30 +24,40 @@
 #include "svm.h"
 #include "vmcb.h"
 
-struct vmcb_struct *alloc_vmcb(void)
+struct vmcb_struct *alloc_vmcb(struct vcpu *v, unsigned int idx, paddr_t *pa)
 {
-    struct vmcb_struct *vmcb;
+    struct page_info *pg = alloc_domheap_page(v->domain, MEMF_no_owner);
+    mfn_t mfn;
+
+    ASSERT(idx < VCPU_STATE_NR_PAGES);
 
-    vmcb = alloc_xenheap_page();
-    if ( vmcb == NULL )
+    if ( pg == NULL )
     {
         printk(XENLOG_WARNING "Warning: failed to allocate vmcb.\n");
         return NULL;
     }
 
-    clear_page(vmcb);
-    return vmcb;
+    mfn = page_to_mfn(pg);
+    clear_domain_page(mfn);
+    populate_perdomain_mapping(v, VCPU_STATE_ADDR(v, idx), &mfn, 1,
+                               __PAGE_HYPERVISOR_RW);
+    *pa = mfn_to_maddr(mfn);
+
+    return (struct vmcb_struct *)VCPU_STATE_ADDR(v, idx);
 }
 
-void free_vmcb(struct vmcb_struct *vmcb)
+void free_vmcb(struct vcpu *v, unsigned int idx, paddr_t pa)
 {
-    free_xenheap_page(vmcb);
+    ASSERT(idx < VCPU_STATE_NR_PAGES);
+
+    unmap_vcpu_state(v, idx, 1);
+    free_domheap_page(maddr_to_page(pa));
 }
 
 struct vmcb_struct *svm_vmcb_map_one(const struct vcpu *v,
                                      struct vmcb_struct *va, paddr_t pa)
 {
-    return va;
+    return v == current ? va : map_domain_page(maddr_to_mfn(pa));
 }
 
 struct vmcb_struct *svm_vmcb_map(const struct vcpu *v)
@@ -56,6 +67,8 @@ struct vmcb_struct *svm_vmcb_map(const struct vcpu *v)
 
 void svm_vmcb_unmap(const struct vcpu *v, const struct vmcb_struct *vmcb)
 {
+    if ( v != current )
+        unmap_vcpu_state_page(vmcb);
 }
 
 /* This function can directly access fields which are covered by clean bits. */
@@ -219,26 +232,29 @@ int svm_create_vmcb(struct vcpu *v)
     int rc;
 
     if ( (nv->nv_n1vmcx == NULL) &&
-         (nv->nv_n1vmcx = alloc_vmcb()) == NULL )
+         (nv->nv_n1vmcx = alloc_vmcb(v, VCPU_STATE_IDX_VMCB,
+                                     &nv->nv_n1vmcx_pa)) == NULL )
     {
         printk("Failed to create a new VMCB\n");
         return -ENOMEM;
     }
 
     svm->vmcb = nv->nv_n1vmcx;
+    svm->vmcb_pa = nv->nv_n1vmcx_pa;
 
     vmcb = svm_vmcb_map(v);
     rc = construct_vmcb(v, vmcb);
     svm_vmcb_unmap(v, vmcb);
     if ( rc != 0 )
     {
-        free_vmcb(nv->nv_n1vmcx);
+        free_vmcb(v, VCPU_STATE_IDX_VMCB, nv->nv_n1vmcx_pa);
         nv->nv_n1vmcx = NULL;
+        nv->nv_n1vmcx_pa = INVALID_PADDR;
         svm->vmcb = NULL;
+        svm->vmcb_pa = INVALID_PADDR;
         return rc;
     }
 
-    svm->vmcb_pa = nv->nv_n1vmcx_pa = virt_to_maddr(svm->vmcb);
     return 0;
 }
 
@@ -248,7 +264,7 @@ void svm_destroy_vmcb(struct vcpu *v)
     struct svm_vcpu *svm = &v->arch.hvm.svm;
 
     if ( nv->nv_n1vmcx != NULL )
-        free_vmcb(nv->nv_n1vmcx);
+        free_vmcb(v, VCPU_STATE_IDX_VMCB, nv->nv_n1vmcx_pa);
 
     if ( svm->msrpm != NULL )
     {
@@ -260,6 +276,7 @@ void svm_destroy_vmcb(struct vcpu *v)
     nv->nv_n1vmcx = NULL;
     nv->nv_n1vmcx_pa = INVALID_PADDR;
     svm->vmcb = NULL;
+    svm->vmcb_pa = INVALID_PADDR;
 }
 
 static void svm_dump_sel(const char *name, const struct segment_register *s)
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 9d61767ec7..d899beb46e 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -556,12 +556,19 @@ struct vmcb_struct {
     uint64_t res18[291];
 };
 
-struct vmcb_struct *alloc_vmcb(void);
-void free_vmcb(struct vmcb_struct *vmcb);
+/*
+ * VMCBs are domain-heap pages: hardware addresses them physically, and
+ * Xen maps each one at a fixed slot in the owning vCPU's state window,
+ * so the returned virtual address is valid only in that vCPU's context.
+ * @idx is the VCPU_STATE_IDX_* slot to place the mapping in.
+ */
+struct vmcb_struct *alloc_vmcb(struct vcpu *v, unsigned int idx, paddr_t *pa);
+void free_vmcb(struct vcpu *v, unsigned int idx, paddr_t pa);
 
 /*
- * Access a VMCB of a vCPU that may not be current.  svm_vmcb_map() takes
- * the active VMCB, svm_vmcb_map_one() a specific one.
+ * Access a VMCB of a vCPU that may not be current: the window VA for
+ * current, a transient mapping otherwise.  svm_vmcb_map() takes the active
+ * VMCB, svm_vmcb_map_one() a specific one.
  */
 struct vmcb_struct *svm_vmcb_map_one(const struct vcpu *v,
                                      struct vmcb_struct *va, paddr_t pa);
-- 
2.55.0


