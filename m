Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74831C61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400940.1636646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvX-0000z1-6F; Thu, 27 Aug 2026 15:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400940.1636646; Thu, 27 Aug 2026 15:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvX-0000xw-2B; Thu, 27 Aug 2026 15:22:03 +0000
Received: by outflank-mailman (input) for mailman id 1400940;
 Thu, 27 Aug 2026 15:22:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvW-0000kV-1j
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvV-00C7Ax-EK
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905610-e002-0a2a0a5209dd-0a2a450bc196-10
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:01 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905619-b7e8-0a2a450b0019-d155802fed17-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:01 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so21331925e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:01 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:00 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787844121; x=1788448921; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2V2WJTxwQddlTB5GIlNmFwYUX3diFnW07Uicf4Tu70o=;
        b=FaClzkYYck+vnVVTLwLLEmurK4/wnx2HP3kdm8bx5OyleS1Puw61+p3SaDRjKgR7Gv
         UuYyu7WSPJRP5y0FruQCvlPz7ovNn//GgxnJWPN43MR1yIEPyH5T1OG5p8dqiSsFuYyS
         Nub8ER1J2YHvzTCmU0BZLd+K0UW05F07sYvvBsgJW1927Az+8QcVzEY/vPkAn+dwVim1
         6Bz3t48gI/fxlRYdSfqyrCAozZmIgibr6EaJTy77ONtP3oaOWVh0Q3zlp5uumhWjfjFc
         3RnUNjzrd0Vq56wEZ4FIAt2OTEG/TtaU1sdRit9yAfI0HsNmpXhRUeGhTCDXiqjCD9Jh
         DnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844121; x=1788448921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2V2WJTxwQddlTB5GIlNmFwYUX3diFnW07Uicf4Tu70o=;
        b=QPN6Uioz2ek/BEw+NVc+y/RAtmTOYiaPSI1ggsL46TvSvzLowNB95x2xgUrv+zNAha
         3c4dHAdm81gxsZNrPFVL9N+MmL2WtinbyeNO3idDp3S4iglAN2srrVozWG8toAG1dcdv
         LiCOagESrbizeZFQDyI9otSOVogVWhDMvsrDYf3l+ImAZGpiSxYaEvD2W3L22eDOnM9y
         GlenQsWgBowmkTlOy2B0GGMFjAcEkBbOF6el6lpAmvQJ/5nwS+s2+rli0F46w5eKV3Ae
         9V4vfoPRSGlLyCGkd5ZzujLzTSoGCVMsGbYfbHppoFRfJlRUFo/hcQsT8bC7Y1mrxPp6
         XFsw==
X-Gm-Message-State: AFuF++lrS2OcJtxs3q1Pbmc9rVrzA2cve9FsAGlqg6VcYhxz0l0hp5Kt
	GPknE+EAeD+0rlOpMqL8cOrlcuAeAufKbysxBS7Fn+qkNXmC4j+7d8gKkpwOoA==
X-Gm-Gg: AR+sD11cL9BhTITHLLQ6ayzwaxhcAbEDpwjurRXlNMRNjz5YFmxLNCLqbw2poOcdi+P
	WWS6Iykqu3xiLtQwtwhQftG7kD/iW/nOdVncy4Dp2ATYodVAFipxxYHXK7DtZYZyyBS+NROX3o9
	O6QcfXfbMXKYt/GTY5rSphEg2NA6LAcZWZmfiel//bhN7JHQULcqxPGZ2uDweQ8b8PcoYz8sKDy
	B5GIlh3wUNuzP6JS50AEQVZdgmfPVrWer1bZL+dP7XBZCHmG6HgFXAnfMitrBPcWgzZEeR4wMLX
	wIu1jkTfpa63zDnLgqYnfg4gVoKi5P/jiB1RUEAvEj6pamazlc7d6vp4yZ31L9PXDR9TGUmRUW+
	xwA5xEYemkCAxOJFZn2hd/ucjUCihkJqf2CDckKB8kzyAlRI0hDaHXaQ/NTZl3RObeVJdZCri9s
	HBZurfkugiyksWq9wr2/2SM3oRhEOwc3l1kTzhGTpJMSxBIurDcLPnBRPeokU+eqaCPq0I6Sv44
	px0Yv3KI0iJR0hqBf1OpEG+XeYWm5Im
