Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4961CC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 07:18:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393501.1632316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwE5f-0000xV-Mm; Tue, 18 Aug 2026 07:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393501.1632316; Tue, 18 Aug 2026 07:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwE5f-0000xO-Ib; Tue, 18 Aug 2026 07:18:31 +0000
Received: by outflank-mailman (input) for mailman id 1393501;
 Tue, 18 Aug 2026 07:18:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwE5e-0000uP-83
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:18:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwE5d-0083Au-1r
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:18:29 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a84073a-bab6-0a2a0a5309dd-0a2a45028cbe-32
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:18:28 +0200
Received: from [40.93.195.12]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a840743-6ca4-0a2a45020019-285dc30c18cc-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:18:28 +0200
Received: from CH0PR03CA0265.namprd03.prod.outlook.com (2603:10b6:610:e5::30)
 by CH3PR12MB9344.namprd12.prod.outlook.com (2603:10b6:610:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 07:18:21 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::2d) by CH0PR03CA0265.outlook.office365.com
 (2603:10b6:610:e5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 07:18:21 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 07:18:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 02:18:21 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 02:18:20 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuYiYgyr19k1jojvGRrx8t3xDEZKsyXf0iV1p4pc0FZQwzr8V29Ys5Vnacsd9B+FqPND7FYuxfaMK5DNNvvv797Ts6urLnw9jHoviIkHry1i0X4nniZWCt8KUTuwK9GEc4bQdD+v/6PRwm7oOw5wNI9hxMJ8CeWTrqc5ZL/lZYg616ZX0P5IhqL+hqaQR5Fuo1X+jBWZidUEvHJbMrhWRwlZyGv6fZdSyr13qei2/Hq/NVp76+jGClhYU8zGSBk+5lKWgewHzdyHRuBityqiniqARWhk/SNnSHikRzQWOmofQeZZ5mLfs2J1Fh/TqXYEiW6D7MEgi42BoWVFqTh75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VKtktAghtvAyfShnMl7Gov2iTCHFu/RnL+YdTnPlnU=;
 b=qqOLqQMDTLt0doS0M4EWoBwcFNxywSeXnjTcTCeKOFRHf0m7arGAIBaQTt1ISawXjZI9/FfeJHZxHoDiW7UCQoW1tbTqgthtBFCKh0usrzQiRA7QuOZC/SUvpvDZUNnTdUbQ17zPCPZ1JuhVTeuruhKJycWUpDGHH9AgjOtjZ76afNg9m3spVRz7I47PoKwUh7WliKbfR3A50HiCtqOu6ErThESSpsqw27jYei5FgZ79FiArGgWQLhHjtJleTH45H5/1fmn+kyBqxrjrjChNuYb0FZtnRJuIm6kiy8p3xhf2Bl2eJGm6swXskFe9gJLa72X+scT8DL5Wn5YmX6HZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VKtktAghtvAyfShnMl7Gov2iTCHFu/RnL+YdTnPlnU=;
 b=wjh11NAL5zIlJZMYnGAUVrH2PIgAAV5UgR8OZaJTMzCNzt/YcPVSSvkhe0WOS65t1fKXUNiYYl6KnbPmxItGPkubT9ZFFVGn5kzkcrXQgxdftQ82cIrNquMk2FJXHo7tvUPgxWD4SDKgm3JHUOkHLDSkBqx2Q1XOzrtBFddOM1w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e820d885-123e-49f8-b6e7-f0cd2e7fcd99@amd.com>
Date: Tue, 18 Aug 2026 09:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/char: add classic i.MX UART driver
To: Wig Cheng <onlywig@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
References: <20260818025224.4165503-1-onlywig@gmail.com>
 <20260818025224.4165503-2-onlywig@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260818025224.4165503-2-onlywig@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|CH3PR12MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: daa165a2-460e-4734-ec64-08defcf8e2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|22082099003|18002099003|10067099003|11063799006|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	FBuzX7xduSqKF5CJANfuRm9AxYdkCHngcpu33DTXLm1s9Id3MSKeP6EA31LNLepHlfT/gjeYsIfexffOvOPwTHLor0ajcPxzoOFDx4/s+pCjRykzruqPXl2URqqb87M43BBLPORP7FnUdWrc2Uk3rsMWvVApqwQ/4ruxJfqh4PS4qmaKHfm4pARWrMgMXZeFc6SSeZugIIu16swCsMagQ8mWJjY2YNap0iFQfRD4pYmT0+eMR8UaItOC0ECuZYxJaFLrpipb2xS1J9blTFhllMs1w5xgZQCPKqIIC1ZhW5YJ2q0VKe2wy/tyLQAW5gIRoW4PZt6VgTtvbRnOKHhHCqSFo0cDYEPY1IdNvH0qJzh6ThuVwLLVBpR82aWT+FhophRtcnr7CR+nMl3bPNxFQi0Uwg4YVpytOFLf/zbylA7ecXSdFPQtVnCxj9ZY/Y+/e/lrUWIIm71vJlN/Nlodl+crqfBoomujkQPMAqztXQ0OF5XlM8pIcWdJkjT4CUAvAiARNghHoYjlIEabZ4pYKkpZl6D8F0UYGJL6JOPHoBtAfme3ms1WqS+RdpJt6f3m8fh6CtLZfmEbmUnNOjFpWDG9/WWBASeVsiUhM78MJlZNlUI8M9QycZ0BmzfMMp2PqJk84CZRRt1txZXvqFGZFZOaQLkiY9DqXTU2d98mzPLCqUTxvucvFYxUD4gef8npITyV754AFzmnfOCoAFs1dQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2Et1/Qs7+6m1FHjJNk9QPUrXKrXWpdNE9yYl+ziBOyxcH8RNQFPiEJ/Xk5eheeiDL4zcaWViF8o9YEk3j/Q9J+8sIXdb9T/6krXkzh2Y8AfAgdiZRVuXHKShkU3EELpe6XISr28cDO8c2FqiPnc+o7JqzkTeKinytkgLYX1BTIDWKVrzgoIJIi8hDriP+dsuHSHIj6Bxzu6xZ++d57AEMXlltLLu74TTZYnu2aw9GBoapVyO3pJKjRa7gnQnZ+kqcnmn7hBl5xYqV+LynUoC56uMpZo3KcRjALJSBX5gc0rkHrJ+SImqZE9osa89LS6aYGnrgTDDqtOKErDFuwbZ90S3CHRG8Tyf3u++gZKGRSUdv83o4XkehQQPsQbCKBP92du9mEy1pAe6NeyKmOnQWEjnN825s1hcFOFOyWiXYOaGGLgFRFrrp3hji2NyajkQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 07:18:21.8380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daa165a2-460e-4734-ec64-08defcf8e2b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9344
X-purgate-ID: tlsNG-720697/1787037508-309C32AC-986DA9E5/0/0
X-purgate-type: clean
X-purgate-size: 7568



On 18-Aug-26 04:52, Wig Cheng wrote:
> Add a console driver for the classic i.MX UART IP ("fsl,imx6q-uart"
> compatible), used as the console UART on the i.MX8M family.  Baudrate
> and pin configuration are inherited from the bootloader; the driver
> only enables the transmitter/receiver and wires up the RX/TX
> interrupts, mirroring the existing imx-lpuart driver.
> 
> The i.MX8M family's UART IP differs from the LPUART used on
> i.MX8QM/8QXP, so a separate driver is needed.
> 
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> ---
>  xen/arch/arm/include/asm/imx-uart.h |  57 +++++++
>  xen/drivers/char/Kconfig            |   8 +
>  xen/drivers/char/Makefile           |   1 +
>  xen/drivers/char/imx-uart.c         | 226 ++++++++++++++++++++++++++++
You should add an entry to the MAINTAINERS file for imx-uart.c so that it falls
down under ARM maintainership. Your last patch makes you a reviewer but we still
need to be maintainers of it. See how it was done for IMX8QM.

>  4 files changed, 292 insertions(+)
>  create mode 100644 xen/arch/arm/include/asm/imx-uart.h
>  create mode 100644 xen/drivers/char/imx-uart.c
> 
> diff --git a/xen/arch/arm/include/asm/imx-uart.h b/xen/arch/arm/include/asm/imx-uart.h
> new file mode 100644
> index 0000000000..a3892020e6
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/imx-uart.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Register definitions for the classic i.MX UART IP
> + * ("fsl,imx6q-uart" compatible), used as the console UART on the
> + * i.MX8M family.
> + *
> + * Register layout taken from Linux drivers/tty/serial/imx.c.
> + *
> + * Copyright 2026 Open-EP (E-Paper) Community
> + */
> +
> +#ifndef ASM_IMX_UART_H
> +#define ASM_IMX_UART_H
> +
> +#include <xen/const.h>
> +
> +#define URXD0           0x00   /* Receiver Register */
> +#define URTX0           0x40   /* Transmitter Register */
> +#define UCR1            0x80   /* Control Register 1 */
> +#define UCR2            0x84   /* Control Register 2 */
> +#define USR1            0x94   /* Status Register 1 */
> +#define USR2            0x98   /* Status Register 2 */
> +#define UTS             0xb4   /* Test Register */
> +
> +#define URXD_RX_DATA    0xff
> +
> +#define UCR1_UARTEN     BIT(0, U)   /* UART enable */
> +#define UCR1_ATDMAEN    BIT(2, U)   /* Aging DMA timer enable */
> +#define UCR1_TXDMAEN    BIT(3, U)   /* Transmitter ready DMA enable */
> +#define UCR1_TXMPTYEN   BIT(6, U)   /* Transmitter empty interrupt enable */
> +#define UCR1_RXDMAEN    BIT(8, U)   /* Receiver ready DMA enable */
> +#define UCR1_RRDYEN     BIT(9, U)   /* Receiver ready interrupt enable */
> +#define UCR1_TRDYEN     BIT(13, U)  /* Transmitter ready interrupt enable */
> +
> +#define UCR2_SRST       BIT(0, U)   /* 0 = issue software reset */
> +#define UCR2_RXEN       BIT(1, U)   /* Receiver enable */
> +#define UCR2_TXEN       BIT(2, U)   /* Transmitter enable */
> +
> +#define USR1_TRDY       BIT(13, U)  /* Transmitter ready */
> +
> +#define USR2_RDR        BIT(0, U)   /* Receive data ready */
> +#define USR2_ORE        BIT(1, U)   /* Overrun error */
> +
> +#define UTS_TXFULL      BIT(4, U)   /* TX FIFO full */
> +#define UTS_RXEMPTY     BIT(5, U)   /* RX FIFO empty */
> +#define UTS_TXEMPTY     BIT(6, U)   /* TX FIFO empty */
> +
> +#endif /* ASM_IMX_UART_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index 8e49a52c73..f237c0220d 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -30,6 +30,14 @@ config HAS_IMX_LPUART
>  	help
>  	  This selects the i.MX LPUART. If you have i.MX8QM based board, say Y.
>  
> +config HAS_IMX_UART
> +	bool "i.MX UART driver"
> +	default y
> +	depends on ARM_64
> +	help
> +	  This selects the classic i.MX UART. If you have an i.MX8M family
> +	  based board, say Y.
> +
>  config HAS_MVEBU
>  	bool "Marvell MVEBU UART driver"
>  	default y
> diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
> index 8cbbffdca8..039f566926 100644
> --- a/xen/drivers/char/Makefile
> +++ b/xen/drivers/char/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_HAS_SCIF) += scif-uart.o
>  obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
>  obj-$(CONFIG_XHCI) += xhci-dbc.o
>  obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
> +obj-$(CONFIG_HAS_IMX_UART) += imx-uart.o
>  obj-$(CONFIG_HAS_LINFLEX) += linflex-uart.o
>  obj-$(CONFIG_GENERIC_UART_INIT) += uart-init.o
>  obj-y += serial.o
> diff --git a/xen/drivers/char/imx-uart.c b/xen/drivers/char/imx-uart.c
> new file mode 100644
> index 0000000000..fd34b0cd11
> --- /dev/null
> +++ b/xen/drivers/char/imx-uart.c
> @@ -0,0 +1,226 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Driver for the classic i.MX UART IP ("fsl,imx6q-uart"), used as the
> + * console UART on the i.MX8M family (e.g. i.MX8MP).
> + *
> + * Baudrate and pin configuration are inherited from the bootloader.
> + *
> + * Copyright 2026 Open-EP (E-Paper) Community
> + */
> +
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/irq.h>
> +#include <xen/mm.h>
> +#include <xen/serial.h>
> +#include <asm/device.h>
> +#include <asm/imx-uart.h>
> +#include <asm/io.h>
> +
> +#define imx_uart_read(uart, off)       readl((uart)->regs + (off))
> +#define imx_uart_write(uart, off, val) writel((val), (uart)->regs + (off))
> +
> +static struct imx_uart {
> +    uint32_t irq;
> +    char __iomem *regs;
> +    struct irqaction irqaction;
> +    struct vuart_info vuart;
> +} imx8m_com;
> +
> +static void imx_uart_interrupt(int irq, void *data)
> +{
> +    struct serial_port *port = data;
> +    struct imx_uart *uart = port->uart;
> +
> +    if ( imx_uart_read(uart, USR2) & USR2_RDR )
> +        serial_rx_interrupt(port);
> +
> +    if ( imx_uart_read(uart, USR1) & USR1_TRDY )
Looking at Linux's imx.c you should clear TRDY if TRDEN is not enabled to
prevent RX interrupt entering serial_tx_interrupt as TRDY is a raw status register.

> +        serial_tx_interrupt(port);
> +}
> +
> +static void __init imx_uart_init_preirq(struct serial_port *port)
> +{
> +    struct imx_uart *uart = port->uart;
> +    uint32_t ucr1, ucr2;
> +
> +    /*
> +     * Reuse the bootloader settings; only enable the UART and both
> +     * directions.  The console uses UCR1 interrupts (RRDYEN/TRDYEN)
> +     * exclusively, so just clear UCR1's interrupt and DMA enables.
> +     */
> +    ucr1 = imx_uart_read(uart, UCR1);
> +    ucr1 &= ~(UCR1_RRDYEN | UCR1_TRDYEN | UCR1_TXMPTYEN | UCR1_RXDMAEN |
> +              UCR1_TXDMAEN | UCR1_ATDMAEN);
> +    ucr1 |= UCR1_UARTEN;
> +    imx_uart_write(uart, UCR1, ucr1);
> +
> +    ucr2 = imx_uart_read(uart, UCR2);
> +    ucr2 |= UCR2_SRST | UCR2_RXEN | UCR2_TXEN;
> +    imx_uart_write(uart, UCR2, ucr2);
> +}
> +
> +static void __init imx_uart_init_postirq(struct serial_port *port)
> +{
> +    struct imx_uart *uart = port->uart;
> +    uint32_t ucr1;
> +
> +    uart->irqaction.handler = imx_uart_interrupt;
> +    uart->irqaction.name = "imx_uart";
> +    uart->irqaction.dev_id = port;
> +
> +    if ( setup_irq(uart->irq, 0, &uart->irqaction) != 0 )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to allocate imx_uart IRQ %d\n", uart->irq);
uart->irq is unsigned, so s/%d/%u.

~Michal


