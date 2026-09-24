Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E022C9831F
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 20:58:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433045.1653909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qWP-0006N5-Bl; Thu, 24 Sep 2026 20:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433045.1653909; Thu, 24 Sep 2026 20:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qWP-0006Mw-8K; Thu, 24 Sep 2026 20:58:25 +0000
Received: by outflank-mailman (input) for mailman id 1433045;
 Thu, 24 Sep 2026 20:58:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x9qWN-00066Y-TF
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 20:58:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9qWN-00HWJ6-A4
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 22:58:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab58e9f-e002-0a2a0a5209dd-0a2a4502901e-28
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 22:58:23 +0200
Received: from [52.101.66.119]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab58eee-6ca4-0a2a45020019-346542773085-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 22:58:23 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by GV1PR03MB10503.eurprd03.prod.outlook.com
 (2603:10a6:150:16f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:58:21 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 20:58:21 +0000
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
 b=FZF4JepcOw763500uSu/hpe9KrjlsR5DxLumocDnDjJPfTx/zdqNEljc2nYDaSUwi7PGsouMbUqo3Ptjf3PWP8dG+e3WnWcm+0E3hgSpdTjJ9tGc9wW2pGahHywN7ioLTQa8BmOJ2VBI7XWxOBBqfjSDdHzhA23NyRCRPhuWeq+k2IjbswnwKRxbTKKhPrQz9vAAnAWrt3rQ++WnLlVHCcOGnSWgH2G6RQpP09mVtdhmWnMoTBhZAs2A/+LP7SpaXBeBMGgtT6A3om4yICUBlLGSRqWu6pGp9csxR/0Ho9tbqVm85ksfHE0dz1g2Gi4xWCFFj3cVHB9kmDgMlkBeCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2lkmYG7n/ygHugPAF7XixSg3rxPx+xoxz3SzwwUq4A=;
 b=gu/a+pFbwdPLDgtgaitaS+DGxuX6BtWOUeiSoNZgM0+Po9uBdHhCus19exaPkOCENhiTTQ11tYX+hu5U6Vjhdi7y2SKoKGc8y02L0yYGgjegaaZuCMK1itD4WSSOMY5PZ+EsOmHnqGme4mBsE4ZxoGWCFQnTEtYCMFvLe1mdzsDbrONhyp0xe8Sy6uEOuVsGWG/LQeDJqAgSvdZ24uYUnH1V5i0dJWTcgBp6Y9L1wlKm4XIvpC1pMKOcd9O7fAZBcKjrSgkXn5xIKST3QcxH0XMnIxpvPVUvQGATYiq5htJCgwnS9GbtNk0dLrLGEpBqgQcnhZZclWc0h/ycB4UKpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2lkmYG7n/ygHugPAF7XixSg3rxPx+xoxz3SzwwUq4A=;
 b=LmUZzgx6IfigCIvLDEu6u/REWpqjw6IARYvIwLf/e7LHwzMWm022+oSbKenj3dVd/P2sPDIiZqA4MpMvGN88VGlvicX5X5tU5n9pfvpSqNmgRAhsZiys5A26SC7Es7g0eB9vUfXeLv3zId/27V91pWx9CFm3cf2VAVk/U9fn7TtU/nRJ21VIjcRp+EcR80OWMkzkFonLuJ7zjLaa3FtWO2HD9hnztEr65G+xidTEbTZ1/2DRR71ydWNdR5qTgp4ByEp7mH9UM2iyw8C9D6Te9gwijBPkmFpeedsHADAr8Fgjr9dd76EQ6UisnkglPRSUFmFOHHJXRMYZJg5F8Cjdyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 4/4] xen/arm: vgic: free eSPIs using the bitmap index