X-Received: by 2002:a05:600c:c172:b0:49b:72e4:6223 with SMTP id 5b1f17b1804b1-49b72e463bdmr94379345e9.7.1787844120558;
        Thu, 27 Aug 2026 08:22:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 12/39] xen/riscv: implement vCPU context switching
Date: Thu, 27 Aug 2026 17:20:56 +0200
Message-ID: <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787844121-1A6DA9EA-2496DA3C/10/73395122804
X-purgate-type: spam
X-purgate-size: 19797

Implement context_switch() and the helpers it needs: save/restore of
H/VS CSRs, virtual timer and P2M context, and __context_switch() in assembly,
which switches Xen's own callee-saved state (and thereby the stack) from
prev to next. Virtual interrupt controller context switch will be
introduced later.

Add offsets of struct arch_vcpu's xen_saved_context to asm-offsets.c for
use by __context_switch().

henvcfg and htimedelta are 64-bit on both RV32 and RV64, so store them as
uint64_t and use csr_{read,write}64() instead of open-coding accesses to
the high halves.

A hart which drops out of a domain's dirty_cpumask stops being a target
of p2m_tlb_flush() while its TLB may still hold G-stage translations of
that domain, and neither the vCPU which just ran nor any other vCPU of
that domain which ran there earlier has had its VMID invalidated. Move
the hart to a new VMID generation at that point: a VMID number is never
re-used until a full local flush has happened, hence none of those
translations can be reached again.

Claim the VMID in p2m_ctxt_switch_to() rather than at the next guest
entry. VMIDs are a per-hart resource, so the (generation, vmid) pair a
migrating vCPU brings from another hart is meaningless here and may even
match this hart's current generation, leaving the vCPU under a VMID owned
by another domain. ctxt_switch_to() invalidates that pair, but claiming a
replacement only on guest entry is too late: p2m_ctxt_switch_to() has by
then already made HGATP live, and speculation can populate G-stage entries
of the incoming domain under the stale VMID. The local flush for a wrapped
generation moves along with the claim.

That leaves p2m_handle_vmenter() with nothing to do, so drop it together
with its call from check_for_pcpu_work(). A VMID can only be invalidated
while its vCPU isn't running: vmid_flush_vcpu() is called for the vCPU
being switched in, and vmid_flush_hart() runs either from schedule_tail(),
ahead of ctxt_switch_to(), or from the wrap path of vmid_handle_vmenter()
itself. A P2M change on another hart doesn't invalidate it either, as
p2m_tlb_flush() drops the stale entries directly with
sbi_remote_hfence_gvma() instead of retiring the VMIDs which tag them. A
guest therefore always runs under the VMID claimed on its way in, and
there is nothing left for a guest entry hook to notice.

p2m_handle_vmenter() also skipped the HGATP write when the VMID it claimed
was unchanged. That isn't carried over: HGATP holds the G-stage root as
well, and skipping the write is only correct where that root is already
the incoming domain's. On the guest entry path it is, on the context
switch path it is not.

While at it, fix the inclusion order of headers in asm-offsets.c: Xen's
headers go first, then arch specific ones.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/domain.c              | 167 +++++++++++++++++++++++++++
 xen/arch/riscv/entry.S               |  44 +++++++
 xen/arch/riscv/include/asm/domain.h  |  16 ++-
 xen/arch/riscv/include/asm/p2m.h     |   1 -
 xen/arch/riscv/include/asm/system.h  |   4 +
 xen/arch/riscv/p2m.c                 |  57 ++-------
 xen/arch/riscv/riscv64/asm-offsets.c |  19 ++-
 xen/arch/riscv/stubs.c               |   5 -
 xen/arch/riscv/traps.c               |   2 -
 9 files changed, 258 insertions(+), 57 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index ec327a5e8a23..91a46d630f44 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -11,9 +11,11 @@
 #include <asm/bitops.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
+#include <asm/current.h>
 #include <asm/intc.h>
 #include <asm/mmio.h>
 #include <asm/riscv_encoding.h>
