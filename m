Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07DDC44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366959.1616817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPy-0006Uz-C4; Mon, 20 Jul 2026 16:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366959.1616817; Mon, 20 Jul 2026 16:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPy-0006TY-2t; Mon, 20 Jul 2026 16:00:34 +0000
Received: by outflank-mailman (input) for mailman id 1366959;
 Mon, 20 Jul 2026 16:00:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqPw-00064Z-C3
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqPv-00HTTt-Oq
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e461b-2eae-0a2a0a5409dd-0a2a4509ec1a-8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:31 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e461f-be1a-0a2a45090019-d155dd2ae865-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:31 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f6609c657so1134819f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:31 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563231; x=1785168031; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kj+Ys9sE4vz8rN4cl1XewN5jOlLycBUmGkH75Llh0pg=;
        b=VYsJj5lBqGmBbc4NKSysBqPXhjPRKfZZpp7TMehoxDEO8QB38iKr5kj42tsynBaL08
         pps/ArSaNpJ7g6q0UeWKoFpVNbykFp4BlyJJsYdt2aBzOUqMFy/1sjkFS/BYZcTGiteE
         Z/K4c5gxZBfbnNqx8nooG4SLaUPmjM1mWzLAZZBf9Ve0FtcIkxnGpeDWNf/arMFWNoMQ
         64SkQBzo7u0CxXjppHhaLwJJkjldYf6M/f50NQ9VuOAm8Iedd3jDfXIkmOzSMqx8pB/J
         kT/Rxyhg1dIrcvr2dlU585c/mMZ9cfSMus+HFFym6OxcETXybJC6sS1QUyNGeirvLOwh
         5rNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563231; x=1785168031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kj+Ys9sE4vz8rN4cl1XewN5jOlLycBUmGkH75Llh0pg=;
        b=ZEtECmR1VKuSJ0NUFezOQdov/Y6SY911fRgmY4333E7ZpbyrEgxhoQq3dTR/sdgNTO
         hQ+wwJz3lUi4pTlUdStIlcdAvHAxRw69FVbMvuCbBGmsvxcz33+WW+cd7wLbSut4q603
         vRKo0G6EM7DCeEdQ8Hns9aVMmcpZ+UpO+TxmlnGNDwqyBx+RE7fG8ZCgirK62NnFfpU6
         mONrARHIgfU6eQ6vxtDUU2c9GHx/5FnzQI6Ffb0yJ7coAxT/07YXmKfutVTGtlfwZghs
         ca3ghfh9Dw+Hrzc7++BorRswu5Kz7R+q+mO8G6VJEHvVBUPlZAc1hf2AepljlFcdsZNm
         KlqQ==
X-Gm-Message-State: AOJu0YyT0xiXz1BHaVcmS+hhzmzEktGNMy4Sl4ZUuF4BvSj2sput/75q
	8f7DAjFbAT/SsjPid070M/m6WtXFvB8efnGcb3NEN+vI2sq/WMr53H0kurlR0Q==
X-Gm-Gg: AR+sD13mqes3yplrWciHVZ8d59BdlYDez3g1/SHlGS6J0joDo/sn9IFaV2gzq/oElLm
	i6yuWX2/hZgdCLr716KSVCrS4FVbNNQzOwyQ2XNg4eCnO5wSyn7abyUO3LWzPDG3nMReLvJP9lu
	+wQ6qbILV6PNKrbAAayh0VCGxNgJIhQPh5Nd1OMZE/PjuNaAkq8kw7Kllr0mgNd9qTI+zlNlsnS
	4dGPPw6N7Ewdk3AIr+vvFnCHhIUV2yJCqOD217o2DO3owT7ZGZRRv+uAbPN12P2GJzDtSWJVq1N
	BIooqxCQV0Pd5ik/eeYiuGReR1oLbZyJUoKLASwH5kYNPtc0vLSOc9379l4MuOYKe6pRmASet+F
	rxkY2nWuwYpK5vJTawbJcMqJkCAw4Kby1GacAGuQPwvwAxs3eT5Pqey4wMVKlvHLq/aoAAZAZt3
	lWTO/65WNTnYaFYoVAetVdbv6q6K3pOvteeaZSaohzK1yyM+E=
