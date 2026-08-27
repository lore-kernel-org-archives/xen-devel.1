Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B91C5DF9D
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 08:06:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400378.1636044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzV7y-0006W7-5a; Thu, 27 Aug 2026 08:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400378.1636044; Thu, 27 Aug 2026 08:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzV7y-0006W0-2K; Thu, 27 Aug 2026 08:06:26 +0000
Received: by outflank-mailman (input) for mailman id 1400378;
 Thu, 27 Aug 2026 08:06:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wzV7v-0006Vu-PH
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 08:06:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzV7u-008Gtc-O6
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 10:06:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8feffb-e002-0a2a0a5209dd-0a2a4507e91c-14
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 10:06:22 +0200
Received: from [40.93.201.22]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8feffc-b4ea-0a2a45070019-285dc9162bc8-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 10:06:22 +0200
Received: from PH8PR21CA0020.namprd21.prod.outlook.com (2603:10b6:510:2ce::27)
 by LV9PR12MB9781.namprd12.prod.outlook.com (2603:10b6:408:2f6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 08:06:16 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::7) by PH8PR21CA0020.outlook.office365.com
 (2603:10b6:510:2ce::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8 via Frontend Transport; Thu, 27
 Aug 2026 08:06:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 08:06:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 03:06:15 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 03:06:15 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 03:06:13 -0500
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
 b=Im/6bqQxd008rY52RhF4liCZqOu+S40TivLuTvefvemtTKhiwsp1YAEFtlokn1wPtP8aEhw8l3dLPNcTAfFQzNZF3cowzPVWOau6isTBZLs+vJNnCSg4MWdPUiFkVRdGiHultF74t/yb1O0ZtjNSVJ9M38UcKQsvVlj1WGDbPaTad9oCrajmXqZusSjQ55Y4LYpmnwOzWvNoPSrR+aIfbaET7e1zUF1mGwMtUhz4UAb0jBfFTWlQuLPbl36QkMZFEoi7wx31g0cc2VAUcij0J/iUysHywKkpjLMiak8NE7nF1kqJzK/OhuXbJkSiu5o2vyy/o0m/NpSNSw+ve8bljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEaxfZAWJIHlSTm8VRYPdw0ibwhWKWp4iBrTrG9GQoo=;
 b=pVk9foKnK4mAv3VgMSg5LKCUjNbuv47YR1TTdkTpNo0B3Ikl7jTcayPTOM2zYcEfCcm7P/h2MDk8r5hrNmkGFK33jczxAtfJ+205j6ule72yCIzcEpB6pX8cH5ZdjxJnhxW7Kd9VxGjx2b89XgBmsoOhJDD8VFIr9myx2YsrljKbzR/0YqhuXsW+NK5BK4KFup1To1MujL0EJ88Ai7oPxXbOKYgt2TzhlGisqNt5BSBw6Yx5uenYlDwWqZ02L/bIiOvFMPuEXEP2T0LDs07rw8oXMRikoEK40C2gf9i+vsZa99ak+fy5hzMBEB8qClTOqMXE39qFgqH58ewF64YZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEaxfZAWJIHlSTm8VRYPdw0ibwhWKWp4iBrTrG9GQoo=;
 b=ptqBoWQg44XdRS50EI88pDcPKtuLiGoEhWMJ/j0RLkaUY5zwFeZTofTWYqxIeHN1UvZgqo+Vg7y/qyItIKvada8dkq8kc37//+aJCgZJgo9vErEyhsJGHYpGW3/LxWBNPkHFY49U0uJvVfuOlZOXrYouEsyVKh6fxrNsyMOtjL0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0b43902d-395b-4dc0-9098-451951f7f840@amd.com>
Date: Thu, 27 Aug 2026 10:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Orzel, Michal" <michal.orzel@amd.com>
Subject: Re: [PATCH v4] xen/arm: Hide PMU registers from the guest, when the
 vPMU feature is disabled.
To: Hirokazu Takahashi <taka@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <20260826105529.364192-1-taka@valinux.co.jp>
Content-Language: en-US
In-Reply-To: <20260826105529.364192-1-taka@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|LV9PR12MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: 1207a5a4-581f-48b3-c230-08df041211ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|23010399003|1800799024|82310400026|10067099003|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	T0NUqK3e3V2mXqXOhGg9CdfXpUVzBqm1b0QUyHCFuthEEfTVWmjVCfDdLUzAl9AlGKpHWhqXxvCHGVHo5fkxy+ImKUWKY1lmyZCAZhg+v9UNEwOBibQW8d63J6Dsr2GXkIomVBV1ZkS1V6ndR59ho7ZSCZn4txBQBhHz0yKC3MOp3JgmGoSF8glMoY7Tz//HUFtM7oKA4hXyhs99S6mse5pkUtm+iH6e78XYRrECSn6aSa4XndqIgy9DKl1JcvGs7rHeyVzCwF4aBwzwsnuXnIR84cSwJFu1cgAen/+l9um6oYOzfnd6GFhcppKAS0UGncmFCyUx46b905pN/cdML/y6AW4P1lXr9AO5esqvrFh1ht7Vrtlrl+zwwIGwPxjC/ig4DNTPCIk+L0gcxqVelVWNfa5RlskVOodFV5OwYkBkvXSKFuK3MwEYBJcIb0HW9VxVpMvWmZ0s06jn1LBy6d9DDlD60iKOKlnJ1eKum1SuTad6bWrmwjKLYiDjhaockjtTIKtmPFveoaQLgbMBOd3iTFgag/Sjb3KgB5cSjZ18FB8ck1EELr1aRnqpEOpfNRqHpLalHDcpojc1XYE/3zW6V7dAkOcI7wwwNiBlIGE1RE1cl2UhDHbWpr0mnjpYf5WyKld5ahMFC12t+P+XIYVimsL1xI2DiMOUeN1rBGw/mR81tiOvkaduhimBLgjdagrtyfzUKhdQBb7EFsllaA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UUre23Z6JswYcvUqHxjr7cbqs8hBV2h0GN/MJCMpOWKjfMH5nFlP5g6+vhjNU/nM7hWRevGmufl8HnebgdTD86PJaE35M7AtdtWXuhyHdI4sBxNGALddLFmilWRocqbu1+JlNnIhgKS0gzaYn07zomCTtrJBM6V8opORPa/ecbwVzxQiRP0HvRC06FzzgrsP7x5P0XvSr42/1bBR4x/4/sc2Cxi9rCVS7Kjnrlk4hbmA4IVmGXxl50oNCzA6lR+RdJO5ruVow3nhKYvqK1H9Ht2K/9hj3vIsruplMoY4mlwCCSux30/4L/0Pe6qP7ppf5DzcNVvP/o9wDWml3uk6OvscTSRzQxVnxa2bYV8lsvMywYlDWOCIg2GTqrrGJOFcvIVvHTJXMTWwHMUp52jhO9dq064QyESGEoDFCO/zH6OXy4bC1zRC2rO23xVH6MlW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 08:06:16.1648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1207a5a4-581f-48b3-c230-08df041211ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9781
X-purgate-ID: tlsNG-ef75cf/1787817982-A66DAAE4-DD7830D6/0/0
X-purgate-type: clean
X-purgate-size: 11221



On 26-Aug-26 12:55, Hirokazu Takahashi wrote:
> On ARMv8.4-A and newer platforms, booting Dom0 Linux with ACPI enabled
> causes the domain to probe advanced PMU feature based on system ID
> register ID_AA64DFR0_EL1. During this probe, Linux accesses PMMIR_EL1,
> which causes unhandled register traps and crashes the domain.
> 
> To address this issue, implement the following:
> 
> - Add emulation for ID_AA64DFR{0,1}_EL1, ID_DFR{0,1}_EL1 and
>   ID_DFR{0,1} register accesses for guest domains.
> - Hide PMU registers from a guest domain when its vPMU feature is
>   disabled.
> - Proactively make SPE, TRBE, BRBE, Trace Extensions, SPMU, ITE and
>   EBEP inaccessible to arm64 guest domains and hide TraceFilt,
>   MMapTrc and CopTrc to arm32 guest domains, as they could
>   potentially cause similar issues.
> 
> Fixes: dbb948110a0e ("xen: Expose the PMU to the guests")
> Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
> Fixes: 3669a1cb9598 ("xen/arm: create a cpuinfo structure for guest")
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
> Changes in v4:
>  * Hide FEAT_HPMN0 from guests when the vPMU feature is disabled.
>  * Unconditionally hide FEAT_SPMU and FEAT_EBEP from guest domains.
>  * Fix arm32 build failure in vcpreg.c.
>  * Perform code cleanups and address coding style feedback.
> 
>  xen/arch/arm/arm64/vsysreg.c          | 62 +++++++++++++++++++++++++--
>  xen/arch/arm/cpufeature.c             | 17 ++++++++
>  xen/arch/arm/domain.c                 |  2 +-
>  xen/arch/arm/include/asm/arm64/hsr.h  |  1 +
>  xen/arch/arm/include/asm/cpregs.h     |  1 +
>  xen/arch/arm/include/asm/cpufeature.h | 27 +++++++++---
>  xen/arch/arm/vcpreg.c                 | 29 ++++++++++++-
>  xen/include/xen/sched.h               |  5 +++
>  8 files changed, 130 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index d9e3619dfb..bf612a133d 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -227,6 +227,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>       */
>      case HSR_SYSREG_PMINTENSET_EL1:
>      case HSR_SYSREG_PMINTENCLR_EL1:
> +    case HSR_SYSREG_PMMIR_EL1:
>          return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>      case HSR_SYSREG_PMUSERENR_EL0:
>          /* RO at EL0. RAZ/WI at EL1 */
> @@ -300,8 +301,32 @@ void do_sysreg(struct cpu_user_regs *regs,
>      GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
>      GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
>      GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
> -    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
> -    GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
> +
> +    case HSR_SYSREG_ID_DFR0_EL1:
> +    {
> +        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
> +
> +        if ( !is_vpmu_domain(v->domain) )
> +            info_dbg32.perfmon = 0;
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  info_dbg32.bits[0]);
> +    }
> +
> +    case HSR_SYSREG_ID_DFR1_EL1:
> +    {
> +        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
> +
> +        if ( !is_vpmu_domain(v->domain) )
> +        {
> +            info_dbg32.mtpmu = 0;
> +            info_dbg32.hpmn0 = 0;
> +        }
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  info_dbg32.bits[1]);
> +    }
> +
>      GENERATE_TID3_INFO(ID_AFR0_EL1, aux32, 0)
>      GENERATE_TID3_INFO(ID_MMFR0_EL1, mm32, 0)
>      GENERATE_TID3_INFO(ID_MMFR1_EL1, mm32, 1)
> @@ -342,8 +367,37 @@ void do_sysreg(struct cpu_user_regs *regs,
>      }
>  
>      GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
> -    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
> -    GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
> +
> +    case HSR_SYSREG_ID_AA64DFR0_EL1:
> +    {
> +        union cpuinfo_dbg64 info_dbg64 = domain_cpuinfo.dbg64;
> +
> +        if ( !is_vpmu_domain(v->domain) )
> +        {
> +            info_dbg64.pmu_ver = 0;
> +            info_dbg64.pmss = 0;
> +            info_dbg64.mtpmu = 0;
> +            info_dbg64.hpmn0 = 0;
> +        }
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  info_dbg64.bits[0]);
> +    }
> +
> +    case HSR_SYSREG_ID_AA64DFR1_EL1:
> +    {
> +        union cpuinfo_dbg64 info_dbg64 = domain_cpuinfo.dbg64;
> +
> +        if ( !is_vpmu_domain(v->domain) )
> +        {
> +            info_dbg64.pmicntr = 0;
> +            info_dbg64.dpfzs = 0;
FEAT_SPE_DPFZS depends on SPE, and you already clear pms_ver. Move it next to
clearing pms_ver.

> +        }
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  info_dbg64.bits[1]);
> +    }
> +
>      GENERATE_TID3_INFO(ID_AA64ISAR0_EL1, isa64, 0)
>      GENERATE_TID3_INFO(ID_AA64ISAR1_EL1, isa64, 1)
>      GENERATE_TID3_INFO(ID_AA64MMFR0_EL1, mm64, 0)
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 94d14fb6a9..88478fea46 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -219,8 +219,25 @@ static int __init create_domain_cpuinfo(void)
>      domain_cpuinfo.isa64.api = 0;
>      domain_cpuinfo.isa64.gpa = 0;
>      domain_cpuinfo.isa64.gpi = 0;
> +
> +    /* Hide SPE, TRBE, BRBE, Trace Extensions, SPMU, ITE and EBEP */
> +    domain_cpuinfo.dbg64.trace_ver = 0;
> +    domain_cpuinfo.dbg64.pms_ver = 0;
> +    domain_cpuinfo.dbg64.trace_filt = 0;
> +    domain_cpuinfo.dbg64.trace_buffer = 0;
> +    domain_cpuinfo.dbg64.ext_trc_buff = 0;
> +    domain_cpuinfo.dbg64.brbe = 0;
> +    domain_cpuinfo.dbg64.syspmuid = 0;
> +    domain_cpuinfo.dbg64.spmu = 0;
> +    domain_cpuinfo.dbg64.ite = 0;
> +    domain_cpuinfo.dbg64.ebep = 0;
>  #endif
>  
> +    /* Hide Trace Extensions for AArch32 domain */
> +    domain_cpuinfo.dbg32.coptrc = 0;
> +    domain_cpuinfo.dbg32.mmaptrc = 0;
> +    domain_cpuinfo.dbg32.tracefilt = 0;
> +
>      /* Hide AMU support */
>  #ifdef CONFIG_ARM_64
>      domain_cpuinfo.pfr64.amu = 0;
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index baa3a5d708..a739dd157e 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -501,7 +501,7 @@ int arch_vcpu_create(struct vcpu *v)
>      v->arch.hcr_el2 = get_default_hcr_flags();
>  
>      v->arch.mdcr_el2 = HDCR_TDRA | HDCR_TDOSA | HDCR_TDA;
> -    if ( !(v->domain->options & XEN_DOMCTL_CDF_vpmu) )
> +    if ( !is_vpmu_domain(v->domain) )
>          v->arch.mdcr_el2 |= HDCR_TPM | HDCR_TPMCR;
>  
>      if ( (rc = vcpu_vgic_init(v)) != 0 )
> diff --git a/xen/arch/arm/include/asm/arm64/hsr.h b/xen/arch/arm/include/asm/arm64/hsr.h
> index 1495ccddea..ed18184cc7 100644
> --- a/xen/arch/arm/include/asm/arm64/hsr.h
> +++ b/xen/arch/arm/include/asm/arm64/hsr.h
> @@ -84,6 +84,7 @@
>  #define HSR_SYSREG_FAR_EL1        HSR_SYSREG(3,0,c6, c0,0)
>  #define HSR_SYSREG_PMINTENSET_EL1 HSR_SYSREG(3,0,c9,c14,1)
>  #define HSR_SYSREG_PMINTENCLR_EL1 HSR_SYSREG(3,0,c9,c14,2)
> +#define HSR_SYSREG_PMMIR_EL1      HSR_SYSREG(3,0,c9,c14,6)
>  #define HSR_SYSREG_MAIR_EL1       HSR_SYSREG(3,0,c10,c2,0)
>  #define HSR_SYSREG_AMAIR_EL1      HSR_SYSREG(3,0,c10,c3,0)
>  #define HSR_SYSREG_ICC_SGI1R_EL1  HSR_SYSREG(3,0,c12,c11,5)
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index a7503a190f..3f62b38dc0 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -246,6 +246,7 @@
>  #define PMINTENSET      p15,0,c9,c14,1  /* Perf. Mon. Interrupt Enable Set Register */
>  #define PMINTENCLR      p15,0,c9,c14,2  /* Perf. Mon. Interrupt Enable Clear Register */
>  #define PMOVSSET        p15,0,c9,c14,3  /* Perf. Mon. Overflow Flag Status Set register */
> +#define PMMIR           p15,0,c9,c14,6  /* Perf. Mon. Machine Identification Register */
>  
>  /* CP15 CR10: */
>  #define MAIR0           p15,0,c10,c2,0  /* Memory Attribute Indirection Register 0 AKA PRRR */
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index bf902a3970..c554686415 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -208,7 +208,7 @@ struct cpuinfo_arm {
>          };
>      } pfr64;
>  
> -    union {
> +    union cpuinfo_dbg64 {
>          register_t bits[2];
>          struct {
>              /* DFR0 */
> @@ -216,19 +216,31 @@ struct cpuinfo_arm {
>              unsigned long trace_ver:4;
>              unsigned long pmu_ver:4;
>              unsigned long brps:4;
> -            unsigned long __res0:4;
> +            unsigned long pmss:4;
>              unsigned long wrps:4;
>              unsigned long __res1:4;
>              unsigned long ctx_cmps:4;
>              unsigned long pms_ver:4;
>              unsigned long double_lock:4;
>              unsigned long trace_filt:4;
> -            unsigned long __res2:4;
> +            unsigned long trace_buffer:4;
>              unsigned long mtpmu:4;
> -            unsigned long __res3:12;
> +            unsigned long brbe:4;
> +            unsigned long ext_trc_buff:4;
> +            unsigned long hpmn0:4;
>  
>              /* DFR1 */
> -            unsigned long __res4:64;
> +            unsigned long syspmuid:8;
> +            unsigned long brps1:8;
> +            unsigned long wrps1:8;
> +            unsigned long ctx_cmps1:8;
> +            unsigned long spmu:4;
> +            unsigned long pmicntr:4;
> +            unsigned long able:4;
> +            unsigned long ite:4;
> +            unsigned long ebep:4;
> +            unsigned long dpfzs:4;
> +            unsigned long abl_cmps:8;
>          };
>      } dbg64;
>  
> @@ -408,7 +420,7 @@ struct cpuinfo_arm {
>          };
>      } pfr32;
>  
> -    union {
> +    union cpuinfo_dbg32 {
>          register_t bits[2];
>          struct {
>              /* DFR0 */
> @@ -426,7 +438,8 @@ struct cpuinfo_arm {
>  
>              /* DFR1 */
>              unsigned long mtpmu:4;
> -            unsigned long __res1:28;
> +            unsigned long hpmn0:4;
> +            unsigned long __res1:24;
>  #ifdef CONFIG_ARM_64
>              unsigned long __res2:32;
>  #endif
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index 3205c7df46..db8909d96e 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -292,6 +292,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>              return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
>      case HSR_CPREG32(PMINTENSET):
>      case HSR_CPREG32(PMINTENCLR):
> +    case HSR_CPREG32(PMMIR):
There's a comment above this block that we don't trap ID_DFR0 which is not true.
It should be dropped as part of this patch.

I'll do the fixes on commit. Thanks for the patch.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

