Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D753C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 15:40:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394296.1633135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLvK-0005Da-3r; Tue, 18 Aug 2026 15:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394296.1633135; Tue, 18 Aug 2026 15:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLvK-0005DR-19; Tue, 18 Aug 2026 15:40:22 +0000
Received: by outflank-mailman (input) for mailman id 1394296;
 Tue, 18 Aug 2026 15:40:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wwLvI-0005D3-Tu
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:40:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwLvI-00HT20-Ag
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 17:40:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a847cd3-e002-0a2a0a5209dd-0a2a450596e8-24
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:40:20 +0200
Received: from [209.85.216.52] (helo=mail-pj1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a847ce2-4cb1-0a2a45050019-d155d834c925-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:40:19 +0200
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-383cb94f742so91579a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:40:19 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3954d2de41dsm6247737a91.5.2026.08.18.08.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 08:40:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787067618; x=1787672418; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qIBzYOD0MBsGKdeHT2126j/ybS3L8h3qOs9csVaO/Z0=;
        b=Qbl1HeTYz5doLhXBg2Fjwj38ys/m6aHNM9YRwluNaD4MCOWo6PyLPXC791A+gR2WQ7
         YoxXckjp0Aa5+8Y0iA5HpDLxKiU6we/Iuc8GWZg8xcSFy4tn/1G32kv9CfKx8HWNC+pa
         ePTX1TRn3u6pJTSLdDXL4MPef2oo0CIkxo/4Sy/ugaXnWzds/FOk6EXkqEX4Wc9rKnNu
         xdfWz7+VMoAT+/6sInNHe+80yGRSGYMslF5FewSuHINbWZlmfwzFN4i5zfDBrjp01qXX
         DOX5Hi7YtU1XXN6xOJGw+wCsi5FVC6gnrJXklb9akH9SZ6cutEX2pdFS406gVjYDTttQ
         sKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787067618; x=1787672418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qIBzYOD0MBsGKdeHT2126j/ybS3L8h3qOs9csVaO/Z0=;
        b=E8+0BM/GxdSXq4B2BV2K/IPrYR7JvKI0bDWBWdX+W8lvTRCgmWN8fpSCQpOzrol7sI
         izQRDeZJz9yoiISExNgM3YuB6GgnhsIHNPkQxKP+N7PviZLK/tpFk3rMaMm6h3UDngcw
         s8ZZSS5qZlpTb8ONPiwpSOkLfY5LwCwaOLikxkqGmKnbL85UFo39tGLODCKgpPZPF2T1
         bZLpfLuLv/aiyRX4x4iwkN7v8+QhKUdrshbXGRl0C/bzvmJ0zB5lcmY6iySA+Sjrc/SF
         8v1XzB3UEEKMqp/mW0KozbSXtIMCAA7jR4gMtO79XK7OkCgBERYdKic4/6RFTMRKU8GQ
         7wEw==
X-Gm-Message-State: AOJu0YxHAMtX9wNy6WRScsVj5PcXCKJQiJ2c0ods0LU2YMaTZiVFyfuD
	Guot0YrtLSFoDMTVF8cLV4Rz0Lg2OLJsn43+uTeDFjWMFaz62P5ptBbqaP5d6qRb
X-Gm-Gg: AR+sD12r0bGirbkkLv6avB2GhZHhhVjKgVNvYNcxJ91f+kPq9Umr3vDmMxJOMcAeLvc
	FuQbeSNMaa4iy7lplb1gkkqTdM+9y1j+n06pJzo2tyiN2PO9hqym/FkJQ83vLZsNzI+bkP2i3eE
	HyxASwZk9AHWRKlPucycwdLvXr+iMwLoUkNWf3awmZ+qbVJc9dkWeGNxE2JbeivEWESya8TmCKf
	W+bxPnmWNvba8sEAmbi9q0JRrYu3YXbu19vHz+D5erdibpqKBZ4kpp9AB/3Prjc/ECdiOQCDQKJ
	n3uQ1aJiSCPaJEQ6+zKQwW+d4y6utW9CD6BjY9v/3O2UPi7lziIFWNOu1ZFd+HFn9rCUwczXKLQ
	oTDjKORcime61Tbtw7HAQGCdAuHXT2q2vG6Yfnahh6CJjFOaVAMXO8V4zxosC/HQWrOLQ9kF85s
	27OmWvAeY3wYwaoArFCNrIADY49ETFeiLah3CAMv3mtAzf2ivtI/k4JG57PpLDemTMMP1O7cUZf
	U1U98R9E3DZtKn97/R/pyCg6WNxbXsR
X-Received: by 2002:a17:90a:6089:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-3954de49a5fmr10840161a91.3.1787067617869;
        Tue, 18 Aug 2026 08:40:17 -0700 (PDT)
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
Subject: [PATCH v3 1/4] xen/char: add classic i.MX UART driver
Date: Tue, 18 Aug 2026 23:39:43 +0800
Message-ID: <20260818153946.1635464-2-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818153946.1635464-1-onlywig@gmail.com>
References: <20260818153946.1635464-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1787067620-F7ABF2A1-F9429C21/0/0
X-purgate-type: clean
X-purgate-size: 11658

Add a console driver for the classic i.MX UART IP ("fsl,imx6q-uart"
compatible), used as the console UART on the i.MX8M family.  Baudrate
and pin configuration are inherited from the bootloader; the driver
only enables the transmitter/receiver and wires up the RX/TX
interrupts, mirroring the existing imx-lpuart driver.

The i.MX8M family's UART IP differs from the LPUART used on
i.MX8QM/8QXP, so a separate driver is needed.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
Changes in v3:
- Add imx-uart.c to the Arm MAINTAINERS section so it falls under Arm
  maintainership.
- Gate serial_tx_interrupt() on TRDYEN: USR1_TRDY is a raw status bit,
  set independently of whether the TX interrupt is enabled.
- Print the IRQ number with %u (it is unsigned).

 MAINTAINERS                         |   1 +
 xen/arch/arm/include/asm/imx-uart.h |  57 +++++++
 xen/drivers/char/Kconfig            |   8 +
 xen/drivers/char/Makefile           |   1 +
 xen/drivers/char/imx-uart.c         | 233 ++++++++++++++++++++++++++++
 5 files changed, 300 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/imx-uart.h
 create mode 100644 xen/drivers/char/imx-uart.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ed0ffa608f..4dd97ffcad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -269,6 +269,7 @@ F:	xen/arch/arm/
 F:	xen/drivers/char/cadence-uart.c
 F:	xen/drivers/char/exynos4210-uart.c
 F:	xen/drivers/char/imx-lpuart.c
+F:	xen/drivers/char/imx-uart.c
 F:	xen/drivers/char/meson-uart.c
 F:	xen/drivers/char/mvebu-uart.c
 F:	xen/drivers/char/omap-uart.c
diff --git a/xen/arch/arm/include/asm/imx-uart.h b/xen/arch/arm/include/asm/imx-uart.h
new file mode 100644
index 0000000000..a3892020e6
--- /dev/null
+++ b/xen/arch/arm/include/asm/imx-uart.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Register definitions for the classic i.MX UART IP
+ * ("fsl,imx6q-uart" compatible), used as the console UART on the
+ * i.MX8M family.
+ *
+ * Register layout taken from Linux drivers/tty/serial/imx.c.
+ *
+ * Copyright 2026 Open-EP (E-Paper) Community
+ */
+
+#ifndef ASM_IMX_UART_H
+#define ASM_IMX_UART_H
+
+#include <xen/const.h>
+
+#define URXD0           0x00   /* Receiver Register */
+#define URTX0           0x40   /* Transmitter Register */
+#define UCR1            0x80   /* Control Register 1 */
+#define UCR2            0x84   /* Control Register 2 */
+#define USR1            0x94   /* Status Register 1 */
+#define USR2            0x98   /* Status Register 2 */
+#define UTS             0xb4   /* Test Register */
+
+#define URXD_RX_DATA    0xff
+
+#define UCR1_UARTEN     BIT(0, U)   /* UART enable */
+#define UCR1_ATDMAEN    BIT(2, U)   /* Aging DMA timer enable */
+#define UCR1_TXDMAEN    BIT(3, U)   /* Transmitter ready DMA enable */
+#define UCR1_TXMPTYEN   BIT(6, U)   /* Transmitter empty interrupt enable */
+#define UCR1_RXDMAEN    BIT(8, U)   /* Receiver ready DMA enable */
+#define UCR1_RRDYEN     BIT(9, U)   /* Receiver ready interrupt enable */
+#define UCR1_TRDYEN     BIT(13, U)  /* Transmitter ready interrupt enable */
+
+#define UCR2_SRST       BIT(0, U)   /* 0 = issue software reset */
+#define UCR2_RXEN       BIT(1, U)   /* Receiver enable */
+#define UCR2_TXEN       BIT(2, U)   /* Transmitter enable */
+
+#define USR1_TRDY       BIT(13, U)  /* Transmitter ready */
+
+#define USR2_RDR        BIT(0, U)   /* Receive data ready */
+#define USR2_ORE        BIT(1, U)   /* Overrun error */
+
+#define UTS_TXFULL      BIT(4, U)   /* TX FIFO full */
+#define UTS_RXEMPTY     BIT(5, U)   /* RX FIFO empty */
+#define UTS_TXEMPTY     BIT(6, U)   /* TX FIFO empty */
+
+#endif /* ASM_IMX_UART_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 8e49a52c73..f237c0220d 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -30,6 +30,14 @@ config HAS_IMX_LPUART
 	help
 	  This selects the i.MX LPUART. If you have i.MX8QM based board, say Y.
 
+config HAS_IMX_UART
+	bool "i.MX UART driver"
+	default y
+	depends on ARM_64
+	help
+	  This selects the classic i.MX UART. If you have an i.MX8M family
+	  based board, say Y.
+
 config HAS_MVEBU
 	bool "Marvell MVEBU UART driver"
 	default y
diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
index 8cbbffdca8..039f566926 100644
--- a/xen/drivers/char/Makefile
+++ b/xen/drivers/char/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_HAS_SCIF) += scif-uart.o
 obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
 obj-$(CONFIG_XHCI) += xhci-dbc.o
 obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
