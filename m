Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31CFC61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:04:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401637.1637195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqdW-0005RD-VX; Fri, 28 Aug 2026 07:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401637.1637195; Fri, 28 Aug 2026 07:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqdW-0005Qw-Ru; Fri, 28 Aug 2026 07:04:26 +0000
Received: by outflank-mailman (input) for mailman id 1401637;
 Fri, 28 Aug 2026 07:04:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wzqdV-0005Ok-QL
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:04:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqdV-0016ik-7A
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:04:25 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a9132ef-2eae-0a2a0a5409dd-0a2a450c8c2a-40
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:04:24 +0200
Received: from [52.101.62.56]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a9132f7-f479-0a2a450c0019-34653e38936a-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:04:24 +0200
Received: from MW4PR03CA0152.namprd03.prod.outlook.com (2603:10b6:303:8d::7)
 by SA1PR12MB5672.namprd12.prod.outlook.com (2603:10b6:806:23c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Fri, 28 Aug
 2026 07:04:16 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:303:8d:cafe::3a) by MW4PR03CA0152.outlook.office365.com
 (2603:10b6:303:8d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 07:04:16 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 07:04:16 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 02:04:15 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via
 Frontend Transport; Fri, 28 Aug 2026 02:04:14 -0500
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
 b=EkEiSA4DoeE90mFj5DYvji+OTi7HA/WQbjpQzDH1Y6/Z7QTcQ1pw9V+rF2XHfg3Yna38MKmlRiyqzcHIMRu1xiXcGdgcg7pZMBJi4f7PHlYps6OWDrsvWjYPhcahKSrn99rHzQYg3V2xbV4L54K1KDNng+9tO/9uAZ7W3z2AYFT9QFosrjUv0eBie+7WIHUtAIbcg3GUQyfliKc/GwX0PQnQwy42NTn4jLJXUMjI1Tbr1o1tKbj7hFewtjNU7aOsp+BVh28SugbM6yn4ARsC5r1pz8FWXU4NxqrP1ORiMOJkqv7PqsQF3lhdooLXHi33MG0IeMQTfbPhProrRaGC+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0bpya8ogYaEdMCGp4/9wWyRij88nIkK5lXO2xMacDo=;
 b=HjQVfrOWYjNzR7eXWnPv+FM4r+Qgw8UtRsNbQhPkysk76OJ5/oVUDFCOZVu8sN14PoIqxCcFQg+ZRm9kqyOhGmXEwUos8XyuQnJl3kgRLrZd4KjtYVQWcKmRZUc+bDUjZWaL2bj/RdSkpeJmPlPKxc5B4RhBEbFH+qhDmK0sDoNv8c4cISSFJyWT3oFB/b6hR9+JIPCDmQGRr6vRvlqJ0goIqqNjK17JgdkeHypc7sMk6vgJDlB6gBmmcdMmPBnT+ixXI90Dt56xC6sU+il9iQdsqzwjtkOe9LUdmqPEx9VF7SzrRD/XuTOM+/KTyWl+ruyy6fDe2nRm57rK3Ot70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0bpya8ogYaEdMCGp4/9wWyRij88nIkK5lXO2xMacDo=;
 b=0admj/owgCXekgLoKr2ze6Lhj8X8Aq2hidVuw3xNicxZheUWUFOx7RnHYueNTJXqfSN8B4OHxCupyWMN768+6OY6AztL3as7FLNYAvUcP4R0rihextIDUwDQfLkDog5W68nMUeXRJSPOmrW9zsS+MXVX7fsSMQu19pPFjx/P65E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] ARM/vgic: Clean up vgic_v{2,3}_setup_hw()
Date: Fri, 28 Aug 2026 09:04:09 +0200
Message-ID: <20260828070409.106935-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|SA1PR12MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ba58b3-8ec3-4724-879f-08df04d292f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	GOtF4EQie1H6NYsOCgKuLhCQOccxOXUqPM4j7oL7V483apNYdNPgMONZjghGMzLWHPmIJedVKGPR0mAVCKeaVV0jX+I0ZrjMiN+vEDu3r2qymPFHDNg+XVh0kXRMfKm+UFixsKxpb42+LjSq0op8sIyoK/Cd9uPm3jovUgXNVjBHQ5HjnOtZWWdJsRW3wyc1iZOzaw2zocekmCU3PEh9D9KbQusAOxRHmsBEsezlRvvvqeEYwVuKQe4YBw0qTsFEEcvKdgn56nseGGPvzWAOM1PE5PzNayU/3UZrczh7eR4Y5ltiFPLHEWFRXkaXecqgic5xaec3ORktX2Qg+C4hiTNDy7RIEOeryJZWSTWsXff6FktuTWCQCimLWbwkMDnKUPMi3FVxdvh8qoDplBNHgpMzNgoVtl8/jJW39jh9aeVeXbjoFjsDMHfIf3KdObPAOSyvmiR5NbcRYDm87CZpbyxVTwHybKHdprY81rMTpTKLRUzhg1axDk6Vpx04vK3EB0MThgkdpYmfMQU7ltsOrHlUIWuf+FSGJ5C04nF1T2jvoqmR0i/vZVrXagrgC3UPo622dZpwTvxcWGr9u8LSwzK6XKxWiauRemT0fkaHHw5GmaijY3gx9PWbkJQRucl66IT7MKoeLklFaQAAkMgX++pI1Q5P/mDhrxoC+CBQGO5OFWVZfJc82jQXn00pWi2sL+GXJ/WbRHQyGJpyZfAY/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eYgwgacmIKLNHs9NFPS/U9V+Qie2+olemviKv9TfeerUsqe0eU8olEqhjpHFb8mFhWpqDTy4qLIRobNRBhi3Oj1UuW4Pi/Htv1gw4qSWTA3kOJsyy9B5F97z2v0WZTKauzpO5J9EgBIvXoAZIKiv9PR9O4bEOutVjDr2Rfzxoa/vnZpHV2tDqFEp5ZSZTEiR7a//JFzUg/IYce33c3LaiD8URWbxVF4kU2b4azuwha0yTSdDKiMw89rzXkizWNPaPyAxQTNWKPjy02ouOhY8leE7WlLk0M3LglNhuaOkj29S5zQSTpQXM/UwN0NorA/abk6oj1VyBXJfr2UMQTa64w2Shr/ne1mUk5lz8hc8sCuNqnRGjRkAwQidU21reM7ak/N+zlwHzfHhiDYlMpcBnc74WnCd2IMvIKLqwdTSXyiF1K5f7MWdFlek3BgKfTUJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 07:04:16.3613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ba58b3-8ec3-4724-879f-08df04d292f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5672
X-purgate-ID: tlsNG-d25034/1787900664-77ED2A5B-9AB31B0E/0/0
X-purgate-type: clean
X-purgate-size: 4662

