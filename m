Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676F0C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400681.1636297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9f-0006M5-D6; Thu, 27 Aug 2026 14:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400681.1636297; Thu, 27 Aug 2026 14:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9f-0006Lo-6q; Thu, 27 Aug 2026 14:32:35 +0000
Received: by outflank-mailman (input) for mailman id 1400681;
 Thu, 27 Aug 2026 14:32:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9d-000655-BK
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9c-000Qzn-Nv
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:32 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a71-e002-0a2a0a5209dd-0a2a45078350-46
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:32 +0200
Received: from [52.101.84.104]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a80-b4ea-0a2a45070019-346554687891-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:32 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6742.eurprd03.prod.outlook.com (2603:10a6:20b:295::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:31 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:31 +0000
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
 b=XgR+T40kyNu2uPG/6CD/7cerSnrv9mwZ36ATtthtamrMq9DTAmiomCv21YwMbR4B+hLBbbkJAU4TfhXiNYQ+hWgV4qCWONqAvQJMh1yz/1DHqozze71qa8r43pvldGRA8G26sMjjfMMT7dV37/0FDnJSJRCcLeLvCt38xeAs/YiRR5o3y6lpuwaRxQ+wYqAF+jo0K1XjtLxaB1sxpND0rcyXkjdKk3qryx6uEnJVvpr0UuYGgJeWVwlFdFnBBZbQg0EomHiXb3O7Oe9cOl+ETkktpkln1ANPVV8y0BDIpgI7jLiPUPihTv6C2dkTOQZ4YHiibL9siYSk3iReXmDgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQ4kNGerzyiusut8IWEJPjH9AN7FUvIvVDuMBpOnlU4=;
 b=tFAXYNcJS1R4/eYNwMrx4WRBAdTGjT04f6va93hg3ieggVlmCZfY2uqRlAZ9woqbwGeRn4PDXyTnwi/CuZNeW4v48KWIWv7uPRdu8r/q5AuKT+V+PRTybn5sBTo6Pdn0/8a5VBl/Gw8x9c8QCBQx7VzPsj32RN2Ac4Aa/lwQGTlwCSTkN2zio580epB7IPS40MvZ/1+fLr5u5tPlTrx+ni/wFGndPYR5xEKmila0k1ZrCxXkumZPwhEHrX1NZU3ggHlKtrNTJaAkj9QQ4zTXeGMG2hiLh9AhWglkg+5vYY9yiSA72fbF/NkxiLZx0Suyf03RGcLLLy3/jw1eOruJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQ4kNGerzyiusut8IWEJPjH9AN7FUvIvVDuMBpOnlU4=;
 b=c5awiz07rnJlCPmkeNHcYyWnRIzqlXbkxzVDT0Iw+HUgpj1T6t0eIJrgy7zS39VSEnsGQrQpfy6JPJ/kCiLuUYQv5gfgBQFizH3x/eNhyqoCdkl5uS/2pgdVKQxSLzkHhHcTp1kFR8hH4cPs0cNgU5c4jtzyiB0l3PZNqluPDiU+cvPL3i8Xf8AuGXXmJtJV4OlzOeXGYIU1IY0mx0t4uc3jw6jZTXPw3fCN3yyGx0E2dsXPfFmqbnkRal9QqZ5FXnKnwiJgILRQXldu4ncALCDiqdnvuXKJhR6oCLmHXkvD7fIB2iD+mLHPo8PsgNYeG6Dp6SYkxBkWCIe+UL9Ewg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v12 08/13] iommu/ipmmu-vmsa: Implement suspend/resume callbacks
