Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ED8C4450E
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 12:03:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363856.1615332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkKoQ-00073j-Gi; Thu, 16 Jul 2026 12:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363856.1615332; Thu, 16 Jul 2026 12:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkKoQ-00073c-E1; Thu, 16 Jul 2026 12:03:34 +0000
Received: by outflank-mailman (input) for mailman id 1363856;
 Thu, 16 Jul 2026 12:03:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wkKoO-00073W-Js
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 12:03:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkKoO-00EaPQ-0Z
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:03:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a58c88c-5cb7-0a2a0a5109dd-0a2a4501c084-24
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 14:03:31 +0200
Received: from [52.101.46.64]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a58c891-5984-0a2a45010019-34652e4006b8-4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 14:03:31 +0200
Received: from DS7PR05CA0082.namprd05.prod.outlook.com (2603:10b6:8:57::23) by
 MW3PR12MB4377.namprd12.prod.outlook.com (2603:10b6:303:55::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.10; Thu, 16 Jul 2026 12:03:25 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:8:57:cafe::6) by DS7PR05CA0082.outlook.office365.com
 (2603:10b6:8:57::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5 via Frontend Transport; Thu, 16
 Jul 2026 12:03:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 12:03:24 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 16 Jul
 2026 07:03:24 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 16 Jul 2026 07:03:23 -0500
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
 b=PmP1PAn+hPoYUn6ubQXkpN+pCpzbcf60WpB16YCw3/R31DccS+666YKdl993+rSqihDa0HoHpEO7oMAKgu9PCVCPjI8ZEo5ifvwqC+BYxymoJWJCu0oIpunlPtrIn0VbiAD0eyuiHm1U5XE/RDmD8FslDuXmpjwurnOU7WaqzgcfkX+kVdxv043n32fvwI9PmCgPXqcRJXH8J4O5wjMwE08bxB5ylIJ/uOzZF276NLA8W6jFq1kASX4Hc4v6JF6yXA6RRmTmALzTT65UZwea/o1wVCLTQIq+kM0b08UBIRLE+Q5p4lV98K943NxhJXIHeMNmbE9HXxEh3MKCo2ovrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spfxO7Oc+toFHwxJMoy52dLnWWWAFn6HpVk+LM7bmew=;
 b=lmiW9zQG3wbUSOO/kVTsSNHROw9ljgyC6+bNxeANGV6uw9a3jwleEvpz4kTG8kPh20DNGDG2PH3bubb2bEU9yyEkZkR/PNoeJ8U5C28RhF2YbUyVds1VHyjLqmqPnkbSSznTzLbqp5V/SwveMRxv2MpMcuxv2/yyhqCFyx2Vqgwve5SmNJsfZnOdD4YJj4+OMqnGVegC9PtzBxo3hChID0qy8Vl9Gldw08llkk/O3jXHOTQaqljozDZPWUPFVBdww4FwJNM11GqmWLPzMugVmVZ69c6cGSNvN+W6iExxDCQpMHHYn0m5M1Ic2ERnEIlMuVPSgf5jl15vA/gb1s6ugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spfxO7Oc+toFHwxJMoy52dLnWWWAFn6HpVk+LM7bmew=;
 b=3EhjeJztsnzJQBvwKbW9MjF+6IxfYWGVI1tn1zZA2FjT1qQZsL3tfTctx7cmQiJXXBlkwdrb4UmJonY12QNyMAxUdG8k5vKSu1tO+w8FprNz0ASD0fMG83nDCtWNnEAXC+O3EO1w7kUKWFPGTDnsyCB1Y+xewdsaNVJxdv9kcVE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <134609d4-507d-4485-87b2-c59e2c498f45@amd.com>
Date: Thu, 16 Jul 2026 14:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 2/2] xen/arm: vgic: free eSPIs using the bitmap
 index
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1783671887.git.mykola_kvach@epam.com>
 <6d279de6db90c7e8b76fb4da93b8e451a9cf9874.1783671887.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6d279de6db90c7e8b76fb4da93b8e451a9cf9874.1783671887.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|MW3PR12MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b411f59-e9de-413a-6583-08dee3323d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JyartNavquaUhenClcQOfosIsxyPUgt60WswL+gAfkRn/HCMs7u3C3g7LTqQ8Z44qqiCKMA/YQBSNvSvj6GR6/3vX9kbGZZ7GMvrSExugIsMpwDmxrLBf9lcvyAfn/s0OWDGjq3D5CyMReH5KeM/Sf2KAXHl6VtpCsaq4q1Z7VrH/bDtFQdZM7GcghgOceNHi2Lra0ixX4ArvVGEfLL+YA5NTNX8SbVTKztIdwzuZyiG8OzaWYCBG+/jveV0Fs9lMcjHskyKIjkDU9TgsRgB+zFhRKMjdPiG++jgZPt1Z22UQ4ZwV4//gA9c8C2bBPRiBazNLxb6vYX5fpKs9wkYMZNKBPaG2YEKJdeykVhA/umG/tFN3a52H/ecsQ95MNtimKY8VMcOYNToh19Lkbz7D1fS68rjnTbsjOYSaPtgOntCjyTIxo87LCzweBaVJEr2lbLXHdDvfKGbQ3EN7VGrFfSsRnHCVS3UmE9/ufQXdy72MML6/wg32KiRF+ECoEWH2WGE/Ia6qPitdG/wdZRtjnLyP+Q9FkKVCLjytCxnFC7zg46sWvNg4SsLt5nS7jcOc05409/gHgoydn68ilK7o2sjLStpq36OkI+FWN20ikygVeV/FMc+os/vmfGlMAPk0kCwyl7n3eSzgl+de3Huxr6FTYRXg6+a6u5MMLnTQPIDW7jDIa589aYdDKASfbuc2By0eJ4q4RakCt1MnDW7Bg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w91IPVDUYwtl9X9laBfob73NKv+39dJ6rNn5KlZ6gxStUBm8H6sVIzGZtpjqhRBFPIjgL/+A/fCeUfrIg/yqmDyuky7FZBtdDC+iNJUQaVjy9YSIhzxooen+f81NgsNcFGOL+4GN0kCR0nY2mbHVRYkYtvZb7/uthkQNCQEtpyeeF4df2NhNFSnQcIW91DSmbpjlmvpM/z58fgWdFE01Hn8zP+fUmczFdeCkV7ZMURBm0QEqjkVC7ZjkCVNd9U+OHyn57S+E2FLHaxn+XVBbRDP8gBp4rbCRtjsTy9pko4+YXk1QQwXiLIZBJPTBe9tqK8nzKaBnDav3cj6fK/77xsaUxLrXfk59SEc4rdaFc7EiiY81IVwgzrbl6pOmaTUNT+WWP961QMCYqgluMV8sOveSg40M4waYA9CwOsjxwm/hP7+tJqq9IffassVA+9Uq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 12:03:24.9877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b411f59-e9de-413a-6583-08dee3323d5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4377
