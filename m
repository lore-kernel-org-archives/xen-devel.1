Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADA9CA5FAB
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 23:59:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436224.1654954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBLFN-0007Qv-Cs; Mon, 28 Sep 2026 23:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436224.1654954; Mon, 28 Sep 2026 23:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBLFN-0007Qo-9t; Mon, 28 Sep 2026 23:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1436224;
 Mon, 28 Sep 2026 23:59:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xBLFM-0007PS-Rb
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 23:59:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBLFM-0074oS-88
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 01:59:00 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6abaff16-2eae-0a2a0a5409dd-0a2a4501ac56-18
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 01:58:59 +0200
Received: from [40.93.195.66]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6abaff42-5984-0a2a45010019-285dc3420eaf-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 01:58:59 +0200
Received: from BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::9)
 by CH3PR12MB9122.namprd12.prod.outlook.com (2603:10b6:610:196::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 23:58:54 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::55) by BY1P220CA0024.outlook.office365.com
 (2603:10b6:a03:5c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 23:58:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 23:58:53 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 18:58:52 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 18:58:52 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 18:58:51 -0500
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
 b=mrjNCjA73Vx13pLyZcB5pIgaiA2RPjng4dFR1nx+i/dbxuf1IIIuJMNh41SjyCRiktD/tvbxK4VxYLBPrn4U7/W1tUa8hHv50gsonnKT/asIk0hgt5LqT60fwY9Q7lyeMI1vm9qif5NkRhZvF4FdPoMCgq5mPCIbpWHhuJAaC8jnhTaxjtzkbhXwaF22YxEIWyJjGr8sysNvXjeji5ufCLYX9aSPB86Q0EuO9eG6Y0+SoLk7nF0QCJtXIgwZXx4RrRWwdVn6qtEpYs0g5ksjG8WohmWTAMKfY/7rIGZiDsHN6Sy405qSsHKEWbT/996ZWcezpnoDL5IPHblU/LxttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcSbcrl8qRARpoldcQgHSyvvrUaDKyO+xA5ZQxSnW18=;
 b=qteSnrdPTAHhZbT4oR1xJCIv6LCRXI55h82hH4Ub6BTXgM00Rgh9nhPdJbYOx75ezxN4OPb61x6J4Zpt+YkOAo22TQbdFyE6EMqGGC0bYkcxDNCUxV8KJQwVHp3ZUKbIz+yDkAQTUg1pu3n78bo/GDKNbtH7n+2GnhJ7QhX/iuASk9xrYsnpJ/HJCrsXdEx13dlJy92KarIX17wS+hvY/UWAsBA6G7r7lOfWgj39VgsQ3Y+TiGU6Ou33A3fdykamXhhhry8afDk6Oo1UFkHlUCKUWoXq0u9zXdj104RKXigxw1tXu9MlhMxHUmttay7PYarViCyDbiAkbYvaSniX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcSbcrl8qRARpoldcQgHSyvvrUaDKyO+xA5ZQxSnW18=;
 b=c+9eMwRpWcNpqhkrW2fVYfaptu9L46mlWZFGyr2umYpTNXE0uBfBO2efTTFcmuj98PmamnGUGFJJSDPuJXzSa/0T4Ylq3oczKP4H7eGROBdRRwH20DkO4kc0dUm+Y5hCjz3ci/kbLGux/Cc9HWboFrqjXLrB5/w4Iz9O5wkVkCc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d9029a04-61e6-4334-a8d6-c075ae57da16@amd.com>
Date: Mon, 28 Sep 2026 19:58:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/svm: Remove ioio_info_t type
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
 <20260928140248.1543013-3-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260928140248.1543013-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|CH3PR12MB9122:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9b1794-4e51-4bbe-ba3d-08df1dbc7369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nJq0qPYRfCzhtvjdBjDfIbU13iTm/fy5jrIn0WmVfPcRYHBkmxO91Wn2ypI7e8Hzwj8iX25jifEX61yM19NeVZVbXPFKV8tZUfWeJfZRxA6J87wPHW0g/7NKScokATUBmaUydN9vB6XVuJfKDKoxB0kP7NvAflB2YMu70yQYfXGPZmymW6g66FCE+J2yoBVDh8qaNB17bhTBftrrSuRIN+pI8t5SIJeG/NQAqW6QeLeB0qcdtWA+Gb3BnFSHrNWkJdInZ+9O2XxNzqeI1NqYG/ZEmiJnEfdSyMCiRe3GNJb3rb4TtRVQ2wg3vO5bab0kd1H49ehD1S9radjbS7srM4SsSnDwQ1FJSDKcv9ZAQRjCqaZQ6ZLkquCzL5A8tSaK2Xkwh4SO3Di4fiXyvxyAgs8kf7UcDjALeuCSemPkx4PMyNxtxKvLzV2CgVU8venasGpxJH2EcccZ4T2E6BVnj4OcnuZh55qVS7IpE5GVUXX6RCnQo6RYByh+cuBe6VSJXzlHjcDi14AAKgmKwM97JLI6f4HTWvqiQwFlliuExkcmts1loS2MGWhrNX8dZZKqssirb6mU5yrxpi6Ug/UiOIcnrMAPf8IqLc8yjKR011xuClJc8tEtpDgRbX5ETucXGKKUscKHMY3wFtSai6m0QHLguwG4Z77xSz73KLtuLDCWXKqK2HOCPQ4/ti3RivZ6OfniywhLm/bqdlMOD9wdlw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/z7JMq2NUyNs+5epLwioQfw1S95oDYAHoLAPS4Q53FheB5icHJ/bGNOENgFUdfy5vtA+mJCaeQPOfmUtadEOlEObdF0xAU0oIi0fywTcl6pTXq2llqStGQ1O/Vk8tyICvcdB0lQSH0Xi1dgrx/cFaJK98M2dtuc9jsHBOg8xsGKWTyz1eCyWPPUFtkDcTCUg1mdLWfwMo1pCcYN+fQ/YKn6vz83fbNi7guSbZL9DINqtBjkcErCYj3ermBBRwNQmc/g++kTKjwwFJivl/oIeYh3RSeuwIIK3P5YhrstA/cw26DJBFpnYXBaL05a25j/R5VYYmA0B64HxLjlw33O3DrspPJAVo6eKwwkoxe2Cf2LlpVu9G1NTUaIuPucbs4tJO/C4v8AhLp/MpleUSQS2MuO98SiA0BS8R+p7AF7HfUkFwfFGAgfEXhi7YsWjSroj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 23:58:53.5904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9b1794-4e51-4bbe-ba3d-08df1dbc7369
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9122
X-purgate-ID: tlsNG-d62444/1790639939-1F66C757-5E359BC3/0/0
X-purgate-type: clean
X-purgate-size: 380

On 2026-09-28 10:02, Ross Lagerwall wrote:
> This type duplicates what is already in the VMCB struct. Remove it and
> have the only user access the VMCB directly.
> 
> No functional change intended.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

