Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44999606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 10:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vBrQDpBO
Received: from list by lists.xenproject.org with outflank-mailman.1459113.1671194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCsg-0003fM-9D; Fri, 23 Oct 2026 10:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459113.1671194; Fri, 23 Oct 2026 10:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKCsg-0003fC-65; Fri, 23 Oct 2026 10:52:14 +0000
Received: by outflank-mailman (input) for mailman id 1459113;
 Fri, 23 Oct 2026 10:52:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xKCse-0003dR-V4
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 10:52:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKCse-009pnr-Bn
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 12:52:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb3c55-8faa-0a2a0a5109dd-0a2a450aa556-2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 12:52:12 +0200
Received: from [40.93.196.30]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6adb3c5a-f2d2-0a2a450a0019-285dc41ee379-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 12:52:11 +0200
Received: from CH2PR19CA0003.namprd19.prod.outlook.com (2603:10b6:610:4d::13)
 by LV9PR12MB9808.namprd12.prod.outlook.com (2603:10b6:408:2e7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 10:52:07 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::3e) by CH2PR19CA0003.outlook.office365.com
 (2603:10b6:610:4d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 10:52:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 10:52:06 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 05:52:06 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 23 Oct 2026 05:52:05 -0500
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
 b=R0n0V6UBnyPfz7FLbJsiJKHa5QiFsu9ZRkaof1sUfnPoioH8SpqPIexV2F6IKmvAmieIIl1C+Fqi7O6OobbpIzxEfwHNM2SBsXJZxMaIGIkKKyVUqNqDiD0Lu8O4IKNACOszRhGft6r9JQNSpYZRJZW1TVd0JU43YQF5Jdxw8ITWVM2Vhne6EROqVqrJwovXTQWWRWVVCBS999XgWHYritbNrr44d3ocl4MojEVo7uLrWATM8/wFd7wRDXz3R52/xiCN7WPvOsgLNaaNjYQJGMRmjEQ4MG5fKxeTiNoodYqfB1maKdFtUcoPtTJdBqKv82hhiLby94LiDSkpUhGviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S24wAEEkFSNTXc6VFJq1FbrVnyrx2dW8ML5AM0H0y7s=;
 b=Zk41vkR2gYWXcFS9OIFsaZDWF7V9i8eSJoyMqno+IsMMRPeveHy/x4R0uHx+gB3LK7TO6n8C+CO3Mi0oGTxWxecHwvGt6NA3vhFKZAQMfbXc4D2M5BLdCJBPPnDydgX0IIywB68+Ig647Uzs+ltcP9kbCkGYzbkAb3Ux0vn4Pptq2Wyi6j7xhEt4jv5x8p8G60vM4lL/YOiSKrQdY3NO6JWZSEtbXr4JRVHCfteDhmRSij7uLUh/nQuBkJ+VgxFxI9Z88NqFlzvnHoBZTroghfyxwXrTQeamnlTGpjqi5i4eV7p/h7eyL/0AWdGFRpT5UqZmFT4dwDKD+hpEix5HSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S24wAEEkFSNTXc6VFJq1FbrVnyrx2dW8ML5AM0H0y7s=;
 b=vBrQDpBOcEtkkWsooUaiT/vxQ8rDx1QXMFuh97MvSV0zmbXIYnm8MQuAoyuwRqT2wCiIYLQrIPF/efN+Y5JWhVe4FQamRfJcWkCRu4c486n64WliyQH/Cx3IR+0oEqoNCNEYSRXGvBwL/k+senhnPDhc2UUFdve0Hbcneoo65gc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <dff68d84-863c-4f47-8fc9-d149426ac073@amd.com>
Date: Fri, 23 Oct 2026 12:52:00 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] xen/arm: its: refactor ITS quirk matching
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1790707009.git.mykola_kvach@epam.com>
 <b29ddd0b36b5564c564c31f511ecddb1d681afeb.1790707009.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <b29ddd0b36b5564c564c31f511ecddb1d681afeb.1790707009.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|LV9PR12MB9808:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b148db4-a79e-4aa5-7778-08df30f3ae3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|261021121427099003|18002099003|10067099003|22082099003|4143699003|11063799006|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3iGf2zLfY0elm73sPnVUTObRbr4X1b83mUIhYXF0vn9Ttl+9MNcXjcdOxPptF4uonoIu+j/+3GUklz/fD+KU4b4ru4o7Yk/jyrkcl/KduKooCtGvd8gWBHKTgdoIawPcjHH9Rk6hJRLajEyM0rxNJHFY0Q2beg/2T9BaSwMUAgWdxGXeIpOmUSiZ2Y8euqYVwlgXzmdVLx9K5w/4hPY5dAZC8Qfb8Lu3ds/JdtnoeBlzkT1mk9gn/Eg/kgrSfNAbpRPNugkFCfd8YXgeT+KBA7NeAfo94QiXLBl74hSCeOlP73DxpcY58y1NhmWVPF1UgqnFuaDlPddeiCFSvBGyd1hqREQGJ87xPDxzeLWUj434ofMiCV0BENnXIUsAeKK1qiDth9zHuebf5SCD25xgslGDUK8FQbDDI04lPNkMyq1V5AsqobE42Ne087E6G1vgFRQxJNR+AHHb4qYoQjeuvl737icJs1vr122HGYOB5C719fWrIlF1VhQA5RDRwV3/oEbavdK4GqRjWCNbhfjnw0YVhw0yBjIn1Bcm7cVjDi5+hAEtBq5JpmoS4DTAB36xDOv0M12LFxSPTdx/gW2vcDbNlV3kUZ5uqJ8w4D8kMcGAgGwgmdivtw2Jc1l7hwrkASZkaH7j5J6Iev2sambm3H06qrlcVQ0u+t/2miVwzZRBaWnB+vPi9aSAEmsJ0wAXz9n/+Xgv5w0QC/6ZxAU+NA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(261021121427099003)(18002099003)(10067099003)(22082099003)(4143699003)(11063799006)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fBN3LED2TWfUAzVTnpTkQ6KkJHDCe0RX82CB2LlnA+GOFAv+N3VJHhemrCJ9AJBiBOE6buVKQa3sbKsLPCaypY8Uy17BS4zYX5wV+PrESIYobjHXiBzSVIjxw06UslYKBzCWVkNjleWPapXgu6Yi2Tqka0Z+dZ9fo5H7iMJcw6oZUgURhRqx817HNuHbQRVjW9eP/0ofNF3Foc5NeNlx6vacBC92lRc4/7g2NlR2XSD1wCeVQOGwm98X4ewMnvS5kTzDjDTWmoMYxGT/f3BtBx6wpKkpd3Bw8wYSss0vTdXHcKbDu9UPO5AF8R51IImqrsIaEpwdPriEW/L0sVp9bh8dj1ezrGQUh25Zn2wv9HXl3PVymWIEMCireBfBeZui3nlbiE16LUMPRN3QsETQ/1FPtgG/waBv+pkNdi0BPu/HyEmZZStrPeGV5wJ+taul
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 10:52:06.7619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b148db4-a79e-4aa5-7778-08df30f3ae3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9808
X-purgate-ID: tlsNG-4011c0/1792752732-591C5CFC-8B52FC25/0/0
X-purgate-type: clean
X-purgate-size: 1362
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 29-Sep-26 21:02, Mykola Kvach wrote:
> ITS quirks are matched only by IIDR and mask fields stored in each table
> entry. That is too coarse when the same GIC IP block appears on several
> platforms but a workaround is valid only for some of them.
> 
> Replace the fixed IIDR fields with a generic match(hw_its, data)
> callback and an opaque data pointer. Add an IIDR matcher as a reusable
> building block and use it from the R-Car Gen4 matcher after checking the
> Renesas machine compatibles.
> 
> This intentionally narrows the R-Car Gen4 quirk. Previously every ITS
> with IIDR 0x0201743b matched. Now it matches only a DT-discovered ITS on
> an r8a779f0 or r8a779g0 machine. ACPI-discovered ITSes and the same IIDR
> on other platforms no longer match.
> 
> Keep first-match semantics explicit. Use BUG_ON() if a non-sentinel
> entry has no matcher or the IIDR matcher receives no data. A broken
> entry must stop Xen in both debug and release builds, as skipping a
> required workaround could cause a failure later. Place the matcher data
> and table in init-only read-only sections.
> 
> The matched entry still supplies separate ITS and LPI flags; this patch
> only changes how the entry is selected.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


