Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9876DC624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 11:51:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405747.1639198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jV2-000207-TD; Wed, 02 Sep 2026 11:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405747.1639198; Wed, 02 Sep 2026 11:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jV2-000200-Q3; Wed, 02 Sep 2026 11:51:28 +0000
Received: by outflank-mailman (input) for mailman id 1405747;
 Wed, 02 Sep 2026 11:51:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x1jV2-0001zu-4y
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:51:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1jV0-003y8w-G8
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:51:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a980db5-8faa-0a2a0a5109dd-0a2a450bb97e-34
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:51:26 +0200
Received: from [52.101.62.2]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a980dbc-b7e8-0a2a450b0019-34653e02ffd9-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:51:25 +0200
Received: from CH2PR04CA0003.namprd04.prod.outlook.com (2603:10b6:610:52::13)
 by SA0PR12MB7089.namprd12.prod.outlook.com (2603:10b6:806:2d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:51:19 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::58) by CH2PR04CA0003.outlook.office365.com
 (2603:10b6:610:52::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 11:51:19 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 11:51:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 06:51:19 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 06:51:18 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 2 Sep 2026 06:51:17 -0500
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
 b=lM58aMhmsHmJ1vDgauCEpwFa5nLe8jqJCrPK5B6p5+ixtjX8EhlBwpET9pOzuHlPVvWI8KeExxbbdU8TFoEBZKp9Pn6uiRw92K/FqaEQMKJ0YReK63R8c0F8axxBedyqXmmEgw9VYPH1BC4Gsdvd9QROVEfUuMDAIS5XQIf0eoZokkxVWn1N9Mwt/CVpGxfFeo0809G5gswkfgyT6DNx0QVyPFBLV3KtqF7kG08Jtot2nDgkrpI0KqOvmzlnegnQPSTOgqGSF/lE5VM6SUpNYGo6dL3RarI2S/RqSVrVUMwvzHwa3vC1ksrAi+o3Q8qGmTw3TQTtLy08UhvnK82GUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGiXrcXZYO1zW8wBNQqXBAtHNViTp+1t2bPTUOtRa4A=;
 b=HLiEMeJVZMfanH0SXDFzoX+OQpAkDo+cgC1SgH6aQTZ9jEZ+YcGv0H9Ut2H4qg0P6LPEEqS5icHtpZqww7m4d74uc2h/7VH/PTsdTGNh5vSVmgTNeEB+cVpT27Qxhi5Vff7t85PxX4BShfIrdfPwuvJtJ5AHCLdePbb+ZEyP2R9Zg0iXvseutuPg/MVCdhnEHflO/fNtWIUV3SFH5KsyrAgCXPexK8KJW5u0Xe0MZqHRBQhTFg4hB6YHME/kdFzmk/614pCmVqKG0GFQwzEQP339bRn05ZVfyhhPXFrsLvXGj02ZG5M8+ph9p2jPUi9M4KW4ysqurtp4BF5XJlswJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGiXrcXZYO1zW8wBNQqXBAtHNViTp+1t2bPTUOtRa4A=;
 b=ODHvZZqJERZiHcrimJJJN1m7Cqo0ynpz1n4MEBqE3Mwev++e29FlwZd4xaA6NJFOMUG9hM04tvYynIc2WAU8vMRqTj79wMUWdceUGVcYaCw+xOoVmR584BuqR0uINlSghkfqUu0QxmTUi9jdFdDsYC4K2CsjY816skZfucj7Rw4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <90239692-ba75-409f-8342-b3b0da7cd221@amd.com>
Date: Wed, 2 Sep 2026 13:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm/bitops: Drop unused ADDR macros
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20260902114339.62043-1-andrew.cooper3@citrix.com>
 <20260902114339.62043-2-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260902114339.62043-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|SA0PR12MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 0977e0e0-d0b7-4278-9fac-08df08e880b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	diGNmy3MhZ7ZA+F1I0bAWaKjj2Lf7MmWNfXc4DUmL1+pB+lqRd1WlxtwSWtM5ilrhfqhGqiMApdGMwHN0YUutEOGSC+43I7UdX7QnBZdOhELJFc8l0eMDM12qTSDv1iDSCvNO/EpMAx6OrTxyg5ef/XAIYDHQcqlhhHM5g0XGvX2kh60r+MR3mJ0vyT8R2gF23EZMcEIstbL0ZN4Muv/ZyWmqGgwCveXiiNU3xOkr3IWnM/1iELKcOuPDKVWN03T6IgL0FaqiOoSRy+INSaEDCOhN7JwQvxogLDAPLiyOfyPQ7gzAww6Vol4mvaEbpHk3fnE2vZiAQhZ4OFjPp6BxH3UnWZJsZR2z7pa4rsy832TGqGURLD/NuWIlwM98qKLDo5WkRLlv+PRI/jq3mElTM71DV1MDexivxTpdtMzsyYno4DsCfrO3++N+IvUPWQxh8tKBszd6a2/MoNtGY4RD6DfhZm0Cn6G2wyaMoSCFDbC4a3JYmYuLMcxPP7DaniojuveildQFI7X/X7wDZXsHY+mMA60+mGijpWnQKqFb2jO6FiasttVF18E11kLVIb9ErBTI7Bc3whRtUUh/fuxQnHM08gYEwiQ+qvv+O7K1r9lSIPXOl24DZubFmvQBVJj3ac/RZa7scRZZhTUGGdtNRsDtYbDdRrRR0O2bYtvI3WCMmb4CC0sWSEIvcDiKOoIHQvOKv3THErVb+xDG7WUgw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UtMLDgeqKrNc9ab6olY2HhBklEPhOj6aCfZ6emNXpWMaczxFk3mjQB9e9ndOcGXOVMmqFkHFpiP08qA3PJkqbgA/YA7Xd4w61R/d7P6kS7D+HRnF378y4BMNgwAS0QHZwcTVl2ZXSW/agK7gbJDnRJkZK3lCr6OhabUJi2+9Z/uhWkWOyd42BYUlBpfpzy18VmamlWVt3JJHvlT/+nW/CliHdPL9ByS4zHTgpRs7xRuVdmjgWzSFQ+xdlUuP9ZU2A3SfD3imljyTTrUNrNK2UQiCZ27SBywH7EeS6IwiWNcrpfnPhRT4jXP+aULv+iuRDYW6jJkEiUmGirkGQ4xUK4US3EA1WFvGlLbw4TijoCtLZtNMVv/XrWAT5hZYcQJKV0/wBgurnmCw8v0+hYWceUaStIan6dwq16gQWZvJjChNBCuhQBciw6ZnOG32BJd6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:51:19.4093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0977e0e0-d0b7-4278-9fac-08df08e880b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7089
X-purgate-ID: tlsNG-42698a/1788349886-A84CB9EA-F9326B50/0/0
X-purgate-type: clean
X-purgate-size: 230



On 02-Sep-26 13:43, Andrew Cooper wrote:
> These are unused and do not want new users to appear.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


