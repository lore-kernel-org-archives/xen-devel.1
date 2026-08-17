Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D082C5DF66
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 11:38:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392859.1631825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvvf7-0000Xj-8H; Mon, 17 Aug 2026 11:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392859.1631825; Mon, 17 Aug 2026 11:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvvf7-0000Xc-4T; Mon, 17 Aug 2026 11:37:53 +0000
Received: by outflank-mailman (input) for mailman id 1392859;
 Mon, 17 Aug 2026 11:37:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wvvf5-0000XG-Ii
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 11:37:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvvf4-003Nqo-FK
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 13:37:50 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a82f279-2eae-0a2a0a5409dd-0a2a450be034-42
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 13:37:50 +0200
Received: from [40.93.195.16]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a82f28c-b7e8-0a2a450b0019-285dc3108a18-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 13:37:49 +0200
Received: from BN0PR04CA0038.namprd04.prod.outlook.com (2603:10b6:408:e8::13)
 by PH0PR12MB5629.namprd12.prod.outlook.com (2603:10b6:510:141::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 11:37:44 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::60) by BN0PR04CA0038.outlook.office365.com
 (2603:10b6:408:e8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 11:37:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Mon, 17 Aug 2026 11:37:44 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 06:37:44 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 17 Aug 2026 06:37:42 -0500
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
 b=bLLYVsEwC3V6kXSlq27VhRVlZHEVF929Arw95MY1Wayt4qHpsGXVDcoRzbfCFaHAktFg1WGWnsaLF+qcq2GW1QOL1TCdAshTTDAKZG1TfvDIg2b0Ymdurtkg6/Fpq6ZEal9RQe0dUpj/nUKWrjBzxw9HKhKScgmvNlF5M/eBddIGGtcHfEIe2LmW51WJONuBRtgEIVVBNHbWB2/xeBnClismP96ZQ8v13/uCE5y8iOaq0TFZqryrbZAIfGOnY9RysTY/vTMiuOdYzI7WzaZsv2uFf/NFJWqc7bSKru0Ud9GcQZYBQfdmz1AVW+dXYb/lobmVeEB9Z4IR/ihD5M0NeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Biei+yh1U5imaqv4qa4tb64kIMDwlCDUJi9sft3RFc=;
 b=L7edlkLrSXnCn7PcaCwlKruW6tvsZUzr2G6hJNsj/pY8hrChHBUEUYPHqTvmSyBJoXLpwZwqEUaiiqqVMaX5riFtnqlTvpfBvCKei+6nNX4WkJWKbXroeVRXGCZblyIGFcMNf090JFyarniKe+7yU/ITu8cz0FR6P+yrwGElccgcYL1L1cGD7260ogV80jqzI+qxWO1nZMbwJuosb91i/MLmqnSeUWuE/ezLRwOZaoScgJ4awyJh8hj/zhT7CNugjx01MQSm7ISMKD7ETtE7Zeh0CU9n7lwEqg4CwdYUTIu3s+vXE0cWJNWtNsJ1a7Bh4i/Gp2rQ8aYu+aFoAlr3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Biei+yh1U5imaqv4qa4tb64kIMDwlCDUJi9sft3RFc=;
 b=HDyVVcVjaEU5YOjPDTi30tcFZSLlnlEfclRGA3FUBsIC+MR1zhH/2j+KliC8Naanrz3fC94T43eM7TmNyofCrWwPtafdEfp3scAgQA9YldEJNO6qO/M5U9aRozK9Gn3AY46CpyJ4EPXILa2MM9UMunah7O1HpEyryXBzVVvgXO8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <9da86b28-0604-45b7-9aae-7d46f4898d6d@amd.com>
Date: Mon, 17 Aug 2026 13:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/arm: add i.MX8M platform support
To: Wig Cheng <onlywig@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
References: <20260814162535.331459-1-onlywig@gmail.com>
 <20260814162535.331459-4-onlywig@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260814162535.331459-4-onlywig@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|PH0PR12MB5629:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e31cce1-ac4f-4ba8-87af-08defc53f453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	3lQRelWc0Qzevrn/snAK1e9iGHE7DcCyobCUzLR3e6MSmtpnY7NM6oxwM2re9Q6voDzCWuIOVC9xCJ8apQ6YKI3mH/orvc1ARJODdrhU6xEbo808eoZv9W36cnx1RHDutm+4ZQs/zXLZkQfZ2aQ+vyikqT7VWtSRSSYXSWWoWrnk5sglxiWlKuauP5bS54rADu98XqpgudE/XwtkAuxS0DSVFm6+7zseqVaDt/7WWMwVE4w2R5yXVV3NmzizCjbDqW50/IYsIBbF2FsDN0A9X1Uy3O+BCn2Hie9EWTrZg+MX0YBeqViGrgt+uvN60Gc1qEnBX5F93HCIG1yEWnUyI4BmEs+emQx994DWDbcc0G1K5KtySLPSpBGFUc65ywqbyiiRZaHOVcgVKYze8CTSMK/NKKpPrARCoZFEwHG6FSi4h0Qcv8eRcyePkW8yAXPbZEpGAoWVkLEDwOgitdPrCP0FEbo/cSeZaZ1Dm8Yq3Zn9kcjdDUN9JibBMdQ3fMjwqv4VEcP4B0y5HjFaJEbaeiVmQgHT4PI1sp2xY6XJDCJMUL+82l01nqYM0NpHTXaumyGnVlaNPRIewI2v7TgsmlaCw82HJp/METYFDHqaicUPM7ajWcyoSUuxCs5M0vYMZMpe2JdzhKqS4yFAnuMoOlVFn75V5uXYqZK6qV7M6OExfr8n/WUQTq7P5qacQyJfZqpj+CaGT1tiuMifACmwdw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P4nfGcNlhRRL+Ya3O8k/xe7MzUpeYJ9Y1OFLdm3y1JWuZt7AnuM4id1n81DwZ5gjC5T7FgX/XcRnxPW0D/kE2gYC+Ee2EKVzpCfz4jYWnVt8MZ6zYsiwp5rGCYCnc+zMZxnnhLON3llS0N8pgUQkRQFKaJkgxI4JKr4MGwRwrZf3LMgmeK0EfsZH8PHTuk96VzPhSz19xAGXUT5RE4Fk/FtIV7Tm8y5KeQ/2pQpNVb4lnQXXm70lPK4lOmKb/Ta9FaZOEBnM2V7GdLyyKSmqTbSw4iXKuKNFkNxKoctgo4wxtFWMyJP4Wjh5jPwozVYokBaFdINdOW2a0s+gvw7bLsck+VOnGiSZ5v9/vqRF/EM8o9/hfl+lrt+Nxi9Yh0AXrK/73MGOUOdi9nH4YaEbBQWhNhWQ3+PneQpAo0l41d3R+KpHN/bZp/3Zl4LyqZVd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 11:37:44.4362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e31cce1-ac4f-4ba8-87af-08defc53f453
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5629
X-purgate-ID: tlsNG-42698a/1786966669-1AAD89EA-B2121D8A/0/0
X-purgate-type: clean
X-purgate-size: 6203



On 14-Aug-26 18:25, Wig Cheng wrote:
> Add platform glue for the NXP i.MX8M family (i.MX8MP/MQ/MM/MN).
> 
> When Linux is used as dom0 a number of drivers make SiP SMC calls into
> TF-A to manage hardware: GPC power domains, DDR frequency scaling, SRC
> (M-core remoteproc), SoC info, NoC QoS and BBSM tamper status.  There
> is no public specification for these calls; the function IDs are taken
> from the upstream and vendor kernels.
> 
> Forward this reviewed set of calls from the hardware domain, following
> the whitelist model of the i.MX8QM platform.  CPU frequency scaling is
> denied because the hardware domain cannot make an informed decision,
> and any unknown function ID is rejected.
> 
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> ---
>  xen/arch/arm/platforms/Makefile |   1 +
>  xen/arch/arm/platforms/imx8m.c  | 116 ++++++++++++++++++++++++++++++++
>  2 files changed, 117 insertions(+)
>  create mode 100644 xen/arch/arm/platforms/imx8m.c
> 
> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
> index bec6e55d1f..cdf936c50d 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_ALL_PLAT)   += sunxi.o
>  obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>  obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>  obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
> +obj-$(CONFIG_ALL64_PLAT) += imx8m.o
>  obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
>  obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>  obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
> diff --git a/xen/arch/arm/platforms/imx8m.c b/xen/arch/arm/platforms/imx8m.c
> new file mode 100644
> index 0000000000..dc49e754ee
> --- /dev/null
> +++ b/xen/arch/arm/platforms/imx8m.c
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
Any specific reason for 2+? Can it be just GPLv2 only? We tend to prefer the
former as some companies are wary of v3.

