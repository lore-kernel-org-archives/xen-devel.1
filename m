Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D67BC61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:23:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401032.1636858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwL-0002Xp-Ng; Thu, 27 Aug 2026 15:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401032.1636858; Thu, 27 Aug 2026 15:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbwK-0002Su-Ic; Thu, 27 Aug 2026 15:22:52 +0000
Received: by outflank-mailman (input) for mailman id 1401032;
 Thu, 27 Aug 2026 15:22:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbw5-0007lh-Ti
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:22:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbw5-003O3L-8V
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:22:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905626-e002-0a2a0a5209dd-0a2a4501aa5e-32
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:37 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90563d-5984-0a2a45010019-d1558036f024-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:22:37 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so22305995e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:22:37 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:22:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844157; x=1788448957; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FUxAqwWcnc2Ay1jeD5JiD2529ILkdTEuy10fqJCXM0=;
        b=YdFjGfQmXz5SJHxaKpa05ARMIRGvgNBHC+UZpLe/KYBqzhahptWwMGm9uM/ZvL2R1f
         ebiaPVUiVmn08nnpAZOzBJYby1IfhBNXJ+axoqbWtEWPLiKZXYzTmZmKQKHcVRVADmYR
         XlsUiD3zBmSH726JK5oCJtwEJUEpUHaY4KpswrhOvd4xtJDIMVlsfhNq1wHHeoNS+1Wh
         dJK4w0a0a0/E3+XxW9hrOTLUxgx3/dYFAP6yebMlkXmOsl0cXsGOJcZT4mSH1qcSRP0E
         GX2bmiFx6Vp7BVvxqZvyblZvE3KQrVdfsIBlNE3R0kK6T3JKlosNcsxtQmx+GpxS9G8w
         sz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844157; x=1788448957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6FUxAqwWcnc2Ay1jeD5JiD2529ILkdTEuy10fqJCXM0=;
        b=eoporww5xRhKBQE2klxuceTpAFebzhhuEvjflsnyazs73a1OgS9yh70dy8fEvYE3/s
         qF6h9fnEx6PM3H1l+DuVLBqLzGMBdw0G22tfK9/RkatI+6MmJmOaX4XBkeXFPwLT76pE
         IR1f/4vhMZ0BAZeJG/h/72lVo/XQfN7yUJzhMRqeDAtM4M3BBSF/+hL5ThrT2t8GtW3Z
         Frouk8aJ+NjWNr5QRutdPDPBnW9TUTlQIYUXNJ+CwCRcJKJ9540tQXIXmcTce0qxuoW/
         lqeGhUcp8CpNgRX27c4ceP3AwRiBQStVrfYUlFoZsvGJE+6cUbuxAtFlmuBw2mScOHzI
         wVXQ==
X-Gm-Message-State: AFuF++mf/dCu+PaJ9hymzrUW4Ns93cHJhaiy220GAPxlshKJge5gqaPS
	Y9uMVUnVr7AhZfP6PkKkqbZNvODr+bebcxhNFbRcuEmCXYYWrUU2wwgPtxxHsQ==
X-Gm-Gg: AR+sD11jqA/TnlvFhTytKlClmoqWn/QFQlphtp9VugXcUexAkJsPfqzz5zQlvIbVhtZ
	+ax3nXIP3LMJl+aFRilrCt44UMT0N5F+5gwdXnZTOzRIrmDw8crGeu9LHu/lYlxd++pDG3kVqlt
	4K6JSdxCl2VfL/jHhbxJLKYaFW94R1Hk3n7knZh59BnuSv6dAQLTfeHqyXFW36dWCX/9Oq+F1hO
	/eyw0+k1db185o3A5qcMz/og2UOCNGGp9g6gFIdecWvgUh111OY6Gn6zDF5mFWosk87e8zOkHyO
	Tc0XKs2k03BKk9vhA7Oyholr+MSLrAN+PZkX11lbMyFqJv/DHYOE2X7jZ5EAARyYHliA9RCW0L1
	X/gtyoBnjJN2s2QUR25YCvyyOlDq49DizVRVZpJ0vb8y4lEYuGL0Ugu5GGiIgTfDKQDUGboArOI
	pydfqUI+7A5Q/p38KITO8wIwRw7tQEwH42Ea08Zc4f+s/vH/lHJgMTVJOi9PC16GkmogAoR8wJA
	gNSaGPMKhvkiQvNwJVoRJZy4kTSiIfW
X-Received: by 2002:a05:600c:3144:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-499dc72548dmr187765125e9.10.1787844156618;
        Thu, 27 Aug 2026 08:22:36 -0700 (PDT)
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
Subject: [PATCH v2 38/39] xen/riscv: implement continue_new_vcpu()
Date: Thu, 27 Aug 2026 17:21:22 +0200
Message-ID: <a282887cc08cd9b05f59d46cab9377915e83c61d.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787844157-BE664757-AFC1CA69/10/73395122804
X-purgate-type: spam
X-purgate-size: 6071

