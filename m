Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EE8CA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:25:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437596.1656691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx70-0002TL-29; Wed, 30 Sep 2026 16:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437596.1656691; Wed, 30 Sep 2026 16:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx6y-0002NE-FG; Wed, 30 Sep 2026 16:24:52 +0000
Received: by outflank-mailman (input) for mailman id 1437596;
 Wed, 30 Sep 2026 16:24:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx6p-0000bq-Oa
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:24:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx6p-006O3H-2d
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:24:43 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37b5-e002-0a2a0a5209dd-0a2a4504eab8-32
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:43 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd37ca-b57f-0a2a45040019-4a7de18ce73f-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:24:43 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd5462b69so31527245e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:24:43 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd43e66sm14620485e9.2.2026.09.30.09.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:24:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785482; x=1791390282; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWiAmxyzdWnK+3Rlqd9CZyRkkOQevWr8yh/AlAvntb0=;
        b=G6WhtVJfpjIfikOyDt4rUCMcKnFz09ravKCvo9qZZ75U+Ba87kPyDj41nE25I2MqHw
         voJ1awlkScf5h0Iz/uR1i9ZjebQrM8kTzyaKOq0Z4mBP9k1dJFZyfkZhW4U3lRdCa/qH
         CVVZMDMWU/kb95DTYV7vXiq96/dr1pAgCBdBN6xSqHp0sBvMXxj3QZKBXIDKK3cAtfyC
         2wkfXwh/ezhs3oM956cXhrFGhujC9gO+BzX5MByL2OLlg7K+fNi8ytF4BjUZS+72O5SW
         6bc88ma9i6ij1z6f5fcp+p91EuXELPs8FNf9zQnuyRbcaNatU7An4Co1Y9k+coujZUAP
         roQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785482; x=1791390282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWiAmxyzdWnK+3Rlqd9CZyRkkOQevWr8yh/AlAvntb0=;
        b=NAje1rUmlC6og2nJMux+mKy3LAr4Rvr3z3BDYZ0TmTkkZiX1B4h7Lq2EMn27VSiiWy
         CuD6WjCy9YQK1axgyzaGkfnm9M8qelmmeQxcRNG+XVUUokEevfajBQzY9QgYYWKCNdCA
         kXfSsZHSnjKfw9Iy0SWAAjq5AtgnVwAZKktdNrMvSNQUE+aHuyTCQyihzkjKKy7O8G6O
         nImPlr07j6jmmpWgHh8JThOXbiknQEOZ5zq7hT9FTCrMBkjwYZEnm92h+kuAINWjfAkr
         JuTUVuZnVts7pR3a/luFrFhp414cKNFTSGdStERCgcqikkDtwdtcrX0y5yPaSXQe+MZd
         WZlQ==
X-Gm-Message-State: AFuF++m8N6Pc8H40UcTOqbPtkIDmBmS/s47bJuWt65W2bf0VVv/ei7b9
	LCY7iB1AIjFCLA5Pfgvh8yVis/wZnALsEHeyddMdBTsUj3NfmccASmrf1fQC2g==
X-Gm-Gg: AYBFou04fETDNRZL3/IcSiJQZe070NhXoGCC7NcF8MQrBSaBRv5G1pTK+btNbZY6/4w
	reacbzJ9P3Vaj5LcyO1ZLtIXmeElre6DDwbnIV/OjvEpRBx4sj8WKuu0NFiQICaM6ip6HEV4Uqr
	xhiqKyzd31vJsAN2AMl7unD4++89QgjVmAIcVvaXkmtZh23YocL/9TKXREXttbceAzZLr7ghbRj
	02QlSRV27Kgq+uQp53XbjaGtsTwAguYLU8fahcfXgPPpBGsxkgjHdEMuvxv9UGtsFwnRaV5rbMm
	Dqqim1ff21uZseiq6+ZaGHHiK1YJOi74dkAzEnODzVaVB2DEbiUBXIvmbKr6V8YN66k+pSQp31Z
	ksq/Sv+NTg5YRoukAyej+cHFBNrc8ELhr8O6+lqzxdZitKPF4qwJFqi086YdQ0C0buzkEApfzuV
	hfkBbyPpQwV5JmPz5nJ4/oBbvMAje1h7PA0AlsWolmu7vNf/oomIjXjvuVsF0nhDrBaRRWgSty0
	kD/TSp2yJwcfuPKObi4XNRcrSbljGhe2BWDBN+z