Date: Thu, 27 Aug 2026 17:31:56 +0300
Message-ID: <1f036e7ad5ad6efba635ca029b0fab133300603a.1787838455.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787838455.git.mykola_kvach@epam.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b8b2f8-a490-431e-f4ee-08df044806d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|22082099003|18002099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	b/b0Fk8pmKp8Y7yVdlOMNtSPjvEVn/SzMLBQg44KSoPnI6VUyHqvZgRbKt6ENKexfT5W/ST/qJDxyLN8IFeuSumdf+3NbZYMosprWnsre4kSQYgjQLEtDVaVd6sl/DWQQIqFHN5CujCjBNQ/wB5hTNkeeeIEu0Vgx4fzB9ZHTEtuhbbqeKLc75VJhEqo/N7xpRNMCKSOJFPq1mzBsHJm7Je9U8yn/cDN2AM9xlmlMoBhy1/QC+6nhKuWpKbeiJq71OSdUIVmhqmT0c1wRBHLVIAir3W34lNKTcIWlxP6HT3NFe87VrL5D+mFdxrsEgAuhRnRr01T+aQPzyLh/A8VqxUz0urlEqIo0WwSDjDqoMtcNkM66BzZOqoC6HajR+cGQt94M7vO+JhJXtLGJbWIzMVakLt2iPLt7/kPgeWBEzRs0dabBmrn8tydpxdu73ZRibFl/BYxaEC1DVlV4vLUhT6QgRQ2/SooqveMaiRvxcylxq+A6iL8OklNPwOrCx89PQHnnZdM/WY5FQ8VsX6yUW3hyJ2dCxmqLZlSSWmtL2lfr83L7JSa+dB5fHeh1E5/0I6UDPpRWkkg3ulR96vhbuz1uMWoMBHi7pLiPunmPRIudp2/hHw+cdsfV08YQVcuuFp5zX117Ruhy/voRA9YDnDmXAO+onHfQdlGgG/5yek=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1w6LC8jBmY3mv6QeFrbOfkt+ZUvekdW8ATObaGxUBb9nGggljULSFHZhpHfY?=
 =?us-ascii?Q?yoS+jgIwJlSCNabWIpNV61XjOpCJr1ueeWnPEdi7c61AhX+N+g5CLfd2EgCV?=
 =?us-ascii?Q?eHPcCDv1aIs+CgtN8jk+8F07+wvPOzdNv80IA1U82JjTJbJK23qZnL7+YjaA?=
 =?us-ascii?Q?SBcItMWcKxNJkqSLqRo4+HXI3NfqrehTVNpGDp3Pic62L90nbSQ2nj7Hh/ab?=
 =?us-ascii?Q?LxNF3zM9DJvBm3yYavr5/2K4hSGw+lg+pvkFa5/5ojZ+JLyyXDdlamf2fiTb?=
 =?us-ascii?Q?35WgOJyBATcpmFbrvhIpKK1Vv4EULp3CL7OkZ53+taXPVWQGiCDAbQIsZaCM?=
 =?us-ascii?Q?lXNjVy+amuWzxE3cyASzEvPdhAmUiCOm+R+w0uItErykFkx2qZhhfA3AY4yf?=
 =?us-ascii?Q?qBXuFRf0S1iEoXZS6HQA8RHOOalLHrMbhLrdfY7K+pG1aNcPSjTYf9bN4MSG?=
 =?us-ascii?Q?zdrVRRUq94asgYPMQ+9Wb5xspZF1naPhd64Mx6m2A+4nqShVGFwdRMsduNFD?=
 =?us-ascii?Q?wPVAWRTiiLqPSPSMvHqax1+ysFf5J0d1QJTJ2uXUzRpemKSnmgfyEAkRWfy8?=
 =?us-ascii?Q?9s39I9jU8kd/FvBDj7GfpgQXp/rJ77oY8R/B+HHEnaSnL6IGOwlUPjfE2vyn?=
 =?us-ascii?Q?A5lHR5qEjC0vcoFn9gYLOaCvWFN7zQLS86KFFtRyWm1m1LH63dU1CkyEwDxS?=
 =?us-ascii?Q?ois7NvHSctLl4SBvqXQ6Hu4SUC/stejrd2kMKTNcuaCqoAC9lYlsYvXhWYIk?=
 =?us-ascii?Q?3Ttc0K5TZZGRt6thfeSXCwu/lj1OwxUe/tU6kC3Al5GYDEjw6cDRsEqYDOVe?=
 =?us-ascii?Q?Xia0FXDBFMaixhgp4twW2ZTdATQ/yj3bbSxi0wfQU+FNhWuzBMYajpiAWnqi?=
 =?us-ascii?Q?89w7XsBXVB/HrtOZgHDzZIl5Knzj4f1ozcUoCWXzgNU56A+IfuYB65aJJirH?=
 =?us-ascii?Q?IVpdSGMzt1CcywzbO8F1DPQRpq8xCG8jG9O0LGfnMfcIx3I9dKLuHy6YEDIh?=
 =?us-ascii?Q?uvyniSZfOunoUSmTM/X2bUZIiZSwrUtgKwAn8dmnUo1S7XnVL5EW70mZVO0B?=
 =?us-ascii?Q?QG5YSoukRbdq7kKaVyoFh9AZXTrXhBnSRfeDvScjVcVgTQyKKAOJaDwRMkyd?=
 =?us-ascii?Q?PBJmqJvvRnjFQpcY+NoyLuTEdasmkUaNApJily+NhIxvZncsMy8fQc4SdXbf?=
 =?us-ascii?Q?oUV9iB6OPIju71/L9pp3/9soeU0AvLfznAxJN/BqNpc8SmN8eUIU+hKx7NIc?=
 =?us-ascii?Q?ScR50YTwHlrxbm/di5idcXSMw/NzgbydV3iYX3MTGa8Nenrq+/gWfqchgPtm?=
 =?us-ascii?Q?YEj6irJRrQEEdzdbtyI/boCUTrm8D4eofaavIzH9pjFHdVdHWzvMM1UfZv2q?=
 =?us-ascii?Q?wKuJXWHLOciZQhLCNoG7J/7EtzkKiaxzkgowrRKhdKb7F66EaGjLbtNt8P6C?=
 =?us-ascii?Q?wSEc27AtV9ZI+N5NCNksn2D/2+10hgwgN/twQg8BAIX997SRl1KoM6VgCsBu?=
 =?us-ascii?Q?6crffB0LnbWPPxfZoLF/59TVg1GM7be0o7q1i5SWI/I6WNDqCTtGjEQQvnNW?=
 =?us-ascii?Q?1pLKBG/Q7msG8MD9+/uUYChKqDEYsn3nf1LdtYXy3OM4K1lzR0yEtKKmBvQp?=
 =?us-ascii?Q?k/qVXk5Or1T6WfXbJUjzObV81ITgDkIaWmOu+/t9BKDynhv8ZFcrlplu5Ayi?=
 =?us-ascii?Q?mzZl1vVkSbhkj6J9alrm0P3D1pC5AMJ+BTDN3HJqYMVWreFebS223Ecmal9Y?=
 =?us-ascii?Q?ZAnpLy/5HQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b8b2f8-a490-431e-f4ee-08df044806d4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:30.9850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vuYLpc5vxwCGdmzgFgjT5NgKF0WrkjXmYftpDMzyX9qBFYc33x3YY/NQ/TwOJOVk42w0tzQtBHweIQcukYrmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6742
