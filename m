Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D87606A31B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BKQaw4tN
Received: from list by lists.xenproject.org with outflank-mailman.1459092.1671166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCWV-0006RS-5y; Fri, 23 Oct 2026 10:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459092.1671166; Fri, 23 Oct 2026 10:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCWV-0006RL-3B; Fri, 23 Oct 2026 10:29:19 +0000
Received: by outflank-mailman (input) for mailman id 1459092;
 Fri, 23 Oct 2026 10:29:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xKCWU-0006QA-1B
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 10:29:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKCWS-005GKI-W7
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 12:29:17 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb36f5-e002-0a2a0a5209dd-0a2a4501d882-6
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 12:29:16 +0200
Received: from [52.101.56.48]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb36fb-5984-0a2a45010019-34653830a063-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 12:29:16 +0200
Received: from PH7PR17CA0059.namprd17.prod.outlook.com (2603:10b6:510:325::25)
 by MN0PR12MB6368.namprd12.prod.outlook.com (2603:10b6:208:3d2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 10:29:11 +0000
Received: from BY1PEPF0002696A.namprd05.prod.outlook.com
 (2603:10b6:510:325:cafe::44) by PH7PR17CA0059.outlook.office365.com
 (2603:10b6:510:325::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 10:29:11 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0002696A.mail.protection.outlook.com (10.167.244.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 10:29:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 05:29:10 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 23 Oct 2026 05:29:09 -0500
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
 b=pM7Oi2aUUA/SfTRd/S+GS2WbK2glG+LdynilJx6+1vjO1EkzmcNuGOsvdPgRwdDkA/5WOFS2cBcWt5DdK77Y87xjTnJQBDVCc7BRMh1KE0qvawgnaOmI0psLNb289IAlWDOTHP2ThTzeBd5NvfhdwNLBu2GuDou0nJ8/10yUGU7+5ioKKl4sXRp/t+Tc+5V89WFKsFZFp/7uVhrJKvycchYWSWkc1Nb+eogDJ7EZLs0a3Y7Ry+S/yNX26VQmY3o701Hma7wbSaUmc94JG5+NnD3Epo4kccvJ+t9FA7pG57KE5F6dfovmOvUhqDu0Ai1gCMaoN8xJd+YCDNNRL2AtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z85FzhDw98EF2IONjo3MUPpsoTPX1b6G+PCnPwD5v3c=;
 b=N5XFEx3lT8z4nrWA0wNBy82Jg7fybIbKmZY6MilhcawjshLybtfYk8H4Q7UDH1MTHoyXkfz9p/EYJgKT0ZtR0VHHZBQXhpL+f1HB/BXH1azSU9ROzss+mwcn29R93VsRj1R4N55gAPh9neJo40sPxciprYgu3FR+4AxL36xbwEYib6MiBFU2cxlV7++tzPsGMB/cBX74zx+5u5MHdVXW5MDlXe+1k95irc24hwUEgzMCGTgPnSRpS22LFAUcjgZYs7PBwj2hZH8uElj3KYJnRkWn2FhcKBvKjeaJy0jDBY+00SupZOhNrczFlqf1/LUyFypL1Tj2XaN2VgkHi0QOnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z85FzhDw98EF2IONjo3MUPpsoTPX1b6G+PCnPwD5v3c=;
 b=BKQaw4tNaM/01agBqrDv6JonBANNrfkOicZrkuLQQ+jE7JcaG3aS6J3zWaxe5TLMAiz+Dpw65+cR7oY81S9jjFKe0gf2f3yNh70bVFSoTo1mSWodNKL1RvIKt7BA/cViSLhRnEoWXMCwqles6Jmah8GCAP/v6C4sWGqg1fU4F78=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <77c01e6e-779d-4a52-b206-681b5ec064ae@amd.com>
Date: Fri, 23 Oct 2026 12:29:03 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] xen/arm: populate a default P2M pool for new domains
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1792138386.8631fc262581453bbf619ec5b2062170.1a143c59b630008425@vates.tech>
 <1792138612.8631fc262581453bbf619ec5b2062170.1a143c90ffa0008425@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1792138612.8631fc262581453bbf619ec5b2062170.1a143c90ffa0008425@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696A:EE_|MN0PR12MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: f55d956d-b524-439f-dd24-08df30f07a0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|261021121427099003|6133799003|18002099003|22082099003|261009223027099003|4143699003|11063799006|10067099003|261022105027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	UmI7Z7dVUrzPYkLJ8fddC2+JYQt9SaF3CXBE6wtOgaZBrTQjDTqh98HurMylmqedPrOo+aE0TYcqnr4/eQYvJbUi6KjJgh8OVws394D5QWRiVrsMid4LU670jOuB9VQGcPisxTB66cY1uNZjPb+3FoIy1FVVBbyPcGpNPeuUbv0N15Hhd7drz5LvtbFWoPbay3sGyx9irT4NmSBDJDAE5ol/bzj4PNT+qihP4BdwdSPzHceox83FA/oSwg20U8dA/3shiDyJVbykJ+dMFY1qJh9TjS4f84CxINqGW+XNYAbxKe3LM4T882d5L70F18gerhd+4Go4fGA/aRzze0OKOsOD9XWImpN1aI5j2LJfwSZx9zYaU4BEgWnLwFIWbT98vI3PIQQJXJE6vB3rmG5tD0uXcx0z/4IapoHUmbaS2hxx9M93msQB6gz12z+bAHRdbEMafRDfsRlZnf8GhuLP/S1v3PdMF2wqTwxmEV5UOFy+nJxsKOtnt4cr7L+f4jxd9sCZEVD0MSsXkddaa8Lx2sb49jx94QtaqBSas/YTXfkE/2Z0yEyDur9EZtdooE/YpJY5PQj5wgr5k2ttdpiHgr6eLr1ki4J4OjHEt7DttPlyxTgEffkgannSSQyY5hDYTKPKeTuVWbOTdxQ+7vB4EOTBa/CCLL5JzRFMx/u4g4BqNo9lb9L+pp/BzCYtktu1TKfp4xdzMJv3UmSCyu7a0Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(261021121427099003)(6133799003)(18002099003)(22082099003)(261009223027099003)(4143699003)(11063799006)(10067099003)(261022105027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	acmlVEQ6ugnH1OsiO1EXQ0tMTnL79JtOQBHhFilz5soXxt5Wht0nx9X1AgwnOhUpMv7whjDsLhT/L0GDaZCe1P/5mf7W/SPZOuaUzncIwNUagC45fB2BWuLXSnY3qart5BcWbMjYmS/4rkNIjQpCRvTKaN9kCncownc1Cgq97Ga8OB8O9SEVs/G/W0r2nmTwz+C29eRAwfZTfdi0LG/oJwnghZDZjjpKnM1wG+2TNHv3dIaqGl2y9BEhSUMA3kNw6yYnJQZk9MlsiMcv3yFUM5orXO5XQrkCopLhrRTZkr3P5sH84IFv03XU1cR/pGuXqQ2hXA88GJYVd57O474eoPgZkt0C6BHadXMfxwH6gD3sG3aN7xwbvlDq7BidQtHigoqby4/DB3OwFUsAyOsLX3Ig9JAvjr5qW5JCkzL8ezoC1Fo3ElF+qIuDEmWoJ/NM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:29:10.6934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f55d956d-b524-439f-dd24-08df30f07a0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002696A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6368
X-purgate-ID: tlsNG-d62444/1792751356-BE07B757-99BA5A1D/0/0
X-purgate-type: clean
X-purgate-size: 2592
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 16-Oct-26 10:16, Julian Vetter wrote:
> Since commit 9c962e07fb ("xen/arm: Clean-up in p2m_init() and
> p2m_final_teardown()"), ARM domains start with an empty P2M pool. So,
> populating the physmap fails, as no page tables can be allocated until
> the pool is sized by, e.g., the toolstack.
The history on Arm I found is as follows:
 - no dedicated P2M pool for domains
 - cbea5a1149 adds a dedicated P2M pool for non-hw domains
 - c7cff11888 adds initial P2M pool due to GICv2 requirements
 - 9c962e07fb removes the above

> 
> Restore the call to add a small default pool of 16 pages in p2m_init()
> again, as before 9c962e07fb. The hardware domain is skipped, as it
> doesn't allocate its P2M pages from the page pool. Also skip it if LLC
> coloring is enabled. The colors are only configured after domain
> creation, so the pool pages would be allocated with the default colors.
This does not say anything about why we need to have a default pool. The cover
letter you sent mentions that x86 does that but does not rationalize why. Also,
why 16 and not any other number (previously on Arm it was 16 due to GICv2
worst-case). And if we really need to have a default pool, then shouldn't we
just initialize it to the default set in dom0less case by
domain_p2m_set_allocation() and in xl case by libxl__get_required_paging_memory()?

~Michal

> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
>  xen/arch/arm/mmu/p2m.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index 2cf35d8a37..de8dd26a72 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -3,6 +3,7 @@
>  #include <xen/domain_page.h>
>  #include <xen/ioreq.h>
>  #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
>  
> @@ -1541,6 +1542,21 @@ int p2m_init(struct domain *d)
>      if ( rc )
>          return rc;
>  
> +    /* Populate 16 pages to the P2M pages pool here.
> +     *
> +     * Skip the hardware domain, which allocates its P2M pages from the heap,
> +     * and LLC colored setups, as the domain's colors are only configured after
> +     * domain creation.
> +     */
> +    if ( !is_hardware_domain(d) && !llc_coloring_enabled )
> +    {
> +        spin_lock(&d->arch.paging.lock);
> +        rc = p2m_set_allocation(d, 16, false);
> +        spin_unlock(&d->arch.paging.lock);
> +        if ( rc )
> +            return rc;
> +    }
> +
>      return 0;
>  }
>  


