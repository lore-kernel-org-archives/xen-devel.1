Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CD7C55ABF
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:11:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383340.1626597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wraTH-00061e-L5; Wed, 05 Aug 2026 12:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383340.1626597; Wed, 05 Aug 2026 12:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wraTH-00061X-HJ; Wed, 05 Aug 2026 12:11:43 +0000
Received: by outflank-mailman (input) for mailman id 1383340;
 Wed, 05 Aug 2026 12:11:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wraTF-00061K-N0
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:11:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wraTD-000RKK-Fr
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:11:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a732873-bab6-0a2a0a5309dd-0a2a450ba03a-18
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:11:39 +0200
Received: from [40.93.198.60]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a732879-b7e8-0a2a450b0019-285dc63cc973-4
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:11:38 +0200
Received: from BN9PR03CA0277.namprd03.prod.outlook.com (2603:10b6:408:f5::12)
 by LV3PR12MB9095.namprd12.prod.outlook.com (2603:10b6:408:1a6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.20; Wed, 5 Aug
 2026 12:11:34 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:f5:cafe::15) by BN9PR03CA0277.outlook.office365.com
 (2603:10b6:408:f5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 12:11:34 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 12:11:33 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 07:11:33 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 07:11:32 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Wed, 5 Aug 2026 07:11:31 -0500
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
 b=Iq8h8IzjFckCyOTXJiuJ7qlHw9hvr9TUbx60pEibpOP6Kdu+EsVe6j2Kw80Lb78PfgsRDwJkGNVB6peip3vRmBRV7+j1gM735HPI/bKE3e/xZPa96DtHr7z4715VqjZ9aXhtsNEQxiT9JMtWnfAoyrz7RxDxkAvwbXGAFtagFGmD691B52V3a8x1iABX5bRo9eHCocmG6NyHn7hVPj0CJmNKkc7Q4v+dPz5OX4XfCDFLj4SYIgVh1V5c279o0OF8FQ855qHVWRKm8lxseGDSbebVpv+UeR5ZT6fp/Ij+WCcDgvDiSEEPjhxcspUxHMennYk3kaVQlSrye/slyECBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unubrNBuqj+l9w841dcepEg1+HSa6SRJQulOWbGXmbQ=;
 b=HxPIgH0f+9HrEyKUpVqGklGyWYFPLtPuCE744HupCsJPrCDVivftbbLxXq0pNDVrAJlBGaNxxi3AG8b9aYEt2kaCAyK3FBc5zwPPkuR3lhhfZKwB8mHu5ynS7J2DuChnwItHo0ooJhDfu+aUYQShqqS+TdtpZ1lL33/bbH/kI/J/Awyt3AVVHI8NF4QkTrlRvyNU3j/z7bNJ1M/tGShbpgaSFR8+rD+4vLn65/gH/6hpyH3AXcNhAj+BVPUCTV5O5NtrlJbQjBBWoJvtDSmCHlu12hatv/0Byw+kAwJ/rTpfEdopi94exGxHoVn1e+6/d1P7PV1ir3r5SYy2sFaAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unubrNBuqj+l9w841dcepEg1+HSa6SRJQulOWbGXmbQ=;
 b=OxzlD8e1ExXlTN3sVpBgGim+q1fFiR45FlSF1B5hwID/plXvgqNM28DRSFZjwpYVg7nIcl827NUzwjT9lBO6f8Nr/K8TrPXT/BJharvqnEN6UmBjobplgldREWlweiwYBEci+YmrZEdENQJTym7s9yJXf/Iiu9LQeZLlDRiJbXU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH] xen/dt: reject "xen,static-mem" when CONFIG_STATIC_MEMORY is disabled
