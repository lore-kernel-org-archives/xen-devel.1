Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B7DCA5FCF
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 17:23:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438550.1657277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKV3-0001dh-0G; Thu, 01 Oct 2026 17:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438550.1657277; Thu, 01 Oct 2026 17:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKV2-0001dZ-RZ; Thu, 01 Oct 2026 17:23:16 +0000
Received: by outflank-mailman (input) for mailman id 1438550;
 Thu, 01 Oct 2026 17:23:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xCKV2-0001dT-3S
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 17:23:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCKV1-002dZ5-Ge
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 19:23:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6abe96de-e002-0a2a0a5209dd-0a2a4502b058-44
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:23:15 +0200
Received: from [52.101.57.26]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6abe9702-6ca4-0a2a45020019-3465391a5c87-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:23:15 +0200
Received: from BN0PR04CA0067.namprd04.prod.outlook.com (2603:10b6:408:ea::12)
 by BN7PPF521FFE181.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 17:23:09 +0000
Received: from BN3PEPF00022BD9.namprd03.prod.outlook.com
 (2603:10b6:408:ea:cafe::d) by BN0PR04CA0067.outlook.office365.com
 (2603:10b6:408:ea::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 17:23:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD9.mail.protection.outlook.com (10.167.248.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 17:23:07 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 12:23:07 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 12:23:06 -0500
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
 b=uGxO4J4BeAP+6ahVNK0dMHKA2PSHQ78M81I0RSTAQ8MbdK4iZFrSxgYOT3JkgFAg2uP4x4ruJevMAv+yF5/yaJxUYMWyTwcZpIiiFLjPv4vlPkQ/jrwHaTJwC6xfql80v32JPrBaHdHmG/kRTLwkjfVG/rNoQUI9XXSDdw8v9sIUlROhf1mnR7XA8yvK1IEpVd6jKqvMdLxN7CCHOMvbmR7hnuJUxzcU/5mifWcCvtWBABjxVVhuFZJRhWTTdWEMPa/XFUVTH5YilbhPos0MkBkW1wSs+K2kzBYNLmeWOpPBH5oUhlBtGJP/aAuthEUvpwTOXR5Jw45otqonqxrBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byujvlaxq/XJAD/4iY30AUAoGZuJg1GXVhswLT+FXfs=;
 b=Ke+xk6A/E66d6+ev/lYcp6aR0TQC5KK+EL+Ea0LpZthe6ZsA6oG9YWRRL6N5DHhQ6+w86fg8j7sg7g2UaeM8OM2wdFQiuM5lXZaNP7uzPSBxbmsKbLC6qtpoT+9Z/VluraIUNVQO9eS18rfgK72T5Dz+x1mQ0ZuYFDbOw1WPYNCOPf0HXrSzGE5vvIWN4R6iRHtl1rMD8VV2OmofPcKa1kM8kVuq6kudWFS5SL4apRDtDJsv1C45mpM+hzhhDvhkadRDUpC2Km72URX58qMFYexnvUkKBmwWjYAM6e8LD/cJHTfgWqiksMZ6CBSUWzCGO6ZG6Y27swXZcBjPSv9dnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byujvlaxq/XJAD/4iY30AUAoGZuJg1GXVhswLT+FXfs=;
 b=3GOPl/xRQC2rL1e/6zAOD1CnHr3D4jPJenSELJsv4YhqTAU+2qxIwphhnaagEK1/LbKTIXkpjUJdcNw++TSJgKNSA5A/RfUpPZuzgNuTBEuwkSTR9hwr1wDH1H7Mq9RrkmQJ+QCn3uaurUTJrK19v7dAv24I9NSDju9C5bDGulU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a6da1010-32e7-4419-84de-964ea5cd8e7c@amd.com>
Date: Thu, 1 Oct 2026 13:23:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domain: restrict context switch hooks for the idle
 domain
To: Roger Pau Monne <roger@xenproject.org>, <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <20261001142757.98255-1-roger@xenproject.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20261001142757.98255-1-roger@xenproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD9:EE_|BN7PPF521FFE181:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b77616-b383-4764-7483-08df1fe0a901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oN1/xVblj9X6dE5Di7+51NxrF9S2VHUZyJiYvKkxb9YYar3bjPfr7l0vZfWTwyRohzlCLWpvHfV+wloHTyzN2gHOCjV1+O6oi03aiDcqT1wpYOjvQY3OP44wURuL+y41zzpRl/FV4kWLgqYHpwzhQtpNFGZ87irylgZiayxB+ZVYOrtGDMAbWC5OP1u9CO5wh/iF7QpDKPQL7Z0GWZ9NBHtBPXRm+cRmXAQRMtSr9ob0e6B6wGLLFv8ox4pSX0Pik0MLpSygpfT8qFpO2uGMaSa45f5nLm11ogHYp11xFxaMWIyio5gmh4JPzsu30h3T6iFeChilXipFESgcDg05TRqMEzp5f7l/2VJKykL+uFq4PylKxOQPtm+ck/+j6vSp1OTsX6UzstiZnIXLlz0D0Igh7vfeY1gK+HaxKPkHS61XMF9SnOALldXrrG6SOKTdpzhZY3N0P3oiEfWmeORTD+JcBMKoEOQ1RsYd6JOnhSpn0GaadrnReGcfKeSic22FNCkMRyoUGZS5W5FgI6phfjcLYonlpU1qp+c7O7+XHIdSkzh9lf+BXLfOFulK9zutjY8sCQO3ZrIFQmye40vUTnmRTcmPPitGZEo/HDGSmzxomA0/9Qm+iLjYSuNpjZwUufmPq0VITUAc2NP2rJ2DGH6EERTCm2o/UtN47X2PLSxK2uXZqDjlsE36EHlfUHPsHYsygCTkjALStSIgtheQUA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PVhWbEjxY+/CHd3SXxcLwt8c3Yy8uyb2M7coZ2NeVgpP7zwTat6q17QIJJZQc9HDraQwar6XEAN+2yl2wIEZYo5E4kK5K5EtIdSrsbyRn/Hz9AnSDxwtpubfFueeX9FdCUtugsjSxqccWdJ+uySyEN4ETfOANSAJWKc156OI4JcOkhnLMFWDpzJ4eqnfSvF+5O7QYEs/yn5tr7Eo6ohmXhXbxdyRmRU00MDNQW+l1OXiHurcdgw5GeknZB+ASDKYddTs2VbNO3xXnQc2MrjxMShCe52cVqSu6T3X8aya2CNIgTQlA977HLevE3WE75mtnjgu4G6Kx+zEHQCBMDeOlJX8UhzHYHELBtX4dHMjqPeTWjftU3ZHSwy86wnP8qSJ8677MqK8mt5p9qALDQqwWSmAfdeP+RadhXm9qGvrJSZZ92+4DrCqNuCbtuhkW6VO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 17:23:07.8013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b77616-b383-4764-7483-08df1fe0a901
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF521FFE181
X-purgate-ID: tlsNG-720697/1790875395-664B62AC-DED1FB9B/0/0
X-purgate-type: clean
X-purgate-size: 822

On 2026-10-01 10:27, Roger Pau Monne wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The arch_init_idle_domain() initializes struct arch_csw idle_csw as:
> 
>      static const struct arch_csw idle_csw = {
>          .from = paravirt_ctxt_switch_from,
>          .to   = paravirt_ctxt_switch_to,
>          .tail = idle_loop,
>      };
> 
> but only place where d->arch.ctxt_switch->{to,from}() are used is
> __context_switch() where they are both guarded by !is_idle_domain(pd)
> which makes the callbacks in idle_csw unreachable.
> 
> Drop to/from() callbacks initialization in idle_csw.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

