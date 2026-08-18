Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525D3C5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 11:33:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394000.1632813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwI4G-0006iN-IS; Tue, 18 Aug 2026 11:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394000.1632813; Tue, 18 Aug 2026 11:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwI4G-0006iG-FX; Tue, 18 Aug 2026 11:33:20 +0000
Received: by outflank-mailman (input) for mailman id 1394000;
 Tue, 18 Aug 2026 11:33:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wwI4F-0006VX-18
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:33:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwI4E-00BTlp-Dq
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:33:18 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a8442f4-2eae-0a2a0a5409dd-0a2a4503e17c-30
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:33:18 +0200
Received: from [40.107.130.130]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a8442fd-fae8-0a2a45030019-286b8282bd98-4
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:33:18 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by PAVPR03MB9598.eurprd03.prod.outlook.com (2603:10a6:102:301::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 11:33:14 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0315.012; Tue, 18 Aug 2026
 11:33:14 +0000
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
 b=kflSWwRqRsPQ9DCXjWQOsFEkpzMeLfkHZsTQyRPjeeLqgGHL44GtnyF9Y/lw17SPy1ImNadgvtVcvsirPYIbLbBVY/83AVVImFQvu845CvRZkuYB0kAAMHe2KVnz3s79Igy8Kve0oHqvjVKK5fjWaFHm5sXLILVThvnf1Kb9ax+5UgDcNIlpOMFAMx/HswMlA/VrdNSwI/SEGVZyH6sAeqvpqui42gUmEuiS2oKqqKHDyZosd0ABBP0dn+sTmJD3AUu02i6JhCQCf7Rg9M1jf5656zR9kdIL1qk818BLY9O7gLe01CW5Avr3p0M10uS0SzX0MCtldQq08IyaFcCOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N70P7aW11jK3CbWzYj+uAhsxTa1DoTppUHe0Uo144Mg=;
 b=ZmtUw2E8OsSMeg9ZHV1T6S8JigpY9JM1DSmck7H/cFvq0FHFKIXt5+e+1po8qhtMv+pTdkMLlfpLKucJ80pDYB4xREAfVfH0ntU36y4hfEP5N3E9FykGTAx1EflnYbei8h4sszqmF1GdXxR1SqQj+CAsc4y4W2f6EsNpnQdXI5GPLb06pnnxmcwR81Mo8AkAQDLvdir2yZZPeEyB+t6CNrnfzdM3PT3tLKG/J0zDcYYwFm/hHY4PSFhLKiRFquNl1R8Jhelbz1TSGnMzvMkqB6GCzz7tNyJkEfgc+7TKJUD+vNBULz0HTh7bKJ2sYC42b8DjfTKZxwFYNBNzMo8gZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N70P7aW11jK3CbWzYj+uAhsxTa1DoTppUHe0Uo144Mg=;
 b=hYdZ9HNyuo9ff6eQowz46v8JS+sTyyOsHOhnrW5fLA69suZ21sDJqibb28k3cBol2flnP7kSpHXY8kJm6PygCN1MM3DgEhgb9d9PaBhCONh0NUcdRYM0T4AHXbr2Qu7Md+OjH8SNfqTJV6sIVQo5O/atlxjnC/4JFcrgyqq3ZgPZCd6X/4sFe3SQ+Mjv87ME/fMtxAi8dSRUJx9sZzqIAzM+G2a7hOAhX4OvXH8BTwDK8S1dWUedzBZBn+Zm3hRfndvI9M2Z5QztS+gFvEakv7+QhMwDJgP8/kSkt+mS5CHQPD9v9QxxrnSaWwK8iMooRzaKRnnV+MZqh0uVT2/MeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 1/4] xen/arm: make is_espi() a pure range predicate
