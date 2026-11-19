Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F42606A33E
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bpKvQ8W7
Received: from list by lists.xenproject.org with outflank-mailman.1496489.1694971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU3OA-0005NQ-41; Thu, 19 Nov 2026 14:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496489.1694971; Thu, 19 Nov 2026 14:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU3O9-0005NH-U2; Thu, 19 Nov 2026 14:45:25 +0000
Received: by outflank-mailman (input) for mailman id 1496489;
 Thu, 19 Nov 2026 14:45:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xU3O8-0005N9-MQ
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 14:45:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU3O7-009ksi-Qv
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 15:45:23 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aff0b81-2eae-0a2a0a5409dd-0a2a4509db76-2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 15:45:23 +0100
Received: from [40.93.198.38]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aff0b81-be1a-0a2a45090019-285dc6268d4c-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 15:45:22 +0100
Received: from SJ2PR07CA0021.namprd07.prod.outlook.com (2603:10b6:a03:505::23)
 by DSVPR12MB803185.namprd12.prod.outlook.com (2603:10b6:8:3ea::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 14:45:18 +0000
Received: from BY1PEPF00026959.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::8d) by SJ2PR07CA0021.outlook.office365.com
 (2603:10b6:a03:505::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 14:45:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026959.mail.protection.outlook.com (10.167.244.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 14:45:17 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 08:45:12 -0600
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
 b=EFl8jWA3O1r0nncjQ+arQRjYyToDHmib/YColHRQPbYjbdD7kLTngsnvTew6e9tw+xCdCSRua4dGFjZmdhsNqE2WWN/Pi/wM54OaG9O4cMuTC7lVhMx/zSYoXGTwIybLht3KCstngk7BD0Uzf82RrD8CLRmXfGyPRQdfnKNcGav1NGX+EBCTb9bnb+BHwkUnRKCxa5HRjv89Hzo3KUY05SE375COOJmg7nsflXOstgaatUaGkiTjHTQCQF+8TfLnXFTa7fwhPHHK6AkEUjSyMwE8o6IKf9r8VhO3k8Q7zBkfDtk8m1+NLNrHtOWH96TSd/hrXhX59WDSnjQdODbaOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjE680tCzHv7ThRN5ULaAh4B3wEWHe2LOVsBNo7a9Ys=;
 b=ud4IV4D8tN3YdUOd0xlrUrmkT5OdXc3qg+z7gBvchRXrtpUVfDV19IFywYiKyldJfW4IShVr1KqKn3cczDabuXQ5+MJEiuxnEcdEMNJrD/mGvO8VBOQeeLyhAzF6MoYIj5tdiFUw+Z0/TwVCZeyiq36VnhmXq65PhulqVGZPPW29JDzOsaQvaFBzZOyXdC7hdUHDtq3ZivEX8lTHxQObiJl0SEwK9/KVWGmWmYbsKWJTuelDr6FkrIp3S1GN+oW6Idp0ehbpvWSy9wFl2HSavOgB9pqyLftR34hqcBHNc+z5GO9P2muQSPOq+s31YNG4l/HzYeSEN/pMsHp2H7akDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjE680tCzHv7ThRN5ULaAh4B3wEWHe2LOVsBNo7a9Ys=;
 b=bpKvQ8W7k51d33lGJSJV1d94ld0EEhpb/vN0k0MudMzUBCWBCboxs13vgGd0tipdHPUpY/2gF3HCKR7sR962yAL05cS+rTTMi2T4TiHpNNNc+aXQcTvak8Gn5ArN6foAUK46BgFkUjq+vZnxPWHgtnY5YxjcI/0geg1taLzfuLQ=
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
Subject: [PATCH v2 3/3] eclair/x86: Scan in-scope files inside cpu/
Date: Thu, 19 Nov 2026 15:44:50 +0100
Message-ID: <20261119144453.529009-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119144453.529009-1-alejandro.garciavallejo@amd.com>
References: <20261119144453.529009-1-alejandro.garciavallejo@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026959:EE_|DSVPR12MB803185:EE_
X-MS-Office365-Filtering-Correlation-Id: a675e828-1352-4c2f-52f7-08df464bba71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|10067099003|56012099006|11063799006|261021135927099003|261021123027099003|261009223027099003|261022105027099003|261026140227099003|261028144727099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Q2BkFhLfleCFNZ4NzYOPkeh7tFRu0bp/TFu5HTvCV1kPJKJMbgiEQhIb/sIknHh6Chtk+6TH2s3205bNHnWWYVx91S6HqgwYwIKRAUMQk104umWRymwGSGdlhxctuj/Nnq7e0qI5j0Ni9p5WI9h8ZQud12YhREz4npfaGSE0TDBiAt5G+ezjULB4FyCGTluY7MZB+FRA8259c40sCcmGw+dm2ZKim7opmq5d/jk/Kz5GFAeOvIFaaUBvKEVG92Z21uAoaWtKl9HiKxkqczHE7T0SkDkWtG7P3IVqXPl1SFTs3QL4LbOJnyZxTjPuEWMGfrrbyQiZTHAw9Ml6VmuJDpiwWvQgpuUny3LLp0Lu4p3goNCEg74HUPLRIEDfV+vE17N4pFaUaFPH76oA8oUHz+qrDnpXhyQSvjQKygSPfPLh/LZLi6dyW80HUCGdpz+Nff61HuqepJbCLLuclfMn1jm6hKJ1zksJnWwrn/ePbQsabJmAhaWWW95IBR1sWCrg1NFf7FX1XIdmoKyDwenKrH8G7kXbvg1DW561fK+6rJyr2I/szdrY7LifOMIB8Yx9Tc+TojmO6ccUkMLHIilLwYINn5cRXStjiam66BZQWfXbtN6n2jPvIY9ETdtOHE+Tuycxkw0qOJfgUdN/9YoQR9YSGmzvAyFTDHpOVlz5YUQFQFMtu8BpkYikfLY5y6afhivIOE+LeAvQEyZFmp1JoA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(10067099003)(56012099006)(11063799006)(261021135927099003)(261021123027099003)(261009223027099003)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MbFvVK6hK9lrA6VShk3QblSND9nv60/k18k+6WVmZ8nQO5KnSxxgblYT8uP4A1OUkrV5HQWFE5tkM3AUQw6jpv97h0G/sWg0ZrlCDPRJ0nSPjt191Qd334c7ZZDNd59bWuckPfFaav+oTF5BR8wjlZd4wfpNIl7kTPogBNcavHk6mrfHxBl7hCxiG0b2Fz+XPJ7JYZgJMigXBd+qudQoDwYR6QrxUaKkW9FbcNyfubn3RsSK+Ou1qs2/OjCGjXv176d7XPCMnWC0Tbh0tLWtucgtjc1FZLN1mqr5s+eX/cM/N/E85T4MtP4kbKCdkZRHDmG8wTIR+jjsDeNJ1Xz636HrJBJTzbvXG4Dfy5/CXIx6NDNNVVVGTj2f5RUJKJ4HfjOCG5KP/CPP30H5MkqZgWxgO0RFqNL2dhIZ/7FKHpNt792Zq4psHfQkILfc4z95
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:45:17.3373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a675e828-1352-4c2f-52f7-08df464bba71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026959.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB803185
X-purgate-ID: tlsNG-bad1c0/1795099523-FCC15034-4852C9C7/0/0
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
index 58af4fb5cd..9aa443e8fd 100644
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


