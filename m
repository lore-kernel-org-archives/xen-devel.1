Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC57C9830E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 20:58:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433043.1653891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qWM-0005tE-Pm; Thu, 24 Sep 2026 20:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433043.1653891; Thu, 24 Sep 2026 20:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qWM-0005t7-Lq; Thu, 24 Sep 2026 20:58:22 +0000
Received: by outflank-mailman (input) for mailman id 1433043;
 Thu, 24 Sep 2026 20:58:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x9qWL-0005oP-Ar
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 20:58:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9qWK-00HWJ6-Ny
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 22:58:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab58ebe-e002-0a2a0a5209dd-0a2a4501e560-46
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 22:58:20 +0200
Received: from [52.101.66.86]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab58eec-5984-0a2a45010019-346542567440-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 22:58:20 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by GV1PR03MB10503.eurprd03.prod.outlook.com
 (2603:10a6:150:16f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:58:18 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 20:58:18 +0000
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
 b=kcrtg0u8XideqywdwzVLW1qFyOrF+fQW9OfUJ5MFRaZij363b61NNhvkcDd/Nw+dHR8wCohcZ9ZZJFgrWalKOBNI8nGnqwOPyqkeklXWTjxZo3RkjSdWOzViYDmPGLgkAc6UBk4pLbWWlhWN6Ug6G+YG+R3qWN16sZwyxUpn685wkML1PHAIZSgLOsllwC1wX4jE3EN0wi3QtK1nUYD1Invziljb5dJo4Clq/2/mGPZsgmDM/Mu06p4gHGsWNfIwB/SqGcfY3RxMFfNXlv2XhDryhktdCVUDgG8YwrHx+3HbflwnLCFl1Bji3AnMeYJCZeaMnRNq/sVrTyfZ+wG84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZJm9VptMgDBtMucbsn2Dy/QZZTYVwTGm6Ztac11StQ=;
 b=OSDWt047dQq7kHiJu5n8vHwg6UGozeRTXEGogxoiiHugPntlvEtXi9BlZ4N6BKLZWTSZDnBUaM6OPltDIaAO0KiXAtlI4tTlNvx06luI8EdIvTuLLNUUjpWU99do0AgjFwUBkw0whJ8XimcjcE7ektwRJ0b3pHdeRo3OV0sqk0g5xnmFcP2JYeuCWbk/LRH3pP0axPDWcK0maS9Ally88JLoAnbhjnvC4SnZbY7b59vcJqN5TqUD3roB+XiB7znfS8h7pbglDWbAuS1nGSwdocBUewGkcFUIwlcF7dtZAn6pglFWPTEy//9ZPOSuI2bo9Hq1rzAbJg0/zenc3sRnhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZJm9VptMgDBtMucbsn2Dy/QZZTYVwTGm6Ztac11StQ=;
 b=VKFbK7WPkyKGdvQ7JVVIUeVus5R45nQZhPOc30v1RsueK3Cerk+TQ+NBOcC4e1RdRmWWwadOo6heo7pifhMzBcqt0aZHI6DXOGXy9WX4mVTYIuDQjlTnDKGSHnEWIuEauikV7blMdf9z6LkQmLj1+OYLXzYjKCN148mfbDsj+kAnaBC8bGrf+H8WrJ8I9npib6/pHItoArW9AKxeBs73TuhMBEA4UgFOZYiBuE5qrLQJj7bLGTmTWH55gpqzu64OSYG5QmK3KaxgdKw5kBORaZC6dTq/6foeoRbZWpf4jNGJzALnIEcEsS8ixqJ3rIK7emYC6hhPU5nI/a+lJgGeRw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 2/4] xen/arm: make is_espi() a pure range predicate
