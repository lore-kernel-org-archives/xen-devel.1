Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B53C88E40
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:08:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413256.1643527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JuW-0002CH-CE; Wed, 09 Sep 2026 15:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413256.1643527; Wed, 09 Sep 2026 15:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JuW-0002C8-81; Wed, 09 Sep 2026 15:08:28 +0000
Received: by outflank-mailman (input) for mailman id 1413256;
 Wed, 09 Sep 2026 15:08:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4JuU-0001yQ-Ej
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:08:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JuT-00DoJa-Qv
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:08:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17659-e002-0a2a0a5209dd-0a2a4507ddba-46
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:25 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17669-b4ea-0a2a45070019-d155da31e086-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:25 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-c1c52d920b8so799616666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:08:25 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966505; x=1789571305; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yk8KF/HUlDCJZvlpTURbkM7U/Ti3G4IswH0NPpHEPoA=;
        b=QxoZodVZAtG29WKbXX2W0cP+45LEl/vCY9bE9pfV8GdNtQ0hUEbmdi9Kunw3LGegkf
         AbZbqty5Dj1Rn1u/3X3bagA029tPM5t8Bziaiz/9QdaWqk6foBVdeIwViF9qm9TTyeES
         C4/xkXX0BZsgrwOwYnNrngx/eUK33GuxRWahZhWARnyW/Pkvgc2q8P9h8PLxI+8EweY6
         OdDoTWyl4lXxz3z5yR2D4dQ9Jllpq3fA+DlvI9vyi+e3flRexSF89lNSjsBB+3DmZgg5
         sNVJgH1wZsVgFf81c28eTC/dXBianhei7r777L9OZPjYSHNsNsib6L4XfbPHGjKljrTf
         UpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966505; x=1789571305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yk8KF/HUlDCJZvlpTURbkM7U/Ti3G4IswH0NPpHEPoA=;
        b=iIAV2akK4K8jrtgoESaPdR9gVeWYIJTQkstRD1hfx4u42dkedCK7vh9E+Gcxv/h5Pl
         wagUxiNILaMy4caXoFXBduf6UVRwAZqh0dm4WV96ttbFyJHeX/+rmPY8AQ1PRORXwqOg
         hHgiNPXvKvyuFHEgBUzs6gF1cDrYQQu14cNRL2erH0PWGrR2oM0vXuVmhKgrXiGZEYmg
         cpGISTkzVrB8ePaIhKOPzFL80HlG6yJEsxc/ro8RKOmMvFrP+Kugu/7oJpfWyXYaFNNe
         RkuMhRvbP5QeAFsbSW1mykxucWYXjSUfwE/r2YFCZ5pDBKckV89jprCvAgxmm0Hsv5BS
         3zeA==
X-Gm-Message-State: AFuF++lywUroqMaU7h0uAMxbHbnPp798gSS4NynhoGL0TwzUI0JZYKOP
	5834H44T6Ma9biDfxwWJv8NTLdXBVWcuQ5jj9sQUqISv2g7K4WSB9AhueQxVZUTq
X-Gm-Gg: AYBFou2xtikHQnmv2mltBUihgbOZUuNEcs1bHzgjknOBfjLvNZoKaQuWkRW8awIKkf+
	pDyvEC7Pmf4vDY4QYdGHNRFEtadc6wpy3bqbLK6dbPnGzCLJ9+3NUIiFdp5ymQmoFpiJ4YEjIQy
	TNKp9un2hapy7DlCLKUgu9KlJsZC6uQFeajsLlv7BMno9ckoKg/Mtp+vtytIgOS/XQsP7SKMiVN
	0TyKAFLec8bhH0Bk0rOVBx86s70vLy18wcNarArixQq7GteoTC/RfX7eolvXCupRsGSZEiuF21W
	FEL7PpWsjpT8FMNxmcvbDuxmfblQbk+jWCRcVjOnCVr09EhTTEQwWObyJCjKJGtwL+cepyxs7Fc
	zNt2ycAJww4SAhhGZGfTo944m0SCKrtXXQagwE4AnW+kGRdlp90EelGoyDjeZLrAzENmCW7LNRI
	E+3qETK3rYItkVxonUs/m4tjmVS+uz+2M1NYfqgrWG6pzoIqC8ziuQo5NMresObqtU8fce8v+WD
	iBOCLG1hjF3wN6ILqA=
X-Received: by 2002:a17:907:3d44:b0:c27:420b:7c90 with SMTP id a640c23a62f3a-c27420ba0camr957267066b.48.1788966505230;
        Wed, 09 Sep 2026 08:08:25 -0700 (PDT)
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
Subject: [PATCH v9 08/20] xen/riscv: introduce init interrupt controller operations
Date: Wed,  9 Sep 2026 17:07:26 +0200
Message-ID: <5e0a955e030deb690f1a5f7fdd94d6ac7cee794f.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788966505-A6AD8AE4-BCD9DC0F/10/73395122804
X-purgate-type: spam
X-purgate-size: 4033

Introduce intc_hw_init_ops structure to avoid risky mix of init
function and non-init function.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5-9:
 - Nothing changed. Only rebase.
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


