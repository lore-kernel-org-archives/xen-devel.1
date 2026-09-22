Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0490CC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:59:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429194.1652152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92tk-00061Y-Q0; Tue, 22 Sep 2026 15:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429194.1652152; Tue, 22 Sep 2026 15:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92tk-00061N-MH; Tue, 22 Sep 2026 15:59:12 +0000
Received: by outflank-mailman (input) for mailman id 1429194;
 Tue, 22 Sep 2026 15:59:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x92tj-0005sC-8K
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:59:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x92ti-00ATp7-LM
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:59:10 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab2a5ca-2eae-0a2a0a5409dd-0a2a4505d854-8
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:59:10 +0200
Received: from [52.101.66.99]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab2a5cc-4cb1-0a2a45050019-3465426338ac-4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:59:09 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AMBPR03MB11360.eurprd03.prod.outlook.com (2603:10a6:20b:767::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 15:59:08 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 15:59:08 +0000
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
 b=QCO8eJmFBqrnuuFRNl4anOlhNMdX8qGzWIxTH3kGbz8RQ4vcdSZ3fupGJjIuT/X0O6yRa0P+j+iPHiRFox+MV66ogLIQomCccGvR56399gYRblSItTbtfZQgBCpRdmTLmGE59NsUKWQj8PpyWcmxZPUIdvTv8yoYnfRKGuOhbig1xZZ9CogSlVlbyaM3eSLp7URlhAWdMBreTh3q0Rk4j6X/JVcgGkGgzME0I2fvUy4l44Fh169T5YdobejkF3YtIyuKz/M6ieqPCpy28rEOIoDt7wxLYShhltHoc/ndKacejQVh+7/rY1xkk8w1yXv9tRlsY1xLbuHB+nLIINHwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoX9Udd1u8jB2Mb3putecPwyzMLTMMQOizPOOYuBRec=;
 b=qhWikTMtKGbSe/IrxZkaupQ44MXG4bY01vcMDHk3cz4lqpEGdBTu4VeHQPOjmmlWat5rHNQpt6pLpxw+KN5IiiXhvzNLUE17rh2vI4R+mRcOsQWpCkPQCrEwWOxNx2NaxQTUztgKh7Zun/LZll0q+9lq9aQhvLtE4HUCMrK2dDczvHAfYGwA2bFyM6x6WEGYaqL9Pz5I/XR2htvFyK4fbgk9CRmEMWKGfc5PD4vYSP68L8E43leHdGMI4bDXyYU8QW4zSAKSGSeyDpWNsdGDCqGcgco+BInvwpJo8X8MyhvsvBFj+UGFR+K+x0EH0uyAHeskWqK0dFD0zVBa1DjiIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoX9Udd1u8jB2Mb3putecPwyzMLTMMQOizPOOYuBRec=;
 b=b5jTdGcDXxTnTApsJR8UHx5Fj2O1KK+4Yff9N4HAOE+jCEUURKtaZ21O1tuufvmyXDQBs5KSgK+iARboNrl9evloizYdbEfFT9/xtmSlpoxR27fhPN0XGKqNogCKPgNR5QPgljQ4onvjEWOlbl7HI5I6xNQRJOS8p4G8Nw69LFdz5Vi/A/ptjaO4LqlQROg+ol8LHgWocLD4x0iA20EG2N1szWoXKK2+zTGZh4gM5kc4U+2BBchlDS0rMruFhtUzcvXCH13IpvsyzUgcO6v2E2i7iMiFUIj78PVA/TWEitpNUTxQUrROlr5NLkB7QiSj7Oz+7p7qyiQv5u2agu/HmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 4/4] xen/arm: its: handle dma-noncoherent on GIC and ITS nodes
