Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94867CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 11:18:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440751.1658193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDgiH-0001wY-K3; Mon, 05 Oct 2026 11:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440751.1658193; Mon, 05 Oct 2026 11:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDgiH-0001wR-Go; Mon, 05 Oct 2026 11:18:33 +0000
Received: by outflank-mailman (input) for mailman id 1440751;
 Mon, 05 Oct 2026 11:18:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDgiF-0001wK-TM
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 11:18:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDgiE-00CFYe-M6
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:18:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac38773-8faa-0a2a0a5109dd-0a2a4507c1d4-20
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 13:18:30 +0200
Received: from [40.107.209.58]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac38784-b4ea-0a2a45070019-286bd13a2532-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 13:18:29 +0200
Received: from BN0PR04CA0069.namprd04.prod.outlook.com (2603:10b6:408:ea::14)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Mon, 5 Oct
 2026 11:18:23 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::29) by BN0PR04CA0069.outlook.office365.com
 (2603:10b6:408:ea::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 11:18:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 11:18:23 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 06:18:22 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 5 Oct 2026 06:18:20 -0500
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
 b=IcJwrJavRaMXGsF7AN+HbqM6K6J04CPb4tk8TJtXx11WBehWEBuLWLht3kb8+os99e+1sHG7YHO6tlsFXJHj9SMQQs7Ny32pINBaZELPKZTKaUhVf5/pD/eVwDH6RZgz2BrFJ3xfd3bLi3Q3jiprhlxqezMRYTDv24vktcp2r2OBmdbLO+1eX54vHru5z7ZBzYpwDfS0yyK515HW/rzXq2/1Q7jBNnGLcN9n6gOXX7Xb2Yo/ONlPIMJl88KCKMzrH6dxpehA49H5yAHce0IuHPv+Y1gzHYg7EmUkvppvyf5v6avJTlh6vdSpS5sCYwP1BMg/U8AMrC1QG6MCiapQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pO0A2nt1kh4fhy/HQuaKlMRaisCjegx2Wo6tPOv36cU=;
 b=bKEeuDNQt1ZoZINmi2uZS6ephep0Nyp46mD4nKaFT+SlqSvhE0A2ryR57/5h9k/LaZ1g18sqfI5y5zvX0ZvV+QEYezGJO4t+Xm1undchFyP2tftzQ7NHxOd3LI+TJH/OSkcJsfTfWdfBkH8EKtMY1NE19Do4sa8Kdyb3SBrN6O09XLcXy8NyKN3tu+xL5KaDfd44OHpSuodio+rMP4xixjVxXJkz/RonB37ZRaK+hAaxOzkjGHcoHnaSJHQLxjKsWazOoYjTrTlF+CNIXZyo2oMf6qVW1dfg2DPFEi+5NlltPIROf2borIdBdDjovQamZAlhXCfC7Mq69yMMo79eJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pO0A2nt1kh4fhy/HQuaKlMRaisCjegx2Wo6tPOv36cU=;
 b=Kpzbv3vHCa+NbFBKPAS2aKP7MB1fPPMFKdSZ12FA/BI22xQAMdMf+5fTtmOh+Zb44iQ4C1ULHH42pbqRx3IEXja2OXYjfHBrun5+UOEtGuanB82RgrgQorS58gQY0WF8uwhIJo+swYS+MdUsxOwj7w71kFcryIqx4T3dXbbXvdI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <593c8714-44d5-43d7-88d9-f5438112e467@amd.com>
Date: Mon, 5 Oct 2026 13:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] common: dom0less-bindings: introduce XSM labels
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Sergiy Kibrik
	<Sergiy_Kibrik@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20261002102521.565675-1-Sergiy_Kibrik@epam.com>
 <f24de507-2aac-4619-83f8-37e66f93cfb9@apertussolutions.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f24de507-2aac-4619-83f8-37e66f93cfb9@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: a28b79be-361c-462d-d923-08df22d25e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|56012099006|11063799006|10067099003|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TF91zb3u053jQ95ghk7zsLlMMabqEWcUS8cmEjsBJV/iTFDbpQlQyxnMVNc8iGE+19HMW8ASK4dwT9TZUx+skt+ubEe/81TjgMGJtR8jqxUTnH1hcKq7mjjzvRFZePBjLw7Z3ywElZk/f+HUrWXHL/RgjI9ScKpZxQM3ZYX8wGqqoNfaeLZlI37ZrycTq9qSe/9nFhtg6ccI5q69iZrD+fX/phAPRNabRoGL1DcJ6TrLC+5ZjDMvpfNTxJ0QTE1sHoMuC2aUY5WCtfaav9MNb0B1tshw9X883B1kbKLipnrDu4GorXyd8VvEOD32+yh1WRoFkGvLJmWcenXTYmQnPzuuICGg87ydMANXXJibtJzukUSa7wT0bkHoMFGQeZcUx73yy70kn60lpPjTY95P0U6ubaYrHjy5+AX29e6hem/OHhhKxziLi2aSuiVbAnqSrg+9DXqDFSG9KavSLNkhUy+VAb71SEbqf10sVf2NC05RiXXUOLlYv1juuVXGrpbyTodXMKUNxGp6TF7OnGAXm6zOdOGLgERJBQXmiIDB5K2niJcWqRh+Am3bp5wHnyvM3bf4M1jzuSsKP3quP5eU8UxWulso+BvciV2kgzXKzA4TAFk+KMT4NnGl+rOgFkkQ+JBlnovh2pwGbJKHAIpa8KsIyBE7HqBw2ru7DYRMuuDFs7FZ4S09ScatAQRs8yd1/UbX+bguz8KIbQlRME+FhA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(10067099003)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YeZxgSRB2dyICOEjvMCNAkXN0beNzCYze6eZ7tLhVMQB7M7rBFWqhJQezoomZOgjg4vFELbL6jkabzufPz7kvTjsNdMa0hbBmgUm/aBcKWF5vEXi/62bqcW3NGqtjSUy4FbGfIMSeVpxA21dReisv+ANVY5U7DI26Kx6ZRE7JTXp/FfuqKVpA7xZi4GvZ+V5MTmsi4Yo+DzXehpdNU1RE8NZikKn1AVwsJNcqv3WsLgZnfP0is/d0wAnY2F+DMwOUzsAgtQ2rFF25KrcKev6Eld5A/dyia4ywfkrpqaEgd+N4uBCI3bz9iBmFU02gWGxSwDvvUgZe/aacURLs71D6tvXOUA1s3chiEq2JZ/B8yxhiI3WPsOpG8r/4hSbWFcAXvPAUCvXKpA3433cBRcIkTpqqxBCx5qqkT0wkswc8pkJqiynksKxIbvJgQtfkKP+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 11:18:23.3773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a28b79be-361c-462d-d923-08df22d25e85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955
