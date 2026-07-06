Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4ABC43458
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 15:58:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355485.1610279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliB-0006gV-IJ; Mon, 06 Jul 2026 15:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355485.1610279; Mon, 06 Jul 2026 15:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliB-0006fo-CV; Mon, 06 Jul 2026 15:58:23 +0000
Received: by outflank-mailman (input) for mailman id 1355485;
 Mon, 06 Jul 2026 15:58:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliA-0006be-8s
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgli9-009ym5-Lu
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:21 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd091-e002-0a2a0a5209dd-0a2a4504c49a-12
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:21 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd09d-a01d-0a2a45040019-d155802cd40f-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:21 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493b691cb44so22993425e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:21 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353501; x=1783958301; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyI+cJHXlQ/CsV0qqhbFZd2j4tvOANbiay87gjrrueY=;
        b=qDnciBfZtJRbTNFwbjMTYiwA/WrvW2KfssSKc+9+A9/3wXG0U4LpQuLfeCKnOBJB/n
         XIOzWS/ACanUqcdP9f9XFznoiraAyFWdJB/C8d8H0VNEt/oPD9b6WdEJ2tq6JDOfRIgr
         V6nUsFeKYB9KfZ7NRG8ZQtLwa5afX/IqNU+y7gXIsj3iWOJDCKqRiSyi26+AIRALceZx
         BXwzk1JLzbc93vp3Xz6Ee4640HqzyevpK4i2pnvfnWJGy+EfUA5f6EvYVcQKaQ9rFGqL
         rXEAEEw9+6Vgyi0Op1x9DxMJyLFZvwfE4KgWq00ZtkIOCyyJv+0QF/PLThe7SS7N5RKQ
         PQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353501; x=1783958301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyI+cJHXlQ/CsV0qqhbFZd2j4tvOANbiay87gjrrueY=;
        b=MWyhNOYCiCjmIES/NqcvMxj5c4BKFqXROGsIxbe9GGY4C5zmskkdEIGma4Ggfja/FO
         NhHFmyg7QWuNsfIBwC7qFcLMixSACZHYzE7GwRxjTNOgkKofB+aXhuKt8PiM+GSVMASF
         vjc66TrVUQsaHYrM6EQx7BWtlJkAQPpYWRdFlI9amuE/8eweSlqej24HyV08uRTEm73x
         4t8Ed0+d+/Wz/hrFygKYdYV1ZRpP0LgJE/FfBTp4KYKUseIbBHaV6tTEoTcsN/wZCK7W
         tKmB9qnr6LON+jAUslW1TEGJI3pcsL+915khuupxt9udKdyKx72crpCF58fAWbnpqkk8
         1xYg==
X-Gm-Message-State: AOJu0Yz2SW9hePh/Rz2SAwYf+bjifSJWWx+BGGtktfiCH8+3XSqeR5tZ
	pOAL7T/dS0FQKV6F6lil1euU9chJT9OzBP3fjc83nXf9fIsq2G45N/iT44qqwA==
X-Gm-Gg: AfdE7cnMl7cs9iuMF08ec+u/4llN67hTgo9pJjRFKxmAP1Ga4CJiuRywN6rRjT3mV9M
	wZUU93Lt+/haMQYxv44ojc7mnL6vDzfAz22WQU4pCt0gcZAhtcJbbLzZBZQSbXHzywEZMm1NBGX
	/8o8q4SZ8MjlV3pAtZ1BZOn7YovpYLlZYNAHPqVwW5brfhZldI/RIt0usKQnvy//10qSTiZ+fWv
	2CiIyu88NfBAmEoUTTktmqRQNApetBzvroS84EMAdnsw5BbyTa89/Z/uFEW7QDaoEIt94GOS4Dr
	OwzhpCiZCSkezELHRffZj8mHdaG2sZCB7albf5d5Tt8/wH2uhnA8CYHZ2uYpK3Hi1PPKNyUjYie
	BaQAUAtWo21XTBxJCnUg/8+AgjnA/Zsk3K3vDbJMNUb+uQWlzPN4novdHSog/pUW/Rwtw8NA6IT
	hJhl2miJTrTVuG/6nqIQh3Ej4BrZM8/DtFN8TFmir0frJEwz/fBeapHIL1bw==
X-Received: by 2002:a05:600c:3acd:b0:493:a5f9:d33d with SMTP id 5b1f17b1804b1-493df08feb3mr11711955e9.18.1783353501067;
        Mon, 06 Jul 2026 08:58:21 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 02/26] xen: arm: move declaration of map_device_irqs_to_domain() to common header
Date: Mon,  6 Jul 2026 17:57:43 +0200
Message-ID: <0854d614acf81c6d237a280349bd75832889ab91.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1783353501-2F15F1CC-2C95EE76/10/73395122804
X-purgate-type: spam
X-purgate-size: 3776

As map_device_irqs_to_domain() is used unconditionally by common part of
dom0less code, move the prototype to a common header.

fdt-domain-build.h is chosen as map_device_irqs_to_domain() could be
also called indirectly in Arm's DOM0-related code and DT overlay feature.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v5:
 - Add Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v4:
 - Reword commit message: use imperative mood ("move the prototype") and
   mention the DT overlay feature alongside Arm's DOM0-related code.
 - Add #include <xen/fdt-domain-build.h> to Arm's device.c so the definition
   site sees the prototype.
 - Drop the duplicated function description above the definition in device.c
   (it now lives only on the prototype in fdt-domain-build.h).
---
Changes in v3:
 - Add tag arm and move this patch earlier before RISC-V-related patches.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/arm/device.c              |  9 +--------
 xen/arch/arm/include/asm/setup.h   |  3 ---
 xen/include/xen/fdt-domain-build.h | 13 +++++++++++++
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 7d9644fd8b6d..b11366d722ef 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -11,6 +11,7 @@
 #include <xen/device_tree.h>
 #include <xen/dt-overlay.h>
 #include <xen/errno.h>
+#include <xen/fdt-domain-build.h>
 #include <xen/iocap.h>
 #include <xen/lib.h>
 
@@ -117,14 +118,6 @@ int __overlay_init map_range_to_domain(const struct dt_device_node *dev,
     return 0;
 }
 
-/*
- * map_device_irqs_to_domain retrieves the interrupts configuration from
- * a device tree node and maps those interrupts to the target domain.
- *
- * Returns:
- *   < 0 error
- *   0   success
- */
 int __overlay_init map_device_irqs_to_domain(struct domain *d,
                                              struct dt_device_node *dev,
                                              bool need_mapping,
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 14fa92d5c1db..2af780512540 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -51,9 +51,6 @@ void init_traps(void);
 int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
                   struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
 
-int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
-                              bool need_mapping, struct rangeset *irq_ranges);
-
 int map_irq_to_domain(struct domain *d, unsigned int irq,
                       bool need_mapping, const char *devname);
 
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 671486c1c837..8612e98dfda5 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -12,6 +12,7 @@
 
 struct domain;
 struct page_info;
+struct rangeset;
 struct membanks;
 
 typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
@@ -79,6 +80,18 @@ static inline void set_domain_type(struct domain *d, const struct kernel_info *k
 #endif
 }
 
+/*
+ * Retrieves the interrupts configuration from a device tree node and maps
+ * those interrupts to the target domain.
+ *
+ * Returns:
+ *   < 0 error
+ *   0   success
+ */
+int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
+                              bool need_mapping,
+                              struct rangeset *irq_ranges);
+
 #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
 
 /*
-- 
2.54.0


