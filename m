Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EABFC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 07:18:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393505.1632333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwE5r-0001VN-3O; Tue, 18 Aug 2026 07:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393505.1632333; Tue, 18 Aug 2026 07:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwE5q-0001VD-WE; Tue, 18 Aug 2026 07:18:43 +0000
Received: by outflank-mailman (input) for mailman id 1393505;
 Tue, 18 Aug 2026 07:18:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwE5p-0001Sh-JU
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:18:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwE5p-001SIS-0E
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:18:41 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a840741-8faa-0a2a0a5109dd-0a2a450cb95a-26
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:18:40 +0200
Received: from [40.93.195.24]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a84074f-f479-0a2a450c0019-285dc318355c-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:18:40 +0200
Received: from CH0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:610:b0::20)
 by BN3PR12MB9596.namprd12.prod.outlook.com (2603:10b6:408:2cb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 07:18:34 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::74) by CH0PR03CA0015.outlook.office365.com
 (2603:10b6:610:b0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 07:18:34 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 07:18:34 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 02:18:34 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 02:18:32 -0500
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
 b=ofIcB+1E9aOz0UkvhfRrMgX94pUES2qyRLM7cZIj0OKrs2SEXaE0h8TIluWvPXBMgbxierhOifUtzp6WBuKEeqbvT/bmYzLIqMEPsfeyvQ0q6SgxQeW49OkBJ77wxyYEwwQ3JiNKLnE3eUXLLPR6ujebr58ePRCCyWn7VPyKe/4ikWWhI4CxR4F8UIk2eYgWK+coZc+AVcxpEuWkrlFhyNk1HS6DjjYcwXTi75C5BBMMI0EQFFj5QI+hAx968L8huD/ysES1Ohn7aIFOicaanbCY6HzQ5PKfXCcrqg8iDeQtADc0kqWQiddfTq3RXj37pLdNqQK88vYZuqgjSeX44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpcGkFvRyFdHnDIV8aQW+2Sdjn7ZdrKvUXdmQa2bF6I=;
 b=NphPv/QhjDkE/m203rKK21pInp1Xz4gpBU01l858gKZLtQgpgEAL2y0eskCrVZOxnRTr6EHGsLwSvGUeULsV5rQJLJj2jVL0U2+W4hZXOz3DrJBrjoBjp6vsGdhm8uDcJkf/ad3otWX3c48pc1Z4jKRPc+VjNwR1003DqDVOa2IDpBgE7HSGyLOYeWJX2GHtyxcn+MuQplVZ46PWjP08goFVFbodh06ROFv270DYVd35dpL0wMpgr39FsJS1cNYNhSi6/kXk64YQ0WVnLRz17ZQIBoNxa4t/qmM74QH2tNWGeF/QeK7N8+Tg3lehFHOnXSKjOohtMqAQ9WIp2mI3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpcGkFvRyFdHnDIV8aQW+2Sdjn7ZdrKvUXdmQa2bF6I=;
 b=B6QstF5D7PoQFxjAudqg6+luDm2ait6t9drGILlW+1bbtAvBR6pmIfctMNlfMPIa98KEdSQQA+YXNfGnwqNXvUsYvF8LA55mq+8Xj2E9zKskQf7QN110ongduRDCi/At+n2kVOmfFQg5jA7ibMWeFNwnSILsHWV8qw3kVK9l1vY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <09d25fc1-4482-497e-a91a-24c444a9218b@amd.com>
Date: Tue, 18 Aug 2026 09:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm: add i.MX8M platform support
To: Wig Cheng <onlywig@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
References: <20260818025224.4165503-1-onlywig@gmail.com>
 <20260818025224.4165503-4-onlywig@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260818025224.4165503-4-onlywig@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|BN3PR12MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b6b8a6-8ac5-4e41-c145-08defcf8ea3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|6133799003|10067099003|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+caQWHt9jjZAUskXRfefnodGMvSrO4lKCngr5vGF51FJfLD06Xg7+gTtLS8lT4Zq1Crw0ZEfpbeeJYbv3JG+sf/lfb424Y2QC2HBy1xMm/bCWRTd2ubl89Xi3IIRsPvqO/qCqx2ohWcCyWCzjIZ6DTob4OCj4C5JVfRcV0Y1Ie8oQWk1yp7rEz5kD2oQ3Eb8IyfWnOk7dyD9C6/ZAbYxQBYLjL1CcPuIsi1Xq9a7lhoRY1GMsinwtVIoHgp6jfWssO1pJiHUUDKL5wkIJ42sQJGBqPx1BeGencAzBOVJZb1G3JaYRMeCzLtjFEcV+L4cSEod0Ry4plkvGt8wVrwMa5EWB3jLHUsce0NSEksjHpGw170pmgSiQQ3mBmPBVhOAFSTlXrL+LfUduoLB/lIfiUSguwQVm7oE2JlCg/Mt9uVOIUe1G8CkKECXGTA1y0jsy6PdVHjdTu1Z3g9ePkxjzpjxAJ0KSN1PJvAQNone5ulXgzWsJRdnHFcp6NxWzfQ15KWb8DtyTXRpQqbmtXP8Smffc91sbb1sPrUv5QO/9rWOkF7B4ckor1NJ8dw6B5x2gDqgqolj5+PkbL+izRFYJqvE33hS9otEABrcx6x4Cqs2RDKoTsq/+WjyI11HhkjOn83DN2mUAibZRWtMCpnGk1eX7CowOzlZVJAy6omp5dmz6sT9XD4wGR7NigHmt/UultTq46kSENVBrNoEbrqSHg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(6133799003)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NvGciwGAZ5z4/Kcy8gWrd/yf2lG3hLMW2skcJZj6Kav+HKwSeR9bR2MkPkbq/3gAIs082VRV5cS6Wx1FL08ucvrdx+Lx1f6mxbyXir4GJ/qF6HLc8sXVTgz87nEWEU2zs6C0/pVSxA2JNPZvYTKbVY/QCRpVD7nILqWigt47JY9AzoGUqz95p5eI8ybyg/oBlWFwDqqTD0YyZD2enXnVnhkD6kaevc1CTp0zLAAKK+cIG3pXVN8VRnH/izldZBinnoJ0X59X/TLJgYjJ1psePgFLAB56K969/xnFzwQuZLdhI7b6jU2yphaZgPSMIObcohT8YREdnbHvRYQT+k4ZRmkMgh2+l05nUH/meyXjQv/KPsJYOT2uvz9a2UuIIPmK+1BsQGizUn1FwacScUJ6kprzrktvaiRzhJSIiU+Cb+0ZZKgTF3rcULGFnsw8mQTQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 07:18:34.5025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b6b8a6-8ac5-4e41-c145-08defcf8ea3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9596
X-purgate-ID: tlsNG-d25034/1787037520-032D8A5B-3E427AAC/0/0
X-purgate-type: clean
X-purgate-size: 7479



On 18-Aug-26 04:52, Wig Cheng wrote:
> Add platform glue for the NXP i.MX8M family (i.MX8MP/MQ/MM/MN).
> 
> When Linux is used as dom0 a number of drivers make SiP SMC calls into
> TF-A to manage hardware: GPC power domains, DDR frequency scaling, SRC
> (M-core remoteproc), SoC info and NoC QoS.  There is no public
> specification for these calls; the function IDs and their subfunctions
> are taken from the vendor kernel call sites.
> 
> Forward only the specific subfunctions the hardware domain issues,
> following the whitelist model of the i.MX8QM platform.  Where a service
> has a fixed set of subfunctions (GPC, SRC, NoC) they are filtered; DDR
> DVFS is left at service level because its reg1 is a frequency setpoint
> rather than a fixed subfunction id, and the SoC info call is a read-only
> query.  CPU frequency scaling is denied because the hardware domain
> cannot make an informed decision, and any unknown function ID is
> rejected.
> 
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> ---
>  xen/arch/arm/platforms/Makefile |   1 +
>  xen/arch/arm/platforms/imx8m.c  | 152 ++++++++++++++++++++++++++++++++
>  2 files changed, 153 insertions(+)
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
> index 0000000000..fcf01298d8
> --- /dev/null
> +++ b/xen/arch/arm/platforms/imx8m.c
> @@ -0,0 +1,152 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * i.MX 8M family setup
> + *
> + * Copyright 2026 Open-EP (E-Paper) Community
> + */
> +
> +#include <xen/sched.h>
> +#include <asm/platform.h>
> +#include <asm/smccc.h>
You should also include asm/regs.h for `get/set_user_regs()`

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
> +#define IMX_SIP_FID(fid) \
> +    ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, \
> +                       ARM_SMCCC_CONV_64, \
> +                       ARM_SMCCC_OWNER_SIP, \
> +                       (fid))
> +
> +/*
> + * SiP SMC function IDs used by the i.MX8M Linux drivers.  There is no
> + * public specification for these; the IDs and their subfunctions are
> + * extracted from the vendor kernel call sites (see drivers/soc/imx,
> + * drivers/devfreq, drivers/remoteproc).
> + */
> +#define IMX_SIP_F_GPC       0x0   /* GPC power-domain control */
> +#define IMX_SIP_F_CPUFREQ   0x1
Why no description?

