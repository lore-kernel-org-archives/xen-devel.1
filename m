Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E3606A327
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2y+idsm
Received: from list by lists.xenproject.org with outflank-mailman.1487724.1690024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWk-0002bk-Ln; Fri, 13 Nov 2026 15:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487724.1690024; Fri, 13 Nov 2026 15:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWk-0002bG-EI; Fri, 13 Nov 2026 15:49:22 +0000
Received: by outflank-mailman (input) for mailman id 1487724;
 Fri, 13 Nov 2026 15:49:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWi-0002Fz-LE
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWi-004Sxq-20
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:20 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73165-2eae-0a2a0a5409dd-0a2a4502d274-40
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:20 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7317f-6ca4-0a2a45020019-d155dd2de5fe-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:19 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-497614c95f0so529871f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:19 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:18 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584959; x=1795189759; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3FM0QhfL4M2ClTQS5yJWjlOCQR6yKZoiI7rnqjqnBM=;
        b=G2y+idsm8jultenjml3x7zq2834W/qJQ2VgDd/jc4z+2bfeArQc6sZXcwkaKemm86k
         yZY7eAuEMvqizI5uXDsGNxXTwvV7nDMIhJGZwb1erEF3ZwVU50+DtRIn0fHcsJsXFeip
         cZldL79MMhKeQoCLor1CO9JtQeEZ+HNnLa7mUfIwW7/a59LUaa48OxXHbMvOegZGWrgA
         PHhzHeQsLNJoy2gQxDt+J1KJMtRA4QsElycV3cWrLUdSHBDsQ7p2+el1AamAaQK+GKqL
         y7BCQqdUiO40e1toHNgxi2Z2DZTO2kO9HFn8I+2XXZeK/wl9oQz6XN/dowyagDpCOY5J
         ctEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584959; x=1795189759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3FM0QhfL4M2ClTQS5yJWjlOCQR6yKZoiI7rnqjqnBM=;
        b=LN9ExFkhyZqxPZy1l1ILp+byRxW+/gQXdGs9lfMCD8O/d3oI7jpDl7nSpC4fAphFB4
         6uqvECuKav3PR4bQNzY5O2DGnaqw5TEYlJFyXelxip9wnl8HPbWCT1gkVIXHeB/SWze4
         Qa5DqRr5yqDmXFMAufklg8XNZzqeYei0rh3FlHuyPzDXYnjj5JGMgr1HDrqQGa9+UyQI
         0o2OgFttN0w8jdkTocuNuMNo7IhMfsx63inPs1YLlIpxlEpQc/Pu6SPOYj26fc+8jU91
         TfLvhz0P5uZsKKo1zeO84gFyc69n7NwbwCTeDW2LWzXozWr8RIfUCB17M0l4c/PLho75
         5R8Q==
X-Gm-Message-State: APuU4Z+Lga6Exx4Hov0iuM2CwTwu/BoEzdYO6i4yCctvtwlwJpQtrGz1
	EHJc9eQ2CFJ89xM8wyQ/ptRvTk1dL1ZVtsCtwWpLUAsybV36XTlzYTsrBjomZQ==
X-Gm-Gg: AYBFou0CDlVK87c/PM9xyu2byiYAPFWNy5yY4BmxQbrLq8bVuBJPZd3NPCD5MQ55V7v
	+uJcD1V12ovoG7QWL8UVJGZuiWs2QTank0mmXFuNWS3bxCuSHqwwHx5ZKLgbM1wgJWjZ+aJnn71
	H6YBC6E85gN20J4ay2VhWZE7FsekSdLFAUpuPf59qk3EWe9uSID6SNDIDolHSO+3LgMqWYTD5nu
	qmkrtZMZ0krAGR7jmjb4G6ihvXOhw/83zyp47qQL1Rzc0YQrUnYebfhBUqMF5Pv0PoCJUBPMiGQ
	Q8h7soeJL1nZoDwQy398Y/FoqCs2HAUKTZXJ/8A/CrFgrth1+7UhIBR/qkss34lubwSlvhh5N6b
	iknqfIyLrhmRDTs56gBkENMU6VGqYQO2sLgMGU4UDKrPEpjeslUcX2yK/iCoqMwOMLUugKjTLla
	fCGq+K+O9O36g+Gsh49hBOVnPmKjabYKgAeHcz0VOgK7yEtMTdMjESe6J9r9ppYQdSQaQ1rTVfE
	48meTCUQne1MYB6ABx7Cn5imUgnWI0sd79AUfYQp17jlWAUDhAgfQ+odRgAg0vSW7jf/3w6zuR/
	tt9Zh/9EnUVTykVo38Ib3NVvikM2gCrd+PpwcYjl9beh5drFOPwWKyWDOt6r8af0RkfF