Date: Thu, 24 Sep 2026 23:57:56 +0300
Message-ID: <8c61cf31b69377737d1f688bded43d123ac55d00.1790160605.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: e722cc51-7bf7-435a-5f8a-08df1a7e9118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	21UexnDn8z+7il3TUWVxXY4u2DdhvoBu9QfkJFiRXSuwDhsBXj64QvheeIqoLpUdevetUyS0cBxbPtSL55OsSKdor5pGA1HrpbdxLP/9klLARWxDuV5sDv6Cqp3reHd4Qh4NqzB4yW96v666U/Q1DjBro1bvwZBf4+maiojanq+QK5CCkwQYKtzrfb/+6jrrIIWCxV9+/5aqKnU17ko/z3lM5Di96fHWz/ynM+rI79o0jVIDmRyP1CAZRgNIJYj40Vm55JksdvKd6cEKvpQu6tQ5P/hpUcoufRsywuc27W2PaE01xc4S4xcUmdXYDgrUySdjHtqLx1Apqruh9NO2sJ+4Y/Oauqt8Qky0V0yigI0HzvU+VPIa/3jTLQYW5FPeMIJbdObu0tk5/fcTIthU/bcUwnFktnEPI/gs9x/ajCY5PNlCrFcJkRGs35MqGS89UAAoKo0sBjxOYT5GWBZAyLzjVpqyNwZb0iyPZhzVMf9PXkQ96GCmX5xNLSSAxZ2MSj2eJNZyWxQ+DDDFXFjvfEoTaJv5JjC3A2vkt6/yd/Vor74zBUJn1kLq973W79mWYz51CsGhdZnFlBmG9iX0BGkeiFQx0fM1n6FGRcASMOlKFu4OGE2AGdxgmghBFETG6qdYeJ89w7vVmEKTMNLhJGDO0ArGOoIpeRiKofjAyBc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fo6khaXhSFPvxngmiZTTRkWTqeTS1eZtt1lDCLOYdb6VXxny46WodMZKqzhF?=
 =?us-ascii?Q?MZYpGkppPbGmQSNp+A+KXEbwPgNccd1sO+06nj1o65eh4zF4hVMNedPhxpsh?=
 =?us-ascii?Q?6vLci+QPbgqSRmI4P0rSq0jd2bwH3hf9N52dLY8jDRQ0cNjDLJM7vL4mUk+N?=
 =?us-ascii?Q?5rL/DBpc0pPGXvIsfAG9Wo4NDBAS6IYLIyshcTKrV8qhgE6WkWd1K7suL1OB?=
 =?us-ascii?Q?9kEYzWcBJ496bbjje/KHI/IlukesGLU9s9/FWKUhvhaWFMxrl9IeK9vFdb7q?=
 =?us-ascii?Q?dIs2M0qNfBDUzb4C0qdOQJko+nFcHtQNHdAC9zmtl06QEGdqldCIxw0knU4J?=
 =?us-ascii?Q?53I2YNNjniXYu2d9YGBhRnIXsFRxICHeWcIxOP6ORWqib1hJDBwmb7u3ht3p?=
 =?us-ascii?Q?Q1l41yF1oezLIEwTOlD+8NMiOLUew00rjuHDJ4nkniOVehI6vmi2QTi96Efp?=
 =?us-ascii?Q?DDryVLN8dx182D25+oqVkj6Wr0P6qefjerdVKesS86icY+d9LenTxwKqEdwo?=
 =?us-ascii?Q?0lNuIP3WSj+sUDEx6Kt5ZsjwDd85lySA+ILcZoZZGq0to7hlpzb8IJw4m3S6?=
 =?us-ascii?Q?yHbI/iHqjzRbbgf43I/IM6CEyyUg25Qt6E2WAtkB9NXmDxpq6nDT5DuNvrI5?=
 =?us-ascii?Q?XU0/ilMZhVl1E+XGACc3aTQt76Mj8Mvjw2VE3aaZbMtr5fIYI1iFYXdwpwfi?=
 =?us-ascii?Q?2saHlEnuKUcgVSBRNJQWERrdSiPxT16zo4/OaQspHAu5rvG9aHqoZ8x2F357?=
 =?us-ascii?Q?Tcc39wehUGWdk0YKza7qjZpvCVSMVuOKLnGfSnaK0tIcMfYafFr2KFDXDUfA?=
 =?us-ascii?Q?o/7c2X+8NU6siS+7iSYi7zKvuVrTFJpgHdZmpo9h0hTfzayvibpePui4RSbB?=
 =?us-ascii?Q?oeNuXqnSBfNQE2Lrs5/F5/36ewBVs9PrAT/Nzq+K8esIIXx6lr6/423RiCvE?=
 =?us-ascii?Q?uA+TbqwvfA6Nob/T6woZRfllAmQ0OajW3Inr6T1ZcdLOCENxISxWz56zjWUf?=
 =?us-ascii?Q?nI80kf+6ElNHkEy4/meYhZZp0z2zZiUErv8fks9Tx7vEMIAL4vdG6eRSE2i3?=
 =?us-ascii?Q?dIp7iaIG+7AdpubK9Fx0pkPDZFupFZbo8rv0UrdHGCGJ/XVDYqZcAWuTfukS?=
 =?us-ascii?Q?gNHvTpcLxe+B0knqHgZGwrmtUHxPsKUcQEkEaWTRqbIXTWgzDlRXaGDFuxT1?=
 =?us-ascii?Q?RSQc7HMfqKcq3xB5dOX/BTRBGxbK6HSzGkQyNx4lEH7ZLMmRNLyzEXLKeOxO?=
 =?us-ascii?Q?Z+iy9WJ/r2/M2/8wO1Brljmxf23DTH/jvH5IWA66R5J7L4vdUVYyB3FVpzai?=
 =?us-ascii?Q?Aw80RubBTPqnaRuj7ncPJLSxSO5tnfda494QuMw3hQSbCGuZrkf8m/TQds2R?=
 =?us-ascii?Q?tBEaj5iAaGxK2OhqnT9cuUeaGCY2djfIj/hFeiaWmVIFh3QjpZCQWKtGvKIM?=
 =?us-ascii?Q?nj5DPnhCtbn7Anbv9bsspHaMfiLHHnE2UVEgdeYbo+vHT2OoRXdUKz9Kwdw2?=
 =?us-ascii?Q?iBq5XTim9O6aTqNyBafDoj5RUD39dCi8HyB9Fj1EOqy/ThpodMtFRrDejKAr?=
 =?us-ascii?Q?Ox+EjAgQMI94WQAlooY2WXIfjmXfEHqCgcHDlLf2KfHRoNzUNZvH7Mhlurjr?=
 =?us-ascii?Q?pl8eKtlpGn2BO6ioKHc/7kJQ9czCXeKykDiklyBUymhKiKz0YkGjNE3wU03O?=
 =?us-ascii?Q?/pW5xM8u8AsvXxUMBaXVdo4IMl372o4rp23lRDtMFAyMkfzM+aE3sRfDESjd?=
 =?us-ascii?Q?KTGxpb1t1w=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e722cc51-7bf7-435a-5f8a-08df1a7e9118
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 20:58:21.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zGqKfQwZA+8/tDR6B3Ix3kE+UCinS9VsQt7aRvP0f7Z6G/pxFmjrRL9pVmWGXScPQucaiJvUauHTLdpmsGviA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10503
X-purgate-ID: tlsNG-720697/1790283503-F10A02AC-A3A39AA6/0/0
X-purgate-type: clean
X-purgate-size: 4869

