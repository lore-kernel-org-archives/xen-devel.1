Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C5DC5CFC1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391300.1631192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuvKM-0004kH-Cl; Fri, 14 Aug 2026 17:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391300.1631192; Fri, 14 Aug 2026 17:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuvKM-0004k8-88; Fri, 14 Aug 2026 17:04:18 +0000
Received: by outflank-mailman (input) for mailman id 1391300;
 Fri, 14 Aug 2026 16:25:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wuujE-0008GX-MJ
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 16:25:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuujE-006hmA-3L
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 18:25:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a7f4190-2eae-0a2a0a5409dd-0a2a4506afde-4
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 18:25:56 +0200
Received: from [209.85.214.171] (helo=mail-pl1-f171.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a7f4192-195a-0a2a45060019-d155d6abb008-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 18:25:55 +0200
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2d5335cf904so3017855ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:25:55 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3aeb29f62sm12585735ad.38.2026.08.14.09.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 09:25:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786724754; x=1787329554; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcuSXhXunYsiZRxzXY1y0OZN0WvmTzxBkolAPYMDdmA=;
        b=sQHPcxWM0mi3kvu5QDlWR22xDXI78wrZCLn0ZS7ZY8XVAAHaAF/XsQ8IJzmcRcZ3Cl
         Rrl4kQMQ4ggTZt4aQfGEMmpgOwLCGXJ2d3wYB0XeoWq/ZJYNki9imXqjVY55UeH5nthk
         jT/bcHrgmrvfZDFwqiqCuNfOoWMa3MlhMebAz4Ita82bB9jIkSbq97piGjiATYUx72H/
         CdPeG4AZvqFT93MrGssGcMgrmPxynxPTJvNmyzQkyAUA3JljEWpVcAYi62UZvUIef8vn
         MbF47qkxXoujeCeuVoFnBdRmtQ7vN0E2vjw84JE0Bj/y1PreTy7iJvvrkd0irMuVl0Pu
         iQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786724754; x=1787329554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcuSXhXunYsiZRxzXY1y0OZN0WvmTzxBkolAPYMDdmA=;
        b=cw4+QvUzj636ZNk4aKtgJU+pqE283blBMLtyPjj09nQGKlpQb8Zl+lupJ5BblZxKYy
         aH8D77fSFdgS2XTYKx8ts1ISs5W+SZz9lWr8TWFJc+1XJ4A2R93fr24XfuEm4AxNO6FX
         XSIrV2mwEg8hKxbG7d2Bl37pJvCIJL64GWtucZWYHOWbZbKhiDDu8AIIS1unR5qmk7ur
         7vuARHUsrKPv8T8bSVHcHtOHvrucCdaVUHJaAdDcQOBX+u5EGIn5sb0KBN4BbD9UoJ6P
         XRF7/o9YbqJojnp2mQreYZps6NOeOgSRF7qLOBCz/7IGw2m9MrhSryohZPHccIG/WHpr
         8ybg==
X-Gm-Message-State: AOJu0YzjrL+G0rEdLSsSL1axnpAo8BmCmnywZ++TNDEHaEmHVsBRS/h+
	Wh+7SR6gGmawU8rKwxt47uer6mlAn9cTMpL5EJtCJ8bpgj/aTwGJzMMSvaajeWL4
X-Gm-Gg: AR+sD10xawtm20mU4nrW9IRth/mWCO2LUykqWW+xrMz2B4/0NUm7RLrSpo6wvYjfCNW
	ffUffZQs0iwIS4otDGqyIiVWhfPJkn/4d0umYT2j97HRMtkQVmL/iHRN8HWTajLFRbru8lX00FJ
	A6TD6CCCw+khIqv6fo5As3IWzL0r6NtltlQn5dqJBqZjBvS/9MuEZL3vhEBQ2tW8FRb1R1pj3Fo
	Uf0Cc7UX6j9Ti7L+42e3e6D3PZo8hbAfFg7qSkGhBhsOl5pxz+i45jCk0wuXrcupsEAy5Fr7pY5
	sneWLYijlhcLtVtw502hD/LSfHMQ11TF3NmcESAahd8G1mZms9b/xYQYaqo1mWH/TB4mgSpMB9e
	tHxg0bXLNDmlK5shLnkBM70+3+BVe7dgbgIugBlDF5So5DAB39umV1vndZrwH/t/gAxa43iwTQR
	u/4iIkN6nD68ImhDPMvlRnY1ohW429aYUGla0gOYmn2WRVO+mfw5X6I9caK3WiqsA+OWBYmgrWy
	SZ5XIVV6uVDlOIckgRv/JqFxMlYE3Ew
X-Received: by 2002:a17:902:d552:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2d3b0d2c159mr94259235ad.23.1786724753801;
        Fri, 14 Aug 2026 09:25:53 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH 2/3] xen/arm64: add early printk for the classic i.MX UART
Date: Sat, 15 Aug 2026 00:25:34 +0800
Message-ID: <20260814162535.331459-3-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814162535.331459-1-onlywig@gmail.com>
References: <20260814162535.331459-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1786724756-F627077B-F0519CC6/0/0
X-purgate-type: clean
X-purgate-size: 3066

Add an early printk implementation for the classic i.MX UART IP,
selectable via EARLY_UART_CHOICE_IMX_UART.  The UART is expected to be
fully initialized by the bootloader.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 xen/arch/arm/Kconfig.debug            | 12 +++++++++
 xen/arch/arm/arm64/debug-imx-uart.inc | 39 +++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
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
index 0000000000..80ac647f5e
--- /dev/null
+++ b/xen/arch/arm/arm64/debug-imx-uart.inc
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/arm64/debug-imx-uart.inc
+ *
+ * Early printk for the classic i.MX UART IP (i.MX6/7/8M families).
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
+        bne   1b                      /* Wait until there is room */
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


