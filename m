Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69EDC982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:40:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428173.1650888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uAU-0003n8-EY; Tue, 22 Sep 2026 06:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428173.1650888; Tue, 22 Sep 2026 06:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uAU-0003n1-Bk; Tue, 22 Sep 2026 06:39:54 +0000
Received: by outflank-mailman (input) for mailman id 1428173;
 Tue, 22 Sep 2026 06:39:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x8uAT-0003aV-DY
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:39:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8uAS-00FEyU-FE
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:39:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab222ae-8faa-0a2a0a5109dd-0a2a4504c478-16
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:39:52 +0200
Received: from [52.101.65.119]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab222b8-b57f-0a2a45040019-34654177a68f-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:39:52 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DBAPR03MB6565.eurprd03.prod.outlook.com (2603:10a6:10:195::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 06:39:50 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 06:39:50 +0000
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
 b=HfOirm0atRTWtptmPUdFok9YZoTbz92YaxcLzhL0kSMVb6ejaeqBWPaieZP/gnb7OeQquIm8KFWmJdvwAPL8Dbcg7owv4+UWspsr/6r7Y8sovdIu2JoxZKMl4dZPnQoJO/um/ihyk8hGxYMzEbBdseTVfZ78pX6klfLUVIEOkQml0bVZERb2hik6rI4SacW9F7fQheoBc9dUEFVJoh2+jm4Pg8tmAyZVBmbyDdKl+C4Ftg6Bh3jqPpIRG3/hGBLlFRBJ6F6PUg4QifZTj9pS3IwLBHy1H/8ljfsONhNDZ6tBhLvYjafMpIhc8RC3di6B1x1MkbqsRhtpfSVdgvIjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYZ+bXzlGIKtldd4l5jsQnzQLEtJHAU5cxG43Pee86g=;
 b=VIESPDDcUqwIvpK7dBkK6Q3aG08HW4QzkFRFqWTjt4F3PzNsbTq7TYp9rk4dJK42DK9W64cX888nlnSn/oUZUlmGmAanQwk2pFpWHWm3HHGq9kqggBXi5Qtf8vVAEAhVbrWlCvfsxqBJyG/D0k4sXMeY5YZm/bhE3SwCnXtjjr3sF1bM/7NZx9hsQhoPWPw1ze5ap7BNJETZJHtKfw46NsvwNTIk4b56TxS4SnwX+WWdEB8Uy6cxF+tw25VYItNuT9AHgLmUhhJfc+FjOYHplBJjcpYEPYOryi5iJ673DSn9j/Q9IWAqgW/ng5SHPObNaTDZZy5lMl0V+oRvhBWLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYZ+bXzlGIKtldd4l5jsQnzQLEtJHAU5cxG43Pee86g=;
 b=G3cgMZ1Ix7nGx9T7+qJnljo114YbRpsNxk1xU3QsadO7U0y838PRB8IeSpaVJ288XMruJtwMTjMfj7jV6+mXNHBGIPALGRr12kHd3jR7HIHS+bEofmn9ZD4IJSfasL1CBIrIwOtCLjw4Fz+irbx6E6yfCC73+7QqZkiK2tOwevf63wI00vLM42ZdguGuQibcXp0ZPH65PpZt5SrFtmkEL8IRp4egS5mm+Fg+aOUs2ZJg4DJ39juZM32rAevkxCJ30LTzQaahQ3WIkV1bUyqZlnkbU2uC3H1mnln3iwAid6PdKj/h0heU3qBOvhpOyRIHj/8F5xHeLCr/tgCjvyv29A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 1/4] xen/arm: make is_espi() a pure range predicate
