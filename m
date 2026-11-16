Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD75B606A32C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 06:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eXnmm6hg
Received: from list by lists.xenproject.org with outflank-mailman.1490192.1691133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSqTF-00086r-GA; Mon, 16 Nov 2026 06:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490192.1691133; Mon, 16 Nov 2026 06:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSqTF-00086j-CU; Mon, 16 Nov 2026 06:45:41 +0000
Received: by outflank-mailman (input) for mailman id 1490192;
 Mon, 16 Nov 2026 06:45:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xSqTD-00085X-Fq
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 06:45:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSqTB-00AdzJ-0R
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 07:45:37 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afaa682-8faa-0a2a0a5109dd-0a2a4506ca00-10
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 07:45:36 +0100
Received: from [52.101.56.9]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afaa68f-195a-0a2a45060019-3465380971d2-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 07:45:36 +0100
Received: from MN2PR18CA0026.namprd18.prod.outlook.com (2603:10b6:208:23c::31)
 by DSVPR12MB999126.namprd12.prod.outlook.com (2603:10b6:8:383::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:45:31 +0000
Received: from BN2PEPF0000A994.namprd04.prod.outlook.com
 (2603:10b6:208:23c:cafe::31) by MN2PR18CA0026.outlook.office365.com
 (2603:10b6:208:23c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Mon, 16
 Nov 2026 06:45:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A994.mail.protection.outlook.com (10.167.248.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 06:45:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 00:45:30 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 00:45:30 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 00:45:29 -0600
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
 b=HC0UT71E4Z9FHOCTFcNvMYWvbG+HpjL3bHgN4voLtn0J1ufuO1sc8lE6PrNPXT3e/+ASC65ASpkzyqtXyUKmiy/oNxQsrWTDhY/5aCrBkFb3giJgM3VUOkIiAFnnISt3AHVl+b3B0bncB6OLrYVhNxabZzdUldu1HjhBT0EBmoEJAM9bCSNw7WrYnsxJiNXftZcnpZD5xoK4E587cYL3CM/fluNlaXiI/dgGjyn08K9GmTJnUrm8Uw4Wue1hjtt2YS/C6/ucN6pp9qMrNH5JDnGHrFvGnjbFdzOOnIngMjm8Krsr5nTzHAnJge65NICXg+iLIusUJoUz+ZublfVgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8VrkPNfKFPLyoGADJ0PZVlOm7PirHQwDA3TOh1y0bo=;
 b=JOX0wXqmJBZqgIhHK+BxLcPFvlUbJILTz7kFkKJbLvuNxXwCKd4GcH9nNjF6GGUo9SgbTIV/Qna4v56ml2WbHxzLy5iBhAHS6IMvA1YxKb9vnjQJ9rlnEcRqoPNUs/KfQDx0MCicyS/s0TyxAvJzvB2fKlZlLsVqrBkecTEpCTlXqt6djTejoADDdKl4nk5a39jOVtaBrumJpsWZsBcjWxPfeq2MUpMNzTOSFQrI2+Z+kh8KZIknUW5o47ZVYliKxVvZ5a4NvuSPk6KP6iosQXpZ96J7MBUrtUSEH2TEx9HYos3Bwiqug1b3MrGUOPsC7tciwSwzzAlSGAHVf8wwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8VrkPNfKFPLyoGADJ0PZVlOm7PirHQwDA3TOh1y0bo=;
 b=eXnmm6hgjlPMZGX7B3H/g2L2zTsJBTG5KBYzSKIrlJeHNtV2uJzWVmQbaiSRbCdIdGug/YpmXjvdLGOWe12l91MCe3tf392BKCXPSftjrP4GoL2bIVpRtdxpkYG8cVKnNrpidJxaiUKfC8gRYt290Bxge7I2TOCv2xZRlzljAvk=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <3fa340e9-4560-47b2-ab5b-1d4f29afe39c@amd.com>
Date: Mon, 16 Nov 2026 07:45:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/arm: validate non-common page-table ranges
To: =?UTF-8?Q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>
References: <20261110145231.7409-1-gabi.qs.mail@gmail.com>
 <f1257512-67cf-481d-a411-2511a3165c5b@amd.com>
 <DMUK45N2J9NG.2YCKA2J80ODD5@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <DMUK45N2J9NG.2YCKA2J80ODD5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A994:EE_|DSVPR12MB999126:EE_
X-MS-Office365-Filtering-Correlation-Id: a646b6f3-0e39-4401-5dc0-08df43ad3541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|4143699003|11063799006|5023799004|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Gsk0CGZ7vktCpYaZYxhmrlb4+tGCUmv8dOObDm5jBUlHJOuP4H3pUOwQvA/tFJEeaLYeBJtIn6YA1SCtkMZYH3g95VVW4zbVbmzJPtcBtUkQWQMJsZ7VZeH0HTXsIh5VPFkzYldnlQa8FWzqdFRDMuxJtUtdqFEOwaNrjRQe0KTknd+vBfd605e/ArGRM2keCzBmAIn4YYNYTlR+clPVuSURRgMrVHnf2nA82m6YtX3RA2Q0T4eoiXzi+46Ody5IoUpN1xCNExXFlO9rDkd0rY/uD9KzIyZ+ylLp0WCM8jWoGjq0148pdElhUzFaIkXCTAXub3LGoO6ThSdyqHKA+42h9vdG7KZ6P4TBwlFU1Zse10ZaeGq8OERJEXztSHM6pj7xiWAXv36b6zoKm7bNxl4ryLItLxThy+d4bwLxZ5fKPuGBO2Mxzpk46maQ1VMvQoyiovxp9Ogp9cLfnyxqxvoW5tiO7eeborPsmFE7rg6nogS4FBFyivZUv+GY01gdX197acM5rtMYoSKNdSZz80D584OHNpHOH/h4uY87NGvHEbZ7W6mPN/KqngSh+1jl0i6NS97HeQIWv93jeKYE64utDgHLLIhIE0tN6mCl2fK+YyFdl8Wh6ilXzoRMLt17gizfTSH4FTVK5w6gqE95DEElHN8ViQN12TNE9JraPooXIZAYTBGtWzL2MARYGYQxU0jt/DfgphISwBLSNWrVDw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U8MPe9FBcIBxCaJplKEoX8c6f5HxO7b4qHRKP55RQhtZ3QuboyL01tB2ggmmKpX7EfmXWSNajRf3NRP5X7yEEqh0v8j8CHGo8Ykb0V5yaVrVaMKh0EFGrvIWoDrGjU0CwQtUc8cCHp8YJ45cnxMNk+JY6T9HnBCaM2EDhT08c57uO+3eqElPvVHK3cIQ8PMQy7CeFakbw8HkRA4PszM0P0YOmSNCRON5YvPNIdXeVFGbFDWmrTgMLVY67a4R5V8AMApzzhzBQNKZr83tQoXuy5vo8ZVP7kPWEFgqcs6BK7/X1ajuKGsX1vtWP+JjmsNrZO5HzM0xAk//j4UzaXv0o44u4Oe070gvJkDFGZKVY84g2zn9Due5THj5z+JP9BwB4gwtTzO06FSnG3lAfk/kKGRKLxajGNZSUFppdAeILNEwc9uTOXITTMrkjAF+BfB8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:45:31.1350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a646b6f3-0e39-4401-5dc0-08df43ad3541
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A994.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999126
X-purgate-ID: tlsNG-16d1c6/1794811536-F687577B-2C355A89/0/0
X-purgate-type: clean
X-purgate-size: 5920
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 14-Nov-26 02:53, Gabriel Quintáns Souto wrote:
>> There's no need to check for TEMPORARY area. It's only ever used in boot
>> pgtables, not in runtime tables. Therefore what we need is just the following:
>> virt < DOMHEAP_VIRT_START && size <= DOMHEAP_VIRT_START - virt
>> without any helper.
>>
>> BTW. This patch breaks Arm32 MPU build. If at all, the helper should be placed
>> under mmu/.
> 
> Ok, thanks for the review. I was not really sure whether TEMPORARY_AREA was
> needed or not, so thanks for making that clear. One thing, though:
> `virt < DOMHEAP_VIRT_START && size <= DOMHEAP_VIRT_START - virt`
> 
> To do that validation in pt.c, I would need to use `#ifdef CONFIG_ARM_32`
> instead of `IS_ENABLED()` (which would let DCE drop it on arm64), otherwise it
> doesn't build on arm64. That's why I made the xen_pt_range_is_common helper. How
> should I approach this then? I'll drop `ranges_overlap()` either way, but
> should I keep `xen_pt_range_is_common()` and move it under `mmu/`, or just drop
> all the helpers and use `#ifdef CONFIG_ARM_32` directly in `pt.c`? I assume a
> single `#ifdef` in `pt.c` is fine, so I'd go with the second option, as you
> suggested. Let me know what you think.
I'm ok with the #ifdef in xen_pt_update() together with a comment explaining why
this is needed for Arm32 and not Arm64.

~Michal

> 
>>> +#include <asm/mmu/layout.h>
>> Is this needed?
> 
> I think I added it while trying to get the helper to build, but I think
> it's already pulled in through asm/config.h, so I'll likely drop it in v5.
> 
> Best regards,
> Gabriel
> 
> On Thu Nov 12, 2026 at 3:26 PM CET, Michal Orzel wrote:
>>
>>
>> On 10-Nov-26 15:52, Gabriel Quintáns Souto wrote:
>>> On arm32, page-tables are different on each CPUs, although they share some
>>> common mappings.
>> Please say that the non-common area is the per-CPU domheap mapping.
>>
>>>
>>> The xen_pt_update function assumed that only said mappings would be
>>> modified, but did not check this assumption.
>>>
>>> Add a range check to reject modifications to non-common mappings.
>>>
>>> Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
>>> ---
>>> v4:
>>>  - Rebased onto staging (v3 was diffed against v2).
>>>
>>> v3:
>>>  - Dropped accidentally tracked patch file from commit.
>>>
>>> v2:
>>> - Inverted polarity of xen_pt_range_is_non_common() as suggested.
>>> - Moved xen_pt_range_is_common() implementation to arch-specific headers
>>> (arm32 vs arm64) instead of keeping #ifdef CONFIG_ARM_32 in pt.c (tried
>>> IS_ENABLED() for DCE, but ARM64 lacks definitions for
>>> DOMHEAP_VIRT_START/TEMPORARY_AREA_ADDR, breaking the build).
>>> - Added ASSERT_UNREACHABLE() on failure path in xen_pt_update().
>>> ---
>>>  xen/arch/arm/include/asm/arm32/mm.h | 24 ++++++++++++++++++++++++
>>>  xen/arch/arm/include/asm/arm64/mm.h | 10 ++++++++++
>>>  xen/arch/arm/mmu/pt.c               | 14 +++++++-------
>>>  3 files changed, 41 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
>>> index 856f2db..c7d09d3 100644
>>> --- a/xen/arch/arm/include/asm/arm32/mm.h
>>> +++ b/xen/arch/arm/include/asm/arm32/mm.h
>>> @@ -16,6 +16,30 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>>>      return false;
>>>  }
>>>  
>>> +static inline bool ranges_overlap(unsigned long start1, unsigned long size1,
>>> +                           unsigned long start2, unsigned long size2)
>>> +{
>>> +    if ( start1 < start2 )
>>> +        return start2 - start1 < size1;
>>> +
>>> +    return start1 - start2 < size2;
>>> +}
>>> +
>>> +/*
>>> + * On ARM32, page-tables differ between CPUs, so not all mappings are common.
>>> + */
>>> +static inline bool xen_pt_range_is_common(unsigned long virt,
>>> +                                       unsigned long size)
>>> +{
>>> +    unsigned long temporary_start = TEMPORARY_AREA_ADDR(0);
>> There's no need to check for TEMPORARY area. It's only ever used in boot
>> pgtables, not in runtime tables. Therefore what we need is just the following:
>> virt < DOMHEAP_VIRT_START && size <= DOMHEAP_VIRT_START - virt
>> without any helper.
>>
>> BTW. This patch breaks Arm32 MPU build. If at all, the helper should be placed
>> under mmu/.
>>
>>
>>> +    unsigned long temporary_size = XEN_PT_LEVEL_SIZE(1);
>>> +
>>> +    return !ranges_overlap(virt, size,
>>> +                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) &&
>>> +           !ranges_overlap(virt, size,
>>> +                          temporary_start, temporary_size);
>>> +}
>>> +
>>>  bool init_domheap_mappings(unsigned int cpu);
>>>  
>>>  static inline void arch_setup_page_tables(void)
>>> diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
>>> index b4f7545..a3cb56d 100644
>>> --- a/xen/arch/arm/include/asm/arm64/mm.h
>>> +++ b/xen/arch/arm/include/asm/arm64/mm.h
>>> @@ -12,6 +12,16 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>>>      return true;
>>>  }
>>>  
>>> +/*
>>> + * On ARM64, the Xen page-tables are shared by all the CPUs,
>>> + * any range is therefore common.
>>> + */
>>> +static inline bool xen_pt_range_is_common(unsigned long virt,
>>> +                                          unsigned long size)
>>> +{
>>> +    return true;
>>> +}
>>> +
>>>  void arch_setup_page_tables(void);
>>>  
>>>  void update_boot_mapping(bool enable);
>>> diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
>>> index 81fe121..42fa79a 100644
>>> --- a/xen/arch/arm/mmu/pt.c
>>> +++ b/xen/arch/arm/mmu/pt.c
>>> @@ -13,6 +13,7 @@
>>>  
>>>  #include <asm/current.h>
>>>  #include <asm/fixmap.h>
>>> +#include <asm/mmu/layout.h>
>> Is this needed?
>>
>> ~Michal
> 