Date: Tue, 18 Aug 2026 14:32:59 +0300
Message-ID: <8e42437f8abca2722f1a2e2568bbb5b938c23e85.1787050437.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787050437.git.mykola_kvach@epam.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B92.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::63a) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|PAVPR03MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 8910cc88-e67a-4d0f-cf64-08defd1c7db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|6133799003|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PZ8PAuzk9Q5Vf5FiseYvsusMLdT1VAUlJIjRjFenPOc/GgPLqrGzTeI2GCFUT5J1PVeQDH06HPCglXRS5iUvkac3i2wl7EdHoO1RuKd43XEjXWkvKPwNeFbWQIBgDyq8kWzRD6uvYsUUeoUVPw90wiXSipNBsNzwWly52Z9K3AdXGiZGtb91rdhxXMzmgq7v6uB1jEY9J3J9v46SpcOel+Hnl10zEWQT/1iC6XGTvvSnedaIafXt0NzhCpNF8DYSMBF4JE9BacNSuRbXatuTBvFbVC1MDkjRH4G/99g0jEkOFb39B1wGQQZ1ywUEdFM7UBEqXRGCha7iCSKLev0RXDN94nNkeZUMWzDEXsV2gE3LvlKpcrob5bCQBh2y/tiC4wCnI6yuoqnpFp0YB53G/WcwOANrSnlkN5OBT+M7j7KkczbYyYVh2GrGPiulvZRuG8PryPtYlcwWvFcVMI8LgeMXA/AEkcBC4YnuOAUoEloXHF4xCADY6zC1ejreosJL/F9/VDXc+ERRXg6DAoh4Ow1oXq4mPJBC/eGeCF8DcIctJgPWwZLiadNMMLVl9/WAu+pIFT2LdAakDhXu3uKiG6c3tp9tVaxW39Os7db8HYOsqx/qCJ/e7llLXMxcQMdJMrZiI8dEb95D93qapbqOURqTRGZEdhVoY+Wk6B3HRMg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?esAz5BYUxkkMJC+r+p3700VyeF7WFIqOeda8FUq3m8qqJHX8LqPLKbCH55cx?=
 =?us-ascii?Q?BPV0jN8yP8osaiPUaWfsMvA+mTqT6okuqB4mNWFoBZqIZkxKrNwv4ehiZzsG?=
 =?us-ascii?Q?xntjlDCkVT6cGrJEDJXJVOh9eTjn7wQQy7gA+3cZOXU0xjo2o0Afi4zvEsZu?=
 =?us-ascii?Q?haJyGhGRQETs1SmiQ7DTnOVD/T9MjOQLUwuyn2mte1OEKPIPjXmxOlGaCzI3?=
 =?us-ascii?Q?eWppbcSWw81DkI9iqBIQE/tDCtrhWcqxBZy4xmyPNvWS98uLx/BVTHi4EKSq?=
 =?us-ascii?Q?oDNQOFbamVyR0MKG00YA6vghSGdfMVaNZ91ci2NxuyWg01Z2iX/mSDL8lgzr?=
 =?us-ascii?Q?ZGLHJY0DLBULrs5pyt2cGcF4EJ8Xk5fMrarED9D7SBZNdEXim4LlAuVjkO7S?=
 =?us-ascii?Q?d1zJqWWDJ3QjN/eFNGq5jsUh27MlACX96h1yHGbsZ0fJFbOInkJFf0DEebqM?=
 =?us-ascii?Q?GzlUyrnEUsgoO1AB4gT9590zKQPvQRAHtuFCqdx2+Ws73+Cwk1XqaIGXgpeR?=
 =?us-ascii?Q?YVRCfa6VP6yr2hOAnn9NgQBKsoUWeUBN4iTHGAemjhzU7Cmv/mZcvqH/kHSy?=
 =?us-ascii?Q?s0C9FJFy0ku5WQpuHJp+I9mzUN3kVJEBEcUSf+hOpfMtNujTlslBS0OA+OHQ?=
 =?us-ascii?Q?GP4LHvQ5/OcwfwIADb3Cw9pTV+z5YQvR/kKXgcWu7DQPxbHm7veAUHfV+5H7?=
 =?us-ascii?Q?uve7ByStOuOjTPbS+bewl+s8QvSRIgywB+MdYxIwdwaWCZiwoG3rnx3mXT5U?=
 =?us-ascii?Q?56Gq2loC9hQpg4GQHoCjkvFOjEyVZyn6eY6O+iAgJ1KGNtWnkappuNH2fIq2?=
 =?us-ascii?Q?lqPUrmUAFhEZLvrmZlQ3y2OsOpkcYUIa+IEemuLjH8M/AuDmt6VEsMhcBNo0?=
 =?us-ascii?Q?6ZQTGOEAYD9K+KG1/W37Q3Xw7JqKEHNfeQwpXEf+4lIRyCvNjdpdCLP85Gr5?=
 =?us-ascii?Q?gMFPN7ZDaLbjfgYPv0Kxswb7XSEaFhMvSSD4yYeTq1JLjeBR2Q2O3onu8olE?=
 =?us-ascii?Q?KqSpOq/FXFNKJ9hgHQTgewEtgkRI2mj8RmPkbJn1kMPyi0t5ATTp1y8pPVJD?=
 =?us-ascii?Q?xweWeQ+CqR37TAws0GGcHlIlSA3yKi6WbSgnKarFzTykkt8A5WJiFeHjlHgR?=
 =?us-ascii?Q?cH939nWcnlH2qiYH/qJdqKoXvXUiqh7OdU8Ue720eglCYgHgAdAv9nKHwLFt?=
 =?us-ascii?Q?BHqzDtEQICtW5ynsiNGMFI2AYcF2aC8HFRXdzL8nJJ5BBkrxADNUCR93yvqo?=
 =?us-ascii?Q?uSqGK7WF4ubd+ocnqpP/fF8N4WRWc8u2mfxPh0ylwE4Qz1GqSwI009RC8cnr?=
 =?us-ascii?Q?hyd3dWfGFqb58SihBbTSnr26rQRB7veYxujG6JwvDbKyK17Q3hrLsIeh9TSP?=
 =?us-ascii?Q?1u2tsFUr6ngb0oGDKRiacEuGaU6qTSs4X19GOS265YEawvbz+rNfU+yvp55d?=
 =?us-ascii?Q?FPFb5Fo9jwvqNVd78nrrNfFJQgOocFVESuQvrsZVhWV6G83XxXfv+aM+32oi?=
 =?us-ascii?Q?Okhlk/UJAkAkbzxKyinCQxs/n2xJyDFldm7rjFsq5CSDWcNyRMGkWzkn7JiZ?=
 =?us-ascii?Q?+7VAUSZJ6V6Y4RLS4AlJ+lzQ1kNldSUvBPfvk27FHR16mFG75e2od2O7PqtP?=
 =?us-ascii?Q?LmIZ/997XB/CPzg1y1xUzsz6kDYCMYHGYRd17rBJzDoPWHSufC7lRut9mpPE?=
 =?us-ascii?Q?RFW4PxeXhW37sUZrILcvMHwS9y8La+BGYgzGeU/8jv4A3VTiZSOPU2mN1mXg?=
 =?us-ascii?Q?EvuS7EJkOw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8910cc88-e67a-4d0f-cf64-08defd1c7db9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:33:14.4821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3KILa40u7z8D8qOLSTWfnIsQZomPPyjXGrom6Pq5V7uFcc/EwHLrBJ45wAndM0CEs1KSceiyBqttqTt8GgR8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9598
