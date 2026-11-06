Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D65606A32E
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 23:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Cxb61Vyz
Received: from list by lists.xenproject.org with outflank-mailman.1477480.1682919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPT9w-0004Qj-3a; Fri, 06 Nov 2026 23:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477480.1682919; Fri, 06 Nov 2026 23:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPT9v-0004QG-Ui; Fri, 06 Nov 2026 23:15:47 +0000
Received: by outflank-mailman (input) for mailman id 1477480;
 Fri, 06 Nov 2026 23:15:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xPT9u-0004O7-Qt
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 23:15:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPT9u-00EGOA-7j
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 00:15:46 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee5f7b-e002-0a2a0a5209dd-0a2a4509bcb4-18
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:15:45 +0100
Received: from [40.93.198.25]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee5fa0-be1a-0a2a45090019-285dc619c89a-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:15:45 +0100
Received: from BN1PR14CA0027.namprd14.prod.outlook.com (2603:10b6:408:e3::32)
 by IA0PR12MB8862.namprd12.prod.outlook.com (2603:10b6:208:48e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 23:15:39 +0000
Received: from BN6PEPF00000074.namprd03.prod.outlook.com
 (2603:10b6:408:e3:cafe::6c) by BN1PR14CA0027.outlook.office365.com
 (2603:10b6:408:e3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 23:15:37 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000074.mail.protection.outlook.com (10.167.248.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 23:15:37 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:15:36 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 6 Nov 2026 17:15:36 -0600
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
 b=DfWYBaAKLf95YsCsVF9XryseTSkzmg1SqDAOI17UbfEUDrmOvIeFKAC+GxZxiE3xpyHn1PtNr2Iqp9s0hRdUd0QuoUw0n7Zwvo8E899SQpQ5mKWHIfzMme3M9ugtjwJgFVkDzQEBzNoVSxAa/XqWtwyJLWwX9S1p/tPHDTK2PoZOazUyc501Ea9Kg36yalCy4QokjZ6Ck2n0bmgM1/sQwLsTqyxoxG4GOebskJHXApV3cJTys9XeRoWEowDjCQQYJX7raIqsjNw03vQO34OSmd3Ljw2T67gYP/t76W02tdJkeSdFILJJPVsM8f2zUy6nLZO3lmIq265AJQuBOQV/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGPzj3A5rcVDcWrxSPkqwRif3GBAO0+m88S7xzep4MM=;
 b=ZgHzF6GkHC4w+BmvX0i5m1dADgNW+acrtscBPoBP6T0m10USUNHPeOLdifxSaxmSf+qSUSp3kWkQXTcjZBI9dO5wSScp8PXF92utwfxTHluhIzyHBSPLXSBz+V+xKtqeUqi8x09DftXUTlf2AeuF46sTliOheP8bDR8oN3sx8UYIDa4oKRrlEjkPTo2cirBeSl7NvjIOzHg77SU7yfzcRkRR6aHo2XuniDtbESrknG5m1QHaGg/k+7kpNhStK/QzqBCSLGB5WfYnCt0/DCsJScPttZ8GNFfd8NMnfNAizKMI7WWgmd/cMmjaviaC7r4I4HKPEdBHbsZQwxLBpg79sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGPzj3A5rcVDcWrxSPkqwRif3GBAO0+m88S7xzep4MM=;
 b=Cxb61Vyz+/E00AcKkLzRzNUU2AnlCKJHDNsen5t748xRC6lNtaGKk991scbklUCCM/3gjaikLJrj8BfYyMfMpilKI1quCRY0GYsrWHdHYraDVVJsTQIsP8F9DxIaLrNp+jui3EHEpqdK+Yx8+89oOkLUy3u6tEYB41LYW0sXkPU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 1/4] libacpi: Build TPM2 tables for the TIS interface
Date: Fri, 6 Nov 2026 18:15:23 -0500
Message-ID: <20261106231526.482418-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106231526.482418-1-jason.andryuk@amd.com>
References: <20261106231526.482418-1-jason.andryuk@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000074:EE_|IA0PR12MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e128235-7f39-44a0-52b1-08df3c5bdde5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|11063799006|261022113327099003|261022075727099003|260925022911599003|260925021311599003|261021135927099003|260925021911599003|261021130227099003|261021123027099003|261009223027099003|56012099006|261021121427099003|261021133027099003|261022115727099003|261026135527099003|261028144727099003|261026130827099003|261022105027099003|261026140227099003|261026121527099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	eSKL1Su9fcuKsLRMy1MnK0X7EvRJca8Ccv9bYAUcocV66WRXlyCVrpUAYRd3ZZxVJtcY5WCDpV+sX6ueF1u5JCenGiNQI2ueQh+IHZf0sGZhlBIWYWBDVApiCM54265ZakSQ3XkpzjxRpCDZxVHQImR/pYUwubdm835yOUReoDci8PDI9h/Tjj2Ov/bK3zo40VwSuQCfDaQm9F5KG1z82st4qf4IGlpBmmfAZaHj9R4sTk5pZy3dpQP5Now3Uam+rPkd8BOcE65cqbwTEbeOo+UV7AK75sY9a3dYqbWEZFm00WtL5ik7KWjKgUuty0xmkQmTH7Pk9NLazAoOFt5CGL3zwVe1kCxH3cnkdIBpUfRmUUjY3okDfuIeNeeL2M8Vzdr2da4d/j/PFBkW153yO9hZxwXyW21FASx1zrTLL7HyNV4bwaW8XH1FbFdAgVrFg809jP0ZT3gAlDts1o/hLKFcmuLi3wW3LpTBEWWFBLHoxNN83TuhqxX+RfMxsN93dD/0oyUgs4mFV/H/vLef5S2HJq2q6z+DKlVl6eYgfLD/2j1po/3kjcHSze25uqGqMrq39oA4LjQPoli/4Nmfky5qJWVJKb2CS3RVGuzmMRmyPFv9XIHgTXOj0ALf0GGgdNgLfvboLJFyZ5ne9mX5o6PyGKRZtYIHRuMsKLvofEgLIAMXa1StdweTyHgwdSe8R/y6liJfg8IVzCHtcCBtwA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(11063799006)(261022113327099003)(261022075727099003)(260925022911599003)(260925021311599003)(261021135927099003)(260925021911599003)(261021130227099003)(261021123027099003)(261009223027099003)(56012099006)(261021121427099003)(261021133027099003)(261022115727099003)(261026135527099003)(261028144727099003)(261026130827099003)(261022105027099003)(261026140227099003)(261026121527099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cFdpaoZLIKHV2LnHHr3zsVjKrAQalK6CcOUyTYQQkCvWBbLPLCBIiieOEIbu9DiQT5IG9Ft2uqOYV7wGHz16NzIN3zhEOr6nuUMKwWL79k5W+Z86xlORHRy9+RogYcMdOnA8LNUABrCCRf9NBjKMBPcEHgprKiGMLoMpq0/guDOlA8+LsAMp5gwNJDlT2yJ1UdqroaZp7H13X6Y9B3HMqmM1HxFLqMwLYS0PYLbwYCOxLfCVA1hPxE5B91ugcIpTcXH9PfGQbl6OHPiqN+s3bLiYlqzRXG/mEP+sJB/G7jgd1g88c5xMdAFy8tSnX0mZBLsgaUYGZQq29ba5FPQ+0uOLb43YFvNIZouKRwVznANi23ylatbG+igCh/p3WMkMIWNsQXw5XhhGmSngHmeVHXLB+MuNQYXqSK8ljgsDEAPsWj1tInoKbruKiIKcLYkl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 23:15:37.1967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e128235-7f39-44a0-52b1-08df3c5bdde5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000074.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8862
X-purgate-ID: tlsNG-bad1c0/1794006945-BD6C2034-A66280CC/0/0
X-purgate-type: clean
X-purgate-size: 6578
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TPM 2.0 can be exposed over either the CRB or TIS (FIFO) interface.
Add TIS support to libacpii's current CRB support.

An updated SSDT is needed for the 0x5000 MMIO region.  Also the start
method changes.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/libacpi/Makefile          |  2 +-
 tools/libacpi/acpi2_0.h         |  1 +
 tools/libacpi/build.c           | 47 ++++++++++++++++++++++++---------
 tools/libacpi/libacpi.h         |  4 +++
 tools/libacpi/ssdt_tpm2_tis.asl | 25 ++++++++++++++++++
 5 files changed, 66 insertions(+), 13 deletions(-)
 create mode 100644 tools/libacpi/ssdt_tpm2_tis.asl

diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index 3b4c3d8c86..aa37d5662e 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -16,7 +16,7 @@ C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
 DSDT_FILES ?= $(C_SRC-y)
 C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
 H_SRC = $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h)
-H_SRC += $(addprefix $(ACPI_BUILD_DIR)/, ssdt_tpm.h ssdt_tpm2.h ssdt_laptop_slate.h)
+H_SRC += $(addprefix $(ACPI_BUILD_DIR)/, ssdt_tpm.h ssdt_tpm2.h ssdt_tpm2_tis.h ssdt_laptop_slate.h)
 
 MKDSDT_CFLAGS-$(CONFIG_ARM_64) = -DCONFIG_ARM_64
 MKDSDT_CFLAGS-$(CONFIG_X86) = -DCONFIG_X86
diff --git a/tools/libacpi/acpi2_0.h b/tools/libacpi/acpi2_0.h
index 51623e2a8a..759be9ba43 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -126,6 +126,7 @@ struct acpi_20_tpm2 {
     uint64_t log_area_start_address;
 };
 #define TPM2_ACPI_CLASS_CLIENT      0
+#define TPM2_START_METHOD_MMIO      6
 #define TPM2_START_METHOD_CRB       7
 
 /*
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index 95188e217e..14779080a7 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -11,6 +11,7 @@
 #include "ssdt_s4.h"
 #include "ssdt_tpm.h"
 #include "ssdt_tpm2.h"
+#include "ssdt_tpm2_tis.h"
 #include "ssdt_pm.h"
 #include "ssdt_laptop_slate.h"
 #include <xen/hvm/hvm_info_table.h>
@@ -444,17 +445,30 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
             break;
 
         case 2:
-            /*
-             * Check VID stored in bits 37:32 (3rd 16 bit word) of CRB
-             * identifier register.  See table 16 of TCG PC client platform
-             * TPM profile specification for TPM 2.0.
-             */
-            if ( config->crb_id[2] == 0 || config->crb_id[2] == 0xffff )
-                break;
+            if ( config->tpm_interface == ACPI_TPM_INTERFACE_TIS )
+            {
+                if ( config->tis_hdr[0] == 0 || config->tis_hdr[0] == 0xffff ||
+                     config->tis_hdr[1] == 0 || config->tis_hdr[1] == 0xffff )
+                    break;
 
-            ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm2), 16);
-            if (!ssdt) return -1;
-            memcpy(ssdt, ssdt_tpm2, sizeof(ssdt_tpm2));
+                ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm2_tis), 16);
+                if (!ssdt) return -1;
+                memcpy(ssdt, ssdt_tpm2_tis, sizeof(ssdt_tpm2_tis));
+            }
+            else
+            {
+                /*
+                 * Check VID stored in bits 37:32 (3rd 16 bit word) of CRB
+                 * identifier register.  See table 16 of TCG PC client
+                 * platform TPM profile specification for TPM 2.0.
+                 */
+                if ( config->crb_id[2] == 0 || config->crb_id[2] == 0xffff )
+                    break;
+
+                ssdt = ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm2), 16);
+                if (!ssdt) return -1;
+                memcpy(ssdt, ssdt_tpm2, sizeof(ssdt_tpm2));
+            }
             table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
 
             tpm2 = ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tpm2), 16);
@@ -471,8 +485,17 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
             tpm2->header.creator_id   = ACPI_CREATOR_ID;
             tpm2->header.creator_revision = ACPI_CREATOR_REVISION;
             tpm2->platform_class = TPM2_ACPI_CLASS_CLIENT;
-            tpm2->control_area_address = TPM_CRB_CTRL_REQ;
-            tpm2->start_method = TPM2_START_METHOD_CRB;
+            if ( config->tpm_interface == ACPI_TPM_INTERFACE_TIS )
+            {
+                /* The FIFO interface has no control area. */
+                tpm2->control_area_address = 0;
+                tpm2->start_method = TPM2_START_METHOD_MMIO;
+            }
+            else
+            {
+                tpm2->control_area_address = TPM_CRB_CTRL_REQ;
+                tpm2->start_method = TPM2_START_METHOD_CRB;
+            }
             tpm2->log_area_minimum_length = TPM_LOG_SIZE;
             tpm2->log_area_start_address = TPM_LOG_AREA_ADDRESS;
 
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index deda39e5db..0b40896127 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -28,6 +28,9 @@
 #define ACPI_HAS_CMOS_RTC          (1<<14)
 #define ACPI_HAS_SSDT_LAPTOP_SLATE (1<<15)
 
+#define ACPI_TPM_INTERFACE_CRB     0
+#define ACPI_TPM_INTERFACE_TIS     1
+
 struct xen_vmemrange;
 struct acpi_numa {
     uint32_t nr_vmemranges;
@@ -58,6 +61,7 @@ struct acpi_config {
     uint32_t table_flags;
     uint8_t acpi_revision;
     uint8_t tpm_version;
+    uint8_t tpm_interface; /* ACPI_TPM_INTERFACE_*, only used for TPM 2.0 */
 
     uint64_t vm_gid[2];
     unsigned long vm_gid_addr; /* OUT parameter */
diff --git a/tools/libacpi/ssdt_tpm2_tis.asl b/tools/libacpi/ssdt_tpm2_tis.asl
new file mode 100644
index 0000000000..837e50f90e
--- /dev/null
+++ b/tools/libacpi/ssdt_tpm2_tis.asl
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: LGPL-2.1-only */
+/*
+ * ssdt_tpm2_tis.asl
+ */
+
+/* SSDT for TPM 2.0 TIS Interface for Xen with Qemu device model. */
+
+DefinitionBlock ("SSDT_TPM2_TIS.aml", "SSDT", 2, "Xen", "HVM", 0)
+{
+    Device (TPM)
+    {
+        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
+        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+        {
+            Memory32Fixed (ReadWrite,
+                0xFED40000,         // Address Base
+                0x00005000,         // Address Length
+                )
+        })
+        Method (_STA, 0, NotSerialized)  // _STA: Status
+        {
+            Return (0x0F)
+        }
+    }
+}
-- 
2.34.1


