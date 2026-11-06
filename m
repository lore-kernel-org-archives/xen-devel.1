Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3DD606A31B
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 01:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RtXOg2NI
Received: from list by lists.xenproject.org with outflank-mailman.1475965.1682369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP8rd-0007vN-Vp; Fri, 06 Nov 2026 01:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475965.1682369; Fri, 06 Nov 2026 01:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP8rd-0007vG-So; Fri, 06 Nov 2026 01:35:33 +0000
Received: by outflank-mailman (input) for mailman id 1475965;
 Fri, 06 Nov 2026 01:35:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xP8rc-0007vA-Sk
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 01:35:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP8rc-005U4o-5o
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 02:35:32 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aed2e87-2eae-0a2a0a5409dd-0a2a45049fc0-26
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 02:35:31 +0100
Received: from [52.101.201.43]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aed2ee2-b57f-0a2a45040019-3465c92b26a8-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 02:35:31 +0100
Received: from BN0PR04CA0062.namprd04.prod.outlook.com (2603:10b6:408:ea::7)
 by IA0PR12MB8086.namprd12.prod.outlook.com (2603:10b6:208:403::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 01:35:27 +0000
Received: from BN3PEPF00022BD8.namprd03.prod.outlook.com
 (2603:10b6:408:ea:cafe::5b) by BN0PR04CA0062.outlook.office365.com
 (2603:10b6:408:ea::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:35:27 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BD8.mail.protection.outlook.com (10.167.248.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:35:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 19:35:26 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 19:35:26 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 19:35:26 -0600
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
 b=nd7FOAq10FNpsa10oEay77hSs8Bt5uhzUr+eELSX/pk+Qs8wCRvG0+/8Yosmp7DaGzWVNvgO8YLx4vOJPE17kDhl4KLZFo7RRsvhlY3v9xAavh+zg9hncSY3naPGSrLmxRRsUupDS7hwG/wWPY2jZ91YEY1u57pFVRWp9Ex0XvrnzUJV0mSbr5koA58pBrj4absJ5QlsogTPj2grj7HaB+aqHRa/NOxzObFzYu6AgNLirtDAmosA++gazvKp3oTLwLBrbDnw4aDyk/pFY8HoJgsHFuHSQgvTbpBoSiWDD/SxROUyr7WCX8J0lv+PHOs6sLZFHmrnvAgc7vKSWfPlCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcaZ+MWzLyUPhzGCw8EDZ+vauIjAxygagF+PUOFc3io=;
 b=ZpagKhjed3cEqD9VEjTs9ra5JEAMvyXdW9reEZ/ineNjaJjGusEoIQA4szmPIoNgLY6GHexXZds7PVM3JzlE7/XvZ8+WG8hmEFVPN6FCK+99u2mIw1P/LoY/HG8jtYnIxsd4e4by9mSQHSh697nQMDxlvGUTKmjbLr4hZn5hFW2OBF8N4xlbIjsHpXfP2VOtW5hfDkRX49xFci9UbYosv95/EKBmUL0xszxLNGXvSFgQYZWAuN76GxCfLMIRFfIrZKGTjdwCVeugvEa3tX+3Ta8IaZBaFTrfguBV7PH5Zw7O+sMY7d4V/Vai2uSmrsiSQgw8Qs1iWG5zRVUFwqUEaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcaZ+MWzLyUPhzGCw8EDZ+vauIjAxygagF+PUOFc3io=;
 b=RtXOg2NIDKv4Nb0GaoukWDO3kPEqjdvpOtBO3bMRCeUClbxwhKSQYXnk1SF/N5esd/TtDr3RzHeGDL2wL2iO1BthQrGG1BIveaTV18Xdqa/qyMO/5WLav18HGs0cnZXrmbfh6kFYy50OvCl0den/O4PjdbObSgVGeIuFNbt+fN4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8045d578-cd86-4c76-b4cf-7a240cc4d806@amd.com>
Date: Thu, 5 Nov 2026 20:35:25 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/28] x86/hvm: avic: add domain state initialization
From: Jason Andryuk <jason.andryuk@amd.com>
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <jbeulich@suse.com>, <roger@xenproject.org>,
	<teddy.astie@vates.tech>, <dmukhin@xen.org>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-5-dmukhin@ford.com>
 <54e0b42a-845c-44c3-acde-6a965f5494d6@amd.com>
Content-Language: en-US
In-Reply-To: <54e0b42a-845c-44c3-acde-6a965f5494d6@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD8:EE_|IA0PR12MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: 72549548-252e-4c1f-5300-08df3ba63c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|22082099003|18002099003|6133799003|10067099003|4143699003|261026121527099003|11063799006|261028144727099003|261102123227099003|261021121427099003|56012099006|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	DUaQBiqvMrWAwoCfFWfqdYF1wpSjRGvw/tnkf4FTl5yqpsVKg6xw0qGt9Yov7hsQ5tspKD0J0pg5Urpw9d5Q/LzeuJ3TWdiCWA0Tok5yB2+08ZAHjix9iW253hzDQPd5rShXd0Y49vP00a0oEpKk9BF1BgVQwBgbHdF7PBVZ7aKEtxIZa4QZllxa4/fv5lq2QypLbFdiBSdz8QTltPCl+y+87x4OpLZBlGEovLl22LvsVrLuYR1VoJ4sxjAKso2K/Aatk1Ams4b/ihPWM72EAMRtFDEuqA17LQamdJw9Uv6uzKR2kGi8OGaF4+pqKKo3Kh7p/lTWH2y3YcviN2wwGHlq49PwXbOlkAQlZsTqs0vvxQ8pZYcuCW3ksa49sdpUNiP32DZtvkRnXzJCZJ2WZHNFkOLZqt01u22+YmRv8ND61Uh1vjzDZqzA/1+PoVFvQwHVTAYiEl4dXdwrqivM3vJrjqU367LkzIoox/yIWmi1Csq1JWNhDFHWJyZc75h+JJdm2UX2RaBj4beAaYn/7aGWMsDdjrZrQLAQ+7V12ydiWuXQCkEMLQQk9Ey0ij9x3dqYaZXbuuutNwN9b5sQ1HFAWsCzbkpwbaXU0HR56o2XI0H24oUl6rddxNacZvMOc5W9ukPOnXsmmX53g4NVF9F0kKlwFwczwzaBOitB31G4hk4u6tPf7DwCrPRebS9IZIm0vaZCDm8fJnS5Uv2GBw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(10067099003)(4143699003)(261026121527099003)(11063799006)(261028144727099003)(261102123227099003)(261021121427099003)(56012099006)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4sVOcafQGoTIH/qscQTKdJSW5ci/5jqf48WFOieytN8031kCnvDPhCnP04AHH/H6YPZfTpWB0zwjoMKqMzXstK5T9ffHV3aTd1cfKM7y9gTAUh/LPsR6eNacUKSCHNJZQsZwFclAME5TVL+lKTEzV3Rx3PSvaWt4+zv6s0FGcUx/IKhgx14/bmAFcGp20POpKmpASPwSQd6TnbKnkPic2awFE60zLajXAoAFYHbehMsL4iwM++FnpC9GclOAeemyL5wjBYXC396RGC3/njFCFcdFClK4BMIuzIO81gQfEYEsY+518AXPB3xFlvSf+l5PU4Ek/uhN9WARYJ9UT3RkbAF1+Hcs+uP+ltD5+UZnPCiq3c93mCG1GWzgeZ5qRVulfz4c0Kq5jNma1om4JNiPv2PLo8k2EtkjWIAtjKveKphCKaj0UYszwVHuYNYMNOwl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:35:27.2151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72549548-252e-4c1f-5300-08df3ba63c53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8086
X-purgate-ID: tlsNG-ebf023/1793928931-534C3B50-12FCDF52/0/0
X-purgate-type: clean
X-purgate-size: 945
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-05 18:10, Jason Andryuk wrote:
> On 2026-11-04 20:33, dmukhin@ford.com wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Establish per-domain SVM AVIC backing page mapping and SPA mappings
>> for APIC physical/logical ID tables. Use MEMF_no_refcount mappings
>> similarly to Intel's VMX APICv setup.
>>
>> Gate per-domain AVIC state initialization behind 'svm_avic=' command
>> line option.
> 
> AIUI, "-" is preferred, so 'svm-avic='.
> 
>> +
>> +/*
>> + * Enable guest accesses to APIC_DEFAULT_PHYS_BASE.
>> + *
>> + * AVIC walks the nested page table to check access permissions, but
>> + * ignores the SPA from the leaf entry and instead uses the address in
>> + * VMCB.avic_backing_page.
>> + *
>> + * Install a mapping so APIC accesses don't trap to Xen while xAPIC is
>> + * accelerated.

Now I have a question.  Why don't we eventually just use 
VMCB.avic_backing_page itself?

Regards,
Jason

