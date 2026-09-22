Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB89C98302
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:59:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429190.1652122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92tZ-00055W-PV; Tue, 22 Sep 2026 15:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429190.1652122; Tue, 22 Sep 2026 15:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92tZ-000558-Kl; Tue, 22 Sep 2026 15:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1429190;
 Tue, 22 Sep 2026 15:59:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x92tY-00052R-Nf
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:59:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x92tY-0051uC-4E
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:59:00 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab2a5b3-e002-0a2a0a5209dd-0a2a4503b2ce-34
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:59:00 +0200
Received: from [52.101.69.87]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab2a5c3-fae8-0a2a45030019-346545579f74-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:59:00 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AMBPR03MB11360.eurprd03.prod.outlook.com (2603:10a6:20b:767::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 15:58:58 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 15:58:58 +0000
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
 b=xX7nPF5AtWO9RH0I2a+z2LvO39mlYCSex1vmVtd1vuaG9ry18xmmkfiQwfCKLUy1e8QXngT375IUmJaoYrMxCDJD2V61hDPCLE6ItNzN/OilTON3mQilOWY6umWVw4NaOXW9ivEW8B9D/7XSVP0crSxMrY0jlAnGIkfeRaN5aM1+/iAPC/auWIbmw0ncSOmuzfGWNINjaYTe57IvG6sSgqcQZpAv2NU33+4AKaY3lyu+4fuTr4j7qLKCoKDgUdBQ4eEjE9nJ+q+AFTcEOvIi69f5Yca8k/noZ2A+1CaD1TJGkVhHO9BeAAakWmHawqgmag3mWlGzUfTVcEd4sOoI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+hTxJNTEDvZMRAcnSSFx66gX6XkBALCTM+wQLOjqmo=;
 b=UoSpN11ZSKxm4c9YENc5fFj7mjWr/lbrGRmILz+VqM2GDNcPK0+6knBEsKvaSBANe5MRPh1+Q0UVRWC2FvK4rxCFCLv3p7nEpWiAGb92AQ07KIrUEPZcCQrAgPtq6uYaLo0ytuYzzztxC+P3DXVkxdQvR7VsnmxSx/hZ6uEcYf/suDajcJi0CzJJJW0NvFmDsTkYBGC7fB2iz5U5BTAz0FOKSt5erBEkLdLoI78/7GRc5I5g87X4Pegba4CLuthIskbkYAcESTXz5k1J+1SFGg8Ectlpy/mkCyV/Mk+ZFY/YQGBhRTO19qN9TwBGOiCbClatLdtuDPN82l0qIDuilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+hTxJNTEDvZMRAcnSSFx66gX6XkBALCTM+wQLOjqmo=;
 b=fkhQtI8BkzVVln4JksFSaDwSw1pduxVZMm/0a8BenTfJXav5woS1SBEacHpzi+VYasD5OM5UtoqeYeZgaC5rSt7qv9O1M3JpUTNbAUpds6jTaO0olOzHMFAyywlHJR8ryBT9WtJYvlN5+sBjDKtl1BHWPFj6nX61uvjIJfyw8qdf5ZjJwoPNHkUiyW9NYIQeYOXAoTQPVcjIb8qpyC+6Ht6qaGtYf8up6U7c3NF3lZVob5FnebDiafnRDQweJR6i02q1S8XMQ/jNT7yNc3Lv8/tFruzXsMkowLVNuDz9l+DNJ38/ZfNAZDab/KS99zAKe7iwTeDpF1k4yjSAORf/ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 1/4] xen/arm: its: initialize host LPI state before activating ITSes
