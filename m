Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CA7C44501
	for <xen-devel@archiver.kernel.org>; Fri, 10 Jul 2026 15:09:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1359526.1613058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiCrJ-0000Un-Jr; Fri, 10 Jul 2026 15:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359526.1613058; Fri, 10 Jul 2026 15:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiCrJ-0000Ug-Fg; Fri, 10 Jul 2026 15:09:45 +0000
Received: by outflank-mailman (input) for mailman id 1359526;
 Fri, 10 Jul 2026 15:09:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wiCrH-0000Ua-Sj
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:09:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiCrH-006gD3-67
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 17:09:43 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a510b2f-e002-0a2a0a5209dd-0a2a4502bc18-18
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 17:09:42 +0200
Received: from [52.101.62.38]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a510b35-64c6-0a2a45020019-34653e26b2d9-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 17:09:42 +0200
Received: from SJ0PR13CA0065.namprd13.prod.outlook.com (2603:10b6:a03:2c4::10)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Fri, 10 Jul
 2026 15:09:34 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::f9) by SJ0PR13CA0065.outlook.office365.com
 (2603:10b6:a03:2c4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.6 via Frontend Transport; Fri, 10
 Jul 2026 15:09:33 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 15:09:33 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 10:09:33 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 10:09:31 -0500
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
 b=BtK1PSA9doultvH8GZK77Hp4N9k1pAB1cBRBHKDiACQ4LtKfMQ6b/49bpNlE7cL+alqVMy+DzFIKFE6VpdAU6zSvKPqxH9FpWodWr7RppiZbjBJwBDXP2Tcw+4/t2jJ1QzGOgR7cPRlyyP1My/++6twKIZ6NV54IQcfuz8w0ah6FwT30xkz2YRxqJu9DtoB0W2Y65/Q4QQGFcorkj2BM3GOgo5q7fykzcT52UuRw1OCu/cc7zMWYcQPDDcst8ZkTzvoxcoUqkTrZAGydkXG5FEpbtn57qsjjdJb8Pk5KipxEZi4cZDIbv+e9uZY6gXB2FQudx4grOBeEy7Pf9qe4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuLyPW4hTBGsN1MYtJS2hUrR49aCSFL3lF3Z3gvRZPE=;
 b=IgOiftABndgE2hDnXauB/t5AWmW/kXv/m5x6UeULLLzaLLyhcZZyk9Cla+vzVAQYGwRyhYRUnoGC6LBSDsXWHr8taUHdTBDp6/298HhSiqbohCtEItIB+etFkyYD4inPSo260FlzH6PKuG5GF86X8c5ym26JkuUsy3rhzuwu1pnjaXQPs0Lt+d2WXTCNBEKsTHZZzy+FdAuD8NgX17V8/5om+rXmnL/6D8AdIbEs9cCaay9Jb4r6mY+IwmKETzvET6dAeXcLae3Abb8ItUSmcoU2gTqbWPIsh7JVYWvV0LfGVnhGFWAOKRCvSD8Fvsbn3pMneiQpevL+VVkyI4e9lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuLyPW4hTBGsN1MYtJS2hUrR49aCSFL3lF3Z3gvRZPE=;
 b=IlhV8o/vcQT9njrpICSCMA0DZKnaSmGKWR7MOuv+Nbx6a88ZQAMtVXN0SqumcVWG4SkgGWa04cVp3SL2WSMNaMNJau6uaRHNDLxQFe9gUAkrNG1kOxy8jNJgxt2sWjgKWCqc0FeH5Feayq8aZqs3FFX6vPTodEVICe3LGL2l3fA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <573d2bd7-542e-4d3f-ac2e-4b03362e35f5@amd.com>
Date: Fri, 10 Jul 2026 16:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] xen/arm: Implement p2m_get_entry for MPU systems
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>, "Hari
 Limaye" <hari.limaye@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
 <20260420142524.1804073-3-luca.fancellu@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260420142524.1804073-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|MN2PR12MB4374:EE_
