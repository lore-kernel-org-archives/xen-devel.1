Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3481C606A323
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=a86l1vgB
Received: from list by lists.xenproject.org with outflank-mailman.1462551.1673511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLnZ8-0004z4-1r; Tue, 27 Oct 2026 20:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462551.1673511; Tue, 27 Oct 2026 20:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLnZ7-0004yx-VN; Tue, 27 Oct 2026 20:14:37 +0000
Received: by outflank-mailman (input) for mailman id 1462551;
 Tue, 27 Oct 2026 20:14:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xLnZ7-0004yr-1c
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 20:14:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLnZ5-003j01-Ca
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:14:35 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ae10606-e002-0a2a0a5209dd-0a2a4504deba-34
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 21:14:34 +0100
Received: from [52.101.46.62]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ae10629-b57f-0a2a45040019-34652e3ed0d2-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 21:14:34 +0100
Received: from MW4PR04CA0372.namprd04.prod.outlook.com (2603:10b6:303:81::17)
 by LV2PR12MB5846.namprd12.prod.outlook.com (2603:10b6:408:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 20:14:29 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:303:81:cafe::63) by MW4PR04CA0372.outlook.office365.com
 (2603:10b6:303:81::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 20:14:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 20:14:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 15:14:26 -0500
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Tue, 27 Oct 2026 15:14:26 -0500
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
 b=a8n0aVYRVvPprDEU6pzhAsBtH+MSQMKwl7w9ps9fLm9nCFXKDGnL0VNun9c9nkV0NDY0fzF8C9zf9kwRIffLFWrgC0uExS4LzT0kUrFkbIWs6OLC39m+6w7SUGK2RxORc4lE23NFm7l9HlQjKVpO7bvQgWCY5z4U+t1cZkI241FUnZpwPNZlnMWLi873Y1ugLDXU0BYaKx2bjbj28BrfdUVZ420fF8081OmmJokCWSVLYSjzvVUb+KcsCdU5bBrzXef96bDXzGXNxihO4xTJlYSgRmIDED9mPOLPNCbzBr/0eBk3GD/Jp1NsUg2tZO3R0wedzrjvTRl+/gDUe1oWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tc0VsvVfm6WuHGRWbAbKWgEuDSYq25/YDozURZfCBg8=;
 b=BdC/fMDnpQuMOUcIqdmn6GdwEMzBAyTszl8sepv4SdnVwHj3JHb+FxgZYJF58OYbhdLlHX1K0CxWoclnpoHyJwjUWFSHgYMM/T31X45IlJ/y6JIBzjlkwKdB4E9xSQ2JlBeFnD8zu6PJ8dWpbTtyrX9qg+FYE2VkMyC+gWCro43qVdrXnlJG//bK2l4PFlYF+QHulV3t2BGcJr/xtzVZqRp3hH7RcmoOVAsci+Gyp1mBgEZNC5nCSlkzRXCe5u+22HbFeq+NnsSpLD2/p/LIUV23Pw3r/fjr7KxHHMP09hq2CnoaYrmjFYTzcHrv2aBcQo6eMupx5fpVNdS1NTB4QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tc0VsvVfm6WuHGRWbAbKWgEuDSYq25/YDozURZfCBg8=;
 b=a86l1vgB0VcRMm1FSdkGZ6/17NrdXZBlK0FiMaMHEEaiMtRGoQmVqYJQhXuafAAtpJQZbJJOd9Fl/VD7DeUaTFJ/NEiBExy2+zLuRjuUxnpEGzaY71oRG8N2I7CgtUuJlY49/LhWKhJHITCajEfu/8tbk9T6njec6X/eo3RW94I=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger@xenproject.org>, <jason.andryuk@amd.com>,
	<teddy.astie@vates.tech>
Subject: [PATCH v3] xen/amd/iommu: record the IOMMU and device flags for alias DeviceIDs
Date: Tue, 27 Oct 2026 13:14:25 -0700
Message-ID: <20261027201425.2405102-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026235926.2105578-1-stefano.stabellini@amd.com>
References: <20261026235926.2105578-1-stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|LV2PR12MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe0eb05-0ec3-4c68-4316-08df3466e759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|261026121527099003|11063799006|5023799004|56012099006|261021121427099003|261022105027099003|261009223027099003|10067099003|22082099003|18002099003|3023799007|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	1v/8oGrmocFKO0ZNts583Whtl++0FvQWwzInPZq1xwgOpbfFPVx0rRX6UYhPzlkvZoIRCs6JXbiI2DYRYWYZTgexExhPNSd2W7VMKUJb+RBDQgXp/Dfln7spT4U4OGdjHbIh87uQegg9DlpiWYREIOsdgRooHKzgNmk13rXpXJ4DlsDK89Nmq/216dxt2Lm+qaBILRPSH1919q71m/AQ/aQi4MC9tCiI4trL4ELBfRMGWGyVhLa9VF/OKCnfyVNhm7aHpQJbcEUUUdH/ziiZH87n66EVA7jmjoCRbgHCaDrXW8feCou0kurP6gAlN1FvwxxB/RJDGF/aULdUzUvCsngwLSgSVL5sITsXtDKrcvkNpMUJJRpXy/hBggV+52V+Rkokd3yZi1FiP3Sq7yxccSjWE99F21i9qfe+NavHqm3RAZGR2+Ohq3a2Vo9mZuM7kc0RwMbQNqR8w+sVGoa1y6Vf8JIF61gZfNB4NfcJLDlWprGflJOuNLc8HwYWp3dUlpiJGfKTEyHeEICZsw2zWiuWjbcKDMMw8S2x/cuLcE+V3y2oaAKLYBdSAyTY2MmXoL6sTk3r1Zh2Vu86woWxba3FzPQcMSiu0YpbRZnmsFeFNor5PaBsTI2bdzYQH5OXIOxFgcwcRuW/7ensRV6kJ5zfw2Bh+GjOQsmk6ojly0tj4xmlKx7/DrNKdlx0cInbJMOGUSY/O4XGNBblSihRCQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(261026121527099003)(11063799006)(5023799004)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ow7mL4yN0uYzW1AO2s1AbXTMLYbmjjRs5F1+8RzTUTCoqZwTp7m5BJCKFxDVfW3GpX4AqDgKl/PTrevPhtiDem5G3K12uWd9T3mjdLBkAQ2qXgLS76Ftf6/mYON3AMTuZU1lLrCrpfBA5Yoks4d0SOCjhy/E2Q5eDAYgPpGkca8+HsyI+lxlA6gt8eXRY0UsIzBABEp/yvM1PFl7/5rqp9FuA+Wiu4Wih2HfZlsQ1spWFZ/6NRSBMSz06IT/MP506dqcT7TWrptYNnScV5mCan5Z7YuK8tdguvG7KeLqUbnjFPLf5OiV9ahCC6VQ3zIhf1Hk+RXIaLivmdAlZ3zOsB678h4V4oBHO1sS9M9tZWak/ZptBBmsW/gtp8gCgKb//xG4YuF+U12Q5ouCAj0YasPDIUDOk6JdTv0ppFEdc/x3rQ+QsHXw5nIp6bPZlJtQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 20:14:28.1314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe0eb05-0ec3-4c68-4316-08df3466e759
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5846
X-purgate-ID: tlsNG-ebf023/1793132074-C08D9B50-08C6F774/0/0
X-purgate-type: clean
X-purgate-size: 3091
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

add_ivrs_mapping_entry() marks an alias DeviceID valid and may give it
an interrupt remapping table, but records the IOMMU and the IVHD device
flags only for the device using the alias.  If no IVHD entry names the
alias DeviceID itself, amd_iommu_setup_device_table() passes a NULL
IOMMU to amd_iommu_set_intremap_table(), which dereferences it at boot,
and the alias's DTE, the one applying to requests using the alias, is
set up without the device's pass-through and SysMgt settings.

Give the alias the IOMMU and the device flags too, as was done before
the interrupt remapping rework, and as Linux does.

Fixes: a3713b97e8e1 ("AMD IOMMU: Rework of interrupt remapping")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
On v2, Jan asked about:

- amd_iommu_alloc_intremap_table(): not reached for the alias, which
  already has a table when interrupt remapping is on.  When it's off,
  amd_iommu_set_intremap_table() doesn't use the IOMMU.

- find_iommu_for_device(): before, an unnamed alias crashed at boot
  with interrupt remapping on.  With it off, a device at the alias
  failed to be added (-ENODEV), or got function 0's entry copied over
  the alias's, losing its unity maps.  It now returns the alias's
  IOMMU, and an IVMD naming the alias is applied instead of ignored.

- amd_iommu_get_reserved_device_memory(): the alias is no longer
  skipped.  For XENMEM_RDM_ALL its ranges are reported once under it,
  not once per device using it.

- Earlier vs later entries: later entries still win, so an alias entry
  can now override the device flags of an earlier entry for the alias
  itself.  The alias's IOMMU is asserted to match, as suggested.

- Other fields: device_flags is now set for the alias.  The rest are
  either the alias's own or already recorded for it; block_ats is
  never set by alias entries, so using the alias's is OK.

Changes in v3:
- record the alias's IOMMU unconditionally, asserting that one recorded
  earlier matches
- also record the device flags for the alias

Changes in v2:
- describe the crash precisely, and why nothing relies on the alias
  entry's IOMMU being NULL
- add a Fixes tag
---
 xen/drivers/passthrough/amd/iommu_acpi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index d118b36d80..e60dd675d7 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -104,6 +104,15 @@ static void __init add_ivrs_mapping_entry(
 
     /* Assign IOMMU hardware. */
     ivrs_mappings[bdf].iommu = iommu;
+
+    /*
+     * Requests using the alias go through the same IOMMU, and the alias's
+     * DTE is the one applying to them.
+     */
+    if ( ivrs_mappings[alias_id].iommu )
+        ASSERT(ivrs_mappings[alias_id].iommu == iommu);
+    ivrs_mappings[alias_id].iommu = iommu;
+    ivrs_mappings[alias_id].device_flags = flags;
 }
 
 static struct amd_iommu * __init find_iommu_from_bdf_cap(
-- 
2.47.3


