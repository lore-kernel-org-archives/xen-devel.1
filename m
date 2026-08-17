Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F39C5CFC1
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 07:01:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392485.1631434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvrKp-0002q9-RQ; Mon, 17 Aug 2026 07:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392485.1631434; Mon, 17 Aug 2026 07:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvrKp-0002q2-Ou; Mon, 17 Aug 2026 07:00:39 +0000
Received: by outflank-mailman (input) for mailman id 1392485;
 Mon, 17 Aug 2026 07:00:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wvrKo-0002pv-U0
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 07:00:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvrKn-002V4W-Ge
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:00:37 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a82b18f-e002-0a2a0a5209dd-0a2a450bc594-12
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:00:36 +0200
Received: from [52.101.52.62]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a82b193-b7e8-0a2a450b0019-3465343e46a9-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:00:36 +0200
Received: from BN9PR03CA0144.namprd03.prod.outlook.com (2603:10b6:408:fe::29)
 by PH7PR12MB7844.namprd12.prod.outlook.com (2603:10b6:510:27b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 07:00:28 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:408:fe:cafe::a5) by BN9PR03CA0144.outlook.office365.com
 (2603:10b6:408:fe::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 07:00:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 07:00:27 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 02:00:27 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 17 Aug 2026 02:00:26 -0500
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
 b=IqFgICb//lhB1/UstvqW82JrH/wMO95QyN+mb5jpRDKkGnuGGQCACaUL7Ch5KJ6AsGU4cEzmbIdhIHKH07tqMtwz2xlGrW6Qkx/0IdPA6XMbOC5IE/hN9MJhjJtyyTvqvEDHmuhdwt2B2GPK7alhwsRD5nPO8x8ib2rVwU5mAt43HXyMPZth1jdLAsve724Ny1/QQl81bw5+ifgZKTMJc7sJaCeVXe4jUsbG6wVCvdcU28wrDyjCZBmslJNPCxiQsHmfRT5UcpJotRhEwv3M3lM/3tuR9B7bDCOaiCPHuzY5fQ89GuruKkcNRa4u/ajlfhDy2Z/F9BjTxWARqsWlvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RMwhhctxyiEppC1UIO+FGB5fkFikiJdZztxKlN7w5E=;
 b=PPfmKa15TVDOOaq96ZNjzYxJU6KZTeJPhPRI7axoyfYq+EADlQx3pssfRqVlXBkQ0Bv5AXIuTCXePdXmF+esRX+qdBl3c1UVSLtQT7KuIFWgBUBkEpFziNwFw6WvSwEvOUYUH1v7/DVWXUzyard1HlJ3DBZyutbVWPO6vBTeI37UnMERfKfjAQphGm8d3KM4uDtcDb3O9T1EV1ByWFgTV2CT7eWsm9CU3StIuCi0qh4M7RmaoeYv50YmwdWsHMUBVr0yPvZUHIMJe64XvZCyCPHooWotSAS3a9jnxKdaqu9yH3/8nGJucABZzgJWoD7J8P3vvM2YNjtMOj6X74PapQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RMwhhctxyiEppC1UIO+FGB5fkFikiJdZztxKlN7w5E=;
 b=vZ4KwcJd8TtIpKa0Q8J+Q5OrqujhKcn7VhIsEBnOmadajFGI40kLdGEVbP+l/vm9hvTFlXtiMq38RNimg3/jEuBLHV/H45KMKw1mLspAEfbXHTPJ7Yp7romUWtvVGEJf/Yf4ErSoMbhsoulCWBoBVuew1cBUe6runPWwAtM95Rs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <37b2d119-7ff9-4862-9bcd-acb0b7ff4c9d@amd.com>
Date: Mon, 17 Aug 2026 09:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Hide PMU registers from the guest, when the
 vPMU feature is disabled.
To: Hirokazu Takahashi <taka@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260813032938.3946-1-taka@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260813032938.3946-1-taka@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|PH7PR12MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: a30f1f1d-80e1-4333-208b-08defc2d3815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pi3sbSdR6sTVYpWfRysz3IZo7ZQ/1cRh0WLjmepQNEjCfUdGqQDOjf7xZoQulHRlYyoOc2Uvl0reyOCm1Ro6ixMWx4Y8FeJcoNLUEcIHCMvwfmp9uTQGoY5noDHsK6BxIrxHYtH8IWL6jsG9QrEqBiQBMHKe4eLUavCNF/oFpLlRI51w9p/bgePMGyvZbkhLytuQSUSxOA/XmUDghYkBIPUref0JNsfNmTL3I4FIxEWogeTi+kcxDK9eExJkfFFJV2gffV2/jvq3OoIRDIqjbjFKWAft714UdMXKrW68SATqhXCrQcjMLY0s56GeGRvJ0tbgN8Q9Rm4ur6jLUJe+VF1sQWb3UhnF+8zUBnrgVMm3pLx6BqVzohCG5/OdoxFLZ7jZDWyGrNelpOyOFUa6kCRR5UZ7WHF2O+/N0Yj1sSEDxbXIQ7vt5uRjz5Jr09k5HLKRI4zmddrDECK+jM3lDmkxPX5LuDGSXl/4QOhA6ev1FHoG1S5CFGwMkj5aLFJyRr5EhObYy36a11lvFiIZsN72gNVJjE48PeXjSPd4YjjrvE4mp0txQvtZebv0Mb1K9o7XNb9AxxlOaJqSDmBwu/ZnLiijGRHez+KYQ1GNfsXVpfAiIzfWZxNFTPcUkk50HYUzp9z8ycLfcT4Jr7qFMkyEqhx1FgTAwKvX8Fizn68LllBHssSjtVZVn/CZnhT1dJRtpMklVK4H6sIzfI6e4Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4YQ6FSlSrwegjtpQoYzV0q+b+Ej8jqceCHUBfNhfcMXDoPmgbJkEg4Sp+ViZ1xpn1viq4P9LhaDpLtcRMGh0DROmxpCXvUZgPvLwTnJPkRT+d22q5qAQh9Cp6kSehE9zQBpcjCFzcelCwO4JtFEXdcFQ0tTQoFW4elfa6oktzJluHOv45k6QQQqd+3e7IX+uQiboRpV+C8cToWjJU0+Hv5vDByofXt4M7Glv2GHWThMxme3hxnjL9jtDOUgwJMEqT9D/bcE2e1FiUB1t5EV6FR2HZXJtdjQ6GOAQazpH0K/jZe3hWJw1Ap/3dXSL2GoJ+Z/R2oMaN6mC057NKjSt0KOiSdjGFqw1HY3qdYWF3XNka0uRxQPUCPfgSBvUg2OtVri1RvJLglteuEH8v7nEpbPSJAt+ol2kLeq6qH3/hp3TaLay5uBu7kKjiq1mnkPF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 07:00:27.7381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a30f1f1d-80e1-4333-208b-08defc2d3815
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7844
X-purgate-ID: tlsNG-42698a/1786950036-A8ECE9EA-6A37AD35/0/0
X-purgate-type: clean
X-purgate-size: 8255



On 13-Aug-26 05:29, Hirokazu Takahashi wrote:
> On ARMv8.4-A and newer platforms, booting Dom0 Linux with ACPI enabled
> causes the domain to probe advanced PMU feature based on system ID
> register ID_AA64DFR0_EL1.During this probe, Linux accesses PMMIR_EL1,
> which causes unhandled register traps and crashes the domain.
> 
> To address this issue, I implement the following:
Please use the imperative mood

> 
> - Hide PMU registers from a guest domain when its vPMU feature is
>   disabled.
> - Proactively make SPE, TRBE, BRBE, and Trace Extensions inaccessible
>   to guest domains, as they could potentially cause similar issues.
> - Add emulation for PMMIR_EL1 register accesses performed by a guest
>   domain when vPMU is enabled. However, similar to reads from other
When vPMU is enabled, there is no trap/emulation

>   PMU registers, the read value returns zero (note that this is a
>   temporary implementation).
> - Emulation for PMSS (PMU Snapshot) register accesses is not yet
>   implemented, because PMSS support is not available in
>   qemu-system-aarch64 and could not be verified.
> 
> Fixes: 07b9acea116e "xen/arm: Add handler for ID registers on arm64"
> Fixes: 3669a1cb9598 "xen/arm: create a cpuinfo structure for guest"
Fixes commit title needs to be in brackets ()

> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
> Changes in v2:
>  * Instead of unconditionally hiding the PMU feature from guests,
>    we now determine whether to expose PMU to a guest domain based on
>    its configuration.
> 
>  xen/arch/arm/arm64/vsysreg.c          | 31 +++++++++++++++++++++++++--
>  xen/arch/arm/cpufeature.c             |  8 +++++++
>  xen/arch/arm/include/asm/arm64/hsr.h  |  1 +
>  xen/arch/arm/include/asm/cpufeature.h | 14 ++++++------
>  4 files changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index d14258290f..520faa02ca 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -229,6 +229,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>       */
>      case HSR_SYSREG_PMINTENSET_EL1:
>      case HSR_SYSREG_PMINTENCLR_EL1:
> +    case HSR_SYSREG_PMMIR_EL1:
What about AArch32 PMMIR?

>          /*
>           * Accessible from EL1 only, but if EL0 trap happens handle as
>           * undef.
> @@ -306,7 +307,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>      GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
>      GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
>      GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
> -    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
>      GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
>      GENERATE_TID3_INFO(ID_AFR0_EL1, aux32, 0)
>      GENERATE_TID3_INFO(ID_MMFR0_EL1, mm32, 0)
> @@ -326,6 +326,18 @@ void do_sysreg(struct cpu_user_regs *regs,
>      GENERATE_TID3_INFO(MVFR1_EL1, mvfr, 1)
>      GENERATE_TID3_INFO(MVFR2_EL1, mvfr, 2)
>  
> +    case HSR_SYSREG_ID_DFR0_EL1:
You only cover AArch64. What about AArch32 DFR0?

> +    {
> +        struct domain *d = current->domain;
Use v->domain instead like the surrounding code

> +        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
> +
> +        if ( !(d->options & XEN_DOMCTL_CDF_vpmu) )
> +            info_dbg32.perfmon = 0;
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  info_dbg32.bits[0]);
> +    }
> +
>      case HSR_SYSREG_ID_AA64PFR0_EL1:
>      {
>          register_t guest_reg_value = domain_cpuinfo.pfr64.bits[0];
> @@ -348,7 +360,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>      }
>  
>      GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
> -    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
>      GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
What about DFR1 fields like PMICNTR? They suffer from the same problem.

>      GENERATE_TID3_INFO(ID_AA64ISAR0_EL1, isa64, 0)
>      GENERATE_TID3_INFO(ID_AA64ISAR1_EL1, isa64, 1)
> @@ -358,6 +369,22 @@ void do_sysreg(struct cpu_user_regs *regs,
>      GENERATE_TID3_INFO(ID_AA64AFR0_EL1, aux64, 0)
>      GENERATE_TID3_INFO(ID_AA64AFR1_EL1, aux64, 1)
>  
> +    case HSR_SYSREG_ID_AA64DFR0_EL1:
Please adhere to the order in which the cases were originally placed
> +    {
> +        struct domain *d = current->domain;
> +        union cpuinfo_dbg64 info_dbg64 = domain_cpuinfo.dbg64;
> +
> +        if ( !(d->options & XEN_DOMCTL_CDF_vpmu) )
To avoid duplication, please introduce is_vpmu_domain
> +        {
> +            info_dbg64.pmu_ver = 0;
> +            info_dbg64.mtpmu = 0;
> +            info_dbg64.pmss = 0;
> +        }
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  info_dbg64.bits[0]);
> +    }
> +
>      case HSR_SYSREG_ID_AA64ZFR0_EL1:
>      {
>          /*
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 94d14fb6a9..0e9bf15ca5 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -219,6 +219,14 @@ static int __init create_domain_cpuinfo(void)
>      domain_cpuinfo.isa64.api = 0;
>      domain_cpuinfo.isa64.gpa = 0;
>      domain_cpuinfo.isa64.gpi = 0;
> +
> +    /* Hide SPE, TRBE, BRBE, and Trace Extensions */
> +    domain_cpuinfo.dbg64.pms_ver = 0;
> +    domain_cpuinfo.dbg64.trace_ver = 0;
> +    domain_cpuinfo.dbg64.trace_filt = 0;
> +    domain_cpuinfo.dbg64.trace_buffer = 0;
> +    domain_cpuinfo.dbg64.ext_trc_buff = 0;
> +    domain_cpuinfo.dbg64.brbe = 0;
>  #endif
>  
>      /* Hide AMU support */
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
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index bf902a3970..ce8b58458f 100644
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
> @@ -216,16 +216,18 @@ struct cpuinfo_arm {
>              unsigned long trace_ver:4;
>              unsigned long pmu_ver:4;
>              unsigned long brps:4;
> -            unsigned long __res0:4;
> +            unsigned long pmss:4;
>              unsigned long wrps:4;
> -            unsigned long __res1:4;
> +            unsigned long sebep:4;
Where did you take this field from? I can't see it in the latest Arm ARM:
https://support.arm.com/documentation/ddi0487/mc/-Part-D-The-AArch64-System-Level-Architecture/-Chapter-D24-AArch64-System-Register-Descriptions/-D24-2-General-system-control-registers/-D24-2-79-ID-AA64DFR0-EL1--AArch64-Debug-Feature-Register-0?lang=en

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
>              unsigned long __res4:64;
> @@ -408,7 +410,7 @@ struct cpuinfo_arm {
>          };
>      } pfr32;
>  
> -    union {
> +    union cpuinfo_dbg32 {
>          register_t bits[2];
>          struct {
>              /* DFR0 */

~Michal