Date: Tue, 22 Sep 2026 18:58:42 +0300
Message-ID: <cefba96267535739ecb851e6080da51a3d745e3f.1790089161.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 34dd9ad9-5906-4d84-50f6-08df18c26ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	mQqySFEa5RdKUH9+5jY4d+sZWDbw+XCG3B0a9lH/5W4GK+zHzytRMcneAEZIFOy1yqzi5utu69FpINVK8Ksqpn717WSTsVIG1goyTHgtEuBpUlugTSISsjRHiQrrvDpIbQWqBer7ZEWEIMmnyZdkIT//lVKQAd3V/zerEHpBFffffeL5XSpH3ClLx0hrOb9hvzdD2bWNySGTfKiQl7PNFX7ANmQ8+R2v90pw0D4C7Xbgz683n0J9yDMGJiwOv/jdlKtLfDzOZWkaJ3PBE0hxKMaajedCrhVNRsNg0aRwPc0IvuBWM/jW0lqhgD7YCSKrRV8to9kJuSAe+YKozWCqLCmvonXiswSoH9IlCq5xrIZO7JPan2qlBB6owTvseewfLrd2jWoQEe80tbJUQnSA4y+L9cv6+8thBgRRJ/LbhtOxgaMa+385F2uhd6h4e0ooll9fr501jemj8IIMCOk2Ea4jLYC6PjkF6kOfJ2m8JEHyCeUIroy+BjuYvAPYwD/YZ+Rzo2StGLiPDlHBjCbKdrQXvX4P3Lkg11PjHT6/E+qZzc5fgQJTaVoIvLzIRJnJXV+8VgJqo1eewG3AbJHnIhcZUkns2V6diIAAvBdJdyKR9iQyJ2EHikxQSVHBVbbY0wEHBqFN2S/5HBWnP2KO3CGSJh6jaWg2tsXNmwQUZ6s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uQLmTHSuz9MfkxBNaXP9NXODFAt4d0+1P0Een8P25LMf6akzwlTyOsmkS5AF?=
 =?us-ascii?Q?CXvVcroTVPuV/T0hqdd03MOooG1uD+eKoLxS/DCtxaVCZVWeYu/oHrmWjYtu?=
 =?us-ascii?Q?6r2v+59aa8H6ZXHFGZniiAn5CfVrmr0CdzD0JrqzNlU2T40VnqsN+hMuY1ZC?=
 =?us-ascii?Q?0ZHmMfC6DQvnc2aBDgVbSh7rcYhN0fd/jFK3jfxKxTZ6sVxDvpgJpQ+KXQ2k?=
 =?us-ascii?Q?T3CdQc5R6eZYMfu6ij9YAhsYfq7CnOuf+EuhfG/kwaG2GtcFjrMNdxLTi5dt?=
 =?us-ascii?Q?MUacCJ1ImEQ3LAszlyrY8W86mWoMQoUe9FahqDu1I8AK7hXDN8tZLaQ1RXnY?=
 =?us-ascii?Q?yMo8e4mNL8gOd9HaC2rWIhqnSO3vW6Ukmo/Go3UhcdycpzMn9G0R7zactrwF?=
 =?us-ascii?Q?jMvfIXfrxylQT0d5CS/DJYElIh8pCeuuN7TV9pbG2dpgba8dB2cPpPfjhFRK?=
 =?us-ascii?Q?cCerj+Vis2HPs5DAHFwZMYzHjGvu5qOsVo5UrGiRWOobI023XMByWPCQ4WAv?=
 =?us-ascii?Q?+sCvtinvy9e5j6cKtY/Hm1wGmX/NsBVP6SFouTTKhZ3MSFxqpAKxu96uzhT/?=
 =?us-ascii?Q?uOZf9nd7gr/Wk/j4V1yFtQvuN98u4xLO/3BYzHCjbHJQrkDzAYyv95526uwP?=
 =?us-ascii?Q?iL3bnwmDGLtkq7sUSQEkrkJNdXqDu+GnGJQm7r98vzywQ93Fo3q9zBFEjKZz?=
 =?us-ascii?Q?trRoztHC2+lZeoPeJ7XvON+0a8MFqOSbBkw61kO8AWxleg7htz5hSC15QGf0?=
 =?us-ascii?Q?qCfZbx6mHsCLX0IP1+iph9eYUPcUZZv21rEaLZlfzTFlC49JZwBYPOnnBx0d?=
 =?us-ascii?Q?J0Oi5nB8hVtE9l0ln8yU5J4jfiQBq0Ge/kZoQf66dSbI6apSyLurFbrsDbHS?=
 =?us-ascii?Q?r8guLukQIC1OsvJyMERC8+DOfFkACa0mmWqMOzCzd5eBY6/NYBtKQSnWJVcF?=
 =?us-ascii?Q?e1NpIJTk5r+GG4ohpPGdCCdfDMNIOuC4wbDNLAS3ZqbZIyHte1jH9YMwa7Mm?=
 =?us-ascii?Q?T/ne0xZMiuMQH2LnTLvodSF7nRm7HUox0JyNzOfXI6N01kHSkxfIn3GqSKo8?=
 =?us-ascii?Q?o/0yt2qWS3gh/3yLRZb56cs5TRlpxBefQ1kRBabe6bJu9mLjtb3DoHBdjh2H?=
 =?us-ascii?Q?0zM6TApcDAoN+jZxYq0HPG91IiFY4cqXruaUw0FGrRjP/VgPUdm2lV8+h8pG?=
 =?us-ascii?Q?d6ABiJBfnYyJ1x1fliSpCTIFAWa/ezoieig4CUQRqgHwAQjaBS4EySPTV6Kt?=
 =?us-ascii?Q?M7ObcKn8ayDkPyuo25RwoMS84xsyiBmEemCMOzNaUN9m0IPw9F5CcK3ytyVd?=
 =?us-ascii?Q?jqt3qmwNAj6rY9h5vNiKyIWwKjgzc/AMN6D0JNBFuxHGmqWUkxwkL31aK4K9?=
 =?us-ascii?Q?Pb4pen0w69z0tqtzY2xD1vFdnFFH7DRUWRKy640RNfDzLm0ki/M4wWpDdKSN?=
 =?us-ascii?Q?irNeV1Sp9FXA8sNMNtMRNHt5TzK+FMzubA8VJ+l5pzvCj1frhBKNHI1VCEU5?=
 =?us-ascii?Q?GCfiy7b6PxYCBequ5wznUQUxmc57/IiBbUd/dl/pDs+6kNyr2Zpk44nUhSQ8?=
 =?us-ascii?Q?Y2Srw4ia2cDClSjTocqPSF+QIAN10EAzfgFyB8LOLTC6aguwFw1StJh02CWJ?=
 =?us-ascii?Q?7IcsujBFNzva1A+2oOX2DOlkNvzD1YABc64fORZONhGuQcAURmjWtWN+UKZU?=
 =?us-ascii?Q?5h2lh/8+t+eptkX7jHMvWNe8wAoXZBqTXoGlUU5QVOEh3fmA/POEtlzHaazs?=
 =?us-ascii?Q?R5PS1o+6Ng=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34dd9ad9-5906-4d84-50f6-08df18c26ebc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 15:59:07.1803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RL7AU8bXu9gBWWkR/da85bD5UJ1sg/bpQavsu9glaSy7eoGzmFCEUdHa4yyQe1fONTqJVdb9rzEaMUE3xaczXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11360