X-Received: by 2002:a05:6000:2dc9:b0:491:8462:20b6 with SMTP id ffacd0b85a97d-49c73ed0fbemr7124052f8f.38.1794584959152;
        Fri, 13 Nov 2026 07:49:19 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 11/42] xen/riscv: implement vCPU context switching
Date: Fri, 13 Nov 2026 16:48:32 +0100
Message-ID: <e9b5c201bcee144bde27788a56bf66db0394443e.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794584959-F3EBB2AC-F6B0853F/10/73395122804
X-purgate-type: spam
X-purgate-size: 25317
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement context_switch() and the helpers it needs: save/restore of
H/VS CSRs, virtual timer and P2M context, and __context_switch() in
assembly, which switches Xen's own callee-saved state (and thereby the
stack) from prev to next. The virtual interrupt controller state isn't
switched here.

Add offsets of struct arch_vcpu's xen_saved_context to asm-offsets.c for
use by __context_switch().

henvcfg, htimedelta and vsie are 64-bit on both RV32 and RV64, so store
them as uint64_t and access them with csr_{read,write}64(). For that
purpose introduce csr_read64().

The VMID has to be claimed on the context switch rather than on guest
entry: once p2m_ctxt_switch_to() writes HGATP, speculation can populate
G-stage entries under whatever VMID is written there. This is done by
p2m_vmid_switch_to(), called right before the HGATP write:

 - VMIDs are a per-hart resource, so the (generation, vmid) pair of a
   vCPU which last ran on another hart is invalidated before a VMID is
   claimed for it. The local flush for a wrapped generation moves along
   with the claim.
 - Nothing is switched in for the idle vCPU, so HGATP keeps pointing at
   the p2m of the domain which ran on the hart last. Track that domain
   per hart (hgatp_owner) and keep the hart in its dirty_cpumask until a
   vCPU of another domain is switched in: p2m_tlb_flush() then goes on
   reaching the hart, and a domain which idles between two runs on the
   same hart keeps its VMIDs.
 - When the owner changes, the hart leaves the old owner's dirty_cpumask
   while its TLB may still hold that domain's G-stage translations, so it
   is moved to a new VMID generation, which makes none of them reachable
   again. It joins the new owner's dirty_cpumask before HGATP is written;
   a full barrier there, paired with one in p2m_tlb_flush(), guarantees
   that a concurrent P2M change either reaches the hart with an
   HFENCE.GVMA or is visible to it before it walks the p2m.

That leaves p2m_handle_vmenter() with nothing to do, so drop it together
with its call from check_for_pcpu_work(): a VMID is only ever invalidated
while its vCPU isn't running, and p2m_tlb_flush() drops stale entries
with a remote HFENCE.GVMA rather than by retiring VMIDs. Unlike
p2m_handle_vmenter(), HGATP is written unconditionally, as it holds the
G-stage root too, which on a context switch belongs to another domain.

While at it, fix the inclusion order of headers in asm-offsets.c: Xen's
headers go first, then arch specific ones.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Take the CSR name without the CSR_ prefix in csr_read64(), so that the
   macro parameter is used as an operand of ## only (MISRA C Rule 20.12),
   and update the csr_{read,write}64() callers accordingly.
 - Drop the (void) of the ...H constant on RV64.
 - Simplify the comment on resetting the VMID generation of a vCPU which
   comes from another hart.
 - Spell out in the comment on claiming the VMID what makes doing so on
   guest entry too late.
 - s/csr_regs_ctxt_switch_/csrs_ctxt_switch_/.
 - Replace the commented-out code in csrs_ctxt_switch_from() with a
   comment on why hedeleg, hideleg, henvcfg, hcounteren, htimedelta
   and hstateen0 aren't saved.
 - Declare __context_switch() asmlinkage, as it is implemented in
   assembly.