> +/*
> + * xen/arch/arm/platforms/imx8m.c
Please remove this line. It does not add any useful information and can quickly
go stale.

> + *
> + * i.MX 8M family setup
> + *
> + * Copyright 2026 Open-EP (E-Paper) Community
> + */
> +
> +#include <xen/sched.h>
> +#include <asm/platform.h>
> +#include <asm/smccc.h>
> +
> +static const char * const imx8m_dt_compat[] __initconst =
> +{
> +    "fsl,imx8mp",
> +    "fsl,imx8mq",
> +    "fsl,imx8mm",
> +    "fsl,imx8mn",
> +    NULL
> +};
> +
> +/*
> + * SiP SMC function IDs used by the i.MX8M Linux drivers.  There is no
> + * public specification for these; the IDs and names are extracted from
> + * the upstream and vendor kernels (see drivers/soc/imx, drivers/devfreq,
> + * drivers/remoteproc, drivers/firmware/imx).
> + */
> +#define IMX_SIP_GPC         0xC2000000  /* GPC power-domain control */
Please create a macro utilizing ARM_SMCCC_CALL_VAL same as i.MX 8QM platform
driver (or EEMI) so that these values denote actual functions

> +#define IMX_SIP_CPUFREQ     0xC2000001
> +#define IMX_SIP_DDR_DVFS    0xC2000004  /* DRAM frequency scaling */
> +#define IMX_SIP_SRC         0xC2000005  /* SRC: M-core remoteproc start/stop */
> +#define IMX_SIP_GET_SOC_INFO 0xC2000006
All values should be equally indented

