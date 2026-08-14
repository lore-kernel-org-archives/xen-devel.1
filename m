Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A65C5CFCF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 17:04:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391303.1631203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuvKM-0004ts-TG; Fri, 14 Aug 2026 17:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391303.1631203; Fri, 14 Aug 2026 17:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuvKM-0004rr-M5; Fri, 14 Aug 2026 17:04:18 +0000
Received: by outflank-mailman (input) for mailman id 1391303;
 Fri, 14 Aug 2026 16:26:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1wuujJ-0008H9-Qq
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 16:26:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuujJ-00GchW-7i
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 18:26:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a7f418b-e002-0a2a0a5209dd-0a2a4502c19c-8
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 18:26:01 +0200
Received: from [209.85.215.172] (helo=mail-pg1-f172.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a7f418e-6ca4-0a2a45020019-d155d7aca958-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 18:25:51 +0200
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-cbe6295f05bso1697696a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:25:51 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3aeb29f62sm12585735ad.38.2026.08.14.09.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 09:25:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786724750; x=1787329550; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQ2MamIsZ2KeLKkmmqjUHALpj5utjzxXi4uD6i0RX6I=;
        b=XHImwinSQiCwRKAPYBp9NiB5dTlp0XnOkr+5BZgr7+y4tEd1ooUipd1W87Do3hKFym
         DMlorPMJLORJnwj4bYb8TgkWYwfkONfABCOMnA2/4h/T8wGTaFMKyyM4lmsPigBXGwP6
         lnB/6rcLBXC1N9d89cLqa1ME6gh7CbXLDppmtZN4VrSI5RjnKZp9q/cfexTHx7rhaBz0
         OnYUYaRyIf35GQUoTUXhrPjVtofO4dh76O/F+3CiuoOgWsr0IGwjpfsuiLOjt2d01fJ3
         MDjLNpUyrsWeNjE6BnKikh4diwpsZBfalBlVu4fW0l0WRq8fQeA2zfxJtoJEkGT5U2Qr
         57QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786724750; x=1787329550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQ2MamIsZ2KeLKkmmqjUHALpj5utjzxXi4uD6i0RX6I=;
        b=pTnyrUk41dGPQqMtm+HYVs3IPxsT8Zk2AkrXpZTq8GrQOlg4J2KZtyNsxmT05T8bIV
         UmsxzmtuZL9Dy8kjvyPL+2CH4LHWDXixwDPeIoRLlesVsPUQlN7XrGdqssuX4eZwD9Oq
         OFQW2yzu8NW0/+LNn0yVO1R8klP9VjJx569B+ZURcW8r740mYIeumiP7nTZ/+QgRAfPe
         LBkiuQcTLuXcOoI6WB93KNxgnZ2AkmCOFm8LpaPdqXGKU8U+KVUs2MgqgcE7pElT55x+
         WcEZZcVjzKK+UiruD8IqCH1HR2EnS2ZIM+v0v/jf6D6ls1ykGGdn7DZSKuD6/soHev6J
         2n5Q==
X-Gm-Message-State: AOJu0YwWApHprJd5IwK49yMas/6cv8XKPuPYNDf/1SPDFsJ21LjZevam
	hvA1CXTIg0zi+7PzemEX6ZCEVu80jRx0OevBnxcCfeUEM0zCSl/TGgKV7TbIDH5I
X-Gm-Gg: AR+sD107ELJm0UdLz6muR3Dd201Mq9gVxV+6iTpw3SZWfPNcmHgAuIEkRsZrSzg6Zkx
	fNyuKtQHHv9O4GRebvJAngh8vE7WIz7b5SM29zmuWXQeaHihO4TD5OYRFnmlQNCeTeAe3vmu1E2
	D5NSDyesDG9s3iLhievghqTKE4Gi5+ZJyNJQ+pKc0hs04FSfrhMAeZDpMbN8kTyOMHcJUnHT0yf
	hUr1VdRP8DW6nZV+M9oDXPAdMHuNDm7Vlesuy134D5VsHdMb7nBudaQfB6jBqTGCgBATuV1Es0N
	6WoIRQlUTqzeJ3tbeiA3/n1TwBB4gMLAhqd6z6kovYKwCRFA73YPkh0Rem6Iz42FzUkBYZ5mqEZ
	GRv/A8X5DvsK6MW1ChWdJt5pcgeWTdLl9voBa+Ev51ffN/JWO0u9Upgnyk9BtGX9T9PG09X01bF
	N5LEWSkrQiuCX04xH75qXdy4A6u0NLNi5W/9zd5Kl/Lvi7b6K95+6qfM/RA6kgRzFMRivGB18Mb
	6kuwJfsLEb1uNaffZSq3A+y2id2tcSh
X-Received: by 2002:a17:903:1aa3:b0:2cc:89ce:2f07 with SMTP id d9443c01a7336-2d3afdacd25mr70506165ad.1.1786724749790;
        Fri, 14 Aug 2026 09:25:49 -0700 (PDT)
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
Subject: [PATCH 1/3] xen/char: add classic i.MX UART driver
Date: Sat, 15 Aug 2026 00:25:33 +0800
Message-ID: <20260814162535.331459-2-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814162535.331459-1-onlywig@gmail.com>
References: <20260814162535.331459-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1786724752-F16AF2AC-B7559739/0/0
X-purgate-type: clean
X-purgate-size: 10603

Add a console driver for the classic i.MX UART IP ("fsl,imx6q-uart"
compatible), as found on the i.MX6/7/8M families.  Baudrate and pin
configuration are inherited from the bootloader; the driver only
enables the transmitter/receiver and wires up the RX/TX interrupts,
mirroring the existing imx-lpuart driver.

This is needed for the i.MX8M family, whose UART IP differs from the
LPUART used on i.MX8QM/8QXP.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 xen/arch/arm/include/asm/imx-uart.h |  62 ++++++++
 xen/drivers/char/Kconfig            |   8 +
 xen/drivers/char/Makefile           |   1 +
 xen/drivers/char/imx-uart.c         | 227 ++++++++++++++++++++++++++++
 4 files changed, 298 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/imx-uart.h
 create mode 100644 xen/drivers/char/imx-uart.c

diff --git a/xen/arch/arm/include/asm/imx-uart.h b/xen/arch/arm/include/asm/imx-uart.h
new file mode 100644
index 0000000000..ad4b0b06ff
--- /dev/null
+++ b/xen/arch/arm/include/asm/imx-uart.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/include/asm/imx-uart.h
+ *
+ * Register definitions for the classic i.MX UART IP
+ * ("fsl,imx6q-uart" compatible, used on i.MX6/7/8M families).
+ *
+ * Register layout taken from Linux drivers/tty/serial/imx.c.
+ *
+ * Copyright 2026 Open-EP (E-Paper) Community
+ */
+
+#ifndef __ASM_ARM_IMX_UART_H__
+#define __ASM_ARM_IMX_UART_H__
+
+#define URXD0           0x00   /* Receiver Register */
+#define URTX0           0x40   /* Transmitter Register */
+#define UCR1            0x80   /* Control Register 1 */
+#define UCR2            0x84   /* Control Register 2 */
+#define UCR3            0x88   /* Control Register 3 */
+#define UCR4            0x8c   /* Control Register 4 */
+#define UFCR            0x90   /* FIFO Control Register */
+#define USR1            0x94   /* Status Register 1 */
+#define USR2            0x98   /* Status Register 2 */
+#define UTS             0xb4   /* Test Register */
+
+#define URXD_CHARRDY    (1U << 15)
+#define URXD_RX_DATA    0xff
+
+#define UCR1_UARTEN     (1U << 0)
+#define UCR1_RRDYEN     (1U << 9)   /* Receiver ready interrupt enable */
+#define UCR1_TRDYEN     (1U << 13)  /* Transmitter ready interrupt enable */
+#define UCR1_RXDMAEN    (1U << 8)
+#define UCR1_TXDMAEN    (1U << 3)
+#define UCR1_ATDMAEN    (1U << 2)
+
+#define UCR2_SRST       (1U << 0)   /* 0 = issue software reset */
+#define UCR2_RXEN       (1U << 1)
+#define UCR2_TXEN       (1U << 2)
+
+#define USR1_RRDY       (1U << 9)   /* Receiver ready */
+#define USR1_TRDY       (1U << 13)  /* Transmitter ready */
+
+#define USR2_RDR        (1U << 0)   /* Receive data ready */
+#define USR2_ORE        (1U << 1)   /* Overrun error */
+#define USR2_TXDC       (1U << 3)   /* Transmission complete */
+#define USR2_TXFE       (1U << 14)  /* Transmit FIFO empty */
+
+#define UTS_TXFULL      (1U << 4)
+#define UTS_RXEMPTY     (1U << 5)
+#define UTS_TXEMPTY     (1U << 6)
+
+#endif /* __ASM_ARM_IMX_UART_H__ */
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
index 0000000000..5ae8c13c40
--- /dev/null
+++ b/xen/drivers/char/imx-uart.c
@@ -0,0 +1,227 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/drivers/char/imx-uart.c
+ *
+ * Driver for the classic i.MX UART IP ("fsl,imx6q-uart"), as found on
+ * the i.MX6/7/8M families (e.g. i.MX8MP).
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
+     * Reuse the bootloader baudrate/format settings: only make sure the
+     * UART and both directions are enabled, DMA and interrupts are off.
+     */
+    ucr1 = imx_uart_read(uart, UCR1);
+    ucr1 &= ~(UCR1_RRDYEN | UCR1_TRDYEN | UCR1_RXDMAEN | UCR1_TXDMAEN |
+              UCR1_ATDMAEN);
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