The allocated_irqs bitmap in the existing vGIC implementation stores eSPI
allocation bits immediately after the regular vIRQ bits.
vgic_reserve_virq() converts an eSPI INTID to this compressed bitmap index,
but vgic_free_virq() used the raw INTID.

Freeing INTID 4096 therefore clears bit 4096 instead of the first eSPI bit.
This writes beyond allocated_irqs and leaves the intended eSPI bit set.
Valid eSPIs reach this path during DOMCTL bind failure cleanup and unbind,
and during vPL011 teardown.

Add virq_to_idx(), the inverse of idx_to_virq(), and use it when reserving
and freeing vIRQs. Use vgic_is_valid_line() for the validity checks when
reserving and freeing vIRQs in both vGIC implementations.

Fixes: bdde400c6e1b ("xen/arm: vgic: add resource management for extended SPIs")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v5:
- Add the vgic_is_valid_line() guard to vgic_free_virq() in the new
  vGIC implementation and use the same helper in vgic_reserve_virq().

Changes in v4:
- Document the compressed bitmap layout with an ASCII diagram above the
  conversion helpers and refer to struct vgic_dist for the full layout.

Changes in v3:
- Adapt virq_to_idx() to the configuration-neutral is_espi() helper.

Changes in v2:
- Call is_espi() without a configuration guard.
---
 xen/arch/arm/vgic.c      | 42 +++++++++++++++++++++++++++++-----------
 xen/arch/arm/vgic/vgic.c |  5 ++++-
 2 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 0ba13e18da..acded6a40f 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -25,6 +25,21 @@
 #include <asm/vgic.h>
 
 