X-purgate-ID: tlsNG-33051d/1787052798-768FA4E9-1643847A/0/0
X-purgate-type: clean
X-purgate-size: 3024

is_espi() currently changes its result according to CONFIG_GICV3_ESPI
and asserts when an eSPI INTID is passed to a build without eSPI
support. This makes a range predicate carry configuration policy and
causes callers to depend on its hidden side effects.

Make is_espi() report only whether an INTID is in the architectural
eSPI range. Gate eSPI handling explicitly at call sites and preserve
the debug checks on paths where an eSPI is invalid without compiled-in
support.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v3:
- New preparatory cleanup requested during review.
---
 xen/arch/arm/gic.c             |  5 ++++-
 xen/arch/arm/include/asm/irq.h | 11 -----------
 xen/arch/arm/vgic.c            |  4 ++--
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 078049e741..075e1d2c50 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -348,7 +348,10 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
         /* Reading IRQ will ACK it */
         irq = gic_hw_ops->read_irq();
 
-        if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) || is_espi(irq) )
+        ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(irq));
+
+        if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) ||
+             (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq)) )
         {
             isb();
             do_IRQ(regs, irq, is_fiq);
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
index e5aca17dcb..e14123a30a 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -718,8 +718,9 @@ struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
     unsigned int idx;
 
     ASSERT(irq >= NR_LOCAL_IRQS);
+    ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(irq));
 
-    if ( is_espi(irq) )
+    if ( IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq) )
     {
         unsigned int nr_spis = d->arch.vgic.nr_spis;
 
@@ -949,4 +950,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v, unsigned int rank, uint32_
  * indent-tabs-mode: nil
  * End:
  */
-
-- 
2.43.0


