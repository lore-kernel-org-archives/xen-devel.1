Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAB5C5DF81
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 07:14:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395977.1634065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwwyI-0003FO-3M; Thu, 20 Aug 2026 07:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395977.1634065; Thu, 20 Aug 2026 07:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwwyH-0003FH-Ve; Thu, 20 Aug 2026 07:13:53 +0000
Received: by outflank-mailman (input) for mailman id 1395977;
 Thu, 20 Aug 2026 07:13:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwwyG-0003FB-N5
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 07:13:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwwyG-00EEV8-3Z
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 09:13:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a86a924-e002-0a2a0a5209dd-0a2a4506a402-28
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 09:13:48 +0200
Received: from [52.101.57.54]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a86a92a-195a-0a2a45060019-34653936c83b-4
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 09:13:47 +0200
Received: from SJ0PR03CA0290.namprd03.prod.outlook.com (2603:10b6:a03:39e::25)
 by CYXPR12MB9280.namprd12.prod.outlook.com (2603:10b6:930:e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Thu, 20 Aug
 2026 07:13:42 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::1) by SJ0PR03CA0290.outlook.office365.com
 (2603:10b6:a03:39e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 07:13:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 07:13:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 02:13:41 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 02:13:40 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 02:13:39 -0500
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
 b=w04bSLi+NvUdYWugna4SPw8PL57pyFb37+KiR7y1+fCXDWjv4ZYRgHKf1GTBF+aXC6lPcS05OJXs1cOxE0QLd4hQBJ2zkixxDGbxz5LfmQDpi3lBMk3vTsPyQ2TTTzAfz9qVd/6MEKaJmjPd7JhedLMGHMOkc+oDDSKrT1dZLRsWWT2V3xcEkYT2S0kEfyJLBdhYedf8FXBE48pHK7g1OTXfpMWaWHb8O2Ixeerm28afDe8nLfkscKCDLzbiWjBHhUCC/f6yU+aEI9e9NQOtUKn+7QQQRUORcWZ8N70wA4svKE+v5wZOAjTVZEtWQ1lFmo1RwM4biei3drTMqOSRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9h8NqKPbXOk0n+m3x7gD/9twF1D1vVmvxEUaxrs3nQ=;
 b=jAzl3wmqo6d2JH0UgzDq4zCgNbowJsu3LqhwXl7WnX0K9D2l94GLTFmX54TXmf1Uyvx9NxVTEKDijo3OkKREuo0YFgCOudB7lT0Z4/9S9FJD57cxI7SkgcdJDF6IlWZl7+9AHtd1oFmRmXDabPSZiPRQK328YQHFkft3BvFOTK1Wq73Nv5+LJaBa07GV2GXiaOyaJmx2di4TH6OF/8o6ChrWENNVq5EFRX1vc/rY9AvGWToJ3bxGYZX2LywRtcDPZnUvMHew5qoc/8J1H35ND5O+x3RIlYI1YfhXJ7ChHV8tyylMvVVesq9rScTjiy+EDky6r7Re6K2rAX4fJ5Vp/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9h8NqKPbXOk0n+m3x7gD/9twF1D1vVmvxEUaxrs3nQ=;
 b=sQaH65UYdbb1Wken+mPZfvqmijCdpAg1s1mFE+aNs4W8C9Ky0lmNksSCVnDsnZLepZwrWwqZW6gSGSqIDPEFcBInKgPwG73zy4fVrk6m2Y/lZy5NH3LZNopYecU5JHj17z5WzYsRQ8wYGYqrYGxakpVEvyrox6jBLaLUV2yc2p0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d9c1df07-ae4e-4fe7-bfbf-09cfbd9ceda9@amd.com>
Date: Thu, 20 Aug 2026 09:13:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] xen/arm: add i.MX8M platform support
To: Wig Cheng <onlywig@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
References: <20260819152821.3361898-1-onlywig@gmail.com>
 <20260819152821.3361898-4-onlywig@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260819152821.3361898-4-onlywig@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|CYXPR12MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: f870b918-544c-4756-402a-08defe8a9096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wc4wIEuINhdGh+2FOiZH6tlG+7vbRF+VRDtP71BmwdjfJVLGHbkwXJ6p2gP0DjRqEGvP5vhwsSZdE1562VLv1m0DVyU3mx3fAj/1dgFSjopxWscPiJ/XJlmI/KMXy2j1n52w44AKo6wX2Im7kpA5potiiDUtUiJc0nFgCyOiJpMoH3veTTmiTj4V5nE+afmrlGhipheFASWZsaIEnF7i3sVl8TK5CMWG6nNpSbOGAoifuA7kHwZCBbmmf6+eXuBSVlGYwfoEmNTJmHyKa4iVbKXFZv045aS7YnhPioZFJYumsuIsA6nh1U9akg0Akm1fbv8RTxGslPn21Buwr0u2pQ/pNKrsaSwkQVknQyZ/daaHZmSceFxUWE5qkyUoyjwSZyBOtzuKV1is9WEeRRTusTCdtsyWu5ZNpZcQ6xUHwPPuuafyhObETu/9B6eZ8cynkV8PKOKPNqI+c4NVrAz9R3K1ggIhsaTB5o6yYBwp9Q18QnQSpVSDR+Vx07tLU7UJw4g/0GB1SDI0Ofnkh1dE+O4NGDVbY6FiocEYGJbPSl9rgQfaEcD92Y9SPVEdWAaXXIE8+7WX/YUIG/z3+y/NV34lkVfCqt3SDrmXhgeBsX2mbuzyTnG0rIf3V3OHWG3Lw0EGx+qz5GZBAD5G49Nxmj7oGN/up737vLwt3BgCWzNfpDOED8gMEZrooZgb17XTeaFmiuiS/1FVNUrLBnWVAg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	51odEQQCWbNXyfkWi5vAQ/E4QX8oHvjnanX2i0flbLGoXMY2+g3TnhVi+YxTIt5KyDzm9nVtyri/4I3Ob5GRY41+Dm6K6UoXB1YkKnZaOOYnp8Cu7WywDEiO21SFOMwcSeGFd9Xyvotq++SAdKisbeT2fje76y1DqqtevSyUYM5Nrh5TMG+adxVeBCbPRle0lkg7B6umjkgAGO9hWLeH4y8IwkwkkVlqtW1bR/U0oQJpp51dSC0ANKLMiOiQTaho36nUPgc4YzEL6v1oSqV+9XaIXndggd18SlmU7NBGuYU1F3Yqj1Bvn9N5jjvh7zq4CEiMC2hNfqAgzvP+ns3RwJ24I5Kct2Qf/kGMraXoAdLEG3GJuXBKc2OEO5UVe5SBP4/KwKDJhCObRPy3xeU/c7daXD0QO+UB7iOzI9Kgn/K0woMuNG6vUnhX0OUle/3l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 07:13:41.6539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f870b918-544c-4756-402a-08defe8a9096
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9280
X-purgate-ID: tlsNG-16d1c6/1787210028-F7ACA77B-0BBD3E8F/0/0
X-purgate-type: clean
X-purgate-size: 6775