---
Changes in v3:
 - Update the commit message.
 - Introduce csr_read64(), as vsie is 64-bit on RV32 too, i.e. has to be
   accessed as the vsie/vsieh pair there.
 - Make vsie declared as uint64_t instead of register_t.
 - Rename the parameter of save_csr_regs() to p and of restore_csr_regs()
   to n, to match their callers ctxt_switch_from()/ctxt_switch_to() and the
   rest of the context switch helpers (p2m_ctxt_switch_{from,to}(),
   vtimer_ctxt_switch_{from,to}()).
 - s/save_csr_regs/csr_regs_ctxt_switch_from/
 - s/restore_csr_regs/csr_regs_ctxt_switch_to/
 - Drop the forward declaration of struct vcpu in <asm/system.h>: the
   return type of __context_switch() already declares the tag at file
   scope.
 - Make the next parameter of __context_switch() pointer-to-const, as
   next's saved context is only read.
 - Extend the comment above __context_switch(): as ra is switched too, it
   doesn't return to its caller, but to where next last called it from
   (next's own context_switch(), or continue_new_vcpu() for a vCPU which
   has never run).
 - Call vtimer_ctxt_switch_to() after csr_regs_ctxt_switch_to(), so that
   ctxt_switch_to() restores state in the reverse order of
   ctxt_switch_from() saving it.
 - Rework p2m's VMID handling in the context switch: track the domain
   whose p2m HGATP points at in a per-CPU hgatp_owner, so a pass through
   idle no longer drops the hart from that domain's dirty_cpumask nor
   burns a VMID generation; move the dirty_cpumask update and the
   invalidation of a VMID brought from another hart from schedule_tail()
   and ctxt_switch_to() to p2m_ctxt_switch_to(), next to the VMID claim;
   add the barriers ordering the dirty_cpumask update against
   p2m_tlb_flush().
 - Initialise arch_vcpu.last_cpu to CPU_NONE instead of NR_CPUS.
 - Mark prev's dirty_cpu clean before ctxt_switch_to() and set current's
   after it.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/domain.c              | 118 ++++++++++++++++++++
 xen/arch/riscv/entry.S               |  48 ++++++++
 xen/arch/riscv/include/asm/csr.h     |   9 ++
 xen/arch/riscv/include/asm/domain.h  |  15 ++-
 xen/arch/riscv/include/asm/p2m.h     |   1 -
 xen/arch/riscv/include/asm/system.h  |   3 +
 xen/arch/riscv/p2m.c                 | 157 ++++++++++++++++++---------
 xen/arch/riscv/riscv64/asm-offsets.c |  19 +++-
 xen/arch/riscv/stubs.c               |   5 -
 xen/arch/riscv/traps.c               |   2 -
 10 files changed, 318 insertions(+), 59 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 683c37c0ee5a..9feeaa59b887 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -11,6 +11,7 @@
 #include <asm/bitops.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
+#include <asm/current.h>
 #include <asm/intc.h>
 #include <asm/mmio.h>
 #include <asm/riscv_encoding.h>
@@ -152,6 +153,8 @@ int arch_vcpu_create(struct vcpu *v)
     if ( is_idle_vcpu(v) )
         return 0;
 
+    v->arch.last_cpu = CPU_NONE;
+
     vcpu_csr_init(v);
 
     if ( (rc = vcpu_vtimer_init(v)) )
@@ -326,6 +329,121 @@ int arch_domain_create(struct domain *d,
     return rc;
 }
 
