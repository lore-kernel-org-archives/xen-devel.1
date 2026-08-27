Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F95C61DD3
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:20:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400817.1636422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtD-0004rw-QR; Thu, 27 Aug 2026 15:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400817.1636422; Thu, 27 Aug 2026 15:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbtD-0004qs-Lj; Thu, 27 Aug 2026 15:19:39 +0000
Received: by outflank-mailman (input) for mailman id 1400817;
 Thu, 27 Aug 2026 15:19:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbtC-0004XF-6W
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbtB-00C6ki-Jo
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:37 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905589-2eae-0a2a0a5409dd-0a2a4502d400-2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:37 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905589-6ca4-0a2a45020019-d155dd34b1c0-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:37 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47fd66a094eso761505f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:37 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843977; x=1788448777; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rqqgtz0m8ycDrWJfyzyeS5VceMq0RnmIpD0J8gdZ2Y=;
        b=FRfjztLMxlgh4cCv5ujKMNq3pZi9G6EjYVsj0dPLaKFlUbhc+xGoLgQ8uHpnAmNSgj
         MfXfL9acJ9Pdr+JEZl3OpZqex5EGntJgt0vkWCPKgqm+OjxVAfTshnQz/KbagC/w3WlJ
         3fuk+UaNxtADu90rLSTw0PsYHp3BESizecerrnebZanCxr/1a32aZEgm7wBLs4POeCaF
         T9OMtrK9mFuVlLNOncKpsyBwEa1izH11SqjZpT8v4s9EbVCmFZXPnKo18HB2AOmQXiWu
         /U2uTSHdkALlrl4TpLByrwwNKcv8d78085oZDGXyZV3az8e0kAdmX/nT7kG9AF6nWI28
         aWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843977; x=1788448777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2rqqgtz0m8ycDrWJfyzyeS5VceMq0RnmIpD0J8gdZ2Y=;
        b=RZXY2yP+qz+t5iP7RqcayGQ+icQ1tgKAxdcIC+9gY3hURwRoDK76ZMYMpiHl02RhDO
         yfez4tu1ZT546Z41Jz4s2+8Wy7Gb/N4NWouN8MGYokMlOAL0tGD2Gd9tzt18n50Yg70Q
         a8qinSBvoDv3aUbsoYsqAbnA+Fasfy9U1sJYdA6h+nzyC5d6uvz/5pWbtDfwN7f0Qgxj
         H+POOFtgc985+XGAcmj5ttqAcIt+nILnapOroe5VKSbiOaQy3Gs8iSmveH9DZZxQMgiM
         M49lvBPi3jk/3j6zg0I1U5Nw4SOx3gDRF8JKzEl2gxXPRTRgfiDHd6rZhtrRU81SzUmi
         Gg8g==
X-Gm-Message-State: AFuF++n285LOEDuIfF2QV2/6d5Zy0iciwPR8aRdHBu4q4pMz5FVV/1Br
	otLk5cPVK4hpRSyfgWbLJ5b/dZo1Wd/LlfwcTq0yWKk+cs4CI8PXeG0IWD6MAw==
X-Gm-Gg: AR+sD13JV27QCpxQ5caVLGvZQgKpA12nm0mOam5BdcS7WyrXmG1vN0TBxj1u9B0loEI
	9Vp/2irdvPb9KyHDu5GkmizZW4ePLwZWR5C2+6JooeOywgYSpB9epZjuNOIfmd9qebl+FsIYuTr
	QL2pyOLSo3TZ4rix1za7FGPvDj2c7XEWfAmS+Ktmtq4N8SlcN8B8k0A4qtNEE4Af4+7fM9N9UzX
	be6imu11HBIZOOvWVMbwqg6yMS2NPpo22zY8LIPDWQ498FfgqvyvhF+7ZSmkKV27K0RUrKdrF3R
	8Atb/jlBz6gFAVplS5NPNYHAS3s0ImdarflraONIfR5gGqmJxUgSU2+Ugl9Fx1L7fI8ni5ovEs5
	UuIves4YC0sagfsxhTpFJS80fBdJYy0jebB/lWl02tjmHO865eh/Vm+B7X02YLz6FmtMo5lJpSH
	3V40qziL0pgGNOqalnWtC1a88A/lF+KIXGfodqxKSaLFzdv85BD1dI9QRsUwZvujmgHZO3/Bfo6
	Db0jDC+lLZRNSE5cCEiTaulKncLwb49
X-Received: by 2002:a05:6000:71a:b0:482:e4bc:51a7 with SMTP id ffacd0b85a97d-482e4bc5337mr20087141f8f.11.1787843976925;
        Thu, 27 Aug 2026 08:19:36 -0700 (PDT)
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
Subject: [PATCH v8 08/20] xen/riscv: introduce init interrupt controller operations
Date: Thu, 27 Aug 2026 17:19:01 +0200
Message-ID: <7eba48417bb5f5329a054e4bcccabc5139e13dd0.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787843977-F36BF2AC-35DFB46B/10/73395122804
X-purgate-type: spam
X-purgate-size: 4032

Introduce intc_hw_init_ops structure to avoid risky mix of init
function and non-init function.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5-8:
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
index 9f023db5d525..d08401db46b3 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -325,12 +325,16 @@ static const hw_irq_controller aplic_xen_irq_type = {
 
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
@@ -366,7 +370,7 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
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
2.55.0


