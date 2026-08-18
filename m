Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86960C5DF74
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 14:41:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394240.1633071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwKzs-0002oJ-DC; Tue, 18 Aug 2026 14:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394240.1633071; Tue, 18 Aug 2026 14:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwKzs-0002oC-Ad; Tue, 18 Aug 2026 14:41:00 +0000
Received: by outflank-mailman (input) for mailman id 1394240;
 Tue, 18 Aug 2026 14:40:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwKzq-0002o6-JY
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 14:40:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwKzp-00C0P2-JW
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 16:40:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a846ee8-8faa-0a2a0a5109dd-0a2a4502a830-30
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:40:57 +0200
Received: from [40.93.198.19]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a846ef7-6ca4-0a2a45020019-285dc6133339-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:40:57 +0200
Received: from BN1PR13CA0020.namprd13.prod.outlook.com (2603:10b6:408:e2::25)
 by DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 14:40:52 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::9b) by BN1PR13CA0020.outlook.office365.com
 (2603:10b6:408:e2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 14:40:52 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 14:40:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 09:40:52 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 09:40:51 -0500
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
 b=I0AjZs0LNxrB1lC5lhIEO6r46r8jSYPYOfb08bFJOHrUx1+gchthtVvVYSnermaDDvgvQ/v+n1aGAyGuMR0pHRQ4fRiYk8ABDlPu+TESpggkIIz4mEeQ9JBPbFmd8/q6UTmAu1sukwq4c8YXyb3qkfdzghaDN228k3tzW/5wOaEp40J0qMq/rD9S3uC3HEIe5glHZC6b9K73B+yJvrwo5lfR+rmB7xXpddn1jLx/GY/Vl99QS7qLPwPGgCfv6m6fNtrRjF0KZTOAqfi2U/DmU0f7XKeej/ywWWmFLJxXhe69s1/nJqwrp0LPn4GoK31tiFxhtvZZy/J4+b+ykoLyPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBoiOGtufWp+jsiy8lRgE3KmXZlt92Xy9zli4/jVRT4=;
 b=cCUXQfMvfOplxAUGbjbes9ByM1VVodrcvXTDehHy64HOdiFLqD+A/4u23AXyhfHQWrOMoreJ1ALlk8RcDTUZgUy5zaPxp1eNv1O6plCUnICEYW4Abi9QLJrszawXFDvF5GRT/2aM532fWSk9EhBQXbSNPLzl0WnqFs0PvMnD4bg4Y2JUp9sVARiEQ3hhqbKsXHSE4fA2Y8gQOD9BmuTDrjd/Szfwy4m8rjp68NXke7JR8ULDyzsllJ7VSAB7C83Z+WXNHUbmNHl/uEyBEmarg8Em2Pmpn5+pKbjWcOhAYItd0+lcjefJnna14cjPNAMnKjB4bFYbOs+1OSsO/pYweA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBoiOGtufWp+jsiy8lRgE3KmXZlt92Xy9zli4/jVRT4=;
 b=2tdjREW0sduhMnTKM07Ex/Hu4MDVfPeJCwVJ8Gz50T9ITIJwg8tCJpywABFujT4QKBLN3X2Cy6hFCpRH+rLzvDDvxBvRDgDqOs0AuJS/2o1gtBNV2ucryxsnDCWxN9PheeHi2qPszSYUftQIKr3j0RQAkGxE321uyGhoxPS5JT4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <ec0800b0-cb65-4b75-b13b-69a90cec75ca@amd.com>
Date: Tue, 18 Aug 2026 16:40:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: derive GIC CPU interface ID fields from the
 vGIC
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <e8841a943eb7f6a64348b7316032084fb848bc2b.1787040666.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <e8841a943eb7f6a64348b7316032084fb848bc2b.1787040666.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|DM6PR12MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c314a54-cb64-40d1-775b-08defd36b42b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|5023799004|11063799006|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CO0CXD+WdCDo768J2Rcm8Zvz0TgUezvvdMeHY6+gR5AdK6iA51UfzVIHgILFoqHqmX15PMmgWyCSj8A33xYvT3JbhR25om8crQhkUiMueYnLUtD+XgMKhhC16xY9/nnqdW83jTHGg7K2Uju3Rbl2Fr4BXLrV/HoYPNtOLNuv6XGu1ziLH4dmAqwt6Txi8gHwm2sBijHSOx4Lig9lfD0o8GP11Eccd8klv8XI6opZns0VEdM0KBUoUeNX5OrlHYqLmNH95vkGLiSUwta6BqlWsI3vK2QdjqwKHym7kFsaPvSD90FifdmBFoeyV+aW27qaS6Wa7jsDO3m22hrxS19HMb7Xrz05XTPHbUxMtlsjVmvb69DIBlGsKNIcLJJGCjX/lDG2qDO+RMh1J6pK9kjGdhnSg9R+1TS5pUCVp6yMRyNj6pE1TplEKdogT1yq8aVeupXek6azmwd/G00Kuk7sBzqhokctzhDdL3ijpcVJhvrSVBoVlfHz3zBFtf4pXLCWvjK51nHQpk4aZKnasGo88U+MnXI85J81LDbrKvL2G3JMpzHOYcad+GzFnY9Rd8+wUVMfM4rUrKPnyhTvTuK7D1MyKQER9kEaeClD2UT8sYaLEK1Wb5+d0A4YgsNKNzwnvLVq1QT2JYcVpgUwJQ66Ew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(5023799004)(11063799006)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HbGON6NkIlmc9m46ZBFbENqvFuZCZ+uTSaxBwPr2enA0O00qh4C24ZhblBExd50wnrg0BA4FlqU3mMHIri5/SMn3p1GH6x7xmliN0z0qLt7Drg3QyUN2c4x0SWV/h5BHrB6d+gfKH29a9F2dSGoL5uigihPwUtySJoULS11zC3+V/9tTSx8u6x0+g0b4GYLGJyCYwWTzXl/cO/2tR721571wuj0Dthz3+lC4/AnM9j84JJ+Hs6+PNXVD7bB4UHrOp0Lc/HHr/7DQRNlMpDaKMy0KUkiwvVRkOfidXPVzMPh3IMYbHkMsGNtevrOF/MI1zOdOfbYiGcT+oWCKOPrPJbFKryOgsh1fqTUmyW9HYhae/jZk/6Kkff5FstrraFFhmxu3p9ssaHwiVEx9/M02qiIzcwSsisP80ZpN3llPEbVToMxDNYugQj56qsuywNM+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:40:52.5577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c314a54-cb64-40d1-775b-08defd36b42b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330
X-purgate-ID: tlsNG-720697/1787064057-30FCE2AC-DD9EEE3E/0/0
X-purgate-type: clean
X-purgate-size: 6885



On 18-Aug-26 11:19, Mykola Kvach wrote:
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
>  xen/arch/arm/arm64/cpufeature.c          |  1 +
>  xen/arch/arm/arm64/vsysreg.c             | 18 +++++++++++++++-
>  xen/arch/arm/include/asm/arm64/sysregs.h |  1 -
>  xen/arch/arm/include/asm/cpregs.h        |  1 +
>  xen/arch/arm/include/asm/vreg.h          | 26 ++++++++++++++++++++++++
>  xen/arch/arm/vcpreg.c                    | 12 ++++++++++-
>  6 files changed, 56 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
> index 6fb8974ade..8bae8915e8 100644
> --- a/xen/arch/arm/arm64/cpufeature.c
> +++ b/xen/arch/arm/arm64/cpufeature.c
> @@ -72,6 +72,7 @@
>  #include <xen/bug.h>
>  #include <xen/types.h>
>  #include <xen/kernel.h>
> +#include <asm/cpregs.h>
>  #include <asm/sysregs.h>
>  #include <asm/cpufeature.h>
>  #include <asm/arm64/cpufeature.h>
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index d9e3619dfb..4fb50b6972 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -20,6 +20,7 @@
>  
>  #include <asm/arm64/cpufeature.h>
>  #include <asm/arm64/sve.h>
> +#include <asm/cpregs.h>
>  #include <asm/current.h>
>  #include <asm/regs.h>
>  #include <asm/traps.h>
> @@ -298,7 +299,18 @@ void do_sysreg(struct cpu_user_regs *regs,
>       * to identify the processor features
>       */
>      GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
> -    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
> +    case HSR_SYSREG_ID_PFR1_EL1:
> +    {
> +        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
> +
> +        if ( cpu_feature64_has_el0_32(&domain_cpuinfo) )
This check deserves a comment.
> +            guest_reg_value = id_reg_set_gic_field(guest_reg_value,
> +                                                   ID_PFR1_GIC_SHIFT,
> +                                                   v->domain);
> +
> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> +                                  guest_reg_value);
> +    }
>      GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
>      GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
>      GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
> @@ -337,6 +349,10 @@ void do_sysreg(struct cpu_user_regs *regs,
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
> index f3c11d871e..c0a6827b08 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -438,7 +438,6 @@
>  #define MVFR1_FPDNAN_SHIFT           4
>  #define MVFR1_FPFTZ_SHIFT            0
>  
> -#define ID_PFR1_GIC_SHIFT            28
>  #define ID_PFR1_VIRT_FRAC_SHIFT      24
>  #define ID_PFR1_SEC_FRAC_SHIFT       20
>  #define ID_PFR1_GENTIMER_SHIFT       16
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index a7503a190f..79203324fa 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -114,6 +114,7 @@
>  #define MPIDR           p15,0,c0,c0,5   /* Multiprocessor Affinity Register */
>  #define ID_PFR0         p15,0,c0,c1,0   /* Processor Feature Register 0 */
>  #define ID_PFR1         p15,0,c0,c1,1   /* Processor Feature Register 1 */
> +#define ID_PFR1_GIC_SHIFT 28
It does not look nice to split CP15 encoding list with this macro. Furthermore,
it looks a bit odd to move just GIC and not the other fields. Also, how about
moving the block to asm/sysregs.h? You would not need to include cpregs.h then.

>  #define ID_PFR2         p15,0,c0,c3,4   /* Processor Feature Register 2 */
>  #define ID_DFR0         p15,0,c0,c1,2   /* Debug Feature Register 0 */
>  #define ID_DFR1         p15,0,c0,c3,5   /* Debug Feature Register 1 */
> diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
> index 387ce76e7e..bb6c904f2e 100644
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
> +    return d->arch.vgic.version == GIC_V3;
Wouldn't this be a violation of MISRA C R10.3?

~Michal


