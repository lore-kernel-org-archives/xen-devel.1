Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37E2CA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437545.1656481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6N-0003Ne-Na; Wed, 30 Sep 2026 16:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437545.1656481; Wed, 30 Sep 2026 16:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6N-0003NV-KJ; Wed, 30 Sep 2026 16:24:15 +0000
Received: by outflank-mailman (input) for mailman id 1437545;
 Wed, 30 Sep 2026 16:24:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6M-0003AQ-1E
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6K-00AJmP-Rg
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37a1-8faa-0a2a0a5109dd-0a2a4505a464-26
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:12 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37ac-4cb1-0a2a45050019-4a7de18d9620-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:12 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e71cdb22bso41007795e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:12 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785452; x=1791390252; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLB+e0LkNxbKffJIT5G6kYupN6psRmxaZXhCt6+lLqo=;
        b=GB5CmOrQoNGbV/e365A05pjBXJP1wmSEOwqiJbvMRKOcm8Hoc6LTuRaJAJs1AIkaBc
         MZwOUj0QIcoSKba97Ic1BDoVIEc/vSP6krKImwTjGHitcV/HMbMUS13SHaNwI/+Zz1SK
         dDsV0mBHv1owj9wdXujJnHtdfkksVir8Rm0o2IZX4rEqBA47wPd1kRNQIvePlDcCVOJn
         Khx4kHZM3r+8vjbyHWTYSwvKiakwK4uFL6Q+n1Lo70P2gVW8Jxn8+WGBgqh9VNetlqI/
         kBCV0v0vPnP8cozj95qAJVRDUaaZrmT08rFie1mY84wrHYaRwc4R1jZ84TyueSsTeB9q
         V3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785452; x=1791390252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NLB+e0LkNxbKffJIT5G6kYupN6psRmxaZXhCt6+lLqo=;
        b=IFvphxU5JJe9f27BaG4u3dC+xZCVpDE5pMSworQQ4suee8oIeqhexFth0IJ7UUxLer
         8MRexZsn1l+TBppsCs2b5aRmj6L2v0XfwQdOlxLxtgXryQQ8h4wXNUfIEllEQMHdFlMb
         fjcgHsbtE9i10klBT0jHLGr3SO1A+GPegE7EYnRgq0pPCgi8HZmFkDjXMzqnCaVqKiol
         krsHAwBt72AsiSGSRcCv525Ech3PZNoRL0TPt59DbK3x3ayDnqF5QAw9jflAIqZGvQwA
         ycqKo/zFuk9XUDa1ugcHuWIVzRXs4/6ZHVGosVnKMAQm/tR+PmRzCxXhaN82JFRH6TFR
         YD8A==
X-Gm-Message-State: AFuF++nyuhsuDrBaeR8PqKe34lfiVa5Ddt6VkqAQOJ1Qy4OgLrxhKaqz
	KmQqjXp4u4AGxZLFIoa2Y0BJLkJln2eBeccoKOh9rphTiZX/gbicZiFfnx5ppA==
X-Gm-Gg: AYBFou1XUNvF+r2YCP/jGIx595yfnAXFsV1An3FhTsM839EBP7TxBikWbypT5wDSbla
	tdbbztdajjC0ImoGvwFG7I9VtrEmmyZ6MdIOl3KKoFEH4aXXJYIjbYUDUcAzD4WJglpTk9ePiK3
	6gZ4qfNJSaJ6vhGkp03FIb7rjiRiBiAukSDujfBr0SI7UYefW0lVeDEbLty/d9/zHtE3bkdZUF9
	oNGAZdpMWcAKh2Xrxna7tG3xwr2bhggzmsOFfqIzgE+yuaChqr7EPpmLyqXqKrKq+pdvvH707jH
	echkbz2kT1JifnIJOLVm8aF7IJpLaxtoyIJ5Ojrqu+/oqmonBubF3gG5+1MbZWn4zKXp96xbzAY
	lPZiK8YXU82twP5EeaW3/cN6UkVxij6oGpZjp7anV2eDa3Ud6EZekvGkGZq/Vb8vm/rE0MwaMYg
	LCzBIpmkAylimxdq0k/rdEiQxqpE58lCgu7A2U6nMNHq3HbSW8W6FnoD7VRIrY8xpAD40FcT5Fz
	4U3ZqQTZ5L4/4NLEkqfQ/SZMdugyg71TU5v7aIH
X-Received: by 2002:a05:600c:45d3:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a01b130b8bmr30415685e9.33.1790785451935;
        Wed, 30 Sep 2026 09:24:11 -0700 (PDT)
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
Subject: [PATCH v3 11/39] xen/riscv: implement vCPU context switching
Date: Wed, 30 Sep 2026 18:23:30 +0200
Message-ID: <6e539cc5ded7f62c4347781785af714840893184.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790785452-24F1F2A1-9BDD79E6/10/73395122804
X-purgate-type: spam
X-purgate-size: 25016

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
 xen/arch/riscv/domain.c              | 127 ++++++++++++++++++++++
 xen/arch/riscv/entry.S               |  48 ++++++++
 xen/arch/riscv/include/asm/csr.h     |  13 +++
 xen/arch/riscv/include/asm/domain.h  |  15 ++-
 xen/arch/riscv/include/asm/p2m.h     |   1 -
 xen/arch/riscv/include/asm/system.h  |   2 +
 xen/arch/riscv/p2m.c                 | 157 ++++++++++++++++++---------
 xen/arch/riscv/riscv64/asm-offsets.c |  19 +++-
 xen/arch/riscv/stubs.c               |   5 -
 xen/arch/riscv/traps.c               |   2 -
 10 files changed, 330 insertions(+), 59 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index fd6229635627..f80643e2d82b 100644
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
@@ -323,6 +326,130 @@ int arch_domain_create(struct domain *d,
     return rc;
 }
 
