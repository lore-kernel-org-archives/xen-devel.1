Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410B3C5DF74
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 02:53:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393346.1632162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww9wb-0001kB-Dc; Tue, 18 Aug 2026 02:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393346.1632162; Tue, 18 Aug 2026 02:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww9wb-0001k3-9Z; Tue, 18 Aug 2026 02:52:53 +0000
Received: by outflank-mailman (input) for mailman id 1393346;
 Tue, 18 Aug 2026 02:52:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1ww9wZ-0001jC-SF
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 02:52:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww9wZ-005CSk-96
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 04:52:51 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a83c8da-8faa-0a2a0a5109dd-0a2a4501ccf4-10
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 04:52:51 +0200
Received: from [209.85.216.52] (helo=mail-pj1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a83c901-5984-0a2a45010019-d155d834bcb4-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 04:52:51 +0200
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-38dc4553f62so5373900a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:52:50 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3954d3b40basm4333605a91.14.2026.08.17.19.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 19:52:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787021569; x=1787626369; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ebcWQVd73jtJSn4IlaXws2VNwFd+9+DtXjs8Yvf8FE=;
        b=XUt3quO4ReRqKk5Rd6VJr7lbbb1Zmf0121O/2DPz+RlOJoeOx9pdq42z/Sk0bmkelZ
         uNSB5jS5QO8pRsY+XXjI9T4AE3vapReJQU/AuwjfdLwM9e4sHeywM/WgWg8GOPJHbaYF
         jSVzGQejCbF9liDSwWDe5hZb3NwzJKpX8DTQvwUnF3K/93wEOMKM8OQ5zkW7Zll1u1cP
         MKnTdZHnf+nNmQxNB8TfVYYGvigs77NRN7BmYJaj1JwhbFbbIAjP6s6dzDt9LSl6PBXj
         CLXwS8YNQhlPbI0gRNwLeDXKREEtvO1R9HTYR1OLX26Qw+773mPNMnhadbDgFkS4cMHn
         tjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787021569; x=1787626369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ebcWQVd73jtJSn4IlaXws2VNwFd+9+DtXjs8Yvf8FE=;
        b=HFSsI5CQdY5iTnnqinZdCRNRyNns8wugYhV+kdvPKuAeFL9MSx7vIx8fwCGwYEk9v2
         1Pj5RNF1Gc/0zZDe9qkHtJT9NTezhZmcZeAo48iiZ4g1XlA24wC+POmUZTfgvi3ytpfc
         fiWsajVpE39wfgGgAZszYIY0L/FAokcfM924/Wza/6gdzCHUuJ+dHO4Pd5d0SPkH8arQ
         q2X1687fsREGMWKqPn0XO3p7k0IXn7OlmfvXcfAGy9WqIMNRFVnZbY8+FblPwTpyyDlk
         h4TupoVGQBC5Af6bt0vBx1NywqmMy27CF2LaI/Q0z02Ae6XOWS5WEAri86RXxpmY8RW2
         TQsA==
X-Gm-Message-State: AOJu0YxJ40MNK+vGgFcf+H6CeUWTZB+TUxnhkkLoLTLuTVZuVC9ImdOE
	te2zdFJClj5CREyPhjjd3NpQNG4uiBpwzp+FWHEcN0in513rWVGomW1ABMHQO+fU
X-Gm-Gg: AR+sD12vwfE3YjSQc6gDEDiyL017rM5Ykrs8+b33V+M4C1XshI8MKnyAgintMx7unLA
	is+8ZzNhlpZkB/eNGfh9R4Tas2eJXwACwkme6S+ebqt3skpt/yig2ZTeKxNsEAWaeEBzmWOoLmr
	v4nTKXUBocNYj7cgJAj0ZLEfZjmmiHdzuEGKnht4juZvxJJXN4Io48LTDj8vW6bXqOPjNb4KQnb
	L81mPdvHglv1nXFDTTO9aOlJmAkv0KLQyEsFwRrKyk7Rh/mDwPVf7aPc4ocb2eACz5PwtOAm6CJ
	WSIuCOhrfjJOrruz2OV78ZPlCSiLnaOnMqX7LZW47QngppGIGL3p44c/B62ZSOhkSXD/Ly2NwHR
	clU1C3nrrpxfn2BuNg87sH9CrSvQsQ/F8TU0eBZuR6t8jO/dErKV8bx1PkyxsIUk7oOyX9FMyNM
	f97JefwVnzSwZi/n8nwR/eiQ7h3Rutkkc+uiSU4+euwCjzhHLc7fbjj1FcM4wF8CvHABFUsEyW8
	g32bmfv7V1zEc/Ep9RiM4jdo8mFBMXc
X-Received: by 2002:a17:90b:52cf:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-3955a7d1a16mr5076420a91.14.1787021569081;
        Mon, 17 Aug 2026 19:52:49 -0700 (PDT)
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
Subject: [PATCH v2 2/4] xen/arm64: add early printk for the classic i.MX UART
Date: Tue, 18 Aug 2026 10:52:22 +0800
Message-ID: <20260818025224.4165503-3-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818025224.4165503-1-onlywig@gmail.com>
References: <20260818025224.4165503-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787021571-1F66C757-A423DD34/0/0
X-purgate-type: clean
X-purgate-size: 3008

Add an early printk implementation for the classic i.MX UART IP,
selectable via EARLY_UART_CHOICE_IMX_UART.  The UART is expected to be
fully initialized by the bootloader.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
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


