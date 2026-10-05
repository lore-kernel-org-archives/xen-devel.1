Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A23CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 16:13:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441006.1658607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDlIq-0004rB-Pc; Mon, 05 Oct 2026 16:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441006.1658607; Mon, 05 Oct 2026 16:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDlIq-0004r4-Mc; Mon, 05 Oct 2026 16:12:36 +0000
Received: by outflank-mailman (input) for mailman id 1441006;
 Mon, 05 Oct 2026 16:12:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDlIp-0004qy-OS
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:12:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDlIo-006gLH-CQ
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 18:12:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ac3cc6b-e002-0a2a0a5209dd-0a2a450be156-12
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:12:33 +0200
Received: from [40.93.196.21]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ac3cc70-b7e8-0a2a450b0019-285dc4150d18-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:12:33 +0200
Received: from BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::8)
 by EAYPR12MB999157.namprd12.prod.outlook.com (2603:10b6:303:2bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 16:12:30 +0000
Received: from SJ1PEPF000037B7.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::68) by BY1P220CA0018.outlook.office365.com
 (2603:10b6:a03:5c3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 16:12:30 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037B7.mail.protection.outlook.com (10.167.244.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 16:12:29 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 11:12:29 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 5 Oct 2026 11:12:28 -0500
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
 b=TVP31y+YaEn4gRiKZYIhTM/h3y3SMXtdXahoQxdnWovoi2/SLMlb/iQ0YQ3Qva4H8sG9ItOCecn04Nyp6uh4tzIJdJv9H2HL7eLlGW8opg2VJaDLAE6N2j1Q0gD4eVRrCJccJ8pfOsJMvsSxwSx0DsUyPH45hcY+bCo0yXuKXaoRPn8qTukpmwP8H/HcCZv/ZVZ7qUiDxifnH4HUotgV9qS5WDcY4hOpO1SYb5FptbP/QYfdHatm/DVioAEyWdu5+NGI45GOVSpp4vmHdUmZCd4p3bKcRRjmG2C7wGRDTYoZFvuJeN55061tlWroKuBH/ENyp4rFah2OulD/kybpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGv4IG7K24ZePJBTtc9k/uQ44iY3l43QCGxrjY5+koM=;
 b=xPMRt1dzfDVBND4WqqhtU6Ryvx0BFMJ0mO8gEhmbPVtdY+EwwTXC6UM5og4hzKdorhiZa3cy2kMYkkk/y1obhJDwhr/LdbNgJMOu6ZmFcAcly3h1gJVGZZf0jCGqqk+k4bNCZHsZJQUithW3LDTrIp9e71owF+YPy6kjdlGvLOlXLh/ejaCfdPZEp719op6EjairLCFWnD7TIjttKWW0EnXAli3xpWIEDjt19UoSvyv+8bY023H3o+2v+BkENggswpnP7iU/hUaEp+geqvn/wFNPIxLgtAoIBintcfAznONtPdlnFtXQvX8AeaVWuv388npzcpIKIFkw+wi04rLmxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGv4IG7K24ZePJBTtc9k/uQ44iY3l43QCGxrjY5+koM=;
 b=UShpqv0Qko6KV9AxDnN+H8PvLFPfXl9oKyYXJpbbi4ZwnzRrZFXnSdVrvMhayUwrr5NkVsHYOcLqm65te0nfzWQFPTTX5/+6x9tYGymVKHK9623pBbaKzYnzL+UCIt+SNB6OizSmXU/0KYL/+aGL/K4c5HCHTwVhtj7uHKSNgfk=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <fff9c2b9-d81e-4f1d-9dc8-7683fe2a7e07@amd.com>
Date: Mon, 5 Oct 2026 12:12:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PVH: correct PVH Dom0 E820 region merge
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <012de89f-000c-45b3-a600-544114346e5b@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <012de89f-000c-45b3-a600-544114346e5b@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B7:EE_|EAYPR12MB999157:EE_
X-MS-Office365-Filtering-Correlation-Id: f94d5ca6-9cf4-4460-3879-08df22fb74ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	IzZq62YXTrTiDQtGQ8aXofxmgTtTLAVMxwj35G/dmAY1Nsipnx+WV0ar/+TyWU9R3pSmiBtadp3jsBPSJaWH6WA8FF2S/fCmn1frzY9xvs25WUVXMBzHDqxTlVsJuzkAI86JZ0Jd7/NsTm2WTnUILH651238yIgywHxzfw3WDY2p8dhzpO8yf0hF00wuPrMqspIY1OZ3HRml2dqv75eyYsq7cexjigBfyXkAD4baL82Ui6kRO/19/HDRKoDFCKefZb57vAgihTy5jyRFJywnDuMTlam0zq447tkJcDY1wgU6UAiLCXjik5ZGSTfB1lYBrDPGMM6RzZ0gQJZnGQOKSwvkceXYeDiM0hektV4GXsKs41OTKjf5LVz7hOYMkpssvvaR8v/6RR3HJfd//xXpGsLQ0WDvFsQIEXXnTrdECAm73p7SKBJ3RVg0HVYDWaaI9oPIZynqNZhVjIdr1QXnTKoP2d167uCwiAHENpeV/IQZAzlAexV7gX9kMPmsLE6B5Dib79vjf23cYQgpP31RBzHWvo9khpZjj+v2Of9R1g/rkCDh8cLFbeYfRu+7gIuhN/De+hYv9mJloZv8suuNOHyZghtSr7H5qALb0Ss7aDzdp3LZbkEQc8S7FsPIdRjF+yGYUpadqbPibilEvU9HRzfTsGN/dhb3pK0XVW0j9bRVaJEQjDvpSSKVufKvO25BaLIQtOPkwh32IUKfiO3VyQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B4E/usIn2QsXRPL2GdXvWxJbMUKm4dxwNASPAWDfOAxO6ye3vfUrpIcLc6RKmZOP8Unxa2mc5iKfgk10xZKJTlFkJcShK+Uia5gFtzjhYbu55edKJZnggFfqnQOSMVcb5L5CD4Vdl3X5VuJqbAZZLrUf5Y1rn215mI7onkIII9KZ0PJqv7uLT9Y3Nq7FRDCJMdgmT9slE3EWg9DkXKQIIEgM7/MGkqdRz8CqTUkP5QHdb1tZE3L84gb4T1jvw4FjSDlSTzAG8n+Pftdjg8lBYneKn4BEYzBGjUrLY9nPr7esSmhr2OH/S+ejKdQy4BIVQBe80HLcyA5kVOC92dGk79aV26FPWqI0M/TF7oSkt9ufuB8zKUx1Ou/k5j/64dKlmbRuszutUIeqfTbd4Lbn2QEsGLv5IFOVS9Y69el4jJvFnLL5mucKornda0riMkRX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 16:12:29.8134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f94d5ca6-9cf4-4460-3879-08df22fb74ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999157
X-purgate-ID: tlsNG-42698a/1791216753-1B8D19EA-71A6A82A/10/78276251493
X-purgate-type: spam
X-purgate-size: 381

On 2026-10-05 12:01, Jan Beulich wrote:
> Folding with an immediately successive region can't be done by merely
> lowering the start of the region. The size of the region needs increasing
> as well.
> 
> Fixes: 5427134eae81 ("x86: populate PVHv2 Dom0 physical memory map")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

