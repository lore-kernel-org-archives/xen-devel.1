Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF90606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XmEHA4Bg
Received: from list by lists.xenproject.org with outflank-mailman.1461331.1672320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKUy-00010y-Ha; Mon, 26 Oct 2026 13:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461331.1672320; Mon, 26 Oct 2026 13:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKUy-00010r-EH; Mon, 26 Oct 2026 13:12:24 +0000
Received: by outflank-mailman (input) for mailman id 1461331;
 Mon, 26 Oct 2026 13:12:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xLKUx-00010l-7r
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:12:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLKUw-000n4I-G9
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 14:12:22 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adf51a9-bab6-0a2a0a5309dd-0a2a4503b6ac-36
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 14:12:22 +0100
Received: from [40.93.196.43]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adf51ae-fae8-0a2a45030019-285dc42b0c3a-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 14:12:16 +0100
Received: from DS1P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::7) by
 CY8PR12MB7561.namprd12.prod.outlook.com (2603:10b6:930:94::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Mon, 26 Oct 2026 13:12:12 +0000
Received: from CH7PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:451:cafe::9f) by DS1P221CA0008.outlook.office365.com
 (2603:10b6:8:451::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 26
 Oct 2026 13:12:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH7PEPF00000018.mail.protection.outlook.com (10.167.244.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Mon, 26 Oct 2026 13:12:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 08:12:11 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 26 Oct 2026 08:12:09 -0500
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
 b=ShIbJXUphFfBpyfG//cpFNKTR73qU/vJkUb+BT1gMtShllfAis4sYIPvAnw+rfDLCpuLHupx+I8OafRsVBudXlVZhgvvxDbBo27SzH8xZOPcn3Fb15RrDWUOK9hjVMeicFHlQ7xY4vJlp836g9eYaGzYibX/eNpk+xAoW7h0IUaxOnBxf3oYZ58onL8u8/E9cr078PBhNTJMA+FGpIy/UYoLWZw9iL/0xVWtUt93DA6HscmCVGNx9PYDsy+LAgrKdrq0pVHvMbMUrt4HyQqwXga7QvS+v1Sx2GXXD0V4S9I5wbdL7/SG4RbeLCuzRS1XILOsYlF3siEVOZ4epMLzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1L5hpLtlJskaYdjEaq3r1Xa0w1uhEaH1HjVThLS280Q=;
 b=Ihqec8wLr2btcPTCmXr29N8bW7p84OJq6X6bUAT4e34uToG1QZ03Z8Tj3xGUGRb8Jl4U5F6SjTWQbbOgfbPIZrWTQ5l8kCF0fgBMiY5kISD+v6rzNOBMf1wHZEZPd78dHlML+4YEqk8ivbqtlO1VduSIKBeXhaS1X5sr8lqE45wYN0Px+32LfDcNhiHaqoZ3Vl6wUYcbYY1+vheYyHGi1xeBx7+rV3Ql+hrFQP+poycSch8qXEDuu3WwfcbpjteMe9QYuBtVL1g7WfL6OYI4WaWOHP/oWkvlUZx7tjr+Xa0R2mDFMVTxTMBIq6J71bSCo7DEYz2T014+VnFRjzCS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1L5hpLtlJskaYdjEaq3r1Xa0w1uhEaH1HjVThLS280Q=;
 b=XmEHA4BgsWL2y4METN2Otq+08tzOKdzYQR32bzfogUbSpXpzMkdDKNnHxnTIL+Jzi6m6HoYlXgdIVV/TTBaZIVEUwF6PlNvPd1pg8t/Um/eJwHNA3A13QrLgEJ0zgvL+1my9WZTpu0pQtUK72vEsQv0S0pH9wiqny3H+erO2YPM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <92c60d77-5f7b-4742-b473-84126fd6168b@amd.com>
Date: Mon, 26 Oct 2026 14:12:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] xen/arm: populate a default P2M pool for new
 domains
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <1792761821.8631fc262581453bbf619ec5b2062170.1a168ee7993000f79f@vates.tech>
 <1792762007.8631fc262581453bbf619ec5b2062170.1a168f1512b000f79f@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1792762007.8631fc262581453bbf619ec5b2062170.1a168f1512b000f79f@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000018:EE_|CY8PR12MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3f88f2-1c81-4c1f-f7ff-08df3362bf2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|82310400026|36860700016|261009223027099003|261021121427099003|261022105027099003|261021123027099003|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	wqSwOADt06xUdZ86f2ZV19R1M2dmu9m7oDMB0W69HEdzobew8VzUgJUzGtY33sFam8BoodEEdq2vQuOJReQQfweO0uwrHHD97kF1xqnVd3V/KTYnXPb1CEjnd5vyiLt2GH6dWXTDXkQVasva3PPsuPxB/9oSOUDtL4a6SXtC13aAbFJ1UXEZgCUp5AuYFJXUB9StGKB5bT/o4xRLx9cRjk71Lx7cdAzA7E70KegbZX3+oHTPLp/NTnRzSCGYyScakWiebhy/3m5Vw3yys5zrVoUi17HYHC47TsNE6D/wk9Y2hS25hXhXctPpPwfmKVml0lMJ4q2YT8fvnGFOkddTnM0xMRIW6V37nTGZK1jmE8OGllpYqw1cZpyI/MTSb5zy8R/46XCdeKEar9ADvoiAp6CHmyj2m67sDFhPNtX8XMslMJZ3Z+R/4kO96QtItCzmmaVeZhsr0qzbOJBTQjzkGRyvGllrfocMxSLrxHTXAsF1xlS5dic0q+pP2IDLrsqDNFx+59mO1XdjGJOrEikLi9RFHfOiW1oRm4M9xaRLxF63wU+EEeljz5s9i5+seLgUsoM2CrttyCDIbQZfNmJIDn/qXnK7xKYXIlokVWaQnX5q9Czz2VJ/3YKLnOhLscauiX+6QeS6rQajKKY5upAcqDxUBbJvGUt2giRZMpLKNNl74BXRfC6x/Zscp/6QxYDOP+JSwh8rhz7yR2nw3RtxJQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261009223027099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lhLd7dr7M2tDiGeDyLudGWLeKMQk+HutC6FW8h0tDDTzdiamScO/ulgAARIW9aubCB8xss0mRh24bH9Zd0nua7fSiK3KEh2PeQ7YHUzbE7LGcJV7iriGdC2GCOAAHUo+oStbmlutKKq+BMiWW3GxBAf38pKwHMlRcn6Q2go4ZHn9l7CsXluNfaC1GrtfaM8WJkpfeFQ1YK/TTn3zFYLC/MUtHgAXejktyADI4XUVarDv+soANiXDLEUzRzyp/AE9pQM5HVrBPUD8IwzcWPOyEslfS/bW++kJ5ch9Uz1SCrNDVex5visYDEPH0JS9KYbnoVY/1UdkgT9Q7CGsAsTg6/tCAYL010e9XpZKufKzoTzGSzlI0Opd7G6BCNUYfgUk8kdqhMAKUQqb39j2spuMOYa3meHE2+52UbtlxqxiPhzrjpCnG9KVNGIP1aLGAkK1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 13:12:11.6680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3f88f2-1c81-4c1f-f7ff-08df3362bf2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7561
X-purgate-ID: tlsNG-33051d/1793020342-75C804E9-6389899A/0/0
X-purgate-type: clean
X-purgate-size: 5612
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 23-Oct-26 15:26, Julian Vetter wrote:
> On x86, a domain can be populated directly after the
> XEN_DOMCTL_createdomain call. Sizing the pool is thus an optional tuning
> step for the toolstack (libxl: "the Xen minimum is for safety, not
> performance").
> 
> On ARM however, the P2M pool of a non-hardware domain starts empty. So,
> any toolstack must size the pool before populating the domain's physmap,
> otherwise no P2M tables can be allocated. This is an ARM specific step,
> which every toolstack has to know about.
> 
> Instead, populate a default pool in p2m_init(). Ideally, it would match
> the formula used by dom0less (domain_p2m_pages()) and libxl
> (libxl__get_required_paging_memory()), but that depends on the amount of
> RAM for the given domain, which isn't known at domain creation. So, use
> the calculation but without depending on the amount of RAM for the
> domain, i.e., 1MByte per vCPU, plus 512KBytes for the extended regions.
> Then dom0less and libxl set the full size, as they do today.
> 
> Skip the hardware domain, which has no dedicated P2M pool. Also skip LLC
> colored setups, as the domain's colors are only configured after domain
> creation, so the pool pages would be allocated with the default colors.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v2:
> - Size the default pool based on the exisiting formula
> - Rewrite commit message to explain why a default pool is desirable
> ---
>  xen/arch/arm/mmu/p2m.c                  | 24 ++++++++++++++++++++++++
>  xen/common/device-tree/dom0less-build.c |  7 +------
>  xen/include/xen/domain.h                | 13 +++++++++++++
>  3 files changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 2cf35d8a37..d4971ba8d9 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -3,7 +3,10 @@
>  #include <xen/domain_page.h>
>  #include <xen/ioreq.h>
>  #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
> +#include <xen/pfn.h>
>  #include <xen/sched.h>
> +#include <xen/sizes.h>
>  #include <xen/softirq.h>
>  
>  #include <asm/alternative.h>
> @@ -1541,6 +1544,27 @@ int p2m_init(struct domain *d)
>      if ( rc )
>          return rc;
>  
> +    /*
> +     * Populate the P2M pages pool here. So, the domain is usable without the
> +     * pool being sized first, as on x86. The toolstack, or dom0less, still
> +     * sets the full size later.
> +     *
> +     * Skip the hardware domain, which has no dedicated P2M pool, and LLC
> +     * colored setups, as the domain's colors are only configured after domain
> +     * creation.
> +     */
> +    if ( !is_hardware_domain(d) && !llc_coloring_enabled )
> +    {
> +        unsigned long pages =
> +            PFN_DOWN(domain_p2m_default_kb(0, d->max_vcpus) * SZ_1K);
domain_p2m_default_kb helper would better convert to pages right away, given
that all the callers eventually need pages, not size in kb.

> +
> +        spin_lock(&d->arch.paging.lock);
> +        rc = p2m_set_allocation(d, pages, /* can_preempt */ false);
I'm not sure if this design is correct (I know I asked "why can't we set the
allocation right away" but at that time I did not consider the worst case). In
the domain creation happening at runtime, this call can take a lot of time in
the worst case (e.g. 128 vCPUs) and is not preemptable unlike
XEN_DOMCTL_set_paging_mempool_size. Maybe indeed it's better to come up with a
sane default, given that toolstacks still have to size it up to take into
account the RAM size. FWICS x86 HAP uses 256 pages. We could use this value too.
Does other Arm maintainers have any opinion here?

> +        spin_unlock(&d->arch.paging.lock);
> +        if ( rc )
> +            return rc;
> +    }
> +
>      return 0;
>  }
>  
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index fcb438c50a..21a13f9370 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -737,12 +737,7 @@ static void __init domain_vcpu_affinity(struct domain *d,
>  static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
>                                               unsigned int smp_cpus)
>  {
> -    /*
> -     * Keep in sync with libxl__get_required_paging_memory().
> -     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
> -     * plus 128 pages to cover extended regions.
> -     */
> -    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
> +    unsigned long memkb = domain_p2m_default_kb(maxmem_kb, smp_cpus);
>  
>      BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>  
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index aeb8b36ad1..74dee32fb9 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -132,6 +132,19 @@ int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
>  int arch_get_paging_mempool_size(struct domain *d, uint64_t *size /* bytes */);
>  int arch_set_paging_mempool_size(struct domain *d, uint64_t size /* bytes */);
>  
> +/*
> + * Default size of the P2M pool, in KBytes, for a domain with the given amount
> + * of RAM and number of vCPUs.
> + * Keep in sync with libxl__get_required_paging_memory().
> + * 256 pages (1MB) per vCPU, plus 1 page per MiB of RAM for the P2M map,
> + * plus 128 pages to cover extended regions.
This is Arm formula but the header is common.

~Michal