+static void csrs_ctxt_switch_from(struct vcpu *p)
+{
+    /*
+     * hedeleg, hideleg, henvcfg, hcounteren, htimedelta and hstateen0 aren't
+     * saved: neither the guest nor Xen changes them other than by
+     * csrs_ctxt_switch_to() writing them from v->arch.*, which is left
+     * unchanged after vcpu_csr_init().
+     */
+
+    p->arch.hvip = csr_read(CSR_HVIP);
+
+    p->arch.vsstatus = csr_read(CSR_VSSTATUS);
+    p->arch.vsie = csr_read64(VSIE);
+    p->arch.vstvec = csr_read(CSR_VSTVEC);
+    p->arch.vsscratch = csr_read(CSR_VSSCRATCH);
+    p->arch.vscause = csr_read(CSR_VSCAUSE);
+    p->arch.vstval = csr_read(CSR_VSTVAL);
+    p->arch.vsepc = csr_read(CSR_VSEPC);
+}
+
+static void csrs_ctxt_switch_to(struct vcpu *n)
+{
+    csr_write(CSR_HEDELEG, n->arch.hedeleg);
+    csr_write(CSR_HIDELEG, n->arch.hideleg);
+    csr_write(CSR_HVIP, n->arch.hvip);
+    csr_write64(HENVCFG, n->arch.henvcfg);
+    csr_write(CSR_HCOUNTEREN, n->arch.hcounteren);
+    csr_write64(HTIMEDELTA, n->arch.htimedelta);
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+        csr_write(CSR_HSTATEEN0, n->arch.hstateen0);
+
+    csr_write(CSR_VSSTATUS, n->arch.vsstatus);
+    csr_write64(VSIE, n->arch.vsie);
+    csr_write(CSR_VSTVEC, n->arch.vstvec);
+    csr_write(CSR_VSSCRATCH, n->arch.vsscratch);
+    csr_write(CSR_VSCAUSE, n->arch.vscause);
+    csr_write(CSR_VSTVAL, n->arch.vstval);
+    csr_write(CSR_VSEPC, n->arch.vsepc);
+}
+
+static void ctxt_switch_from(struct vcpu *p)
+{
+    /*
+     * When the idle VCPU is running, Xen will always stay in hypervisor
+     * mode.
+     * Therefore we don't need to save the context of an idle VCPU.
+     */
+    if ( is_idle_vcpu(p) )
+        return;
+
+    p2m_ctxt_switch_from(p);
+
+    vtimer_ctxt_switch_from(p);
+
+    csrs_ctxt_switch_from(p);
+}
+
+static void ctxt_switch_to(struct vcpu *n)
+{
+    /*
+     * When the idle VCPU is running, Xen will always stay in hypervisor
+     * mode.
+     * Therefore we don't need to restore the context of an idle VCPU.
+     */
+    if ( is_idle_vcpu(n) )
+        return;
+
+    csrs_ctxt_switch_to(n);
+
+    vtimer_ctxt_switch_to(n);
+
+    p2m_ctxt_switch_to(n);
+}
+
+static void schedule_tail(struct vcpu *prev)
+{
+    unsigned int cpu = smp_processor_id();
+
+    ASSERT(prev != current);
+
+    ctxt_switch_from(prev);
+
+    write_atomic(&prev->dirty_cpu, VCPU_CPU_CLEAN);
+
+    ctxt_switch_to(current);
+
+    write_atomic(&current->dirty_cpu, cpu);
+
+    current->arch.last_cpu = cpu;
+
+    /*
+     * sched_context_switched() internally uses a spinlock,
+     * which requires interrupts to be enabled.
+     */
+    local_irq_enable();
+
+    sched_context_switched(prev, current);
+}
+
+void context_switch(struct vcpu *prev, struct vcpu *next)
+{
+    ASSERT(local_irq_is_enabled());
+    ASSERT(prev != next);
+    ASSERT(!vcpu_cpu_dirty(next));
+
+    local_irq_disable();
+
+    set_current(next);
+
+    prev = __context_switch(prev, next);
+
+    schedule_tail(prev);
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
index 202a35fb03a8..017fbb06262c 100644
--- a/xen/arch/riscv/entry.S
+++ b/xen/arch/riscv/entry.S
@@ -99,3 +99,51 @@ restore_registers:
 
         sret
 END(handle_trap)
+
+/*
+ * struct vcpu *__context_switch(struct vcpu *prev, const struct vcpu *next)
+ *
+ * This is called on prev's stack, and returns on next's. As ra is
+ * switched too, it doesn't return to its caller: it returns to where
+ * next last called it from, i.e. into next's own context_switch(), or,
+ * for a vCPU which has never run, to continue_new_vcpu() with an empty
+ * stack.
+ *
+ * a0 - prev
+ * a1 - next
+ *
+ * Returns prev in a0
+ */
+FUNC(__context_switch)
+        REG_S   s0, VCPU_XEN_SAVED_CONTEXT_S0(a0)
+        REG_S   s1, VCPU_XEN_SAVED_CONTEXT_S1(a0)
+        REG_S   s2, VCPU_XEN_SAVED_CONTEXT_S2(a0)
+        REG_S   s3, VCPU_XEN_SAVED_CONTEXT_S3(a0)
+        REG_S   s4, VCPU_XEN_SAVED_CONTEXT_S4(a0)
+        REG_S   s5, VCPU_XEN_SAVED_CONTEXT_S5(a0)
+        REG_S   s6, VCPU_XEN_SAVED_CONTEXT_S6(a0)
+        REG_S   s7, VCPU_XEN_SAVED_CONTEXT_S7(a0)
+        REG_S   s8, VCPU_XEN_SAVED_CONTEXT_S8(a0)
+        REG_S   s9, VCPU_XEN_SAVED_CONTEXT_S9(a0)
+        REG_S   s10, VCPU_XEN_SAVED_CONTEXT_S10(a0)
+        REG_S   s11, VCPU_XEN_SAVED_CONTEXT_S11(a0)
+        REG_S   sp, VCPU_XEN_SAVED_CONTEXT_SP(a0)
+        REG_S   ra, VCPU_XEN_SAVED_CONTEXT_RA(a0)
+
+        REG_L   s0, VCPU_XEN_SAVED_CONTEXT_S0(a1)
+        REG_L   s1, VCPU_XEN_SAVED_CONTEXT_S1(a1)
+        REG_L   s2, VCPU_XEN_SAVED_CONTEXT_S2(a1)
+        REG_L   s3, VCPU_XEN_SAVED_CONTEXT_S3(a1)
+        REG_L   s4, VCPU_XEN_SAVED_CONTEXT_S4(a1)
+        REG_L   s5, VCPU_XEN_SAVED_CONTEXT_S5(a1)
+        REG_L   s6, VCPU_XEN_SAVED_CONTEXT_S6(a1)
+        REG_L   s7, VCPU_XEN_SAVED_CONTEXT_S7(a1)
+        REG_L   s8, VCPU_XEN_SAVED_CONTEXT_S8(a1)
+        REG_L   s9, VCPU_XEN_SAVED_CONTEXT_S9(a1)
+        REG_L   s10, VCPU_XEN_SAVED_CONTEXT_S10(a1)
+        REG_L   s11, VCPU_XEN_SAVED_CONTEXT_S11(a1)
+        REG_L   sp, VCPU_XEN_SAVED_CONTEXT_SP(a1)
+        REG_L   ra, VCPU_XEN_SAVED_CONTEXT_RA(a1)
+
+        ret
+END(__context_switch)
diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index 6df595e810ef..ef6c22a90e76 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -40,6 +40,13 @@
     csr_write(CSR_ ## name ## H, v_ >> 32); \
 })
 