+static void csr_regs_ctxt_switch_from(struct vcpu *p)
+{
+    /*
+     * There is no need to save these CSRs as only hypervisor writes them in
+     * csr_regs_ctxt_switch_to() and guest can't access them so they shouldn't
+     * be stored here. Keep them commented here just for symmetry with the
+     * restore CSRs register part.
+     *
+     * p->arch.hedeleg = csr_read(CSR_HEDELEG);
+     * p->arch.hideleg = csr_read(CSR_HIDELEG);
+     * p->arch.henvcfg = csr_read64(CSR_HENVCFG);
+     * p->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
+     * p->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
+     *
+     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+     *     p->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
+     */
+
+    p->arch.hvip = csr_read(CSR_HVIP);
+
+    p->arch.vsstatus = csr_read(CSR_VSSTATUS);
+    p->arch.vsie = csr_read64(CSR_VSIE);
+    p->arch.vstvec = csr_read(CSR_VSTVEC);
+    p->arch.vsscratch = csr_read(CSR_VSSCRATCH);
+    p->arch.vscause = csr_read(CSR_VSCAUSE);
+    p->arch.vstval = csr_read(CSR_VSTVAL);
+    p->arch.vsepc = csr_read(CSR_VSEPC);
+}
+
+static void csr_regs_ctxt_switch_to(struct vcpu *n)
+{
+    csr_write(CSR_HEDELEG, n->arch.hedeleg);
+    csr_write(CSR_HIDELEG, n->arch.hideleg);
+    csr_write(CSR_HVIP, n->arch.hvip);
+    csr_write64(CSR_HENVCFG, n->arch.henvcfg);
+    csr_write(CSR_HCOUNTEREN, n->arch.hcounteren);
+    csr_write64(CSR_HTIMEDELTA, n->arch.htimedelta);
+
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
+        csr_write(CSR_HSTATEEN0, n->arch.hstateen0);
+
+    csr_write(CSR_VSSTATUS, n->arch.vsstatus);
+    csr_write64(CSR_VSIE, n->arch.vsie);
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
+    csr_regs_ctxt_switch_from(p);
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
+    csr_regs_ctxt_switch_to(n);
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
index a5cb24c863dd..aad82c6a6d8a 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -40,6 +40,13 @@
     csr_write(csr ## H, v_ >> 32);  \
 })
 
+#define csr_read64(csr)                 \
+({                                      \
+    uint64_t v_ = csr_read(csr ## H);   \
+                                        \
+    (v_ << 32) | csr_read(csr);         \
+})
+
 /*
  * The two halves are read by separate instructions, so a CSR which hardware
  * increments can carry from the low half into the high one in between,
@@ -72,6 +79,12 @@
     (void)csr ## H;                 \
     csr_read(csr);                  \
 })
+
+#define csr_read64(csr)             \
+({                                  \
+    (void)csr ## H;                 \
+    csr_read(csr);                  \
+})
 #endif
 
 #define csr_swap(csr, val)                                      \
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 15e8fa19685e..77ad888a2d6c 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -29,6 +29,11 @@ struct arch_vcpu_io {
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
@@ -60,11 +65,19 @@ struct arch_vcpu {
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
index 0d1dace1a0d8..9edf78377ee5 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -262,7 +262,6 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
 
 void p2m_ctxt_switch_from(struct vcpu *p);
 void p2m_ctxt_switch_to(struct vcpu *n);
-void p2m_handle_vmenter(void);
 
 #endif /* ASM__RISCV__P2M_H */
 
diff --git a/xen/arch/riscv/include/asm/system.h b/xen/arch/riscv/include/asm/system.h
index f33af64fd2ec..d350b9c959c2 100644
--- a/xen/arch/riscv/include/asm/system.h
+++ b/xen/arch/riscv/include/asm/system.h
@@ -76,6 +76,8 @@ static inline bool local_irq_is_enabled(void)
 
 #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
 
+struct vcpu *__context_switch(struct vcpu *prev, const struct vcpu *next);
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__SYSTEM_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index de25607247a6..02e7f6364fad 100644
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
 
@@ -1504,16 +1513,110 @@ void p2m_ctxt_switch_from(struct vcpu *p)
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
+     * A VMID is meaningful only on the hart whose pool issued it: generations
+     * are per-hart counters which all start at 1 and advance independently,
+     * so the pair a vCPU brings from another hart may match this hart's
+     * generation by coincidence, leaving the vCPU under a VMID which is live
+     * here for someone else.
+     */
+    if ( n->arch.last_cpu != cpu )
+        vmid_flush_vcpu(n);
+
+    /*
+     * Claim the VMID here rather than leaving it to the next guest entry:
+     * the caller makes HGATP live right after, and a stale VMID there pairs
+     * this domain's G-stage root with a tag which may already have been
+     * re-issued to a vCPU of another domain.
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
@@ -1528,11 +1631,9 @@ void p2m_ctxt_switch_to(struct vcpu *n)
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
 
@@ -1548,48 +1649,6 @@ void p2m_ctxt_switch_to(struct vcpu *n)
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
index 10d6855d913b..9bb54d030be7 100644
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