Date: Thu, 24 Sep 2026 23:57:54 +0300
Message-ID: <8aa55bb41ec944bd249a77959e7702e001a8329d.1790160605.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: f7ddf65c-3137-411c-56c6-08df1a7e8f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lBq4e3nCmNinhfdFSAPSZ0dosj47bmxTp8Jy93aHdy8DsZqKOK5ir/1l9Eq3eFILQs/zoUsNmH5zcWD5IX45+QYCJsxrHVxmBBZB2fE8d4TUgExCT74fijKDcGJ0Mg8pJ4dL6L1BvwVvoU3FeVljAMkXqbJ7QljXbWh2K81G/OIHNJ9bjZFHiJwSYTFvp1UVxdcxy+C86hnJ/mRkXmUbOSp6hbFiECVF2PdyUka6R1OXtOWd4jzdk8lvH7dzZznCttn5yehij9GiEFItCapq2JvHoor9HlxzLq1Fkzejmfm+eteDKIJf0uZEgezz2AT8aLyIHonXFM9ESJjSllAtPoDhTYAmK5xH3JGadNeMSCF/wqD0vQoHh+YRq3wyC1L1jZsrhba8i/EPUnNVCAsGHjCr2xksW9/p6BPr97uD5fdFG1ORwj6JIFlOlSUHJMIvg3RECJ7qaHmUwTl5kJmtN0GIEaL9zCwqm//vrjsfrLwoFM1eKC7yjFqr0W2YlMO87pYFrYF+b8cTqiwTs2BquF+/6J4Ll/pxRR2quZbw8QYBJtmV9pg7XPXRbuE4WMvDmORjEPhyNoHy2wr0habfjsp+Mw2EmWEC2zMCgD09z05t+UDhSy/l55zOS1yl1utZmDuNWBj4B/799dH5WAWa18RRWDXAzirxGC6f+UpyGd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0X3+vHs5s4xIS43txTFDDsc5XdtOEJJqrkbefXlDPinkKuxPB26oi8iLGDcp?=
 =?us-ascii?Q?bnmiGNDFUro4Xm/M/AFrv/HDjanj5JAymmvaDM7e/GdAsjFqXctxzOMHmtMj?=
 =?us-ascii?Q?wPPy1/L4qnpQQwa/GytaVOt49ZQbZco+IlYklC5EIhWmF94TaDvNqKWVcPiT?=
 =?us-ascii?Q?Oc9cYG0qkj20Ph4ukZ3selUjgQaNaWeT/XZXbHPckxXwqoB1JkSosUwMjbbI?=
 =?us-ascii?Q?5Z1hGPBk4og3mAdWACuD3IV+D9B9Ni0+ong0Kz/AnRthM3GYGdVZHaComLJG?=
 =?us-ascii?Q?eKH/q7ohIeS72aCA7nAv4lbjFbRImiyYTz+kj9ntCGXEAWaOKQgVTkXOoICO?=
 =?us-ascii?Q?FsbArCRNZJeKhzp3+X2fTomnXiLv+bCrqZ1t8ucujcMiNa3Sd/nRr01puDy+?=
 =?us-ascii?Q?MrI4hFz5FIZVtRt9UXTNzMiOO3k1pi5ni1Put5nWJ5uR5pD0lWGE6ngRdaSC?=
 =?us-ascii?Q?u8rBoUHyiY0IKknT5hG8zmo3immjbJ0iXQb6nkFCdUQyKVlNCL0vzWpsb3fS?=
 =?us-ascii?Q?/Bnf3FWms8wvLJqYFCZdvoSxq+/OjVbGMUZJGr4uu0swZb7uHI5y+BkmUBz5?=
 =?us-ascii?Q?mHUZHbJ71vjutOYdYfDqjTPRHiTXMWfiBJ0Qlf9TmWaJwl6QAVVu/YziERVl?=
 =?us-ascii?Q?i+Yol8Va4YS/mIn8zDQPHP69K/OuJX2LN+z52a+JdtgmNKMFA+B5zwm83FGj?=
 =?us-ascii?Q?MzWg5ZFKdSc7T0z47HOjzqV0W5SGtSlSZPjKy66l8AXTzqW61OAX1CY1JyFZ?=
 =?us-ascii?Q?8xxytPGeb3TdlNgVBaJH12fjfTqtj7N3/6Il6h3YI3Wwohga3mE92gnKEwLW?=
 =?us-ascii?Q?gQWwqsqAdlk0dcs2gDeknGYE76ziSwkYSAwoQuq2kDYB4JUOOW/lG/JZuyKZ?=
 =?us-ascii?Q?dDtuyHLcaeJKVOPGAavkZyW0je9aCY5s+nUba7r1q2xO7JvVNqRlHSSA3BCY?=
 =?us-ascii?Q?2nyP+I8VfAfNhiH/ZzulKLH6eBj2BwSGkOHNLwQaXJT0/meqlThxNRJhts7o?=
 =?us-ascii?Q?OzhVjBCZolq6N3PojNSGIgsGBFRbztowa1gI2bpYV81YSqSJ4ULadCZgihz3?=
 =?us-ascii?Q?utbyI8lIiD4tQbXgTswTjqhl+IblXRk0+7wuLxl7pkOk07siKSNt9GRnEiTY?=
 =?us-ascii?Q?cqXHwSTAuskOvCjdM4pJYRfbX/F4bsJQIalzWdSDEv3nzobbz35drqRm8tcn?=
 =?us-ascii?Q?vGR8Eybi7rM6htjXIkZTXPQEoNUuDglsF49wRxtrjIwwQZqY9slxGEUWareB?=
 =?us-ascii?Q?vfdH6vXLOxz4+xNV55aJtojWJsebCk4UvLAjTx+zm5wpiVpZRVK31o6JxlA6?=
 =?us-ascii?Q?mKIO5aqmJYIPdnpus3arMMXixjwb2EWxxQ0wJEiQbPxmhDoXbhQh+udT5ZF3?=
 =?us-ascii?Q?BzSd84Fqkvnga3O+/dDtbYJ5cbOJL5OkIb7XEB5aB8L4jOxdNYgkRxxgHrUX?=
 =?us-ascii?Q?XOZBlQ0kCYZYlxW/57v0r525nSnIYqle5C2+cuvP+fk4rpz/6lt9atcmJoOS?=
 =?us-ascii?Q?6qeAnJD7aFRFhbW8N7ePPUGiMTgBK66wX6MQe1JilhBNENVoF+RMxXUIhLnG?=
 =?us-ascii?Q?wzdnfoVO+j3M9dlWvrY6xgdVjKZlSJyWSCKc5lNg+sKc3hLUlMubpvl7Wy8J?=
 =?us-ascii?Q?x71l4/tsTLKiBzkIEp+jcDUxYqnBZGnw1nLhGSXsrPrtx6VKBemOySGR+gBd?=
 =?us-ascii?Q?MyoOqbpCtaBayW+nTOBZzWQjEyaFt4dFQSr0Z+W8ckrn/CBgVWNrIyxZU6Qp?=
 =?us-ascii?Q?hp4LL3frrA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ddf65c-3137-411c-56c6-08df1a7e8f77
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 20:58:18.6155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+y03ZeGpq3XaKtwHHOC5sd7RRjDOKI28F+HxW5M3wfYmd/eFY/Z2/FHEivYjncf2jXW/tBrzo4OVIIg4C60Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10503
X-purgate-ID: tlsNG-d62444/1790283500-1E27A757-4B8DA43C/0/0
X-purgate-type: clean
X-purgate-size: 5307

