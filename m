Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F77F606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=ePeXpb1M
Received: from list by lists.xenproject.org with outflank-mailman.1470798.1679469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxi-0001o1-Kz; Tue, 03 Nov 2026 23:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470798.1679469; Tue, 03 Nov 2026 23:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxh-0001kt-TS; Tue, 03 Nov 2026 23:30:41 +0000
Received: by outflank-mailman (input) for mailman id 1470798;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000cv-3D
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONxb-0000000Cots-3qoi;
 Tue, 03 Nov 2026 23:30:35 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONo3-0000000EMFa-3OLA;
 Tue, 03 Nov 2026 23:20:43 +0000
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
	bh=LIuKm5SuhINw4v3U+2tzQzALxjgkASc2Xl749bMONok=; b=ePeXpb1Mh7jUMF3PfGRZTYMZZM
	bkbxwnP++45FDS7zVDwtzdsw9mDdhLoY0jiznArR1b3LzG6KCMV4Cf901E0dJy9pbnbk3w6fa+RSG
	H55VCMcyJfK0v1FNpM6AWsA/lZMJjbw5xcSks0BPiWk8puBsYV+jqbvm0rcUBW7RkNIQ=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 26/44] x86/svm: introduce SVM_MAP_VMCB() and SVM_UNMAP_VMCB()
Date: Tue,  3 Nov 2026 17:13:48 -0500
Message-ID: <20261103-asi-hvm-v6-26-59dbc5ce9615@xenproject.org>
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

Some accessors of a vCPU's VMCB can run with that vCPU paused, from
another vCPU's context: context save/load, the segment and CPL getters,
PAT/TSC/intercept updates reachable from toolstack operations, vm_event,
the 'v' debug key, and construct_vmcb() itself, which runs before the
vCPU ever entered guest context.  svm_nested_features_on_efer_update()
is among them: it is reachable remotely via hvm_load_cpu_ctxt() ->
svm_update_guest_efer().

Route them through the new SVM_MAP_VMCB() and SVM_UNMAP_VMCB();
construct_vmcb() takes the VMCB from its caller.  svm_set_tsc_offset()
needs both VMCBs rather than just the active one, so it maps them
individually via SVM_MAP_VMCB_ONE().  A vCPU stays in nested guest mode
across a deschedule or a pause, so this path can run remotely with the
L2 VMCB active; guest mode does not imply v == current.  Hot vmexit-path
accesses all have v == current and keep dereferencing svm->vmcb
directly.

SVM_MAP_VMCB(), SVM_MAP_VMCB_ONE() and SVM_UNMAP_VMCB() are macros over
svm_vmcb_map(), svm_vmcb_map_one() and svm_vmcb_unmap(), so that
SVM_UNMAP_VMCB() can clear the caller's pointer, as
VCPU_UNMAP_XSAVE_AREA() does.

No functional change: the helpers return the VMCB's existing address.
They prepare for moving VMCBs off always-mapped memory, where a VMCB's
mapping is valid only in its own vCPU's context.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

Changes in v5:
- Map and unmap through SVM_MAP_VMCB(), SVM_MAP_VMCB_ONE() and
  SVM_UNMAP_VMCB(), which clears the pointer (George).
- Retitle (was: "x86/svm: introduce svm_vmcb_map() and
  svm_vmcb_unmap()").

Changes in v4:
- New in this version.
---
 xen/arch/x86/hvm/svm/nestedsvm.c |   4 +-
 xen/arch/x86/hvm/svm/svm.c       | 133 +++++++++++++++++++++++--------
 xen/arch/x86/hvm/svm/vmcb.c      |  29 ++++++-
 xen/arch/x86/hvm/svm/vmcb.h      |  18 +++++
 4 files changed, 145 insertions(+), 39 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 128008321d..f5ce3e485c 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1528,7 +1528,7 @@ void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v)
  */
 void svm_nested_features_on_efer_update(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     u32 general2_intercepts;
     vintr_t vintr;
@@ -1585,6 +1585,8 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
             vmcb_set_general2_intercepts(vmcb, general2_intercepts);
         }
     }
