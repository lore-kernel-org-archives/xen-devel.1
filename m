Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE543CC6B19
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 16:44:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448200.1664264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfcG-0002Oe-8q; Tue, 13 Oct 2026 16:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448200.1664264; Tue, 13 Oct 2026 16:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfcG-0002OX-5W; Tue, 13 Oct 2026 16:44:40 +0000
Received: by outflank-mailman (input) for mailman id 1448200;
 Tue, 13 Oct 2026 16:44:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xGfcF-0002OR-Aa
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:44:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGfcE-00Des8-Gs
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 18:44:38 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ace5fe1-8faa-0a2a0a5109dd-0a2a4502d328-26
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:44:38 +0200
Received: from [40.107.200.14]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ace5ff4-6ca4-0a2a45020019-286bc80e0ccb-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:44:37 +0200
Received: from CH0P221CA0032.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::11)
 by PH8PR12MB6795.namprd12.prod.outlook.com (2603:10b6:510:1c6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 16:44:28 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::8e) by CH0P221CA0032.outlook.office365.com
 (2603:10b6:610:11d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 13 Oct 2026 16:44:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 16:44:24 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 11:44:11 -0500
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
 b=MrGnZ77sr1KDPlTWPWSMe1LL2p0aHf6paT9wlYNwQsOLbbgSzLOyDOM4EvHlD4vKpYtS2X58rbGgU0cqEPH+cB07FOQFEEqmoGKTHmeURbBmfA9qSOt6MYUOswsJk7aHRFFBMHw4DsNhW4PxKMBMz63HQkKM1Yga3JxO4uOhlVLcG9bGlKCUtMw3o0H/j1UHa7jcbrx+m/3jQDdkj3SSjrOkqBWGo/dy8HtCaMU7Qd7vmGDeXs+N4L+DyMaID4S3X54j4rfKtsVS9g0UrtCAPcfJSvILQA32/QHzo8If9w55NtW90Skz1X2IbAsYnzegupJApeM+cZFw7QqR2N0oKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZwU6Sjg+jgCW0wNM7COHOGNdp+jY+I3apDmc7RdrcU=;
 b=fHbflLCx1kSXhC4gWW21uBMK8IxhsSoDGBwfpOgodJKY2gJi/Z142bhuCTS4EH13jWqsSZvPv17b76Ns1ug76A2yhxkHJSpQYLsJ13cZ0kTySoyEkAlu1e+njZcZn+3MGDikoUNjlHWxlENpi7tGVkyCA/oxaW+V2RuQrFPIwdWZbBZ+thFdyWT6Mp6XKrF0VSEKlKaCH9UYd9bGMowrEwsWQI7IycRk0fEal/qR0P1MDb1xVFlIi43FMEBnwruD6uvzdFXGNaaEpfRCRvym3YvN5RpEPVkOPdgmgez8TmMU1J8kt1iuCFuS2rK1ENAspFq2Jk52wcEOI+WBcbPQCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZwU6Sjg+jgCW0wNM7COHOGNdp+jY+I3apDmc7RdrcU=;
 b=mnn8DOHHGqPk98xu4hGJj/WeFLdBIRFvfgGG7JebJLuYArolmS8u/7ITOlAKBir+5nB62YDaadD+2JfOeywqrP05xi83Jg4KmvEZ3YWJfvwKpWqKp+vD8SC8N5N3KOsBIo3hzteYEPwVQgEgji2ATuhQkpsOAUKdTBfa2AN2p5o=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH] x86/hvm: Fix UB on defensive default case in handle_pio()