X-purgate-ID: tlsNG-c201ff/1790092749-F44A42A1-4F56D02A/0/0
X-purgate-type: clean
X-purgate-size: 4715

The DT dma-noncoherent property describes the bus coherency of the
device represented by the node. On an ITS subnode, that is memory
accessed by that ITS. Add GICV3_QUIRK_MEM_NC_NS to the corresponding
host_its and use it when programming GITS_CBASER and GITS_BASER<n>.

On the top-level GIC node, the property describes the Redistributor side
of the LPI path. Collect it in gicv3_lpi_init_host_lpis() and apply it
only to the host LPI policy used when allocating the property and
pending tables and when programming GICR_PROPBASER and GICR_PENDBASER.
Mark the function init-only because firmware attributes are collected
only during boot.

Do not inherit the property between parent and child nodes: ITS-node
non-coherency does not change the global host LPI policy, and GIC-node
non-coherency does not change per-ITS quirk_flags.

ACPI is unchanged; this patch only consumes the DT dma-noncoherent
property.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v3:
- Keep the ITS init annotations with the earlier initialization patch.
- Drop the redundant aggregate host-LPI-flags message.

Changes in v2:
- Split v1's dma-noncoherent handling into explicit ITS-node and GIC-node
  scopes.
- Apply an ITS subnode property only to the matching host_its
  quirk_flags.