+obj-$(CONFIG_HAS_IMX_UART) += imx-uart.o
 obj-$(CONFIG_HAS_LINFLEX) += linflex-uart.o
 obj-$(CONFIG_GENERIC_UART_INIT) += uart-init.o
 obj-y += serial.o
diff --git a/xen/drivers/char/imx-uart.c b/xen/drivers/char/imx-uart.c
new file mode 100644
index 0000000000..2dc531a84e
--- /dev/null
+++ b/xen/drivers/char/imx-uart.c
@@ -0,0 +1,233 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Driver for the classic i.MX UART IP ("fsl,imx6q-uart"), used as the
+ * console UART on the i.MX8M family (e.g. i.MX8MP).
+ *
+ * Baudrate and pin configuration are inherited from the bootloader.
+ *
+ * Copyright 2026 Open-EP (E-Paper) Community
+ */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/mm.h>
+#include <xen/serial.h>
+#include <asm/device.h>
+#include <asm/imx-uart.h>
+#include <asm/io.h>
+
+#define imx_uart_read(uart, off)       readl((uart)->regs + (off))
+#define imx_uart_write(uart, off, val) writel((val), (uart)->regs + (off))
+
+static struct imx_uart {
+    uint32_t irq;
+    char __iomem *regs;
+    struct irqaction irqaction;
+    struct vuart_info vuart;
+} imx8m_com;
+
+static void imx_uart_interrupt(int irq, void *data)
+{
+    struct serial_port *port = data;
+    struct imx_uart *uart = port->uart;
+
+    if ( imx_uart_read(uart, USR2) & USR2_RDR )
+        serial_rx_interrupt(port);
+
+    /*
+     * USR1_TRDY is a raw status bit, set whenever the transmitter has
+     * room regardless of whether the TX interrupt is enabled.  Only treat
+     * it as a TX interrupt when TRDYEN is set, otherwise an RX-only
+     * interrupt would spuriously enter serial_tx_interrupt().
+     */
+    if ( (imx_uart_read(uart, USR1) & USR1_TRDY) &&
+         (imx_uart_read(uart, UCR1) & UCR1_TRDYEN) )
+        serial_tx_interrupt(port);
+}
+
+static void __init imx_uart_init_preirq(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+    uint32_t ucr1, ucr2;
+
+    /*
+     * Reuse the bootloader settings; only enable the UART and both
+     * directions.  The console uses UCR1 interrupts (RRDYEN/TRDYEN)
+     * exclusively, so just clear UCR1's interrupt and DMA enables.
+     */
+    ucr1 = imx_uart_read(uart, UCR1);
+    ucr1 &= ~(UCR1_RRDYEN | UCR1_TRDYEN | UCR1_TXMPTYEN | UCR1_RXDMAEN |
+              UCR1_TXDMAEN | UCR1_ATDMAEN);
+    ucr1 |= UCR1_UARTEN;
+    imx_uart_write(uart, UCR1, ucr1);
+
+    ucr2 = imx_uart_read(uart, UCR2);
+    ucr2 |= UCR2_SRST | UCR2_RXEN | UCR2_TXEN;
+    imx_uart_write(uart, UCR2, ucr2);
+}
+
+static void __init imx_uart_init_postirq(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+    uint32_t ucr1;
+
+    uart->irqaction.handler = imx_uart_interrupt;
+    uart->irqaction.name = "imx_uart";
+    uart->irqaction.dev_id = port;
+
+    if ( setup_irq(uart->irq, 0, &uart->irqaction) != 0 )
+    {
+        dprintk(XENLOG_ERR, "Failed to allocate imx_uart IRQ %u\n", uart->irq);
+        return;
+    }
+
+    /* Enable the receiver ready interrupt */
+    ucr1 = imx_uart_read(uart, UCR1);
+    ucr1 |= UCR1_RRDYEN;
+    imx_uart_write(uart, UCR1, ucr1);
+}
+
+static int imx_uart_tx_ready(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+
+    return !(imx_uart_read(uart, UTS) & UTS_TXFULL);
+}
+
+static void imx_uart_putc(struct serial_port *port, char c)
+{
+    struct imx_uart *uart = port->uart;
+
+    while ( imx_uart_read(uart, UTS) & UTS_TXFULL )
+        cpu_relax();
+
+    imx_uart_write(uart, URTX0, c);
+}
+
+static int imx_uart_getc(struct serial_port *port, char *pc)
+{
+    struct imx_uart *uart = port->uart;
+
+    if ( !(imx_uart_read(uart, USR2) & USR2_RDR) )
+        return 0;
+
+    *pc = imx_uart_read(uart, URXD0) & URXD_RX_DATA;
+
+    if ( imx_uart_read(uart, USR2) & USR2_ORE )
+        imx_uart_write(uart, USR2, USR2_ORE);
+
+    return 1;
+}
+
+static int __init imx_uart_irq(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+
+    return ((uart->irq > 0) ? uart->irq : -1);
+}
+
+static const struct vuart_info *imx_uart_vuart_info(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+
+    return &uart->vuart;
+}
+
+static void imx_uart_start_tx(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+    uint32_t ucr1;
+
+    ucr1 = imx_uart_read(uart, UCR1);
+    imx_uart_write(uart, UCR1, ucr1 | UCR1_TRDYEN);
+}
+
+static void imx_uart_stop_tx(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+    uint32_t ucr1;
+
+    ucr1 = imx_uart_read(uart, UCR1);
+    imx_uart_write(uart, UCR1, ucr1 & ~UCR1_TRDYEN);
+}
+
+static struct uart_driver __read_mostly imx_uart_driver = {
+    .init_preirq = imx_uart_init_preirq,
+    .init_postirq = imx_uart_init_postirq,
+    .tx_ready = imx_uart_tx_ready,
+    .putc = imx_uart_putc,
+    .getc = imx_uart_getc,
+    .irq = imx_uart_irq,
+    .start_tx = imx_uart_start_tx,
+    .stop_tx = imx_uart_stop_tx,
+    .vuart_info = imx_uart_vuart_info,
+};
+
+static int __init imx_uart_init(struct dt_device_node *dev, const void *data)
+{
+    const char *config = data;
+    struct imx_uart *uart;
+    int res;
+    paddr_t addr, size;
+
+    if ( strcmp(config, "") )
+        printk("WARNING: UART configuration is not supported\n");
+
+    uart = &imx8m_com;
+
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
+    if ( res )
+    {
+        printk("imx-uart: Unable to retrieve the base address of the UART\n");
+        return res;
+    }
+
+    res = platform_get_irq(dev, 0);
+    if ( res < 0 )
+    {
+        printk("imx-uart: Unable to retrieve the IRQ\n");
+        return -EINVAL;
+    }
+    uart->irq = res;
+
+    uart->regs = ioremap_nocache(addr, size);
+    if ( !uart->regs )
+    {
+        printk("imx-uart: Unable to map the UART memory\n");
+        return -ENOMEM;
+    }
+
+    uart->vuart.base_addr = addr;
+    uart->vuart.size = size;
+    uart->vuart.data_off = URTX0;
+    uart->vuart.status_off = UTS;
+    uart->vuart.status = UTS_TXEMPTY | UTS_RXEMPTY;
+
+    /* Register with generic serial driver */
+    serial_register_uart(SERHND_DTUART, &imx_uart_driver, uart);
+
+    dt_device_set_used_by(dev, DOMID_XEN);
+
+    return 0;
+}
+
+static const struct dt_device_match imx_uart_dt_compat[] __initconst =
+{
+    DT_MATCH_COMPATIBLE("fsl,imx6q-uart"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(imx_uart, "i.MX UART", DEVICE_SERIAL)
+    .dt_match = imx_uart_dt_compat,
+    .init = imx_uart_init,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


