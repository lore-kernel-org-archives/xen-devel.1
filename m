Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE1E606A330
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V4cOG7cX
Received: from list by lists.xenproject.org with outflank-mailman.1487753.1690128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXA-0007Fy-N2; Fri, 13 Nov 2026 15:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487753.1690128; Fri, 13 Nov 2026 15:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtX9-00079X-9g; Fri, 13 Nov 2026 15:49:47 +0000
Received: by outflank-mailman (input) for mailman id 1487753;
 Fri, 13 Nov 2026 15:49:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWx-0004o0-M6
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWw-004T1N-W4
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:35 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7318d-2eae-0a2a0a5409dd-0a2a45038f74-6
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:34 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7318e-fae8-0a2a45030019-d155dd2ad44f-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:34 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-49a92144733so435504f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:34 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:33 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794584974; x=1795189774; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJ1NB0qAVWa2WAtRN8CFIqTSNaAIdWfbdTCxKRwqsvI=;
        b=V4cOG7cXWAaZUqdAUecNOv7rM+dA2VTXEiq6gd4ra7sHB5ZzU6Z2B2hpqLsfmxb6k8
         iM9KXyu5jwKfRw6pijq1Fvuh4T3aNZq6X/XWLOSAC9zXZTbrxfCylNwR/aebZCswjRpa
         2xLoZ/oqdBy9RPY/OBbOEmp3X62HU+M2wjYMTlNUdRxps0bKU2XAy/G2/03OBZkv0jW8
         SKC5Fo1hTjHNIQQ2stdmN6jS9fn8If1X/QJ6raX4oKcfQDqtpAycECgzq0y8yFKp8d48
         M2ArDvmUvPTw3JbGClyssDFYuHbqi7BFu4V6VzgLjhFeUaypAmRtaMAm+EM1JefpWzxc
         X83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584974; x=1795189774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJ1NB0qAVWa2WAtRN8CFIqTSNaAIdWfbdTCxKRwqsvI=;
        b=gC0BG3kB190WCwp/CMqElKpiefZNBOlWTbqmMPWqAeLtbu9dz5tffP9vxYLllOwloj
         Etin7bi9SbAdjMTLLiuRXSFlIgVxY7wDPf9JswmAlViQxDZdMpp6HJBLu8dtNTt45hPA
         Of+8VCLWkP10FDFvaq2JTV6htruZeC3xn3iELWQWbrKX7I3fxkgpPy3dQM+pqDiXwJTl
         rCQhgYrGRUPzy0Qbj3W6EMPMrW1kMBVGiz1tW3V5pxsiEZW2wUPDZd5CNTw53n9FIQIZ
         w5Gtxsvy+69ej7VOZT9K/DFeO5F/FxcOEB+6fg7tVyhaY96/9XBaupqcVl1J19ELGe62
         D4GA==
X-Gm-Message-State: APuU4Z8zjU5aLGx+Rc4tQVCkh6lnW8bKhwzVxUPyGtMSA3si29XwHrwP
	8+MUHfymAgVVrNOFbNF2w7OeXZrI+t8oXDxUFNGkCUDGN8TQ7MceqUBSbAqScA==
X-Gm-Gg: AYBFou10xjFmeIcds3u9LpozckuKylrWS+VL29iiQc7COu71ZZZ/ooGKFtVn4mEKhQU
	0ojY5oljSm15mjGKZNTX7rqsrWquuTqbQMbO4pIT/dwP1LHmDC1y1DNpkeqgymF1FMS39V0xE1q
	P9D9GUQbmCVimenC7zYxRUWJGY8n6d0Cl3g+JRTwQPSQpj6SxMdnB3tYQSBzDdh+igH0omY2pxW
	4vPNBsFkXgeir1rAg8UPAYU2pMZpUwOlJxz06eYTaRpZLLqCmyNi5VfxAPJApbM53RYkxgr+NiU
	9Zls0FR1LOu4pEzM88afJFntfTpU34LyhD1CnrvG07jxVmbkZeq7boVv1QtLUmidvEIE3dKVCRs
	I+VBX2JKBnLQkodz1VgHklz/72L4cB4DaASj9HVXx6q1YLIoV/k5CfAC8cZ94i5WVpsuqKCyqpc
	3vEfJoGlY9i9GWXGyAtlVWJDxxjQ1qufl0MTMUjb4142vP/h4pLNTsTfXCp48GenoTAwMuSDTHR
	jvty4Q+Kls5IHatWVu15xRAMT4WdMqKGR6FkPWUha2Gp24FYh3D4lPwA5b/qDp4XG3TkY2bOmqM
	7rA5Cgg3SJmZL6YWmfRgzGllmmQ40dwEpdE15H/2gDTyYafRfyx5TcDpS8ykIUFCqngf
