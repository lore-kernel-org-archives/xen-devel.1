Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0EACD6E75
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 23:52:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328772.1593092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHr6-0004lp-Kl; Thu, 04 Jun 2026 23:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328772.1593092; Thu, 04 Jun 2026 23:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHr6-0004li-Hv; Thu, 04 Jun 2026 23:52:08 +0000
Received: by outflank-mailman (input) for mailman id 1328772;
 Thu, 04 Jun 2026 23:52:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVHr4-0004lJ-Ie
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:52:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVHr3-002qWp-SJ
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 01:52:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a220f39-e002-0a2a0a5209dd-0a2a450ba2b8-48
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:52:05 +0200
Received: from [52.101.53.0]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a220fa3-212f-0a2a450b0019-346535007c5f-4
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:52:05 +0200
Received: from BL1PR13CA0362.namprd13.prod.outlook.com (2603:10b6:208:2c0::7)
 by SJ1PR12MB6363.namprd12.prod.outlook.com (2603:10b6:a03:453::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 23:46:45 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:2c0:cafe::29) by BL1PR13CA0362.outlook.office365.com
 (2603:10b6:208:2c0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 23:46:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 23:46:44 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 18:46:44 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 18:46:44 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 18:46:43 -0500
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
 b=osmmaSnh/GWPUxySpk2Ml6g9LOoMBKN7JRiTPSkdWkPJuqf0PL8TjAXljE1ZFVcLZF1VgIvmzLmJE8sitd6+DvE+OmYN/hYI78PQxtl9+WFGIdQn2CKXgmOXrVsn93UQaQ8nm9BsiOdoIf9JwjfnmV8G5BhM+Ge//q+Fira9sgPbcFddhcVgDUYATkvoc5OudHXgDrkIR5nW72iqPtI5y1au3ZHDcLmRbUpKXL2SGHYOUQ75OIidjc/bs+W8jEIzHAyyK9bONKlDRhfH9VGeMBdMtI8j9t175lPik4DKTyMSisRVxP9o+AyENn3sCqR80MPIPUY6KFPUMNpzwB5i2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9jLJUo0KRF9a1Emi4WUAg1Yr2QpnkFjH6PBbQy5L6w=;
 b=Ge7CgrQ6jue31mAuWpzWS/UGifhhb3sFtb4f8XMOZV9bkyF296dUbyxgBAtDanMUddghx93kM23DeQYGz+eDqFZW4ulKqVSCh/MbHnxLI1LtQ/5ld8GovNjms/cds1vc2azsSOs0OszYMntKtuM60TNrrdfeqesyxCIBSLt02Vj6tgJkKotLVb2k7e/S52cHWSalJX+Z3q0HtR4qTAtx0ArlllFEiTD9D/iSUrNgs9yTnFgidsoGPd1Z2WO6LSl6YFYcIGcZfwijmpSq6p39xbMRVGLQdUsPAdWk9bKIza+ld0cR5LNnBE9wK3+GhKlDMiexfTwVspYbLunBlrmeWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9jLJUo0KRF9a1Emi4WUAg1Yr2QpnkFjH6PBbQy5L6w=;
 b=27OlE5Hy7RIhd1K5y71gHSoDwx0gqupKyZGwLoilM9bIaXg3Y+ZB9fNkwC3zYbftvnsLm5QFq3BL1vR2DgeZ+vA4Z/6fbZCQanExuz0dE7NhC/OaQBD1yBbkaIi0OKvcwZGtzY+/WQJcOnmgQPK83QWd6bChkLkLdAQkJys6H1o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v2 1/3] xen/x86: Remove unneeded stub_page setting