From: Andrew Cooper <andrew.cooper3@citrix.com>

vgic_v{2,3}_setup_hw()'s callers are __init, so they should be too.
vgic_v{2,3}_hw and gic_v2_hw_data are written once during init and
unmodified thereafter, so make them __ro_after_init.  Reposition
'bool enabled' in these structures to fit in the tail padding, removing
8 bytes from their size when paddr_t is 8B.

While at it, drop dead vgic_v3_setup_hw() dummy implementation
from vgic/vgic.c. GICV3 depends on !NEW_VGIC.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2 (Michal):
 - take Andrew's v1 patch and extend the changes to vGICv3 and new vGICv2
---
 xen/arch/arm/vgic-v2.c      |  8 ++++----
 xen/arch/arm/vgic-v3.c      | 11 +++++------
 xen/arch/arm/vgic/vgic-v2.c |  8 ++++----
 xen/arch/arm/vgic/vgic.c    | 11 -----------
 4 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 642407fd5b05..3fa8cdeeab14 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -25,7 +25,6 @@
 #include <asm/vreg.h>
 
 static struct {
-    bool enabled;
     /* Distributor interface address */
     paddr_t dbase;
     /* CPU interface address & size */
@@ -36,10 +35,11 @@ static struct {
 
     /* Offset to add to get an 8kB contiguous region if GIC is aliased */
     uint32_t aliased_offset;
-} vgic_v2_hw;
+    bool enabled;
+} vgic_v2_hw __ro_after_init;
 
-void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
-                      paddr_t vbase, uint32_t aliased_offset)
+void __init vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
+                             paddr_t vbase, uint32_t aliased_offset)
 {
     vgic_v2_hw.enabled = true;
     vgic_v2_hw.dbase = dbase;
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index c01cc596d593..16e9d0cbad03 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -44,19 +44,18 @@
 #define VGICD_CTLR_DEFAULT  (GICD_CTLR_ARE_NS)
 
 static struct {
-    bool enabled;
     /* Distributor interface address */
     paddr_t dbase;
     /* Re-distributor regions */
     unsigned int nr_rdist_regions;
     const struct rdist_region *regions;
     unsigned int intid_bits;  /* Number of interrupt ID bits */
-} vgic_v3_hw;
+    bool enabled;
+} vgic_v3_hw __ro_after_init;
 
-void vgic_v3_setup_hw(paddr_t dbase,
-                      unsigned int nr_rdist_regions,
-                      const struct rdist_region *regions,
-                      unsigned int intid_bits)
+void __init vgic_v3_setup_hw(paddr_t dbase, unsigned int nr_rdist_regions,
+                             const struct rdist_region *regions,
+                             unsigned int intid_bits)
 {
     vgic_v3_hw.enabled = true;
     vgic_v3_hw.dbase = dbase;
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index 6a558089c522..06fa36545355 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -24,7 +24,6 @@
 #include "vgic.h"
 
 static struct {
-    bool enabled;
     paddr_t dbase;          /* Distributor interface address */
     paddr_t cbase;          /* CPU interface address & size */
     paddr_t csize;
@@ -32,10 +31,11 @@ static struct {
 
     /* Offset to add to get an 8kB contiguous region if GIC is aliased */
     uint32_t aliased_offset;
-} gic_v2_hw_data;
+    bool enabled;
+} gic_v2_hw_data __ro_after_init;
 
-void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
-                      paddr_t vbase, uint32_t aliased_offset)
+void __init vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
+                             paddr_t vbase, uint32_t aliased_offset)
 {
     gic_v2_hw_data.enabled = true;
     gic_v2_hw_data.dbase = dbase;
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index b2c0e1873ace..ba029b8a3bbf 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -964,17 +964,6 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)
     }
 }
 
-#ifdef CONFIG_GICV3
-/* Dummy implementation to allow building without actual vGICv3 support. */
-void vgic_v3_setup_hw(paddr_t dbase,
-                      unsigned int nr_rdist_regions,
-                      const struct rdist_region *regions,
-                      unsigned int intid_bits)
-{
-    panic("New VGIC implementation does not yet support GICv3\n");
-}
-#endif
-
 /*
  * Local variables:
  * mode: C
-- 
2.43.0