X-purgate-ID: tlsNG-d62444/1784203411-BCF47757-0A9169D6/0/0
X-purgate-type: clean
X-purgate-size: 1544



On 10-Jul-26 10:31, Mykola Kvach wrote:
> Classic vGIC stores eSPIs in allocated_irqs after the regular virtual
> interrupts. vgic_reserve_virq() therefore translates an eSPI INTID to a
> compressed bitmap index before test_and_set_bit().
> 
> vgic_free_virq() still used the raw virtual INTID. Freeing INTID 4096
> would clear bit 4096 instead of the first eSPI allocation bit, which is
> outside allocated_irqs for a domain with eSPI support. That can leave
> the eSPI reserved and may corrupt memory.
> 
> Add the inverse of idx_to_virq() and use it in both reserve and free, so
> the allocation bitmap is indexed consistently. Also reject invalid
> virtual INTIDs before clearing the bitmap.
I think we can have it in 4.22 given that the release is postponed a bit.

> 
> Fixes: bdde400c6e1b ("xen/arm: vgic: add resource management for extended SPIs")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/arch/arm/vgic.c | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index e5aca17dcb..b85710c6a7 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -33,6 +33,16 @@ static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
>      return idx;
>  }
>  
> +static inline unsigned int virq_to_idx(struct domain *d, unsigned int virq)
> +{
> +#ifdef CONFIG_GICV3_ESPI
Same as for patch 1: is_espi() shouldn't be protected as it protects itself.

~Michal


