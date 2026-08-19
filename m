Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85CDC5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 07:14:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394721.1633387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwaUj-0005pa-Tg; Wed, 19 Aug 2026 07:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394721.1633387; Wed, 19 Aug 2026 07:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwaUj-0005pT-QL; Wed, 19 Aug 2026 07:13:53 +0000
Received: by outflank-mailman (input) for mailman id 1394721;
 Wed, 19 Aug 2026 07:13:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwaUi-0005pM-LP
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:13:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwaUh-001apn-R8
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:13:51 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8557aa-2eae-0a2a0a5409dd-0a2a450ab568-8
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:13:47 +0200
Received: from [40.93.201.16]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8557a9-f2d2-0a2a450a0019-285dc9102ce9-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:13:47 +0200
Received: from BY3PR10CA0001.namprd10.prod.outlook.com (2603:10b6:a03:255::6)
 by CH1PPF6B6BCC42C.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::612) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 07:13:42 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::28) by BY3PR10CA0001.outlook.office365.com
 (2603:10b6:a03:255::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 07:13:42 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 07:13:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 02:13:41 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 02:13:40 -0500
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
 b=tVFI1l8qxajGAeGL4IhIl6kQUrN0UIfTEsrV95dunJGvvXWeWNrN9n9qOCSOfqYC4Da/5mTSiF0vea820LL2HjWWGnPVvHG4kcm1coJYPkFTQwCfblaxzcRrHtptnWPSTdEDZPHZJGHfpczByfoPVxZkaTNH1IeU8xmRpRFeR7wGL/dJ8FQnBk0pDehRWSSDNTrM7B6MUQXKX7ydGKre5caY+Bzv2HKOuQZs75/MnZQrCCNsdhUe9GX7cTvpw9BUccYfj0BPKz+Zn3eYaGk1qmc5WjmfL3rhJv2zhilaNomqKTzpRbxNSQwzfO28GCOcCC3BxPKdFp6qnXKuX91R1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G+z6egPFygd4uGSiCW0yHP4QZ4BC6yuLAT+y3M+77Y=;
 b=qeKXnL86O/WHHRNyYYDr2+ChiVSJh8QedUMZund8/qvL/2l8+D6rk41a453hMBQ/xhJ97TCQedY3s1EebIrHx/zoKhE2vMIG1FFRmNZy3dOhGAlItgo8hHORUD6z1AMt+R1kEsmTGWhhD40ZK9WiTPBbWi8K7OV1brNqY1gzsZwxsRU4w2MP5Jq0zvtIqQNmdFzltv9NnKL7DMeqhBsnLBf8jt06X9RzAMlwyKsYMXwdz4F9tsrE7yAnKT9f4R5ChyHjagW46gmTEfw0dSA3Hhlmfa6QzT3xw7Yezz2eulrX9bSAS5Z99PYAT5YK/pPqFyYc4Pipt3WxGQ6q2XOqng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0G+z6egPFygd4uGSiCW0yHP4QZ4BC6yuLAT+y3M+77Y=;
 b=yAc9Voz+7Dra62HjmoAOxblfXvDPl/xeljqQ6NGbvFJDBRXoTnMJyUdvCDBhmIWhjRxD48/Be8qZrO9vOT7BgtHy5L07y0JUZIz3NrtWVTKSCVSZxSUbUlPOcFv5Vxuwg9Fi+FviuBQiUQM4MFW1O0PXEl1gbDMV5doMjgOSdWo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a36894b1-2104-4df4-a82a-6d1b7d1cd21a@amd.com>
Date: Wed, 19 Aug 2026 09:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] xen/arm: add i.MX8M platform support
To: Wig Cheng <onlywig@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
References: <20260818153946.1635464-1-onlywig@gmail.com>
 <20260818153946.1635464-4-onlywig@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260818153946.1635464-4-onlywig@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|CH1PPF6B6BCC42C:EE_