Date: Wed, 5 Aug 2026 14:11:24 +0200
Message-ID: <20260805121124.150017-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|LV3PR12MB9095:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b49c11-5aa0-4d4d-7399-08def2eab0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	BB1sJBMTcNGyTgToF77qGmz342YlYFXjJEb+0nvHRfGhny39QBU7qq8rrq4H9o2J57d9z9fmgxSNjOXv7nPQqEUY9wfk0K0iW8U3UKkBILd4Px0BjuyEvWBGf3KXmLPx5xRTY0RzXoZkhTpZwjnW/aDy7ZSBd6UUDvJ1xd7klijMP8/YPTagtgM6w4ei4oKPt7bh/a0u35Pyv8nhsgG2+O5uzC03tlxXWTL+VldQjWk727T2qvmLmAJbxU1PrTING3PmxQOwF1uOJbinjTuGkp+GzR+WwHp86hA3dwE2yAt9yqDM5lKo6K4pSb+CVvs0SynB6xqTDqGw6mUGgbOeGoBPzCw+TFLiGJY/diN9aM0tpGk/hpNNU1QCY1hsdtlM76U/e26WmDkoS0hYZv4GGcnhWuiE7AX9TUKjPLoExKWHxTkNct5oUZ5hiIFhRU3k4cfzmhMuU4wn6AgB7mZ4AXY9d8fh8hIjthOaY+blQiajLQ2NRhcYbQOCU8CwRcL6ELDynDZbBrTqQzBOuDdFTpyEZ/XuNvhLZT2wf5q12io8BaTgujsTu1nw30GVvmUJwUuhYoT5phW6jdk2ju5VzmqCyqBfvkcEJlQFu9WsM8TzHA76ApNa2hfpp5Rjh57h+rioxw13PytYJsvZGHiqaYpxNHHf6tjx7OCnS9hqWYM/bsKTcXvZJaaQt7khIR+bLjA1/qD/zC0z40YU1K26Ew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WXekfs5cg5Ioaj0ZgKl4J5ksnPXL41yeJdUOGL9N31ff3OVMLWu6bf/WGHs/jwbLVgD6mUt9az6O58XcvMq7gmQmSrNHtkpmkZVOuL4ykZn9GXH9NF3gNSI6zmJl6RyT/1qom4kZKHtdUHUfZw9Rd+c3CP1UYxS+uPoIxT9RHmby8m9qonUUJrWNdvI5DE2DRMgaOudNLmGbahECMu4qz8Fs/f0qhVj9gsMrkxgKnG+ZBWoXcDRVHz7rncudoTtB7QAENL/31fWjHTvOZtRRc0yiZxZaWrU0A9PTqOk6fGKZA77U++5XOZH435QrBay74oTHDXtLU3s1w3APbrQi246Fuv14lho1MVy2spvPsEh9zYpDtx2nx7Pfr+120LCgdI/AXz+5sfiLOUb/csWAtqKtgTJirxAydMnLND5Fu0DUx7hzKMrhuAsqF9u5xevn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:11:33.7245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b49c11-5aa0-4d4d-7399-08def2eab0eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9095
X-purgate-ID: tlsNG-42698a/1785931899-18AC89EA-276021D3/0/0
X-purgate-type: clean
X-purgate-size: 1483

process_domain_node() parses "xen,static-mem" regardless of
CONFIG_STATIC_MEMORY. With the feature off, init_staticmem_pages() is a
no-op stub, so boot carries on until construct_domU() reaches the
ASSERT_UNREACHABLE() stubs of allocate_static_memory() /
assign_static_memory_11(): a debug build trips the assertion, a production
build gives the domain no memory at all.

Bail out at parse time instead, like process_shm_node() already does for
CONFIG_STATIC_SHM.

Fixes: 41c031ff437b ("xen/arm: introduce domain on Static Allocation")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/bootinfo-fdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
index 272b5a6c0ae6..ca64daf4cdc8 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -349,6 +349,12 @@ static int __init process_domain_node(const void *fdt, int node,
         /* No "xen,static-mem" present. */
         return 0;
 
+    if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) )
+    {
+        printk("CONFIG_STATIC_MEMORY must be enabled for parsing xen,static-mem\n");
+        return -EINVAL;
+    }
+
     return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
                                    size_cells, bootinfo_get_reserved_mem(),
                                    MEMBANK_STATIC_DOMAIN);
-- 
2.43.0