X-Received: by 2002:a05:600c:4512:b0:4a0:136d:f721 with SMTP id 5b1f17b1804b1-4a01b00c143mr35331685e9.17.1790785482287;
        Wed, 30 Sep 2026 09:24:42 -0700 (PDT)
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
Subject: [PATCH v3 37/39] xen/riscv: implement continue_new_vcpu()
Date: Wed, 30 Sep 2026 18:23:56 +0200
Message-ID: <0d254188c7f21c88ef1982dc9c5810f7b503e38e.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790785483-587C6B50-2BCFDBB8/10/73395122804
X-purgate-type: spam
X-purgate-size: 6951

continue_new_vcpu() is the arch hook invoked the first time a freshly
created vCPU is scheduled. Implement both cases it has to cover:
 - for the idle vCPU, switch to its own stack and jump to idle_loop();
 - for a guest vCPU, enter the guest through the new
   return_to_new_vcpu() path in entry.S, which restores hstatus and
   sepc, passes the hart id in a0 and, in a1, either the DTB address
   (boot vCPU, as expected by the RISC-V boot protocol) or the opaque
   value passed to SBI HSM hart_start() (secondary vCPUs), clears the
   remaining GPRs, sets sstatus.SPP and sstatus.SPIE and executes sret.

The remaining GPRs have to be cleared as sret neither switches stacks
nor touches the GPRs: the guest would otherwise start with Xen's values
in them, sp pointing to this vCPU's Xen stack among them.

Interrupts have to stay disabled across the restore. A trap taken in
HS-mode overwrites hstatus.SPV, sstatus.SPP and sepc (trap entry clears
hstatus.SPV in particular), so an interrupt taken between the write of
hstatus and sret would make sret return to HS-mode instead of VS-mode,
and restoring them afterwards is non-trivial. Instead interrupts are
simply kept off and sstatus.SPIE is set, so that sret re-enables them
by restoring sstatus.SIE from SPIE.

Introduce get_cpu_info() and reset_stack_and_jump() in asm/current.h,
needed by the above. get_cpu_info() is a macro rather than a static
inline because asm/current.h is pulled in by <xen/percpu.h> before
this_cpu() is defined and before <xen/sched.h> completes struct vcpu.

idle_loop() is only introduced as a stub.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Drop unneeded inclusion of asm/aia.h, asm/aplic.h and asm/imsic.h.
 - Mark return_to_new_vcpu() declaration with asmlinkage.
 - Drop the "else" after reset_stack_and_jump(idle_loop), which cannot
   return.
 - Move the restore of hstatus and the setting of sstatus.SPIE from
   continue_new_vcpu() to return_to_new_vcpu(), so that everything sret
   depends on is set up in one place, and shorten the comment in
   continue_new_vcpu() accordingly.
 - Move the tp/SSCRATCH swap out to a separate patch, as nothing reads
   SSCRATCH yet.
 - Reword the comments in return_to_new_vcpu(), which suggested that
   the values of .a0 and .a1 are established there.
 - Clear the GPRs which are not meaningful to the vCPU being started
   before sret, so that Xen register values are not exposed to a guest.
 - Update the commit message: a1 carries the opaque value passed to
   hart_start() for secondary vCPUs, describe the clearing of the GPRs,
   drop the comparison with a real CPU and the reference to a later
   implementation of idle_loop().
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/domain.c              | 25 +++++++++++++++++-
 xen/arch/riscv/entry.S               | 39 ++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/current.h |  4 +++
 3 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 6cb762bee33c..04be628dcdb4 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -138,9 +138,27 @@ static void vcpu_csr_init(struct vcpu *v)
     v->arch.hie = BIT(IRQ_S_GEXT, UL);
 }
 
