Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D7FC5DF81
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 15:40:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394297.1633143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLvN-0005SR-EE; Tue, 18 Aug 2026 15:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394297.1633143; Tue, 18 Aug 2026 15:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLvN-0005SF-BV; Tue, 18 Aug 2026 15:40:25 +0000
Received: by outflank-mailman (input) for mailman id 1394297;
 Tue, 18 Aug 2026 15:40:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wwLvM-0005RU-LU
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:40:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwLvL-00DoOS-QQ
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 17:40:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a847cd6-bab6-0a2a0a5309dd-0a2a450981d6-44
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:40:23 +0200
Received: from [209.85.214.179] (helo=mail-pl1-f179.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a847ce6-be1a-0a2a45090019-d155d6b3b4a1-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:40:23 +0200
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2d530328efbso44051555ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:40:23 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3954d2de41dsm6247737a91.5.2026.08.18.08.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 08:40:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787067622; x=1787672422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0On8hRhK0t4yabFkZiREtUdWVWf6eqi7kbFEajsEts=;
        b=Lwo69YnFA8djpTfkPSBkmSG/J4ab30v8QP/nkTaM2UapmsGnk+zNJVrupHGlSzmp3H
         WMtkJFtV7ihF9X/AWMueCSIskBQwHUfi68SKIGbxSMCgH5gJewayrBWu5ss0UUi/Gaxw
         bBARM/tCqT4zofGXpBNgbUaFRhTOU0qi75nan5QN8AVdhW93Ql5/+CcJWDyJEW2OzAHU
         bUyjz86bivoJAQfl4uv72EGLOn1x2PPimEWSMG1hU2X1saaTRByCn8VvR/MMX5cp2tap
         gSRsJ734wA1eGL92fhxL1ZI6ZwMoSZRjC8U3NCY87R6ubkNH2kuZDskAlkNyBjSxyWfs
         h8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787067622; x=1787672422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0On8hRhK0t4yabFkZiREtUdWVWf6eqi7kbFEajsEts=;
        b=LNn2gbITZjoj0BM+djPo07pB/9s6Mu6JCDYWUHmI5kVopEVkSUEitOaPnrh77e4jMz
         Wf9/Tr1I+/jMAglMukl3m8nw5gBCT5QD4/rGgUoockQQmfpY9f266R8H0SBnJm8XPoae
         Qo4UQQbak6599U5UfuFeeW82F1rS9K9Cva3OTQ2QG16rRSKbAof1cWzMRbHjHjt+KzsQ
         bfCXFeF9P+lChIpUL2SV7oT2hfOOS9j0QTjlHIb6A6J+smOIwieC/bJIyMixdpOaKXTF
         BPuVAUWI4U1bMNqs2xOU3secr55hd4PTFo9T1CNDtqwHAyzBWC+P7oxVEpQDgaJOeo6Z
         GqHA==
X-Gm-Message-State: AOJu0YzWwxFInCf6x5Lllof6O/9JfIbqYgm1CMhQq89rBZVIDeJZfbI8
	bp8ghC6GnOyfTtGMpWKP4eWH/Vcw0IYOdLLQNxmqAafbyupE+uGoyYzpd71QaPo2
X-Gm-Gg: AR+sD11YlAboy4OCKTh6XN7Ax7ZMugfZtPKJs14V7gQV3mBH4HamJ4oNQhEeClnGQ/B
	tdtdP7shuNlrPQbbbNJROB8sMrLgPncfb00Vn6301eubR2OHcGs3wlfJN4xh3nlWBJQdNIN4ng8
	2vvWiAsmKjDWh0WLY2RiDYEhHNejfTgC21n/GnWGZwIUwqGgx2eb6+LAE8l7mOhf1DeVuosUtC1
	fCYOfaMd5i/F+FYORTZETeqADow4DmswE/RmPHDGH8BqKmxrzIpPPVQBvYpS/xJIJp0PJVQV7io
	QGTxGbgoXolNEjz59GwlVanlRgwLaznjCgz/ves9jRl+vvCk/IKyT4+ppUaR0yKGMY9eDx1yocm
	hlzeYFmRH8+l14f2+oD1tTWBO5Qa33UYIEKMDP4HB3lOgHqJB5RgAqkWfdlzXTJqy9rzTpnU537
	YuYI0y6BYED7W+64iGhZRzRrZmVByMYWRtRKiOktGiSQfvbASsFhvbDpuph4pq9O0xdorOTxu0c
	che29I2UUf0veqt+opeAoe7e9+Zey04iLF1cr11opw=
X-Received: by 2002:a17:90b:314a:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-3955a3dadefmr11324468a91.2.1787067621660;
        Tue, 18 Aug 2026 08:40:21 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v3 2/4] xen/arm64: add early printk for the classic i.MX UART