+
+    SVM_UNMAP_VMCB(v, vmcb);
 }
 
 void __init start_nested_svm(struct hvm_function_table *hvm_function_table)
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 1628c5e0ae..b539406f0c 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -107,7 +107,7 @@ static void cf_check svm_cpu_down(void)
 static void cf_check svm_update_guest_cr(
     struct vcpu *v, unsigned int cr, unsigned int flags)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
     uint64_t value;
 
     switch ( cr )
@@ -173,11 +173,13 @@ static void cf_check svm_update_guest_cr(
     default:
         BUG();
     }
+
+    SVM_UNMAP_VMCB(v, vmcb);
 }
 
 static void cf_check svm_update_guest_efer(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
     unsigned long guest_efer = v->arch.hvm.guest_efer,
         xen_efer = read_efer();
 
@@ -204,6 +206,7 @@ static void cf_check svm_update_guest_efer(struct vcpu *v)
     guest_efer |= EFER_SVME;
 
     vmcb_set_efer(vmcb, guest_efer);
+    SVM_UNMAP_VMCB(v, vmcb);
 
     ASSERT(nestedhvm_enabled(v->domain) ||
            !nsvm_efer_svm_enabled(v));
@@ -352,7 +355,7 @@ static void svm_restore_dr(struct vcpu *v)
 
 static int svm_vmcb_save(struct vcpu *v, struct hvm_hw_cpu *c)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
 
     if ( vmcb->event_inj.v &&
          hvm_event_needs_reinjection(vmcb->event_inj.type,
@@ -362,13 +365,15 @@ static int svm_vmcb_save(struct vcpu *v, struct hvm_hw_cpu *c)
         c->error_code = vmcb->event_inj.ec;
     }
 
+    SVM_UNMAP_VMCB(v, vmcb);
+
     return 1;
 }
 
 static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
 {
     struct page_info *page = NULL;
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb;
     struct p2m_domain *p2m = p2m_get_hostp2m(v->domain);
 
     if ( c->pending_valid )
@@ -417,6 +422,8 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
     svm_update_guest_cr(v, 0, 0);
     svm_update_guest_cr(v, 4, 0);
 
+    vmcb = SVM_MAP_VMCB(v);
+
     if ( !paging_mode_shadow(v->domain) )
     {
         vmcb_set_np(vmcb, true);
@@ -436,6 +443,8 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
         vmcb->event_inj.raw = 0;
 
     vmcb->cleanbits.raw = 0;
+    SVM_UNMAP_VMCB(v, vmcb);
+
     paging_update_paging_modes(v);
 
     return 0;
@@ -443,7 +452,7 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
 
 static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    const struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
 
     data->sysenter_cs      = vmcb->sysenter_cs;
     data->sysenter_esp     = vmcb->sysenter_esp;
@@ -453,11 +462,13 @@ static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
     data->msr_star         = vmcb->star;
     data->msr_cstar        = vmcb->cstar;
     data->msr_syscall_mask = vmcb->sfmask;
+
+    SVM_UNMAP_VMCB(v, vmcb);
 }
 
 static void svm_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
 
     vmcb->lstar        = data->msr_lstar;
     vmcb->star         = data->msr_star;
@@ -467,6 +478,9 @@ static void svm_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
     vmcb->sysenter_cs  = data->sysenter_cs;
     vmcb->sysenter_esp = data->sysenter_esp;
     vmcb->sysenter_eip = data->sysenter_eip;
+
+    SVM_UNMAP_VMCB(v, vmcb);
+
     v->arch.hvm.guest_efer = data->msr_efer;
     svm_update_guest_efer(v);
 }
@@ -492,7 +506,7 @@ static int cf_check svm_load_vmcb_ctxt(struct vcpu *v, struct hvm_hw_cpu *ctxt)
 
 static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
     unsigned int intr_shadow = 0;
 
     if ( vmcb->int_stat.intr_shadow )
@@ -503,13 +517,15 @@ static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
          : (vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET) )
         intr_shadow |= HVM_INTR_SHADOW_NMI;
 
+    SVM_UNMAP_VMCB(v, vmcb);
+
     return intr_shadow;
 }
 
 static void cf_check svm_set_interrupt_shadow(
     struct vcpu *v, unsigned int intr_shadow)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
     bool block_nmi = intr_shadow & HVM_INTR_SHADOW_NMI;
 
     vmcb->int_stat.intr_shadow =
@@ -527,10 +543,13 @@ static void cf_check svm_set_interrupt_shadow(
 
         vmcb_set_general1_intercepts(vmcb, gen1);
     }