+static void schedule_tail(struct vcpu *prev);
+static void noreturn idle_loop(void);
+void asmlinkage noreturn return_to_new_vcpu(void);
+
 static void continue_new_vcpu(struct vcpu *prev)
 {
-    BUG_ON("unimplemented\n");
+    schedule_tail(prev);
+
+    if ( is_idle_vcpu(current) )
+        reset_stack_and_jump(idle_loop);
+
+    /*
+     * return_to_new_vcpu() sets up hstatus.SPV, sstatus.SPP and sepc so
+     * that sret enters the guest in VS-mode. A trap taken in HS-mode
+     * overwrites all of them (trap entry clears hstatus.SPV in particular),
+     * so interrupts have to stay disabled until sret. They are re-enabled by
+     * sret itself, as return_to_new_vcpu() also sets sstatus.SPIE.
+     */
+    local_irq_disable();
+
+    reset_stack_and_jump(return_to_new_vcpu);
 }
 
 int arch_vcpu_create(struct vcpu *v)
@@ -519,3 +537,8 @@ static void __init __maybe_unused build_assertions(void)
 
 #undef CHECK_GPR_INDEX
 }
+
+static void noreturn idle_loop(void)
+{
+    BUG_ON("unimplemented");
+}
diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
index 017fbb06262c..99bc0f4974c2 100644
--- a/xen/arch/riscv/entry.S
+++ b/xen/arch/riscv/entry.S
@@ -147,3 +147,42 @@ FUNC(__context_switch)
 
         ret
 END(__context_switch)
+
+/*
+ * Enter a vCPU for the first time. Must be called with interrupts disabled,
+ * see continue_new_vcpu().
+ */
+FUNC(return_to_new_vcpu)
+        REG_L   t0, CPU_USER_REGS_HSTATUS(sp)
+        csrw    CSR_HSTATUS, t0
+
+        REG_L   t0, CPU_USER_REGS_SEPC(sp)
+        csrw    CSR_SEPC, t0
+
+        /* .a0 holds the hart id */
+        REG_L   a0, CPU_USER_REGS_A0(sp)
+
+        /*
+         * .a1 holds the DTB address for the boot vCPU, or the opaque value
+         * passed to SBI HSM hart_start() for secondary vCPUs
+         */
+        REG_L   a1, CPU_USER_REGS_A1(sp)
+
+        /* Return to (V)S-mode, with interrupts re-enabled by sret */
+        li      t0, SSTATUS_SPP | SSTATUS_SPIE
+        csrs    CSR_SSTATUS, t0
+
+        /*
+         * sret doesn't switch stacks and leaves the GPRs alone, so every
+         * register which isn't meaningful to the vCPU being started has to be
+         * cleared here: otherwise the guest would see Xen's values, sp (this
+         * vCPU's Xen stack) and ra among them.
+         */
+        .irp reg, ra, sp, gp, tp, t0, t1, t2, s0, s1, a2, a3, a4, a5, a6, a7, \
+                  s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, t3, t4, t5, t6
+        mv      \reg, zero
+        .endr
+
+        /* Enter guest */
+        sret
+END(return_to_new_vcpu)
diff --git a/xen/arch/riscv/include/asm/current.h b/xen/arch/riscv/include/asm/current.h
index 78ec52fd8a35..f8babcc3d926 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -47,6 +47,8 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
 #define set_current(vcpu)  do { current = (vcpu); } while (0)
 #define get_cpu_current(cpu)  per_cpu(curr_vcpu, cpu)
 
+#define get_cpu_info() (current->arch.cpu_info)
+
 #define guest_cpu_user_regs() ({ BUG_ON("unimplemented"); NULL; })
 #define vcpu_guest_cpu_user_regs(vcpu) \
     (&(vcpu)->arch.cpu_info->guest_cpu_user_regs)
@@ -58,6 +60,8 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
     unreachable();                                          \
 } while ( false )
 
+#define reset_stack_and_jump(fn) switch_stack_and_jump(get_cpu_info(), fn)
+
 #define get_per_cpu_offset() __per_cpu_offset[smp_processor_id()]
 
 #endif /* __ASSEMBLER__ */
-- 
2.55.0