+#include <asm/vmid.h>
 #include <asm/vtimer.h>
 
 struct csr_masks {
@@ -158,6 +160,8 @@ int arch_vcpu_create(struct vcpu *v)
     if ( is_idle_vcpu(v) )
         return 0;
 
+    v->arch.last_cpu = NR_CPUS;
+
     vcpu_csr_init(v);
 
     if ( (rc = vcpu_vtimer_init(v)) )
@@ -329,6 +333,169 @@ int arch_domain_create(struct domain *d,
     return rc;
 }
 
+static void save_csr_regs(struct vcpu *vcpu)
+{
+    /*
+     * There is no need to save these CSRs as only hypervisor writes them in
+     * restore_csr_regs() and guest can't access them so they shouldn't be
+     * stored here. Keep them commented here just for symmetry with the
+     * restore CSRs register part.
+     *
+     * vcpu->arch.hedeleg = csr_read(CSR_HEDELEG);
+     * vcpu->arch.hideleg = csr_read(CSR_HIDELEG);
+     * vcpu->arch.henvcfg = csr_read64(CSR_HENVCFG);
+     * vcpu->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
+     * vcpu->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
+     *
+     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+     *     vcpu->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
+     */
+
+    vcpu->arch.hvip = csr_read(CSR_HVIP);
+
+    vcpu->arch.vsstatus = csr_read(CSR_VSSTATUS);
+    vcpu->arch.vsie = csr_read(CSR_VSIE);
+    vcpu->arch.vstvec = csr_read(CSR_VSTVEC);
+    vcpu->arch.vsscratch = csr_read(CSR_VSSCRATCH);
+    vcpu->arch.vscause = csr_read(CSR_VSCAUSE);
+    vcpu->arch.vstval = csr_read(CSR_VSTVAL);
+    vcpu->arch.vsepc = csr_read(CSR_VSEPC);
+}
+
+static void restore_csr_regs(struct vcpu *vcpu)
+{
+    csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
+    csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
+    csr_write(CSR_HVIP, vcpu->arch.hvip);
+    csr_write64(CSR_HENVCFG, vcpu->arch.henvcfg);
+    csr_write(CSR_HCOUNTEREN, vcpu->arch.hcounteren);
+    csr_write64(CSR_HTIMEDELTA, vcpu->arch.htimedelta);
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+        csr_write(CSR_HSTATEEN0, vcpu->arch.hstateen0);
+
+    csr_write(CSR_VSSTATUS, vcpu->arch.vsstatus);
+    csr_write(CSR_VSIE, vcpu->arch.vsie);
+    csr_write(CSR_VSTVEC, vcpu->arch.vstvec);
+    csr_write(CSR_VSSCRATCH, vcpu->arch.vsscratch);
+    csr_write(CSR_VSCAUSE, vcpu->arch.vscause);
+    csr_write(CSR_VSTVAL, vcpu->arch.vstval);
+    csr_write(CSR_VSEPC, vcpu->arch.vsepc);
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
+    save_csr_regs(p);
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
+    /*
+     * If this vCPU last ran on a different pCPU, invalidate its VMID so
+     * vmid_handle_vmenter() assigns a fresh one from the current pCPU's pool.
+     * Without this, two pCPUs could independently assign the same
+     * (generation, vmid) pair, generation counters start at the same value
+     * on all pCPUs and increment independently, causing TLB contamination.
+     */
+    if ( n->arch.last_cpu != smp_processor_id() )
+        vmid_flush_vcpu(n);
+
+    vtimer_ctxt_switch_to(n);
+
+    restore_csr_regs(n);
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
+    /*
+     * Mark this CPU in next domain's dirty cpumasks before calling
+     * ctxt_switch_to(). This avoids a race on things like p2m flushing,
+     * which is synchronised on that function.
+     */
+    if ( prev->domain != current->domain )
+    {
+        cpumask_set_cpu(cpu, current->domain->dirty_cpumask);
+
+        /*
+         * Once this hart drops out of prev's dirty_cpumask it stops being a
+         * target of p2m_tlb_flush(), while its TLB may still hold G-stage
+         * translations of prev's domain: neither the vCPU which just ran nor
+         * any other vCPU of that domain which ran here earlier has had its
+         * VMID invalidated. Move the hart to a new VMID generation so that
+         * none of them can be reached again.
+         *
+         * Switching away from the idle vCPU needs no bump: the idle domain
+         * has no p2m of its own, and whatever G-stage entries this hart may
+         * still hold (or speculatively create while HGATP keeps pointing at
+         * the last guest's p2m) are tagged with a VMID which was already made
+         * stale when that guest was switched out. Skipping the bump here also
+         * avoids burning a generation on every pass through idle.
+         */
+        if ( !is_idle_vcpu(prev) )
+            vmid_flush_hart();
+
+        cpumask_clear_cpu(cpu, prev->domain->dirty_cpumask);
+    }
+    write_atomic(&current->dirty_cpu, cpu);
+
+    ctxt_switch_to(current);
+
+    write_atomic(&prev->dirty_cpu, VCPU_CPU_CLEAN);
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
index 202a35fb03a8..331446a238d3 100644
--- a/xen/arch/riscv/entry.S
+++ b/xen/arch/riscv/entry.S
@@ -99,3 +99,47 @@ restore_registers:
 
         sret
 END(handle_trap)
+
+/*
+ * struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next)
+ *
+ * This is called on prev's stack, and returns on next's.
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
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 15e8fa19685e..90ed584bb844 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -29,6 +29,12 @@ struct arch_vcpu_io {
 struct arch_vcpu {
     struct vcpu_vmid vmid;
 
+    /*
+     * The last CPU this vCPU ran on. Initialised to NR_CPUS
+     * (never ran).
+     */
+    unsigned int last_cpu;
+
     /*
      * Callee saved registers for Xen's state used to switch from
      * prev's stack to the next's stack during context switch.
@@ -60,11 +66,19 @@ struct arch_vcpu {
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
+    register_t vsie;
+    register_t vsscratch;
+    register_t vsstatus;
+    register_t vstval;
+    register_t vstvec;
 
     /*
      * VCPU interrupts
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 0d1dace1a0d8..9edf78377ee5 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -262,7 +262,6 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
 
 void p2m_ctxt_switch_from(struct vcpu *p);
 void p2m_ctxt_switch_to(struct vcpu *n);
-void p2m_handle_vmenter(void);
 
 #endif /* ASM__RISCV__P2M_H */
 
diff --git a/xen/arch/riscv/include/asm/system.h b/xen/arch/riscv/include/asm/system.h
index f33af64fd2ec..f5f30a9c8059 100644
--- a/xen/arch/riscv/include/asm/system.h
+++ b/xen/arch/riscv/include/asm/system.h
@@ -76,6 +76,10 @@ static inline bool local_irq_is_enabled(void)
 
 #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
 
+struct vcpu;
+
+struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next);
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__SYSTEM_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index de25607247a6..1f7a6907525d 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1504,13 +1504,12 @@ void p2m_ctxt_switch_from(struct vcpu *p)
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
 
@@ -1524,15 +1523,21 @@ void p2m_ctxt_switch_from(struct vcpu *p)
 void p2m_ctxt_switch_to(struct vcpu *n)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(n->domain);
+    bool need_flush;
 
     if ( is_idle_vcpu(n) )
         return;
 
+    need_flush = vmid_handle_vmenter(&n->arch.vmid);
+
     csr_write(CSR_HGATP, construct_hgatp(p2m, n->arch.vmid.vmid));
+
     /*
-     * As VMID is unique per vCPU and just re-used here thereby there is no
-     * need for G-stage TLB flush here.
+     * A VMID isn't re-used until the generation it was issued in wraps, so
+     * a G-stage flush is needed only when vmid_handle_vmenter() says so.
      */
+    if ( unlikely(need_flush) )
+        local_hfence_gvma_all();
 
     csr_write(CSR_VSATP, n->arch.vsatp);
 
@@ -1548,48 +1553,6 @@ void p2m_ctxt_switch_to(struct vcpu *n)
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
index 8530e6fbda0a..093d81e2d803 100644
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
2.55.0


