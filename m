Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB41606A8BE
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EM5R8fUY
Received: from list by lists.xenproject.org with outflank-mailman.1485942.1688963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVlS-0001Mu-LV; Thu, 12 Nov 2026 14:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485942.1688963; Thu, 12 Nov 2026 14:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVlS-0001Mn-IJ; Thu, 12 Nov 2026 14:26:58 +0000
Received: by outflank-mailman (input) for mailman id 1485942;
 Thu, 12 Nov 2026 14:26:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xRVlQ-0001Mg-B8
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:26:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRVlP-007T8t-O1
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 15:26:55 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af5ccab-8faa-0a2a0a5109dd-0a2a4508d36e-8
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:26:55 +0100
Received: from [52.101.201.19]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af5cca8-f659-0a2a45080019-3465c913e93a-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:26:50 +0100
Received: from CH2PR10CA0002.namprd10.prod.outlook.com (2603:10b6:610:4c::12)
 by FT1PR12MB266007.namprd12.prod.outlook.com (2603:10b6:170:26::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 14:26:44 +0000
Received: from CH01EPF000BE948.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::78) by CH2PR10CA0002.outlook.office365.com
 (2603:10b6:610:4c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Thu,
 12 Nov 2026 14:26:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE948.mail.protection.outlook.com (10.167.244.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 14:26:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 08:26:43 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 12 Nov
 2026 08:26:43 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 12 Nov 2026 08:26:42 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ax+EL02xgXhYTX4UQDDJeOMdHOfwRk9ok0S+oFO0tZk+LOTNIR1zh9Y7BnZmDmazobo1SLMJ37HTu1jAxrD5uK6RaKSGRQ1Nh6t/gGMJGXnK7mrr/rGGsYoaTvnUycPQnBTYIBSVHM/9emqRaarK4LiEOBUi4jlCTKIR1ae0xZq4DeemQ3I+J5mWh8T3lXKsZB+dgZMohTqhzQAyk9cm44MBwodzHgEKiEfsXBTBfmsfZt2WmjQOIj5aurMwo0l3xL9U+KsyrU1cVRr0BeH2awJKoHZpzc4Y4BjEVeIS5pYTbfWcZmun0L5RmRSBykLnjttuYLj+6QXB8yww9uirLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3Ur7SyTxbHj/FuD+0bFpx2ILyvf+Iy9HXvkHNYCe5o=;
 b=s0jI40jVsQpP1Uh+u3SER/R+3c05g6YZNRr4vKgGzDapPaAaGf3x9wNzAuaW/t3AcmwWP+UrVrAGo+MSohIf9kaVimUMArsnKEmtQG7UCtpt/qYzhTq4BHns2zjTHiDG2O/PrGw2RUxw1Rk5P4PKldTjoOscG1PHVuTDUt7A1o6W8dYRREXO7gVWUOdUXL15D3ixQ8DNXESyAd4kQosnlWO2RFeuob1xUW76msl50HIZIg9DHAyFH632ByjELCoUIxu7c/A39oICpISS08EwXO14XvOxLfTvCXxr3Hyw7mrrUbxxV3uEeohijRQpwNLzNo22puasJKIommxARzYqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Ur7SyTxbHj/FuD+0bFpx2ILyvf+Iy9HXvkHNYCe5o=;
 b=EM5R8fUYBj5wBiTWuZn3ke7qWPdkUrZTGxMbIvWJ+lMyaNBZnli1Xa55CMeLNnuflgsydHqpGbsYKORxqg67TfSOjDDgsHK0Y+C9oFBOmhH0e4tGmsOuFTPoCc09OiswR/UHKqTeQmuX7TmElq3XzYWUT6ERp43xlGPlr8FaE0s=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <f1257512-67cf-481d-a411-2511a3165c5b@amd.com>
Date: Thu, 12 Nov 2026 15:26:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/arm: validate non-common page-table ranges
To: =?UTF-8?Q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>
References: <20261110145231.7409-1-gabi.qs.mail@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261110145231.7409-1-gabi.qs.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE948:EE_|FT1PR12MB266007:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d5f513-78a2-4c23-b2ab-08df40c8fa3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|10067099003|5023799004|11063799006|56012099006|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	df2i7LI8N3kTdKKpl8syvywWedcjrc9hBLXH062/jwxOw4qkqmmup/8byDe0KTiOK0ZAAIDSWlO8zQaKlN0GJWt1dZ03XwcB8TJzzQAMY0ZeMFJTIY1qDDi3sa/PTIJFh4bRl1x6S/ZzulVOBxK/crTYueL6yaoAP7AmO0QRJomhuH0P3H0/Xti2TA8NGs+GPi3VMUQs3LmMc6M8dcq7Wn2LXBNhi+QDGcUM52Ui/ZU1CoZtO0YgUF6hYt7AGb111Wo3vEoSAyhU2qeEJEYZ+c98k4m74gz0RczM+J2TKiPQqA3XkFxCzQpxSwb+Y9PTc798LpwzxsgCUTynspMtuTKV7WaHTosVc99Fpe3FahbDzp3wosWHoo30EOROnY6n/V7FaQwMEo7lVRj8vkHAreX9QEXtCrHlEv37VW/6cYkGGaXwwGiTMc1zPPQKHUhVo5Vd2jz2AAkvdb4Rov5JfFoCrq4yOdnFCxUBxXs59VoPEQQGr5Bf89B13kSqW+JKx5UYmBtZIDlTMqYX05XmbixYRf2J/k5qkMUSMn+ExmAm7pSZjrIwvubC5YZbbk64x5qI2oos7pvnus2XWW2F6MmnDE5wXwljmhfVfvbpBLLjJdCzbqWqGZ8nhnShjxlbJCRu8x64Q/ItogIfgB85s5CXRwvpVceWaTnimJhv+mgc2lu+JHHqE222I8+h+l5oSiQSCkIzRj/kVHxziQOZNw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(10067099003)(5023799004)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tAWGn61GFeRz2/7bhkCdVeOBUJkiSKBHXpl5y0s15deAIhElFS2C7nb1/nRt26UQVIpVQ53Bqdvtit/yk77KraEQoeVuaupZY9LLo62zxG8+quH2JiwBQy5c3aWZlztA7x5vdSisf35M1ICv1gxvMLou+y3nsW1+Vf2ZDqRyB/PbsQISBu6MnYvprFYb7fHiDpMSzXdqE6o/9+/n0Lkzbk3RV4+PvlvtnEICNiW+NFJBZZgne4XrGoy2OiZqeN39GBJXDvPDQMO108CedCZhyqSddluAD8PirkQOwbOZ0HUETcPQ7H4PTyo5+Om7fRtM/6axy5Ydfq4Hk9f2qduvZvVM/KCNBKSi9tQT1Xe3FOwPxeRuaava5pOZX2kStH35/e3hXnImsJN2707ReZGZAa4jCHPyDffRmSg5IcfuA6sIReh8gRROSbs+rZxktRxp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 14:26:44.5437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d5f513-78a2-4c23-b2ab-08df40c8fa3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE948.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB266007
X-purgate-ID: tlsNG-c1860d/1794493615-CC97287B-6B701720/0/0
X-purgate-type: clean
X-purgate-size: 4004
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10-Nov-26 15:52, Gabriel Quintáns Souto wrote:
> On arm32, page-tables are different on each CPUs, although they share some
> common mappings.
Please say that the non-common area is the per-CPU domheap mapping.

> 
> The xen_pt_update function assumed that only said mappings would be
> modified, but did not check this assumption.
> 
> Add a range check to reject modifications to non-common mappings.
> 
> Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
> ---
> v4:
>  - Rebased onto staging (v3 was diffed against v2).
> 
> v3:
>  - Dropped accidentally tracked patch file from commit.
> 
> v2:
> - Inverted polarity of xen_pt_range_is_non_common() as suggested.
> - Moved xen_pt_range_is_common() implementation to arch-specific headers
> (arm32 vs arm64) instead of keeping #ifdef CONFIG_ARM_32 in pt.c (tried
> IS_ENABLED() for DCE, but ARM64 lacks definitions for
> DOMHEAP_VIRT_START/TEMPORARY_AREA_ADDR, breaking the build).
> - Added ASSERT_UNREACHABLE() on failure path in xen_pt_update().
> ---
>  xen/arch/arm/include/asm/arm32/mm.h | 24 ++++++++++++++++++++++++
>  xen/arch/arm/include/asm/arm64/mm.h | 10 ++++++++++
>  xen/arch/arm/mmu/pt.c               | 14 +++++++-------
>  3 files changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
> index 856f2db..c7d09d3 100644
> --- a/xen/arch/arm/include/asm/arm32/mm.h
> +++ b/xen/arch/arm/include/asm/arm32/mm.h
> @@ -16,6 +16,30 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>      return false;
>  }
>  
> +static inline bool ranges_overlap(unsigned long start1, unsigned long size1,
> +                           unsigned long start2, unsigned long size2)
> +{
> +    if ( start1 < start2 )
> +        return start2 - start1 < size1;
> +
> +    return start1 - start2 < size2;
> +}
> +
> +/*
> + * On ARM32, page-tables differ between CPUs, so not all mappings are common.
> + */
> +static inline bool xen_pt_range_is_common(unsigned long virt,
> +                                       unsigned long size)
> +{
> +    unsigned long temporary_start = TEMPORARY_AREA_ADDR(0);
There's no need to check for TEMPORARY area. It's only ever used in boot
pgtables, not in runtime tables. Therefore what we need is just the following:
virt < DOMHEAP_VIRT_START && size <= DOMHEAP_VIRT_START - virt
without any helper.

BTW. This patch breaks Arm32 MPU build. If at all, the helper should be placed
under mmu/.


> +    unsigned long temporary_size = XEN_PT_LEVEL_SIZE(1);
> +
> +    return !ranges_overlap(virt, size,
> +                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) &&
> +           !ranges_overlap(virt, size,
> +                          temporary_start, temporary_size);
> +}
> +
>  bool init_domheap_mappings(unsigned int cpu);
>  
>  static inline void arch_setup_page_tables(void)
> diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
> index b4f7545..a3cb56d 100644
> --- a/xen/arch/arm/include/asm/arm64/mm.h
> +++ b/xen/arch/arm/include/asm/arm64/mm.h
> @@ -12,6 +12,16 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>      return true;
>  }
>  
> +/*
> + * On ARM64, the Xen page-tables are shared by all the CPUs,
> + * any range is therefore common.
> + */
> +static inline bool xen_pt_range_is_common(unsigned long virt,
> +                                          unsigned long size)
> +{
> +    return true;
> +}
> +
>  void arch_setup_page_tables(void);
>  
>  void update_boot_mapping(bool enable);
> diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
> index 81fe121..42fa79a 100644
> --- a/xen/arch/arm/mmu/pt.c
> +++ b/xen/arch/arm/mmu/pt.c
> @@ -13,6 +13,7 @@
>  
>  #include <asm/current.h>
>  #include <asm/fixmap.h>
> +#include <asm/mmu/layout.h>
Is this needed?

~Michal