+#define csr_read64(name)                       \
+({                                             \
+    uint64_t v_ = csr_read(CSR_ ## name ## H); \
+                                               \
+    (v_ << 32) | csr_read(CSR_ ## name);       \
+})
+
 /*
  * The two halves are read by separate instructions, so a CSR which hardware
  * increments can carry from the low half into the high one in between,
@@ -63,6 +70,8 @@
 #define csr_write64(name, val) csr_write(CSR_ ## name, val)
 
 #define csr_volatile_read64(name) csr_read(CSR_ ## name)
+
+#define csr_read64(name) csr_read(CSR_ ## name)
 #endif
 
 #define csr_swap(csr, val)                                      \
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 8c48833353f5..63e34c1a11ab 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -28,6 +28,11 @@ struct arch_vcpu_io {
 struct arch_vcpu {
     struct vcpu_vmid vmid;
 
+    /*
+     * The last CPU this vCPU ran on. Initialised to CPU_NONE.
+     */
+    unsigned int last_cpu;
+
     /*
      * Callee saved registers for Xen's state used to switch from
      * prev's stack to the next's stack during context switch.
@@ -59,11 +64,19 @@ struct arch_vcpu {
     register_t hcounteren;
     register_t hedeleg;
     register_t hideleg;
-    register_t henvcfg;
+    uint64_t   henvcfg;
     register_t hstateen0;
+    uint64_t   htimedelta;
     register_t hvip;
 
     register_t vsatp;
+    register_t vscause;
+    register_t vsepc;
+    uint64_t   vsie;
+    register_t vsscratch;
+    register_t vsstatus;
+    register_t vstval;
+    register_t vstvec;
 
     /*
      * VCPU interrupts
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index c0538281517f..1104854c4021 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -262,7 +262,6 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
 
 void p2m_ctxt_switch_from(struct vcpu *p);
 void p2m_ctxt_switch_to(struct vcpu *n);
-void p2m_handle_vmenter(void);
 
 #endif /* RISCV_P2M_H */
 
diff --git a/xen/arch/riscv/include/asm/system.h b/xen/arch/riscv/include/asm/system.h
index cb382487751c..50e2e369fcb6 100644
--- a/xen/arch/riscv/include/asm/system.h
+++ b/xen/arch/riscv/include/asm/system.h
@@ -76,6 +76,9 @@ static inline bool local_irq_is_enabled(void)
 
 #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
 
+struct vcpu * asmlinkage __context_switch(struct vcpu *prev,
+                                          const struct vcpu *next);
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* RISCV_SYSTEM_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index a2d81a9c8a95..fedb029dcc37 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -243,6 +243,15 @@ static void p2m_tlb_flush(struct p2m_domain *p2m)
 
     p2m->need_flush = false;
 
+    /*
+     * Order the p2m updates above against the read of dirty_cpumask below,
+     * pairing with the barrier in p2m_vmid_switch_to(). Either that hart is
+     * seen here and gets an HFENCE.GVMA, or it adds itself to the mask
+     * afterwards, in which case it starts walking this p2m only once the
+     * updates are visible to it.
+     */
+    smp_mb();
+
     sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
 }
 
@@ -1497,16 +1506,110 @@ void p2m_ctxt_switch_from(struct vcpu *p)
      * VMID, world-switch code should zero vsatp, then swap hgatp, then
      * finally write the new vsatp value what will be done in
      * p2m_ctxt_switch_to().
-     * Note, that also HGATP update could happen in p2m_handle_vmenter().
      */
     p->arch.vsatp = csr_swap(CSR_VSATP, 0);
 
     /*
-     * Nothing to do with HGATP as it will be update in p2m_ctxt_switch_to()
-     * or/and in p2m_handle_vmenter().
+     * Nothing to do with HGATP as it will be updated in
+     * p2m_ctxt_switch_to().
      */
 }
 