continue_new_vcpu() is the arch hook invoked the first time a freshly
created vCPU is scheduled. Implement both cases it has to cover:
 - for the idle vCPU, switch to its own stack and jump to idle_loop();
 - for a guest vCPU, restore hstatus and enter the guest through the new
   return_to_new_vcpu() path in entry.S, which loads sepc, passes the
   hart id in a0 and the DTB address in a1 as expected by the RISC-V
   boot protocol, sets sstatus.SPP and executes sret.

Interrupts have to stay disabled across the restore. The trap entry
logic implicitly clears hstatus.SPV, so an interrupt taken between the
write of hstatus and sret would make sret return to HS-mode instead of
VS-mode, and restoring SPV afterwards is non-trivial. Instead interrupts
are simply kept off and sstatus.SPIE is set, so that SIE is restored from
SPIE once sret has been executed. Also, it follows what hardware will do
with real CPU which is also started with interrupts disabled.

Introduce get_cpu_info() and reset_stack_and_jump() in asm/current.h,
needed by the above. get_cpu_info() is a macro rather than a static
inline because asm/current.h is pulled in by <xen/percpu.h> before
this_cpu() is defined and before <xen/sched.h> completes struct vcpu.

idle_loop() is added as a stub on purpose; its real implementation will
come separately later.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/domain.c              | 44 +++++++++++++++++++++++++++-
 xen/arch/riscv/entry.S               | 23 +++++++++++++++
 xen/arch/riscv/include/asm/current.h |  4 +++
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 29181968224c..0782148b7207 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -8,10 +8,13 @@
 #include <xen/smp.h>
 #include <xen/vmap.h>
 
+#include <asm/aia.h>
+#include <asm/aplic.h>
 #include <asm/bitops.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/current.h>
+#include <asm/imsic.h>
 #include <asm/intc.h>
 #include <asm/mmio.h>
 #include <asm/riscv_encoding.h>
@@ -140,9 +143,43 @@ static void vcpu_csr_init(struct vcpu *v)
     v->arch.hie = MIP_SGEIP;
 }
 
+static void schedule_tail(struct vcpu *prev);
+static void noreturn idle_loop(void);
+void noreturn return_to_new_vcpu(void);
+
 static void continue_new_vcpu(struct vcpu *prev)
 {
-    BUG_ON("unimplemented\n");
+    schedule_tail(prev);
+
+    if ( is_idle_vcpu(current) )
+        reset_stack_and_jump(idle_loop);
+    else
+    {
+        /*
+         * During a context switch to a new vCPU, interrupts must be disabled
+         * to guarantee that the vCPU's CSR state can be safely restored into
+         * the hart without being clobbered by an interrupt trap.
+         *
+         * For example, when return_to_new_vcpu() finishes, it executes sret.
+         * At that point, the hart checks hstatus.SPV=1 and sstatus.SPP=1 in
+         * order to return from HS-mode into VS-mode. If an interrupt were to
+         * arrive before sret, the trap entry logic would implicitly clear
+         * hstatus.SPV to 0. Correctly restoring it afterwards is non-trivial,
+         * and if left as 0, sret would incorrectly return to HS-mode instead
+         * of VS-mode.
+         *
+         * To avoid this, interrupts are kept disabled during the restore.
+         * Additionally, setting sstatus.SPIE=1 ensures that after sret is
+         * executed (as sstatus.SIE will be loaded from SPIE), HS-mode will
+         * continue to receive interrupts normally.
+         */
+        local_irq_disable();
+        csr_set(CSR_SSTATUS, SSTATUS_SPIE);
+
+        csr_write(CSR_HSTATUS, vcpu_guest_cpu_user_regs(current)->hstatus);
+
+        reset_stack_and_jump(return_to_new_vcpu);
+    }
 }
 
 int arch_vcpu_create(struct vcpu *v)
@@ -551,3 +588,8 @@ static void __init __maybe_unused build_assertions(void)
      */
     BUILD_BUG_ON(offsetof(struct cpu_info, guest_cpu_user_regs));
 }
+
+static void noreturn idle_loop(void)
+{
+    BUG_ON("unimplemented");
+}
diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
index 331446a238d3..bf1843dcea4f 100644
--- a/xen/arch/riscv/entry.S
+++ b/xen/arch/riscv/entry.S
@@ -143,3 +143,26 @@ FUNC(__context_switch)
 
         ret
 END(__context_switch)
+
+/* t0 is used as a temporary reg and is clobbered to oblivion */
+FUNC(return_to_new_vcpu)
+        /* Swap tp with sscratch */
+        csrrw   tp, CSR_SSCRATCH, tp
+
+        /* Set vCPU registers */
+        REG_L   t0, CPU_USER_REGS_SEPC(sp)
+        csrw    sepc, t0
+
+        /* Hartid goes to a0 */
+        REG_L   a0, CPU_USER_REGS_A0(sp)
+
+        /* DTB goes to a1 */
+        REG_L   a1, CPU_USER_REGS_A1(sp)
+
+        /* Set guest mode to supervisor */
+        li      t0, SSTATUS_SPP
+        csrs    CSR_SSTATUS, t0
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