X-purgate-ID: tlsNG-ef75cf/1787841152-A58C1AE4-2B60E912/0/0
X-purgate-type: clean
X-purgate-size: 14456

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Store and restore active context and micro-TLB registers.

On resume, restore Root IPMMU context state before restoring Cache IPMMU
micro-TLB state. Cache IPMMUs select Root contexts through their micro-TLB
configuration, so restoring Cache micro-TLBs before the Root context
registers are restored can expose stale or uninitialized context state.

Tested on R-Car H3 Starter Kit.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V10:
- Iterate over registered IPMMUs in reverse order during resume so Root IPMMU
  context state is restored before Cache IPMMU micro-TLB state.

Changes in V9:
- set dt_device_set_protected() only after ipmmu_alloc_ctx_suspend()
  succeeds, so DT devices do not remain protected on allocation failure.

Changes in V7:
- moved suspend context allocation before pci stuff
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 323 +++++++++++++++++++++--
 1 file changed, 308 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index fa9ab9cb13..2e54fa63d6 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -71,6 +71,8 @@
 })
 #endif
 
+#define dev_dbg(dev, fmt, ...)    \
+    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
 #define dev_info(dev, fmt, ...)    \
     dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
 #define dev_warn(dev, fmt, ...)    \
@@ -130,6 +132,24 @@ struct ipmmu_features {
     unsigned int imuctr_ttsel_mask;
 };
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+struct ipmmu_reg_ctx {
+    unsigned int imttlbr0;
+    unsigned int imttubr0;
+    unsigned int imttbcr;
+    unsigned int imctr;
+};
+
+struct ipmmu_vmsa_backup {
+    struct device *dev;
+    unsigned int *utlbs_val;
+    unsigned int *asids_val;
+    struct list_head list;
+};
+
+#endif
+
 /* Root/Cache IPMMU device's information */
 struct ipmmu_vmsa_device {
     struct device *dev;
@@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
     struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
     unsigned int utlb_refcount[IPMMU_UTLB_MAX];
     const struct ipmmu_features *features;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
+#endif
 };
 
 /*
@@ -547,6 +570,249 @@ static void ipmmu_domain_free_context(struct ipmmu_vmsa_device *mmu,
     spin_unlock_irqrestore(&mmu->lock, flags);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
+static LIST_HEAD(ipmmu_devices_backup);
+
+static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
+
+static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
+                                   unsigned int utlb)
+{
+    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
+}
+
+static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
+{
+    struct ipmmu_vmsa_backup *backup_data;
+
+    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
+
+    spin_lock(&ipmmu_devices_backup_lock);
+
+    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
+    {
+        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
+        unsigned int i;
+
+        if ( to_ipmmu(backup_data->dev) != mmu )
+            continue;
+
+        for ( i = 0; i < fwspec->num_ids; i++ )
+        {
+            unsigned int utlb = fwspec->ids[i];
+
+            backup_data->asids_val[i] = ipmmu_imuasid_read(mmu, utlb);
+            backup_data->utlbs_val[i] = ipmmu_imuctr_read(mmu, utlb);
+        }
+    }
+
+    spin_unlock(&ipmmu_devices_backup_lock);
+}
+
+static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
+{
+    struct ipmmu_vmsa_backup *backup_data;
+
+    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
+
+    spin_lock(&ipmmu_devices_backup_lock);
+
+    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
+    {
+        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
+        unsigned int i;
+
+        if ( to_ipmmu(backup_data->dev) != mmu )
+            continue;
+
+        for ( i = 0; i < fwspec->num_ids; i++ )
+        {
+            unsigned int utlb = fwspec->ids[i];
+
+            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
+            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
+        }
+    }
+
+    spin_unlock(&ipmmu_devices_backup_lock);
+}
+
+static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain)
+{
+    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
+    struct ipmmu_reg_ctx *regs = mmu->reg_backup[domain->context_id];
+
+    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->context_id);
+
+    regs->imttlbr0 = ipmmu_ctx_read_root(domain, IMTTLBR0);
+    regs->imttubr0 = ipmmu_ctx_read_root(domain, IMTTUBR0);
+    regs->imttbcr  = ipmmu_ctx_read_root(domain, IMTTBCR);
+    regs->imctr    = ipmmu_ctx_read_root(domain, IMCTR);
+}
+
+static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domain)
+{
+    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
+    struct ipmmu_reg_ctx *regs = mmu->reg_backup[domain->context_id];
+
+    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->context_id);
+
+    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
+    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
+    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
+    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
+}
+
+/*
+ * Xen: Unlike Linux implementation, Xen uses a single driver instance
+ * for handling all IPMMUs. There is no framework for ipmmu_suspend/resume
+ * callbacks to be invoked for each IPMMU device. So, we need to iterate
+ * through all registered IPMMUs performing required actions.
+ *
+ * Also take care of restoring special settings, such as translation
+ * table format, etc.
+ */
+static int __must_check ipmmu_suspend(void)
+{
+    struct ipmmu_vmsa_device *mmu;
+
+    if ( !iommu_enabled )
+        return 0;
+
+    printk(XENLOG_DEBUG "ipmmu: Suspending...\n");
+
+    spin_lock(&ipmmu_devices_lock);
+
+    list_for_each_entry( mmu, &ipmmu_devices, list )
+    {
+        if ( ipmmu_is_root(mmu) )
+        {
+            unsigned int i;
+
+            for ( i = 0; i < mmu->num_ctx; i++ )
+            {
+                if ( !mmu->domains[i] )
+                    continue;
+                ipmmu_domain_backup_context(mmu->domains[i]);
+            }
+        }
+        else
+            ipmmu_utlbs_backup(mmu);
+    }
+
+    spin_unlock(&ipmmu_devices_lock);
+
+    return 0;
+}
+
+static void ipmmu_resume(void)
+{
+    struct ipmmu_vmsa_device *mmu;
+
+    if ( !iommu_enabled )
+        return;
+
+    printk(XENLOG_DEBUG "ipmmu: Resuming...\n");
+
+    spin_lock(&ipmmu_devices_lock);
+
+    /*
+     * IPMMUs are registered with list_add(), with Root IPMMU probed first.
+     * Walk backwards to restore Root contexts before Cache micro-TLBs.
+     */
+    list_for_each_entry_reverse( mmu, &ipmmu_devices, list )
+    {
+        uint32_t reg;
+
+        /* Do not use security group function */
+        reg = IMSCTLR + mmu->features->control_offset_base;
+        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP);
+
+        if ( ipmmu_is_root(mmu) )
+        {
+            unsigned int i;
+
+            /* Use stage 2 translation table format */
+            reg = IMSAUXCTLR + mmu->features->control_offset_base;
+            ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PTE);
+
+            for ( i = 0; i < mmu->num_ctx; i++ )
+            {
+                if ( !mmu->domains[i] )
+                    continue;
+                ipmmu_domain_restore_context(mmu->domains[i]);
+            }
+        }
+        else
+            ipmmu_utlbs_restore(mmu);
+    }
+
+    spin_unlock(&ipmmu_devices_lock);
+}
+
+static int ipmmu_alloc_ctx_suspend(struct device *dev)
+{
+    struct ipmmu_vmsa_backup *backup_data;
+    unsigned int *utlbs_val, *asids_val;
+    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
+    utlbs_val = xzalloc_array(unsigned int, fwspec->num_ids);
+    if ( !utlbs_val )
+        return -ENOMEM;
+
+    asids_val = xzalloc_array(unsigned int, fwspec->num_ids);
+    if ( !asids_val )
+    {
+        xfree(utlbs_val);
+        return -ENOMEM;
+    }
+
+    backup_data = xzalloc(struct ipmmu_vmsa_backup);
+    if ( !backup_data )
+    {
+        xfree(utlbs_val);
+        xfree(asids_val);
+        return -ENOMEM;
+    }
+
+    backup_data->dev = dev;
+    backup_data->utlbs_val = utlbs_val;
+    backup_data->asids_val = asids_val;
+
+    spin_lock(&ipmmu_devices_backup_lock);
+    list_add(&backup_data->list, &ipmmu_devices_backup);
+    spin_unlock(&ipmmu_devices_backup_lock);
+
+    return 0;
+}
+
+#ifdef CONFIG_HAS_PCI
+static void ipmmu_free_ctx_suspend(struct device *dev)
+{
+    struct ipmmu_vmsa_backup *backup_data, *tmp;
+
+    spin_lock(&ipmmu_devices_backup_lock);
+
+    list_for_each_entry_safe( backup_data, tmp, &ipmmu_devices_backup, list )
+    {
+        if ( backup_data->dev == dev )
+        {
+            list_del(&backup_data->list);
+            xfree(backup_data->utlbs_val);
+            xfree(backup_data->asids_val);
+            xfree(backup_data);
+            break;
+        }
+    }
+
+    spin_unlock(&ipmmu_devices_backup_lock);
+}
+#endif /* CONFIG_HAS_PCI */
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
 {
     uint64_t ttbr;
@@ -559,6 +825,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
         return ret;
 
     domain->context_id = ret;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    domain->mmu->root->reg_backup[ret] = &root_pgtable[ret];
+#endif
 
     /*
      * TTBR0
@@ -615,6 +884,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu_vmsa_domain *domain)
     ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
     ipmmu_tlb_sync(domain);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    domain->mmu->root->reg_backup[domain->context_id] = NULL;
+#endif
     ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
 }
 
@@ -1338,10 +1610,11 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
     struct iommu_fwspec *fwspec;
 
 #ifdef CONFIG_HAS_PCI
+    int ret;
+
     if ( dev_is_pci(dev) )
     {
         struct pci_dev *pdev = dev_to_pci(dev);
-        int ret;
 
         if ( devfn != pdev->devfn )
             return 0;
@@ -1358,17 +1631,24 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
     if ( !to_ipmmu(dev) )
         return -ENODEV;
 
-    if ( !dev_is_pci(dev) )
+    if ( !dev_is_pci(dev) && dt_device_is_protected(dev_to_dt(dev)) )
     {
-        if ( dt_device_is_protected(dev_to_dt(dev)) )
-        {
-            dev_err(dev, "Already added to IPMMU\n");
-            return -EEXIST;
-        }
+        dev_err(dev, "Already added to IPMMU\n");
+        return -EEXIST;
+    }
 
-        /* Let Xen know that the master device is protected by an IOMMU. */
-        dt_device_set_protected(dev_to_dt(dev));
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( ipmmu_alloc_ctx_suspend(dev) )
+    {
+        dev_err(dev, "Failed to allocate context for suspend\n");
+        return -ENOMEM;
     }
+#endif
+
+    /* Let Xen know that the master device is protected by an IOMMU. */
+    if ( !dev_is_pci(dev) )
+        dt_device_set_protected(dev_to_dt(dev));
+
 #ifdef CONFIG_HAS_PCI
     if ( dev_is_pci(dev) )
     {
@@ -1377,26 +1657,28 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         struct pci_host_bridge *bridge;
         struct iommu_fwspec *fwspec_bridge;
         unsigned int utlb_osid0 = 0;
-        int ret;
 
         bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
         if ( !bridge )
         {
             dev_err(dev, "Failed to find host bridge\n");
-            return -ENODEV;
+            ret = -ENODEV;
+            goto free_suspend_ctx;
         }
 
         fwspec_bridge = dev_iommu_fwspec_get(dt_to_dev(bridge->dt_node));
         if ( fwspec_bridge->num_ids < 1 )
         {
             dev_err(dev, "Failed to find host bridge uTLB\n");
-            return -ENXIO;
+            ret = -ENXIO;
+            goto free_suspend_ctx;
         }
 
         if ( fwspec->num_ids < 1 )
         {
             dev_err(dev, "Failed to find uTLB");
-            return -ENXIO;
+            ret = -ENXIO;
+            goto free_suspend_ctx;
         }
 
         rcar4_pcie_osid_regs_init(bridge);
@@ -1405,7 +1687,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         if ( ret < 0 )
         {
             dev_err(dev, "No unused OSID regs\n");
-            return ret;
+            goto free_suspend_ctx;
         }
         reg_id = ret;
 
@@ -1420,7 +1702,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         {
             rcar4_pcie_osid_bdf_clear(bridge, reg_id);
             rcar4_pcie_osid_reg_free(bridge, reg_id);
-            return ret;
+            goto free_suspend_ctx;
         }
     }
 #endif
@@ -1429,6 +1711,13 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
              dev_name(fwspec->iommu_dev), fwspec->num_ids);
 
     return 0;
+#ifdef CONFIG_HAS_PCI
+ free_suspend_ctx:
+#ifdef CONFIG_SYSTEM_SUSPEND
+    ipmmu_free_ctx_suspend(dev);
+#endif
+    return ret;
+#endif
 }
 
 static int ipmmu_iommu_domain_init(struct domain *d)
@@ -1490,6 +1779,10 @@ static const struct iommu_ops ipmmu_iommu_ops =
     .unmap_page      = arm_iommu_unmap_page,
     .dt_xlate        = ipmmu_dt_xlate,
     .add_device      = ipmmu_add_device,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend         = ipmmu_suspend,
+    .resume          = ipmmu_resume,
+#endif
 };
 
 static __init int ipmmu_init(struct dt_device_node *node, const void *data)
-- 
2.43.0