+/*
+ * Domain whose p2m this hart's HGATP points at. ctxt_switch_to() bails out
+ * early for the idle vCPU, so HGATP survives a pass through idle and keeps
+ * pointing at the domain which ran here last. That domain, rather than the
+ * one the scheduler switched away from, is what owns this hart's G-stage
+ * translations. The hart also keeps its place in the owner's dirty_cpumask:
+ * p2m_tlb_flush() goes on reaching it, and a domain which idles between two
+ * runs on the same hart keeps its VMIDs.
+ *
+ * TODO: nothing resets hgatp_owner when its domain is destroyed, so a hart
+ *       which stays idle from the domain's last run until it is freed is
+ *       left with a dangling pointer. Once domain_relinquish_resources()
+ *       tears down the p2m, it has to reset hgatp_owner of every hart still
+ *       pointing at the domain (cmpxchg() against d), i.e. before the RCU
+ *       grace period of domain_destroy() and so before the domain is freed.
+ */
+static DEFINE_PER_CPU(struct domain *, hgatp_owner);
+
+/*
+ * Update this hart's place in the dirty_cpumask of the domains involved and
+ * claim a VMID for n. Must be called before HGATP is pointed at n's p2m, as
+ * it is written with the VMID claimed here.
+ */
+static void p2m_vmid_switch_to(struct vcpu *n)
+{
+    unsigned int cpu = smp_processor_id();
+    struct domain *owner = this_cpu(hgatp_owner);
+    bool need_flush;
+
+    ASSERT(!is_idle_vcpu(n));
+
+    if ( owner != n->domain )
+    {
+        /*
+         * Once this hart drops out of the owner's dirty_cpumask it stops
+         * being a target of p2m_tlb_flush(), while its TLB may still hold
+         * G-stage translations of that domain: none of the vCPUs of that
+         * domain which ran here has had its VMID invalidated. Move the hart
+         * to a new VMID generation so that none of them can be reached
+         * again.
+         *
+         * This has to precede the VMID claim below, so that n gets a VMID of
+         * the new generation.
+         */
+        if ( owner )
+        {
+            vmid_flush_hart();
+
+            cpumask_clear_cpu(cpu, owner->dirty_cpumask);
+        }
+
+        /*
+         * Mark this hart in the incoming domain's dirty_cpumask before HGATP
+         * is pointed at its p2m: from that write on the hart may cache the
+         * p2m's translations, so p2m_tlb_flush() must already reach it.
+         */
+        cpumask_set_cpu(cpu, n->domain->dirty_cpumask);
+
+        /*
+         * Pairs with the barrier in p2m_tlb_flush(). cpumask_set_cpu() is an
+         * unordered AMO on RISC-V, so without this a concurrent flusher could
+         * read the mask without this hart in it while this hart is already
+         * walking the p2m it is about to be pointed at.
+         */
+        smp_mb();
+
+        this_cpu(hgatp_owner) = n->domain;
+    }
+
+    /*
+     * VMIDs and generations are per hart, so a pair issued on another hart
+     * may match this hart's generation by coincidence. Reset the generation
+     * to 0, which no hart ever uses, so that a fresh VMID is claimed from
+     * this hart's pool.
+     */
+    if ( n->arch.last_cpu != cpu )
+        vmid_flush_vcpu(n);
+
+    /*
+     * Claim the VMID before the caller writes HGATP rather than on guest
+     * entry: from that write on, speculation may fill the TLB with this
+     * domain's G-stage entries tagged with that VMID. A stale VMID may
+     * already have been re-issued to a vCPU of another domain, which would
+     * then hit these entries.
+     */
+    need_flush = vmid_handle_vmenter(&n->arch.vmid);
+
+    /*
+     * A VMID isn't re-used until the generation it was issued in wraps, so a
+     * G-stage flush is needed only when vmid_handle_vmenter() says so.
+     */
+    if ( unlikely(need_flush) )
+        local_hfence_gvma_all();
+}
+
 /*
  * As speculation may occur at any time, an incorrect set of page tables could
  * be used. Therefore, this function must be called only after all other guest
@@ -1521,11 +1624,9 @@ void p2m_ctxt_switch_to(struct vcpu *n)
     if ( is_idle_vcpu(n) )
         return;
 
+    p2m_vmid_switch_to(n);
+
     csr_write(CSR_HGATP, construct_hgatp(p2m, n->arch.vmid.vmid));
-    /*
-     * As VMID is unique per vCPU and just re-used here thereby there is no
-     * need for G-stage TLB flush here.
-     */
 
     csr_write(CSR_VSATP, n->arch.vsatp);
 
