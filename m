Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F633CA5FAD
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 00:00:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436234.1654972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBLGx-0001ZG-Tn; Tue, 29 Sep 2026 00:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436234.1654972; Tue, 29 Sep 2026 00:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBLGx-0001Z9-RF; Tue, 29 Sep 2026 00:00:39 +0000
Received: by outflank-mailman (input) for mailman id 1436234;
 Tue, 29 Sep 2026 00:00:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xBLGw-0001Yz-GL
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 00:00:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBLGv-001Bat-TS
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 02:00:37 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6abaff8f-bab6-0a2a0a5309dd-0a2a450b96b0-24
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 02:00:37 +0200
Received: from [40.107.209.64]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6abaffa3-b7e8-0a2a450b0019-286bd1406b5b-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 02:00:37 +0200
Received: from CH5P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::18)
 by LV1PR12MB583771.namprd12.prod.outlook.com (2603:10b6:408:508::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 00:00:33 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::51) by CH5P220CA0020.outlook.office365.com
 (2603:10b6:610:1ef::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 00:00:33 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 00:00:33 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 19:00:25 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 19:00:23 -0500
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
 b=q+Uq9sU8z1qOvHlKp+0l/8jBYiotbsPrz6qzOYTgF7vxfjhcgtG401Sfyon+7NN9NXBvWbknYSuRs+HIRqnXDwu+lmI0N1ce8UA9PmYxWgAboJYpTSmypgUsLEHjZe9ymAzs8IB6MR7lAAp/ejCoQlDbasULsSTvBdBT6NZYcREB8W3Rny9Vy0zYQNMh3ITxk4Dzg4E5NrgVPO5E3HoK6d9+pG8f4IRlkFloaHY43Jc1klzqxXbv6tdAiyzgHz5S6NRDYo7op1r9DwVWF2LehVZJBkO+H7z3NPPWQojdaMipEnBOA9iF17wU0jvStfM7OQQ57IL50iK51TzRF5cUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yJG9gXuvSGW25gsPMiE84y7H+GYImR0+UQhWWc3IEc=;
 b=LZEN63OH9cjI5i2VjWL5B+noSfbN7nCv9sd/pxLgTZtPRljU0Na0PlBJ6yOt8pEBaZs3Ef/CUCdAIKS/gbXKBk7GVtxFNQoMkXsvCs3eO4lfdMjXrIlO5WJm3RoEAgiWZha1Hri3ueMMfnO8mzxkqtG6xIDbPfLQ+FxEPtRCelcWvcjt5b55zBCRdUEu9yzwQg26e8crevHmWZdEjVWdQBZqdVq3bhizDmayWhonPe6rq/dUaKDgKt3Dh1blFD/ORZgLv1gL+WYRPivs/Kb7Kzc0n6i4Cak33ySCfFbIauGs89CA7oNv5XOWrkOL8JrJaMd5S+oWYZda/FG6WdGQ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yJG9gXuvSGW25gsPMiE84y7H+GYImR0+UQhWWc3IEc=;
 b=B6IGR5++D6hSxHbjafu+4rI/5NwBZHtYc6Ozim/s7f+TFDsWldVleULKeGsFFNrzel1jIi2xemxWnIDnA307WzbbwFWikPg2TWWPjyztHdnAHIQTxMYcFiVbFQoOr/HOzVNFHYVcgou9m4SoNsTn+YR4XHo+2IC80+1g/6A8yYo=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5d97d5e3-84fe-4ddf-8fad-af99109e65ab@amd.com>
Date: Mon, 28 Sep 2026 20:00:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/svm: Use C99 types in VMCB struct
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
 <20260928140248.1543013-5-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260928140248.1543013-5-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|LV1PR12MB583771:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f23f93-c549-4c8d-6278-08df1dbcaeba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zwku/3RIA04s/q35xNrlnhog5xDD+61eWupAIg3llebdqK/4LupwRWTJ1SeX2Hvf5oSs1JG0490deWOj4xT8plFQBanm5rcnthNWcxlx1w/l2YeQmaZpoFxFwA04naigOPgg/Fx/Ksfk4qGaNv7AVHIuWIDMZgLcott/q3TAgZVovOlV40Whp1kXpedcQZTSh9ntXpbAMWzxD4wxNhfsz+wraJKDHkH8ou9uTkTbHim2dWvx9ISo84U+dNaI3iCW4j4H1lYge2+q7LJfNZK5Xw4PiDnuu+8UpHf/X5lW1V+2PU15XS8FGIl5s4emCrFPzbBWrZaF7SKvLGMHqr78CkIT1sTHLQzB7964LBRUNC6XU01vlUtYkrej48T+/1YFrw9SWOfykGNoWQzRSEJWui4nXcNgP/UnRzmyjE/0BcyQarEkcDwX77Hqp8y9t1KsjK34t7a9pPK+qFMu7cGCFabtoLqw6gINXFz6wMPXZfzNncetliArlhg+pNKMtDH59h4p9pzBMbgZGWM5gsGflwWKEP/lKDirsWM7xULOU4/w+BJZmCO60BK+aBjsKiDF19PE6CN6NcGEr8MEgXzkbPVRt11/NfrEsj6HAkgylZd4OsczA8YpwijR5R/W6PRBfaihvPCl5g4RbrY44H4pj5KZMgICGUzcXHZ6LFjIIjol0BhdxonvokVnNIBW/8B0NjHA6jjzir/9NyUKktbWuQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3WnLBBWYyGUpTLzF5vqnQ7vHjxFx8hiTc8TtFTsdV8ueNy8zfh4Un6d/2N9zxcA9QDF8HVWvNzUcyJqt+Q1O/a7HgRPlV3wfg4p32jbap3ZhPjMVByrOd1hsFXxgnMztbsgW6JROtwvWIMaeq5hZmUXXZGH2Mr4N4D+7/d4posEhjbXPunBWtooKoXn/adTVdh3wPv2rRPgm2gRvkuSTB+BdphmnII5QpLaE2BodQCI9CU272BD2xaV9AVYUWgk7c5qG57iUuJGU5aRq1aAO4ODPK6C9AibwCcowC1TNpxPnvVWKxPe4tXCtzid6pfcZ924ZpZQog/N58FhujLH2TwclyWk2r99djK0CABKSulqqchgsj0fwKG4F8ua1gX92Q6d4Gq68nitvEJKcvvZFf6+WOyek4CusF3ip4sVcsjF6U6fD4hyfeg0WHi7gciPM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 00:00:33.2139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f23f93-c549-4c8d-6278-08df1dbcaeba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR12MB583771
X-purgate-ID: tlsNG-42698a/1790640037-A92CC9EA-281D78F6/0/0
X-purgate-type: clean
X-purgate-size: 254

On 2026-09-28 10:02, Ross Lagerwall wrote:
> No functional change intended.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

