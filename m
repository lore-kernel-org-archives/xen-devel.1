Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C42C56208
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 14:10:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384826.1627592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrymz-0004zs-PG; Thu, 06 Aug 2026 14:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384826.1627592; Thu, 06 Aug 2026 14:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrymz-0004zl-Lt; Thu, 06 Aug 2026 14:09:41 +0000
Received: by outflank-mailman (input) for mailman id 1384826;
 Thu, 06 Aug 2026 14:09:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wrymy-0004zb-01
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 14:09:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrymx-0045I7-9h
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 16:09:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a74959f-2eae-0a2a0a5409dd-0a2a4502ddec-10
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:09:38 +0200
Received: from [52.101.43.6]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a7495a0-6ca4-0a2a45020019-34652b06de94-4
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:09:38 +0200
Received: from SJ0PR03CA0045.namprd03.prod.outlook.com (2603:10b6:a03:33e::20)
 by CH3PR12MB7593.namprd12.prod.outlook.com (2603:10b6:610:141::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 14:09:25 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::73) by SJ0PR03CA0045.outlook.office365.com
 (2603:10b6:a03:33e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.20 via Frontend Transport; Thu, 6
 Aug 2026 14:09:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 14:09:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 09:09:24 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 09:09:24 -0500
Received: from [172.19.79.34] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 09:09:24 -0500
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
 b=Fhipckk14ODah3M+iu7gSTZr3+Ig0ZIvkTY0vt94EUexvA9iVdvc4/wU/XNd4P0T7F60KXOfz/fL7rLTGQgwMa7QrvF35TZELIYZAEC0UxPPH6+YlhQTX8B4/C/xcdZz4IEh4Ne+/A/3e5ecz7f1l29HV3tBcuWqufMsCDZ2G/+TbqJV+LJk6LYGvOSA18P3ZK48rqHu1xe3WjpbQcSsCSdDM3sp5ijhctazKv55bx9c3VlWweLMi0wFEUqrzdFDKDoyy7fbM6GtjGhJWCN9Uv3mG+L8lFsKnRJp45Ps/tVlLfJ5ReT26Mt8+DlzgdSvX7aBa/KhappmaRD+XCU+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTnl1ehLlzrWHapilZ0dYORgkBNrPt2rSXy3za9bZWQ=;
 b=xCmKOP8vnqehGKTrcRLz9Hzz+OpQ7iF2H4wCKHn1/9qS94l4osWOG0RqouEATG2EQmiARUNoCnYlJi627OhQFkW/C++XZbeDzFIyEsI78V+GpwQH5CEjZlVTna5s3yaQTYdi13HaSl3FBFeshEwSbn77DgUpKxfAi89xHzQbh3qaVglmSqdS8FfpWdcVxDH6cpZGuuLKS1Ztk7vRameYhm6a7GBxbF+ngxFikjs8xOLXALcfUdcpcLTHRJo+/vF7/a056zQRsww4PO2x5NXISaxWF0wrB6PGIgrEJIoX5URjQ81zDPf8IAl9zYjvVrdULYwRtzqWSvK0lnaIV/QtoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTnl1ehLlzrWHapilZ0dYORgkBNrPt2rSXy3za9bZWQ=;
 b=AXzJ2L9BESrjHHLc8H1jmMT5u7t324uyHtXMWrQmnE1Wg/0aPI7RM43CcJM/sF9eoldLyrqY5MESySZuFDhaudHrFIcMWieN5PoanMi5b1ctYaPMNIaNHbUH3oSaJW9HeN1FPFCq/QELhkA3tjJ/6PCIGWOtIr6d30Nay6FnUxo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <29546ca9-1875-4c20-b42b-39c886f3d41c@amd.com>
Date: Thu, 6 Aug 2026 10:09:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/24] XSM: make Argo hooks well-formed ones
To: Jan Beulich <jbeulich@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
 <4bd4e7f7-e005-45b4-a543-98597a9de707@suse.com>
 <6991badc-dcc4-44b9-a048-29eb67c46d2e@apertussolutions.com>
 <7762513c-0d3a-465a-abd9-73e3ba586556@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <7762513c-0d3a-465a-abd9-73e3ba586556@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|CH3PR12MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: 9101fe5a-ffa0-47c3-15e9-08def3c45222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|18002099003|22082099003|13003099007|6133799003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	hKBiHbgit6k4kFJ097hW7JSzVb3zwUdux7kATasSulqR6VowylzBdYQkrZp4huXes8ZdiStaJnfvwosrmJpnbbgq/cTaew1ECHht7i25Ihc3ieFUVKlD9UTLq9f2sWGj2LD10RTXNqujUmaZpJ7cIFitLB75rzB7cxWIhGZQ6SXlSWW72n2rKmYhoKB9HPskQ2vwGZxaf9j9dIugCtVJIS52LmIfhbH9gJ0omFSA8My/gYUZmA6GYc9eXRN8WNexqiHix7VFUODshdfuLqWA1bj6YN3seVKob6VjObKAIJqoPNWAFzWCHMVOJ9uU7aHbZfl8Bg5ik9ic92IwKnNysPhGxEyj2isU6+uzqgrWKRjkCYabDZmktYqZQFUdTwMSgBs4pv+DQnATIZf7pNvtweL+/me5MUUPR+RX/gv0/+PM5+AS6YDv6sQ42aXUDC2d+bDqQj5b6HX00SdX7CadTczIqUKFCwNmeB53egNQYfAtMsNeDQ/DuQIo/4nqtdUJDaiz3GMYdpuudb5q5W46vBDcL/+sHH/89OFIo3au8/ErewqawoFPz7ATHtap+nntVlk41QBkuPHgEMrOyexHzaQYbnI0dzAv2tVu/fXePJwzrrbYNL2cjacrzeS140KSmXi8UGcNY4EfeU9a2IP3yE6DaHS0xFjEO1oTmd3USO8cM/g2qTgzs4s/dO4m4uzMBT4xjrbPh6Ivs4dQpdO3og==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(18002099003)(22082099003)(13003099007)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BpZliNvyeF/EbtP3QEncxDe//U4smaiwL6D0lijgMAA5V22EtZIsDmjn9p/z4AJx3qDolcLxoHD6h3DbzjZ0OyJo8hbsSoFQF+n9yPYjfQBJ9lnAAvThJt78sDF/OSOWquYUIzVt3Z3713nL6WvQ/aDcKQWH93hNvlQ2rAIBUK9SmeGdZolbZXircbo17L97bXcbeL0uOVWFSCndPOlku0nse5QKJul/B+wvKY/iNZQZteMEeyQpey160QGQHiivWalOOC5Py2G2Vx2HM83WjD0XiGzpbZaFgVH4PONB2AKFwutwA0P2GOS0JH4CHwXHvOpbiom+bO5rKvGoEIcJ/pQTwPtw8Pn2FQnY+NDJwDXQO76hgzZ+wbGTShL/km0PHcRWawiTuimUQlLn24GEn9MjOw5n4iRr9Mb+mnFYdwVVxXgbhp5UhI1tXcPc2USP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:09:24.9445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9101fe5a-ffa0-47c3-15e9-08def3c45222
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7593
X-purgate-ID: tlsNG-720697/1786025378-F38BC2AC-692CF31A/0/0
X-purgate-type: clean
X-purgate-size: 2036

