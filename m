Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31C5CD6E6E
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 18:54:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328402.1592921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVDCb-0004YK-VR; Thu, 04 Jun 2026 18:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328402.1592921; Thu, 04 Jun 2026 18:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVDCb-0004YC-S7; Thu, 04 Jun 2026 18:54:01 +0000
Received: by outflank-mailman (input) for mailman id 1328402;
 Thu, 04 Jun 2026 18:54:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVDCa-0004Xu-H3
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 18:54:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVDCZ-00BczA-U9
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 20:53:59 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c9a6-e002-0a2a0a5209dd-0a2a45028e8a-28
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:53:59 +0200
Received: from [52.101.201.30]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c9c5-af86-0a2a45020019-3465c91eb690-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:53:59 +0200
Received: from MN2PR01CA0059.prod.exchangelabs.com (2603:10b6:208:23f::28) by
 SJ0PR12MB6966.namprd12.prod.outlook.com (2603:10b6:a03:449::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 18:53:49 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::96) by MN2PR01CA0059.outlook.office365.com
 (2603:10b6:208:23f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 18:53:49 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 18:53:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 13:53:47 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 11:53:47 -0700
Received: from [172.18.181.126] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 13:53:46 -0500
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
 b=ZrNx4MmDX/xHbV9C9UWsV/DUW3cfP9HkCPlrf0vwuzo+vtHNDXwUlOHVwgYyrcnnVAnFwXlSNfOgzRAS44XIYQKv7YpLw+zn1xpFVz5POmQPYvcWfrOjtUV58Al7KzBj1TbCTxdA9V9t6KcqolRfdGSV+eDQFuZlDa8qpa/GPC3Z0oOn5WOSgq7iPxWwee5TR70w8ffIIkyvbjza92JCMueqO6cOOsQKgOysMDitOFXBQHgbAd+hvagp8E8SG9LJCvpsMgax8+gLoJAI8SB9bJLrWuNW9YXvMVZhnfAHDo1G4Te2S5fZFL3HQvbMuTPLo67k3dvrQSTEYH7H2Yq29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etcs+6GGJy1PdFOuY8p5PCx2K/Ai3qW4qelsyTuI7sM=;
 b=NbKgwXFwS0oWfzQENsSKMof0bjZpA1bl66a7H+4K3SDk+bZ+lizi6tUf4e2p9PNqkCDuAg0Nn8KqRAVMET3qAcbeXXIMDQYyzMy+DQwJw+LzGYbGyrWqJ+IUzcSgqAuW9/R0dA6mzyE8GaK70HDRnwyejVVl0UQIKdbQnwxqHO+uvgtdyL4QDsttFnFzILJeWtoND1zCXBkBQ87HhyGPU44ALZVkwVZDmrlEav1unWm7KztEGB6WkqyksM1v2N2jRLemJeZrPkOabIUsxLDDn535U62BbrR6F0XKF5Bhj8hLT+OgthxJcJJFSO5VRexFkIkpHHs9ZJIRId6WfQnVag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etcs+6GGJy1PdFOuY8p5PCx2K/Ai3qW4qelsyTuI7sM=;
 b=4GZdJmQqRutIJtNU6a9KxTrC8n5V3QvY1o81gsFodsRCj6yu0UiF9wf/JCFnGf6Rf2Za8sg2L4CKZiQS4ta6DfDXpVf9rMcLboiev4HInmrBtE81sxLl0khAk/AhW4DoyQnNt1KlN1VhtSoKsg2TUV/WBqOpojSUxYYnGUsgj/0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <df57d291-eaee-4d87-a8a5-a27766a096b8@amd.com>
Date: Thu, 4 Jun 2026 14:53:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] automation: enable Argo debugging in CI
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>
References: <20260603194131.1468654-1-dmukhin@ford.com>
 <20260603194131.1468654-7-dmukhin@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260603194131.1468654-7-dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|SJ0PR12MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe7ba3c-0580-446f-464e-08dec26a9d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xlMwR+VABTaYp0hhMu/jqNbPBKShO2ri72P1yQl39SZ8JvNOT2hprDuo3iR093hgxFUPCzIHlwmUIHEVDdfzcySF6T2gjVIJu8bEm01hSNao3SOQOoqs5TQWZZ+C6RQro/XhF+7QT5ltesIcWwu5LLxnYWQEmMgMtZ1yLr6Howb7sQUyEUV37F3DiwZ5Y85S8YytEhr8/3O5Kieji9XW75drSbh27eQ5naehes33jvcUS1Jgh8PngPI1e7F5ilYX9spZl0UPwnpryuPmabC3qs8GcnzJnNcSJJR/7UsJs8ewNY2CzihWd59MsyZ3MSowDv5wIXSu3+zFM2kJIennT9ejUovAMUTrl7okW7hXjWAifBbpwVRBDrpsjXXAS7q/29pMXwHB+Te9mPBv6DIKv24wmA3WjCz7Ywu3pzgZwM+/IOZhxEXsfdOWBFMq0dK+sxyaa6ROZjUljMA0RR2FB93cWEewlrGTZPrbMw2ytRYag8X8c2DxTZZHXnWkCiibkZ7JtRNTKGP/AxdJ1doJ9gsshw1K1utmP3V71LSX4uotqjXRrZ8+sQ7577VCpqe+vkZkNYcvnk2wvYU4y7kzdSoprqhu/hDN3RxecdtqeAC1Q+3lgM/orVLVwM0b6mAS2X5bvxlSxPLZNTXM6UVM72Ss4erPJHVaqRSNZKnDFLmGF+9WmS/aOQhbeN6WTVSnI2eqEV0z+zEi6Iv3GP4KmAsAyyvtHUVzjxNdD4W+xbQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0Vgn8Puyg5qqj8tCoIHIyCaqYIkrj7g3KSi/4buwjRTxqTiwHNsAflz0or1zPh+yTetaJqcmBCnGw8ozwRHwKo5x5Id1pKgLVkKkkJHC7XHClqvQhIrMEZbDuZz5xx04F5vIYjveMlMtq93JBHEh8+3VYOjtM4pg7B8iJk1tVNQk0MV9JPuiQ4BZByK6OqiJ0kKhUQOmlBXX66PY05KZWfWQnQvWqRTRrGPdDX+b0RFCKescrrTnG19R3fiKPh0p9uur0hc70u1CaJPh/ioJiutiBDa9JJkCS4GzRU/1/Kb4TBAcUUFxs7NCeyQYtLZtvLTbzahpqVdvM0MhPf+rnPu7+6rShTWS7UkANwF1gG/nFzEGAVKEIxV8L3Okkd8fVfZK7nMfjTNvj5e6X0regYMFEJBe4HqyQ7vBWKyQYm1+GiX/p5Pdy1a7PaxO2wQf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 18:53:49.0298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe7ba3c-0580-446f-464e-08dec26a9d12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6966
X-purgate-ID: tlsNG-720697/1780599239-B0B78161-C653BAB8/0/0
X-purgate-type: clean
X-purgate-size: 299

On 2026-06-03 15:41, dmukhin@ford.com wrote:
> Enable extra Argo traces in CI to help analyze any potential Argo issues.
> 
> That covers eclair-*-allcode and alpine-3.18-gcc-debug jobs.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