X-MS-Office365-Filtering-Correlation-Id: 953ea6af-76de-4ade-0349-08defdc16690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|56012099006|4143699003|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gGOZJDHt62jK7JpUQhKq3ioY/nDto5c8nC9vGNE1L6VUfkmLEAVIp3zVJV2Op4dLaobQz1RUmElVJwnDxbzLf22WXLD7/jRMNtPID9eYqNLTedvVPY2bWpr2x6B14vZ5OUZ69dwJO7eUGNRSkTjQzaeXhAWOGtNyEWOVeTnuhiz+jWFJte3oIcAXwOej9jJ6y5Trvf9II5Ij2tTG2+I079aThWPFdm+hj8wtaVHHd9iT0bvoMBMvI5DjSqdZKcK/4P1qs+Om619JVZtjC0iAeuhQh/4AWIA96dnMkyrbSSi9RXr0otooa9noQefEhMnxtYySALzgcK3qTiYXmtXFO/d9AlvnNj7xbELVm08mahnEY+Hlz5+Ehi/zswK4RAzgsk6aAQyQTsm8UYUT4gJ95+dkWnNMTZifCG9us+G6cSFJltsCWMVIgFJAXgSWvI5iQ/PBpNB5/HP0fGUrQd/rEAKbbrEpq5RMp0su3M5H2u2DLEWorGWQsYdjen/vtv0uWRdG4M0lleMOi6RdAXaQlo7e+T3m65V7AX3B0CHiph6KzfCp8tMh6ORTCccoCpMuJQPwvSKTRpP0dVXC/zs/uyZUMg/ZBUVsxL53mk5ypPGJFgd4qe/oyEaIxHsUPnIzWnID8VgZLlm92QbMbkSAALkWvVJbnEUIk7TKUHbFgEh2gEOP9OR/U/HEw9+M+nvpt3612UFRkQv9WbLf/5eb4A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qzHHNT4M3KG19+3baKGZKwinN5wrIZ2+rDIJOJoChsmNgvRFCxLSR1tDJQfkaXJ3Yyg2yVExVtFdtGD0bFXzaPNBpihTJ1OsMOCxG3I0dz5phUrVSUnYIB7DGzjFK/cZkmTqr7W1uj6Ks+kCL59epVWorMO7pq8/Twu1cq/1Ugfjw9OYCib10VdM2VldBA8NC1IfEgEBb5XwPt1tJRx2iSlYLz3a9/moJWHRfGMkchLTD9b98r2pdDTK9Xq5quvYybHzI9zpcz1E9tjR8cGEga8jncSNe8ffdoP9RVVHcVBXrw5GsDLVC+QEU2kmN6KAWUhhR8Uze0vsttl2smGJ9QS722MKreg5uo4atasid6/ZG6JhC3s6LHL/NzqxWSvMCG0ArcyRRvEwQafrOYDA7VmeyFWctvIcH8wPCOArTzXdTWtcp/J0IaqW0/Uv+zn0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 07:13:42.3033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 953ea6af-76de-4ade-0349-08defdc16690
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF6B6BCC42C
X-purgate-ID: tlsNG-4011c0/1787123627-599C1CFC-9743402E/0/0
X-purgate-type: clean
X-purgate-size: 6466



On 18-Aug-26 17:39, Wig Cheng wrote:
> Add platform glue for the NXP i.MX8M family (i.MX8MP/MQ/MM/MN).
> 
> When Linux is used as dom0 a number of drivers make SiP SMC calls into
> TF-A to manage hardware: GPC power domains, SRC (M-core remoteproc),
> SoC info and NoC QoS.  There is no public specification for these
> calls; the function IDs and their subfunctions are taken from the
> vendor kernel call sites.
> 
> Forward only the specific subfunctions the hardware domain issues,
> following the whitelist model of the i.MX8QM platform.  Where a service
> has a fixed set of subfunctions (GPC, SRC, NoC) they are filtered, and
> the SoC info call is a read-only query.  CPU and DRAM frequency scaling
> are denied because the hardware domain cannot make an informed decision
> about resources shared with the other domains, and any unknown function
> ID is rejected.
> 
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> ---
> Changes in v3:
> - Include <asm/regs.h> for get/set_user_reg().
> - Add a description for the CPUFREQ function id.
> - Drop the unused SRC M4_START and NoC LCDIF subfunction macros.
> - Order the switch cases by function id.
> - Deny DDR DVFS as well, for the same reason CPU frequency scaling is
>   denied: the hardware domain cannot make an informed decision about
>   DRAM shared with the other domains.  Previously it was forwarded.
> - Return false directly on a denied subfunction instead of goto plus a
>   redundant printk (vsmccc_handle_call() already logs the rejection).
> 
>  xen/arch/arm/platforms/Makefile |   1 +
>  xen/arch/arm/platforms/imx8m.c  | 139 ++++++++++++++++++++++++++++++++
>  2 files changed, 140 insertions(+)
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
> index 0000000000..0aceed9d43
> --- /dev/null
> +++ b/xen/arch/arm/platforms/imx8m.c
> @@ -0,0 +1,139 @@
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
> +        if ( subfunction_id > IMX_SIP_SRC_SF_M4_STOP )
This is a range check rather than a white list. I think it's very important to
be able to see what exact subfunctions are allowed i.e. switch ( subfunction_id )

> +            return false;
> +        break;
> +
> +    case IMX_SIP_FID(IMX_SIP_F_SOC_INFO):
> +        break;
> +
> +    case IMX_SIP_FID(IMX_SIP_F_NOC):
> +        if ( subfunction_id > IMX_SIP_NOC_SF_PRIORITY )
Same here.

> +            return false;
> +        break;
> +
> +    default:
> +        gprintk(XENLOG_WARNING, "imx8m: smc: Unknown function id %x\n",
> +                function_id);
Worth printing also subfunction_id.

With the remarks addressed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