> +#define IMX_SIP_NOC         0xC2000008  /* NoC QoS priority setup */
> +#define IMX_SIP_BBSM        0xC200000D  /* BBSM tamper status */
> +
> +static bool imx8m_smc(struct cpu_user_regs *regs)
> +{
> +    uint32_t function_id = get_user_reg(regs, 0);
> +    struct arm_smccc_res res;
> +
> +    if ( !cpus_have_const_cap(ARM_SMCCC_1_1) )
> +    {
> +        printk_once(XENLOG_WARNING
> +                    "imx8m: smc: no SMCCC 1.1 support. Disabling firmware calls\n");
> +
> +        return false;
> +    }
> +
> +    /* Only the hardware domain may use the SiP calls */
> +    if ( !is_hardware_domain(current->domain) )
> +    {
> +        gprintk(XENLOG_WARNING, "imx8m: smc: No access\n");
> +        return false;
> +    }
> +
> +    switch ( function_id )
> +    {
> +    /*
> +     * All of these manage hardware that belongs to the hardware domain
> +     * (power domains, DRAM controller, M-core, NoC, secure RTC) or are
You mention RTC but there's no call for it. Did you miss it?

> +     * read-only queries.  Forward them.
Stray space before `Forward`

> +     */
> +    case IMX_SIP_GPC:
> +    case IMX_SIP_DDR_DVFS:
> +    case IMX_SIP_SRC:
> +    case IMX_SIP_GET_SOC_INFO:
> +    case IMX_SIP_NOC:
> +    case IMX_SIP_BBSM:
> +        break;
> +
> +    /*
> +     * CPU frequency scaling: the hardware domain does not see the whole
> +     * system and cannot make an informed decision, so deny it (matches
> +     * the i.MX8QM platform).
> +     */
> +    case IMX_SIP_CPUFREQ:
> +        return false;
> +
> +    default:
> +        gprintk(XENLOG_WARNING, "imx8m: smc: Unknown function id %x\n",
> +                function_id);
> +        return false;
> +    }
The difference between this driver and QM is that the latter whitelists
subfunctions whereas you whitelist whole services which seems like a lot. I
don't want to go into details of TF-A, Linux but I would recommend you looking
at subfunctions dom0 actually needs.

~Michal

> +
> +    arm_smccc_1_1_smc(function_id,
> +                      get_user_reg(regs, 1),
> +                      get_user_reg(regs, 2),
> +                      get_user_reg(regs, 3),
> +                      get_user_reg(regs, 4),
> +                      get_user_reg(regs, 5),
> +                      get_user_reg(regs, 6),
> +                      get_user_reg(regs, 7),
> +                      &res);
> +
> +    set_user_reg(regs, 0, res.a0);
> +    set_user_reg(regs, 1, res.a1);
> +    set_user_reg(regs, 2, res.a2);
> +    set_user_reg(regs, 3, res.a3);
> +
> +    return true;
> +}
> +
> +PLATFORM_START(imx8m, "i.MX 8M")
> +    .compatible = imx8m_dt_compat,
> +    .smc = imx8m_smc,
> +PLATFORM_END
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */


