Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAFDCA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 19:02:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436704.1655415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBd66-00029N-9N; Tue, 29 Sep 2026 19:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436704.1655415; Tue, 29 Sep 2026 19:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBd66-000296-2k; Tue, 29 Sep 2026 19:02:38 +0000
Received: by outflank-mailman (input) for mailman id 1436704;
 Tue, 29 Sep 2026 19:02:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xBd65-00020Z-DE
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 19:02:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBd64-002hjN-QY
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 21:02:36 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abc0b3e-e002-0a2a0a5209dd-0a2a45018dc2-46
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 21:02:36 +0200
Received: from [40.107.159.78]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abc0b4c-5984-0a2a45010019-286b9f4eeb70-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 21:02:36 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by AM9PR03MB8053.eurprd03.prod.outlook.com
 (2603:10a6:20b:3df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 19:02:34 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 19:02:34 +0000
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
 b=g/NPc51eRWaSb5qQXPNMRlQEDu7Lj+ue5Qe0hPjdvukAttViXtPVDXSdBmnycpOmNWYhBhVu7B0EBXJ9YenR9jmEVhjWlOZ37W1LAxq3Ld62FLdoaDCXIuPiG6nqbk0p2KzKiKdIWTn6JoGSmLIwWcEznzF8MjibZvny4q9SY2fzs6zDTiIMigYCqPJyBclZBCrKTV4Ut4vRIVPrigyI85sMSIGRYbboDrLgqMmpXTGHOlmcU9KQPh4cxGNrpCFn73QiCbJRgVIDoFmqXh/DxtP0l97QzrK+ty1wFdngFeakZB3vVUbOZsoRrNu7HpvX0KUMNWn1Me9HE+npdaCa0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwvtV8OvyUyBXitibYL6YMGUohC/7mqNEc2oAD0Ppwc=;
 b=v+uJg9gotWbbQ3lB2GIxucF9YZxsrepBBFYePxMX58a40Nhf2xOVQKtpDRBBspqWsyWgwoi3TDZ/Vvn1ERdChJXSJVvI98kTaf0TRbjpydPmRZpHiSIwYvWYk/07VDEpqB+cMTicY0TjtRnD/VQPKqTmuZu4cAdFFV0J0kZol/DQeGjQ/Og4+UyTq3L69RkGSOhzzhXaNSk4mbTZ5w9JGZKzDqF1ql67ulmjl69goO/q99/qHP8BtolVaHNq6XLzvfZKaCpkVm1LX9Om+RL420V27XSYqvzEU+VFE+APDHLmd3x2s78WG3+cIwsSamOhAhxVOEA4iTt2v5YUc2gBTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwvtV8OvyUyBXitibYL6YMGUohC/7mqNEc2oAD0Ppwc=;
 b=iL+2Bvv5nKSYXvUxUh/HETw6KpQj5j3OSoY/IyTAphJcShh7hzYMjGAaIIYeuBDQOTIdCEOU6+M1PmdDbGdi2QUV6lwN1cAPyTmgZB9ojs7ySRNZDe3yKEJj/OkskWqmR2Az7ivk+GGf7ihvijOETaZD+tpYuWBPFEh5oGuKkRYRqsf7+rZnfIHONTkEUhHOwcxJBAUCc0Y6j8/RLDw7YWpDkjAxsRoO8cwSi2Bq3D1TaPZMzgydIwBOmgZIrP/aIQmqWYH92N1rNADolGPPEcu0qOF5C8cWmMFXzHhxOPjlG326cL3xJxYCyWLEwkKyxXZS8eb9OM+pOLeW51LRjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 4/4] xen/arm: its: handle dma-noncoherent on GIC and ITS nodes