X-MS-Office365-Filtering-Correlation-Id: c501c3a0-8663-42aa-8c6b-08dede953fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|22082099003|18002099003|56012099006|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	oH6Z4LkgASJPWm3ZXPf94tWSPxN1knsLycqUkHqGMLvnMWKO95HAZgx0d4xmYQEgCbD//SDQWITLT5Que07Px0fAqnfWtwmU0DrhMaxMUn2ZSaLGvEtajL6yueyWFoHkglcvCEawsNsmyxN114U1zll3Z0iU+MSM+0HttAEDi3M7NWV3w3sltHicb78XA2/UXXbS8LlMTCraTGPzpFmOegBcN6p0LYlih5sCHhFCOif3OtDir4U0TgX/FpO1KkHpcBF72AbEyudU1yfAoe4evRRtjEA8EE/LoSz0/Co4wvUVnK5DDkrTb1elQavpa2Zlg0oLOpuimKdzd+SY6nS1Yd4u0vQ6v0JpbkNU+stXfG37gXYS1FBRVK3Dg6PIYsuG3oyByopdTO/cWhz91hyR06e2JSnfwicAM3v9KtVxGBennl5gx+Kt04wfbwbck/ldzRqWTd3d8cON2AWnAxv65GOmE5olYU0ZBHgMyX+ZDhPGlihJ+NjwZKHWSgtDucYdmJwPB6tKyazKViYBXKQ+hr00MIrIHZxBEhFFr+ZktB2GFJIhhi70lIQZ1CPjU3vrSYlt2S2E6xWXO3dQwMFK4QcweVCBWsyxXedLXSqM+RIFcB9P+rkXc4wHacPC9bd6ewG72l3jlRb29t9XfgCfAx9CuhwgDnje1rnQyiRYtm3+/ro3uExgE5JhRwx2rWaoVUtqDw/lqIH9LCIF3eJBsw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Yyp2qcp+Em1PyZjS5IEcz0D3vhvsphMsv3euijuyqn/xbYDXWhbh1drlFQTBI86qt49Tl2MVoY6I2x2l2WMbMiQw2tDVxuLAqcrzJlEhT8HdxrOBdJD/QN5eZvyIvpcVdo/wIwpxUY3XQXVsPdPf89ZHxFgaSMqzp2htr2dQeaZrmoya8cuS5Rssop2HJciPXXLhm2pASCk5AIErkPLt8G2Bcu3MZjTbFISt+3Jg3fnDINoOvViJB+nspZCpQ7VAtQG8ep/MNIR/3Ye0nOvsqnMMluitNmfHH6shizv5JI8gGpLq0gnldArlbAA/oU1F8rqODRtdia2swe64NmV8VQELb2fuDDAi9Jjydmw6JE+MeBSYyg+bqwzPODCFWuT3bw7nOftnf8u558t9EHxIsYMv1lYydqsx15O/L4N2LMHgKtMN2ISIe+aWJfMp4ls1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 15:09:33.5072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c501c3a0-8663-42aa-8c6b-08dede953fd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374
X-purgate-ID: tlsNG-720697/1783696182-B2158A87-273C7372/0/0
X-purgate-type: clean
X-purgate-size: 4639

Hi Luca,

On 20/04/2026 15:25, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
>
> Implement the function p2m_get_entry for MPU systems, which is
> responsible for looking up an entry in the p2m table.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
>   xen/arch/arm/include/asm/mpu/p2m.h |  5 ++
>   xen/arch/arm/mpu/p2m.c             | 76 ++++++++++++++++++++++++++++--
>   2 files changed, 77 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
> index b9c7be2d9dcc..d0ec8a77a15a 100644
> --- a/xen/arch/arm/include/asm/mpu/p2m.h
> +++ b/xen/arch/arm/include/asm/mpu/p2m.h
> @@ -31,6 +31,11 @@ static inline p2m_type_t region_get_p2m(pr_t *pr)
>       return pr->p2m_type;
>   }
>   
> +static inline bool region_is_p2m_valid(pr_t *pr)