Date: Tue, 22 Sep 2026 18:58:39 +0300
Message-ID: <e93b497d55dbfeb2aaaa9ff4b55b8925f902d395.1790089161.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790089161.git.mykola_kvach@epam.com>
References: <cover.1790089161.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AMBPR03MB11360:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba07f7f-a4cb-479e-6683-08df18c2698e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dmSf6e4c+BUg+mBY3WaqWeM5dp5EZt5s2imhBL/6VIvTcXr5bQyN90eiy6CjjQ/C12pEUTkLjAjwWa3qdWIGSCNSNuyEvJhxW8F17GuNv+CiTNJ5J6CYdnzSRJmguMJvQG+Ob0zihkcL0AYVrRK2ZUUx0Vi05BllmP6GeRfwoajq5xbeFz3TdivUP634kThqDz8UyKfUTBNosd+IEWEoVm74+QG9F0VQMUwmnUJnhlFRFf4Oj04nR1VQ2DjIW2dox6n7y8XEQfGyUJ2oLBfT5IQOujMt/aGqDQDYV8bLN042yVo3ZTKiCiGd4ROuv3sMxmEGIi6s06bnA8V7ggiWb+qyiG11/LL56fESkbM35gMjkr+q8TXGIKiw5Ixs/wITDzxxxSy1rEpIjAL93zPbwBztB2ndUBrjwGvihR7xK5PXXreYn1Ctx46M/5CsUtbBYInzcM8YhMLT+dE4AVNt6Bzyee5Mohk+EU1B5tlNeXw6V9BaHgcRg2Bi791gKWNpTC4lgt0KrtLjDCQEmgxQfdQf8lsb3oEIyxCQ/nbZU4QKSE4f/o3Qm7FKimLs50JKmD3uWb0wonJhxG5u0r8+2iJkEQIl20/GcWcPdvuLHeVzZg9L+Np9Bxwnqwk3yjMU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?83OeXx1cg9ErD5uByvrXcHwcoaPaHu9wdDOycyQBd1u4UQAMQKbEI8Ghakw5?=
 =?us-ascii?Q?6IsPq+JC+oSIr0IBJfKQN/2Dl0K9f4FmviJZ6NjA9KUdssxHfL4vBMWduK4H?=
 =?us-ascii?Q?KHTvD+NmP7ADxbUO2NzrcC0LhmO8biQ+RBmcQ5inwZw8BEuKGaum8xjRlXVH?=
 =?us-ascii?Q?8aLbkaZlUu+S1jUzfoDNwewY8/3g63Rdrbv06b81E8eVxBRWgu0HDg7vQl1c?=
 =?us-ascii?Q?7KO6CI9TfiwGTzIVyzol5ymIMneD25LIN5CpSlFMrOXusNF/wQv2FzbQQMaY?=
 =?us-ascii?Q?1QQrqgwW+6aaDuMW2pAqWXQOMOFCTZ5a9v5HjdWvbmuFYUCGrXGsoJau/2kn?=
 =?us-ascii?Q?lx/0HUjBRZXb0K5uJ018/7sMhrh4YD6aOT8g2nGEDrOhzKPxggyDq3ZjeHEU?=
 =?us-ascii?Q?3Ml3DF5b7lH+7bL0AxHeMpeAb4Z47fp5IB/heBW8ssPz2wNF9ROdIOO4ocSC?=
 =?us-ascii?Q?9STVhLHKS03nve7xU2XWQ+V3vZYGU5C/0OKhfqVs8TCWKuYdnYepiMYZvkZN?=
 =?us-ascii?Q?nWdQ+9XsVxejmZ8M4LU2CkrQxrKdjbku+0jQA6sFX5X91/g76+xKGIrHG/9S?=
 =?us-ascii?Q?Vxqx9sXKdGrLndFsF6oJcYJIeduEO0TrmFxqDJ8GJQkCb0O89IIvEnCEuNJG?=
 =?us-ascii?Q?Ofv0GODynh66qcos/ApfM0ZrAnsXgZ2+9wALt6drVOkLCBdUt5omcMgCva3P?=
 =?us-ascii?Q?oiE/BTfPsK2Oz81KkxSQpa31ybDN8AP1JhTuiE742XJ87N2jWAG4wN3On8B7?=
 =?us-ascii?Q?6FKkxOrFjS64WrqLeyjX7RwoyG4AcAmhgz5F5SPGLbXVdO50+hYh03903xks?=
 =?us-ascii?Q?6PP0uVB53K9Wc9UCA7DxFyicVpW0Qwdms2pSyJEWdY0YAmEFEgGg1e80qq8u?=
 =?us-ascii?Q?yjLBEAtqzhmJuAoTgVMF4wfcoE6aBXQUKGxa4b77xZU1dW8lqYRavTGyLkC1?=
 =?us-ascii?Q?maoHlJjaH8ux/QN8QeY/Nr56NP+S3Hmo+kN4wLotrzJY8iZ2ndqrKIWeh7M/?=
 =?us-ascii?Q?MSPxXvqT8WvmZ7Wsk+uNwwAZ6LNPX5t0VD6xi4JBW1316Y3jMW6eFbbdT3Tl?=
 =?us-ascii?Q?fE6H2eIvbVtPacxnZOvY0ozG+zEDaTCS/5BbHv6GeWASnPiOedClK3Yvl7mX?=
 =?us-ascii?Q?fvMBCIl0pkFXy9HxKBYu6xtRPl36YAva2tydtKhYqsgKj0O2qlkbyr/e0+p1?=
 =?us-ascii?Q?oz2EevfWU33LLZ2Nj16hw3HJNlGy4/lztQKe7OLoeYu3ujlboCHwxLQ62fIS?=
 =?us-ascii?Q?2ibOYAznvMuWJ2l7GXApm2TiLoUIfsRlJzaWD2tipM+HJQ4jPa/OK2TecFKf?=
 =?us-ascii?Q?sLdm50EKaaC55xWEPTxACVAw5U8aKeK2x1p01mk2M+CuAndI9mfiisQlgVeE?=
 =?us-ascii?Q?gMk04FIvz1stXSCjZfLPrDJeaG1o4cCQ5VKVC+tDs1yslPWnW1xCKeCe3iN2?=
 =?us-ascii?Q?nV1cOy9LZ8d+2ClVeyBZydykNxXeupCMlzq+sGwL4Fv2piOwQOP1XUkVUIKD?=
 =?us-ascii?Q?M6DLnOnrM/MjglATarJ6nj6eTMSdlQGCRH6c9CYIuVq6o+Yb8YtucqccZSpF?=
 =?us-ascii?Q?uwGmF34TsjfogxDmvCEVHcr0gDn0YJKkQzBfYm3K1KYwhnG3RapD7Mi0Qnxs?=
 =?us-ascii?Q?lPQWBNx+uQ1qO1ARJa/KHic6h4aEBHnF3KXtW413Z7IPnvO38R9dJ7yXJs5H?=
 =?us-ascii?Q?j5log63xGsu11bdCcG+REOCtY2yTPJsV1VjbbrZCNbG5nKXYr7D+IVN/yGgE?=
 =?us-ascii?Q?ojk1WPiQAA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba07f7f-a4cb-479e-6683-08df18c2698e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 15:58:58.4592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrjQ1c5j0ojhOtN9po1Gn7KUPkBffoqg4nPpqJQ0sxbsq/IAflCXwoZcOVC4ZTAcHhh0t87JX5iS5rf2VyTPAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11360
