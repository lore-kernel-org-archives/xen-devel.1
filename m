Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5317DC9830D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 10:44:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433700.1654114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA3Pm-0007cn-4g; Fri, 25 Sep 2026 10:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433700.1654114; Fri, 25 Sep 2026 10:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA3Pm-0007cg-22; Fri, 25 Sep 2026 10:44:26 +0000
Received: by outflank-mailman (input) for mailman id 1433700;
 Fri, 25 Sep 2026 10:44:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xA3Pl-0007ca-6a
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 10:44:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA3Pk-009P5o-JT
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 12:44:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab65084-bab6-0a2a0a5309dd-0a2a4504dc1a-20
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 12:44:24 +0200
Received: from [40.107.201.45]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab65086-b57f-0a2a45040019-286bc92dba69-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 12:44:23 +0200
Received: from BN0PR08CA0009.namprd08.prod.outlook.com (2603:10b6:408:142::13)
 by CY8PR12MB7516.namprd12.prod.outlook.com (2603:10b6:930:94::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 10:44:19 +0000
Received: from BN3PEPF00022BD8.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::4e) by BN0PR08CA0009.outlook.office365.com
 (2603:10b6:408:142::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 10:44:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BD8.mail.protection.outlook.com (10.167.248.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 10:44:18 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 05:44:18 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 25 Sep 2026 05:44:16 -0500
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
 b=ZDka137dJ31Nhwz/p+rbHlkV0xXTQZ0y+dv2A6pjyzXyCPEgc5le+9wLEM1/TNCPnD88LyZf4GXkSkJF+ZWwVDnq1uU8ko2P1QN0gfy4me7hsfAwxBZwRQAO9qa146Zg1tsl64l234i9dytRtP0kySUY2Ddt5jWqvC1SqJeFkvcsTq9rn9g+lrPG4vlCIi5anxc+iDozKp/qLq5i6iRzLFcEQ+BgD/FYtC+TNitz6Nqdpnws21H1Jh0OGIBEuMVvrzo2KsW7dI3P63M1LmXbiuxjXxDfafCi9F3ehoFTX5xZgnJM0N0cF3RGE1TyoiRz0DdfXADg2NcVpBvanAQSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FCVyw/sOgRirrmYGUQZZv/XQGrYeP2WbciVAyRYmcM=;
 b=fuLFFmWNXHATpgs3B4iGJxWw1GKJY8LIx0dWWA8AtoDIgOXvrhl8QtCGRa+aSot4P8r/iwUfuTlAYIuyDTNBohOpYZniJoh/S4fWYr3f5AFdbQkEdknVlhf/jV0YppHlqu47Yb9m7AZSkEQ97e5SlNeYFIZ5eFQYqv8ABMCY/4Ll1jIA3G3i/D1ANXymQzaaJ5ptcI0MR2hCtZEFtgH/aBN08udydDHSED+fy+J+rhrca+y5R+DyKqfeh4PP/UihFEQybt0dptl6k6/RNvjNeIc/cfeAhj7yftsy7JO+n9BHX/DzlxUIvUZaFqAgC0REB1JGKOWvCX9EcmAy1Wkt6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FCVyw/sOgRirrmYGUQZZv/XQGrYeP2WbciVAyRYmcM=;
 b=SgHEBEws2pcRbQi1DYl+uMJAdxx39GoHds6cD0Fld4KJgpAimivH6aMjZfepPZn9Stnwq6o70TxmidKJJVqiYZdvB1zvcwnlXY1ggqj4zxPlLBjF30M9UrjzBG1NTVdk1wcYCQNdjKaNliKHKY7wC7XQpnb1r1Fe842bR9+fgyM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <27701081-7062-40bd-bfdd-aaeb3f1ea6e4@amd.com>
Date: Fri, 25 Sep 2026 12:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/arm: derive GIC CPU interface ID fields from the
 vGIC
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Mykola Kvach
	<Mykola_Kvach@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>
References: <4f24dd8cd9fc76e8c3f93bca44bb58056cbcc51a.1790147101.git.mykola_kvach@epam.com>
 <87o6dm1d6x.fsf@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <87o6dm1d6x.fsf@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD8:EE_|CY8PR12MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c2cd55-8f67-45cf-448a-08df1af1f3a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|10067099003|5023799004|56012099006|4143699003|11063799006|6133799003|260925021311599002|18002099003|22082099003|260925022911599002|260925021911599002;
X-Microsoft-Antispam-Message-Info:
	ihpxjnZ00WhE+zhaK8bua70LvVDu89gTyQhfxCnWxnetVkfVtb+FgWa9BsJwYJ2cVa9ArqEuuHQxN3jbs+dhCFFkNZA0b+03zsx89ioeS0ex/aqRQN1NyusoEfyklbCpHettjvvx07K/U6OtRVoFoOhyTrpNU1ZggVHWbq+Dl6kV+tcYBLejHUrQIr5s0murJwSdXebgdpIkfNGE1nCdI9MwWlvgOKsta3sWiwWBSjElxik5EJKuV9Nb40G9m3kv5ck9U7DEzZrhDmZe5NpmY3wJ4+5P8qSqnw8w5pe9aAqrQ2z7IjpH7t0S7fmUR3HvejdUdonSr/daf3HMYbACG2UKCUUcWOg9ie9QDrh7Z+bgK3epIBlHQ0C0KNJDg32CCnBuVEpaLuBec4RdT4jaufrXngLg+7LRvve9bYukY4bPwEQndT8yuId77MUX5lEOG2BYWVXqPU8QwKDHjFnCuHmPTBthEVMuHep0WDqAjqKc6RdsOSV+BREI/hFu2CU+zHu9seTlAi1FBSQghoKGSzlQmiNTisvkID7L5R9qx1/GifaCP7QVi6UpU0hv0CK/akB1ZhyBsMmQkyrYz20N9bHIr4QMgjg/9Z1H0fC0OLq0Myw63tG1EuopQwlSA1nie5yCz5H6GckgcAF7Q8NAug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(5023799004)(56012099006)(4143699003)(11063799006)(6133799003)(260925021311599002)(18002099003)(22082099003)(260925022911599002)(260925021911599002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s3wfqYC7WX99aKFMFpsIvCqj4FR52XxCQ35+pboIBCIb6wzRZVhw1FwnJ+a9Q5EnFI2bIyyPtEcP5mn4n4vUBjbH+3t2ng1DjtWQcg7QuSQeKfwE32Kn3drjaZuCVLDb/pC7j2hdBeWt9qP4fbdIGorIrYbVJCq8XGDYRxCHe0ayTLQtKnAxP24CRVjrz0dhrurOKF/KGhZJV72khaX4HSCmkTClRsoDpywRWio8h6h8XsRl7YdMhNbxnA6NvyqUL/EgUuHUWk55zeDGlgDoy81ydzKuNsmIxrUnb74HeqM/LgxktIRHASJ8KLy7Hs+Do3uGM9HO9A9BFxyQSmPY5yT9hds0/b1YUpsnfOeNZxj7qXQwunRWbpT8dN85DLpZDyseqowO+2TmvYrotsIYn9FsZPnwh9lALK0Wj4sVjvrZw/hJP36Brloj+98E7Ylx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:44:18.6479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c2cd55-8f67-45cf-448a-08df1af1f3a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7516
X-purgate-ID: tlsNG-ebf023/1790333064-C34C3B50-7FF49486/0/0
X-purgate-type: clean
X-purgate-size: 8018



On 25-Sep-26 00:45, Volodymyr Babchuk wrote:
> Hi Mykola,
> 
> Mykola Kvach <mykola_kvach@epam.com> writes:
> 
>> Xen exposes ID_AA64PFR0_EL1.GIC and ID_PFR1.GIC from domain_cpuinfo,
>> which is initialized from the sanitized host CPU feature state. This
>> does not necessarily match the virtual interrupt controller configured
>> for a domain.
>>
>> A vGICv2 domain can therefore observe a nonzero GIC field when the host
>> supports the GIC system register interface, even though Xen disables that
>> interface for the domain. On a GICv4.1-capable host, a vGICv3 domain can
>> observe encoding 0b0011, although Xen exposes only its vGICv3 model.
>>
>> Derive the fields from the domain's vGIC version instead. Expose 0b0000
>> for vGICv2 and 0b0001 for vGICv3. This covers ID_AA64PFR0_EL1 and the
>> ID_PFR1_EL1 alias in AArch64 state, as well as ID_PFR1 accessed through
>> CP15 in AArch32 state. Leave the alias unchanged when AArch32 is
>> unavailable.
>>
>> Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
>> Fixes: 8f81064a07c6 ("xen/arm: Add handler for cp15 ID registers")
>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Changes in v5:
>> - Fold the vGIC version mapping into the shared ID register helper.
>> - Use the vreg_ and VREG_ prefixes for the helper and field width.
>> - Cosmetic changes after review
>>
>> Changes in v4:
>> - Explain why ID_PFR1_EL1 is left unchanged without AArch32 EL0 support.
>> - Move all ID_PFR1_*_SHIFT definitions to the common asm/sysregs.h and
>>   remove the unused cpregs.h includes from the ARM64 files.
>> - Return explicit unsigned GIC field values to avoid MISRA C Rule 10.3.
>>
>> Changes in v3:
>> - Add direct dependencies for the shared ID register helpers.
>> - Move ID_PFR1_GIC_SHIFT to the common CP15 register header.
>> - Apply cosmetic fixes from review.
>>
>> Changes in v2:
>> - Share the GIC ID field helpers between the AArch64 and AArch32 paths.
>> - Parenthesize the individual ASSERT conditions.
>> - Preserve ID_PFR1_EL1.GIC when AArch32 is unavailable.
>> - Target master instead of the 4.22 release.
>>
>> v1: https://patchew.org/Xen/ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola._5Fkvach@epam.com/
>> ---
>>  xen/arch/arm/arm64/vsysreg.c             | 21 ++++++++++++++++++++-
>>  xen/arch/arm/include/asm/arm64/sysregs.h |  9 ---------
>>  xen/arch/arm/include/asm/sysregs.h       |  9 +++++++++
>>  xen/arch/arm/include/asm/vreg.h          | 20 ++++++++++++++++++++
>>  xen/arch/arm/vcpreg.c                    | 12 +++++++++++-
>>  5 files changed, 60 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>> index 66f4f23bb3..d8f380ccb7 100644
>> --- a/xen/arch/arm/arm64/vsysreg.c
>> +++ b/xen/arch/arm/arm64/vsysreg.c
>> @@ -299,7 +299,22 @@ void do_sysreg(struct cpu_user_regs *regs,
>>       * to identify the processor features
>>       */
>>      GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
>> -    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
>> +    case HSR_SYSREG_ID_PFR1_EL1:
>> +    {
>> +        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
>> +
>> +        /*
>> +         * Preserve the sanitized ID_PFR1_EL1 value when AArch32 EL0
>> +         * is not supported, as for the other AArch32 ID registers.
>> +         */
>> +        if ( cpu_feature64_has_el0_32(&domain_cpuinfo) )
>> +            guest_reg_value = vreg_id_reg_set_gic_field(guest_reg_value,
>> +                                                        ID_PFR1_GIC_SHIFT,
>> +                                                        v->domain);
>> +
>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
>> +                                  guest_reg_value);
>> +    }
>>      GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
>>  
>>      case HSR_SYSREG_ID_DFR0_EL1:
>> @@ -362,6 +377,10 @@ void do_sysreg(struct cpu_user_regs *regs,
>>              guest_reg_value |= (sysval << ID_AA64PFR0_SVE_SHIFT) & mask;
>>          }
>>  
>> +        guest_reg_value = vreg_id_reg_set_gic_field(guest_reg_value,
>> +                                                    ID_AA64PFR0_GIC_SHIFT,
>> +                                                    v->domain);
>> +
>>          return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
>>                                    guest_reg_value);
>>      }
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
>> index f3c11d871e..f6ece8f972 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -438,15 +438,6 @@
>>  #define MVFR1_FPDNAN_SHIFT           4
>>  #define MVFR1_FPFTZ_SHIFT            0
>>  
>> -#define ID_PFR1_GIC_SHIFT            28
>> -#define ID_PFR1_VIRT_FRAC_SHIFT      24
>> -#define ID_PFR1_SEC_FRAC_SHIFT       20
>> -#define ID_PFR1_GENTIMER_SHIFT       16
>> -#define ID_PFR1_VIRTUALIZATION_SHIFT 12
>> -#define ID_PFR1_MPROGMOD_SHIFT       8
>> -#define ID_PFR1_SECURITY_SHIFT       4
>> -#define ID_PFR1_PROGMOD_SHIFT        0
>> -
>>  #define MVFR2_FPMISC_SHIFT           4
>>  #define MVFR2_SIMDMISC_SHIFT         0
>>  
>> diff --git a/xen/arch/arm/include/asm/sysregs.h b/xen/arch/arm/include/asm/sysregs.h
>> index f6af987ef5..8dcf82a694 100644
>> --- a/xen/arch/arm/include/asm/sysregs.h
>> +++ b/xen/arch/arm/include/asm/sysregs.h
>> @@ -9,6 +9,15 @@
>>  # error "unknown ARM variant"
>>  #endif
>>  
>> +#define ID_PFR1_GIC_SHIFT            28
>> +#define ID_PFR1_VIRT_FRAC_SHIFT      24
>> +#define ID_PFR1_SEC_FRAC_SHIFT       20
>> +#define ID_PFR1_GENTIMER_SHIFT       16
>> +#define ID_PFR1_VIRTUALIZATION_SHIFT 12
>> +#define ID_PFR1_MPROGMOD_SHIFT       8
>> +#define ID_PFR1_SECURITY_SHIFT       4
>> +#define ID_PFR1_PROGMOD_SHIFT        0
>> +
>>  #ifndef __ASSEMBLER__
>>  
>>  #include <asm/alternative.h>
>> diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
>> index 387ce76e7e..a85fefcc3e 100644
>> --- a/xen/arch/arm/include/asm/vreg.h
>> +++ b/xen/arch/arm/include/asm/vreg.h
>> @@ -4,11 +4,31 @@
>>  #ifndef __ASM_ARM_VREG__
>>  #define __ASM_ARM_VREG__
>>  
>> +#include <xen/bitops.h>
>> +#include <xen/bug.h>
>> +#include <xen/sched.h>
>> +
>> +#include <asm/gic.h>
>> +
>>  typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
>>                                     bool read);
>>  typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
>>                                     bool read);
>>  
>> +#define VREG_ID_REG_GIC_WIDTH 4
> 
> Should this go into sysregs.h?
> 
> Something like ID_AArchx_PFR_GIC_SHIFT? I am open to alternatives in naming.
I don't think that's necessary, given that we don't have any _WIDTH macros in
there and other places hard code widths (e.g. SVE). Especially that we are now
at v5 and we should avoid subjective NITs.

> 
>> +
>> +static inline register_t vreg_id_reg_set_gic_field(register_t val,
>> +                                                   unsigned int shift,
>> +                                                   const struct domain *d)
>> +{
>> +    register_t mask = GENMASK(shift + VREG_ID_REG_GIC_WIDTH - 1, shift);
>> +    enum gic_version vgic_ver = d->arch.vgic.version;
>> +
>> +    ASSERT((vgic_ver == GIC_V2) || (vgic_ver == GIC_V3));
>> +
>> +    return (val & ~mask) | ((vgic_ver == GIC_V3 ? 1U : 0U) << shift);
> 
> Probably better to use constants?
> 
> Something like ID_AArchx_PFR_GIC_V3 and ID_AArchx_PFR_GIC_NO_CPU_INTF.
This suggestion is valid. Please add in common sysregs.h:
/* GIC field encodings, common to ID_PFR1{,_EL1} and ID_AA64PFR0_EL1 */
#define ID_PFR_GIC_NI    0x0
#define ID_PFR_GIC_V3    0x1

You can retain my Rb.

~Michal


