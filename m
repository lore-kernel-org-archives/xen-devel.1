Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE52606A323
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 07:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VnooWEcJ
Received: from list by lists.xenproject.org with outflank-mailman.1491924.1692619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTDsp-0001Rg-41; Tue, 17 Nov 2026 07:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491924.1692619; Tue, 17 Nov 2026 07:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTDsp-0001RZ-1M; Tue, 17 Nov 2026 07:45:39 +0000
Received: by outflank-mailman (input) for mailman id 1491924;
 Tue, 17 Nov 2026 07:45:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xTDsn-0001RT-Qa
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 07:45:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTDsn-00EgzU-1X
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:45:37 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afc061a-bab6-0a2a0a5309dd-0a2a4501b01a-20
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 08:45:36 +0100
Received: from [40.107.208.66]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afc061e-5984-0a2a45010019-286bd042b402-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 08:45:36 +0100
Received: from MW4PR04CA0360.namprd04.prod.outlook.com (2603:10b6:303:8a::35)
 by CY8PR12MB8410.namprd12.prod.outlook.com (2603:10b6:930:6d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 07:45:32 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::2c) by MW4PR04CA0360.outlook.office365.com
 (2603:10b6:303:8a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:45:32 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:45:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:45:29 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:45:29 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 01:45:28 -0600
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
 b=Wfz6tZBxBnjklvFh/j6tfIUSfNwnN/+jcsFCoB0Smp/jarXh/rY4qHChGqh8Fk68Wxp1dq9j1q6t5liiU4d16iKISD71fXBF5S6zO+XoC5qopR24QBn6tI3SRWx90T7bH+dkXvD8wMbmqBTt0Wysarfsiwv6Y+8U2YIsQWfcSC5tW9U6uZfNTSQevL6czJKboxva77v92w1fVcXl11uJDzfjMEch8g6F1l8d/ILWdVWevgu4ag7vHGvKkbA06CcoKWR5b+28Fj+e4NYuUhnjm37JH/Ai5OTi4T4YJn/55KTpXqppZPnCrptrIxET5SNZjc4b3boqp4nP4TesdjwRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5c8oHcbdWhdUwIYMWGAk/8YQI1wJ9evgJmA0myjSqo=;
 b=EayhpTu42wOxyck7kP4ztyCQlfcRfUJn0Nq7Y6uV4XfesOjPRlONYq4Yt53iybj+1yQBtMPHcLjeT8k/w2b/hv1NyrlDh0GWJuHtt0Cm8dPqzMlZU28IwLe4A5TB6cyYtIu7ep1/PeQccHTWmxSv4Iz54OQLtjCzhIB1L+zCCLYvg9RU+ElWwixjfPRhaTTDv6Dc9i18b0StpCuoULtNmcRYFIH2JaY4qqR5fZdDeg30enH5VmFdH994v/IXSt1z8WQ+T5xL8e6wzP+gFHYXUphN63NmZ4IsSCEg/ARYFNc21kVCqv63gkEnmoGQneWeFpU3oy2Bpm1G7KMg1BTFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5c8oHcbdWhdUwIYMWGAk/8YQI1wJ9evgJmA0myjSqo=;
 b=VnooWEcJe+OlaCZcuq5VQA2pr+STyfd3IoLDFOEYLW7MPIjuNka6c9TYMU3ZkW8DvS4FRrtLSGuB9fRi4lSyp02iWVjKCgiWt7zBQN7ZSvDwHcMSxxLA18GkarPijhw7BAaqQ1O7bltvDJP47BF2KXkkJ5sgR2w91JRSe4bDmZU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0d253cc7-486a-428e-bb4d-b4ce2ebf530c@amd.com>
Date: Tue, 17 Nov 2026 08:45:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: its: only clean cache when sending ITS command
To: Daisuke Nishimura <nishimura@valinux.co.jp>,
	<xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <20261117033217.184625-1-nishimura@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261117033217.184625-1-nishimura@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|CY8PR12MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: 7631cb63-fcae-4365-df6e-08df447ec1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|10067099003|261021121427099003|261022105027099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aGKmZXHyyAxXmEoTTolRMKQiMmyGclO4wAm59BaqwUIGlAtLSyXx3FDLcH5nTmBV4GpXPqCmcv6/XZFbc1g2tlFd8WDowdJJ5DaYh6hJmRjpXO3MrTcG/YzryY2Ky0I0zOZUHGk8DnrbfJJQg+3ZxDqdaAMrI+ox868rFykMym4AJxv3Z9PQNwK5kujEqd1uC+8AcUUiL//w+P6d4MQHD9jyzpsCvvHGdK7Q2g9/Fr3KXmJKE8JDDD31sbaWmbneFLeClyHCKq89++oxJ8BDcUVBP0+Q0g6Dn2HrnTASBwESUBjAoAAuujwz4WkLu8Rvkkg+sX9xXxGhOaUwnCsgFBzIiIxrJ0U70uQ+2aZk8XYWBd9mBmifCyuP0F4pl67QbfQ1uh7lbe5jurI8hbJvHHrvK8YVJha4RNaY3kafFPH4EhzUTlnt/xr0G/Z/ockUfclfgV6UuqO3D3KyESlBTVPnAO2yyZ8WvUJIQoidfH6zUpOmt1dlD+CS9nP8dY0KkhchN1zGoVCjLosBD9xsX56eZHmgQz3/ZjpGBp8N8mvqySEeB8TH+jXj/UP6fGdEZ/st76LnJ9rhS8a2z7iaQla6wpvI2ZoO6aFet7oVkeCsg7QhXPeqMVsWNibVoi/D2pG0J6EOxOOqDw2b9Uv4bh+PTnoc2TTuWtIeVvXOv4jCzgAFwOZsZBnw23LijEW6Y8buCms1p7aQs3cYWTgUnA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(261021121427099003)(261022105027099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4eR1epiZp5+B2Dgb0IdUN7LfbzAN+yx2tIg6DuwfIljQy+f/zvQD+q+k4hZ2FGFSuTUtoym8yqTUM8JNJ40IZFI7DdSfkVKXUgTi9+/8zev1uXx47SxxStJL4GAGt6+sNcsTnS1aoAso7NHAWRvWAwjOJIHcRdKeG28UgCOgsu6VkYvdg3o4m/JbvygOrZBuyeta85z6n7V5sfaseJezPiwPU3HHvSeAiEH9+Ho4Sau+V4tjQ+9VjtU9WELTJOgEaoNPaEXPs2Q4b9dGg0ApNv3vKEp1WsuI6oKV91eVe0a4Y4bG53r0iXCb/02cfk5D4NuvSe0a8O4tLb+bG+GmzDSyDdiYF2yDVxYMu0hnzdiuasHYt0TlC/6AfJPR5RJGIdhIvHqgz+dbIsZoLHIKF17AM532UgHrkUu1sk4uRTZCdpcAvqGTinaGETPmlNPB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:45:31.8162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7631cb63-fcae-4365-df6e-08df447ec1e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8410
X-purgate-ID: tlsNG-d62444/1794901536-C4558757-5604FADF/0/0
X-purgate-type: clean
X-purgate-size: 924
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 17-Nov-26 04:32, Daisuke Nishimura wrote:
> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> There is no need to invalidate cache entry because we just wrote that
> memory. So it is guaranteed that cache entry is valid.
I don't think this is a good rationale. What makes invalidation not
needed here is that the CPU is the only writer and the ITS the only
reader of this buffer, so the cached data cannot be stale. Invalidation
would be needed if a device wrote a buffer that the CPU later reads.

> 
> But we need to clean (flush) cache line to be sure that ITS sees
flush means clean+invalidate, which is what you drop, so please drop "flush" word.

> command written into the memory.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Daisuke Nishimura <nishimura@valinux.co.jp>
With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