X-Received: by 2002:a05:6000:4b19:b0:47f:28e2:d4c4 with SMTP id ffacd0b85a97d-47f623052e7mr16737852f8f.2.1784563230946;
        Mon, 20 Jul 2026 09:00:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 10/23] xen/riscv: introduce init interrupt controller operations
Date: Mon, 20 Jul 2026 17:59:51 +0200
Message-ID: <88db8417c667d027944469a4b8b8adc8e094b3b2.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1784563231-FCE14034-BABDF88B/10/73395122804
X-purgate-type: spam
X-purgate-size: 4030

Introduce intc_hw_init_ops structure to avoid risky mix of init
function and non-init function.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Nothin changed. Only rebase.
---
Changes in v4:
 - Use __initconstrel instead of __initconst for aplic_init_ops as both
   initialized fields incur a relocation.
 - Add Acked-by: ... .
---
Changes in v3:
 - Use __initconst instead of __initdata for const intc_hw_init_ops.
 - Embed const struct intc_hw_operations *ops into intc_hw_init_ops so
   register_intc_ops() takes a single pointer argument.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/aplic.c            |  8 ++++++--
 xen/arch/riscv/include/asm/intc.h | 10 +++++++---
 xen/arch/riscv/intc.c             | 11 ++++++++---
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 6a1255c5f403..126d56fb7ea8 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -306,12 +306,16 @@ static const hw_irq_controller aplic_xen_irq_type = {
 
 static const struct intc_hw_operations aplic_ops = {
     .info                = &aplic_info,
-    .init                = aplic_init,
     .host_irq_type       = &aplic_xen_irq_type,
     .handle_interrupt    = aplic_handle_interrupt,
     .set_irq_type        = aplic_set_irq_type,
 };
 
+static const struct intc_hw_init_ops __initconstrel aplic_init_ops = {
+    .ops                 = &aplic_ops,
+    .init                = aplic_init,
+};
+
 static int cf_check aplic_irq_xlate(const uint32_t *intspec,
                                     unsigned int intsize,
                                     unsigned int *out_hwirq,
@@ -347,7 +351,7 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     dt_irq_xlate = aplic_irq_xlate;
 
-    register_intc_ops(&aplic_ops);
+    register_intc_ops(&aplic_init_ops);
 
     /* Enable supervisor external interrupt */
     csr_set(CSR_SIE, BIT(IRQ_S_EXT, UL));
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 675f703ec97f..d7b34fc15ad1 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -28,8 +28,6 @@ struct intc_info {
 struct intc_hw_operations {
     /* Hold intc hw information */
     const struct intc_info *info;
-    /* Initialize the intc and the boot CPU */
-    int (*init)(void);
 
     /* hw_irq_controller to enable/disable/eoi host irq */
     const struct hw_interrupt_type *host_irq_type;
@@ -43,9 +41,15 @@ struct intc_hw_operations {
     void (*handle_interrupt)(struct cpu_user_regs *regs);
 };
 
+struct intc_hw_init_ops {
+    const struct intc_hw_operations *ops;
+    /* Initialize the intc and the boot CPU */
+    int (*init)(void);
+};
+
 void intc_preinit(void);
 
-void register_intc_ops(const struct intc_hw_operations *ops);
+void register_intc_ops(const struct intc_hw_init_ops *init_ops);
 
 void intc_init(void);
 
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index ea317aea5ad8..3600d23bdb5b 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -12,9 +12,12 @@
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
 
-void __init register_intc_ops(const struct intc_hw_operations *ops)
+static const struct intc_hw_init_ops *__initdata intc_hw_init_ops;
+
+void __init register_intc_ops(const struct intc_hw_init_ops *init_ops)
 {
-    intc_hw_ops = ops;
+    intc_hw_ops = init_ops->ops;
+    intc_hw_init_ops = init_ops;
 }
 
 void __init intc_preinit(void)
@@ -27,7 +30,9 @@ void __init intc_preinit(void)
 
 void __init intc_init(void)
 {
-    if ( intc_hw_ops->init() )
+    ASSERT(intc_hw_init_ops && intc_hw_init_ops->init);
+
+    if ( intc_hw_init_ops->init() )
         panic("Failed to initialize the interrupt controller drivers\n");
 }
 
-- 
2.54.0


