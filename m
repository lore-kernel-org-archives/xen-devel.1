Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B15606A326
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2026 02:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5LM9XdBL
Received: from list by lists.xenproject.org with outflank-mailman.1477740.1683038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPVxN-0005RD-EB; Sat, 07 Nov 2026 02:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477740.1683038; Sat, 07 Nov 2026 02:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPVxN-0005R6-BV; Sat, 07 Nov 2026 02:15:01 +0000
Received: by outflank-mailman (input) for mailman id 1477740;
 Sat, 07 Nov 2026 02:14:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xPVxL-0005Qx-En
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 02:14:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPVxK-00EVQ0-Id
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 03:14:58 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aee8903-bab6-0a2a0a5309dd-0a2a4501c3ae-26
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 03:14:58 +0100
Received: from [40.93.196.23]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aee89a0-5984-0a2a45010019-285dc41742d1-4
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 03:14:57 +0100
Received: from BN0PR04CA0205.namprd04.prod.outlook.com (2603:10b6:408:e9::30)
 by DS3PR12MB740446.namprd12.prod.outlook.com (2603:10b6:8:43e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 02:14:54 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::89) by BN0PR04CA0205.outlook.office365.com
 (2603:10b6:408:e9::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 02:14:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 02:14:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 20:14:53 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Fri, 6 Nov 2026 20:14:52 -0600
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
 b=ZRYpL0Z9GyA9+2GxbKnx60Sw43iUYU+JH6W6Qn7acl4eV/aHzLFanqCOtcNTtUoVeQI7Q4pDDgwTbnvfvAL1xK23ohP/WailiXvgPt+95K/7VH/7Ey92mISsIPSE9rp7Z+BwKXtdhpkDr91pBMcakQ5rykx8oZ7K7Ox6dPFR9Ml2p0qUfMlf8ote6o8TT4LQ4Lz+KkSBeOEXzLRI6pjMvUbKm++4gWeb5TaO4B5wWhL38SId1cuoDxqkTNquqapr19fAfqoSzJ8qah8RTZqKkCGZrqs3ZOVbIi8o3SWp3jRFHyi2fegPApu0WMC6sXjFmW3iTCP+Ve/3smPOX6x13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YW0rX+bQbIc0bFUc3sRKftYB2+uxQbRjgb+eZ53kGK8=;
 b=UCHj+u4mM9vHBubMQeClDpOnPEw2o/aOUpNcE7I2yVlMC0K+qR28yPERgSR9w9sda1/nBT7vmJxnkbuoopSyu8bVTl0nbLBkuO5ZcvPSWZV9f9KVjHDE1K7De6g4NBpqORiVy2tYFNsjJZ+ONJ5nefwIcdMmG1H7pazIvCVb8mFWmNZ27DOYegMv/Jyk50aJ45Ch0exl1GJfDRDV4gGlZowHIk3DqcKj6Bxv7dc6vBXf5YWHpHvSZM0RrscEH+X/Ap+1ORTC6nQsmMcFfFkUnNEm3dJfFSCsbolOy9rKsSQC8n4pkUxN9jIe4hgjgpCQvIqLBNyyaKYbRg4uqJNo9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YW0rX+bQbIc0bFUc3sRKftYB2+uxQbRjgb+eZ53kGK8=;
 b=5LM9XdBLjRMptAV8hTrpd+Xvts1ZU6mHciDSx5ud/7WQEEn7wh3vCZqVZ5lCTiXLTj2KksX2T5ECJnvgvBMuhOR5pGcWIrE9lX6Ro9UUmJX1/3WirmkCUZmfL0Ahvt2gNieB66vIygUt7hfy4soogIrU4XMrR2PoJNvVVwjx66k=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/4] xen/arm: guest_walk: refuse a block descriptor where the granule has none