Date: Tue, 13 Oct 2026 18:43:56 +0200
Message-ID: <20261013164404.361893-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|PH8PR12MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ce009c-4117-4e15-94d7-08df29493d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|6133799003|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	sCLjz16AISPYJWJgK5BaixiZ3NyaDSfXF7JtmOGkFxetTRVHmJNNmtHC6bcME4OvS8JsqHXbj+RgNgqUOSCfGJpXFghWbWXFIndxRtwQ5H3i/sV5cnQYbWCEkY+cuLHTLJ4Ds4IHQcxsTUr2r8go+QGk302vOfwjHmnuMWMjJz6bzaw4jhbJZ3cK9WpgACVuT7RaoJ1AtaeCAJEn6Y9HGZcftwmW1LDW+K2jMq6mS1jrIGrV/BCU+oIrnDQUDph2+S2siivVRZiraMLV31kMv6+enGvIlHC7s2A7zdXzAY37ItfBI2vNb7cmeIkWW6riZAd6hkSGYh7GN2Wz6z6RcNc56q8fAkDb7iZlWV9gQcQtko35qGnnpdbkJvD+l9wc8jcrlwiXqF5zYZSGvP8PxLQbLThO6SML1Ova9Rs+Obvq7NoCeDxmQ8qUmErlWZLLOlAjnnms6NxrSwdPedRUu2XWe8Ey4KaDMYY8DlQK81ckjto4QHTpNvkkXDeh9dn19z781FSDii+vthEcKiRooquijRcV/kziBJI0ndehNfV7U293L1B2LNhrl/FmabA4yFNVS+ltz3DgSs1C+gGSuaHFz1m/2y+e1LkGXUNdGjY5D9r1drEYuQlDMtEDU4A9c+76C+JtRWER0c1eOo+opXYyYkfLWO+nCA3tdE+pZyyFahNtHY+Y/iRcUa5y0RgWuB7MgzIxbgPVK/co4PqXXw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eiCZqVBeq9998rvvY7Ty+yEFTJ4ctj+GXJ5b6CXfioM+wHFkw6I27ueIgSfDdopJJ1gfDnLfbFHvzEUm82ML/67MmgQUiHzJ9u+ujw+kBWFvzzrOWQ8G246r0d4RGcO7eAI83Uuh9jZa6egDElu7rYHs5w9uFeQi+dD6tLP82UQV217V5fmFChvG6aKJB5/HMKN418vZfWckUXOz/S7rBuZiHeTl8fnuaTelvWzGqN7og2EihwMWGlyLg3iECFUfPNoot1a+O3KI6vC7/x5rOXjLnwZlVIvVyb8Frw2Zp82RZM5Ztne+Wqj7NmCHLbv6DAIR2lpYD4eQa3BknMWrm0D0Vv0hBymXVpPMDigDgiIcVpaaucRiQBVCpXcZjh2zDjn41wVbvNSPBSSA82cPOYJNgjxoSk3ASVu9gI2ymLpr10f5rtduFxJ1PhVGvmE+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 16:44:24.6814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ce009c-4117-4e15-94d7-08df29493d46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6795
X-purgate-ID: tlsNG-720697/1791909878-313CC2AC-1D9EEF2C/0/0
X-purgate-type: clean
X-purgate-size: 1081

There's a potential 32bit left-shift (when size is 4) to a 32bit value,
which would trigger UB and tickle UBSAN the wrong way. Shifting right an
all-ones mask fixes the issue.

Fixes: 4609fc8eb04e ("x86/hvm: Improve error information in handle_pio()")
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/hvm/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 912e55d416..91cc2e1dcb 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -135,7 +135,7 @@ bool handle_pio(uint16_t port, unsigned int size, int dir)
     default:
         gprintk(XENLOG_ERR, "Unexpected PIO status %d, port %#x %s 0x%0*x\n",
                 rc, port, dir == IOREQ_WRITE ? "write" : "read",
-                size * 2, data & ((1u << (size * 8)) - 1));
+                size * 2, data & (UINT32_MAX >> (32 - size * 8)));
         domain_crash(curr->domain);
         return false;
     }

base-commit: 6b30eca0e388e5aaa4319c647a777d703d7ee752
-- 
2.43.0


