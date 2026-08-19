Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9954C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 15:28:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395588.1633928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwiDU-0004IP-GC; Wed, 19 Aug 2026 15:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395588.1633928; Wed, 19 Aug 2026 15:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwiDU-0004II-DN; Wed, 19 Aug 2026 15:28:36 +0000
Received: by outflank-mailman (input) for mailman id 1395588;
 Wed, 19 Aug 2026 15:28:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wwiDS-0004Bl-TG
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 15:28:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwiDS-00FCv4-A5
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 17:28:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a85cba0-e002-0a2a0a5209dd-0a2a450b9086-6
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:28:34 +0200
Received: from [209.85.210.178] (helo=mail-pf1-f178.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a85cba0-b7e8-0a2a450b0019-d155d2b2e0d8-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:28:34 +0200
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-8518d5ddaabso1032210b3a.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:28:33 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d3617434sm787575b3a.29.2026.08.19.08.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 08:28:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787153312; x=1787758112; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVwP6oo+AcC8zP/zY/rrq1zp653mgLYZ54VIF02BJyk=;
        b=sKnjZlG45dIk1z0ctGnffIqmHDeWelWt1S6UZi008iSE1029HRo8DPLHrUNKRza4Ds
         Zm2zzN5suumb38M7hry/9gfAQiivklRldCZQcbJCcQsphoUsiSINqDYbe44Ew7LztzD3
         zXSBqBJKiO+RxX8d84G81qBhkgjkpstblZXhYYQ7XkWCY5M8ZfR6ImrA97wi1Qvf3rfO
         7h3Vaab/QRd42CrJSSQ0MimPvz2IX9HSHuh//ROtabXhfydaLO41wjRx80m7OnRKqnxP
         Mg8o25VOuZ3cynV1AUtvCo6GGkH9eOvqypiBY3jkNr6mTdTlrByCSpKGE/Uv/4q+XUMb
         Dzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153312; x=1787758112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NVwP6oo+AcC8zP/zY/rrq1zp653mgLYZ54VIF02BJyk=;
        b=Ab7NlRKZ3lE4GAT2u0rJPgGPvDMfbqcZDsLYEYcuy14G4KDAc443ECtPiyPYrvrgwq
         fT7HQoGBzyH4I2H1QcOFOVqk5vnDyoWERZrhjdRUqNp1fXwMjqiLITLtNzmD+5OwSHUB
         AwY12hvq5oHGEVNiheW+Wge4LxOgwMWfA5NdjisWkXrahCtaE34LzL+9n1mthnxN4ety
         hKkTWCt9l6gs88LTaWa5CksVNZJgmQ71VfiuNez5Q+QMIj5MRs84VGMpXviI/zeY2KJH
         A1w4PLoPeTdSrO/yNH162KJvR6CyrEHV0Ut7qPFBRl+/eeMvPrN1kcGbXF+3z4Mdgpee
         I40A==
X-Gm-Message-State: AOJu0Yxv2utmfJB+KAuyRKnez9vd+XK+gNVCjla0RdEG2QJgbW91LYMz
	+RWU8hSwWrp8EJUUhKh2x1PtzHpAILjha4sBtksx27iR68cHQyBG4460gzqYhGoZ
X-Gm-Gg: AR+sD11U965trUHsMFRBixXa0ykD3g7bUOpMyRUqVi0OcPXDEFclmYyB59uOf5ktku/
	ygLZcsETpwsekVN3UBYoOkywDtmIjnmyjvmPzG5nU3IL5OcOzoJVO5s0pGcYws7pwHRFWx/iZBA
	kB4Hbxl68ZUZ602Ad6I/cSmY9lCfym8y3PvxEw5Hh99T6bwbQfGafftKvA6smVbafWVxrdwhR4r
	uXXBntME/4sszrhHKM+fdhPv4iosxvRGHadT467AzPPOUspb6oJKhuYDGLpbBjxE0aFeFngQKkJ
	EpIHRxk14y9uSu8Eonvl6bC/rt5lUCagg1DQsuwDMuARepH+qBcVwGHkmyBu6S3mmimCy/sAmXb
	LOVPcnkHqnRmfdJrqfm2jNAVSbyPMrOqK2Ywr8eWrFHLtVsNLcvgKRNj1squcAbg4cKliNXzl5U
	UGEr5jJPBfMKmJUhAFttIUd7SgT+IaINsgNIDDrI0djhMh3e2MoYBNPyup8PPberbMzKZ7ihOv9
	JTb1kQsLkZbPYOGTNfTdOwhkD6JgaWd
X-Received: by 2002:a05:6a00:4f91:b0:848:5f4f:289d with SMTP id d2e1a72fcca58-851d3850391mr8923732b3a.4.1787153312230;
        Wed, 19 Aug 2026 08:28:32 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 2/4] xen/arm64: add early printk for the classic i.MX UART
Date: Wed, 19 Aug 2026 23:28:19 +0800
Message-ID: <20260819152821.3361898-3-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819152821.3361898-1-onlywig@gmail.com>
References: <20260819152821.3361898-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787153314-A8AC89EA-D21BFA9F/0/0
X-purgate-type: clean
X-purgate-size: 3091

Add an early printk implementation for the classic i.MX UART IP,
selectable via EARLY_UART_CHOICE_IMX_UART.  The UART is expected to be
fully initialized by the bootloader.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v4:
- No changes.

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


