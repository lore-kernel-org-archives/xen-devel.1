Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC41606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=I/Z6kOyo
Received: from list by lists.xenproject.org with outflank-mailman.1463796.1674655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6V-0006Ou-Ag; Wed, 28 Oct 2026 23:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463796.1674655; Wed, 28 Oct 2026 23:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6U-0006KG-Dd; Wed, 28 Oct 2026 23:30:46 +0000
Received: by outflank-mailman (input) for mailman id 1463796;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00048l-Uu
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00000000pON-3OG0;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCje-00000001KpM-0JnX;
 Wed, 28 Oct 2026 23:07:10 +0000
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
	bh=QAz/r9LvmMiTrUWKKl2WQZxhTMBDbu1jYHL9VdcYAAk=; b=I/Z6kOyo01mwG28LYiJbtqWD1w
	4/iRPmJw4OZ1+AAZvkwF7jFqoBfveT+Cy5Vh4N0yh6e4o+Nr+/5P8hb4ijMIZ5TXF+xN71j4g8szp
	UxUF0vBP93ofvFCYsU8vtxE2awA2YM5N5sfMuw90djDyOF6Xk2SLbGHj0YQ1nhzwTdOM=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 32/45] x86: access a vCPU's saved register frame through map/unmap helpers
Date: Wed, 28 Oct 2026 23:05:46 +0000
Message-ID: <20261028-asi-hvm-v5-32-13b908e0df0b@xenproject.org>
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

When a vCPU is switched out, __context_switch() copies its register
frame from the stack into struct vcpu, and back when the vCPU is
switched in.  Code working on a vCPU other than the one running uses
that copy: vCPU creation, XEN_DOMCTL_{get,set}vcpucontext, saving and
loading the HVM CPU record, VCPUOP_initialise, INIT/SIPI and S3 resets,
the result of a hypercall continued on another CPU, PV dom0
construction, and the debug-key dumps.

Under Address Space Isolation the frame is to move out of struct vcpu,
which is mapped in every context, into memory which other domains'
contexts do not map.  Its users then need a transient mapping whenever
they run in another context.  Prepare for that:
introduce VCPU_MAP_REGS() and VCPU_UNMAP_REGS(), after
VCPU_MAP_XSAVE_AREA(), and convert every user but the context switch,
which moves the frame between the stack and its storage.  The field
becomes _user_regs, so that an access bypassing the helpers fails to
build: once the frame can live elsewhere, such an access would silently
use a stale copy.

vcpu_show_registers() now prints from a copy of the frame for PV vCPUs
as well as HVM ones, so that it holds no mapping while printing, and
vmx_set_info_guest() reads EFLAGS.TF before engaging the VMCS.