- Collect the top-level GIC property from gic-v3-lpi.c before host LPI
  allocations use host_lpi_flags.
---
 xen/arch/arm/gic-v3-its.c | 17 +++++++++++++++++
 xen/arch/arm/gic-v3-lpi.c | 20 +++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index f52232ca40..6734f94e7c 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -139,6 +139,21 @@ static const struct its_quirk *__init gicv3_its_find_quirk(
     return NULL;
 }
 
+static void __init gicv3_its_collect_fw_attrs(struct host_its *hw_its)
+{
+    /*
+     * An ITS subnode property describes memory transactions made by that ITS.
+     * Do not inherit it into the global host LPI/Redistributor policy.
+     */
+    if ( !hw_its->dt_node ||
+         !dt_property_read_bool(hw_its->dt_node, "dma-noncoherent") )
+        return;
+
+    hw_its->quirk_flags |= GICV3_QUIRK_MEM_NC_NS;
+    printk("GICv3: ITS @%#"PRIpaddr" marked dma-noncoherent\n",
+           hw_its->addr);
+}
+
 static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
 {
     const struct its_quirk *quirk = gicv3_its_find_quirk(hw_its);
@@ -149,6 +164,8 @@ static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
         gicv3_lpi_update_host_flags(quirk->lpi_flags);
         printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
     }
+
+    gicv3_its_collect_fw_attrs(hw_its);
 }
 
 uint64_t gicv3_mem_get_cacheability(uint32_t flags)
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index accfd48a74..1cf49430ea 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -7,7 +7,9 @@
  * Copyright (C) 2016,2017 - ARM Ltd
  */
 
+#include <xen/acpi.h>
 #include <xen/cpu.h>
+#include <xen/device_tree.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
@@ -102,6 +104,20 @@ void __init gicv3_lpi_update_host_flags(uint32_t flags)
     host_lpi_flags |= flags;
 }
 
+static void __init gicv3_lpi_collect_fw_attrs(void)
+{
+    /*
+     * A top-level GIC node property describes the Redistributor side of the
+     * LPI path. Do not inherit it into per-ITS policy.
+     */
+    if ( !acpi_disabled ||
+         !dt_property_read_bool(dt_interrupt_controller, "dma-noncoherent") )
+        return;
+
+    gicv3_lpi_update_host_flags(GICV3_QUIRK_MEM_NC_NS);
+    printk("GICv3: Redistributors marked dma-noncoherent\n");
+}
+
 static union host_lpi *gic_get_host_lpi(uint32_t plpi)
 {
     union host_lpi *block;
@@ -443,7 +459,7 @@ integer_param("max_lpi_bits", max_lpi_bits);
  * to the page with the actual "union host_lpi" entries. Our LPI limit
  * avoids excessive memory usage.
  */
-int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
+int __init gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
 {
     unsigned int nr_lpi_ptrs;
     int rc;
@@ -451,6 +467,8 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
     /* We rely on the data structure being atomically accessible. */
     BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
 
+    gicv3_lpi_collect_fw_attrs();
+
     /*
      * An implementation needs to support at least 14 bits of LPI IDs.
      * Tell the user about it, the actual number is reported below.
-- 
2.53.0