const pr_t *

As this is just accessed.

> +{
> +    return (pr->p2m_type != p2m_invalid);
> +}
> +
>   #endif /* __ARM_MPU_P2M_H__ */
>   
>   /*
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> index 4a8595b1b25e..681717eacf37 100644
> --- a/xen/arch/arm/mpu/p2m.c
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -135,11 +135,79 @@ int p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned long nr,
>       return __p2m_set_entry(p2m, sgfn, nr, smfn, t, a);
>   }
>   
> -mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t,
> -                    p2m_access_t *a, unsigned int *page_order, bool *valid)
> +/*
> + * Get the details of guest MPU memory region [gfn, gfn + nr_gfns).
> + *
> + * If the region is mapped, `t` is set to the p2m_type of the region and the
> + * starting MFN is returned.
> + * If the region is not mapped, INVALID_MFN is returned.
> + */
> +static mfn_t p2m_get_mpu_region(struct p2m_domain *p2m, gfn_t gfn,
> +                                unsigned long nr_gfns, p2m_type_t *type,
> +                                bool *valid)
>   {
> -    BUG_ON("unimplemented");
> -    return INVALID_MFN;
> +    pr_t *table = NULL;
> +    pr_t *region = NULL;
> +    uint8_t idx = INVALID_REGION_IDX;
> +    gfn_t egfn = gfn_add(gfn, nr_gfns);
> +    p2m_type_t optional_type = p2m_invalid;
> +    bool optional_valid = false;
> +    mfn_t ret = INVALID_MFN;
> +
> +    ASSERT(p2m_is_locked(p2m));
> +
> +    /*
> +     * Check if the ending gfn is higher than the highest the p2m map
> +     * currently holds, or the starting gfn lower than the lowest it holds.
> +     */
> +    if ( (gfn_x(egfn) > gfn_x(p2m->max_mapped_gfn)) ||
> +         (gfn_x(gfn) < gfn_x(p2m->lowest_mapped_gfn)) )
> +        goto out;
> +
> +    table = (pr_t *)page_to_virt(p2m->root);
> +    /* The table should always be non-NULL and is always present. */
> +    if ( !table )
> +        ASSERT_UNREACHABLE();
> +
> +    if ( is_gfns_mapped(table, p2m->nr_regions, gfn, nr_gfns, &idx) )
> +        goto out;
ASSERT_UNREACHABLE() is a no-op in a release build, so on a NULL table you
fall straight through and dereference it in is_gfns_mapped(). Add a
goto out (as __p2m_set_entry already does with its return -EINVAL).

> +
> +    region = &table[idx];
> +    if ( region_is_p2m_valid(region) )
> +    {
> +        optional_type = region_get_p2m(region);
> +        optional_valid = region_is_valid(region);
> +    }
> +
> +    /* Always GFN == MFN on MPU systems. */
> +    ret = _mfn(gfn_x(gfn));
> +
> +out:
> +    if ( type )
> +        *type = optional_type;
> +
> +    if ( valid )
> +        *valid = optional_valid;
> +
> +    return ret;
> +}
> +
> +/*
> + * Get the details of a given gfn.
> + *
> + * If the entry is present, the associated MFN will be returned and the
> + * p2m type gets filled up.
> + * If the entry is not present, INVALID_MFN will be returned
> + *
> + * The page_order is meaningless in MPU system, and we keep it here
> + * to be compatible with MMU system.
> + */
> +mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
> +                    p2m_type_t *t, p2m_access_t *a,
> +                    unsigned int *page_order,
> +                    bool *valid)
> +{
> +    return p2m_get_mpu_region(p2m, gfn, 1, t, valid);
The a (p2m_access_t *) out-parameter is never written. A caller that 
passes a
non-NULL a reads stale stack. Either fill it or document why access is not
tracked on MPU.

>   }
>   
>   void p2m_dump_info(struct domain *d)
- Ayan