+
+    SVM_UNMAP_VMCB(v, vmcb);
 }
 
 static int cf_check svm_guest_x86_mode(struct vcpu *v)
 {
+    /* Current only (see guest_cpu_user_regs() below): no mapping needed. */
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( unlikely(!(v->arch.hvm.guest_cr[0] & X86_CR0_PE)) )
@@ -544,8 +563,7 @@ static int cf_check svm_guest_x86_mode(struct vcpu *v)
 
 static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
 {
-    struct svm_vcpu *svm = &v->arch.hvm.svm;
-    struct vmcb_struct *vmcb = svm->vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
     const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     u32 bitmap = vmcb_get_exception_intercepts(vmcb);
 
@@ -555,6 +573,7 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
         bitmap &= ~(1U << X86_EXC_UD);
 
     vmcb_set_exception_intercepts(vmcb, bitmap);
+    SVM_UNMAP_VMCB(v, vmcb);
 
     /* Give access to MSR_SPEC_CTRL if the guest has been told about it. */
     svm_intercept_msr(v, MSR_SPEC_CTRL,
@@ -598,13 +617,18 @@ void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state)
 
 static unsigned int cf_check svm_get_cpl(struct vcpu *v)
 {
-    return vmcb_get_cpl(v->arch.hvm.svm.vmcb);
+    const struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
+    unsigned int cpl = vmcb_get_cpl(vmcb);
+
+    SVM_UNMAP_VMCB(v, vmcb);
+
+    return cpl;
 }
 
 static void cf_check svm_get_segment_register(
     struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
 
     ASSERT((v == current) || !vcpu_runnable(v));
 
@@ -645,12 +669,14 @@ static void cf_check svm_get_segment_register(
         *reg = (struct segment_register){};
         break;
     }
+
+    SVM_UNMAP_VMCB(v, vmcb);
 }
 
 static void cf_check svm_set_segment_register(
     struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
 
     ASSERT((v == current) || !vcpu_runnable(v));
 
@@ -679,6 +705,7 @@ static void cf_check svm_set_segment_register(
     default:
         ASSERT_UNREACHABLE();
         domain_crash(v->domain);
+        SVM_UNMAP_VMCB(v, vmcb);
         return;
     }
 
@@ -716,33 +743,41 @@ static void cf_check svm_set_segment_register(
         ASSERT_UNREACHABLE();
         break;
     }
+
+    SVM_UNMAP_VMCB(v, vmcb);
 }
 
 static int cf_check svm_set_guest_pat(struct vcpu *v, u64 gpat)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb;
 
     if ( paging_mode_shadow(v->domain) )
         return 0;
 
+    vmcb = SVM_MAP_VMCB(v);
     vmcb_set_g_pat(vmcb, gpat);
+    SVM_UNMAP_VMCB(v, vmcb);
+
     return 1;
 }
 
 static int cf_check svm_get_guest_pat(struct vcpu *v, u64 *gpat)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    const struct vmcb_struct *vmcb;
 
     if ( paging_mode_shadow(v->domain) )
         return 0;
 
+    vmcb = SVM_MAP_VMCB(v);
     *gpat = vmcb_get_g_pat(vmcb);
+    SVM_UNMAP_VMCB(v, vmcb);
+
     return 1;
 }
 
 static void cf_check svm_set_tsc_offset(struct vcpu *v, uint64_t offset)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
     struct vmcb_struct *n1vmcb, *n2vmcb;
     uint64_t n2_tsc_offset = 0;
     struct domain *d = v->domain;
@@ -750,25 +785,36 @@ static void cf_check svm_set_tsc_offset(struct vcpu *v, uint64_t offset)
     if ( !nestedhvm_enabled(d) )
     {
         vmcb_set_tsc_offset(vmcb, offset);
+        SVM_UNMAP_VMCB(v, vmcb);
         return;
     }
 