Date: Tue, 22 Sep 2026 09:39:29 +0300
Message-ID: <802ae2dd44556a292d98f1d52d3c88ce4fa5034b.1790056623.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790056623.git.mykola_kvach@epam.com>
References: <cover.1790056623.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B7B.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::613) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DBAPR03MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2d626f-92a4-4fad-2889-08df18744d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	92QCq/Sbxg6lMtAiINgcd93XgKhhM+4jZjTUIpOMm+hjgGXQVRsIig7VZeiS8KnZc73Zr74+z+Nsltw2ZkYRPeeLm0UvltUXwY2nvY7VGPqwQ/ev5N2Iw+zDwC/WeK8EJ/YTIFwLnn3GQkYkOktwZHxv2O47fCwNDVCehdFChwcab+80gAO6n6lYSb7jz8t8UJtuAoKg2qxAZ4USXcyAcO+pKYdy4fuU/UlOHipJ5MSQMMIP1nptuvzQsQ+MGMox2wj4sQKVtsBMayj4HMFwAIr/AQGoaYbIx9Aba9YRoJnQFrDdXV3awCFDdbLOSNL0fsBOstl4X3ERhXNwb3GznRHEuuquFUrCJeLFMowy6SR8qZd8/jGinoQvdu7txx2B2dCbI+JhfxQRSRBJ0y5+Dre5jFw2P7CPIaXe2MiOgYkk97dr+3AEFsT3dKcOV8gyYNE7oOtQw8tbcdu4SUYKDJ0DBYGSwemZKEo7PaxkYYnmb9cGiebB0ORjhA5Ao5NTpwNczGi3p6uDOGHe65sEorFAGXYeIZfmeZN6ztcgh799uz76L0RkZalvPi4eluZUUWkFDltr0ae63mOcZTaM+AkMT1h/4CCyJu+EMejJFacjAJlb2GJsfWL/+9Oc2VNpsLNbNXKmt++HoPZw9cbaVzf5jbXcKlZ//DUwEUUTtD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yadC843HNMa5u/MgFZf4kFLWMKqYOLKkTPUQC2IpNqESuqoNvpQkpPKLP1sM?=
 =?us-ascii?Q?CnMehMQvg2Tir9B0ln5aKXcXyw81PQ+7m74TqDFuYeRMrOxR+T7lsCp588jl?=
 =?us-ascii?Q?oF2Wv+p0mWLaJLxpaFOQvFK9c7SKwEMCIKDy0egLyZ4McvHdd9FxdIl3IXBm?=
 =?us-ascii?Q?aAhcdUqnrUzG9rOw/6AivGC1eIgIY9GXhEXlslRNGVwE3pQRnVMMFIU2jD9w?=
 =?us-ascii?Q?k7H57mZCx1x5lkI5uYDUwX+2DDv33Hmx0VT3pjlqcVcIgpjLWcbkPvfscEes?=
 =?us-ascii?Q?mTrFccHAyxUP+68eSVs8C2N5lRJg8NnCi2ter+YP2cUarRPX+t+e6RDs7zZU?=
 =?us-ascii?Q?rE8pqa+T0//D0rtCtN2cJzFxVvgKcovFEyZ7GWJu9wq4t63JN20LqBCU/Iyy?=
 =?us-ascii?Q?6KLW4p15sgNLsIx0jQlrASi6oTZ9cIdJXdY0VEa6RDyks/3KK3RE9ULMIBqR?=
 =?us-ascii?Q?d9HIKoGJNKhBwCvlW9DaONYepCcutbv4KNqVAG+i7abg0de4ZgDfhxpEpsc7?=
 =?us-ascii?Q?Ycb6g99TatvGENKyJbOI9NcrCBnQvAL5znOd7Ff0GvwyxSrq8fa1YJg0d6Mx?=
 =?us-ascii?Q?M6IRM/4rNo+LdZipeu97D1JV5/wz/A3GmnHMPwHwY6vxoC004lLHmMzvtOl9?=
 =?us-ascii?Q?JY8bCsTGR/iL5P5j+iI6caK3M2ADEmXOvRAgTCSNbKAAmFuOA0T2wsOxXa1u?=
 =?us-ascii?Q?ok3hK7cLPlmbzC9hN4HMsy+vv/Xh39xIlu9PIzRDsLeo5+qwfzqRb69VHFvC?=
 =?us-ascii?Q?fkp50IMHvDrshpozf2cDql3nrRo27pJOPFtUwrSumMKGMf25qSCF2BvxShcJ?=
 =?us-ascii?Q?Mo8nEIn+ycc/4BRz0TVrhOp+mIHyTjLBnKB4x0+0rBtsoe7sAU5v+b9xKxGO?=
 =?us-ascii?Q?gBYl7u8Ki28c23bg33ZeOxFYNM5i+7ac3V/bPHegma/B1iT5Vu4fzIqM+hbT?=
 =?us-ascii?Q?JIJlYaTwvtfYOgIbRdnQtxr3elyPl+1XMohKM9cfuEO1i06DkoUtXMiK75H6?=
 =?us-ascii?Q?ZgityJkKYq2ExbeR00PIZBpNoS6bfndeyA/iqF1rlIroHZTRFmX+zilkU4m1?=
 =?us-ascii?Q?qJTspb0oOB15s+PMBj7JO5sZF4SbpUJC33DoTTNysJK3gskfu1FCGkCxjotU?=
 =?us-ascii?Q?g+/J2PIpzBdPuo/3lh4DdqqzHtq2uvmMAx95hf7dQmcIKbxxqa5v66Jb7N3C?=
 =?us-ascii?Q?ISwBYU2bMGsFfZBO23IbsSgShC7KJBJQV/HbiYou0aQhQw8K/PNJepddfi3E?=
 =?us-ascii?Q?+2Zp0XfC6inaEmtl1nWXmC8h+YPM/brUxy0LGHMIGEUL6gJoIVxI6TQVvpwj?=
 =?us-ascii?Q?0V2Csfec7aSa5jZuPKcGJizDr+EJ1ZulnHAL09mEvrHylnJAqcMQexKfDFF6?=
 =?us-ascii?Q?9qD03FniMFhJY5FC2JWsAscmImUjptqlHan1Y/Fo3PLWF1PtKNkmJCjRI/Ns?=
 =?us-ascii?Q?94/egTmBN/6Ru1tj0wt4ZVEohptqcjCHkg7CAyQ50yRB3HZfkijlGMdlYcW0?=
 =?us-ascii?Q?gzAg5EXXrelKUPwGvPp+C+XK8qtrq/1OcN58ZyJvvDeQvCiqbKS3Dq++oQ8D?=
 =?us-ascii?Q?W3aWAhUh4K8DGM1fXjugW2nQlSE6Lsn+EIImHDSGeoXiEI5sAPaYfTYrfmBR?=
 =?us-ascii?Q?4GMZsNENH26qMXU+6SSF5/v5NwgXVLrbRjrkjnp9eGPh0wqmaTMjZiySWZay?=
 =?us-ascii?Q?5WrtS2t0/ffTnGoyt/HiyGJ8zqz8ZoS6M3nJH5kv59EAKgM/5dzOagKIOUlc?=
 =?us-ascii?Q?SBmsdI0M3A=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2d626f-92a4-4fad-2889-08df18744d6e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:39:50.7793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NSkub0pYOylFPN7mAQEVlf2WV6SgLq4eZK25zXUs3tBd2S22g8L7eUdHWtjXwbqf/mMZNQJ56LclvZdCu1dDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6565
