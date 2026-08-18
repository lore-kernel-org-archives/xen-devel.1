Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1710C5DF74
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 02:53:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393345.1632153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww9wX-0001WA-2v; Tue, 18 Aug 2026 02:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393345.1632153; Tue, 18 Aug 2026 02:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww9wW-0001W3-Vo; Tue, 18 Aug 2026 02:52:48 +0000
Received: by outflank-mailman (input) for mailman id 1393345;
 Tue, 18 Aug 2026 02:52:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1ww9wW-0001M6-9P
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 02:52:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww9wV-000sOh-Mp
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 04:52:47 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a83c8b3-e002-0a2a0a5209dd-0a2a4507d062-24
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 04:52:47 +0200
Received: from [209.85.216.51] (helo=mail-pj1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a83c8fe-b4ea-0a2a45070019-d155d833a45a-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 04:52:47 +0200
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-38e3efab7e0so458350a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:52:47 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3954d3b40basm4333605a91.14.2026.08.17.19.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 19:52:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787021565; x=1787626365; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNEbZb8d3EIW7+AuEqsJziYT7kLVDhA14GbIEAzFYfE=;
        b=gveSBXEbaN/WdbiPoDk7RRstyviiHje+GPK79+yTJWrQQHRShm3tVicpvkY6VrwpnQ
         fr5nFjM8nhL5FkVheLc5pl9NCJ/Vdzfe8vpTt8R1KLG8mayOX+v2dqzf/Tl+3XqHJFub
         Ne3w0u46Zhno/Jy99Jz2QLZCmeKkfWmlMc45XMI4hFH7zxWmLOuwBUlHxhpR2CP+l7MM
         1R0Ckb8zrOPTIq5aXxZIUVh9XkjFpLHkZKNojbS20WVSx5iCg1dTvJCPzU82mPXOLjB4
         1doJTYO+FrOoo5X64v0eVVZolUePB1r7grYBg45uUCLjhjaT2q/PufOzcPwSRwDwXWcX
         upMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787021565; x=1787626365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eNEbZb8d3EIW7+AuEqsJziYT7kLVDhA14GbIEAzFYfE=;
        b=BRTxyngJDAk7iGugh2ISTEux4S+TbSZPQFQRus2i9Mf/1asd8gqzuXpK2QKSHv07uU
         skhTFLsgYduV5ySBMR5MyCOrmDQXYnnGcZPlua+KyfWFifbzcszRAUl54TQ9Gl2Bn6G5
         saXXijbTxoIfDtEJ+ne+gjwJlu5wdZDgE8Iu+B1JgNOjWFzZkrddRqYajuW73sxggBWu
         DcVDVRUQmC+1V68h7QK6xUtnhAsXzxWfT0rsca/oPAIA+IZzBijQjD1LcH/79rqwXRU1
         C1Nkhh1/jnvlFnCFVyuDBCVgXyyI+K/sZMKmRGDdN5p6y2xbkCTNbgjhSj2ZuaSv+Gj6
         Cyww==
X-Gm-Message-State: AOJu0YwxZYikkbIgO96HQdOznXHCJCI9/gvUkFox3FBjDUxEImCUbApU
	X7heRKsuw3z+NwstHkFjNw+R58yU+fi0mFOmVI4FH0Km41Cx3/mMEmkfgWg8/y19
X-Gm-Gg: AR+sD11lzCEtMsgr0JwS9D2GEaz17Y3OwaMgZqyW7O/qhuCmY2M8VjHWVQMg6ZfIjVO
	N91Ry/jTJkb4mllfT9BI6dHFrNK+VpUqiyqDJJqBeRZ7hYbuPLaprYI9VD1N8m8XGPDIqzNNEJG
	w/SmMM95u4TCO5DPENlGYqoaWgXnJ99y5arZ3UxtRJwEmberQnKhb6Yf8kCtUIDU5Njk5lGAK4s
	EA/xo/vTdE7Mgp65AZJU2KajsPbM656uXAsL0Xv1WViylp6HxqtjlEnDgPY3asP3a5wKOAhltHC
	Z2zgXjcYDoMVwNXSIYv1Y0k/a/WJB0vmwdzxoQdM/Jgw1vPn0oexJ3gmlQKdiqRTVHlbUPSPz+j
	zfitDySbps3iEMOFaczqAfDO1nlWh1ZOqPZCgUAo1nN3vuHLhaXZxkn+8jTE00lviTNev+29R8+
	LPdus/r3tNzT/OcN5ZiRKmNUtVuUmQKIV0GMRLPv/ch7bkKEmb12RMd9B5y3YkC+1NHdgZZxtEY
	RIBvEwxS7g3Frr5VaMp2aLbF+9giac3QBR96g==
X-Received: by 2002:a17:90b:58e8:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-39563853b56mr1747770a91.4.1787021565402;
        Mon, 17 Aug 2026 19:52:45 -0700 (PDT)
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
Subject: [PATCH v2 1/4] xen/char: add classic i.MX UART driver
Date: Tue, 18 Aug 2026 10:52:21 +0800
Message-ID: <20260818025224.4165503-2-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818025224.4165503-1-onlywig@gmail.com>
References: <20260818025224.4165503-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787021567-A5CC7AE4-03F6A728/0/0
X-purgate-type: clean
X-purgate-size: 10556

Add a console driver for the classic i.MX UART IP ("fsl,imx6q-uart"
compatible), used as the console UART on the i.MX8M family.  Baudrate
and pin configuration are inherited from the bootloader; the driver
only enables the transmitter/receiver and wires up the RX/TX
interrupts, mirroring the existing imx-lpuart driver.

The i.MX8M family's UART IP differs from the LPUART used on
i.MX8QM/8QXP, so a separate driver is needed.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 xen/arch/arm/include/asm/imx-uart.h |  57 +++++++
 xen/drivers/char/Kconfig            |   8 +
 xen/drivers/char/Makefile           |   1 +
 xen/drivers/char/imx-uart.c         | 226 ++++++++++++++++++++++++++++
 4 files changed, 292 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/imx-uart.h
 create mode 100644 xen/drivers/char/imx-uart.c

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
index 0000000000..fd34b0cd11
--- /dev/null
+++ b/xen/drivers/char/imx-uart.c
@@ -0,0 +1,226 @@
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
+    if ( imx_uart_read(uart, USR1) & USR1_TRDY )
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
+        dprintk(XENLOG_ERR, "Failed to allocate imx_uart IRQ %d\n", uart->irq);
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