-    n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-    n2vmcb = vcpu_nestedhvm(v).nv_n2vmcx;
-
+    /*
+     * A vCPU stays in nested guest mode across a deschedule or a pause, so
+     * this can run remotely with the L2 VMCB active: map both explicitly.
+     */
     if ( nestedhvm_vcpu_in_guestmode(v) )
     {
+        const struct nestedvcpu *nv = &vcpu_nestedhvm(v);
+
+        n1vmcb = SVM_MAP_VMCB_ONE(v, nv->nv_n1vmcx, nv->nv_n1vmcx_pa);
+        n2vmcb = SVM_MAP_VMCB_ONE(v, nv->nv_n2vmcx, nv->nv_n2vmcx_pa);
+
         n2_tsc_offset = vmcb_get_tsc_offset(n2vmcb) -
                         vmcb_get_tsc_offset(n1vmcb);
         vmcb_set_tsc_offset(n1vmcb, offset);
+
+        SVM_UNMAP_VMCB(v, n2vmcb);
+        SVM_UNMAP_VMCB(v, n1vmcb);
     }
 
     vmcb_set_tsc_offset(vmcb, offset + n2_tsc_offset);
+    SVM_UNMAP_VMCB(v, vmcb);
 }
 
 static void cf_check svm_set_rdtsc_exiting(struct vcpu *v, bool enable)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
     u32 general2_intercepts = vmcb_get_general2_intercepts(vmcb);
 
@@ -783,13 +829,14 @@ static void cf_check svm_set_rdtsc_exiting(struct vcpu *v, bool enable)
 
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
     vmcb_set_general2_intercepts(vmcb, general2_intercepts);
+    SVM_UNMAP_VMCB(v, vmcb);
 }
 
 #ifdef CONFIG_VM_EVENT
 static void cf_check svm_set_descriptor_access_exiting(
     struct vcpu *v, bool enable)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
     u32 mask = GENERAL1_INTERCEPT_IDTR_READ | GENERAL1_INTERCEPT_GDTR_READ
             | GENERAL1_INTERCEPT_LDTR_READ | GENERAL1_INTERCEPT_TR_READ
@@ -802,6 +849,7 @@ static void cf_check svm_set_descriptor_access_exiting(
         general1_intercepts &= ~mask;
 
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
+    SVM_UNMAP_VMCB(v, vmcb);
 }
 #endif /* CONFIG_VM_EVENT */
 
@@ -1360,7 +1408,12 @@ static void cf_check svm_inject_event(const struct x86_event *event)
 
 static bool cf_check svm_event_pending(const struct vcpu *v)
 {
-    return v->arch.hvm.svm.vmcb->event_inj.v;
+    const struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
+    bool pending = vmcb->event_inj.v;
+
+    SVM_UNMAP_VMCB(v, vmcb);
+
+    return pending;
 }
 
 static void cf_check svm_cpu_dead(unsigned int cpu)
@@ -2318,45 +2371,55 @@ static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
 static bool cf_check svm_get_pending_event(
     struct vcpu *v, struct x86_event *info)
 {
-    const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    const struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
+    bool pending = vmcb->event_inj.v;
 
-    if ( !vmcb->event_inj.v )
-        return false;
+    if ( pending )
+    {
+        info->vector = vmcb->event_inj.vector;
+        info->type = vmcb->event_inj.type;
+        info->error_code = vmcb->event_inj.ec;
+    }
 
-    info->vector = vmcb->event_inj.vector;
-    info->type = vmcb->event_inj.type;
-    info->error_code = vmcb->event_inj.ec;
+    SVM_UNMAP_VMCB(v, vmcb);
 
-    return true;
+    return pending;
 }
 
 static uint64_t cf_check svm_get_reg(struct vcpu *v, unsigned int reg)
 {
     struct vcpu *curr = current;
-    const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    const struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
     struct domain *d = v->domain;
+    uint64_t val = 0;
 
     switch ( reg )
     {
     case MSR_SPEC_CTRL:
-        return vmcb->spec_ctrl;
+        val = vmcb->spec_ctrl;
+        break;
 
     case MSR_SHADOW_GS_BASE:
         if ( v == curr )
             svm_sync_vmcb(v, vmcb_in_sync);
-        return vmcb->kerngsbase;
+        val = vmcb->kerngsbase;
+        break;
 
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
                __func__, v, reg);
         domain_crash(d);
-        return 0;
+        break;
     }
+
+    SVM_UNMAP_VMCB(v, vmcb);
+
+    return val;
 }
 
 static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *vmcb = SVM_MAP_VMCB(v);
     struct domain *d = v->domain;
 
     switch ( reg )