> +#define IMX_SIP_F_DDR_DVFS  0x4   /* DRAM frequency scaling */
> +#define IMX_SIP_F_SRC       0x5   /* SRC: M-core remoteproc start/stop */
> +#define IMX_SIP_F_SOC_INFO  0x6   /* read-only SoC info query */
> +#define IMX_SIP_F_NOC       0x8   /* NoC QoS priority setup */
> +
> +#define IMX_SIP_GPC_SF_PM_DOMAIN    0x03
> +
> +#define IMX_SIP_SRC_SF_M4_START     0x00
This seems to be unused. Why?

> +#define IMX_SIP_SRC_SF_M4_STOP      0x02
> +
> +#define IMX_SIP_NOC_SF_LCDIF        0x00
This seems to be unused. Why?

> +#define IMX_SIP_NOC_SF_PRIORITY     0x01
> +
> +static bool imx8m_smc(struct cpu_user_regs *regs)
> +{
> +    uint32_t function_id = get_user_reg(regs, 0);
> +    uint32_t subfunction_id = get_user_reg(regs, 1);
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
> +    /*
> +     * Forward only the subfunctions the dom0 kernel actually issues.  All
> +     * of these manage hardware that belongs to the hardware domain (power
> +     * domains, DRAM controller, M-core, NoC) or are read-only queries.
> +     */
> +    switch ( function_id )
> +    {
> +    case IMX_SIP_FID(IMX_SIP_F_GPC):
> +        if ( subfunction_id != IMX_SIP_GPC_SF_PM_DOMAIN )
> +            goto deny_subfunction;
> +        break;
> +
> +    case IMX_SIP_FID(IMX_SIP_F_SRC):
Please list the cases in an order (GPC, CPUFREQ ...)

> +        if ( subfunction_id > IMX_SIP_SRC_SF_M4_STOP )
> +            goto deny_subfunction;
> +        break;
> +
> +    case IMX_SIP_FID(IMX_SIP_F_NOC):
> +        if ( subfunction_id > IMX_SIP_NOC_SF_PRIORITY )
> +            goto deny_subfunction;
> +        break;
> +
> +    case IMX_SIP_FID(IMX_SIP_F_DDR_DVFS):
IMO the stated reason for CPUFREQ applies here as well and we should rather deny
this call. What makes it safe in your opinion to allow this call?

> +        /*
> +         * For DDR DVFS reg1 is a frequency setpoint index (or the
> +         * GET_FREQ_COUNT / GET_FREQ_INFO query), not a fixed subfunction
> +         * id, so it is not filtered here.
> +         */
> +        break;
> +
> +    case IMX_SIP_FID(IMX_SIP_F_SOC_INFO):
> +        break;
> +
> +    /*
> +     * CPU frequency scaling: the hardware domain does not see the whole
> +     * system and cannot make an informed decision, so deny it (matches
> +     * the i.MX8QM platform).
> +     */
> +    case IMX_SIP_FID(IMX_SIP_F_CPUFREQ):
> +        return false;
> +
> +    default:
> +        gprintk(XENLOG_WARNING, "imx8m: smc: Unknown function id %x\n",
> +                function_id);
> +        return false;
> +    }
> +
> +    arm_smccc_1_1_smc(function_id,
> +                      subfunction_id,
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
> +
> + deny_subfunction:
> +    gprintk(XENLOG_WARNING,
> +            "imx8m: smc: function %x: denied subfunction %x\n",
> +            function_id, subfunction_id);
IMO just return false directly on deny, no need for goto and printk, given that
Xen will also print Unhandled SMC/HVC from `vsmccc_handle_call()`.

> +    return false;
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


