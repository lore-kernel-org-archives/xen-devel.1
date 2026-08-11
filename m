Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2824EC5B569
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 07:06:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387957.1629176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtgZ4-0003NO-7k; Tue, 11 Aug 2026 07:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387957.1629176; Tue, 11 Aug 2026 07:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtgZ4-0003NH-4s; Tue, 11 Aug 2026 07:06:22 +0000
Received: by outflank-mailman (input) for mailman id 1387957;
 Tue, 11 Aug 2026 07:06:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wtgZ2-0003NB-8n
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 07:06:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtgZ1-00GoLI-LG
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 09:06:19 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a7ac9ea-8faa-0a2a0a5109dd-0a2a4503ab66-8
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 09:06:19 +0200
Received: from [52.101.85.7]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a7ac9e9-fae8-0a2a45030019-346555072a89-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 09:06:18 +0200
Received: from MW4PR03CA0314.namprd03.prod.outlook.com (2603:10b6:303:dd::19)
 by IA4PR12MB9788.namprd12.prod.outlook.com (2603:10b6:208:5d5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 07:06:13 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:303:dd:cafe::7b) by MW4PR03CA0314.outlook.office365.com
 (2603:10b6:303:dd::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 07:06:13 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 07:06:13 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 02:06:12 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 02:06:12 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 11 Aug 2026 02:06:11 -0500
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
 b=kn/M62Z4hW5SAd84ScCcd2mugKjCR8r/W5s4p4k/MV3FwgqWbCezbcFj4ZohgUKKJWDu2yCSKa7xMoJqN2IlXgcTeqFPoM7mnfuO6iHt3FPJHaYYEdCxhe6R0FOX4RFAu4THGXS+NYHb3X0VRb1YkwHFIAmg3cFDB8ns0mYemUjXoA8/3McfzakOOChqXaCRRZ/0u7inKdfFb/To6qVc7/KnMki3IHhG+tuDizhJ7uoX+29sfILNeApSgWXeeLTJqwjuHdQUT5CQKmT9lwks1W7Y8CxaZEVhqXTShRP0sdLmCZv1hKCXqKHc2qAi4atYZhMHXp1wL8BR3ghfNHQbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7Z9+tFRgouVypaJqTuXKRlijZUwRSBavXXjWIWJZOY=;
 b=CzlPH4W5NqDYzZ5/o/N6RuqSIfRBjuhSdFtiyzOzBxcXMgH8mL3fu6BqP9WVG1JgNpq3LVMtdidZNEX6EmcqPRkJzNUl6u54U6W9PPwJqEmAwY+BEIMepk/YSUlj5m9m95CqQBQXWzIIsUJ8Z41jVCiA923vcyVoC35acFatY9eGFPCsEXCf7rSZImuORuHDyz+ZHf4v3J0G7cYI6vpEIZjYyN0417reFQ1FOeT5YPqrCHtM4qF7hNJx2gFPFOKqIL+6alfAga28tnY/vj/dff6YDcPFomEts4zRPu90i0Zm0FR5LyoNNMO1n60OFTzOm4Q91mZgFAypmQ1XziFH7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7Z9+tFRgouVypaJqTuXKRlijZUwRSBavXXjWIWJZOY=;
 b=1cjzDSdlscDdBbNBkZ6fvCi9GSUpD5ti44X3VgJZUoEJoRTExsGcL6KAM/qjTEz5b59LURLQinz/SdTmWC5g3ktOlHQ5C+QamcUOBKRrml95ka9qzsaLjmbLbCYgMhRqc7C142gu1mtWnNGs7EBM5V0g1bpZWzRvQ1LhDNm8ij8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <fbc1a296-1e27-4b9d-a37d-47fde4f91c75@amd.com>
Date: Tue, 11 Aug 2026 09:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: propagate secondary GIC initialization
 failures
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <58b886c992ea72210bb2f32afc392b458efe02f2.1786389451.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <58b886c992ea72210bb2f32afc392b458efe02f2.1786389451.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|IA4PR12MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bfb14eb-5aac-4d45-8cec-08def777076d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	uZTK9wqNnq830Nm3oNLMLg73PLtVOOTFezns9QsgDg+TP5OuB/eIKiXFlALSnKw+8I+TXHXwnHxXdDaaKfnxfQfCW28bi534x9a6zfDusFiPprFBKXMlOv76+QUnj07Qgk9R5YJy24MomIwUglBm4W5Oj8XJ2uY7finJkevAO4BKxALG07EUyVnALkwOTWcubn1PMk+Utm8Zm+equX6g0oXRVjN04r58Mtb5cZlWO3SgtL82qS7cYaXOyZMVKWNzJ5tTbf0krLLmFEybAUsofltVrrgDxe8judbCAGyBHxOBzyqDDUGftPx/VbpzqvRrCxJGipEmRz4XFa0MKc6A8IvTQka2YkKMXHARrGXsvNnr3oexQM4YhFLkbvNQImTbZMZ4QAEQtdOczIn92/gRXrPtxHt+6acIIl3auRut88EODlX7d3nilR7HgExbEQsR6jbXu+zQ+BG86l4iWxldIjgqWBDfVCUwULqEdyGQbJ/KdkYOiE4AsgrVxJI9TBlqQbhZs7KtbhXKkF88Pugk+x61ZOfgLk/astv/8HOrekPaa8voRAvYIoWKMJFx1aOja1q2LoLm7Jsl3MPxIoISAtdhXLP0jNHLuKRh7YM2ZcYrtfNgdhXqQoSxYiOEMXfYmMnnzqzRODP1h5aFdqtD0hebCLuYB5yqWraSfR5x3ZnhOWcOno01yWb6x0JmeLn2JV8E55xrDyvhF4DKLWSCyQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lnwOEEVqIo1uo2pYae/lbgFiFl5km/m4YiIXPVUO6u2zEnaVpkondIxTF0MGjOd5JcygKA0PwfE4Wwkv9ZKULt6+TxAI7Sa3S8kJp/FUQPtZwgDD01ZUJ9X6UqRI6ZSXJfM0ZvQ0WPTzW7nk4D3UVjvqMEG6BHAR3qMzLZ8uH6yRCpmEnVX64O9mIi5n6S+6tjrenXZ8mW1c7sbxlP4DPJ932cbypY9AtxyV2cNzZAmQENnevoWIpA1ZjwAyDX9BSjUEqgyv9uVFEnDB+ednRCwRetoHmRsdTA4QEzkHn069sGHwe1AFSEMagS0Z8zgXK0LIORxyMRO1XjJh5OLDGuc0JT51tXFj4cfSUlZtMkhLZnNY7rO29ADjUR2nGTF9AI1NYQkcRFiHZYqdyoAap/rnUJ4reRNabnGQFB2QQa22BIeOAPVMJz4iAkaGfjNE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 07:06:13.0212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfb14eb-5aac-4d45-8cec-08def777076d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9788
X-purgate-ID: tlsNG-33051d/1786431979-6F8C54E9-DC663110/0/0
X-purgate-type: clean
X-purgate-size: 738



On 10-Aug-26 21:41, Mykola Kvach wrote:
> The GICv3 secondary_init() callback can fail while discovering or
> waking a Redistributor, enabling LPIs, or setting up an ITS collection.
> gic_init_secondary_cpu() currently discards that status. start_secondary()
> then marks the CPU online even though its per-CPU GIC interface may be
> unusable.
> 
> Return the callback status through the common GIC layer. Have
> start_secondary() report the failure and stop the affected CPU before it
> updates system features or is added to cpu_online_map.
> 
> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


