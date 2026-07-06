Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918E0C44500
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 15:58:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355508.1610375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliR-0001Se-Rn; Mon, 06 Jul 2026 15:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355508.1610375; Mon, 06 Jul 2026 15:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliR-0001Ri-Dw; Mon, 06 Jul 2026 15:58:39 +0000
Received: by outflank-mailman (input) for mailman id 1355508;
 Mon, 06 Jul 2026 15:58:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliP-000153-Qv
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliP-009ym5-7d
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd091-e002-0a2a0a5209dd-0a2a4504c49a-32
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:37 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0ad-a01d-0a2a45040019-d155802ac59b-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:37 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493c7902f47so19401775e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:37 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353517; x=1783958317; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj+Ys9sE4vz8rN4cl1XewN5jOlLycBUmGkH75Llh0pg=;
        b=HHO5pSUDR8XRC3uNaXFFgnpkOp5unJL2/AUlFMiJkNs7QHQjZIk+dXMF74XvufTNQJ
         vMTgABIE13epbo/xgsyPypJidOYGY2fqk+3WFPdclHDdMxZGyWd885+KmC85j91x3Ljy
         hqVcIDkWFF0TVuz7PoMmxO+RIw38Q5t587DakIU5rcPkXoRIwFEF3WIUgHmcoOK9Y4K5
         g0xggvau4v7X0eeQSxj9O8Xy6F1yfgOzr7NTJWWpnF1s8tyjOYsSA602vVEG/LY1mrJf
         6UTOjV1iTyRstoEDfvqbo/Xjm1LqSX00SnSXfkKa7NeCqc0oRYIM0xWG3BzeoSG25yW1
         HsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353517; x=1783958317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kj+Ys9sE4vz8rN4cl1XewN5jOlLycBUmGkH75Llh0pg=;
        b=kAxchOgmM0C88qKRaNnttzGPMOQrtfXrVISZarMujvtBEBvMLv0Y18btXNUvY08Chs
         CFE/9xYheMUuJiWdPOfaZobmA07Ne0DkrBAlUKgzENn84Mt+Uat5138FUY6mul2Xyu5a
         TnrBGIlllPuz3in7F2fKyJk7esZv7Lwhl9fpbR9AgmQDJXKRWqY4eHzLPGEQLwLYuv9Z
         jgGgTBO7Xg18AlAMOvm050JeNgAmnMRD7Hg4rtQf4PTsD+8ZgBWlfLQW7fiBRlJHgFfi
         GeWDvv7GvHQLUUBxprBMqasixn17OD6OPmz8DONoWOkPM4m2zLBw6Er70D0tPFpdnqlL
         xb+g==
X-Gm-Message-State: AOJu0YzNwTZeNHrvV6rEb8LC+tUr8nXg8GPJZf8R4/hbxUgHwsD0JAP2
	N6UmG689kqn/QFIzMESjQW1zRP6rkl5G2VPNP2Zu/RSzC+ZSv8rZdy9z+rrmUw==
X-Gm-Gg: AfdE7ckad8bajmWOWbJuWrFm4yuxucsiAM1FVZ9LDk5trsHErHoEvKgl4IbuUklXYeo
	NWpGHrj0e7czBhbOtzQV+TAzJ527RFoEKPG09ixqdSEPK+rkVEQENCbtyRZugS0G01MnxSq+L+U
	zITPGpxoviQnmmzRNfjKm8c4BMrXz5ra5oQ136g+Fa/MpV64yQBakyHamiglGC01WadKb0WQcRx
	R/UbJLhiDnBe+k5ddIAyAtCqT6xWAxM1luhBBMIrhtYi2I9QEomK4wo+udIgcbdvmMkzMN6mOIe
	3aFTU0fK0ejVf90CnWPZEPAY3X4r0jdTY8/B2NSznXea3wZA0qW1v6C+cKMBnOeFPt0FcyOCijL
	nXIqwgg59HyF3nRStKDtuiguLX8cLM6N040c2YL/OMpH3dj+5ii6tIdgtK7LJiBWllMtNLn4BAU
	y/81WItINHuiOFeUWiMmrBSsg5atbkzYqJ+gf0u7if7YxMgg1JLXgQlTwW4Q==
X-Received: by 2002:a05:600c:19d1:b0:493:cc25:85c4 with SMTP id 5b1f17b1804b1-493df1c98fbmr9609605e9.8.1783353516591;
        Mon, 06 Jul 2026 08:58:36 -0700 (PDT)
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
Subject: [PATCH v5 13/26] xen/riscv: introduce init interrupt controller operations
Date: Mon,  6 Jul 2026 17:57:54 +0200
Message-ID: <bd47e6cec1c4fa4f3419f5258ecd03d18386c45e.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1783353517-AEF2D1CC-0B056E72/10/73395122804
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