On 2026-08-06 03:16, Jan Beulich wrote:
> On 06.08.2026 01:02, Daniel P. Smith wrote:
>> On 7/28/26 9:22 AM, Jan Beulich wrote:
>>> @@ -2307,7 +2308,7 @@ argo_init(struct domain *d)
>>>    {
>>>        struct argo_domain *argo;
>>>    
>>> -    if ( !opt_argo || xsm_argo_enable(d) )
>>> +    if ( !opt_argo || xsm_argo_enable(XSM_HOOK, d) )
>>
>> This question came up on another thread, so thought I might point it out
>> that when FLASK is in use this can return a nubmer of error codes beyond
>> an access deny. While I know it's the existing behavior, but if the
>> error code is anything other than -EPERM, then it's not that the policy
>> denied the access but something cause a fault in the security server. In
>> that case the domain is still being allowed to construct with the
>> assumption that it was a policy deny. At a minimum should the error code
>> at least get reported, and perhaps it should be passed up to domain
>> construction to allowing it to make an informed decision on construction?
>
> Sounds plausible, but definitely wants doing in a separate patch.

I think this is a mis-use of xsm_argo_enable().  As I wrote in [1], this 
isn't an access decision, but an ~optimization to skip initializing argo 
data structures when a domain is not allowed to use argo.

With Flask, this prints an AVC denial during domain construction when 
the domain doesn't have argo enabled.  That is misleading as it isn't 
the domain's action causing the access.  In OpenXT, I wrote a patch to 
add a noaudit variant to hide the denial.  I didn't upstream it because 
I didn't really like it.

The issue is really the conditional initialization of d->argo.  It seems 
like it would be simpler to always initialized argo for all domains. 
xsm_argo_enable() would still prevent using it, but internal checking of 
d->argo could be removed.

Regards,
Jason

[1] 
https://lore.kernel.org/xen-devel/758c8410-a18e-45dc-8944-5913e5832397@suse.com/T/#m149e1571b819a0cf481eea558c6220a5a24d5285