+/*
+ * The allocated_irqs bitmap is compressed: eSPI bits immediately follow
+ * regular IRQ bits, skipping the gap in the INTID space.
+ *
+ *   +-----------+-----------+-------------------+-------------------+
+ *   |   SGIs    |   PPIs    |       SPIs        |       eSPIs       |
+ *   +-----------+-----------+-------------------+-------------------+
+ *   0           16          32                  vgic_num_irqs(d)
+ *
+ * INTID ESPI_BASE_INTID maps to bitmap index vgic_num_irqs(d).
+ * The following idx_to_virq() and virq_to_idx() convert between INTIDs
+ * and bitmap indexes.
+ *
+ * See also the allocated_irqs comment in struct vgic_dist.
+ */
 static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
 {
     if ( idx >= vgic_num_irqs(d) )
@@ -33,6 +48,16 @@ static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
     return idx;
 }
 
+static inline unsigned int virq_to_idx(struct domain *d, unsigned int virq)
+{
+    ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(virq));
+
+    if ( IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(virq) )
+        return espi_intid_to_idx(virq) + vgic_num_irqs(d);
+
+    return virq;
+}
+
 bool vgic_is_valid_line(struct domain *d, unsigned int virq)
 {
 #ifdef CONFIG_GICV3_ESPI
@@ -854,19 +879,11 @@ bool vgic_emulate(struct cpu_user_regs *regs, union hsr hsr)
 
 bool vgic_reserve_virq(struct domain *d, unsigned int virq)
 {
-    unsigned int idx = virq;
-
     if ( !vgic_is_valid_line(d, virq) )
         return false;
 
-    if ( is_espi(virq) )
-    {
-        unsigned int num_regular_irqs = vgic_num_irqs(d);
-
-        idx = espi_intid_to_idx(virq) + num_regular_irqs;
-    }
-
-    return !test_and_set_bit(idx, d->arch.vgic.allocated_irqs);
+    return !test_and_set_bit(virq_to_idx(d, virq),
+                             d->arch.vgic.allocated_irqs);
 }
 
 int vgic_allocate_virq(struct domain *d, bool spi)
@@ -903,7 +920,10 @@ int vgic_allocate_virq(struct domain *d, bool spi)
 
 void vgic_free_virq(struct domain *d, unsigned int virq)
 {
-    clear_bit(virq, d->arch.vgic.allocated_irqs);
+    if ( !vgic_is_valid_line(d, virq) )
+        return;
+
+    clear_bit(virq_to_idx(d, virq), d->arch.vgic.allocated_irqs);
 }
 
 unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index ba029b8a3b..84212bbefe 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -712,7 +712,7 @@ bool vgic_evtchn_irq_pending(struct vcpu *v)
 
 bool vgic_reserve_virq(struct domain *d, unsigned int virq)
 {
-    if ( virq >= vgic_num_irqs(d) )
+    if ( !vgic_is_valid_line(d, virq) )
         return false;
 
     return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
@@ -756,6 +756,9 @@ int vgic_allocate_virq(struct domain *d, bool spi)
 
 void vgic_free_virq(struct domain *d, unsigned int virq)
 {
+    if ( !vgic_is_valid_line(d, virq) )
+        return;
+
     clear_bit(virq, d->arch.vgic.allocated_irqs);
 }
 
-- 
2.53.0


