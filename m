Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31E9C98318
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 20:58:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433042.1653881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qWK-0005f9-Gt; Thu, 24 Sep 2026 20:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433042.1653881; Thu, 24 Sep 2026 20:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qWK-0005f2-E7; Thu, 24 Sep 2026 20:58:20 +0000
Received: by outflank-mailman (input) for mailman id 1433042;
 Thu, 24 Sep 2026 20:58:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x9qWJ-0005eb-K5
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 20:58:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9qWJ-006bdo-0u
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 22:58:19 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab58eca-bab6-0a2a0a5309dd-0a2a4507bfe2-20
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 22:58:19 +0200
Received: from [52.101.72.96]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab58eea-b4ea-0a2a45070019-346548602343-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 22:58:18 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by GV1PR03MB10503.eurprd03.prod.outlook.com
 (2603:10a6:150:16f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:58:16 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 20:58:16 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMRtPN43aJim3Ip0+0Q0UQxof+rJp+A4Ec8ws1UvIvPhEWFK3Jf4akODFHz2BTqIMP7uSzgwXgBasCBkLnLNopwtt3PjoiQNLtgMaxuJ//8IlpB8bnBJVgvi9YPYhrIo5OCVQO1HeM6WISA/2WKqFCkOzI/elEP/imtCgjBoTw3+4pQCNFAfZzAKiypTNcxCkjaD35qbw+ow52RKjXnGsICv+NxFOZ1rVXN9tMlXw+eKls3VCQrwrB1VC9oeYeVGB/aTnZDZpBjSqhunP+zPpC6Az0zOtyA2LY45ARfO5qFpb0cu7cfoBkdMnbGcCiXtZh6srN6Olvr34BSlXTiDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cKreGMUElULo1QhsKeoGyzZB+m+nWVmEkjFZ6Y0E/o=;
 b=Tn+YWP29nsFVC+g2Z2JaJ4TL+UGgm0yM3O915rFZkK3IsU74s5Z3cXp+nk56F1K6mffYGHlgIIaWImCyEoABF/e4A2AqD+zecmDXM07XJVrxE/4c6QHSV4gP769SYfKLeYWtkvm6RePnYu+PBmrO4PoQowFUmAsoltbvi0ioEhw4nj7b16ZlpZ8jqfZvJKH+5xtlvWzu/ZhiZlKziFx7NROMeKS23HVVEH/+LK3IwHo19Hxhgh712qTrvWYr26PuAvr+3/lXqdy/KOzM7pWFF62lDGkanJOM0lKTAWkaEOnVsH4LjFtJvA0LrbokIyYDlXx5fzovcCQx6zhb6vJ5Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cKreGMUElULo1QhsKeoGyzZB+m+nWVmEkjFZ6Y0E/o=;
 b=hPlv2lfsDxTDaCwTcIxVXiKoHZKpCj6FplNFesJkwFccG63xU1YARr60ocOeUZ6PmlncMdT+QUCcpQaJ0UXzdAAxEGxeQEYzXR0ELeu/Li/npefyOgsDttIbPPYUQ8xWtz1dZTvxWiATgLvLC60QtNscgwHI4RrP0A3kVpg+7znHnwBIM1/3nfq0OdSDH5CtCmasWc5KJ9NvfOhhSrNb3nreZVI/KgVMOxS79RySOs4yEEzphma2Ve/Xo9Gxljz5THj9goJsMvNhQ3LmZgyRNdT8gTPHwlM/yxC9JVpEVNw4D8ZzHkCooWpSV1Rqy1+ojMwFjadH4O4ldbuiJlhh3A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jens Wiklander <jenswi@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v5 1/4] xen/arm: handle irq_set_type() failures
