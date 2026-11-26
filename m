Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7215C606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 07:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VZ76z/d7
Received: from list by lists.xenproject.org with outflank-mailman.1503126.1698962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWULB-0002I5-8n; Thu, 26 Nov 2026 07:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503126.1698962; Thu, 26 Nov 2026 07:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWULB-0002Hy-4a; Thu, 26 Nov 2026 07:56:25 +0000
Received: by outflank-mailman (input) for mailman id 1503126;
 Thu, 26 Nov 2026 07:56:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xWUL9-0002Hs-7D
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 07:56:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWUL8-009Waj-C9
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 08:56:22 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b07e61c-e002-0a2a0a5209dd-0a2a4502dbe4-36
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 08:56:22 +0100
Received: from [52.101.61.10]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b07e624-4900-0a2a45020019-34653d0a7dd2-4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 08:56:21 +0100
Received: from SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::14)
 by SJ1PR12MB6193.namprd12.prod.outlook.com (2603:10b6:a03:459::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 07:56:16 +0000
Received: from MW3PEPF00001655.namprd21.prod.outlook.com
 (2603:10b6:a03:41b:cafe::61) by SJ0P220CA0010.outlook.office365.com
 (2603:10b6:a03:41b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 07:56:15 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW3PEPF00001655.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.0 via Frontend Transport; Thu, 26 Nov 2026 07:56:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 01:56:14 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 01:56:14 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 26 Nov 2026 01:56:13 -0600
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
 b=Al3nuIMvREpEeQq0nawYdu4QKJhuNhzTr7yOlBMJyre191vcwyu4jIq5WnvkeJu+Xo96V1kxEo+YbqoMEo03ZQy7NHrW7ZLpAeSx7yA/J64NapGCJyNHr0gUZAmF5Pn1z9uit5kyIKNSoIZIK/z/06Zz/uxWaGwWmkNj+Ua6/7datlXLikSgsjw6hUzamT/Dcv0pvxPpmpx7zuDBXS/90E/tb2+pzGNBrA0MPUrv0J6qcC8gqMk9jF+n8fTuvdkTT1a/tIq/rYntbZ6dEUxS0T3M6AUM5r9dnXvrnQPf9JNltGUOmI99RoDfFQvBtTOS9rpw8D7zfixnESuBal9eDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6XYPsqtsA7svrUT551YrKGatBEaRc9mtqN8DcONIbE=;
 b=cM/23EQt/Yff1rwvq0waiLFNCAjBdqZtVjzci0uyvAwir4H8qfIf6Inyt8bWONzd0p8b6BmrqjjdWEPXld/FZ5A/lYyvxWbki1qSbhbjzxeA7MGLvZ5YRe6eSPlwLna33WyfZr+06CBfe7CPt5pU3mq37cENQ/7t5pQr1LX2ZqGHn6i57Ki68ZRW8BYFVh9rQWOhSVryaTfHzee3pPDTVT9Y+VH8OdpfpjiKYidPlsnwa+sxbZvyK+H3nDW7B1yCeXiQdfR6lrFPFnBuCtxzjiCGA59UiV1mqlO4uTSzakYKkCgInni+MjNr1kNUA2+1c5CiFE7rrnQEcJ/Z35XqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6XYPsqtsA7svrUT551YrKGatBEaRc9mtqN8DcONIbE=;
 b=VZ76z/d7Pk8rO5PowfxHkMWalwp9fjxvtgHd0EhLDuHoRUJI6K26G0P917Dm0Oja3mYfsk/CSmOM03iq/4Vgg44y8ldmP+1ocg+VpNkdEFWbZnI8dBQLVHOF630BNqMJ7VmWZNABJB/E2NYPW2aRd3ONryHKekOzCcdmltwu8ms=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4cced7bc-44bd-4d89-9ac1-b2ec4beca0c2@amd.com>
Date: Thu, 26 Nov 2026 08:56:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/arm: validate non-common page-table ranges
To: =?UTF-8?Q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <bertrand.marquis@arm.com>, <sstabellini@kernel.org>
References: <20261125210623.69098-1-gabi.qs.mail@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261125210623.69098-1-gabi.qs.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001655:EE_|SJ1PR12MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e47d8a8-d00b-40ee-ca82-08df4b92bee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|261009223027099003|18002099003|22082099003|10067099003|11063799006|56012099006|261102123227099003|261026140227099003|261028144727099003|261022105027099003|261026121527099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	Iyu4uxK7LrcM69Ft8nWjGnDBf29XSFhWlYgg4SwOxK5wMYXldFa8JrV0HExdZQUTqsSa0jhVPvsftMVc4pHdhV0SRXR5lDxwyxqcHTiwyR3+xew2Ar8dKDwjTFUmbo6mdGDptdV7+w44Pne8E7YBWDmw9bQaDefa0+iIKsrxpC05P+sZZm6dnER3flR89OQduEXXQ/UpKy7tPGwTHgSUeiuTZVGXtkCA0R3Lztr1HBAt9a1e58KEi4HZv1imyLkEtRyfkfGnjt8nFCMgcLTmcCKiaZpvQ5uI4i3OeuqTjoPArfiOIQYYEsJHC8a5+l9Ik/dqyORZHuJtukMjqIMJ2xuvDRLcQGxwZZTTW8S+84rCdUfMkd66R2xZlc/k+IwPqnbn+uGAW+4X/D3Iubz+yDdRfFYagINNyAeVRVKy2p0jYnRshgaczMhbu3iUKxkeUZ03dmANZqkWynWSOpvObIUlMyl5xhUsEJAKkCQZgYqWG7Opxn6+4ntxhzQ0buZ3hGD0wikI4YsHVdl97oLIHpn/Mm9tcK8JDDP4sAz6DQkCex4zY439GNgXx3FKDzwMpYCHYYenead/geySoJsTG7nZTaRa5qHLyLOtmizOXc1Y92bEIb9nBtzjT78DqCbaiVuO62ND0jx/9IzHihUBCw7MQgLqLssO1/OfukZIhloBE9Ync25k8xEaOgsoCV3Xh8ScEv/LEB05qo3FgamTMA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(261009223027099003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261026140227099003)(261028144727099003)(261022105027099003)(261026121527099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y8oI8qe9i9GbLKn8lkcxqe55h7twbCY2OLcA+OKc72F6Hi1tVRLbsrkKNfSyJUlygEOjmaX2gMFnhp++a3ML7iLHLDJ0IblbEJnvZjXBx8K6VcSEC5+WxxhdEgHG20fvx2OIPjfpJaNzvUeecldJMmo+3bODA+JMl3mngmlUk5usuVlFCxRlrTSeoIp6zoQsKyTYHF67Xgti5TMJq1/Fp0Et5BGy/eeeFbUO8QOFdkt5bcO+/fNsMatgOgS57r7b02TxgsDPZN7YquBjP7TgK2JJlvIGVpBeCbhb2LKOGSOWVf9RgbYK1ugoY7OPf6YqrKJVL5kUaRYttg2ou6GIS8ajjTYPWykB7lazn6DFB6bVdw0q/rRlKz7swDQW4V5MqRW5oPGCD1Sd+158kWW2mLyRV0G3ur0ZNpxoM79kCmjaDMPLYpWFKxMasCs/nAuP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 07:56:14.8520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e47d8a8-d00b-40ee-ca82-08df4b92bee4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW3PEPF00001655.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6193
X-purgate-ID: tlsNG-720697/1795679782-F25946C6-A1D3F013/0/0
X-purgate-type: clean
X-purgate-size: 2729
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 25-Nov-26 22:06, Gabriel Quintáns Souto wrote:
> On arm32, all the Xen mappings are common to all the CPUs, except for the
> domheap mapping, which is per-CPU.
> 
> The xen_pt_update function assumed that only the common mappings would be
> modified, but did not check this assumption.
> 
> Add a check to reject modifications to the domheap mapping.
> 
> Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
> ---
> v5:
>  - Moved the check back to pt.c under #ifdef CONFIG_ARM_32.
>  - Only check the domheap area.
>  - Added a comment explaining why only Arm32 needs it.
> 
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
>  xen/arch/arm/mmu/pt.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
> index 81fe121..b463c85 100644
> --- a/xen/arch/arm/mmu/pt.c
> +++ b/xen/arch/arm/mmu/pt.c
> @@ -13,6 +13,7 @@
>  
>  #include <asm/current.h>
>  #include <asm/fixmap.h>
> +#include <asm/mmu/layout.h>
This was supposed to be dropped.

>  
>  #ifdef NDEBUG
>  static inline void
> @@ -601,14 +602,21 @@ static int xen_pt_update(unsigned long virt,
>      unsigned long vfn = virt >> PAGE_SHIFT;
>      unsigned long left = nr_mfns;
>  
> +    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
> +
> +#ifdef CONFIG_ARM_32
>      /*
> -     * For arm32, page-tables are different on each CPUs. Yet, they share
> -     * some common mappings. It is assumed that only common mappings
> -     * will be modified with this function.
> -     *
> -     * XXX: Add a check.
> +     * Only Arm32 needs this check, as updating the domheap mapping here
> +     * would only affect the current CPU. On Arm64, all the CPUs share the
> +     * same page-tables.
>       */
> -    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
> +    if ( virt >= DOMHEAP_VIRT_START ||
> +         nr_mfns * PAGE_SIZE > DOMHEAP_VIRT_START - virt )
On arm32, nr_mfns * PAGE_SIZE could overflow.
nr_mfns > PFN_DOWN(DOMHEAP_VIRT_START - virt) fixes that.

I will fix those issues on commit. Thanks.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