is_espi() currently changes its result according to CONFIG_GICV3_ESPI.
Without eSPI support, it returns false, and its assertion fails if
an eSPI INTID is passed. Callers therefore use it both to identify
eSPIs and to exclude eSPI handling when support is disabled.

Make is_espi() report only whether an INTID is in the architectural
eSPI range. Check for eSPI support at the call sites.

Use BUG_ON() if the GIC reports an eSPI without compiled-in support,
matching the handling of unsupported LPIs. Treat virtual eSPI lookup
without support as unreachable, with a NULL return from the
espi_to_pending() stub.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v5:
- Explain why an eSPI cannot be handled without compiled-in support.
- Make both espi_to_pending() helpers static inline and constify d.
- Add ASSERT_UNREACHABLE() to the espi_to_pending() stub.
- Preserve the unmapped LPI comment and clarify that an eSPI lookup
  without support must not occur.

Changes in v4:
- Clarify the existing is_espi() behavior in the commit message.
- Drop the unrelated blank-line removal in vgic.c.
- Use BUG_ON() if the GIC reports an eSPI without eSPI support.
- Drop the redundant CONFIG_GICV3_ESPI check in IRQ dispatch.
- Return NULL for virtual eSPI lookup when eSPI support is disabled.

Changes in v3:
- New preparatory cleanup requested during review.
---
 xen/arch/arm/gic.c             |  6 ++++++
 xen/arch/arm/include/asm/irq.h | 11 -----------
 xen/arch/arm/vgic.c            | 30 ++++++++++++++++++------------
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 078049e741..cdae6afb07 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -348,6 +348,12 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
         /* Reading IRQ will ACK it */
         irq = gic_hw_ops->read_irq();
 
