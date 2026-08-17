Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498B7C5DF70
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 09:27:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392777.1631772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtcB-0006Wd-DE; Mon, 17 Aug 2026 09:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392777.1631772; Mon, 17 Aug 2026 09:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtcB-0006WW-9y; Mon, 17 Aug 2026 09:26:43 +0000
Received: by outflank-mailman (input) for mailman id 1392777;
 Mon, 17 Aug 2026 09:26:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wvtcA-0006WK-7L
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:26:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvtc8-00GTFz-KN
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 11:26:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a82d3ca-8faa-0a2a0a5109dd-0a2a4506e298-28
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 11:26:40 +0200
Received: from [40.107.201.17]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a82d3ce-195a-0a2a45060019-286bc9117c69-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 11:26:40 +0200
Received: from CH2PR03CA0029.namprd03.prod.outlook.com (2603:10b6:610:59::39)
 by DS0PR12MB9038.namprd12.prod.outlook.com (2603:10b6:8:f2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 09:26:31 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::a6) by CH2PR03CA0029.outlook.office365.com
 (2603:10b6:610:59::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 09:26:31 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 09:26:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 04:26:30 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 04:26:30 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 17 Aug 2026 04:26:29 -0500
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
 b=iXAGuYWeunkmgeBK//chsjOk/y2+0kEuBP4euZh0gi9m59GcNmvDOrokhc+BGrWzJM/rH/CnmIzob7l2HRB1eq89TPNIg8WsfuL5W4UtZ0axtoBRAwyHHsyZ8MmMil1+bdP9oKZQMqclsoILrrSybMy0XypB/n2UdMM+y4MX2irjJ+3fUN6PGFIKeQn1hKrIPF8aqLsa1JB7lTAZIea2AXCBwAdKpNjmnaE5XoHJ0XdLBX1TNJqqVYGbMP7fC/saiU1oLthSyfpoLHlNkIfQU3vxocuy9UXSA3fZUghjHVq2kZMFkFjIhcW3uFIRz+cgZR5q71H6SuBjM4NoKBZhCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uq3nSvYDaCGlbi4Gy5VEjm+C0xdTvLFJRvNtXR92NOE=;
 b=SiBiEOnKhegfMrQ9/OW53T1l73s4d6DEUOdrrchVKfR0I36ZWFnFlSt9bFDHRtDOl/5OL3wyP2jaIKkJzZ7xr5w/riV/VRuYPjfj52cmVfMdzToqJ2g8NAgRWWsuapJou5rKP8S23tYJNYkknWK9I23GxlBctwtvOdLMKFtfgK9Uz27NuNbS3Jp25JexjVrbVvQLQlQDlvN+jaxo02j7k615Qufn6Me4oU4Kvdx4p8+ReqzCO2wdWr1aMxliUP4N6Z/xH5RUEou97YJazN9I+xFc1qK2mP9CAUCjAfjdjcGuws/bKKauUrN+bonZ73nF+QTh8JcNasKAs5UY8vrgBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uq3nSvYDaCGlbi4Gy5VEjm+C0xdTvLFJRvNtXR92NOE=;
 b=Rb3Shn81E14DdOrh5v7GFf5Z0NlpuKa1sliJBViFC5lKO9D5MTxlcB6mcWBWSulxSyUVO8j/REcfOM+1Xk229Jw7w/8jzCSRUSp8if7An0Gu8cLrGRhxLZylvXPH3AIjrEg6ajZ/NBXislM/6bJIiHCazrHt8GgGgPdILM7cuJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4649c965-2b4f-448e-9a71-082f687d378d@amd.com>
Date: Mon, 17 Aug 2026 11:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/char: add classic i.MX UART driver
To: Wig Cheng <onlywig@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
References: <20260814162535.331459-1-onlywig@gmail.com>
 <20260814162535.331459-2-onlywig@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260814162535.331459-2-onlywig@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DS0PR12MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dda39f1-c488-495d-2a4b-08defc419f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|6133799003|3023799007|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OMU80sKN/hQLgGXSH+keSCSwuftAgKjFhFyuh56sbx6VMWSGopdb9Y0LdxMx9MBFErVhD+7GWslcsgZvNA8K94Q+i1ZAxDy0DsUL6EerzejZX0m9wql6ooTYLE0Wax9igEsYJj35KL6RAwbIkosut//ujqXzMiaG0cAUD7yxNwcZjz/CzCa6JGpifasA3Tr592Cs79ijuyWd2MluRk4ffRetgNnNSMbZUxnJQ3dqzedcFUY3YBPWbauxKJZlCXgiq/1Mg2kvgYwlgu1+VFJBvMaADv5wiT3NnlpfeoNoHbELbVEF8m7fJ8BSPPbGUBREeROw7rEHGrc9oV3BsE/c595b/kp0YFY1sRD0+1gYKoMp7cXTLv7beGjtd1+eUL6gjhecXsglwDLB6yYRVdsadx0KutDONZTsNk3ZYGxQ2BlwhrU1ASN8RQZvrjZdrhishovRUbU4rULBQ2gxo2ZrD6jPQETPphn+5lAZrHQoztBqmpyiEUKqGkRpxITaAIrj7vH0jPLKtmFUERueCS+d7MaO8nuXJTMmgUYD3MwKc55yMGG19DAZGvtfUo8pDHaMUGS/C6z57Xrh1AL1vIOEZ2y5EumTVMv7ExTa+EBlR/jsdS+8grb4FrqW360rFv83ZSii+vh1y6I2/0xxH+sDHRyIV37nYTkp0gdHhUCfDC7mydzzB4r7ByZLXXzeapR55j0LvBsu9I1sUF6MPx6RGw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/2upCiWPNPutWXawGNUGdff48bAK0hiYPw2b08Vb4jbmnWGc4HpINkqjowiM1WP5JK3J1UYiKeqkeUcFxKIabZ7a475xSfaWfVZHAIlf0ev2NRM6O7QaJLixxPMk4XYcoTLqakGV3ssYdKqSjm5P/9Ifv3pb6I5pt8vW4uxaTiv+ZsnvbdNJ8Ak2nPJjueqd8MyZ7Qatj13GRzKzScLF0pZZOb3U0XvTjQ2ly7lmQDTvLeBzw4eYxTiIeIYL/Vry7+A8jK1oyrDyGODJTMcPC2oewmv91DNm1F5I/om7u2FfIBRbCV06AQG/1Z6aucuIdCbYsl2XrEk0iHo+wjGKowv5jRN3gnwyajiDghZwBWoY8k4H0fXNpwcqYqCGORcpT7quihiOFhtMNfCZMAncjrA/P4OQRACltyNmODk1WRF0sH2bVCtqKLRZzPV1OGLS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 09:26:31.0522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dda39f1-c488-495d-2a4b-08defc419f6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9038
X-purgate-ID: tlsNG-16d1c6/1786958800-FC60277B-71CC3B42/0/0
X-purgate-type: clean
X-purgate-size: 7250



On 14-Aug-26 18:25, Wig Cheng wrote:
> Add a console driver for the classic i.MX UART IP ("fsl,imx6q-uart"
> compatible), as found on the i.MX6/7/8M families.  Baudrate and pin
You often mention i.MX 6 and 7 but guard the driver on Arm64. Please do not
mention them if you only intend to support/test i.MX 8.

> configuration are inherited from the bootloader; the driver only
> enables the transmitter/receiver and wires up the RX/TX interrupts,
> mirroring the existing imx-lpuart driver.
> 
> This is needed for the i.MX8M family, whose UART IP differs from the
> LPUART used on i.MX8QM/8QXP.
> 
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> ---
>  xen/arch/arm/include/asm/imx-uart.h |  62 ++++++++
>  xen/drivers/char/Kconfig            |   8 +
>  xen/drivers/char/Makefile           |   1 +
>  xen/drivers/char/imx-uart.c         | 227 ++++++++++++++++++++++++++++
Please add entry to MAINTAINERS for this file under ARM

>  4 files changed, 298 insertions(+)
>  create mode 100644 xen/arch/arm/include/asm/imx-uart.h
>  create mode 100644 xen/drivers/char/imx-uart.c
> 
> diff --git a/xen/arch/arm/include/asm/imx-uart.h b/xen/arch/arm/include/asm/imx-uart.h
> new file mode 100644
> index 0000000000..ad4b0b06ff
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/imx-uart.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
Can this be GPL-2.0 only?
> +/*
> + * xen/arch/arm/include/asm/imx-uart.h
This can go stale. Please drop.

> + *
> + * Register definitions for the classic i.MX UART IP
> + * ("fsl,imx6q-uart" compatible, used on i.MX6/7/8M families).
> + *
> + * Register layout taken from Linux drivers/tty/serial/imx.c.
> + *
> + * Copyright 2026 Open-EP (E-Paper) Community
> + */
> +
> +#ifndef __ASM_ARM_IMX_UART_H__
Should be ASM_IMX_UART_H

> +#define __ASM_ARM_IMX_UART_H__
> +
> +#define URXD0           0x00   /* Receiver Register */
> +#define URTX0           0x40   /* Transmitter Register */
> +#define UCR1            0x80   /* Control Register 1 */
> +#define UCR2            0x84   /* Control Register 2 */
> +#define UCR3            0x88   /* Control Register 3 */
Given that this is not a verbatim 1:1 copy from Linux (no need for it to be),
please do not define macros that are unused.

> +#define UCR4            0x8c   /* Control Register 4 */
> +#define UFCR            0x90   /* FIFO Control Register */
> +#define USR1            0x94   /* Status Register 1 */
> +#define USR2            0x98   /* Status Register 2 */
> +#define UTS             0xb4   /* Test Register */
> +
> +#define URXD_CHARRDY    (1U << 15)
Please use BIT(n, U)

> +#define URXD_RX_DATA    0xff
> +
> +#define UCR1_UARTEN     (1U << 0)
> +#define UCR1_RRDYEN     (1U << 9)   /* Receiver ready interrupt enable */
> +#define UCR1_TRDYEN     (1U << 13)  /* Transmitter ready interrupt enable */
> +#define UCR1_RXDMAEN    (1U << 8)
> +#define UCR1_TXDMAEN    (1U << 3)
> +#define UCR1_ATDMAEN    (1U << 2)
> +
> +#define UCR2_SRST       (1U << 0)   /* 0 = issue software reset */
> +#define UCR2_RXEN       (1U << 1)
> +#define UCR2_TXEN       (1U << 2)
> +
> +#define USR1_RRDY       (1U << 9)   /* Receiver ready */
> +#define USR1_TRDY       (1U << 13)  /* Transmitter ready */
> +
> +#define USR2_RDR        (1U << 0)   /* Receive data ready */
> +#define USR2_ORE        (1U << 1)   /* Overrun error */
> +#define USR2_TXDC       (1U << 3)   /* Transmission complete */
> +#define USR2_TXFE       (1U << 14)  /* Transmit FIFO empty */
> +
> +#define UTS_TXFULL      (1U << 4)
> +#define UTS_RXEMPTY     (1U << 5)
> +#define UTS_TXEMPTY     (1U << 6)
> +
> +#endif /* __ASM_ARM_IMX_UART_H__ */
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
> index 0000000000..5ae8c13c40
> --- /dev/null
> +++ b/xen/drivers/char/imx-uart.c
> @@ -0,0 +1,227 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/drivers/char/imx-uart.c
This can go stale. Please drop.

> + *
> + * Driver for the classic i.MX UART IP ("fsl,imx6q-uart"), as found on
> + * the i.MX6/7/8M families (e.g. i.MX8MP).
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
> +        serial_tx_interrupt(port);
> +}
> +
> +static void __init imx_uart_init_preirq(struct serial_port *port)
> +{
> +    struct imx_uart *uart = port->uart;
> +    uint32_t ucr1, ucr2;
> +
> +    /*
> +     * Reuse the bootloader baudrate/format settings: only make sure the
> +     * UART and both directions are enabled, DMA and interrupts are off.
> +     */
> +    ucr1 = imx_uart_read(uart, UCR1);
> +    ucr1 &= ~(UCR1_RRDYEN | UCR1_TRDYEN | UCR1_RXDMAEN | UCR1_TXDMAEN |
> +              UCR1_ATDMAEN);
What about TXMPTYEN?

> +    ucr1 |= UCR1_UARTEN;
> +    imx_uart_write(uart, UCR1, ucr1);
Only UCR1's enables are cleared, while other UCRs interrupt enables keep
whatever the bootloader left. Either mention UCR1 only or clear others too.

~Michal