Date: Fri, 6 Nov 2026 18:14:38 -0800
Message-ID: <20261107021442.253612-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|DS3PR12MB740446:EE_
X-MS-Office365-Filtering-Correlation-Id: 01d68d3f-37c0-47c6-72ab-08df3c74e95e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|11063799006|56012099006|261021121427099003|261022105027099003|261009223027099003|261102123227099003|261026140227099003|261028144727099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Vc2pYzmyRojTZijePU42dBkOUOnnU5uzEe4y0kuCLFx0+zsRYNQU/FR5nbEWEE8nFx0MqvxXYX99XnLOMsCfGa0aF0ckxzEJ/90xCOnqOY+J6acyD6sRErloM4PEQs1mAbsKXWH+OaY1Vu3CpW6ySoz/3RaWo834QQyLiZ47VbskyUd8PXJIclJmz7KaRHPyH4/yw9zeKTCSeXn3LWV49tbUWWSCzpKPj7W7Nkvd1rc+vRvRsOJhPOljcy1e2fzPefB2GyQpm/EQYXyGEU3zo2HmAWVZ21XRzE/FkVZRklNlyCpgsSPl6x1gbYS+lG/idVFQ8BXm+QME155j91PKIapuTkBL9lz55kxHWvEbfinnuWPB/s7kFq3LQo+IV56dni0vz/YI2DcqruxKuTzxwaQIu+F7Mcv1mn9MW88utuwYGtdakJyJobPEcRrjhlv6vHT23i/BGON5Cvo4+lf+5C6+l7cPovsockr40ayebALz5jFtPHOGB85C6oJn+xCfpYwH/z3MWgWMQTxvhw4NS1sHpFjrHcazzQTJYiJRlvVsgDjCWSAjKhZ1knH6bE2DgCQ/eX+oSFpSAKvgJ3VCmN4k9JqW7PvZHfHhM3oWy2+hKE17N3KIO2+0J0uhbPl6jQEq5sLTy9hr0A0ctIPm8Aq4NvKlXPOl8QQkfXViDPBPrUjaH2NV6VPyfICqmdqr35lutddQK4PoXY2kpMsQAw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	THN6Ql5im/WlnsxwtPd0i9vYZT8ZJRyKWs89KzzqeMsKUVX+0uarxNIJxg2KFrYPDSvq34lZZHNJUons0zfoW/hN6QFNnNHivQvYwt8QmCZ+lKCBgUZYTUw0BiSjycycbn5moMZeC0ZnFJyapYXOPtzQI91pycnD6cuCn+WGvF6dEeoJAzys/oV8T6X2vhNuUQBsi2mfhvksrj16DGXakKMRjl55oEpfTBtFD+L2lZyqdW08mCO3xPaGc2tQIT6vPxn0k+L6/bvAkRRVltNyJVBzaBVMoXpjgSHj8OGEXzoeqLlugsZUnXN5jGNH4KgP7tPbkseJGUGgxVESwYOwPOsCNF++Yj/y8FfjKH43aLbNbZpVel5v87uwUeVx8Xp0UlvL24FRsNLufETvL3x6I7U830d1GnJYZH8T3J6wtZyaeraNFM1MmU7OPsrbzZs4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 02:14:53.8616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d68d3f-37c0-47c6-72ab-08df3c74e95e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB740446
X-purgate-ID: tlsNG-d62444/1794017698-C4B45757-ADB4DF0D/0/0
X-purgate-type: clean
X-purgate-size: 1641
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

guest_walk_ld() accepted a block descriptor at any level. No granule has
level 0 blocks, and the 16KB and 64KB granules have no level 1 blocks
(ARM DDI 0487A.k D4.3.1): the translation table walk makes such an entry
a Translation fault (AArch64.TranslationTableWalk(), J1.1.5). Refuse it.

Fixes: 7d623b358a45 ("arm/mem_access: Add long-descriptor based gpt")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
 xen/arch/arm/guest_walk.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index 09fe486598..e23457869b 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -533,6 +533,15 @@ static bool guest_walk_ld(const struct vcpu *v,
     if ( !lpae_is_valid(pte) || !lpae_is_mapping(pte, level) )
         return false;
 
+    /*
+     * A block descriptor is only supported at level 1 and level 2 with the
+     * 4KB granule, and only at level 2 with the 16KB and 64KB granules (ARM
+     * DDI 0487A.k D4.3.1). The block encoding at any other level generates a
+     * Translation fault (AArch64.TranslationTableWalk(), J1.1.5).
+     */
+    if ( level == 0 || (level == 1 && gran != GRANULE_SIZE_INDEX_4K) )
+        return false;
+
     /* Make sure that the lower bits of the PTE's base address are zero. */
     mask = GENMASK_ULL(47, grainsizes[gran]);
     *ipa = (pfn_to_paddr(pte.walk.base) & mask) |
-- 
2.43.0


