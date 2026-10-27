Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D503606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2vabEF+1
Received: from list by lists.xenproject.org with outflank-mailman.1462200.1673243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLhkr-0002An-1Y; Tue, 27 Oct 2026 14:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462200.1673243; Tue, 27 Oct 2026 14:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLhkq-0002Ag-Uf; Tue, 27 Oct 2026 14:02:20 +0000
Received: by outflank-mailman (input) for mailman id 1462200;
 Tue, 27 Oct 2026 14:02:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xLhkp-00029V-S4
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 14:02:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLhkn-006s6k-Oc
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 15:02:17 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae0aeda-8faa-0a2a0a5109dd-0a2a4502c90a-44
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 15:02:17 +0100
Received: from [40.93.194.53]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae0aee7-6ca4-0a2a45020019-285dc23555da-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 15:02:17 +0100
Received: from CH0PR03CA0232.namprd03.prod.outlook.com (2603:10b6:610:e7::27)
 by DM3PR12MB9325.namprd12.prod.outlook.com (2603:10b6:0:46::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:01:57 +0000
Received: from BN1PEPF00018073.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::8a) by CH0PR03CA0232.outlook.office365.com
 (2603:10b6:610:e7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 14:01:56 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018073.mail.protection.outlook.com (10.167.245.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 14:01:56 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 09:01:56 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 09:01:55 -0500
Received: from APPOL-18KY0J4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 27 Oct 2026 09:01:54 -0500
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
 b=qXy9kQznZ+/tUTekcTHLOQVGnIZ9tdAS1e6jS0eLkYTUAHgyWXkrS3oEZjk+iaXdn2/DvuonL9iLcCFdh6RZrTperHkgYsWeoAJ/UHAjFsMXX4JQjTXX3o3OLPAv+sRahVZTzJKexwtG+qRNWj923a+xlVD4yiIXfxB84TJbSg/2lR+prBN/ibhu03UvDHXfuqwfNDLdErp+hbLD1nlaxPHEKa7WV+sutjPjEEfSBMH7XQ8HzBnl11YRazWGYWFe4goxrTI6NqPgvJCJm7arVTRG/lcK0ctuf8GDg6IlG/+hn4p3NecnbymQuJPjT9ZCcA5UsisCZuMHUQFT35bDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfx1sLfat0z31OyZ0i435/xRrzrAwm1ta/dChDVIAPU=;
 b=ECooy6thGGmHswODFowXBMoGfMDgK+jpuLpwDTLBSs2MmhPeLjriG559QLq5jHr/h+vfY79GFybWuoLzoZp+WL9vOeHVyf/FZTdksOcl32A2y200QUGjk5Of2OX9qK9kDZfSJj1seSMLRpewyPrJPDIQ+LQLVjzZOGd29x4DZazsg9yuF4BtLWx+G5bX+QKp8/y+SW9LkHpkTzC2/+BEzq7lTKOeWAW5KOGSxfXD++Elph+3OvJiDw5cHFLccsSxQqB2Vil/cAZTYgFD/0NDBx4rLqgkhih4TbHx2sztPPLS8RDGtlLf7v1WAKl5hMcLKnM/mYVE3QJ8UVQqI1ml7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfx1sLfat0z31OyZ0i435/xRrzrAwm1ta/dChDVIAPU=;
 b=2vabEF+1zypjWFqclm5k8lViFblPgNdNEAQ2/DrMVAXgzJD4PYPtgUzQKt/iJtHJ85F4wqA9lT/OvJPacp6QD1bzMgqjRbfgMsLEOSKI4LG2a2i1rKZXbinvAb6A8YOvlcXwlfJQ4ZXP3hTtw59ZAwJvPKv4uCcxScJXgsPKeQw=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH] xen/dt: Drop unused function parameters
Date: Tue, 27 Oct 2026 15:01:18 +0100
Message-ID: <20261027140118.176266-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018073:EE_|DM3PR12MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 25cf9c3d-a0ca-49c0-ad3e-08df3432dca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|261026140227099003|261021121427099003|56012099006|11063799006|10067099003|261021123027099003|261009223027099003|261022105027099003|261022075727099003|261021135927099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	Z/biwJNxTLZjpDykNnCnKSI8cOksU3Owsp00OsVZxp+DVZOasciJSaR2+ArAsZ7l4mAc/9yFrn4XD/kpa++3Abik0cIIj5QrV+B0XEhGW7eq2hF2GEgVsmJU1lTOThzpiZBhg23bu2aTIMPt34p48KUKyN/xi2ekOVnCUHC4EkFVWbrvRhJy+Q0cprkROzl8pFJo+JjHXkiocKkp9AQLW8oXFNcl2CDuV1aet/E4ZtWI8Q5tAuWj5DTHUJzjr2KO10X/WNb1qj5QLoV4FI9cm/7fxv6AYGbJjCQu51qLJsOJYlglJ3gwURc3i1ue7jhymgrraPd49qExvpCi4fmirHRFu0M7yWPeu1un+05T94LF9q5vPdmFXq5F1VeotUXbXtfj/oDg73dPNVHrObHIGevpGQ0BHFC2szhDKWQ3JvWz3jWmgU5KgjbgDxK6J5N6LPV+DIiXgwmePySxX+xCC36NCIgPFKiDlxKmB8j/KNyPTFaTuqO6qAI3857IP2n8kBPh534zKCQQpULHLnfMdA3vIZeh6CKkp/xNdlZ0cEYQIk9maA2VxGAzv9/y0Q5WO8uNV2+unhEQPsgDKCzr9ESGeLoabmpudF2n0lJ8aCFcDobEZ58zsxVXcE5tCkKOp0YfwqPGc7mqVZ4b3ZXwrQDvCFZYOSV8EQfwmfLgeDWmSBLwOHcqtXLxbcQatmmZbMHmDRODqRhqmTC298pGfw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(261026140227099003)(261021121427099003)(56012099006)(11063799006)(10067099003)(261021123027099003)(261009223027099003)(261022105027099003)(261022075727099003)(261021135927099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GpTHMYhlNsNYhGYByLQmzvFQbuoIsw4uYNZapfXvBnsMRgXi5jFxTAQjmZn+BhslcztR0T0cjoIiusWoSUkfiIb5CP65BCd/kjfgYtPIRVBsNUG1D0LZ/7IxDiMiQ9g7YBpT3l3YQrpBkhIrUpxd2PmmufaNYST7SalSC0IhLMewtv9Bk0JqKcXh2CfYJvakfkwwHldsh9hjGKMgwz0cxo/cYc5RRsfMsybm3sVERLkC4RmKikK77pfUqHbcfjc1QaacRHjFde6VKIxh3X3g2OQo8FRuApEwmy/K0Uh9XD7MGZt5YEwT8IXm5cEiVwJPTRqH45Otd4dfaWTG8gdp59fyXB8iSaNL71ERz+HQWXDX/uSwQtJrBHkIAsdxQiJXSQO26NTqULTXwo0ffOKTfboK4Qol3VTocvssoUYyAlrurmbdU2SYY8k8dmfFnOy6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:01:56.4158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cf9c3d-a0ca-49c0-ad3e-08df3432dca3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9325
X-purgate-ID: tlsNG-720697/1793109737-30DC12AC-394D02A1/0/0
X-purgate-type: clean
X-purgate-size: 4291
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- drop `name` and `depth` from process_memory_node(),
- drop `name`, `depth`, `address_cells` and `size_cells` from
process_reserved_memory(),
- drop `name` from process_chosen_node() and process_domain_node().

No functional change.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/bootinfo-fdt.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
index 94ebf12fd646..1064cea4e9b4 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -171,7 +171,6 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
 }
 
 static int __init process_memory_node(const void *fdt, int node,
-                                      const char *name, int depth,
                                       u32 address_cells, u32 size_cells,
                                       struct membanks *mem)
 {
@@ -191,8 +190,7 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
     if ( depth != 1 )
         return 0;
 
-    rc = process_memory_node(fdt, node, name, depth, address_cells,
-                             size_cells, data);
+    rc = process_memory_node(fdt, node, address_cells, size_cells, data);
 
     if ( rc == -ENOSPC )
         panic("Max number of supported reserved-memory regions reached.\n");
@@ -201,9 +199,7 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
     return 0;
 }
 
-static int __init process_reserved_memory(const void *fdt, int node,
-                                          const char *name, int depth,
-                                          u32 address_cells, u32 size_cells)
+static int __init process_reserved_memory(const void *fdt, int node)
 {
     return device_tree_for_each_node(fdt, node,
                                      process_reserved_memory_node,
@@ -279,7 +275,6 @@ static void __init process_multiboot_node(const void *fdt, int node,
 }
 
 static int __init process_chosen_node(const void *fdt, int node,
-                                      const char *name,
                                       u32 address_cells, u32 size_cells)
 {
     const struct fdt_property *prop;
@@ -343,7 +338,6 @@ static int __init process_chosen_node(const void *fdt, int node,
 }
 
 static int __init process_domain_node(const void *fdt, int node,
-                                      const char *name,
                                       u32 address_cells, u32 size_cells)
 {
     const struct fdt_property *prop;
@@ -389,18 +383,17 @@ static int __init early_scan_node(const void *fdt,
      */
     if ( !efi_enabled(EFI_BOOT) &&
          device_tree_is_memory_node(fdt, node, depth) )
-        rc = process_memory_node(fdt, node, name, depth,
-                                 address_cells, size_cells, bootinfo_get_mem());
+        rc = process_memory_node(fdt, node, address_cells, size_cells,
+                                 bootinfo_get_mem());
     else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
-        rc = process_reserved_memory(fdt, node, name, depth,
-                                     address_cells, size_cells);
+        rc = process_reserved_memory(fdt, node);
     else if ( depth <= 3 && (device_tree_node_compatible(fdt, node, "xen,multiboot-module" ) ||
               device_tree_node_compatible(fdt, node, "multiboot,module" )))
         process_multiboot_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
-        rc = process_chosen_node(fdt, node, name, address_cells, size_cells);
+        rc = process_chosen_node(fdt, node, address_cells, size_cells);
     else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
-        rc = process_domain_node(fdt, node, name, address_cells, size_cells);
+        rc = process_domain_node(fdt, node, address_cells, size_cells);
     else if ( depth <= 3 && device_tree_node_compatible(fdt, node, "xen,domain-shared-memory-v1") )
         rc = process_shm_node(fdt, node, address_cells, size_cells);
 
-- 
2.43.0


