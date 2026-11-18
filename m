Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B60B606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 17:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GJJwDQoN
Received: from list by lists.xenproject.org with outflank-mailman.1494913.1694163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjIo-00020U-J7; Wed, 18 Nov 2026 17:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494913.1694163; Wed, 18 Nov 2026 17:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjIo-00020L-GA; Wed, 18 Nov 2026 17:18:34 +0000
Received: by outflank-mailman (input) for mailman id 1494913;
 Wed, 18 Nov 2026 17:18:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xTjIn-0001zQ-6m
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 17:18:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTjIm-005OxC-Iz
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 18:18:32 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afdddc6-bab6-0a2a0a5309dd-0a2a450596d0-30
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:18:32 +0100
Received: from [40.93.196.34]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afddde3-4cb1-0a2a45050019-285dc4222752-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:18:29 +0100
Received: from SJ0PR05CA0045.namprd05.prod.outlook.com (2603:10b6:a03:33f::20)
 by PH0PR12MB7094.namprd12.prod.outlook.com (2603:10b6:510:21d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 17:18:17 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::63) by SJ0PR05CA0045.outlook.office365.com
 (2603:10b6:a03:33f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.7 via Frontend Transport; Wed, 18
 Nov 2026 17:18:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 17:18:17 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 11:18:15 -0600
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
 b=eYuH5Rt5usupHOAAvsHXP3cYWn3DI7s4bpThRt+F6r3TkVEcHn/Y6cwKxDCjjPoGamJ2P/wEyg37rI3D4EJ34TM/GS5lhzRYLFAyKeK2Qrxyz8wdeJmZzQz9Qs7AnBncD65AOIKuHRLw5KiZ4JyaPu2FBngkXDOstr1Lku5qKRpxzFCw4bJXeDYicpqhMSCIj+fpxZEwzq45yieDOLQwiukB+rfJAtK4zOlN6M6iaBedIvJegDRwsd3MQGMBZWpfNJX+gBirZOZxIvRXrv9uiVqHGvODUhMt60ZP9m6pXLKtdkjelzeoTfIU61b3xeGq90NW2DWEaDRjwK+96WHC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXRR6fTeBF53pzqWKqQqA7GaL2LUw6e0yfJ76TTC4Dg=;
 b=ATftSJAvrhVcbFkcRELuLYOrbzeaAWZohtnyTF+9HO+CB7k0T8w9YhONChxF6RBUc/JwyjnfQ/KqBglfI2Yp2xsgtjcAgSLPKriGnL5nCXo/URoLuRjp2XFoKKnMS2Vz9rG8rhmi7S93h8L0v3QftMxOlBpzGVcqW2fJ1vleMwIAsZJBT7VGciFZD8/2a20K5yWZYfKSu7hpJbUceCbIJOAvoZT/zFlrl5bH+NPHFU/9Mk9OWTJouKbqbNWvRGaHvjJ37+71RYyPb5nywwA05JxCLAIre+Ja4He0jG5VGIzcwvQc0xVi4CeiVEZ27B8chXTUj1S96oRgQu/7Jcvu0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXRR6fTeBF53pzqWKqQqA7GaL2LUw6e0yfJ76TTC4Dg=;
 b=GJJwDQoNBlnWmOgJkADyjtaCp7akfKr9XAS7fQX0W/MxNDHkj/FBUfQvLphSVpFP4096nNexAGUz3F3mZJFXFBxnEy2AjMILzqLICaVEPMek5lZlVm935mcGB4rCEjPYGsTEYTEjbYj5S8KL9NotZ9mfXcJyicOiZGVkzlkcio8=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>
Subject: [PATCH 5/5] eclair/x86: Scan in-scope files inside cpu/
Date: Wed, 18 Nov 2026 18:17:56 +0100
Message-ID: <20261118171758.1125066-6-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
References: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|PH0PR12MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a397d9-e2f6-4b5f-189d-08df4597efc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|261009223027099003|18002099003|22082099003|261026121527099003|261021123027099003|261028144727099003|261022105027099003|56012099006|261026140227099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	a5d5AkX6rivlhpled8rfWXdztzbJg4OnWXD86CjoRMxnHb90zRERwVdvwYYCOSOq3LlIfnX28aHz6GfHv2RIJb0If5UdjfZIDxlh34CFSMhWMzf6FG7iXEh01bAZECasmp/ctZRiT8kpcxgr9vzC09cV1oLrZjozxZRypDXHLVwd6CKTBj/8CwJ771wTG8ar+HBI9iQ3ynBwHbH/vEMAq1yGAuM+e0IqznFOjoJMevYTJk9zlu0bUOWcTsvrfZCwSmYWTfouPNUO+fEtpCRgxKgj7JHWoFPfJGR5YvgTYQ9YJ5x8a53FU11jJZxA1iw1LQRAgZSX7kx7ilvxtaVSPnxQ2pMRCmA0q5wl4PuTQn3AOyqk4UPFBVkFrt9p6Fb3r4Jra24swOAu/xivl0YLyyfocwcOAQjPK46bAvOXECMLqx1hVlaPmzj4PXNtTDTgi7WNS6Snh71nlHEc/PsArh/sxRkYlY1UqcTLI7SxEou/em8qhu5ZqAYgeDkHFs24dub8NqrmwSmpzTIETgdIhxAWMgUge/zAAc8KMCcJ23OIDglhFRw3YOjQgUunT28do5j1SmNZ6AGHOTA49o/yxT/YdV97JQx+0etl8rL2rA+Q1iBUzm+tMWkqxE1ge6kVZjhyTsnwCCg7+IsP2tiTCza+yjsKq9wwjZ/4jPE8R6qRBR4vka5MjMJ5sy5Rp7MH9CirTM5aZHGZervvgGSQsQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(261009223027099003)(18002099003)(22082099003)(261026121527099003)(261021123027099003)(261028144727099003)(261022105027099003)(56012099006)(261026140227099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+yfD3a82CdybH1mEgqcsMOcA+2WzXYEu2CG0yJA/6rKbqW3vhfk4aBgKbNRi2nadOOqTKyFc5P39CRBHJP2+BYVaLXu4FPD2C0Ouryfv+x0vGK9XHVUQR8zZDo16eekksFEcZZSRRoUYovfyUT1Y8NKMyWuEFdbYmdD+NisUa0yDPLf7q+punsySopieoJdu2uD7o9UTbG7S1I3FnoulIrlaOjdP3LDPSmwUj/dQMoyMFPH2HpDV9VtSORaJYibtqI100/H1i6jlcs2D6wpEWc+HlqBwrq0lBA2AQml2fp+UsieuIyABr+NjxQOTxWkTS3CozjtD2iwbbNuXc+/JlCpt7lM5aXQ6WOnctWZo981HvprUKdXpCFD3YGhTPyvRrCZa29QvhNb4ecrzUd5vFnUcqlFtLf0fswLRY26Ketf5bArv81sGwmGnAGK9YJ9B
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 17:18:17.3614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a397d9-e2f6-4b5f-189d-08df4597efc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7094
X-purgate-ID: tlsNG-c201ff/1795022312-F60AA2A1-454D7E58/0/0
X-purgate-type: clean
X-purgate-size: 2821
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Remove the exclusions now that all in-scope files inside are clean on
the regression subset.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 .../eclair_analysis/ECLAIR/deviations.ecl     |  3 --
 docs/misra/exclude-list.json                  | 36 -------------------
 2 files changed, 39 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d49af53055..9fcba4df16 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -186,9 +186,6 @@ context of R7.2."
 -file_tag+={adopted_r7_2,"^xen/include/efi/efiapi\\.h$"}
 -file_tag+={adopted_r7_2,"^xen/include/efi/efidef\\.h$"}
 -file_tag+={adopted_r7_2,"^xen/include/efi/efiprot\\.h$"}
--file_tag+={adopted_r7_2,"^xen/arch/x86/cpu/intel\\.c$"}
--file_tag+={adopted_r7_2,"^xen/arch/x86/cpu/amd\\.c$"}
--file_tag+={adopted_r7_2,"^xen/arch/x86/cpu/common\\.c$"}
 -config=MC3A2.R7.2,reports+={deliberate,"any_area(any_loc(file(adopted_r7_2)))"}
 -doc_end
 
diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 2b874dfd3b..a52f0d6429 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -33,42 +33,6 @@
             "rel_path": "arch/x86/acpi/lib.c",
             "comment": "Imported from Linux, ignore for now"
         },
-        {
-            "rel_path": "arch/x86/cpu/amd.c",
-            "comment": "Imported from Linux, ignore for now"
-        },
-        {
-            "rel_path": "arch/x86/cpu/centaur.c",
-            "comment": "Imported from Linux, ignore for now"
-        },
-        {
-            "rel_path": "arch/x86/cpu/common.c",
-            "comment": "Imported from Linux, ignore for now"
-        },
-        {
-            "rel_path": "arch/x86/cpu/hygon.c",
-            "comment": "Imported from Linux, ignore for now"
-        },
-        {
-            "rel_path": "arch/x86/cpu/intel.c",
-            "comment": "Imported from Linux, ignore for now"
-        },
-        {
-            "rel_path": "arch/x86/cpu/intel_cacheinfo.c",
-            "comment": "Imported from Linux, ignore for now"
-        },
-        {
-            "rel_path": "arch/x86/cpu/mcheck/non-fatal.c",
-            "comment": "Imported from Linux, ignore for now"
-        },
-        {
-            "rel_path": "arch/x86/cpu/mtrr/*",
-            "comment": "Imported from Linux, ignore for now"
-        },
-        {
-            "rel_path": "arch/x86/cpu/mwait-idle.c",
-            "comment": "Imported from Linux, ignore for now"
-        },
         {
             "rel_path": "arch/x86/delay.c",
             "comment": "Imported from Linux, ignore for now"
-- 
2.43.0