X-Received: by 2002:a05:6000:2f81:b0:48e:3b48:6f1 with SMTP id ffacd0b85a97d-49c736310d2mr6445377f8f.54.1794584974313;
        Fri, 13 Nov 2026 07:49:34 -0800 (PST)
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
Subject: [PATCH v4 24/42] xen/riscv: implement continue_new_vcpu()
Date: Fri, 13 Nov 2026 16:48:45 +0100
Message-ID: <7a1c54491fafd1315c9c2a1aa5b22e8b3cd318d6.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1794584974-6F4C74E9-9D298EBA/10/73395122804
X-purgate-type: spam
X-purgate-size: 7458
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

continue_new_vcpu() is the arch hook invoked the first time a freshly
created vCPU is scheduled. Implement both cases it has to cover:
 - for the idle vCPU, switch to its own stack and jump to idle_loop();
 - for a guest vCPU, enter the guest through the new
   return_to_new_vcpu() path in entry.S. It restores hstatus and
   sepc and passes the hart id in a0. a1 holds the DTB address for
   the boot vCPU (as expected by the RISC-V boot protocol), or the
   opaque value passed to SBI HSM hart_start() for secondary vCPUs.
   It then clears the remaining GPRs, sets sstatus.SPP and
   sstatus.SPIE, and executes sret.

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
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v4:
 - Split the description of the guest vCPU case in the commit message
   into several sentences.
 - Call vcpu_set_vsxl() before entering the guest, as "xen/riscv: set
   the guest's XLEN explicitly in hstatus.VSXL" now comes first.
 - Add Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>.
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
 xen/arch/riscv/domain.c              | 28 +++++++++++++++++---
 xen/arch/riscv/entry.S               | 39 ++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/current.h |  4 +++
 3 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 66fa14c89eaf..65d582aa8fe0 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -252,12 +252,29 @@ static void vcpu_csr_init(struct vcpu *v)
     }
 }
 
+static void schedule_tail(struct vcpu *prev);
+static void noreturn idle_loop(void);
+void asmlinkage noreturn return_to_new_vcpu(void);
+
 static void continue_new_vcpu(struct vcpu *prev)
 {
-    /* Avoid an unused-function error until this function is implemented. */
-    (void)vcpu_set_vsxl;
+    schedule_tail(prev);
+
+    if ( is_idle_vcpu(current) )
+        reset_stack_and_jump(idle_loop);
 
-    BUG_ON("unimplemented\n");
+    vcpu_set_vsxl(current);
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
@@ -629,3 +646,8 @@ static void __init __maybe_unused build_assertions(void)
 
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
index 1f1010e5864f..9cc5e050ced8 100644
--- a/xen/arch/riscv/include/asm/current.h
+++ b/xen/arch/riscv/include/asm/current.h
@@ -49,6 +49,8 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
 #define set_current(vcpu)  do { current = (vcpu); } while (0)
 #define get_cpu_current(cpu)  per_cpu(curr_vcpu, cpu)
 
+#define get_cpu_info() (current->arch.cpu_info)
+
 #define guest_cpu_user_regs() ({ BUG_ON("unimplemented"); NULL; })
 #define vcpu_guest_cpu_user_regs(vcpu) \
     (&(vcpu)->arch.cpu_info->guest_cpu_user_regs)
@@ -60,6 +62,8 @@ DECLARE_PER_CPU(struct vcpu *, curr_vcpu);
     unreachable();                                          \
 } while ( false )
 
+#define reset_stack_and_jump(fn) switch_stack_and_jump(get_cpu_info(), fn)
+
 #define get_per_cpu_offset() __per_cpu_offset[smp_processor_id()]
 
 #endif /* __ASSEMBLER__ */
-- 
2.56.1


