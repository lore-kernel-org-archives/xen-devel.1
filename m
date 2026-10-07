Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C17CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 14:32:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442427.1660003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESga-0007OG-FI; Wed, 07 Oct 2026 14:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442427.1660003; Wed, 07 Oct 2026 14:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESga-0007Nj-9J; Wed, 07 Oct 2026 14:32:00 +0000
Received: by outflank-mailman (input) for mailman id 1442427;
 Wed, 07 Oct 2026 14:31:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xESgY-0007Lj-KZ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:31:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xESgY-008T22-0l
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 16:31:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac657d5-2eae-0a2a0a5409dd-0a2a450b93f2-20
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:31:57 +0200
Received: from [52.101.52.59]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac657d8-b7e8-0a2a450b0019-3465343b5bab-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:31:53 +0200
Received: from CYZPR17CA0008.namprd17.prod.outlook.com (2603:10b6:930:8c::17)
 by CH3PR12MB8727.namprd12.prod.outlook.com (2603:10b6:610:173::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 7 Oct
 2026 14:31:39 +0000
Received: from CY8PEPF00000052.namprd05.prod.outlook.com
 (2603:10b6:930:8c:cafe::6e) by CYZPR17CA0008.outlook.office365.com
 (2603:10b6:930:8c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.21 via Frontend Transport; Wed, 7
 Oct 2026 14:31:38 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY8PEPF00000052.mail.protection.outlook.com (10.167.247.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 14:31:38 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 09:31:32 -0500
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
 b=OzHWDshsU1OkUEIpjeqoO493UorzG7w+6vX6oeQv35BSr0LT/M06rQCHiqtlF51q3hiDOumOpYGicA9i8+pgcwGt+GQdtsqBVGB0Bx12WUESQAvIpkzOAcxrfxo/fW59KOdfFv7Nvo4oIsFqWNLvjDvEQto+E2hhFpnhbMHDuMoIOyaPMwSfgnrml5yv4qyJc0uAZJAgEsqtQmdlPLQV/kKXzGMsHR45h8lnS/N3vXiXYTbp1Oi9MV0a1VK1Ohtj1WAvid5EN/VadUDH8q7JkwVHDU2aMKLbvkDrjkQcKTOMY7NucNgiKOdKsuwGCb+7KfveAim6Kwx2/CD5y0yv0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpzggtEvc89d4Zq2S3JWjnl+sYf63o/UJpx7GfD7Wis=;
 b=PUOP9ch/+RLDxy39iRBbzHpwwBRrlxWga3fr4oGGt8uUWFBsIyqnJ+yfvwq7galIYNHrddW74TlRUrBiesyQX2a18niiXXYbijdlipjynLRVnsgkyledYymS5M7cgYkhL849jjnnBuRCXZPH8aiu9iM5kTUwx3GokI+Ly3hK0HaojQQ58RsPus4WOPZv/Ec4CkC4pDGegVeiHPXnDJNwYayrCQfiFbRujQ6mjz0XbMOzqA1HL6ynv14tNa2LOeddzrWHpWmCCves+I/gVERTKwtySJlPPQ6jq3CZVABnAc4MZxakvkeAbA9i1HWFAtPgTwlGzfmD9IUqyhgFMXJQbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpzggtEvc89d4Zq2S3JWjnl+sYf63o/UJpx7GfD7Wis=;
 b=XlJa5yRzFI/B3M8aMfWbRhMtQFAb/77p2Md0bVRCDNLiTiLQLrtIZRaWOLNRHBXL7x27QkXRRjstfrCNqFLKeV151Hd0hizhURor50lCm9L9BsNFRTOStP/8AhdXmoW2oCGk5mJeu7w3+UUZGLlXYOJolibhOailtyu3MFDTDEA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/3] riscv/nospec: Make nospec helpers always_inline
Date: Wed, 7 Oct 2026 16:31:07 +0200
Message-ID: <20261007143117.757375-3-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000052:EE_|CH3PR12MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b0f4cd-4c82-4746-d6fa-08df247fb27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/1nG6vc+gn4c90w/qER0vce4HbnjqwW772jbfW7FeP6MYhjfNpweOtj8tatOGAiNVhOS3tU51Lc+vh2sEI+g+9q81Az10mZSlLR50WyCVVSGDyZGwAEBRmyOQDELONJk4BpJGp4GiVpzNf66G3GDYANbMwS2h7AaQmw3AWhr1tHXGFx7N8jHA9tGgoYMoJqBEF2e2+e0hHtFrJPAAngZjAQw9Pu+Ux6gOoNcOrc+Z9LJzp304O5+InpafKev87aQFp20rm4Os3TleljdGC07IPRNkMhxEgDrJRWrlMMfhOyC+k9NHEVGVQSUWe37pkjc8jYxG9VwBHBUHFlZoysVOmJoevKUjsqBjo8sktFE0X5mpSzAV8d64LTuUctIIicLNBK7CyhwuGsvQXzziqwjw4ikjDii83lMI7AUyhZ5Qr3tEU2O97hhdugq658VRd7ncWrVmwXEoGbCeEp2KdILQDTJ1yizXEZlRgfAWZ81vWvQLLCk2GrIlZwgseEubBHcteR/fAJJd0PgUAcC2iTOz5g8n9cPlPJDxv7sZM3pqmZr3gwJnTPm1GiymkvGEB89iu/ExU2hbdsEZ/UNZRp11iBq9d5y01RxKKJ4z32IqZJbRxEWVzugT/tQFJVklQV3Thvbs6BEYEHfK6OnkbWhvxJpXJyLiydIRpB07obrhgPPiUbp4yUyE8t55GGAL1AJN40Qz54xzqlIIyqDTq64Ag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	55CvLi0yJjTL2PgJ9iHJ+ZuJ2t9JuevTDqrkIs5+x31JeLt08+2YYE8eUVbNuNVefOE1oIEigGWjOfNwKxeNOC1G1ios71gJSdrCH26kjv8fPxJisLICNZn2gYr6dpolnTPm8968nc2INgZGd1DxfVa4p67VQGznPSUctRA7tlRfozueW017PvbAwwR8r51U2V10yqXnMQ/jXFoLTO7siyVo0ulxO4SCyvN7KDkYriXzQnVoYW+9C8zRaNNXMXGdyWG5qkxf1WAKqPebjQneTirV67JIdU3MmlkatsW6drY+K6d/TbCUu/EZ0r/zDUdMV7zebmZM/tmVPlSJNxCdTQzJX/gf/dKMTHOyexDUsnBvH01fjkrqcOC6oZp/9bUNSoHFoFHz8E+JBIUk+04dPd6sf3k7KDYPo733a9xx+mJ8NMIY63dtSuqrCuC21VM2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:31:38.3174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b0f4cd-4c82-4746-d6fa-08df247fb27f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000052.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8727
X-purgate-ID: tlsNG-42698a/1791383513-A86CA9EA-BA593B66/0/0
X-purgate-type: clean
X-purgate-size: 909

While today they don't implement fencing in a way that would block
speculation, once/if they do they'll absolutely need to be inlined, even
if -fno-inline is passed.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/riscv/include/asm/nospec.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/nospec.h b/xen/arch/riscv/include/asm/nospec.h
index f9b0241c98..f9bba8b2bb 100644
--- a/xen/arch/riscv/include/asm/nospec.h
+++ b/xen/arch/riscv/include/asm/nospec.h
@@ -4,12 +4,12 @@
 #ifndef ASM__RISCV__NOSPEC_H
 #define ASM__RISCV__NOSPEC_H
 
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