Date: Tue, 18 Aug 2026 23:39:44 +0800
Message-ID: <20260818153946.1635464-3-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818153946.1635464-1-onlywig@gmail.com>
References: <20260818153946.1635464-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1787067623-BFED6034-904A1B9B/0/0
X-purgate-type: clean
X-purgate-size: 3128

Add an early printk implementation for the classic i.MX UART IP,
selectable via EARLY_UART_CHOICE_IMX_UART.  The UART is expected to be
fully initialized by the bootloader.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v3:
- No code changes; picked up Michal's Reviewed-by.

 xen/arch/arm/Kconfig.debug            | 12 +++++++++
 xen/arch/arm/arm64/debug-imx-uart.inc | 37 +++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 xen/arch/arm/arm64/debug-imx-uart.inc

diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index 5a03b220ac..63a34b813a 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -44,6 +44,14 @@ choice
 		  Say Y here if you wish the early printk to direct their
 		  output to a i.MX LPUART.
 
+	config EARLY_UART_CHOICE_IMX_UART
+		select EARLY_UART_IMX_UART
+		depends on ARM_64
+		bool "Early printk via i.MX UART"
+		help
+		  Say Y here if you wish the early printk to direct their
+		  output to the classic i.MX UART (i.MX8M family).
+
 	config EARLY_UART_CHOICE_LINFLEX
 		select EARLY_UART_LINFLEX
 		depends on ARM_64
@@ -97,6 +105,9 @@ config EARLY_UART_EXYNOS4210
 config EARLY_UART_IMX_LPUART
 	select EARLY_PRINTK
 	bool
+config EARLY_UART_IMX_UART
+	select EARLY_PRINTK
+	bool
 config EARLY_UART_LINFLEX
 	select EARLY_PRINTK
 	bool
@@ -185,6 +196,7 @@ config EARLY_PRINTK_INC
 	default "debug-cadence.inc" if EARLY_UART_CADENCE
 	default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
 	default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
+	default "debug-imx-uart.inc" if EARLY_UART_IMX_UART
 	default "debug-linflex.inc" if EARLY_UART_LINFLEX
 	default "debug-meson.inc" if EARLY_UART_MESON
 	default "debug-mvebu.inc" if EARLY_UART_MVEBU
diff --git a/xen/arch/arm/arm64/debug-imx-uart.inc b/xen/arch/arm/arm64/debug-imx-uart.inc
new file mode 100644
index 0000000000..19b1679020
--- /dev/null
+++ b/xen/arch/arm/arm64/debug-imx-uart.inc
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Early printk for the classic i.MX UART IP (i.MX8M family).
+ * The UART is expected to be fully initialized by the bootloader.
+ *
+ * Copyright 2026 Open-EP (E-Paper) Community
+ */
+
+#include <asm/imx-uart.h>
+
+/*
+ * Wait for the UART to be ready to transmit
+ * xb: register which contains the UART base address
+ * c: scratch register
+ */
+.macro early_uart_ready xb, c
+1:
+        ldr   w\c, [\xb, #UTS]        /* <- Test register */
+        tst   w\c, #UTS_TXFULL        /* Check TX FIFO full bit */
+        b.ne  1b                      /* Wait until there is room */
+.endm
+
+/*
+ * UART transmit character
+ * xb: register which contains the UART base address
+ * wt: register which contains the character to transmit
+ */
+.macro early_uart_transmit xb, wt
+        str   \wt, [\xb, #URTX0]      /* -> Transmitter register */
+.endm
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


