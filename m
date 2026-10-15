Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCE5CC6B39
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 16:05:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450855.1666235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHNwu-0004cH-QN; Thu, 15 Oct 2026 16:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450855.1666235; Thu, 15 Oct 2026 16:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHNwu-0004cA-NT; Thu, 15 Oct 2026 16:04:56 +0000
Received: by outflank-mailman (input) for mailman id 1450855;
 Thu, 15 Oct 2026 16:04:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xHNws-0004WS-PZ
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 16:04:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHNws-003D8c-6B
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 18:04:54 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad0f993-8faa-0a2a0a5109dd-0a2a4507c7ee-48
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 18:04:53 +0200
Received: from [40.93.198.37]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad0f9a3-b4ea-0a2a45070019-285dc625e33a-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 18:04:53 +0200
Received: from BN0PR02CA0045.namprd02.prod.outlook.com (2603:10b6:408:e5::20)
 by PH0PR12MB7957.namprd12.prod.outlook.com (2603:10b6:510:281::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Thu, 15 Oct
 2026 16:04:47 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::82) by BN0PR02CA0045.outlook.office365.com
 (2603:10b6:408:e5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 16:04:47 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 16:04:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 15 Oct
 2026 11:04:40 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 15 Oct
 2026 11:04:40 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 15 Oct 2026 11:04:39 -0500
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
 b=mpkyoIgagnXO+xx8CbsUT9+VmSWYoccOpF2ZiGG/lgHQnTGl/IZ7JUjS7K0YWeFpmipRra/v9N6+vSqiHVEeqeclkxrItYRdYTSOaA3s320lM5I5pBwWatbepAw3FXXVdTiuG5zlFAdISArD42H/p7hPrR1BhcKRIqd5CZr/fq15PuJBqIBDrrXs3n5nBybuBujW+t6O6OHuAZZ4nr3TxMZzLaI/4/aaqzCI7eBy7p8d8YMQYJ8Qah5G2aJIFuwshguvhFOVhCsR1yEyltu1o3FyTCjF3NLefnGwe4ZwfnN2dHzzIME0RKG393o42NXLhCABmqdf7rYWEQi3msYSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSTYvoS03r3SaiH65lY16MmrQOMD5bDUHrwKoefGOAU=;
 b=t2RqsX0ehH5AhVneuTjFy3LWgJEKkrYYeHApN+29g7PsZJ3u4goxPfFs1QTXE89XNquQBolJpN46HN0dTtANXAtDnbIT39B8mfLyQgmv34LSMpnSymu5dfT2BYUrk2s75oNdUaDZUAG2bdz/5M5+lBBu+nOtI2dMbB54a2Lp6rs4Gg6gucQEQhyTnVsFtyDMxEo16rv+H5faBquaM6miGZtsT8Ke9GKzrhDCkXWbupoD68j9eJm+cZfQkYerCakpIh+oswx9M4jyU8NpPuaHIzOLSOqbPRDsBiL+gpz1s+flByUoKunszLINMooQPY/CTor2KZuPq8qMAzupOSKpFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSTYvoS03r3SaiH65lY16MmrQOMD5bDUHrwKoefGOAU=;
 b=BvFeIg+I5OrwUbkemDvuvp+wPr01+nEGZAbhxQKGWldu5waErE1XBdyNSfkgdHFp39D81eSOg2m7weh4sS36aWyjKfTnV+V1P0W9D2snyca4u58pHxGjUkOQKEf5avWeW906vQqTyjxVYJ8XMDm/xFVvGdbzme48KvIjBM6QF/U=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <960380be-818d-4699-b273-1fd7ebf0d11a@amd.com>
Date: Thu, 15 Oct 2026 10:33:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] SUPPORT.md: State that ATS is unsupported
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20261014135143.34220-1-jason.andryuk@amd.com>
 <20261014135143.34220-3-jason.andryuk@amd.com>
 <d9ae0ea1-912f-4533-b50b-839eda7b5f80@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <d9ae0ea1-912f-4533-b50b-839eda7b5f80@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|PH0PR12MB7957:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e4fbb9-3bb5-41c4-dd46-08df2ad608f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	knnllsfMXSCjX7oT9xT0nE4jhYeFr4XFey/3AfRUCDMWhuTQ6dtDfpp9z6OmNJPusMV5oVCbGqmTyOrYGGnhPx6TvOO6BKNymLFmUoj2KqkS5XgAET/16v7cFYFFh70W5uvZBWZM4RlfTZL7FoiuFruB7Sf/pNoKy9xtnkQ0GB6QEWL3x5ttvOVbKRLLCYHYYKSs+Op179pgstaTraCoucZ4XXVGlm48QkZo4kl93bi34ZHWT5yKdKci4mIqCh+ATyA01S6uGJHeyVFO1GfYz/zjZjQGRNgb47juTvJp8VOGKcyPt2hqemlnVClq1j987kQKFLczFWBh/TV0uK/sA05Mq0pIXqAzHcd0SLQp68K3h0jjWDfENZnTm64MW2zaWttmm0Cz/io4MePqq8a7f/N5uPCs+Gp/8mfClIugd/3DvwIvG1rPD8YjvhW+HKAn21FHb0MSqPruouOd1vF6rAqvnJXQrfU0ADmipWusiD/U4gTd6gF7GacxDM8ILt0j2UL0nKaSUSoC0qHd9dKx6lkkz5nT8OYPlQoOcPyfpiqDADscPasA2+9/MFQusihClTB0w8yGAgzOmzqDXyw2oK0JEflfSyzy/TWtalVMako6jmVOh4xssbU1e6vO1AEWIWiybiZjTLKmV/lxhKk1Vzs79lSmrN4poRL77v+ANbL+4kxRk1s1rinpkoj4JjEGQFVwPS99wvkr1h4aUsUDqg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rKKyBa08Ctspcdg6/H4Zy7zI34FbmgYu2gw1IJ7OwV3tzjST9ZsyxfAemjqeVDPpmaDV/JOiopNo0Xk1hXHYxGl9pK8vtCHccI2DHmh25ws9oANNwffZ9pSTVcJkaamhrAfQQL1s+8kb2CymYUQOcFKqU1rDwl6sQn7miY/64Di8oQR7WNP3aEr7Em+BPejxOmUj5cLkVKrtzzdce6bLDZ4VSCuBXtZ+CVYkDIORz0ia/l/ZvL0B7GU5OFKjGMIEYTj9dqWgqsuiH5JPKdxdwxN3xmWaSROuT61GOWOiUQH93yXhXmkgqCqPj8kpx8wYzpzjOMMDWPDQR28uvVkU+tO4k68rhb6lZYIdfj+2CB8Hm1fHjolLdGZtyb1WYdw0v3ASj+nSo0oM4I0+l16kQtq8HR4n2JiySr8rgZL23F+MqEQcXIS47JlaBp8NWwbk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 16:04:47.0989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e4fbb9-3bb5-41c4-dd46-08df2ad608f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7957
X-purgate-ID: tlsNG-ef75cf/1792080293-374D3AE4-A1E80954/0/0
X-purgate-type: clean
X-purgate-size: 745

On 2026-10-15 08:33, Jan Beulich wrote:
> On 14.10.2026 15:51, Jason Andryuk wrote:
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -96,6 +96,9 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
>>       Status, ARM SMMUv3: Tech Preview
>>       Status, Renesas IPMMU-VMSA: Supported, not security supported
>>   
>> +PCI Address Translation Services (ATS), enabled by the ats= command line
>> +option, is not security supported.
>> +
>>   ### ARM/GICv3
>>   
>>   GICv3 is an interrupt controller specification designed by Arm.
> 
> Wouldn't this better go in the "x86/PCI Device Passthrough" section?

I guess I thought of ATS as more of an IOMMU feature, but PCI is in the 
name.  I'm happy to move it.

Thanks,
Jason