@@ -1541,48 +1642,6 @@ void p2m_ctxt_switch_to(struct vcpu *n)
     flush_tlb_guest_local();
 }
 
-void p2m_handle_vmenter(void)
-{
-    struct vcpu *curr = current;
-    struct p2m_domain *p2m = p2m_get_hostp2m(curr->domain);
-    struct vcpu_vmid *p_vmid = &curr->arch.vmid;
-    unsigned short old_vmid, new_vmid;
-    bool need_flush;
-
-    BUG_ON(is_idle_vcpu(curr));
-
-    old_vmid = p_vmid->vmid;
-    need_flush = vmid_handle_vmenter(p_vmid);
-    new_vmid = p_vmid->vmid;
-
-#ifdef P2M_DEBUG
-    printk("%pv: oldvmid(%d) new_vmid(%d), need_flush(%d)\n",
-           curr, old_vmid, new_vmid, need_flush);
-#endif
-
-    /*
-     * There is no need to set VSATP to 0 to stop speculation before updating
-     * HGATP, as VSATP is not modified here.
-     */
-    if ( old_vmid != new_vmid )
-        csr_write(CSR_HGATP, construct_hgatp(p2m, p_vmid->vmid));
-
-    /*
-     * There is also no need to flush G-stage TLB unconditionally as old VMID
-     * won't be reused until need_flush is set to true.
-     */
-    if ( unlikely(need_flush) )
-        local_hfence_gvma_all();
-
-    /*
-     * There is also no need to flush the VS-stage TLB: even if speculation
-     * occurs (VSATP + old HGATP were used), it will use the old VMID, which
-     * won't be reused until need_flush is set to true. When VMIDs aren't
-     * available there is no old VMID to rely on, but then need_flush is set
-     * on every entry, so the flush above covers that case.
-     */
-}
-
 struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
                                     p2m_type_t *t, p2m_query_t q)
 {
diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
index 1290b9dbbe82..c1be1614ce94 100644
--- a/xen/arch/riscv/riscv64/asm-offsets.c
+++ b/xen/arch/riscv/riscv64/asm-offsets.c
@@ -1,8 +1,10 @@
 #define COMPILE_OFFSETS
 
+#include <xen/sched.h>
+#include <xen/types.h>
+
 #include <asm/current.h>
 #include <asm/processor.h>
-#include <xen/types.h>
 
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ( "\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\""\
@@ -53,4 +55,19 @@ void asm_offsets(void)
     BLANK();
     DEFINE(PCPU_INFO_SIZE, sizeof(struct pcpu_info));
     BLANK();
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_S0, struct vcpu, arch.xen_saved_context.s0);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_S1, struct vcpu, arch.xen_saved_context.s1);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_S2, struct vcpu, arch.xen_saved_context.s2);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_S3, struct vcpu, arch.xen_saved_context.s3);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_S4, struct vcpu, arch.xen_saved_context.s4);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_S5, struct vcpu, arch.xen_saved_context.s5);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_S6, struct vcpu, arch.xen_saved_context.s6);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_S7, struct vcpu, arch.xen_saved_context.s7);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_S8, struct vcpu, arch.xen_saved_context.s8);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_S9, struct vcpu, arch.xen_saved_context.s9);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_S10, struct vcpu, arch.xen_saved_context.s10);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_S11, struct vcpu, arch.xen_saved_context.s11);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_SP, struct vcpu, arch.xen_saved_context.sp);
+    OFFSET(VCPU_XEN_SAVED_CONTEXT_RA, struct vcpu, arch.xen_saved_context.ra);
+    BLANK();
 }
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 3a7953593d93..e0febae432b2 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -81,11 +81,6 @@ void smp_send_state_dump(unsigned int cpu)
 
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
 
-void context_switch(struct vcpu *prev, struct vcpu *next)
-{
-    BUG_ON("unimplemented");
-}
-
 void continue_running(struct vcpu *same)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index dd53454f23f4..2db3b74f95cf 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -178,8 +178,6 @@ static void check_for_pcpu_work(void)
     vcpu_sync_interrupts(curr);
 
     vcpu_flush_interrupts(curr);
-
-    p2m_handle_vmenter();
 }
 
 static void timer_interrupt(void)
-- 
2.56.1


