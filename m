Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EFC606A327
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 16:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mrVZpzzq
Received: from list by lists.xenproject.org with outflank-mailman.1470238.1678967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHei-000351-Gy; Tue, 03 Nov 2026 16:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470238.1678967; Tue, 03 Nov 2026 16:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHei-00034s-E2; Tue, 03 Nov 2026 16:46:40 +0000
Received: by outflank-mailman (input) for mailman id 1470238;
 Tue, 03 Nov 2026 16:46:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xOHeh-00034k-JI
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:46:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOHeg-00Bmx5-W8
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:46:39 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aea0fe9-e002-0a2a0a5209dd-0a2a4507acf6-6
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:46:38 +0100
Received: from [52.101.52.67]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aea0fed-b4ea-0a2a45070019-346534433469-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:46:38 +0100
Received: from CYZPR11CA0021.namprd11.prod.outlook.com (2603:10b6:930:8d::17)
 by BL3PR12MB6426.namprd12.prod.outlook.com (2603:10b6:208:3b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 16:46:34 +0000
Received: from MWH0EPF000D8953.namprd05.prod.outlook.com
 (2603:10b6:930:8d:cafe::97) by CYZPR11CA0021.outlook.office365.com
 (2603:10b6:930:8d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 16:46:34 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000D8953.mail.protection.outlook.com (10.167.249.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 16:46:33 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 10:46:32 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 10:46:32 -0600
Received: from APPOL-18KY0J4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 10:46:30 -0600
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
 b=updac+LfU3sKyq7vvi+uoJAdGYhnjvKL6f8j5D1jEwrkPMzSjJqZYTOp+7aoSbDwzPBuarsTL7GcGg81dSgAvywSnm21pGhqB9pqYP4nxjovg05cxY/NqxycSAON38+4xHEquKcLH5Z32W5UimhqRrZUX8eU0TrVH8H9i2b6bb0DadsH8MskAF5VLnBSlRLtYny5Xkp6jjZTaQr8zm868WTFNv6siq+1ST+WrjNVE8L0YQv0GBx0Z+3uQpBrspG8Yu5R0SWSkJtpOzrmxZmfBn++77SOUBDqq/3G93kuj5efWAaEAqfH2c6Vjk6n9XgVXbu47RV6hN2yGkVibKmNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biIrkFz5JH+CTzUk65qXG9ALMVYC7jJjNgpe+PkTfi0=;
 b=EhP8yNY4TbNssAkTDwl2UUFcqs7ncDRHT+tEOEchSEMxDKMfCIcE6aPFT6flYpPBZYfk2alSkL5VPGe+MHRSevpuaoknCwQ3tJBTD70rvJV8uzFG17cO1PJIx6ihlEOUB47Xj3T3jt2vaYEthKzpLoRhe0hqe1sTIng/sh+fnPKE1K1D5yzyYHcIrRAHpkJ0K1kw2J4xVa8QLz4HqyKZqQK46mUbNWNzfqhDTURSY/MHEqYSiNNtQbtk2gaEuhMrAhXuFPCG/lnf23h2Q33lNZd0SToua21HDMa3kplsTXT2ww4fTfIDkiqDq8Y/vcIyscQMe0cZOsEAiok9yAzcWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biIrkFz5JH+CTzUk65qXG9ALMVYC7jJjNgpe+PkTfi0=;
 b=mrVZpzzqjVkJd3vk5nirV73UGkG7S1thCtoSfK6oKhGcZIqJaxv83Q0HPEPEn4hp67vQ0889C//HxLeM81Ohsvf+rgrURFj2mwMUboIGejT9WvT9EzGJwRbMX8MHdBjK1+xs4yKVFH4Fh3RTA4BIbFUykYZlf+wmVbq+NA8RcJE=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: domain_build.c: Use hwdom instead of dom0 where applicable
Date: Tue, 3 Nov 2026 17:46:24 +0100
Message-ID: <20261103164624.195576-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000D8953:EE_|BL3PR12MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 753676be-66f1-4fbd-9c7e-08df39ca050d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261022115727099003|261102123227099003|11063799006|56012099006|261021123027099003|261009223027099003|261022075727099003|261021121427099003|261022105027099003|261021135927099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PVEe75QPoPt5xWIF/8qzE8u30EZ1APXGH1Xh5dAMYzu0/9UTqWhjtvz3ji3wkJWgsLzsjM+8i63pCv4vYe4DeN8xfNvNzMMj2p/wUWcSm6sE/3GtsvZiVm7Qnt1f39+ltyTtYQVTHof0q3pTk/KyKZi5pOlyINvW65YbYr8QWqJRBBJax+vF7DPnZj5mr/OxQIcCJBEoh1LHRGeEzWzmCUWTIBKDgsCy8GJ9/34AaQ9x8fngtbgjvn9ZG4PXOP2sxc/5lZJrAZKzh08n3myMksV5JU9bNIDouw58Mb+uG+pWIauYllfMCWTml9xPp++Swv5+0b6cdmwIfbFEgkWf0n6vNqk6LKLrP9rzJq7AOwv6A78qVPXRJAHVNz8+KR4q2OUehrfVgdTmsgS5PYElcJ7T0fcq0F/l/SxfU/F1n+nhBLhIAb0swlH+Ip3o6sQSFQqfRPU83+bSAkvSHDL/u6fuPtTwWHrv1a9uR+5v8lKA6iU7B9EZjLywhRi2oUzOhUx+muvwzYROMEBu5t5uRUDtnjSotDw+ELYvwxz4d7mZkF33gBK01ymWrgoClWO7GEzfa5Xc9gQGQ3F/bkBJ2CSOlwvgmdhNwWblN0HwSTYOqKsA4DhJ/cazYCs6ZhvtGDWQpgJ+xmlADzM9akJSlhoRFRif3Hfv27OAMikrRh3dBc2eBXSAy1JhRUUqB+Z+vqMPrgn1Aptf+FNZ2WDmFw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261022115727099003)(261102123227099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261021135927099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pAnGt7Dz/+Y7U4EP+yx+U7XNZsv+K7lMjqTlDiAZJ7otomKccz95HGJYtNb08HwObYHxqppZhkGewHwq7KDVt0sXaA0t4p40cDR20b1j2I8i/hVOrySFrPfuSYkovESnU6JY1JRLZc49uauDTONYjajkfouXbWcD/Z33C+GSENyg/tzcpQG4GruIIYVEqs8Z7BnTf8ljfRtpe6Q+M+xtYRuhDFoLKaXjZ7DkR4KS0ZQaYx/vWXHtLmYIdPsPxSG/bEbgQawlxe60QAhXaE5khllvhs9d130R68oUoJeENebOPyjI4bnOBVexLr0fNPos+zg8AEOyqVLDxWu3Zc4XGKr5L6zZtuKw/rRUuGgYqtXGuNoOg0+7FF9bTW7OiyL5vv0UCaxNYXH/59O2t6yPDbPxoLjeI/RbrfyyYTTz4QCf7c7Dkm1zp5+4P/kex+cy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 16:46:33.9498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 753676be-66f1-4fbd-9c7e-08df39ca050d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000D8953.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6426
X-purgate-ID: tlsNG-ef75cf/1793724398-A4ECEAE4-07F88BCC/0/0
X-purgate-type: clean
X-purgate-size: 8074
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 52cb53f1816a ("xen/arm: dom0less hwdom construction"),
construct_hwdom() and the helpers it relies on (allocate_memory_11(),
prepare_dtb_hwdom(), handle_node(), find_gnttab_region(), etc.) are used
not only for the regular dom0 but also for a hardware domain created by
dom0less. Many comments and names on this path still refer to dom0, which
is misleading.

No functional change other than the panic messages.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This is just the cleanup for one file with the most number of occurences that
I decided to do in the free time after reviewing latest DOM0_BOOT changes. Other
files also need such cleanup on Arm.
---
 xen/arch/arm/domain_build.c | 44 ++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1ee1f1f6a733..606e85818eb4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -100,7 +100,7 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
 #endif
 
 /*
- * Amount of extra space required to dom0's device tree. This covers
+ * Amount of extra space required to hwdom's device tree. This covers
  * nodes generated by Xen, which are not directly copied from the host DTB.
  * It is calculated as:
  *  - Space for /hypervisor node (128 bytes).
@@ -111,15 +111,15 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
  *    plus the appendage to the main /memory node (NR_SHMEM_BANKS * (160 + 16)
  *    bytes). This overhead is dropped when CONFIG_STATIC_SHM is disabled.
  */
-#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
-                             (NR_MEM_BANKS * 16) +                    \
-                             (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
-                              (NR_SHMEM_BANKS * (160 + 16)) : 0))
+#define HWDOM_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
+                              (NR_MEM_BANKS * 16) +                    \
+                              (IS_ENABLED(CONFIG_STATIC_SHM) ?         \
+                               (NR_SHMEM_BANKS * (160 + 16)) : 0))
 
 paddr_t __init hwdom_get_fdt_alloc_size(void)
 {
     if ( acpi_disabled )
-        return fdt_totalsize(device_tree_flattened) + DOM0_FDT_EXTRA_SIZE;
+        return fdt_totalsize(device_tree_flattened) + HWDOM_FDT_EXTRA_SIZE;
 
     return ACPI_DOM0_FDT_MIN_SIZE;
 }
@@ -175,7 +175,7 @@ static bool __init insert_11_bank(struct domain *d,
 
     res = guest_physmap_add_page(d, _gfn(mfn_x(smfn)), smfn, order);
     if ( res )
-        panic("Failed map pages to DOM0: %d\n", res);
+        panic("Failed map pages to %pd: %d\n", d, res);
 
     kinfo->unassigned_mem -= size;
 
@@ -245,19 +245,19 @@ fail:
  *
  * Requirements:
  *
- * 1. The dom0 kernel should be loaded within the first 128MB of RAM. This
+ * 1. The hwdom kernel should be loaded within the first 128MB of RAM. This
  *    is necessary at least for Linux zImage kernels, which are all we
  *    support today.
- * 2. We want to put the dom0 kernel, ramdisk and DTB in the same
+ * 2. We want to put the hwdom kernel, ramdisk and DTB in the same
  *    bank. Partly this is just easier for us to deal with, but also
  *    the ramdisk and DTB must be placed within a certain proximity of
  *    the kernel within RAM.
- * 3. For dom0 we want to place as much of the RAM as we reasonably can
+ * 3. For hwdom we want to place as much of the RAM as we reasonably can
  *    below 4GB, so that it can be used by non-LPAE enabled kernels (32-bit).
- * 4. Some devices assigned to dom0 can only do 32-bit DMA access or
+ * 4. Some devices assigned to hwdom can only do 32-bit DMA access or
  *    even be more restricted. We want to allocate as much of the RAM
  *    as we reasonably can that can be accessed from all the devices..
- * 5. For 32-bit dom0 the kernel must be located below 4GB.
+ * 5. For 32-bit hwdom the kernel must be located below 4GB.
  * 6. We want to have a few largers banks rather than many smaller ones.
  *
  * For the first two requirements we need to make sure that the lowest
@@ -293,7 +293,7 @@ fail:
  * to be allocated in the low mem. Then for subsequent allocation, we
  * initially allocate memory only from low mem. Once that runs out out
  * (as described above) we allow higher allocations and continue until
- * that runs out (or we have allocated sufficient dom0 memory).
+ * that runs out (or we have allocated sufficient hwdom memory).
  */
 static void __init allocate_memory_11(struct domain *d,
                                       struct kernel_info *kinfo)
@@ -311,7 +311,7 @@ static void __init allocate_memory_11(struct domain *d,
     unsigned int bits;
 
     /*
-     * TODO: Implement memory bank allocation when DOM0 is not direct
+     * TODO: Implement memory bank allocation when hwdom is not direct
      * mapped
      */
     BUG_ON(!is_domain_direct_mapped(d));
@@ -409,8 +409,8 @@ static void __init allocate_memory_11(struct domain *d,
 
     if ( kinfo->unassigned_mem )
         /* Don't want format this as PRIpaddr (16 digit hex) */
-        panic("Failed to allocate requested dom0 memory. %ldMB unallocated\n",
-              (unsigned long)kinfo->unassigned_mem >> 20);
+        panic("Failed to allocate requested %pd memory. %ldMB unallocated\n",
+              d, (unsigned long)kinfo->unassigned_mem >> 20);
 
     for( i = 0; i < mem->nr_banks; i++ )
     {
@@ -516,7 +516,7 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
          * * remove bootargs, linux,uefi-system-table,
          *   linux,uefi-mmap-start, linux,uefi-mmap-size,
          *   linux,uefi-mmap-desc-size, and linux,uefi-mmap-desc-ver
-         *   (since EFI boot is not currently supported in dom0).
+         *   (since EFI boot is not currently supported in hwdom).
          */
         if ( dt_node_path_is_equal(node, "/chosen") )
         {
@@ -1544,7 +1544,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
 
     /*
      * Even if the IOMMU device is not used by Xen, it should not be
-     * passthrough to DOM0
+     * passthrough to hwdom.
      */
     if ( device_get_class(node) == DEVICE_IOMMU )
     {
@@ -1695,7 +1695,7 @@ static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
     kinfo->phandle_intc = dt_interrupt_controller->phandle;
     fdt = device_tree_flattened;
 
-    new_size = fdt_totalsize(fdt) + DOM0_FDT_EXTRA_SIZE;
+    new_size = fdt_totalsize(fdt) + HWDOM_FDT_EXTRA_SIZE;
     kinfo->fdt = xmalloc_bytes(new_size);
     if ( kinfo->fdt == NULL )
         return -ENOMEM;
@@ -1764,7 +1764,7 @@ static void __init find_gnttab_region(struct domain *d,
         gnttab_resource_max_frames(d, XENMEM_resource_grant_table_id_shared);
 
     /*
-     * The region used by Xen on the memory will never be mapped in DOM0
+     * The region used by Xen on the memory will never be mapped in hwdom
      * memory layout. Therefore it can be used for the grant table.
      *
      * Only use the text section as it's always present and will contain
@@ -1776,7 +1776,7 @@ static void __init find_gnttab_region(struct domain *d,
 
 #ifdef CONFIG_ARM_32
     /*
-     * The gnttab region must be under 4GB in order to work with DOM0
+     * The gnttab region must be under 4GB in order to work with hwdom
      * using short page table.
      * In practice it's always the case because Xen is always located
      * below 4GB, but be safe.
@@ -1941,7 +1941,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
             return rc;
     }
 
-    /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
+    /* Map extra GIC MMIO, irqs and other hw stuffs to hwdom */
     rc = gic_map_hwdom_extra_mappings(d);
     if ( rc < 0 )
         return rc;
-- 
2.43.0


