Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54343C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:37:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392608.1631566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvsqN-00052P-WB; Mon, 17 Aug 2026 08:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392608.1631566; Mon, 17 Aug 2026 08:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvsqN-00052I-TA; Mon, 17 Aug 2026 08:37:19 +0000
Received: by outflank-mailman (input) for mailman id 1392608;
 Mon, 17 Aug 2026 08:37:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wvsqM-00052C-R2
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:37:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvsqL-00Czfz-QG
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:37:17 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a82c834-8faa-0a2a0a5109dd-0a2a4507e292-36
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:37:17 +0200
Received: from [40.93.194.46]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a82c83c-b4ea-0a2a45070019-285dc22e3b12-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:37:17 +0200
Received: from SJ0PR05CA0179.namprd05.prod.outlook.com (2603:10b6:a03:339::34)
 by IA1PR12MB6412.namprd12.prod.outlook.com (2603:10b6:208:3af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 08:37:12 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::81) by SJ0PR05CA0179.outlook.office365.com
 (2603:10b6:a03:339::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Mon, 17
 Aug 2026 08:37:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 08:37:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 03:37:10 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 17 Aug 2026 03:37:09 -0500
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
 b=De4xZ41pAxskTvd8zzrsfCjraSG44fNNFZRe6iLh7c8ixsSxFshWFbeO+7K3KBrkq+P7zcS/6s4/GQwEAY17SHEYyNgr+XHFTbQzAnWS4VBx+pQqIOqU+3mapeF7UujIuIcxd6rXJDJN8bbE9jdZQAgFEiqQEALWq8k1LL4WjG+KvWvHihkodFsURC97H5Fd11N9jS8ao0+9lob9al0ViWbNtuYq4hLKpyWBdSPddlXtZfSnQZobDylGZKQegiW/utGfulPvhwQJpb5/SPno7oZtHeT/YPbP2yhl9T6Og5jWI/x+VOiFnzH8EU1UonXVhAqvpILCUUtWh/t/Tai1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4+tSok4Pnje7Wo8DoBwkNvCvPh1TY4Of3DJzT7jiAE=;
 b=u1vhzmRc25IDMpzAi7ZZSI+D1iJzPdPfoK8CAwutTCaYJJHM/GnJI5CHZ83vonQcQvgQOnFaK3HApa3mORwbpRIZW9L2/D2B7YpiSZ9kCepiZ4vmR9GuNBH3oK8WxikUWQZpwLsbYv7S/WLWyfTLUuWj5Ar2QvQ+6bCL+wZSx0pjILWEkwXSllIKX9CnUOtxebaKvritG6VIMo85oBDtAlnTtQtVEmDhuDAGqipHMYxQRg9XOEaH1Me4BU/Bz7mIuh3yS9Gl74C4AtDSfK4/RVDgb5axGUuUl4ED9pjesdyMCr2bUdjeYOmvUAxZO95b/250ktLMuSBoHjOT7k0nzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4+tSok4Pnje7Wo8DoBwkNvCvPh1TY4Of3DJzT7jiAE=;
 b=BaMksD5OJQITTjAwCdczZHY0Dg5VH7Kc1gTNGLwAF2vMC0QIkPv4hR3mN5S4FAa6seMZKCHRpMaMNAFUg4d1LkFueZPPkkFbGiGpdKmroSq87J8XYnl7M9T/YO5mI3InH1/SQyBixlgkGZQxpew8/Mu/inJX1i3iVj5JyLqVuV4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <701ab3f8-b455-44a2-947b-2e1cc8cedea9@amd.com>
Date: Mon, 17 Aug 2026 10:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm64: add early printk for the classic i.MX UART
To: Wig Cheng <onlywig@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
References: <20260814162535.331459-1-onlywig@gmail.com>
 <20260814162535.331459-3-onlywig@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260814162535.331459-3-onlywig@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|IA1PR12MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c814d3b-c696-4784-14aa-08defc3abb92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|56012099006|10067099003|3023799007|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	TKBe7U2tJBYBzp2cMIzBjZM3ux39I/DcfP0a4WGxGkKfrTwkPnekqwdFGOVIsWM1fdoe2r/JtmoZUe645vfXmkHZ8UEhNRR/lIoqsnGjvKr+CACT4RecmHQ1VSFFq8EypEcOfHbGBr0LD0JT+qyBf5tcxASz6DZ4N9OaCHN8o5bHGuJnYfH2t4zQxrLsSW/n5X4IDTvsPrhRF4GIpw0yE/AokxgQjVFjPSlt0NTppTjsoiVQMzbSFaCx0pqjDMzt5E2MXENo2oJU6hqqUj+4AIG5Tu+XcxCRooX3LPOWoN09Mab2cA2j65kNm2AgO443weunMYlUe9405y14LXCAZegSD2S6rL9iR8GKX6GHrEcP93k+qTvKnQ4LD+8pf8Ecc4GeYm1kRCWQJsh/XYoEnOlBocyMph3DYaB0Opxw78Veg2icwFXi4Lu5YhDA9F3dEF/Ycg53L3hjSw7omPqjrrxl0TEPtrmp/h+tUVsL7UTAYwqh2lSljdg1pIk+yOiKk+H+DAnVtnU4Wq0jQUbKjbnD42eDyBWa+4s4s0zWXv9T3df5ANbLVZp2KfX5wKHIkwnmgAxdfItzOaTJ5nO5jDaT55ZI4tZBgbYMoKW63izaCvcUqQA1tlpuHR0Yp3XruhV4fczM6aAFsTwrDthR3IFIYi0EpifcUVcmDC2mJIbBseZ2/qQllJgDUBL71wwunVpF0Kfwb0HPCzAXqBre5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z+Nud6/IX5E0CNHBkP4Y3rivGYnKtCvAAxEt/iJ/ym9mvuyQ9alCk76tLez8vgAomBO2u3PEH4Rj91i+TnJTiLbBcs0M96/fVPKFi7NUNaneHkeJTnGlSfGEFXb7A6un93sKipYC6KUAEcOx/t+QIx42uaeMF7sf/uHN54XJZmSzRt3iDRxePCwysFE1Es3iro+fHRlUgJ/xSDTEpBW7Ki4S9VmN27Ht64etYnfgBZGkJ+WLCK1kbn+Udc0WKMPBo3WqBu8vAwXMD3esEAe19wk3b4N2nYcmzg1kv6pFf3oi2ihyehS5r3wcb5BHQQvrrfwJp9TM8HOvgFgZEBkYLD3aiq8mGFx0memRayV3jyNfd4bUbftRY/lxlQ30UJiJdZ8gp+icR8e5YWg1dq7sYBCg36RwUhhSZuF6F/O5AjhPGBwZ0Lv3RhGwi8mbkqKz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 08:37:11.7058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c814d3b-c696-4784-14aa-08defc3abb92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6412
X-purgate-ID: tlsNG-ef75cf/1786955837-A70DDAE4-E13ABF40/0/0
X-purgate-type: clean
X-purgate-size: 3484



On 14-Aug-26 18:25, Wig Cheng wrote:
> Add an early printk implementation for the classic i.MX UART IP,
> selectable via EARLY_UART_CHOICE_IMX_UART.  The UART is expected to be
> fully initialized by the bootloader.
> 
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> ---
>  xen/arch/arm/Kconfig.debug            | 12 +++++++++
>  xen/arch/arm/arm64/debug-imx-uart.inc | 39 +++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 xen/arch/arm/arm64/debug-imx-uart.inc
> 
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index 5a03b220ac..63a34b813a 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -44,6 +44,14 @@ choice
>  		  Say Y here if you wish the early printk to direct their
>  		  output to a i.MX LPUART.
>  
> +	config EARLY_UART_CHOICE_IMX_UART
> +		select EARLY_UART_IMX_UART
> +		depends on ARM_64
> +		bool "Early printk via i.MX UART"
> +		help
> +		  Say Y here if you wish the early printk to direct their
> +		  output to the classic i.MX UART (i.MX8M family).
> +
>  	config EARLY_UART_CHOICE_LINFLEX
>  		select EARLY_UART_LINFLEX
>  		depends on ARM_64
> @@ -97,6 +105,9 @@ config EARLY_UART_EXYNOS4210
>  config EARLY_UART_IMX_LPUART
>  	select EARLY_PRINTK
>  	bool
> +config EARLY_UART_IMX_UART
> +	select EARLY_PRINTK
> +	bool
>  config EARLY_UART_LINFLEX
>  	select EARLY_PRINTK
>  	bool
> @@ -185,6 +196,7 @@ config EARLY_PRINTK_INC
>  	default "debug-cadence.inc" if EARLY_UART_CADENCE
>  	default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
>  	default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
> +	default "debug-imx-uart.inc" if EARLY_UART_IMX_UART
>  	default "debug-linflex.inc" if EARLY_UART_LINFLEX
>  	default "debug-meson.inc" if EARLY_UART_MESON
>  	default "debug-mvebu.inc" if EARLY_UART_MVEBU
> diff --git a/xen/arch/arm/arm64/debug-imx-uart.inc b/xen/arch/arm/arm64/debug-imx-uart.inc
> new file mode 100644
> index 0000000000..80ac647f5e
> --- /dev/null
> +++ b/xen/arch/arm/arm64/debug-imx-uart.inc
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/arch/arm/arm64/debug-imx-uart.inc
This can go stale. Please drop.

> + *
> + * Early printk for the classic i.MX UART IP (i.MX6/7/8M families).
Don't mention 6 and 7 in a arm64 driver.

> + * The UART is expected to be fully initialized by the bootloader.
> + *
> + * Copyright 2026 Open-EP (E-Paper) Community
> + */
> +
> +#include <asm/imx-uart.h>
This header contains non-asm compatible macros. Please fix.

> +
> +/*
> + * Wait for the UART to be ready to transmit
> + * xb: register which contains the UART base address
> + * c: scratch register
> + */
> +.macro early_uart_ready xb, c
> +1:
> +        ldr   w\c, [\xb, #UTS]        /* <- Test register */
> +        tst   w\c, #UTS_TXFULL        /* Check TX FIFO full bit */
> +        bne   1b                      /* Wait until there is room */
b.ne please

> +.endm
> +
> +/*
> + * UART transmit character
> + * xb: register which contains the UART base address
> + * wt: register which contains the character to transmit
> + */
> +.macro early_uart_transmit xb, wt
> +        str   \wt, [\xb, #URTX0]      /* -> Transmitter register */
> +.endm
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */

Other than that, it looks good.

~Michal


