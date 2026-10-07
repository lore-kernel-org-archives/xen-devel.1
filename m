Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588FFCA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 14:31:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442424.1659984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESgH-0006j7-Sp; Wed, 07 Oct 2026 14:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442424.1659984; Wed, 07 Oct 2026 14:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESgH-0006j0-Pr; Wed, 07 Oct 2026 14:31:41 +0000
Received: by outflank-mailman (input) for mailman id 1442424;
 Wed, 07 Oct 2026 14:31:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xESgG-0006dS-9H
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:31:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xESgF-00CsYD-MI
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 16:31:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac657be-e002-0a2a0a5209dd-0a2a450c8f70-26
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:31:39 +0200
Received: from [52.101.53.64]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac657ca-f479-0a2a450c0019-34653540e761-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:31:39 +0200
Received: from CY5PR18CA0008.namprd18.prod.outlook.com (2603:10b6:930:5::11)
 by SA1PR12MB7222.namprd12.prod.outlook.com (2603:10b6:806:2bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 7 Oct
 2026 14:31:33 +0000
Received: from CY8PEPF00000055.namprd05.prod.outlook.com
 (2603:10b6:930:5:cafe::79) by CY5PR18CA0008.outlook.office365.com
 (2603:10b6:930:5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 14:31:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY8PEPF00000055.mail.protection.outlook.com (10.167.247.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 14:31:32 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 09:31:30 -0500
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
 b=nAt+MNgc0MzGi87zXm9MoD/GFu7cGp1edZXzixLmZeBejxcHKFfVT9oD0PRRRdk5FOR5UvoRzCN8ht1B3Z+4CYPjlbhOhK7aVE1AczLl3mZXmT+K8qKwRbF1BunqkY24UcvtYKcKGmOFskwuw94szvVmqbBA6zzWpadlEgM+jxjakLJO5e1hWwu7ctuFGe8W9CEq/D8niAaQAHFoAfmMCWT8HjFjAd6MIOx5lnfMyM+Rv7Dvsy1z3Jp6s+YDuOZZSXFX2PDmK0Cd5O59FynC2RuMLuIA54sexEtvG3gVk8ETuh20RHMLeHg3JWgUx2+PKlbdLkZuClg+SSbNDAIYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1k3d/RJ0g6r3Fac+Mwo9TkBEpOBTeJbujfVfJAO7g0=;
 b=SUjq8F5Fuk/9IN6RjwrjeFRILLy0Tou26j6y1ogGokdigdtcHKsYBAdKK/w7G72MaBXCPyfJxOrPb8PEJXEqgb+QhXs94UlhETA0xaHfAJZ3a48OsV5UeuUNNm0i6LOIt7RmmlNGhrEgeA+3xRRCvPa1rCy5HJZ12igeM8uMlVl8pG5oiHyfSeubAzLzXOaZUGzl4L9MqPk3ZYdoo2+5v8zFneSsmB5vLrvJhiU86Z0+VYvo8wt6T3HrH1SOKlMWCtwWq+7WKZiINH54U67E51JOM4uj5TFr2hdHngboIi+fHJ9Pv8yzOSWSFz5I0qjZWlx2eXh10k/zIGfXFVpiHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1k3d/RJ0g6r3Fac+Mwo9TkBEpOBTeJbujfVfJAO7g0=;
 b=Fn6+oWaDiqRRzNq4nMWr0cbD49NmYzBQuZ7xZqy93D8jNPCyWY4vInFJa/tACU2H+GcuPtaMATbt1R4IfjvZgEyr9cZ85At6CM1IoxpsFZ7l0C1ENEJDJwiNVtdb6eTc0HWKIzHDjaojV+H0fhiSTVLurjo0oHGvDVT/wztbybA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/3] arm/nospec: Make nospec helpers always_inline
Date: Wed, 7 Oct 2026 16:31:06 +0200
Message-ID: <20261007143117.757375-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007143117.757375-1-alejandro.garciavallejo@amd.com>
References: <20261007143117.757375-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000055:EE_|SA1PR12MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: 833effc0-e0ae-44ab-9a62-08df247faf44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QGlXbn4Fplj1jU+TP0IoPKn1HgfavMWr4DTMZenEmjop+HMHEjwC8PlsD5bkGMxHlLFiM8GEuLKCLb9VAGuSN+HmlUCxs7PiUg40WBtC4I0K9rMT52fRRROpZ1J4BeU74begvUzi531hCWKAwnmsSl9DwJS38usEisFz4HB8etuWbavVTD0z55u7XO7dSVquzBtxo3AQDgQvZBiWqJw3ZV5tAra0mU2ov/jbeUz0O4WbOqdokvkQPcIuDhJj8Ua9bYQFj6EgpL23F3TpyKCowdJLxzw3/5ZPnGP8tvIOfHBKS6E2F4zRARwn5y6TkYeukNQWRhJLHllpT65eo7mK+Do7ewlOi7GLCuJ3sIHLd5n7FBY0QAWd3eUMRZnYPXFLU0bOpwq3kfXKzM2OhUZ1sexlHkKoIKVKw9vL84+vhfAj3SwyzpWy0FU2WTCrWKAPPSANCRlSKJ9hYqYfjQDmGmCI3rvfnk+FGVuUyix1Jm4bYg03O6uYcDMEa5Qo7qWV1UD1C3cmWavxE5ed8Y0GOdcjcTGwkFxsjFry5hTqz8Fu8Agi/hQ/l3ARn3Tb7KqaF/eL+f6B1/m8NGHVa3FIG3NesYJ6S9/wSb2tQU92APEwUj2cv8MNGdTy9ePO8R3+0viQWY9JUPqnuNEe00U1Z+xBmYXsSgh88kzTFPeqm4LASFQUWqZRoNB/3PlGx8R8GZ32iWtllAdTKYpiHLj1uQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JRt3OLKHyUeEKvE7Ve4m/AexKm54Nlhw1SKfX1/VvGLANw4wuAWnbabMllpYBCCYu23ANQ1r8fIdeItj5uhKejof1odY1USjf5gBSZLwaREeD6blk7gYyDrcXFjnUPS/LaLsDP/NUKCYob4Nb9CG1DF8EI4V8hByMnwYp3u/LFtcK2Gp8pW72tKWfjHUeWKaNtK9gAg3ygxDdQABmMurlWbxHQiez4Jv7Mi5WQcztg/h2ZXrsbhgKNJt8Mhkv9N4LgtPUyjHWPFEMnM1iR6jPSBi9eR1nAekUiRSMNJL/Os++ajUTOJ7MZol3HELiwhXMcAIrP+tzfXuF63qQFcNsQHl+AUZqr38NewRHVDdUBr61rPu1QntJpA8uaFcQ8RJ1L/Gp4g35jjl114UMCx++D5SBzlK/8xht88VCXV2Y+yhBL5bNsUDmyPyrx84pTL1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:31:32.9216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 833effc0-e0ae-44ab-9a62-08df247faf44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000055.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7222
X-purgate-ID: tlsNG-d25034/1791383499-00ACCA5B-6990F1D7/0/0
X-purgate-type: clean
X-purgate-size: 998

While today they don't implement fencing in a way that would block
speculation, once/if they do they'll absolutely need to be inlined, even
if -fno-inline is passed.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v2:
  * Removed -fno-early-inlining from the commit message.
---
 xen/arch/arm/include/asm/nospec.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/nospec.h b/xen/arch/arm/include/asm/nospec.h
index 9c70eed605..ef0d8ddd01 100644
--- a/xen/arch/arm/include/asm/nospec.h
+++ b/xen/arch/arm/include/asm/nospec.h
@@ -12,12 +12,12 @@
 # error "unknown ARM variant"
 #endif
 
-static inline bool evaluate_nospec(bool condition)
+static always_inline bool evaluate_nospec(bool condition)
 {
     return condition;
 }
 
-static inline void block_speculation(void)
+static always_inline void block_speculation(void)
 {
 }
 
-- 
2.43.0


