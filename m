Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4201C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:41:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428584.1651437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xvk-0002uA-BZ; Tue, 22 Sep 2026 10:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428584.1651437; Tue, 22 Sep 2026 10:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xvk-0002u3-88; Tue, 22 Sep 2026 10:40:56 +0000
Received: by outflank-mailman (input) for mailman id 1428584;
 Tue, 22 Sep 2026 10:40:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x8xvi-0002ts-IW
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:40:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8xvh-002YWX-Hq
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 12:40:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab25b1a-bab6-0a2a0a5309dd-0a2a450b976e-40
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:40:53 +0200
Received: from [52.101.193.10]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab25b33-b7e8-0a2a450b0019-3465c10a625b-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:40:52 +0200
Received: from SJ0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:a03:331::18)
 by IA0PR12MB8279.namprd12.prod.outlook.com (2603:10b6:208:40c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 10:40:47 +0000
Received: from SJ1PEPF000037B4.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::12) by SJ0PR03CA0073.outlook.office365.com
 (2603:10b6:a03:331::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 10:40:47 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037B4.mail.protection.outlook.com (10.167.244.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 10:40:47 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 05:40:46 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 22 Sep 2026 05:40:45 -0500
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
 b=u/f8NQ35P2f8Z+yYJ8FYYYgZHaEv3kXAIeq8CQb0LeLYQnIu1ErgkRGGEB406OBV4viDCR1MeNQ9NQ91fcZT+Kg2ejGfnagGBOLwy7nWaqtuONNntFgoWxkh3Bqof/EyOnN/1AZvOVhV/9wtyTBnwraEAv4nAkfe0VCaUgGXdu9pOHc1y+1v/YS/ZCF6p9sM7rqbPT2l03uY46hYGoOd9Xq9AsXqr/gbGuOoIDoY9/InoK025dPbAriPhzaQ4L41aqb58ktZPuba5Ctk5w7XBy7pzkFB9xZMswTmskgq5TBjVqeUXq/SloYVrN19thc407Y0cH0add5mWdkaw09OsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSXtJlKtuHO38bEmsYe9zHxX98764NQ07GAZX44543w=;
 b=f4/RoBEx/i4gMDbdwxxCshi+qtDEIkijO5DEfpUf8By8x+M/AR8uGGsRLHKh9/TT9zsQGM8ctJ6I1eAMKXMW4lHS+HZHYhDOZK4fVmnmVQaraOOIipwXIfJDSZO7SjAS7elLly5aqeXVYpd29KrWlC5gYsbMUnI4ybbHU+57mNHopcblqM0IhzXYJkH8sS3c7xBhmMpqazom6t+nfmd33iQz1e91N0nbF0ecg7uHnEF9ThxVUDFz3Of3If2dww0mfQjX0RTLwdv7v/Udseec/AQcYs4G9yTL4wLf433366na+2ae4kkov9SMXMhklTKcY6hu/7KvBIwcnTJjHbWQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSXtJlKtuHO38bEmsYe9zHxX98764NQ07GAZX44543w=;
 b=sOA1n3R8EHCLrHL2wWuPy9Napt90SVQCHixSgtAFiYpxWITGtNsSeffTAvlhz7gwc8RUaJHqr7ev12ia1bfxKfK4Omw8DvUU46zIUnB8y7DepGXgu7mxcESSKbDKicG2cyDlQQOwKL7ve7GKQgdMXu2I4SYTMKh40gXDDkSLUoc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <600256d1-a038-4ceb-a1df-a8d86dfee130@amd.com>
Date: Tue, 22 Sep 2026 12:40:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/arm: derive GIC CPU interface ID fields from the
 vGIC
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <1101ee75414ec2e6bec05d34118c4fa7f8b60bcf.1790060180.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1101ee75414ec2e6bec05d34118c4fa7f8b60bcf.1790060180.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B4:EE_|IA0PR12MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e17ce70-aed1-46a6-e85f-08df1895f671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|6133799003|22082099003|18002099003|5023799004|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ehA/NL4DQD5sQa/bA/jjjCK9mMvC4wGWam4HjsSSSakLw0J0KRJ3PlXsoR4KJCSSP+AD29ga6bmWLdAjsVFChcvEUOy+gWm5WnhoQ8ddjynRCmKxSL9HqoVkRhk2X1dQO7nBDkM+0tFsLtqcw5Iy/04IuTLqY223XJzE5MC3h/+fB2By8kisPY4d/PcV1m14SlEHifqm8+4FRe4N1HSwjFahXj95CoK4f6xdjPBB74o5hBipS58cgucmyEpabZCJ6Da5nsJCOqkqxoIVPvHfMrLst8agCYhWEcX+IypDRb0dbanXxUwqGl+5iWLdcv+ibfmxrHvmLZ5SlgGc2hGk0+kQCFNuadiPBD/b45ICO1FDSXKk9v3WmxkmmoKwI05JleoNVPBs8CTWGTKyQzOZypYlNRSVnIpCoNMkpGp0LHRkiE5holxuakzK1tajQfjfCi3oB6hBbsJCHEafsIItYNNjpPENZWjNHx5fCwDpghi97/Xik9nAsvO+3VCtFqwTzG7OJt7Da/qLAz6cTzXCHATK89CxzK9etfOAA4X4vCm6GbSrwm4yhqYYuKFHQ/T8A6VdNPU+o1OY6rlVVkKmV1rymwOj7jRe2tmMAPuR4W2QxKjqNcGFpfR3SEvDkT4AtM0CQ+t6nN/W375hlSsZrA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(6133799003)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fGxMhl9MZKFo5AYJu+gclXmE/jG4NXnxFwifJBru6qUn2VZ/w8LuHDlxdTtFQDV/dqYLaY7HXWy0P5qRhNnVRjbs27A48TjqwXtF3Oa4zQalb9aMcQjyRfu4dzHKve3bc08vcCBecps4SUKaY/AT9yryk1UxsARHJR7t7Z1AVMAuj3l7r8bi0i7M9GziRsi9MqPGc5uiZVsSNN6vDBcB5+D0811BIw52vbIPyyYgcYt4BM6vvGPG+Feat7Cswusp93nSvQNNstyiiZ1pT4xWiv6PKWfvC8qUDuhOj4T4nIldKO6T99fxQVcBlNnYfB71xzl8p9dNZ4KW5QdyE724JcyqB/pbQQg8IJ5nkLHeXt5Jkb1/+SGc9ambZHxSWSpk8VbJly1mRSxExY3vA1kMKPNBIiZQT0u67i6dUqjdeN6KbcvsXuXplk0NtjilkDKH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 10:40:47.2471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e17ce70-aed1-46a6-e85f-08df1895f671
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8279
X-purgate-ID: tlsNG-42698a/1790073652-A84CB9EA-11DD97EE/0/0
X-purgate-type: clean
X-purgate-size: 7509



On 22-Sep-26 09:21, Mykola Kvach wrote:
> Xen exposes ID_AA64PFR0_EL1.GIC and ID_PFR1.GIC from domain_cpuinfo,
> which is initialized from the sanitized host CPU feature state. This
> does not necessarily match the virtual interrupt controller configured
> for a domain.
> 
> A vGICv2 domain can therefore observe a nonzero GIC field when the host
> supports the GIC system register interface, even though Xen disables that
> interface for the domain. On a GICv4.1-capable host, a vGICv3 domain can
> observe encoding 0b0011, although Xen exposes only its vGICv3 model.
> 
> Derive the fields from the domain's vGIC version instead. Expose 0b0000
> for vGICv2 and 0b0001 for vGICv3. This covers ID_AA64PFR0_EL1 and the
> ID_PFR1_EL1 alias in AArch64 state, as well as ID_PFR1 accessed through
> CP15 in AArch32 state. Leave the alias unchanged when AArch32 is
> unavailable.
> 
> Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
> Fixes: 8f81064a07c6 ("xen/arm: Add handler for cp15 ID registers")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v4:
> - Explain why ID_PFR1_EL1 is left unchanged without AArch32 EL0 support.
> - Move all ID_PFR1_*_SHIFT definitions to the common asm/sysregs.h and
>   remove the unused cpregs.h includes from the ARM64 files.
> - Return explicit unsigned GIC field values to avoid MISRA C Rule 10.3.
> 
> Changes in v3:
> - Add direct dependencies for the shared ID register helpers.
> - Move ID_PFR1_GIC_SHIFT to the common CP15 register header.
> - Apply cosmetic fixes from review.
> 
> Changes in v2:
> - Share the GIC ID field helpers between the AArch64 and AArch32 paths.
> - Parenthesize the individual ASSERT conditions.
> - Preserve ID_PFR1_EL1.GIC when AArch32 is unavailable.
> - Target master instead of the 4.22 release.
> 
> v1: https://patchew.org/Xen/ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola._5Fkvach@epam.com/
> ---
>  xen/arch/arm/arm64/vsysreg.c             | 21 ++++++++++++++++++-
>  xen/arch/arm/include/asm/arm64/sysregs.h |  9 --------
>  xen/arch/arm/include/asm/sysregs.h       |  9 ++++++++
>  xen/arch/arm/include/asm/vreg.h          | 26 ++++++++++++++++++++++++
>  xen/arch/arm/vcpreg.c                    | 12 ++++++++++-
>  5 files changed, 66 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index 66f4f23bb3..2912445301 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -299,7 +299,22 @@ void do_sysreg(struct cpu_user_regs *regs,
>       * to identify the processor features
>       */
>      GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
> -    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
> +    case HSR_SYSREG_ID_PFR1_EL1:
> +    {
> +        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
> +
> +        /*
> +         * Preserve the sanitized ID_PFR1_EL1 value when AArch32 EL0
> +         * is not supported, as for the other AArch32 ID registers.
> +         */
> +        if ( cpu_feature64_has_el0_32(&domain_cpuinfo) )
> +            guest_reg_value = id_reg_set_gic_field(guest_reg_value,
> +                                                   ID_PFR1_GIC_SHIFT,
> +                                                   v->domain);
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  guest_reg_value);
> +    }
>      GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
>  
>      case HSR_SYSREG_ID_DFR0_EL1:
> @@ -362,6 +377,10 @@ void do_sysreg(struct cpu_user_regs *regs,
>              guest_reg_value |= (sysval << ID_AA64PFR0_SVE_SHIFT) & mask;
>          }
>  
> +        guest_reg_value = id_reg_set_gic_field(guest_reg_value,
> +                                               ID_AA64PFR0_GIC_SHIFT,
> +                                               v->domain);
> +
>          return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
>                                    guest_reg_value);
>      }
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index f3c11d871e..f6ece8f972 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -438,15 +438,6 @@
>  #define MVFR1_FPDNAN_SHIFT           4
>  #define MVFR1_FPFTZ_SHIFT            0
>  
> -#define ID_PFR1_GIC_SHIFT            28
> -#define ID_PFR1_VIRT_FRAC_SHIFT      24
> -#define ID_PFR1_SEC_FRAC_SHIFT       20
> -#define ID_PFR1_GENTIMER_SHIFT       16
> -#define ID_PFR1_VIRTUALIZATION_SHIFT 12
> -#define ID_PFR1_MPROGMOD_SHIFT       8
> -#define ID_PFR1_SECURITY_SHIFT       4
> -#define ID_PFR1_PROGMOD_SHIFT        0
> -
>  #define MVFR2_FPMISC_SHIFT           4
>  #define MVFR2_SIMDMISC_SHIFT         0
>  
> diff --git a/xen/arch/arm/include/asm/sysregs.h b/xen/arch/arm/include/asm/sysregs.h
> index f6af987ef5..8dcf82a694 100644
> --- a/xen/arch/arm/include/asm/sysregs.h
> +++ b/xen/arch/arm/include/asm/sysregs.h
> @@ -9,6 +9,15 @@
>  # error "unknown ARM variant"
>  #endif
>  
> +#define ID_PFR1_GIC_SHIFT            28
> +#define ID_PFR1_VIRT_FRAC_SHIFT      24
> +#define ID_PFR1_SEC_FRAC_SHIFT       20
> +#define ID_PFR1_GENTIMER_SHIFT       16
> +#define ID_PFR1_VIRTUALIZATION_SHIFT 12
> +#define ID_PFR1_MPROGMOD_SHIFT       8
> +#define ID_PFR1_SECURITY_SHIFT       4
> +#define ID_PFR1_PROGMOD_SHIFT        0
> +
>  #ifndef __ASSEMBLER__
>  
>  #include <asm/alternative.h>
> diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
> index 387ce76e7e..96de1c4916 100644
> --- a/xen/arch/arm/include/asm/vreg.h
> +++ b/xen/arch/arm/include/asm/vreg.h
> @@ -4,11 +4,37 @@
>  #ifndef __ASM_ARM_VREG__
>  #define __ASM_ARM_VREG__
>  
> +#include <xen/bitops.h>
> +#include <xen/bug.h>
> +#include <xen/sched.h>
> +
> +#include <asm/gic.h>
> +
>  typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
>                                     bool read);
>  typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
>                                     bool read);
>  
> +#define ID_REG_GIC_WIDTH 4
> +
> +static inline unsigned int vgic_id_gic_field(const struct domain *d)
> +{
> +    ASSERT((d->arch.vgic.version == GIC_V2) ||
> +           (d->arch.vgic.version == GIC_V3));
> +
> +    return d->arch.vgic.version == GIC_V3 ? 1U : 0U;
> +}
> +
> +static inline register_t id_reg_set_gic_field(register_t val,
> +                                              unsigned int shift,
> +                                              const struct domain *d)
> +{
> +    register_t mask = GENMASK(shift + ID_REG_GIC_WIDTH - 1, shift);
> +
> +    return (val & ~mask) |
> +            ((register_t)vgic_id_gic_field(d) << shift);
No need for split. It would fit 80 chars.

> +}
This is a header included by a few source files, so the less we expose the
better. Please combine vgic_id_gic_field() into id_reg_set_gic_field() given its
simplicity and the fact that it is only used in the latter. Also, your new
helpers use a vgic.h namespace (this header uses vreg_ prefix). I think it makes
sense to s/id_reg_set_gic_field/vreg_id_reg_set_gic_field/ and
s/ID_REG_GIC_WIDTH/VREG_ID_REG_GIC_WIDTH/.

With that changed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