No functional change.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- New in this version.
---
 xen/arch/x86/domain.c             | 94 ++++++++++++++++++-------------
 xen/arch/x86/domctl.c             | 72 ++++++++++++-----------
 xen/arch/x86/hvm/domain.c         |  6 +-
 xen/arch/x86/hvm/hvm.c            | 89 ++++++++++++++++-------------
 xen/arch/x86/hvm/vmx/vmcs.c       |  9 +--
 xen/arch/x86/hvm/vmx/vmx.c        |  7 ++-
 xen/arch/x86/hypercall.c          |  4 +-
 xen/arch/x86/include/asm/domain.h | 28 ++++++++-
 xen/arch/x86/pv/dom0_build.c      |  3 +-
 xen/arch/x86/traps.c              | 20 ++++---
 10 files changed, 204 insertions(+), 128 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 3465124ea0..6911f8484c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -496,8 +496,12 @@ unsigned int arch_domain_struct_memflags(void)
 /* Initialise various registers to their architectural INIT/RESET state. */
 void arch_vcpu_regs_init(struct vcpu *v)
 {
-    memset(&v->arch.user_regs, 0, sizeof(v->arch.user_regs));
-    v->arch.user_regs.eflags = X86_EFLAGS_MBS;
+    struct cpu_user_regs *regs = VCPU_MAP_REGS(v);
+
+    memset(regs, 0, sizeof(*regs));
+    regs->eflags = X86_EFLAGS_MBS;
+
+    VCPU_UNMAP_REGS(v, regs);
 
     memset(v->arch.dr, 0, sizeof(v->arch.dr));
     v->arch.dr6 = X86_DR6_DEFAULT;
@@ -1146,6 +1150,7 @@ int arch_set_info_guest(
 {
     struct domain *d = v->domain;
     const struct cpu_policy *p = d->arch.cpu_policy;
+    struct cpu_user_regs *regs;
     unsigned int i;
     unsigned long flags;
     bool compat;
@@ -1273,30 +1278,32 @@ int arch_set_info_guest(
     else
         vcpu_reset_fpu(v);
 
-    memset(&v->arch.user_regs, 0, sizeof(v->arch.user_regs));
+    regs = VCPU_MAP_REGS(v);
+    memset(regs, 0, sizeof(*regs));
 
     if ( !compat )
     {
-        v->arch.user_regs.r15               = c.nat->user_regs.r15;
-        v->arch.user_regs.r14               = c.nat->user_regs.r14;
-        v->arch.user_regs.r13               = c.nat->user_regs.r13;
-        v->arch.user_regs.r12               = c.nat->user_regs.r12;
-        v->arch.user_regs.rbp               = c.nat->user_regs.rbp;
-        v->arch.user_regs.rbx               = c.nat->user_regs.rbx;
-        v->arch.user_regs.r11               = c.nat->user_regs.r11;
-        v->arch.user_regs.r10               = c.nat->user_regs.r10;
-        v->arch.user_regs.r9                = c.nat->user_regs.r9;
-        v->arch.user_regs.r8                = c.nat->user_regs.r8;
-        v->arch.user_regs.rax               = c.nat->user_regs.rax;
-        v->arch.user_regs.rcx               = c.nat->user_regs.rcx;
-        v->arch.user_regs.rdx               = c.nat->user_regs.rdx;
-        v->arch.user_regs.rsi               = c.nat->user_regs.rsi;
-        v->arch.user_regs.rdi               = c.nat->user_regs.rdi;
-        v->arch.user_regs.rip               = c.nat->user_regs.rip;
-        v->arch.user_regs.cs                = c.nat->user_regs.cs;
-        v->arch.user_regs.rflags            = (c.nat->user_regs.rflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
-        v->arch.user_regs.rsp               = c.nat->user_regs.rsp;
-        v->arch.user_regs.ss                = c.nat->user_regs.ss;
+        regs->r15                           = c.nat->user_regs.r15;
+        regs->r14                           = c.nat->user_regs.r14;
+        regs->r13                           = c.nat->user_regs.r13;
+        regs->r12                           = c.nat->user_regs.r12;
+        regs->rbp                           = c.nat->user_regs.rbp;
+        regs->rbx                           = c.nat->user_regs.rbx;
+        regs->r11                           = c.nat->user_regs.r11;
+        regs->r10                           = c.nat->user_regs.r10;
+        regs->r9                            = c.nat->user_regs.r9;
+        regs->r8                            = c.nat->user_regs.r8;
+        regs->rax                           = c.nat->user_regs.rax;
+        regs->rcx                           = c.nat->user_regs.rcx;
+        regs->rdx                           = c.nat->user_regs.rdx;
+        regs->rsi                           = c.nat->user_regs.rsi;
+        regs->rdi                           = c.nat->user_regs.rdi;
+        regs->rip                           = c.nat->user_regs.rip;
+        regs->cs                            = c.nat->user_regs.cs;
+        regs->rflags                        =
+            (c.nat->user_regs.rflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
+        regs->rsp                           = c.nat->user_regs.rsp;
+        regs->ss                            = c.nat->user_regs.ss;
         v->arch.pv.es                       = c.nat->user_regs.es;
         v->arch.pv.ds                       = c.nat->user_regs.ds;
         v->arch.pv.fs                       = c.nat->user_regs.fs;
@@ -1309,18 +1316,19 @@ int arch_set_info_guest(
 #ifdef CONFIG_COMPAT
     else
     {
-        v->arch.user_regs.ebx               = c.cmp->user_regs.ebx;
-        v->arch.user_regs.ecx               = c.cmp->user_regs.ecx;
-        v->arch.user_regs.edx               = c.cmp->user_regs.edx;
-        v->arch.user_regs.esi               = c.cmp->user_regs.esi;
-        v->arch.user_regs.edi               = c.cmp->user_regs.edi;
-        v->arch.user_regs.ebp               = c.cmp->user_regs.ebp;
-        v->arch.user_regs.eax               = c.cmp->user_regs.eax;
-        v->arch.user_regs.eip               = c.cmp->user_regs.eip;
-        v->arch.user_regs.cs                = c.cmp->user_regs.cs;
-        v->arch.user_regs.eflags            = (c.cmp->user_regs.eflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
-        v->arch.user_regs.esp               = c.cmp->user_regs.esp;
-        v->arch.user_regs.ss                = c.cmp->user_regs.ss;
+        regs->ebx                           = c.cmp->user_regs.ebx;
+        regs->ecx                           = c.cmp->user_regs.ecx;
+        regs->edx                           = c.cmp->user_regs.edx;
+        regs->esi                           = c.cmp->user_regs.esi;
+        regs->edi                           = c.cmp->user_regs.edi;
+        regs->ebp                           = c.cmp->user_regs.ebp;
+        regs->eax                           = c.cmp->user_regs.eax;
+        regs->eip                           = c.cmp->user_regs.eip;
+        regs->cs                            = c.cmp->user_regs.cs;
+        regs->eflags                        =
+            (c.cmp->user_regs.eflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
+        regs->esp                           = c.cmp->user_regs.esp;
+        regs->ss                            = c.cmp->user_regs.ss;
         v->arch.pv.es                       = c.cmp->user_regs.es;
         v->arch.pv.ds                       = c.cmp->user_regs.ds;
         v->arch.pv.fs                       = c.cmp->user_regs.fs;
@@ -1335,6 +1343,8 @@ int arch_set_info_guest(
     }
 #endif
 
+    VCPU_UNMAP_REGS(v, regs);
+
     if ( v->vcpu_id == 0 && (c(vm_assist) & ~arch_vm_assist_valid_mask(d)) )
         return -EINVAL;
 
@@ -1353,12 +1363,16 @@ int arch_set_info_guest(
     }
 
 #ifdef CONFIG_PV
+    regs = VCPU_MAP_REGS(v);
+
     /* IOPL privileges are virtualised. */
-    v->arch.pv.iopl = v->arch.user_regs.eflags & X86_EFLAGS_IOPL;
-    v->arch.user_regs.eflags &= ~X86_EFLAGS_IOPL;
+    v->arch.pv.iopl = regs->eflags & X86_EFLAGS_IOPL;
+    regs->eflags &= ~X86_EFLAGS_IOPL;
 
     /* Ensure real hardware interrupts are enabled. */
-    v->arch.user_regs.eflags |= X86_EFLAGS_IF;
+    regs->eflags |= X86_EFLAGS_IF;
+
+    VCPU_UNMAP_REGS(v, regs);
 
     nr_gdt_frames = DIV_ROUND_UP(c(gdt_ents), 512);
     if ( nr_gdt_frames > ARRAY_SIZE(v->arch.pv.gdt_frames) )
@@ -2129,7 +2143,7 @@ static void __context_switch(void)
     if ( !is_idle_domain(pd) )
     {
         ASSERT(read_atomic(&p->dirty_cpu) == cpu);
-        memcpy(&p->arch.user_regs, stack_regs, CTXT_SWITCH_STACK_BYTES);
+        memcpy(&p->arch._user_regs, stack_regs, CTXT_SWITCH_STACK_BYTES);
         vcpu_save_fpu(p);
         pd->arch.ctxt_switch->from(p);
     }
@@ -2145,7 +2159,7 @@ static void __context_switch(void)
 
     if ( !is_idle_domain(nd) )
     {
-        memcpy(stack_regs, &n->arch.user_regs, CTXT_SWITCH_STACK_BYTES);
+        memcpy(stack_regs, &n->arch._user_regs, CTXT_SWITCH_STACK_BYTES);
         if ( cpu_has_xsave )
         {
             if ( !set_xcr0(n->arch.xcr0 ?: XSTATE_FP_SSE) )
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 51d62617bb..b7ea1e1801 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1461,6 +1461,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     const struct domain *d = v->domain;
     bool compat = is_pv_32bit_domain(d);
     const struct xsave_struct *xsave_area;
+    const struct cpu_user_regs *regs;
 #ifdef CONFIG_COMPAT
 #define c(fld) (!compat ? (c.nat->fld) : (c.cmp->fld))
 #else
@@ -1479,29 +1480,32 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     c(flags |= VGCF_i387_valid);
     if ( !(v->pause_flags & VPF_down) )
         c(flags |= VGCF_online);
+
+    regs = VCPU_MAP_REGS(v);
+
     if ( !compat )
     {
         /* Backing memory is pre-zeroed. */
-        c.nat->user_regs.r15               = v->arch.user_regs.r15;
-        c.nat->user_regs.r14               = v->arch.user_regs.r14;
-        c.nat->user_regs.r13               = v->arch.user_regs.r13;
-        c.nat->user_regs.r12               = v->arch.user_regs.r12;
-        c.nat->user_regs.rbp               = v->arch.user_regs.rbp;
-        c.nat->user_regs.rbx               = v->arch.user_regs.rbx;
-        c.nat->user_regs.r11               = v->arch.user_regs.r11;
-        c.nat->user_regs.r10               = v->arch.user_regs.r10;
-        c.nat->user_regs.r9                = v->arch.user_regs.r9;
-        c.nat->user_regs.r8                = v->arch.user_regs.r8;
-        c.nat->user_regs.rax               = v->arch.user_regs.rax;
-        c.nat->user_regs.rcx               = v->arch.user_regs.rcx;
-        c.nat->user_regs.rdx               = v->arch.user_regs.rdx;
-        c.nat->user_regs.rsi               = v->arch.user_regs.rsi;
-        c.nat->user_regs.rdi               = v->arch.user_regs.rdi;
-        c.nat->user_regs.rip               = v->arch.user_regs.rip;
-        c.nat->user_regs.cs                = v->arch.user_regs.cs;
-        c.nat->user_regs.rflags            = v->arch.user_regs.rflags;
-        c.nat->user_regs.rsp               = v->arch.user_regs.rsp;
-        c.nat->user_regs.ss                = v->arch.user_regs.ss;
+        c.nat->user_regs.r15               = regs->r15;
+        c.nat->user_regs.r14               = regs->r14;
+        c.nat->user_regs.r13               = regs->r13;
+        c.nat->user_regs.r12               = regs->r12;
+        c.nat->user_regs.rbp               = regs->rbp;
+        c.nat->user_regs.rbx               = regs->rbx;
+        c.nat->user_regs.r11               = regs->r11;
+        c.nat->user_regs.r10               = regs->r10;
+        c.nat->user_regs.r9                = regs->r9;
+        c.nat->user_regs.r8                = regs->r8;
+        c.nat->user_regs.rax               = regs->rax;
+        c.nat->user_regs.rcx               = regs->rcx;
+        c.nat->user_regs.rdx               = regs->rdx;
+        c.nat->user_regs.rsi               = regs->rsi;
+        c.nat->user_regs.rdi               = regs->rdi;
+        c.nat->user_regs.rip               = regs->rip;
+        c.nat->user_regs.cs                = regs->cs;
+        c.nat->user_regs.rflags            = regs->rflags;
+        c.nat->user_regs.rsp               = regs->rsp;
+        c.nat->user_regs.ss                = regs->ss;
         c.nat->user_regs.es                = v->arch.pv.es;
         c.nat->user_regs.ds                = v->arch.pv.ds;
         c.nat->user_regs.fs                = v->arch.pv.fs;
@@ -1515,18 +1519,18 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
     else
     {
         /* Backing memory is pre-zeroed. */
-        c.cmp->user_regs.ebp               = v->arch.user_regs.ebp;
-        c.cmp->user_regs.ebx               = v->arch.user_regs.ebx;
-        c.cmp->user_regs.eax               = v->arch.user_regs.eax;
-        c.cmp->user_regs.ecx               = v->arch.user_regs.ecx;
-        c.cmp->user_regs.edx               = v->arch.user_regs.edx;
-        c.cmp->user_regs.esi               = v->arch.user_regs.esi;
-        c.cmp->user_regs.edi               = v->arch.user_regs.edi;
-        c.cmp->user_regs.eip               = v->arch.user_regs.eip;
-        c.cmp->user_regs.cs                = v->arch.user_regs.cs;
-        c.cmp->user_regs.eflags            = v->arch.user_regs.eflags;
-        c.cmp->user_regs.esp               = v->arch.user_regs.esp;
-        c.cmp->user_regs.ss                = v->arch.user_regs.ss;
+        c.cmp->user_regs.ebp               = regs->ebp;
+        c.cmp->user_regs.ebx               = regs->ebx;
+        c.cmp->user_regs.eax               = regs->eax;
+        c.cmp->user_regs.ecx               = regs->ecx;
+        c.cmp->user_regs.edx               = regs->edx;
+        c.cmp->user_regs.esi               = regs->esi;
+        c.cmp->user_regs.edi               = regs->edi;
+        c.cmp->user_regs.eip               = regs->eip;
+        c.cmp->user_regs.cs                = regs->cs;
+        c.cmp->user_regs.eflags            = regs->eflags;
+        c.cmp->user_regs.esp               = regs->esp;
+        c.cmp->user_regs.ss                = regs->ss;
         c.cmp->user_regs.es                = v->arch.pv.es;
         c.cmp->user_regs.ds                = v->arch.pv.ds;
         c.cmp->user_regs.fs                = v->arch.pv.fs;
@@ -1638,10 +1642,12 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
         }
 #endif
 
-        if ( guest_kernel_mode(v, &v->arch.user_regs) )
+        if ( guest_kernel_mode(v, regs) )
             c(flags |= VGCF_in_kernel);
     }
 
+    VCPU_UNMAP_REGS(v, regs);
+
     c(vm_assist = d->vm_assist);
 #undef c
 }
diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 978d8b2222..71e16e25ba 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -103,7 +103,7 @@ static int check_segment(struct segment_register *reg, enum x86_segment seg)
 int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
 {
     const struct domain *d = v->domain;
-    struct cpu_user_regs *uregs = &v->arch.user_regs;
+    struct cpu_user_regs *uregs;
     struct segment_register cs, ds, ss, es, tr;
     const char *errstr;
     int rc;
@@ -188,6 +188,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
             return -EINVAL;
         }
 
+        uregs = VCPU_MAP_REGS(v);
         uregs->rax    = regs->eax;
         uregs->rcx    = regs->ecx;
         uregs->rdx    = regs->edx;
@@ -198,6 +199,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
         uregs->rdi    = regs->edi;
         uregs->rip    = regs->eip;
         uregs->rflags = (regs->eflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
+        VCPU_UNMAP_REGS(v, uregs);
 
         v->arch.hvm.guest_cr[0] = regs->cr0;
         v->arch.hvm.guest_cr[3] = regs->cr3;
@@ -239,6 +241,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
             return -EINVAL;
         }
 
+        uregs = VCPU_MAP_REGS(v);
         uregs->rax    = regs->rax;
         uregs->rcx    = regs->rcx;
         uregs->rdx    = regs->rdx;
@@ -249,6 +252,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
         uregs->rdi    = regs->rdi;
         uregs->rip    = regs->rip;
         uregs->rflags = (regs->rflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
+        VCPU_UNMAP_REGS(v, uregs);
 
         v->arch.hvm.guest_cr[0] = regs->cr0;
         v->arch.hvm.guest_cr[3] = regs->cr3;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 71da15c0a4..eadccf3d79 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -827,28 +827,29 @@ HVM_REGISTER_SAVE_RESTORE(TSC_ADJUST, hvm_save_tsc_adjust, NULL,
 
 static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
 {
+    const struct cpu_user_regs *regs = VCPU_MAP_REGS(v);
     struct segment_register seg;
     struct hvm_hw_cpu ctxt = {
         .tsc = hvm_get_guest_tsc_fixed(v, v->domain->arch.hvm.sync_tsc),
         .msr_tsc_aux = v->arch.msrs->tsc_aux,
-        .rax = v->arch.user_regs.rax,
-        .rbx = v->arch.user_regs.rbx,
-        .rcx = v->arch.user_regs.rcx,
-        .rdx = v->arch.user_regs.rdx,
-        .rbp = v->arch.user_regs.rbp,
-        .rsi = v->arch.user_regs.rsi,
-        .rdi = v->arch.user_regs.rdi,
-        .rsp = v->arch.user_regs.rsp,
-        .rip = v->arch.user_regs.rip,
-        .rflags = v->arch.user_regs.rflags,
-        .r8  = v->arch.user_regs.r8,
-        .r9  = v->arch.user_regs.r9,
-        .r10 = v->arch.user_regs.r10,
-        .r11 = v->arch.user_regs.r11,
-        .r12 = v->arch.user_regs.r12,
-        .r13 = v->arch.user_regs.r13,
-        .r14 = v->arch.user_regs.r14,
-        .r15 = v->arch.user_regs.r15,
+        .rax = regs->rax,
+        .rbx = regs->rbx,
+        .rcx = regs->rcx,
+        .rdx = regs->rdx,
+        .rbp = regs->rbp,
+        .rsi = regs->rsi,
+        .rdi = regs->rdi,
+        .rsp = regs->rsp,
+        .rip = regs->rip,
+        .rflags = regs->rflags,
+        .r8  = regs->r8,
+        .r9  = regs->r9,
+        .r10 = regs->r10,
+        .r11 = regs->r11,
+        .r12 = regs->r12,
+        .r13 = regs->r13,
+        .r14 = regs->r14,
+        .r15 = regs->r15,
         .cr0 = v->arch.hvm.guest_cr[0],
         .cr2 = v->arch.hvm.guest_cr[2],
         .cr3 = v->arch.hvm.guest_cr[3],
@@ -863,6 +864,8 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
     };
     const struct xsave_struct *xsave_area;
 
+    VCPU_UNMAP_REGS(v, regs);
+
     /*
      * We don't need to save state for a vcpu that is down; the restore
      * code will leave it down if there is nothing saved.
@@ -1020,6 +1023,7 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     const struct cpu_policy *p = d->arch.cpu_policy;
     unsigned int vcpuid = hvm_load_instance(h);
     struct vcpu *v;
+    struct cpu_user_regs *regs;
     struct hvm_hw_cpu ctxt;
     struct segment_register seg;
     const char *errstr;
@@ -1182,24 +1186,26 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     else
         vcpu_reset_fpu(v);
 
-    v->arch.user_regs.rax = ctxt.rax;
-    v->arch.user_regs.rbx = ctxt.rbx;
-    v->arch.user_regs.rcx = ctxt.rcx;
-    v->arch.user_regs.rdx = ctxt.rdx;
-    v->arch.user_regs.rbp = ctxt.rbp;
-    v->arch.user_regs.rsi = ctxt.rsi;
-    v->arch.user_regs.rdi = ctxt.rdi;
-    v->arch.user_regs.rsp = ctxt.rsp;
-    v->arch.user_regs.rip = ctxt.rip;
-    v->arch.user_regs.rflags = ctxt.rflags | X86_EFLAGS_MBS;
-    v->arch.user_regs.r8  = ctxt.r8;
-    v->arch.user_regs.r9  = ctxt.r9;
-    v->arch.user_regs.r10 = ctxt.r10;
-    v->arch.user_regs.r11 = ctxt.r11;
-    v->arch.user_regs.r12 = ctxt.r12;
-    v->arch.user_regs.r13 = ctxt.r13;
-    v->arch.user_regs.r14 = ctxt.r14;
-    v->arch.user_regs.r15 = ctxt.r15;
+    regs = VCPU_MAP_REGS(v);
+    regs->rax = ctxt.rax;
+    regs->rbx = ctxt.rbx;
+    regs->rcx = ctxt.rcx;
+    regs->rdx = ctxt.rdx;
+    regs->rbp = ctxt.rbp;
+    regs->rsi = ctxt.rsi;
+    regs->rdi = ctxt.rdi;
+    regs->rsp = ctxt.rsp;
+    regs->rip = ctxt.rip;
+    regs->rflags = ctxt.rflags | X86_EFLAGS_MBS;
+    regs->r8  = ctxt.r8;
+    regs->r9  = ctxt.r9;
+    regs->r10 = ctxt.r10;
+    regs->r11 = ctxt.r11;
+    regs->r12 = ctxt.r12;
+    regs->r13 = ctxt.r13;
+    regs->r14 = ctxt.r14;
+    regs->r15 = ctxt.r15;
+    VCPU_UNMAP_REGS(v, regs);
     v->arch.dr[0] = ctxt.dr0;
     v->arch.dr[1] = ctxt.dr1;
     v->arch.dr[2] = ctxt.dr2;
@@ -2563,7 +2569,7 @@ bool hvm_vcpu_virtual_to_linear(
 {
     unsigned long addr = offset, last_byte;
     const struct cpu_user_regs *regs = v == current ? guest_cpu_user_regs()
-                                                    : &v->arch.user_regs;
+                                                    : VCPU_MAP_REGS(v);
     bool okay = false;
 
     ASSERT(v == current || !vcpu_runnable(v));
@@ -2688,6 +2694,10 @@ bool hvm_vcpu_virtual_to_linear(
      * failed.  The permissions failure is not relevant to some callers.
      */
     *linear_addr = addr;
+
+    if ( v != current )
+        VCPU_UNMAP_REGS(v, regs);
+
     return okay;
 }
 
@@ -3956,6 +3966,7 @@ void hvm_init_hypercall_page(struct domain *d, void *ptr)
 void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
 {
     struct domain *d = v->domain;
+    struct cpu_user_regs *regs;
     struct segment_register reg;
 
     domain_lock(d);
@@ -3973,7 +3984,9 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
     vcpu_reset_fpu(v);
 
     arch_vcpu_regs_init(v);
-    v->arch.user_regs.rip = ip;
+    regs = VCPU_MAP_REGS(v);
+    regs->rip = ip;
+    VCPU_UNMAP_REGS(v, regs);
 
     v->arch.hvm.guest_cr[0] = X86_CR0_ET;
     hvm_update_guest_cr(v, 0);
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 592722f1ca..78b0af29f2 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2083,15 +2083,13 @@ static void vmx_dump_sel2(const char *name, uint32_t lim)
 
 void vmcs_dump_vcpu(struct vcpu *v)
 {
-    struct cpu_user_regs *regs = &v->arch.user_regs;
+    const struct cpu_user_regs *regs = v == current ? guest_cpu_user_regs()
+                                                    : VCPU_MAP_REGS(v);
     uint32_t vmentry_ctl, vmexit_ctl;
     unsigned long cr4;
     uint64_t efer;
     unsigned int i, n;
 
-    if ( v == current )
-        regs = guest_cpu_user_regs();
-
     vmx_vmcs_enter(v);
 
     vmentry_ctl = vmr32(VM_ENTRY_CONTROLS),
@@ -2236,6 +2234,9 @@ void vmcs_dump_vcpu(struct vcpu *v)
                vmr16(VIRTUAL_PROCESSOR_ID), vmr(VM_FUNCTION_CONTROL));
 
     vmx_vmcs_exit(v);
+
+    if ( v != current )
+        VCPU_UNMAP_REGS(v, regs);
 }
 
 static void cf_check vmcs_dump(unsigned char ch)
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 3c7374a9ff..bdbcd0ad4d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2159,8 +2159,12 @@ static bool cf_check vmx_event_pending(const struct vcpu *v)
 
 static void cf_check vmx_set_info_guest(struct vcpu *v)
 {
+    const struct cpu_user_regs *regs = VCPU_MAP_REGS(v);
+    bool single_step = regs->eflags & X86_EFLAGS_TF;
     unsigned long intr_shadow;
 
+    VCPU_UNMAP_REGS(v, regs);
+
     vmx_vmcs_enter(v);
 
     __vmwrite(GUEST_DR7, v->arch.dr7);
@@ -2174,8 +2178,7 @@ static void cf_check vmx_set_info_guest(struct vcpu *v)
      * immediately vmexit and hence make no progress.
      */
     __vmread(GUEST_INTERRUPTIBILITY_INFO, &intr_shadow);
-    if ( v->domain->debugger_attached &&
-         (v->arch.user_regs.eflags & X86_EFLAGS_TF) &&
+    if ( v->domain->debugger_attached && single_step &&
          (intr_shadow & VMX_INTR_SHADOW_STI) )
     {
         intr_shadow &= ~VMX_INTR_SHADOW_STI;
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index dc0a90ca09..bfdc462874 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -107,9 +107,11 @@ unsigned long hypercall_create_continuation(
 
 void arch_hypercall_tasklet_result(struct vcpu *v, long res)
 {
-    struct cpu_user_regs *regs = &v->arch.user_regs;
+    struct cpu_user_regs *regs = VCPU_MAP_REGS(v);
 
     regs->rax = res;
+
+    VCPU_UNMAP_REGS(v, regs);
 }
 
 int hypercall_xlat_continuation(unsigned int *id, unsigned int nr,
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 0e405157b4..457eb69ace 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -632,7 +632,12 @@ struct pv_vcpu
 
 struct arch_vcpu
 {
-    struct cpu_user_regs user_regs;
+    /*
+     * The vCPU's register frame while it is not running: __context_switch()
+     * copies it here from the stack when the vCPU is switched out, and back
+     * when it is switched in.  Everything else goes through VCPU_MAP_REGS().
+     */
+    struct cpu_user_regs _user_regs;
 
     /* Debug registers. */
     unsigned long dr[4];
@@ -741,6 +746,27 @@ static inline void free_vcpu_guest_context(struct vcpu_guest_context *vgc)
     vfree(vgc);
 }
 
+/*
+ * Fetch a pointer to the register frame a vCPU was last switched out with,
+ * or which a toolstack, debugger or reset has put there since: the vCPU's
+ * registers for code working on a vCPU other than the one running (whose
+ * registers are on the stack, see guest_cpu_user_regs()).
+ *
+ * The pointer is valid until VCPU_UNMAP_REGS(), which clears it.  A mapping
+ * must not be held across a scheduling point.
+ *
+ * @param v Owner of the register frame
+ */
+#define VCPU_MAP_REGS(v) (&(v)->arch._user_regs)
+
+/*
+ * Drops the mapping of a vCPU's register frame and nullifies its pointer.
+ *
+ * @param v Owner of the register frame
+ * @param r Register frame of v, from VCPU_MAP_REGS()
+ */
+#define VCPU_UNMAP_REGS(v, r) do { (void)(v); (r) = NULL; } while ( false )
+
 void arch_vcpu_regs_init(struct vcpu *v);
 
 struct vcpu_hvm_context;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index f18959f3b4..b38beca2ea 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -1007,7 +1007,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
      *          rSI = start_info
      *  [rAX,rBX,rCX,rDX,rDI,rBP,R8-R15 are zero]
      */
-    regs = &v->arch.user_regs;
+    regs = VCPU_MAP_REGS(v);
     v->arch.pv.ds = (compat ? FLAT_COMPAT_KERNEL_DS : FLAT_KERNEL_DS);
     v->arch.pv.es = (compat ? FLAT_COMPAT_KERNEL_DS : FLAT_KERNEL_DS);
     v->arch.pv.fs = (compat ? FLAT_COMPAT_KERNEL_DS : FLAT_KERNEL_DS);
@@ -1018,6 +1018,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
     regs->rsp = vstack_end;
     regs->rsi = vstartinfo_start;
     regs->eflags = X86_EFLAGS_IF | X86_EFLAGS_MBS;
+    VCPU_UNMAP_REGS(v, regs);
 
     /*
      * We don't call arch_set_info_guest(), so some initialisation needs doing
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index ac01ba0872..3b4a01ba52 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -273,16 +273,17 @@ void show_registers(const struct cpu_user_regs *regs)
 
 void vcpu_show_registers(struct vcpu *v)
 {
-    const struct cpu_user_regs *regs = &v->arch.user_regs;
-    struct cpu_user_regs aux_regs;
+    const struct cpu_user_regs *regs = VCPU_MAP_REGS(v);
+    struct cpu_user_regs aux_regs = *regs;
     struct extra_state state;
     enum context context;
 
+    VCPU_UNMAP_REGS(v, regs);
+    regs = &aux_regs;
+
     if ( is_hvm_vcpu(v) )
     {
-        aux_regs = *regs;
         get_hvm_registers(v, &aux_regs, &state);
-        regs = &aux_regs;
         context = CTXT_hvm_guest;
     }
     else
@@ -916,6 +917,7 @@ void cf_check show_execution_state(const struct cpu_user_regs *regs)
 
 void vcpu_show_execution_state(struct vcpu *v)
 {
+    const struct cpu_user_regs *regs;
     unsigned long flags = 0;
 
     if ( test_bit(_VPF_down, &v->pause_flags) )
@@ -961,12 +963,16 @@ void vcpu_show_execution_state(struct vcpu *v)
          */
         console_unlock_recursive_irqrestore(flags);
 
-        show_hvm_stack(v, &v->arch.user_regs);
+        regs = VCPU_MAP_REGS(v);
+        show_hvm_stack(v, regs);
+        VCPU_UNMAP_REGS(v, regs);
     }
     else
     {
-        if ( guest_kernel_mode(v, &v->arch.user_regs) )
-            show_guest_stack(v, &v->arch.user_regs);
+        regs = VCPU_MAP_REGS(v);
+        if ( guest_kernel_mode(v, regs) )
+            show_guest_stack(v, regs);
+        VCPU_UNMAP_REGS(v, regs);
 
         console_unlock_recursive_irqrestore(flags);
     }
-- 
2.56.0