Date: Thu, 4 Jun 2026 19:18:35 -0400
Message-ID: <20260604231837.804560-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604231837.804560-1-jason.andryuk@amd.com>
References: <20260604231837.804560-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|SJ1PR12MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: 08101000-98b8-425c-8693-08dec293891d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	MKIBCR/mnf+KLLMkFFtuKThY2HXm7LveOtSpHrtcK1550TI2TdTcbGeV7n57pHzNhsD0KcT3cLKNkaGtxVihjRTgMhnaRm1KiVRW/x8kSaLkQB65t4yLjM6u3ohEbra79bt6Jg2RdgYb54E1sLMipfO+AngyDUAECWUwgmc/lHJqY8Afu5gK430J1R+N2T6tfWWZdzGVtQy+/JTx9vrghP+kWMGOA44EL6fxU6vgyQTIwSBO5mzypoqZJZM59fgprvgQMUop+zK1aVIYKa/GL58MCq9CAHiNV2MUOTRFDfrRmAwHhrE1Il5XdO1s+MMiYKyCQb3rT9qNPckj4mY+4ShjZvK60iDOMDqoK3JhJ8YQ29AkEZmTpTKiXlO6+50ri7aJOoRQUzXZEcePLfhcEqIkKaM5XlXpMJQFPQeSHAM4ZNPZPf4uUm9FHtYdT2yzcZdRR7L8AXYUUXc68R1lfHKTblc+CEL7rMVmFhC6l+f2OwEwNRziIpNIqYhKc2xdfP5lye/7NOuxIOoG/LSWfO/B9mhCPWWzqWKr4jYenBX4qwnSEIMmitZ/7f7lX4wTKyYsAKjSpmUY0gVJ0xTJxgfSLfeZbBphUsJK3IN9pgRACtTW6q2B5xm0rUAXxCOFehoftFN0pSic6AQpIUm8CWbqnjG+pXQAurLOdLz6apTOda5q/djGe2E5TwUVNIQ0WE61f8KkBWBxjvLcUh6Kc/obtCRT+RJQgOv/HxkXD1M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wkabyFOyKczcE8u9AaSo1lTcyML1wU/ynJ48jO/AYLvwraWOFAJl02A6+uWpK+DmliuszNcdWl2YY2C1nl7C7HJMiHP5uKwVlWkuu5bQoKkNrCNk6rB95y83BE0dqmtlMmQOCmEBqR5pVyRJqRGyCLI8TuumQ77L6RJOl5PMdV/RgJigCaz7JP1IgklsWseaq0fJDhy8xL8lAKuHyvEu3Pc5IooPzTuKNVjVkJPbukvOKtDODsIv0G3k8RfPtGnGFX9ImYNhFVka3N7zjImpp7Uc084Xy57zVsyQpV12HX+231UAVB9XVlipbXq4eumy9jBFy48AVgWQ/P0/yqDjfc2Ot7+u5l/9sPEJ2wZ/AYhyqQozKOp8wSNZep++7gkS1t9EEvf1Dlg5D+8RpYZgjmKaHM2VuyQ6RVeAiJk/q1J6SEFNvBWK2Wp4Yju0ev1W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 23:46:44.9221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08101000-98b8-425c-8693-08dec293891d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6363
X-purgate-ID: tlsNG-42698a/1780617125-21183F3B-39CF961C/0/0
X-purgate-type: clean
X-purgate-size: 927

stub_page is not used in the for loop, and it unconditionally set below
just outside the patch context with:
    stub_page = alloc_stub_page(cpu, &per_cpu(stubs.mfn, cpu));

Remove it.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/smpboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index ff05955bae..7241dba621 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1091,7 +1091,7 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     memcpy(per_cpu(idt, cpu), bsp_idt, sizeof(bsp_idt));
     disable_each_ist(per_cpu(idt, cpu));
 
-    for ( stub_page = 0, i = cpu & ~(STUBS_PER_PAGE - 1);
+    for ( i = cpu & ~(STUBS_PER_PAGE - 1);
           i < nr_cpu_ids && i <= (cpu | (STUBS_PER_PAGE - 1)); ++i )
         if ( cpu_online(i) && cpu_to_node(i) == node )
         {
-- 
2.54.0


