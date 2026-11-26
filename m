Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFF5606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 15:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=q1iXNdOl
Received: from list by lists.xenproject.org with outflank-mailman.1503614.1699278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWbny-0004IZ-7S; Thu, 26 Nov 2026 15:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503614.1699278; Thu, 26 Nov 2026 15:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWbny-0004IQ-42; Thu, 26 Nov 2026 15:54:38 +0000
Received: by outflank-mailman (input) for mailman id 1503614;
 Thu, 26 Nov 2026 15:54:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xWbnw-000443-0w
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 15:54:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWbnv-00G0lP-DU
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 16:54:35 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b085621-8faa-0a2a0a5109dd-0a2a45018382-42
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 16:54:35 +0100
Received: from [40.107.209.27]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b085639-5bcc-0a2a45010019-286bd11b2daa-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 16:54:34 +0100
Received: from CY8PR02CA0023.namprd02.prod.outlook.com (2603:10b6:930:4d::20)
 by PH7PR12MB7454.namprd12.prod.outlook.com (2603:10b6:510:20d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:54:29 +0000
Received: from CY7PEPF000000F3.namprd05.prod.outlook.com
 (2603:10b6:930:4d:cafe::1) by CY8PR02CA0023.outlook.office365.com
 (2603:10b6:930:4d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:54:29 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F3.mail.protection.outlook.com (10.167.247.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 15:54:28 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 09:54:26 -0600
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
 b=TRzXTTrY5Jc0ZuXfugwEad6hZLcUCR9KwmJeOQ/g+jCLkLuzeMm43ikINUQ1Tj7QQYn4OBBE8do2vcqmXbZ10mTiXJOVLLS9xVmuwQ7vqxWFrhPThy+uHh3OCOOnA7hRs4RX6DPJtN7mOOnV6bmf8ws2qwF5lBQAV3F1LqCHUrfZDkIMdEw6aXmP3oQ6cd9gjQEyQNqjl1q8k+R7MnQVp/9G85pWYcTjTPwRIk9rIcMSL3EBq3uFqpJLKEFFUl1LIKWbTNqiFU9djezQapPN+8226nuYCi9Wlkn3KJXr4cFDjG2tK0RbabwyS8vIj40CpvT8u5+h7Bvj3V8lWmBq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5NfMHexFc1qHzDaJYVH3zbpgo3bFrCeR45izpidfP0=;
 b=ZSYpWUK9i3uxg3se11j/Hdd326J1F8wS1HObARe5xbrHBLMC1H27lxBh+GhFCie+dk+vWJ5L0tNx62f9zYKlZ8Od2hA6hVw+ewmqWBVgtiJUhQqvcrux285ISSfqIW4+kFRmDUXomWonDog5D3bL7H5jTygNscqEVWGuS7xHMpFtDg7dhP6SXyoeMnkfUiqk0CcEcmarWXp9AM8fjP7HaOF8YvUFEEsYa48PD416BKLLf7NE4IJczl9lLEosPHTWvxvWZlx0t5VkXFUrn/CQuMNJNRE44SqUZY+SNYaBbrLcIJdXmLBmcDHJQ7jTowzWkpm2KeksOXzpFM1oBhVNXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5NfMHexFc1qHzDaJYVH3zbpgo3bFrCeR45izpidfP0=;
 b=q1iXNdOlZW+O+h23dgz0Pz8CYoWfX2Y4uQnt2EE7dpl4fHKmwDz5Oil1w2TzScrCzheDYMCmBSorhh315+fe03xghKwkPc+FyxmvMtHSyCXGUcZM/ibRQtmV0ihXqja6znlP0vPzIW3lyLAWhQf4njzo3rUEecrqqEAsqZRb3mQ=
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
Subject: [PATCH v3 3/3] eclair/x86: Scan in-scope files inside cpu/
Date: Thu, 26 Nov 2026 16:54:01 +0100
Message-ID: <20261126155404.3996205-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126155404.3996205-1-alejandro.garciavallejo@amd.com>
References: <20261126155404.3996205-1-alejandro.garciavallejo@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F3:EE_|PH7PR12MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea1c633-3e53-473d-1dbb-08df4bd58dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|10067099003|11063799006|56012099006|261028144727099003|261021135927099003|261021123027099003|261009223027099003|261022105027099003|261026121527099003|261026140227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LkGXb9VVIjEMR9zUI4s71DsCpE24miIna1ipF1ERSVvAD5Tj1qWWjFbRZok6ClKNbLwV1EYUq8husVFKS2V8r6pm4m17wRR+0w893m3beVsfxqLJM0ykfUE4E1XSnnA40lwx6XgeMe9U7souyS0f5+Rce2UcTxvx5H811VZHoez0rqr0DCFzfiE4accDJWb5V1z0pghLpvFwj0yfRl+J5AgNtchRiMm6Rg4rbHZeNPCwe4/lj4WELfKpqXOXnLjQ4VKlqit/vL/a0hiyewtHlSSgf/BgTNnafcTmYQm8P78+lRGltXZ0k8AAY3astXZ486U3Xfnj2GmQzhDswLeNLLBt10C9aIb1DW9wXT/pySoy8BWxoXizkJ0qidTLeYio1atPXHDXfPFCXdCAaqs6a4CNfoU/LBSFH8peAsG9RN+54TfdYB+QchRuR4/E4bFoDbBWDrRpG0yAqRfp7+Dr66bE4xt4zNh7tAbYtq+qf9hHqscZFJAVugMxqw6MDhrFy9StliZLiGexBWp3PlHehT56ii97yPBp6cru7WHbltpo30/ru454wuhSY3S/tOij5kV2FBp+VXAJL7qQJLtCyRnR9TumzCvpC35Yil2/tnGHK1LniO6GfWhzVmii+T5MaNThANLN6xW/CI3Mb5woaunkmByDpgOiM+FHvAW7EpbXAd2Dyrt6UJ6fv6MnlnfIOMBYcI7Bl5Vt2sTRMwRYTw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261028144727099003)(261021135927099003)(261021123027099003)(261009223027099003)(261022105027099003)(261026121527099003)(261026140227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U9mWJ9pm4BJYjBCxlFOc7QedCbqvIQde8qof3xSSNwiG83cJ8zphLsGFdFrpATmqUavUBx+Yk6KnKGWQThpGPs5ETxMdVl4UpiYzKHun2JG4O0sJlj17GvfijshwgGW7a3GOfvQ9G2vcWcFVENA5pAc2QuTkbdS9advblOoE2QgxUUSgJAoO/rx2MxIZgVRTi8d98G3hol8zJoGv9BC5UXZk7GYANB517hjyPcUtWzpkU6rRtnkGMALTUilw4GBVkJXxRXon4Avw49qOKs6KMTcgRQM1E6zn7ykGn99CWaTos+IEVz6wRHb+frWjZMH7mN90ftzoIv02PB7dSxU8RBHpwUGXnWykoYYtPGicNanyhDs5DWWXYiN+OXF81TqmYM/xpG/3q19E1KAzTp6gXDdSzLq4LjcoM6bLJd5u1glWsM8aTIU3jQCsszKSrIRy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:54:28.9265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea1c633-3e53-473d-1dbb-08df4bd58dde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7454
X-purgate-ID: tlsNG-d62444/1795708475-4D55D5FD-8C57F6C0/0/0
X-purgate-type: clean
X-purgate-size: 2876
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
Acked-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 .../eclair_analysis/ECLAIR/deviations.ecl     |  3 --
 docs/misra/exclude-list.json                  | 36 -------------------
 2 files changed, 39 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index cdcdb4622c..6f76d3c553 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -189,9 +189,6 @@ context of R7.2."
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


