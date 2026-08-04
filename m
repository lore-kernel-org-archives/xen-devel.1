Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A12C561F8
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382269.1625676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNX-00005D-Iv; Tue, 04 Aug 2026 15:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382269.1625676; Tue, 04 Aug 2026 15:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNX-0008VU-7C; Tue, 04 Aug 2026 15:48:31 +0000
Received: by outflank-mailman (input) for mailman id 1382269;
 Tue, 04 Aug 2026 15:48:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNV-000889-ID
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNU-009QHz-UW
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c8-5cb7-0a2a0a5109dd-0a2a450bdaba-10
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:28 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209cc-b7e8-0a2a450b0019-d1558033b807-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:28 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so36542205e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:28 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858508; x=1786463308; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebyF9U3D/MvFmcX3JXdHMfkwonGwN8CEi9ANlVWdpho=;
        b=cX/6V6ybntMPMEf/atcWFMKZPIuvZ6LUlu0I1s+X/rguGNPs9RXhaj5p189ilgD6e/
         Eh5UpzFMd8lKbZPqDxOFidX7Ztta4TMjtUy+PwnY8LmYV/3919QN4dIR6YyOFpAJyq5H
         K7cO11KxobVpW90IqXXGHmPnx8CW4Lzq6uYpbe1JobY5QrHE/BPYvmEMDkCoUTABZhal
         Z67JsxG/5Pjru1A9cOy83Liku4fd7UYUdR2sjvxeTeJSXxgljbOMIHije/CdWNRBKJJq
         nXmofN0yjhAlgJwyCOYsvdXmsRzk+H62Psfs8bwfvxyZYh2BTy0I3EX295B95GOqaiQO
         N/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858508; x=1786463308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ebyF9U3D/MvFmcX3JXdHMfkwonGwN8CEi9ANlVWdpho=;
        b=LE/pIyY1ZHKPYxDnpqWVqvsG90Rw1BpHkFHJ0nZFM2sQACak9E2b+SewmFMdmArPM8
         pkMfcieZnUpHeMjK0GeQ5X9IQRccYhIMXIrRkTs22UC0LkRl51vaI57EcYST/ybOpIXW
         aolHhr5sxPxYOcVjEmAX48KpjAj+vLre8SGLV9v/fC2t9IXxGvjzi7okdk6Nt2Pgjfac
         a8hiJhqHXtp7aOzeE/0j1bEJ8brXsDTxEfbQcr21b4ecLnBRD3l2WwzbIgsbpdRN6MtG
         0wq2COXQQeDPg++wzqVfEXOXToEuM0yndZtF8Fzola3MYQDq9X3z8HkJBlV2w9rAPxA0
         rM5g==
X-Gm-Message-State: AOJu0YywabMODMY7xeBJtxvhNfHwz0QDs5jSviSkSVrOB+SIyr1tl1QJ
	nyWRg+3Oc59MavNqaukYlxyqDWFULjNJmOpsTtX3oBO/vrDWc4HK+85cmdyCLw==
X-Gm-Gg: AR+sD11H9xPPpHxSA1ubHCEqpFM/tQZJo+kxEwQpBoV84ES+B1Iv4ezvoY1ZQm0yLGB
	uCwGvM2GdrWx4S8h5YRVCrwh87wTfzzPK7PE18gLYrw91Bd++OEKl5/uqGYmodWDkyyleC6zZHJ
	Aww7RPjdV3ayyBTBtWY2RWq5nEFH9EzNzNVDFVnnOYnlayFt2sH7sxb0wzxYys9VolueZ5nS5ux
	laB88PpSGjuKXnY17JXrM2QuboZgODj1HCApUnoPwBArIzRvQrEdTJpbF28jNs+dtmwyBQF0+Pr
	rHo2mEkybMmu1J6yOEQyVQ5GG/XA3bbq31bZd7ulOYElUZf6pt94UGiPUFm72/ILnkmna9cG7RU
	ZruROax/qm0YkKehHrdf+mdkXCSS+pbjH/yI6IksLgx91bakzLG37Nox5qYcGUP0CLVQ81tlpoZ
	+UzXleOA4A+x7D8ucI4yJkrPkY+boSlfLfezD/UFn0aPpp+/O8sn7N5VSxc4QVC3e/YcZMcIXcw
	wmWUUkOAEDPMDGt9g8RPWvBQ8XvJ1EPdg==
X-Received: by 2002:a05:600c:a016:b0:495:573e:1c54 with SMTP id 5b1f17b1804b1-4980c6523bamr409034915e9.9.1785858508247;
        Tue, 04 Aug 2026 08:48:28 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 08/20] xen/riscv: introduce init interrupt controller operations
Date: Tue,  4 Aug 2026 17:47:58 +0200
Message-ID: <370ce245e6974650bd6efab9a4eba841f14552d5.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785858508-18ECE9EA-DC2254E9/10/73395122804
X-purgate-type: spam
X-purgate-size: 4032

Introduce intc_hw_init_ops structure to avoid risky mix of init
function and non-init function.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5-7:
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