+        /*
+         * Without CONFIG_GICV3_ESPI, there is no IRQ descriptor or
+         * pending_irq storage for eSPIs, so we cannot handle them.
+         */
+        BUG_ON(!IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
+
         if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) || is_espi(irq) )
         {
             isb();
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
index 09788dbfeb..c29f3d04a3 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -66,18 +66,7 @@ static inline bool is_lpi(unsigned int irq)
 
 static inline bool is_espi(unsigned int irq)
 {
-#ifdef CONFIG_GICV3_ESPI
     return irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID;
-#else
-    /*
-     * The function should not be called for eSPIs when CONFIG_GICV3_ESPI is
-     * disabled. Returning false allows the compiler to optimize the code
-     * when the config is disabled, while the assert ensures that out-of-range
-     * array resources are not accessed.
-     */
-    ASSERT(!(irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID));
-    return false;
-#endif
 }
 
 static inline unsigned int espi_intid_to_idx(unsigned int intid)
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index e5aca17dcb..0ba13e18da 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -62,6 +62,14 @@ static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
     return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
 }
 
+static inline struct pending_irq *espi_to_pending(const struct domain *d,
+                                                  unsigned int irq)
+{
+    unsigned int idx = espi_intid_to_idx(irq) + d->arch.vgic.nr_spis;
+
+    return &d->arch.vgic.pending_irqs[idx];
+}
+
 #else
 static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
 {
@@ -78,6 +86,13 @@ static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
     ASSERT_UNREACHABLE();
     return NULL;
 }
+
+static inline struct pending_irq *espi_to_pending(const struct domain *d,
+                                                  unsigned int irq)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
 #endif
 
 static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
@@ -698,6 +713,7 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
  * interrupt.
  * This can return NULL if called for an LPI which has been unmapped
  * meanwhile.
+ * This must not be called for an eSPI when CONFIG_GICV3_ESPI is disabled.
  */
 struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq)
 {
@@ -715,22 +731,12 @@ struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq)
 
 struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
 {
-    unsigned int idx;
-
     ASSERT(irq >= NR_LOCAL_IRQS);
 
     if ( is_espi(irq) )
-    {
-        unsigned int nr_spis = d->arch.vgic.nr_spis;
+        return espi_to_pending(d, irq);
 
-        idx = espi_intid_to_idx(irq) + nr_spis;
-    }
-    else
-    {
-        idx = irq - NR_LOCAL_IRQS;
-    }
-
-    return &d->arch.vgic.pending_irqs[idx];
+    return &d->arch.vgic.pending_irqs[irq - NR_LOCAL_IRQS];
 }
 
 void vgic_clear_pending_irqs(struct vcpu *v)
-- 
2.53.0