Date: Tue, 29 Sep 2026 22:02:13 +0300
Message-ID: <fb0674bdf222312b6ed04f3b6ab1a0cf58f05718.1790707009.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790707009.git.mykola_kvach@epam.com>
References: <cover.1790707009.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIVP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::11) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|AM9PR03MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e313d27-d8dd-4036-adc9-08df1e5c38c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	18uZAeIuSFukLK2p5m1BFtRrgvi849tEFwfLcHDTlyOGGkIv3HxjsmOxbOdwdySAleddjp8PRhn6e+NyZQ7ENa5vXP1gjgCO/mVgypNv+GZSJnJ+QtyReYb3gf/qkTLCgkhatMh9DiaE/FJnP2UVHkqm1iD0o6KSvk4lrA/ABSibGurv7qYHujJx5sSwsM1zE0lHAPr/9hV7PaoW0cGQVNkTE6Uov+fGih7Ru7PPh6aramWJNbPlZRWj9oLw33Ddr0c718V3IZEA9s4cB78cGIWdWldQczfILk5xUgkTrxXNYPWj8iBKUzWgtvB2p3TplYa4dbpAGdIvpzF3sJzBrCWBlO+dbIE/gFObDHxbIGDuphfNjXjT0bS/Mglm9WRZXBoIU8/VVZaYUdPPh6VUNf9/A8eWS0BCaAXnU0ESngJPp0GFnl5QPpEZlRUrmc2hxeZb7QSEO5YsnaYizcZuLQVIeWUhGnOzH1lHa1kCpD9d9wgwKXaw1MopaekuE8lhLLdjGK15JTOv33Sc6RumHuFEPTmebOT1KnUKnNT43TK/gnQLcXlM66wsPAwkp21g9iPaCf4wKGykbEbkNxefPb3SwptrNTfMIuISuKUFo/sjeK4L7B+Ua5beXYwpWUM74VMSozhNz8DgmRZmA11KHjUP3xqdcag9C7zx7S+HhPM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dwt1yWRlwWdVCdTLCUE4LcWQ+03kCZm6C1fVNhxsRZjWmB1/BOPonPz21d3Q?=
 =?us-ascii?Q?jUpGTpw/aaQr4+stIECLrxFqYN1Sxl5bQjI38IRHddzCHdEapzArYs8XtZCX?=
 =?us-ascii?Q?c0b4+MzTdynsvdRP67+rtJSOcZOccZ5EkJDueHN0jIEg5PyPDfkyUT+9a92u?=
 =?us-ascii?Q?mfKi5xK7V8eG5d5iUXKZcV9nnl2NBcsKgq6cA7B0wWjjFNe/HMrt3UI1UNs8?=
 =?us-ascii?Q?P7HKTWSsGe1Z8DO3kDP6TeAq8jq6BQy0ecxJ6L/SqZILZ6RSU6ooLOJgh8Uw?=
 =?us-ascii?Q?U7lQb354/JqUjbXArhzYO39BoqwLUKFOe+pBLlCzxP5X0ZfRa0jmKOC6sVka?=
 =?us-ascii?Q?dRebyykO92mRCef48Bs9nqIuo7jnMpWcEp8wEi/i8Lmk1g9TwguBAmD0nrzX?=
 =?us-ascii?Q?UrKp/XkdkqTBYTmS/fZQvCsApha3hiM9hsAS8M1KLRMsr6UrMBdVxtw52AzC?=
 =?us-ascii?Q?dSQRbcIouFC/J37pfI6IdAUnZjQ7v/nWQ3D9RKDKzoIEIEcrocWFtAoi/2rS?=
 =?us-ascii?Q?wG6ssvykpXjuXJvmKVMQDS9vKVqxy91aw5OT3MEzSUv4EHhlWUGcVCjOuh2I?=
 =?us-ascii?Q?wfYfMvZm7mevM+bBd8hTRylx+DlfOrdSuw9g5q97myMTgnQ7hkh5MG+ItNXU?=
 =?us-ascii?Q?m+q9rPsGtbxcyAV3qAM5ez0kAUQm8YtFMDWNBOq1NBnQD93SPkq2616lL7YL?=
 =?us-ascii?Q?1vghdq8qLskpTovv3Q32HV+EZyRUy/lww0Crr8jfu6OgXc+4EbwjU5aBXdaH?=
 =?us-ascii?Q?HXXYUMUFDXvaPvdY9IYumVtXBJxlrDdNPYZjOKzpkunR9srlNUrs6kuvYB5U?=
 =?us-ascii?Q?7Zkgt4Opq1xsQ2tO3LVQ9294IJ0Dj2etHVEqcIih1XzuT679FJ7cmptx8qpp?=
 =?us-ascii?Q?FOu7n0NGhzhDdDMuzKJcF/gXQP/XkOY9d5uFZUbBbs2qwI+Q9LujU8on4+7j?=
 =?us-ascii?Q?VJkEuBJGqCoOfwK0fFDthfqZVp2q37QviKxbcb7yrg69YzPOTO275T6lccem?=
 =?us-ascii?Q?0PiPzRsQ/Im5C2lTfdmu6s5ufH1JPXTysT7SG9uYOqE0r6Gv1xxxpqYRRiXT?=
 =?us-ascii?Q?OnHuPNcYY2qkfFQ0jh8Ksfko4QAM1X3nHXc7E6ubTmJ0Q9KzIknJTuXWbJEx?=
 =?us-ascii?Q?uLVK4B55m7z3tlit8oic7NQM+C39ACVn7fOmPwfW3L5m8wtiNNy9BebDRZdi?=
 =?us-ascii?Q?/4nOtDxYSHJcMv1wnd17JhbRXxxAbeSDDZyZ5iMGZmipA7t48j7y0lxWKLTt?=
 =?us-ascii?Q?vRoddrEyL1Hz3zpwRwPvY13QaeDSI7657nYftBtLF9NGmT9iLNp1bw7/CKLZ?=
 =?us-ascii?Q?3Xq1k+6IRgdUdIvDr4i5sT2lLdPIw8gVsyCRMJnZcvZplAZKwrvdyTT8ekn7?=
 =?us-ascii?Q?yl9jGmwcaw2hBkYIDVi7BL3dXgAihSbC881lx2fy+qGmG4bz6mtLSmp1hw9i?=
 =?us-ascii?Q?CdivdtPMRo15thsF7VdVmsxPqZzucUvaHqw0rpKTIg9q227bqLJhCC6578TK?=
 =?us-ascii?Q?vAubACkSJ6LWhR94siVDPFnEhKFJe8DBI8f+zdn6p8gG29gfQ8T2V/zLXFtQ?=
 =?us-ascii?Q?IAVNgzXXTFRX/7vvImj+UzhueuL7vhzmRnna2L8zI6cD3Cl8j0aEp60fUzBh?=
 =?us-ascii?Q?djWjM1vF/pBwdnbqpnLs1XCoXrkAbEm++hMThxoRtlIEmAIa81dKi+vRYE8i?=
 =?us-ascii?Q?nWVIE98HMTnc5R5TGnGeqWpwuXO1dSwZTP3U1q120CZdi5SESuUvIBvIRgYx?=
 =?us-ascii?Q?j846PIW32Q=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e313d27-d8dd-4036-adc9-08df1e5c38c3
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:02:34.9014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tg8/jASUJHLtPN42iv8xa9qWhXL+T6XqTSOBju7imO52xmUo/CTePXyNLpR1+Plb+6IT9Sjm9WG9Bfhu5daZCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8053
X-purgate-ID: tlsNG-d62444/1790708556-BC95A757-31760B48/0/0
X-purgate-type: clean
X-purgate-size: 4775

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
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com
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
index 43804a6c7a..f44ee21293 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -136,6 +136,21 @@ static const struct its_quirk *__init gicv3_its_find_quirk(
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
@@ -146,6 +161,8 @@ static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
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