X-purgate-ID: tlsNG-ef75cf/1791199110-A78D1AE4-0B7FA80E/10/78276251493
X-purgate-type: spam
X-purgate-size: 2747



On 03-Oct-26 23:34, Daniel P. Smith wrote:
> On 10/2/26 6:25 AM, Sergiy Kibrik wrote:
>> Add "seclabel" property to be able to specify security label for a domain
>> when XSM Flask is enabled, similar to xl configuration files.
>>
>> Currently guest domain can't be created by Xen in dom0less configuration when
>> Flask is enabled, as domain is assigned "system_u:system_r:unlabeled_t" label
>> by default, which Flask denies to create according to current policy.
>>
>> Because code from outside of flask can't directly execute its internal API
>> a new routine flask_context_to_sid() introduced as part of XSM API exposed
>> to rest of Xen, which is a direct wrapper for security_context_to_sid().
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> ---
>> changes in v3:
>>   - panic if `seclabel` property found but FLASK is disabled
>> changes in v2:
>>   - add & use flask_context_to_sid() wrapper
>> ---
> 
> <snip/>
> 
>> diff --git a/xen/common/device-tree/dom0less-bindings.c b/xen/common/device-tree/dom0less-bindings.c
>> index 41d72d0d58..01d5cc1bc9 100644
>> --- a/xen/common/device-tree/dom0less-bindings.c
>> +++ b/xen/common/device-tree/dom0less-bindings.c
>> @@ -11,6 +11,8 @@
>>   #include <public/bootfdt.h>
>>   #include <public/domctl.h>
>>   
>> +#include <xsm/xsm.h>
>> +
>>   int __init parse_dom0less_node(struct dt_device_node *node,
>>                                  struct boot_domain *bd)
>>   {
>> @@ -21,6 +23,7 @@ int __init parse_dom0less_node(struct dt_device_node *node,
>>       bool has_dtb = false;
>>       bool iommu = false;
>>       const char *dom0less_iommu = NULL;
>> +    const char *xsm_seclabel = NULL;
>>   
>>       if ( !dt_device_is_compatible(node, "xen,domain") )
>>           return -ENOENT;
>> @@ -141,5 +144,15 @@ int __init parse_dom0less_node(struct dt_device_node *node,
>>           panic("'llc-colors' found, but LLC coloring is disabled\n");
>>   #endif
>>   
>> +    if ( !dt_property_read_string(node, "seclabel", &xsm_seclabel) )
>> +    {
>> +        if ( !IS_ENABLED(CONFIG_XSM_FLASK) )
>> +            panic("'seclabel' found, but FLASK is disabled\n");
> 
> Ultimately it's up to you, but I'm not sure you really will want to 
> panic here. I personally would warn it was set but ignored because FLASK 
> is not enabled.
I explicitly requested this in v2 to match the user/Xen contract we want on Arm
(we want to panic on unsatisfied user requests to prevent silent degradation of
functionality).

~Michal