On 19-Aug-26 17:28, Wig Cheng wrote:
> Add platform glue for the NXP i.MX8M family (i.MX8MP/MQ/MM/MN).
> 
> When Linux is used as dom0 a number of drivers make SiP SMC calls into
> TF-A to manage hardware: GPC power domains, SRC (M-core remoteproc),
> SoC info and NoC QoS.  There is no public specification for these
> calls; the function IDs and their subfunctions are taken from the
> vendor kernel call sites.
> 
> Forward only the specific subfunctions the hardware domain issues,
> following the whitelist model of the i.MX8QM platform.  Each service
> with a fixed set of subfunctions (GPC, SRC, NoC) filters them with an
> explicit switch on the subfunction id, and the SoC info call is a
> read-only query.  CPU and DRAM frequency scaling are denied because
> the hardware domain cannot make an informed decision about resources
> shared with the other domains, and any unknown function ID is
> rejected.
> 
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v4:
> - SRC and NoC: filter the subfunction id with an explicit switch that
>   lists each accepted subfunction, instead of a range check.
> - NoC: accept only the QoS priority subfunction; the LCDIF subfunction
>   has no caller in the vendor kernel.  Note that i.MX8MP issues no NoC
>   call at boot (only i.MX8MQ does).
> - Print the subfunction id as well when rejecting an unknown function
>   id.
> - Picked up Michal's Reviewed-by.
> 
>  xen/arch/arm/platforms/Makefile |   1 +
>  xen/arch/arm/platforms/imx8m.c  | 161 ++++++++++++++++++++++++++++++++
>  2 files changed, 162 insertions(+)
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
> index 0000000000..ad76935f5d
> --- /dev/null
> +++ b/xen/arch/arm/platforms/imx8m.c
> @@ -0,0 +1,161 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * i.MX 8M family setup
> + *
> + * Copyright 2026 Open-EP (E-Paper) Community
> + */
> +
> +#include <xen/sched.h>
> +#include <asm/platform.h>
> +#include <asm/regs.h>
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
> +#define IMX_SIP_F_CPUFREQ   0x1   /* CPU frequency scaling */
> +#define IMX_SIP_F_DDR_DVFS  0x4   /* DRAM frequency scaling */
> +#define IMX_SIP_F_SRC       0x5   /* SRC: M-core remoteproc start/stop */
> +#define IMX_SIP_F_SOC_INFO  0x6   /* read-only SoC info query */
> +#define IMX_SIP_F_NOC       0x8   /* NoC QoS priority setup */
> +
> +#define IMX_SIP_GPC_SF_PM_DOMAIN    0x03
> +
> +#define IMX_SIP_SRC_SF_M4_START     0x00
> +#define IMX_SIP_SRC_SF_M4_STARTED   0x01
> +#define IMX_SIP_SRC_SF_M4_STOP      0x02
> +
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
> +     * domains, M-core, NoC) or are read-only queries.
> +     */
> +    switch ( function_id )
> +    {
> +    case IMX_SIP_FID(IMX_SIP_F_GPC):
> +        if ( subfunction_id != IMX_SIP_GPC_SF_PM_DOMAIN )
> +            return false;
> +        break;
> +
> +    /*
> +     * CPU and DRAM frequency scaling: the hardware domain does not see the
> +     * whole system and cannot make an informed decision about resources
> +     * shared with the other domains, so deny both (CPU frequency scaling
> +     * is denied on the i.MX8QM platform for the same reason).
> +     */
> +    case IMX_SIP_FID(IMX_SIP_F_CPUFREQ):
> +    case IMX_SIP_FID(IMX_SIP_F_DDR_DVFS):
> +        return false;
> +
> +    case IMX_SIP_FID(IMX_SIP_F_SRC):
> +        /* SRC: M-core remoteproc start, poll-started and stop. */
> +        switch ( subfunction_id )
> +        {
> +        case IMX_SIP_SRC_SF_M4_START:
> +        case IMX_SIP_SRC_SF_M4_STARTED:
> +        case IMX_SIP_SRC_SF_M4_STOP:
> +            break;
> +
> +        default:
> +            return false;
> +        }
> +        break;
> +
> +    case IMX_SIP_FID(IMX_SIP_F_SOC_INFO):
> +        break;
> +
> +    case IMX_SIP_FID(IMX_SIP_F_NOC):
> +        /*
> +         * NoC QoS priority setup.  Only i.MX8MQ issues this at boot;
> +         * i.MX8MP issues no NoC call, but the platform covers both.
> +         */
> +        switch ( subfunction_id )
> +        {
> +        case IMX_SIP_NOC_SF_PRIORITY:
No need for a switch for a single case. This can be simplified the same way as
you did for IMX_SIP_GPC_SF_PM_DOMAIN i.e.:
if ( subfunction_id != IMX_SIP_NOC_SF_PRIORITY )
    return false;
break;

I'll fix on commit. Thanks for the series. I'll commit it shortly.

~Michal