@@ -2371,6 +2434,8 @@ static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
         domain_crash(d);
         break;
     }
+
+    SVM_UNMAP_VMCB(v, vmcb);
 }
 
 static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index a6f09672a7..5e193be9cd 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -43,11 +43,25 @@ void free_vmcb(struct vmcb_struct *vmcb)
     free_xenheap_page(vmcb);
 }
 
+struct vmcb_struct *svm_vmcb_map_one(const struct vcpu *v,
+                                     struct vmcb_struct *va, paddr_t pa)
+{
+    return va;
+}
+
+struct vmcb_struct *svm_vmcb_map(const struct vcpu *v)
+{
+    return svm_vmcb_map_one(v, v->arch.hvm.svm.vmcb, v->arch.hvm.svm.vmcb_pa);
+}
+
+void svm_vmcb_unmap(const struct vcpu *v, const struct vmcb_struct *vmcb)
+{
+}
+
 /* This function can directly access fields which are covered by clean bits. */
-static int construct_vmcb(struct vcpu *v)
+static int construct_vmcb(struct vcpu *v, struct vmcb_struct *vmcb)
 {
     struct svm_vcpu *svm = &v->arch.hvm.svm;
-    struct vmcb_struct *vmcb = svm->vmcb;
 
     vmcb->_general1_intercepts =
         GENERAL1_INTERCEPT_INTR        | GENERAL1_INTERCEPT_NMI         |
@@ -201,6 +215,7 @@ int svm_create_vmcb(struct vcpu *v)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct svm_vcpu *svm = &v->arch.hvm.svm;
+    struct vmcb_struct *vmcb;
     int rc;
 
     if ( (nv->nv_n1vmcx == NULL) &&
@@ -211,7 +226,10 @@ int svm_create_vmcb(struct vcpu *v)
     }
 
     svm->vmcb = nv->nv_n1vmcx;
-    rc = construct_vmcb(v);
+
+    vmcb = SVM_MAP_VMCB(v);
+    rc = construct_vmcb(v, vmcb);
+    SVM_UNMAP_VMCB(v, vmcb);
     if ( rc != 0 )
     {
         free_vmcb(nv->nv_n1vmcx);
@@ -407,6 +425,7 @@ static void cf_check vmcb_dump(unsigned char ch)
 {
     struct domain *d;
     struct vcpu *v;
+    struct vmcb_struct *vmcb;
 
     printk("*********** VMCB Areas **************\n");
 
@@ -425,7 +444,9 @@ static void cf_check vmcb_dump(unsigned char ch)
                 continue;
             }
             printk("\tVCPU %d\n", v->vcpu_id);
-            svm_vmcb_dump("key_handler", v->arch.hvm.svm.vmcb);
+            vmcb = SVM_MAP_VMCB(v);
+            svm_vmcb_dump("key_handler", vmcb);
+            SVM_UNMAP_VMCB(v, vmcb);
 
             process_pending_softirqs();
         }
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 28dae325ce..d49c910d46 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -559,6 +559,24 @@ struct vmcb_struct {
 struct vmcb_struct *alloc_vmcb(void);
 void free_vmcb(struct vmcb_struct *vmcb);
 
+/*
+ * Access a VMCB of a vCPU that may not be current.  SVM_MAP_VMCB() takes
+ * the active VMCB, SVM_MAP_VMCB_ONE() a specific one.
+ */
+struct vmcb_struct *svm_vmcb_map_one(const struct vcpu *v,
+                                     struct vmcb_struct *va, paddr_t pa);
+struct vmcb_struct *svm_vmcb_map(const struct vcpu *v);
+void svm_vmcb_unmap(const struct vcpu *v, const struct vmcb_struct *vmcb);
+
+#define SVM_MAP_VMCB(v) svm_vmcb_map(v)
+#define SVM_MAP_VMCB_ONE(v, va, pa) svm_vmcb_map_one(v, va, pa)
+
+/* Drops the mapping of a VMCB and nullifies its pointer. */
+#define SVM_UNMAP_VMCB(v, vmcb) do {  \
+    svm_vmcb_unmap(v, vmcb);          \
+    (vmcb) = NULL;                    \
+} while ( false )
+
 int  svm_create_vmcb(struct vcpu *v);
 void svm_destroy_vmcb(struct vcpu *v);
 
-- 
2.56.0


