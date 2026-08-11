Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFA7C5B572
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 13:08:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388202.1629416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtmDb-0003xu-T6; Tue, 11 Aug 2026 13:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388202.1629416; Tue, 11 Aug 2026 13:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtmDb-0003xn-QV; Tue, 11 Aug 2026 13:08:35 +0000
Received: by outflank-mailman (input) for mailman id 1388202;
 Tue, 11 Aug 2026 13:08:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wtmDa-0003xg-Si
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 13:08:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtmDY-00BAgn-07
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 15:08:32 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a7b1ec0-8faa-0a2a0a5109dd-0a2a45079a22-20
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:08:30 +0200
Received: from [52.101.52.63]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a7b1ecc-b4ea-0a2a45070019-3465343f60d9-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:08:29 +0200
Received: from BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::13)
 by BN7PPF8FCE094C0.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Tue, 11 Aug
 2026 13:08:24 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::2c) by BY1P220CA0016.outlook.office365.com
 (2603:10b6:a03:5c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 13:08:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 13:08:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 08:08:21 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via
 Frontend Transport; Tue, 11 Aug 2026 08:08:20 -0500
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
 b=c5IuZPCMbt+iP+iOdd6Dvc1zLyHQ8WXZHqYdUxsrqaLgAh+1JVG1ElSTi+rBYNWcr7jQj2s4jOaBIqCVe8PDGb14UjXXy9Jo4MXoJCQR5YfrFFwVxGHqOUvL6spCSXg+8hMjbqA7JBeYhT2uZgohuKR/+EMM9834UjdaUsh6Pj3i6o/G40rWOHo5anB5PbbKY6Z2OGCM6RUNo1iHTkUu3IhSrmrxVcRnFk1L8vUpKzhigRxy5dGKihB/9/ILAi3OcHYs59dhglONzKhz/946Hcil8CnCSozv8Z9WllFZvK52/snzXF1Xb1z27V8MChWEhFcq1RuiJVsAZVYVSCc0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPXk2uXH4OcEznZV95T4XSLF5H38ut8UVpU/X0q01fY=;
 b=fD7X9M7hLkhHhTJ9UB076EOtYvR/bAR6xtgrLA9kpixwj7iJC9HstXPoSjZFiRDkAEOsfzF1vQQbRoZZynhoOdRF+qd/PIYnM5ZEbcDu4oM/jo8L4dU+mt+tyXvaY8wKQ8hB2vvTXf3mggTYLlmZt6S+jT0iTpbWIAoJjzOHhLHwkhs1gh1txa+MvfuGN19Im84Kb5A1ilouoMtStiUfhC1VjWLhUY/FqYVMkK29cDG6CmkZILeFpQ7jdVlCGKXUzGiV4YA0vnkDr3yE6sPXfyRU5fJHx5ooZwvy7mhFgq4SKfbHW9GACV59bGhQoLCuMlvnhAnQVwtijo/Le32AIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPXk2uXH4OcEznZV95T4XSLF5H38ut8UVpU/X0q01fY=;
 b=IrKymI/Vl0b2Y7PXNwm1E3hsHyb/2hdIQeL/KXfy4B0hdwlwkQIoY1tGGYmAVbC4eoZk0l0ZZF+MTg0FLvfOkyjd54QEaHCn/TuUhpvaYC0ABKplOR4hJR27Y4lTHJz7W8+tBB3MKHkS8y75QNGlRTImkzo8fdh2Ji9GNctRWwE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] xen/arm: remove unreachable EL0 handling from register emulation
Date: Tue, 11 Aug 2026 15:08:16 +0200
Message-ID: <20260811130818.123862-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|BN7PPF8FCE094C0:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1b67b9-1c5f-4880-e601-08def7a99ee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	wP2d56Pkap7uAJ4aPDPZmu6dNk/u4ChH6mUeyojQBhIyrlvSo1GVjwl30xKQyyWjCwHOYeviOxUMOpBATo6AEixQMcLKmVqzOX+89wW4RkQDMPlIh3BI7Kf2fWgU6xeqLhoRDZ1BDLMo2QDrQrIuu8cqYsCrfHlbHhPy28NWnE5x74VP4OF3wZa7rd0/jVzQkzwM1SgJJrqPYQ7Sy8nVfrR2m+9yskQYlAgpj+KCe23mh/9CHRLGkBVGIw6lGBxRCUifGRmboYfgP/aoMDYWLBhQVGfi67auwlSrLvI8GUheSxrh+UguDRXUKIq9ewmSh7DW0v93h3CZSrYM40frcmRMg/zkBloc7Q2kRgoBFg9RQq/sBeEGRgG1Ev1mrJ3tlYvr/pD0LAsrsQuwtLJT3vL+CiS8ye3W908FqKa9ZK51DmN7VGMtL+d1wN/WPCV3wH9udqxZEYPoOFP90OwnRkut0TjRRnEsLHfh347i6qD3Nc6QWtxDZbdzS5OC2SMRI7IM8IuNQE2+CPJ9HkDhYlZqUUNY0k1iOL5ZGeF8wR56/g+LIQaOgTgnChzWRqLUa+7quIKYiNto1R3LrkbCDXPnidB+Lz33WCUrVy8xehz+U0lhpJ5XSQxAoUAifrpcgamj/HY1kBJMTdUf+kZBxl9OAcTxUmXzh7yOsIeiz3653mI8pS6DZeuJjGI37FGkwMQqxqPDOtDJhtfn/YaHpQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UpwgALeu9W5u0SdQfu0F4g0KyNDonNlBdGHahwqTsrqAvH8DAoigU0u+nXt6X6/WbBuSm/VUzCEtL9ezvCFv8iNRN/Y4/Zrz95KMJ7GWQGwININSrGvSRjEvhYYtHWJ6K+cD21heUBmPG4P8C1c3AoWa205CNRO9z1H5HjrW40urTYKsTSW28QE7jLs9cP6Itf1x9xhGJrs64vcHnS+FBaYQTC6UjlixNt8N1JVDyPC+J3ju9a5+qxRL7O1PZpc9Qi1ZZcX5tAUVxXXNsL44Fq74RzzDrZMEj8KXLbyVk9MYEmdLbcS/cZFqCjAxWaQEjQRLHnnus0IMJn1MSNTTL7Dyduj66e1RC81IZrVal4nrkbmDmfAFKvlIOaaNGbytnAzt2cLhNl2x8NLcoLjfi1PxdvSoDAbaXG7w/zfSvGD4gVdWtXJbp4F9x35nU+ZT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:08:21.9155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1b67b9-1c5f-4880-e601-08def7a99ee9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF8FCE094C0
X-purgate-ID: tlsNG-ef75cf/1786453709-36CDFAE4-25BD2EF8/0/0
X-purgate-type: clean
X-purgate-size: 344

Noticed while reviewing recent vsysreg patches.

Michal Orzel (2):
  xen/arm: drop unreachable EL0 check when emulating ACTLR
  xen/arm: drop incorrect EL0 accessibility comments for
    PMINTEN{SET,CLR}

 xen/arch/arm/arm64/vsysreg.c | 6 ------
 xen/arch/arm/vcpreg.c        | 3 ---
 2 files changed, 9 deletions(-)

-- 
2.43.0