Date: Thu, 24 Sep 2026 23:57:53 +0300
Message-ID: <f15dcaa9b650c8d0cb27c29bdad0af14bf5d61c9.1790160605.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790160605.git.mykola_kvach@epam.com>
References: <cover.1790160605.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|GV1PR03MB10503:EE_
X-MS-Office365-Filtering-Correlation-Id: eaeb7763-ca84-45bb-1ccd-08df1a7e8e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ICH174TeE8r+OFrdJ2Q0P3mLL7/E5HVNEZVh5QOKpn5GcmRK1DNZtjUlga3hb1H/hwblQf39oKvItpcEx3MSWiOcEACg9rt6IFc0JyWURGNpP3x2kBW5PKppNmlXiLBSkmIOOTZMsVMI7C63g9lJQvBD3TEu30OXvRVLZ+RZ8JX69TIWjfMaaPm/K7iOBnn1a+fEgNYnqF6uD7EfhC4uTozyIg9CQN3KM8ixGBYuwCk7tVzlDcqqB+MGhLuWA4IsqOzHwCiJ67idxIA56WCYlSXR0FJeJH3vgiaQyAkpV+kjvXcfEXYasHbAO1z5+O08CHH0U84rj+N5xMiw/ItyfDAd9J3Wq6SwXN88qhk8DHldgcVFoXtm72DAZ5mrm4mAtrJvwOx4BeiexdFqb1on8FqU+UwN8On1pwuCT23DkMit977y4s6x2SPoXnd4ZcuSHwf4xHYBwH3z2JdaJNBgH8dvRlV2qOoj1tbL10d+sTcOUmYwHzmcbDZrO6RAvrTpE+kVFYPvrsw5KB27SDHYzJ7zYJDy4AFLMBxyL+hswRShcQkaJiezc+uU4DVELPTAkKgX1tlY/aAO/vjXd+sT/JwOaGIQ72jaIxL3aWrjmwWo7rIpWfGIyDGIzJQXN5LV5xn2QkH+S4nghGF3tO2wcOBB0AMzARVgCiqQC/ONkLI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HI4go001o3bIuJJ8JD5j6WUOjT7vYlRZoJMK/vJeFocV927H8SjFSW06qr1g?=
 =?us-ascii?Q?5MGSq5rG9YZ+c6ukunkvICE3gpc/F7N592AeNH2nDzde+CdNDXbu0MRA52ju?=
 =?us-ascii?Q?gyC+KNNVRsm5IWG4aZe+s+Oqkz+jjR9SVf5FjQJiZkdG0lZLqpN0H968fy9d?=
 =?us-ascii?Q?O+kTi+eIUZJOmWjpUxQDIVEQwbv27XaKcGhVybCxFqVM+4EhBtOD95rSdhw6?=
 =?us-ascii?Q?9J/OuM4KHNx1QZed5XfI4omLlV7GVhMLvh2smMjCrdieg+MG5X3Vldvfk8Ir?=
 =?us-ascii?Q?GxQ/yW3quNVn/4gKjvyHrlki1LfGjG7qLaLLndPAPkg4vlHn/6IEymUl3rwd?=
 =?us-ascii?Q?Fr+vEtIcr+XhU4w3h8QKlWTVvXODc34be5ZlSfa+uZ4akYbxugGqjrBn1FmD?=
 =?us-ascii?Q?RKPcqi8ymQ9dny+6nbDBQydbyXbddm49Xds74c575MRUpWyB4Y/dvPLHnxdN?=
 =?us-ascii?Q?QR5WOlalUCTvm9hKvof6umjJayIGVa56qwjPJlDNG3wwXfjd2Aw0LGI0i8hd?=
 =?us-ascii?Q?EBEeoJEO6GmhJAmHD8CfpWC05O+q8XPDjSI2uWaZW4z747iK9JD2jKQs7mcA?=
 =?us-ascii?Q?10yXeexb8VTCxsgN9smoL1ryuSekcK/CxJlwM2We0/zbrdCjQYsL6TcpLY70?=
 =?us-ascii?Q?+nlaWmcvGEKGrqbKUNtToIpS/CGF1quZbqpa14B7TLKC2BviNimOD2LBEY+x?=
 =?us-ascii?Q?Y6xk4zNj6PsByIJTrpmTbMN45gzdqRZu3hm7VICRU5eX0SXV6TPc+Fe+tzG+?=
 =?us-ascii?Q?fRNeq9sI7FWWUYApgZs6OMFFqLr2wyC/cYLODDlMIzGn+NlDPZItBXDP9/8P?=
 =?us-ascii?Q?x8HI7iHRGq2vS5BuFSUYPqkoz5I4REyweeAQLfZf5rzBK+FAd25ea+Hkh8H2?=
 =?us-ascii?Q?7Phs2o9w8d7Y+jIwlbqysKivl8zZ9TJPWOP/D7djEoORqRwTzQqUdsSzRMO8?=
 =?us-ascii?Q?B9EHS8HfaVCrdgASXI2uHCSDnf0YGh2C2M4dMekaQU167AlGu1hAOAfO2lsi?=
 =?us-ascii?Q?o6Usd4ubMMzA9MpmN8vGPm/fDC4FSQdrTQatQ/tc6mivQle/x/kRxIXf+4Bv?=
 =?us-ascii?Q?Gx9bDmeN3uFiTrTY6ZzkMLBt6lp7/jYFaqjXaCrVNMAA0VdpX0sOGyFInQJb?=
 =?us-ascii?Q?PJqoO0bKxltsTeCTH3IYYsIFiRV8SAt0fopd8dCLOOGUcmY6G2M+ekpp0TIK?=
 =?us-ascii?Q?3zsCe8VVSfsgBuqCjfAT57DQ2i6ydRRlKeSjoFyqZIKAQjxn7QN25E+Lvrkv?=
 =?us-ascii?Q?0pXO5TruXxwKu+MpYlGpk59anO08U6ZZW4SK9pP93eElk3gOIFj+WuYZl53C?=
 =?us-ascii?Q?/nloD+JVrLTKHUyp42Ql8WkJe9kzT/U1GSsL0vX0Uvb0qOzsRz+x2R78XSFE?=
 =?us-ascii?Q?Uw5sT2ui90YUhOXbA7QB/q5x7g71me+nl+QIWgqtr7JoElgB1EjMBH7keNRF?=
 =?us-ascii?Q?xaP2mWeozcK0Cpsn/7D7XorCiNCqkmUm9zCK4je8bnmT66+BIcf7A9HdTEce?=
 =?us-ascii?Q?7+KeDUXS28k4WmRXTluVJ+D4lEPtRErQNIRebFKXsxQl4bWM9MXTA0tWm9vD?=
 =?us-ascii?Q?I18fa/JCWv0NPrLKA0A9DyGcyGDJgBYqKY4Fa+LUrRR3JyXApfDPYd7oSbgv?=
 =?us-ascii?Q?uZcptWHbfWpV1LLMXBwO+pbi5OVOqLFoMLugp3EFQcYYizR6uhiSnUg8nlMo?=
 =?us-ascii?Q?txU+jRmZkH1KIS5dDmo3rJoIDfKdfLea8TWO/A4FJDBuYx66cGa31q9rTo+x?=
 =?us-ascii?Q?MUWhHjnCag=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaeb7763-ca84-45bb-1ccd-08df1a7e8e64
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 20:58:16.8019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zF3QyVmAavuCDFfeJTg52Z0a8cWhq9Ojj+hjUfLC9xP2huwTaaG1DCCj5nf0+NbZDL/Sr4+AZyp1yRsrpRNUQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10503
X-purgate-ID: tlsNG-ef75cf/1790283498-A58C1AE4-2EE4BAF3/0/0
X-purgate-type: clean
X-purgate-size: 8128

