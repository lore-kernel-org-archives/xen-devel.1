Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8107606A330
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 08:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lmB5p747
Received: from list by lists.xenproject.org with outflank-mailman.1480965.1684743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhhL-00048Z-D9; Tue, 10 Nov 2026 08:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480965.1684743; Tue, 10 Nov 2026 08:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhhL-00048S-AI; Tue, 10 Nov 2026 08:59:23 +0000
Received: by outflank-mailman (input) for mailman id 1480965;
 Tue, 10 Nov 2026 08:59:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xQhhJ-00048F-4c
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:59:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQhhI-005JDE-7I
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:59:20 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af2dce4-2eae-0a2a0a5409dd-0a2a450c9622-18
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:59:19 +0100
Received: from [52.101.56.48]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af2dce6-f479-0a2a450c0019-346538308610-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:59:19 +0100
Received: from CH0P223CA0020.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::10)
 by MW4PR12MB7143.namprd12.prod.outlook.com (2603:10b6:303:222::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 08:59:14 +0000
Received: from CH01EPF000BE948.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::85) by CH0P223CA0020.outlook.office365.com
 (2603:10b6:610:116::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 08:59:14 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE948.mail.protection.outlook.com (10.167.244.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 08:59:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 02:59:14 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 02:59:13 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 10 Nov 2026 02:59:12 -0600
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
 b=b+00zddCYNS0nEYupbPip4v38HsfQ1+nXDE09HFe7l5opFjbDTfEe5K/filwcXdPTZEV+cheTjlolKNNSRbY/MV4kroiDshlnQm1dy+WMQTguzjSkSfpRgXRqhIqFRhcWQvnwA93rdLpqkR02TWydv0AQhkSxsIk3tkyuBB0Hv9aVB0NhDFZ0J/12xu8u2Mp68DT3Apgp78ZqPCxdWYKnkrWA0P1w05KOlG1eF25rYyw3sdk7Xl2MEGU5lhsoAUhJLV7Lcja1nrQfWf8AEjqMtGqAG6FUIBm8N4jvBODOgdxkRCU8t7VmFF5JXF5lsQ+2FCvpCHPmTBtXwLlSOkG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1YKz/CJDiC1DXLIJAkJs68yBSkijfChJRRXx7Tmjww=;
 b=glj4vhzk+k3/5q1u8A+z/JG7HFl8j+Ev3B2A7C5Rx2FjVnBBvkHBx9sfT2Ii0h18zT/RqKJjbQN+UHmPQrJ49lUTIA9K5fvtrWJgo1liqwi59WqG81jidIbGld5QPoymxMVGX6fhV5YFijUMxsh3i//Vm/Sva148JAlIhBfmLdeku9p7PODUBgNErqmOI5nQ0GY0z3GUppRRAiekx5sxAKmRsYGz8PdBg9K7CqdtgCoFrIk1rnKHpldJr/J9UzJDQCYLgogyafqGMZJVNT+dB8Kv41Bj2AufMwjUTsAHlB1syL6prQBCmClgB6dlFB+qDDHDkMG7oUoKNs4kMvwfRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1YKz/CJDiC1DXLIJAkJs68yBSkijfChJRRXx7Tmjww=;
 b=lmB5p747yTwdwC/nNd+/9RS8G0kQkYJOq+TZEUMKUll3EUBILDdtKMCYfroE0p3zSUFAbom6IVMuEBhFnLE4on4m4ijkKFmu32NO9ZfWxPpc2QAjsNkqryrCGMwEEwCsKCTsGGh8MSV6oeEkeTqsM8z1TsCV3kGQ08JVG9edeRE=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c1f176e5-03a5-4026-83a4-693a3e942427@amd.com>
Date: Tue, 10 Nov 2026 09:59:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm: validate non-common page-table ranges
To: =?UTF-8?Q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <bertrand.marquis@arm.com>, <sstabellini@kernel.org>
References: <20261005175940.103249-1-gabi.qs.mail@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261005175940.103249-1-gabi.qs.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE948:EE_|MW4PR12MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ab2685-a872-4307-2580-08df3f08e508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|22082099003|18002099003|10067099003|11063799006|261102123227099003|261026121527099003|261028144727099003|261022105027099003|261009223027099003|261021121427099003|261021123027099003|56012099006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	GWrSIW0+XZCw9NAd2CI6itl/i2t6yfm+7A4vIC6ZIvq6eBdY3hd56Tpv4j07DnB9NrG8QUCQzlmjHSmFADZrGZipOdHUWim72An7KN0rbuLgwrCc8sMK/jczZsF/9PgoWMWM7RQbn1D2Gy1TXE9fTvoZ1MhZ9IoNq9jAspqIWi194yzaYaHgpYTQ3c+tZF+LoZWuzOUFEyxcQzXlPt5e3OhOdYQEhUZ6PLrCaPlT5on0hcpCwt2qZwaTSRRL0+PEU3SlGSGvBBORsEjbQfIC9N34WrjS5OOSWU+tGqMsaV0vXF8JRmS7nhqVfUuWDFtG4HpxmncBar1fDvRzYH1sfpGrvo0PmcL3c8lfAt8jPnzLOecbwZT6eY4+4xTp5U2P+PLf7xnJUcVnCfsN8ma+ZXegMKB98n+h9Dq1j/kbWTIlx6xavNZ7gYZce3sQxeIJYFKBit0Frto+tl4KyXZn6kY2lvpfLm9LRK7UeFJZKGmXvhVI16RzN5rFss3lTy5YNSFQKJ7ErvdzZzbFL7lUn42yqx9kLrIx4sRgkKfCSkuHRrNhv0Qvn5n6lLGkC+fI9KG7NmgiZQaDMsgXNtcSSTYxOSquNwAWlCVuGPkq8zKUMuKvtfv3jJVgOH1juOxTb9HYVdzMgLONG/vywvgX9GN6cfer5KwDJiAByndcxYkH97iLwyhtzO1ZHTks2BuDEUOTByiUe7IBx3Bgvz48tA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(261102123227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261009223027099003)(261021121427099003)(261021123027099003)(56012099006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wfIEZ+XM4k75apHcTg/ji8ONvttXhFuAiQLM0zU2ad/UmHZIQFigc4GWvcU5iKaGLan0+dipXfXR5Soi5L9NBHsAl4Op/GBkBdIe+qA1EDo46JheKqysN0oNjS1gOIqp3d3SdadaO5ocHtsvUX4fZKEal1uqWjf1deu64uPscTK+MW3xfUf9BkUoc5B/VdMqIkTHNLN+GexB/C91aMvSHXyRyUzWirsIvTwi8OuSy9poCNXI3qfjsokcPBdJTlKJzJpE+7NH0mcbsVqE+7aqpuZIGnFmFcodMFEDYpuiAsS1PERXLL3iMpjYknnK9dxwDtikEDEqhk5mSjbmR+fAYwV7zB+uwsLeJ23TVpkrb3qDD0vwTOApd5mjjpncxsQIqQFoI9OhpN9scoMHe2jynacdaDpjfJwEUOewx9fMY1K36sjru03loTVn1/nWiAcN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:59:14.4132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ab2685-a872-4307-2580-08df3f08e508
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE948.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7143
X-purgate-ID: tlsNG-d25034/1794301159-77ED2A5B-7FF532F1/0/0
X-purgate-type: clean
X-purgate-size: 5067
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch does not apply and it looks as if it was diffed against your previous
revision, not the staging branch. Please send the correct patch.

~Michal

On 05-Oct-26 19:59, Gabriel Quintáns Souto wrote:
> On arm32, page-tables are different on each CPUs, although they share some
> common mappings.
> 
> The xen_pt_update function assumed that only said mappings would be
> modified, but did not check this assumption.
> 
> Add a range check to reject modifications to non-common mappings.
> 
> Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
> ---
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
>  xen/arch/arm/include/asm/arm32/mm.h | 24 +++++++++++++++++++++++
>  xen/arch/arm/include/asm/arm64/mm.h | 10 ++++++++++
>  xen/arch/arm/mmu/pt.c               | 30 ++++-------------------------
>  3 files changed, 38 insertions(+), 26 deletions(-)
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
> index ad0d1e6..5e1b427 100644
> --- a/xen/arch/arm/mmu/pt.c
> +++ b/xen/arch/arm/mmu/pt.c
> @@ -590,29 +590,6 @@ static unsigned int xen_pt_check_contig(unsigned long vfn, mfn_t mfn,
>      return XEN_PT_4K_NR_CONTIG;
>  }
>  
> -#ifdef CONFIG_ARM_32
> -static bool ranges_overlap(unsigned long start1, unsigned long size1,
> -                           unsigned long start2, unsigned long size2)
> -{
> -    if ( start1 < start2 )
> -        return start2 - start1 < size1;
> -
> -    return start1 - start2 < size2;
> -}
> -
> -static bool xen_pt_range_is_non_common(unsigned long virt,
> -                                       unsigned long size)
> -{
> -    unsigned long temporary_start = TEMPORARY_AREA_ADDR(0);
> -    unsigned long temporary_size = XEN_PT_LEVEL_SIZE(1);
> -
> -    return ranges_overlap(virt, size,
> -                          DOMHEAP_VIRT_START, DOMHEAP_VIRT_SIZE) ||
> -           ranges_overlap(virt, size,
> -                          temporary_start, temporary_size);
> -}
> -#endif
> -
>  static DEFINE_SPINLOCK(xen_pt_lock);
>  
>  static int xen_pt_update(unsigned long virt,
> @@ -627,10 +604,11 @@ static int xen_pt_update(unsigned long virt,
>  
>      const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
>  
> -    #ifdef CONFIG_ARM_32
> -    if ( xen_pt_range_is_non_common(virt, nr_mfns * PAGE_SIZE) )
> +    if ( !xen_pt_range_is_common(virt, nr_mfns * PAGE_SIZE) )
> +    {
> +        ASSERT_UNREACHABLE();
>          return -EINVAL;
> -    #endif
> +    }
>  
>      if ( flags_has_rwx(flags) )
>      {