X-purgate-ID: tlsNG-33051d/1790092740-75EFF4E9-6CF776A8/0/0
X-purgate-type: clean
X-purgate-size: 5341

The boot CPU pending table must use the memory attributes selected by
ITS quirks. gicv3_lpi_init_host_lpis() is therefore called after
gicv3_its_init(). However, gicv3_its_init() also programs and enables
each ITS before host LPI state is allocated. No ITS commands are
submitted at that point, but this ordering relies on that implementation
detail.

Split per-ITS initialization into preparation and activation phases.
First map and disable every ITS and collect its quirks. Then initialize
host LPI state. Only after that, allocate and program the ITS tables and
command queue, and enable each ITS.

The subsequent gicv3_cpu_init() sequence remains unchanged: it programs
the Redistributor LPI tables, enables LPIs, and then submits the first
MAPC and SYNC commands.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v3:
- New patch implementing the post-4.22 initialization order discussed
  during review of the ordering fix.

Link: https://patchew.org/Xen/341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola._5Fkvach@epam.com/
---
 xen/arch/arm/gic-v3-its.c             | 32 ++++++++++++++++++++++-----
 xen/arch/arm/gic-v3.c                 | 15 ++-----------
 xen/arch/arm/include/asm/gic_v3_its.h |  4 ++--
 3 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 325835b0ad..972825bf06 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -11,6 +11,7 @@
 #include <xen/lib.h>
 #include <xen/delay.h>
 #include <xen/iocap.h>
