Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F2BC5DF94
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 08:32:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398727.1634862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyQ6Y-0006NU-2v; Mon, 24 Aug 2026 08:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398727.1634862; Mon, 24 Aug 2026 08:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyQ6Y-0006NN-0F; Mon, 24 Aug 2026 08:32:30 +0000
Received: by outflank-mailman (input) for mailman id 1398727;
 Mon, 24 Aug 2026 08:32:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wyQ6V-0006NH-JZ
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 08:32:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyQ6U-009yh5-I9
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 10:32:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8c018c-8faa-0a2a0a5109dd-0a2a4503d2e4-40
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 10:32:26 +0200
Received: from [40.93.195.68]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8c0197-fae8-0a2a45030019-285dc3446c73-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 10:32:25 +0200
Received: from MW4PR03CA0230.namprd03.prod.outlook.com (2603:10b6:303:b9::25)
 by PH7PR12MB7116.namprd12.prod.outlook.com (2603:10b6:510:1ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 08:32:15 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:303:b9:cafe::13) by MW4PR03CA0230.outlook.office365.com
 (2603:10b6:303:b9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 08:32:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Mon, 24 Aug 2026 08:32:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 03:32:13 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 03:32:07 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 24 Aug 2026 03:32:05 -0500
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
 b=RWi1OV5B5b6GMqyGJJUp4MK+pMuLh2kc2lJOnB5iEbDd9lxShiqcWuhtpji9R0t/iVAFXWvk2lgtdHsbxjJHIhve52+PxkfsN0su6VgWGEgZ+uQvmQ3wdpM7pCq0VfIjNfNKW7U/WZcRwUynblnqjoOSLVJxEP7m9th7OPJJxdFYPeAqah/L/8w5j89r7gzHy7CG65+eEv8NMLJYlsesnSjB2fUFM1hy1NEjXirPZaY9+RLryQrMnoQ/VRsRaXOimrHwDTqmEH7066Li7vLzhPunbxt2+0Ka/0ce/HfeuFwbgxpo5TARJdOGCsm/Lxn3gm2yUnufJ/pn/gDr38voDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXv1eM1QauodCGZrPbnY9WZ44vQeU7Ima24VUPC+cDQ=;
 b=NCSVraOmpUcjb3jU2yg0aEktxs+5cbKflEb17yRgWK32ibwMDbe5kSZabi5WCKkLteJ1k4dBEwFztGns+MHuzoN4sxV6LQcCyzYdq3/ZEEMgJXEVjvdr27GxO0HTKRHs+CiBn4mNZv5VLecWBWoXTOPnCBaVQXD32THM7qpTMbVn8CvBHJ9Hts4+RN2FZMANl64i2t9I/oIN6q6zJV7qr7vKmQYtXhp4GyUrrtY6vfF1F5qHwbCTwwejBTk5kVRIGQu8wr9+aGYLLRcg+kLGCD8LYK84NuwL8PndT84CEXO86G0p4yysBaKHS6UsqERItX4beQaUIroS91QQGc5n9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXv1eM1QauodCGZrPbnY9WZ44vQeU7Ima24VUPC+cDQ=;
 b=Q5L1X1ou+moqfb/wbhekeADMYSnCbI1QyMwNFvdCMIttIsgvaqz+ZkHe/Fs2KwzNd7XplxDK05r/xzSxmAo706QalMqq2xjkzWTlGgmkenANAU1mmzFSUsinLTrKG2pVEBPVlOn3ns/GCoKbShuisR+f74Co8RgKjwxWFHAevNo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e6edf3f8-5085-4b5b-acdb-ac17402e86ee@amd.com>
Date: Mon, 24 Aug 2026 10:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: Hide PMU registers from the guest, when the
 vPMU feature is disabled.
To: Hirokazu Takahashi <taka@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <20260824044530.301938-1-taka@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260824044530.301938-1-taka@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|PH7PR12MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: 00cf9173-cdf8-4dd7-f566-08df01ba3371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|7416014|376014|56012099006|10067099003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oOHUi+jRIadxIEkGqsV1NalaV0rd3I2BcV0iSUptn3y+zkB1dLz+YxwrzouK7QHrjkrDfApquYodGkFvC+MnOUe4s8ER+mqW0gvrpjKxrPWJHMx7NBkESFz2SmUU7wJnOUSBMZxQx+DX8jyrObB0CvHKchBz0qb1tfIJXLrDjKiF8rt/4MTlfUgXcxcdMZjOuWOgb8nQ1ZUrfsY8LoDjFSu9k5PGHC+3g4MbBwl4aB4Samu4Hz7V3jr3ad28A4ovA6DvwxGkjTIGDeCu0/++PtI28mJCiTQHQkd5XVMpZ48j73WAtow63frvANdGBfT7lTRAKeYz+UA7r0reA1fT9XZyBwIVmBHOhujiIJ2bw2y84IO6tzVRXHzkLUzKK/2+SlcLQH2Pq8/ldhyVW8+HAioyPKUmHXD0Zd5jKMCE7bu15i/FT8tGWcZB3COqVwhrMucjulNuHJt+P1VAmSPlJvRzL7pITfxGdLfp50wGGShrJq6E4vhzaukXtggBa8+q4nCcij++IYyzVqlQ+sWb0HOG+t4I5WzZQ2iHH5KNqsD1gvF1hZ8SnnMI27luVDFd9FJe/ISAWYBpwHt5WJ5vaHmy8+AcVaLVP6RD2mdskU/nI0YYQ7QMS6zvXm8IsemXfeLRXouwBB5z4T+OG0URLeK/oetcPGVrYXFvoRQG/wMD45S8pfXRaCqgISngLJqiyVsNj0FR1XrdvECE8hAOYw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(7416014)(376014)(56012099006)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Tv4C2vpFe1ri8afLd/F85PRdba1vPW2cV34hqnaozsjQBnKBprpVEV5LuQiUQNT9T9cZ7GyUCQWXFutTdvrlFsRPu67DyJdQ5fmK73HGVTrqXEpa3mH+xCrXGU/L2ZXIy4u3tJBrTPbjVG2+Qw77iTZKKkGWEcD1TNSi6D6MhDNnkA9oSf04N2J2depOxh5I4KT8rj7q3STrWAz9H/hhdRQjbO0ng4ul6hVKzjL6OMbd+dDqBkwTBmElp/QZhwkhc/sFhTKpgzfajAQZLp26gCggPpY1D3A1GE0zkovNp8u7AqNdZVeB7nIrklnaQuRakwdmtrRhUFWal9Dpu0g7/BeBVD5FfNmuesoIkgJUmpwD52EdZX7GeuoDBHVqqOKPUffSIXXy2z3EHvvjXp0qTBAIt9du6phtAblXJRAzFGTygTW0gKnoJgeChbR35bmO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 08:32:14.7697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cf9173-cdf8-4dd7-f566-08df01ba3371
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7116
X-purgate-ID: tlsNG-33051d/1787560345-772F54E9-02004E2F/0/0
X-purgate-type: clean
X-purgate-size: 14154



On 24-Aug-26 06:45, Hirokazu Takahashi wrote:
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
> - Proactively make SPE, TRBE, BRBE, Trace Extensions and ITE
>   inaccessible to arm64 guest domains and hide TraceFilt, MMapTrc
>   and CopTrc to arm32 guest domains, as they could potentially cause
>   similar issues.
> 
> Fixes: dbb948110a0e ("xen: Expose the PMU to the guests")
> Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
> Fixes: 3669a1cb9598 ("xen/arm: create a cpuinfo structure for guest")
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
> Changes in v3:
>  * Mask PMU-related fields in ID_AA64DFR1_EL1 and ID_DFR1 when a guest
>    domain lacks the vPMU feature.
>  * Add emulation for AArch32 PMMIR register accesses performed by
>    32-bit guest domains without the vPMU feature.
>  * Code cleanups.
> 
> Note: The combination of AArch32 EL1 and PMUv3 could not be verified,
>       as no real ARM CPU implements both while the Arm Architecture
>       Reference Manual for A-profile architecture allows it.
> 
> 
>  xen/arch/arm/arm64/vsysreg.c          | 74 +++++++++++++++++++++++++--
>  xen/arch/arm/cpufeature.c             | 14 +++++
>  xen/arch/arm/domain.c                 |  2 +-
>  xen/arch/arm/include/asm/arm64/hsr.h  |  1 +
>  xen/arch/arm/include/asm/cpregs.h     |  1 +
>  xen/arch/arm/include/asm/cpufeature.h | 27 +++++++---
>  xen/arch/arm/vcpreg.c                 | 33 +++++++++++-
>  xen/include/xen/sched.h               |  5 ++
>  8 files changed, 143 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index d9e3619dfb..1d1f7b0631 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -227,6 +227,11 @@ void do_sysreg(struct cpu_user_regs *regs,
>       */
>      case HSR_SYSREG_PMINTENSET_EL1:
>      case HSR_SYSREG_PMINTENCLR_EL1:
> +    case HSR_SYSREG_PMMIR_EL1:
> +        /*
> +         * Accessible from EL1 only, but if EL0 trap happens handle as
> +         * undef.
> +         */
This comment was recently removed, so please do not re-introduce it.

>          return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>      case HSR_SYSREG_PMUSERENR_EL0:
>          /* RO at EL0. RAZ/WI at EL1 */
> @@ -300,8 +305,36 @@ void do_sysreg(struct cpu_user_regs *regs,
>      GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
>      GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
>      GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
> -    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
> -    GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
> +
> +    case HSR_SYSREG_ID_DFR0_EL1:
> +    {
> +        struct domain *d = v->domain;
There is no need for a separate local variable if it's only used once. In this
series, please just use `v->domain` for `is_vpmu_domain()`.

> +        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
> +
> +        if ( !is_vpmu_domain(d) )
> +        {
Please omit the braces for a single line `if` block.

> +            info_dbg32.perfmon = 0;
> +        }
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  info_dbg32.bits[0]);
> +    }
> +
> +    case HSR_SYSREG_ID_DFR1_EL1:
> +    {
> +        struct domain *d = v->domain;
> +        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
> +
> +        if ( !is_vpmu_domain(d) )
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
> @@ -342,8 +375,41 @@ void do_sysreg(struct cpu_user_regs *regs,
>      }
>  
>      GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
> -    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
> -    GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
> +
> +    case HSR_SYSREG_ID_AA64DFR0_EL1:
> +    {
> +        struct domain *d = v->domain;
> +        union cpuinfo_dbg64 info_dbg64 = domain_cpuinfo.dbg64;
> +
> +        if ( !is_vpmu_domain(d) )
> +        {
> +            info_dbg64.pmu_ver = 0;
> +            info_dbg64.pmss = 0;
> +            info_dbg64.mtpmu = 0;
Why don't you clear hpmn0?

> +        }
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  info_dbg64.bits[0]);
> +    }
> +
> +    case HSR_SYSREG_ID_AA64DFR1_EL1:
> +    {
> +        struct domain *d = v->domain;
> +        union cpuinfo_dbg64 info_dbg64 = domain_cpuinfo.dbg64;
> +
> +        if ( !is_vpmu_domain(d) )
> +        {
> +            info_dbg64.syspmuid = 0;
> +            info_dbg64.spmu = 0;
System PMU accesses undef for a vPMU-enabled domain too. Clear them together
with SPE, TRBE, etc.

> +            info_dbg64.pmicntr = 0;
> +            info_dbg64.ebep = 0;
FEAT_EBEP is Armv9 just like SEBEP, so you should apply my comments to it as well.

> +            info_dbg64.dpfzs = 0;
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
> index 94d14fb6a9..05f4d0f5df 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -219,8 +219,22 @@ static int __init create_domain_cpuinfo(void)
>      domain_cpuinfo.isa64.api = 0;
>      domain_cpuinfo.isa64.gpa = 0;
>      domain_cpuinfo.isa64.gpi = 0;
> +
> +    /* Hide SPE, TRBE, BRBE, Trace Extensions and ITE */
> +    domain_cpuinfo.dbg64.trace_ver = 0;
> +    domain_cpuinfo.dbg64.pms_ver = 0;
> +    domain_cpuinfo.dbg64.trace_filt = 0;
> +    domain_cpuinfo.dbg64.trace_buffer = 0;
> +    domain_cpuinfo.dbg64.ext_trc_buff = 0;
> +    domain_cpuinfo.dbg64.brbe = 0;
> +    domain_cpuinfo.dbg64.ite = 0;
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
> index a7503a190f..e03218b51e 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -246,6 +246,7 @@
>  #define PMINTENSET      p15,0,c9,c14,1  /* Perf. Mon. Interrupt Enable Set Register */
>  #define PMINTENCLR      p15,0,c9,c14,2  /* Perf. Mon. Interrupt Enable Clear Register */
>  #define PMOVSSET        p15,0,c9,c14,3  /* Perf. Mon. Overflow Flag Status Set register */
> +#define PMMIR           p15,0,c9,c14,6  /* Perf. Mon. Performance Monitors Machine Identification Register */
Please drop "Performance Monitors". It's the same as "Perf. Mon".

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
> index 3205c7df46..a660cb0734 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -305,6 +305,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>      case HSR_CPREG32(PMXEVTYPER):
>      case HSR_CPREG32(PMXEVCNTR):
>      case HSR_CPREG32(PMOVSSET):
> +    case HSR_CPREG32(PMMIR):
PMMIR is EL1 only, so it does not belong to this block and this comment. Place
it next to PMINTENCLR.

>          /*
>           * Accessible at EL0 only if PMUSERENR_EL0.EN is set. We
>           * emulate that register as 0 above.
> @@ -320,8 +321,36 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>      GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
>      GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
>      GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
> -    GENERATE_TID3_INFO(ID_DFR0, dbg32, 0)
> -    GENERATE_TID3_INFO(ID_DFR1, dbg32, 1)
> +
> +    case HSR_CPREG32(ID_DFR0):
> +    {
> +        struct domain *d = v->domain;
> +        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
> +
> +        if ( !is_vpmu_domain(d) )
> +        {
> +            info_dbg32.perfmon = 0;
> +        }
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
This breaks the arm32 build (you should always at least build test the patches):
s/hsr.sysreg.read/cp32.read/

> +                                  info_dbg32.bits[0]);
> +    }
> +
> +    case HSR_CPREG32(ID_DFR1):
> +    {
> +        struct domain *d = v->domain;
> +        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
> +
> +        if ( !is_vpmu_domain(d) )
> +        {
> +            info_dbg32.mtpmu = 0;
> +            info_dbg32.hpmn0 = 0;
> +        }
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  info_dbg32.bits[1]);
> +    }
> +
>      GENERATE_TID3_INFO(ID_AFR0, aux32, 0)
>      GENERATE_TID3_INFO(ID_MMFR0, mm32, 0)
>      GENERATE_TID3_INFO(ID_MMFR1, mm32, 1)
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index eef10c2ea2..e352e2b38e 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1269,6 +1269,11 @@ static always_inline bool is_iommu_enabled(const struct domain *d)
>      return evaluate_nospec(d->options & XEN_DOMCTL_CDF_iommu);
>  }
>  
> +static inline bool is_vpmu_domain(const struct domain *d)
> +{
> +    return d->options & XEN_DOMCTL_CDF_vpmu;
> +}
> +
>  #ifdef CONFIG_MEM_PAGING
>  # define mem_paging_enabled(d) vm_event_check_ring((d)->vm_event_paging)
>  #else

~Michal