Several Arm firmware initialization paths discard irq_set_type()'s return
value, violating MISRA C Rule 17.7. If trigger configuration fails,
initialization continues with an IRQ that was not configured as requested.

GTDT and MADT retain rejected timer and maintenance INTIDs.
check_timer_irq_cfg() and release_irq() later perform unconditional
descriptor lookups on those values. Xen has no backing descriptors for
INTIDs 1024 through 4095, so retaining one can cause an out-of-bounds
access.

Check the return value in the GTDT, MADT, SPCR, and FF-A paths. Store timer
INTIDs only after successful trigger configuration, make GTDT parsing
failure fatal, and stop UART or notification setup when trigger
configuration fails.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v3:
- Avoid partial state updates and simplify maintenance IRQ setup.

Changes in v2:
- New patch.
---
 xen/arch/arm/gic-v2.c        | 15 +++++++++------
 xen/arch/arm/gic-v3.c        | 15 +++++++++------
 xen/arch/arm/tee/ffa_notif.c | 11 ++++++++++-
 xen/arch/arm/time.c          | 18 ++++++++++++++----
 xen/drivers/char/ns16550.c   |  8 ++++++--
 xen/drivers/char/pl011.c     |  4 +++-
 6 files changed, 51 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index d05c574d88..87eda9d322 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1166,17 +1166,20 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
     /* Read from APIC table and fill up the GIC variables */
     if ( cpu_base_assigned == 0 )
     {
+        int rc;
+
+        rc = irq_set_type(processor->vgic_interrupt,
+                          processor->flags & ACPI_MADT_VGIC_IRQ_MODE ?
+                          IRQ_TYPE_EDGE_BOTH : IRQ_TYPE_LEVEL_MASK);
+
+        if ( rc )
+            return rc;
+
         cbase = processor->base_address;
         csize = SZ_8K;
         hbase = processor->gich_base_address;
         vbase = processor->gicv_base_address;
         gicv2_info.maintenance_irq = processor->vgic_interrupt;
-
-        if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
-            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
-        else
-            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
-
         cpu_base_assigned = 1;
     }
     else
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index acdac22953..b32a9b5009 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1743,15 +1743,18 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
     /* Read from APIC table and fill up the GIC variables */
     if ( !cpu_base_assigned )
     {
+        int rc;
+
+        rc = irq_set_type(processor->vgic_interrupt,
+                          processor->flags & ACPI_MADT_VGIC_IRQ_MODE ?
+                          IRQ_TYPE_EDGE_BOTH : IRQ_TYPE_LEVEL_MASK);
+
+        if ( rc )
+            return rc;
+
         cbase = processor->base_address;
         vbase = processor->gicv_base_address;
         gicv3_info.maintenance_irq = processor->vgic_interrupt;
-
-        if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
-            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
-        else
-            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
-
         cpu_base_assigned = 1;
     }
     else
diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 186e726412..d08d0a3366 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -407,7 +407,16 @@ void ffa_notif_init(void)
         irq = resp.a2;
         notif_sri_irq = irq;
         if ( irq >= NR_GIC_SGI )
-            irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
+        {
+            ret = irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
+            if ( ret )
+            {
+                printk(XENLOG_ERR
+                       "ffa: irq_set_type irq %u failed: error %d\n",
+                       irq, ret);
+                return;
+            }
+        }
         ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
         if ( ret )
         {
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index be54b87438..ccfb76e20f 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -60,20 +60,27 @@ static int __init arch_timer_acpi_init(struct acpi_table_header *header)
 {
     u32 irq_type;
     struct acpi_table_gtdt *gtdt;
+    int rc;
 
     gtdt = container_of(header, struct acpi_table_gtdt, header);
 
     /* Initialize all the generic timer IRQ variable from GTDT table */
     irq_type = acpi_get_timer_irq_type(gtdt->non_secure_el1_flags);
-    irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
+    rc = irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
+    if ( rc )
+        return rc;
     timer_irq[TIMER_PHYS_NONSECURE_PPI] = gtdt->non_secure_el1_interrupt;
 
     irq_type = acpi_get_timer_irq_type(gtdt->virtual_timer_flags);
-    irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
+    rc = irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
+    if ( rc )
+        return rc;
     timer_irq[TIMER_VIRT_PPI] = gtdt->virtual_timer_interrupt;
 
     irq_type = acpi_get_timer_irq_type(gtdt->non_secure_el2_flags);
-    irq_set_type(gtdt->non_secure_el2_interrupt, irq_type);
+    rc = irq_set_type(gtdt->non_secure_el2_interrupt, irq_type);
+    if ( rc )
+        return rc;
     timer_irq[TIMER_HYP_PPI] = gtdt->non_secure_el2_interrupt;
 
     return 0;
@@ -81,7 +88,10 @@ static int __init arch_timer_acpi_init(struct acpi_table_header *header)
 
 static void __init preinit_acpi_xen_time(void)
 {
-    acpi_table_parse(ACPI_SIG_GTDT, arch_timer_acpi_init);
+    int rc = acpi_table_parse(ACPI_SIG_GTDT, arch_timer_acpi_init);
+
+    if ( rc )
+        panic("Timer: Failed to configure interrupts from GTDT: %d\n", rc);
 }
 #else
 static void __init preinit_acpi_xen_time(void) { }
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 120ac09d23..eb608ab8b4 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1928,6 +1928,7 @@ static int __init ns16550_acpi_uart_init(const void *data)
     struct acpi_table_header *table;
     struct acpi_table_spcr *spcr;
     acpi_status status;
+    int rc;
     /*
      * Same as the DT part.
      * Only support one UART on ARM which happen to be ns16550_com[0].
@@ -1959,6 +1960,11 @@ static int __init ns16550_acpi_uart_init(const void *data)
         return -EINVAL;
     }
 
+    /* The trigger/polarity information is not available in spcr. */
+    rc = irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    if ( rc )
+        return rc;
+
     ns16550_init_common(uart);
 
     /*
@@ -1975,8 +1981,6 @@ static int __init ns16550_acpi_uart_init(const void *data)
     uart->reg_shift = spcr->serial_port.bit_offset;
     uart->reg_width = spcr->serial_port.access_width;
 
-    /* The trigger/polarity information is not available in spcr. */
-    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
     uart->irq = spcr->interrupt;
 
     uart->vuart.base_addr = uart->io_base;
diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index a336241033..97c53c11e0 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -363,7 +363,9 @@ static int __init pl011_acpi_uart_init(const void *data)
             spcr->interface_type == ACPI_DBG2_SBSA_32);
 
     /* trigger/polarity information is not available in spcr */
-    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    res = irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    if ( res )
+        return res;
 
     /* TODO - mmio32 proper handling (for now set to true) */
     res = pl011_uart_init(spcr->interrupt, spcr->serial_port.address,
-- 
2.53.0