+#include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <xen/rbtree.h>
@@ -549,10 +550,9 @@ static int gicv3_disable_its(struct host_its *hw_its)
     return -ETIMEDOUT;
 }
 
-static int gicv3_its_init_single_its(struct host_its *hw_its)
+static int __init gicv3_its_prepare_single_its(struct host_its *hw_its)
 {
-    uint64_t reg;
-    int i, ret;
+    int ret;
 
     hw_its->its_base = ioremap_nocache(hw_its->addr, hw_its->size);
     if ( !hw_its->its_base )
@@ -564,6 +564,14 @@ static int gicv3_its_init_single_its(struct host_its *hw_its)
 
     gicv3_its_enable_quirks(hw_its);
 
+    return 0;
+}
+
+static int __init gicv3_its_init_single_its(struct host_its *hw_its)
+{
+    uint64_t reg;
+    int i, ret;
+
     reg = readq_relaxed(hw_its->its_base + GITS_TYPER);
     hw_its->devid_bits = GITS_TYPER_DEVICE_ID_BITS(reg);
     hw_its->evid_bits = GITS_TYPER_EVENT_ID_BITS(reg);
@@ -1189,7 +1197,7 @@ static void gicv3_its_acpi_init(void)
 
 #endif
 
-int gicv3_its_init(void)
+int __init gicv3_its_init(unsigned int host_lpi_bits)
 {
     struct host_its *hw_its;
     int ret;
@@ -1201,13 +1209,27 @@ int gicv3_its_init(void)
 
     list_for_each_entry(hw_its, &host_its_list, entry)
     {
-        ret = gicv3_its_init_single_its(hw_its);
+        ret = gicv3_its_prepare_single_its(hw_its);
         if ( ret )
             return ret;
     }
 
     gicv3_its_validate_quirks();
 
+    if ( list_empty(&host_its_list) )
+        return 0;
+
+    ret = gicv3_lpi_init_host_lpis(host_lpi_bits);
+    if ( ret )
+        return ret;
+
+    list_for_each_entry(hw_its, &host_its_list, entry)
+    {
+        ret = gicv3_its_init_single_its(hw_its);
+        if ( ret )
+            return ret;
+    }
+
     return 0;
 }
 
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index acdac22953..6bc3e313be 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1984,20 +1984,9 @@ static int __init gicv3_init(void)
 
     if ( gic_dist_supports_lpis() )
     {
-        res = gicv3_its_init();
+        res = gicv3_its_init(intid_bits);
         if ( res )
-            panic("GICv3: ITS: initialization failed: %d\n", res);
-
-        /*
-         * Host LPI allocation uses ITS-derived memory attributes, so defer it
-         * until after gicv3_its_init() has discovered ITS workarounds.
-         */
-        if ( gicv3_its_host_has_its() )
-        {
-            res = gicv3_lpi_init_host_lpis(intid_bits);
-            if ( res )
-                panic("GICv3: LPI initialization failed: %d\n", res);
-        }
+            panic("GICv3: ITS/LPI initialization failed: %d\n", res);
     }
 
     res = gicv3_cpu_init();
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index 02c083f210..e1322b94f8 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -156,7 +156,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
 
 /* Initialize the host structures for LPIs and the host ITSes. */
 int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
-int gicv3_its_init(void);
+int gicv3_its_init(unsigned int host_lpi_bits);
 
 /* Store the physical address and ID for each redistributor as read from DT. */
 void gicv3_set_redist_address(paddr_t address, unsigned int redist_id);
@@ -245,7 +245,7 @@ static inline int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
     return 0;
 }
 
-static inline int gicv3_its_init(void)
+static inline int gicv3_its_init(unsigned int host_lpi_bits)
 {
     return 0;
 }
-- 
2.53.0