X-purgate-ID: tlsNG-ebf023/1790059192-C14D3B50-71BE1FE5/0/0
X-purgate-type: clean
X-purgate-size: 4772

is_espi() currently changes its result according to CONFIG_GICV3_ESPI.
Without eSPI support, it returns false, and its assertion fails if
an eSPI INTID is passed. Callers therefore use it both to identify
eSPIs and to exclude eSPI handling when support is disabled.

Make is_espi() report only whether an INTID is in the architectural
eSPI range. Check for eSPI support at the call sites.

Use BUG_ON() if the GIC reports an eSPI without compiled-in support,
matching the handling of unsupported LPIs. Return NULL from
spi_to_pending() for an eSPI when support is disabled, using an
espi_to_pending() stub.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v4:
- Clarify the existing is_espi() behavior in the commit message.
- Drop the unrelated blank-line removal in vgic.c.
- Use BUG_ON() if the GIC reports an eSPI without eSPI support.
- Drop the redundant CONFIG_GICV3_ESPI check in IRQ dispatch.
- Return NULL for virtual eSPI lookup when eSPI support is disabled.

Changes in v3:
- New preparatory cleanup requested during review.
---
 xen/arch/arm/gic.c             |  2 ++
 xen/arch/arm/include/asm/irq.h | 11 -----------
 xen/arch/arm/vgic.c            | 30 ++++++++++++++++--------------
 3 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 078049e741..3a7f972826 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -348,6 +348,8 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
         /* Reading IRQ will ACK it */
         irq = gic_hw_ops->read_irq();
 
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
index e5aca17dcb..e04678f134 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -62,6 +62,13 @@ static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
     return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
 }
 
+static struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
+{
+    unsigned int idx = espi_intid_to_idx(irq) + d->arch.vgic.nr_spis;
+
+    return &d->arch.vgic.pending_irqs[idx];
+}
+
 #else
 static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
 {
@@ -78,6 +85,11 @@ static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
     ASSERT_UNREACHABLE();
     return NULL;
 }
+
+static struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
+{
+    return NULL;
+}
 #endif
 
 static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
@@ -696,8 +708,8 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
 /*
  * Returns the pointer to the struct pending_irq belonging to the given
  * interrupt.
- * This can return NULL if called for an LPI which has been unmapped
- * meanwhile.
+ * This can return NULL for an eSPI when support is disabled, or for an
+ * LPI which has been unmapped meanwhile.
  */
 struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq)
 {
@@ -715,22 +727,12 @@ struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq)
 
 struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
 {
-    unsigned int idx;
-
     ASSERT(irq >= NR_LOCAL_IRQS);
 
     if ( is_espi(irq) )
-    {
-        unsigned int nr_spis = d->arch.vgic.nr_spis;
-
-        idx = espi_intid_to_idx(irq) + nr_spis;
-    }
-    else
-    {
-        idx = irq - NR_LOCAL_IRQS;
-    }
+        return espi_to_pending(d, irq);
 
-    return &d->arch.vgic.pending_irqs[idx];
+    return &d->arch.vgic.pending_irqs[irq - NR_LOCAL_IRQS];
 }
 
 void vgic_clear_pending_irqs(struct vcpu *v)
-- 
2.53.0


