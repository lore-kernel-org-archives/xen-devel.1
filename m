Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7FBC9830D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 11:10:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433795.1654150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA3or-0005mC-Qe; Fri, 25 Sep 2026 11:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433795.1654150; Fri, 25 Sep 2026 11:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA3or-0005m5-NP; Fri, 25 Sep 2026 11:10:21 +0000
Received: by outflank-mailman (input) for mailman id 1433795;
 Fri, 25 Sep 2026 11:10:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xA3oq-0005lt-Ty
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 11:10:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA3oq-00HY2H-Au
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 13:10:20 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab6568d-e002-0a2a0a5209dd-0a2a450bc996-46
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 13:10:19 +0200
Received: from [40.93.201.24]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab6569a-b7e8-0a2a450b0019-285dc9182a3a-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 13:10:19 +0200
Received: from SJ0PR13CA0138.namprd13.prod.outlook.com (2603:10b6:a03:2c6::23)
 by PH7PR12MB8054.namprd12.prod.outlook.com (2603:10b6:510:27f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 11:10:12 +0000
Received: from BY1PEPF0002695C.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::a2) by SJ0PR13CA0138.outlook.office365.com
 (2603:10b6:a03:2c6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.12 via Frontend Transport; Fri,
 25 Sep 2026 11:10:12 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0002695C.mail.protection.outlook.com (10.167.244.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 11:10:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 06:10:12 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 06:10:11 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 25 Sep 2026 06:10:10 -0500
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
 b=LE8XpVq2WOW7Ac4kSJx4BBN6EaPaYs2TLm/k8KkkNvvsg9npqB46rSQsCIM5OtVYubMu0DjhmLPw9zPiH3cjtfJJa50rzOTIkL2zFN1BueTofVX3Vv1abzJKJWxAxiuIOtQ//pAT5P0oHYYVrQ53+/GUayGy9396WpYwsSM6kIkkGVoY6PMTbOY1S+FcdmWoKzob1quo/4jNko+kiF5ZoWIboJhDEBvhrUqbC8dBHszUNiYVz8GUOaLWN6f08cjHxbx61YltCz/GqcAwFPV5ZbHYaoX7EQDt5e9lwrQeVucjDwiU/w3CncjmlZ8hSvBXZdOvXo167UfbJwe8ta520w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGXOMpwLctdufDOCI1Vsnq3V+JCTKt9lR9znunwWc7I=;
 b=NHNqk3WCG6umjxo59FRC7trTXSLetpSBdTtY6Q5ln8vMJQqwmuAzGW6EP0KsYt1iAeVHpATtmW3N5LxPG34l3DLkyam89FkyftiELSbKM/9U3dR44e/XD8Fz7UBW3vCU3UK3MZilakbHn6CpLWwjlLXUMx778v2nZ/CqEUBP0belrTH82W1RqoLKzb22qThaqYP82o+gcVM+nRIw9zO2//JdDgi0f01afl5gT0dMQCrwBefrJtQ1PoDmuATI9EPt/SHPIJbUKh5pxmxMHea7Gu0EJNGZOiz3aGu/cB599zRQ1zG+OvC7k00sx6DyYz2BtwkhhoAmwHkcy7/h/ZnZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGXOMpwLctdufDOCI1Vsnq3V+JCTKt9lR9znunwWc7I=;
 b=jr3mzGfLE3zddF46/vk6ZIvTJjQpFo2M30t/hHTMGBsrtlXNAujQj8J/nY6WyNI6Ts2e87hQOIVJ6+aveueuT4IzsjBVnb/tg6wTT2ov1fZgxdT2smugXKO+16x7M2isNyotmer+2Cc2uAdYIHgTni7iy06vY8z3sClebdRZxFI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <49d18767-5e1e-4307-9606-c476c42e6cf5@amd.com>
Date: Fri, 25 Sep 2026 13:10:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] xen/arm: make is_espi() a pure range predicate
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1790160605.git.mykola_kvach@epam.com>
 <8aa55bb41ec944bd249a77959e7702e001a8329d.1790160605.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <8aa55bb41ec944bd249a77959e7702e001a8329d.1790160605.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695C:EE_|PH7PR12MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c8c314-0f9f-4789-2f80-08df1af591c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	hzpdoJKQfYpde9zkS+aHlrrq2q/YL1e24NoPK+MuJLShcn9l+gy6RUjQnnIaY7NnnwPisb6RPM6N9gmTzxcK2fS1CFYrN1UkF3Uv/EDrUuCfsSjxwIUwlyRo0LO20H1OxTr4cjNYOnWTyDex/fvWYYOZiZFMuBwZr3VBQ7iONQx5DSCDnmIg29XOI3ni2uB/OLF8TV2BGPHf3byOoSTrkFTo+ymKgFS5u3h9vJgT0TT7TSqjFPHfHq3qwHW5B9Eqii7N2btu4EfoixcFEkzj3JL2DRiMe/rMsSkhyjkL9jiACVoTK5xxjRhsFOXDt63vqh2J5B+YDSxpPOylNufBWbvMuhLEMhckXRAo6+sYp/s2OnWyOfJfLBCHG+6TGCfWLusN8/SB+qUuKbI1niyO3KbQ3LfFjFLKLMPNkAK//aoYlfY9w04kM8x1rLhW6J70KBG7gp/X+hYZ2VA+Ql8+z1uQJ1uqR0ml5iea7hTT0qZeYHieAk3Ta+W96a9Gl6oDyA6Lg4aIW8Jt8rhENwVApyDrRNvfvvMy6yO7K9fBTJvfLwHJPuLnlPwwhoJadJv/WzR26FGFnrl4IH77pzM1vXgfiVH1OBpgdDLQot9i07tvyvRFdRkxG6qQVOWSyuSjdjKJPnn3x7s/yiPoZ+EZ06daK0EUeeWn6Sj5B4UT8oaDdOzstaPkgh7OyFE3rGsQaiRW4l3GSDdtlDY6KCDWQA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pPVq6yOAwRJYlV0HGjrFB/ZOV8QEkbKp4P3uB6QawD0CVhMIrC3PcNbRCHnLRSLChE0PM7GyAho+nydcAiZniAM5Ly9dCcIOfFt9qoHSt20ZEOSisrElCCMPl/3TIjOI+jNM+GWf2LW5V+qEz78X+nX+Bt2/2RNrtNS8qwX1fmoykfxYrgcY9plBYgc5iLiF6pAlJbZgguUoPMdRtL0I0ZIDCGYmrRU7Z4WUxO9jQxiJQkj6fYXRXcrmjwfuWlYyLsvvEOqT1K+gf02K3FFJt9so57UwPZH1IsJupunJGtYMb4MOcepFMpeDtR4UeF+6nNoIg5cej28m0chrVcyzsh3Id/rd7ejeUfFPQV+FbxQhUL+/V7X34swDvMLTxW+qljswyRCcvFWn7rs8adezXDdn9TvR5tAvESWQq9fKncyAJGqdAvL/Z3P1EzT6My8V
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:10:12.3823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c8c314-0f9f-4789-2f80-08df1af591c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8054
X-purgate-ID: tlsNG-42698a/1790334619-184CB9EA-9D87CC12/0/0
X-purgate-type: clean
X-purgate-size: 815



On 24-Sep-26 22:57, Mykola Kvach wrote:
> is_espi() currently changes its result according to CONFIG_GICV3_ESPI.
> Without eSPI support, it returns false, and its assertion fails if
> an eSPI INTID is passed. Callers therefore use it both to identify
> eSPIs and to exclude eSPI handling when support is disabled.
> 
> Make is_espi() report only whether an INTID is in the architectural
> eSPI range. Check for eSPI support at the call sites.
> 
> Use BUG_ON() if the GIC reports an eSPI without compiled-in support,
> matching the handling of unsupported LPIs. Treat virtual eSPI lookup
> without support as unreachable, with a NULL return from the
> espi_to_pending() stub.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


