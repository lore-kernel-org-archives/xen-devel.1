Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18638C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 18:39:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387758.1628995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtUu0-00044K-6N; Mon, 10 Aug 2026 18:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387758.1628995; Mon, 10 Aug 2026 18:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtUu0-00044A-3E; Mon, 10 Aug 2026 18:39:12 +0000
Received: by outflank-mailman (input) for mailman id 1387758;
 Mon, 10 Aug 2026 18:39:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wtUty-0003vl-AR
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:39:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtUtx-004GdX-Nh
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 20:39:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a7a1ab1-8faa-0a2a0a5109dd-0a2a450cdb52-10
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 20:39:09 +0200
Received: from [52.101.70.108]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a7a1acd-f479-0a2a450c0019-3465466c25df-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 20:39:09 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by GVXPR03MB11092.eurprd03.prod.outlook.com (2603:10a6:150:2a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:39:07 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 18:39:07 +0000
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
 b=MkuD/4uC1xz1LgDqjFjLm9BB+pFe8iDtLQSjSZXM2QWKDdVM1RdmJMsOBx8vOx8W4GfD5iMXOAer1k9NOoqEErYMO54CcCiWJMG8AyfLOvLBIAVIwLg8U3/2NutkHV/lGh0jTDw0Uy61O2GOKa/WDoD3YuhHRcoEB9jAhyMdOq/ivqxlty33oAfCvMkd1NUzUzaEPSEsToSib+olYEYCDN4WQ/G63BAVmj2CSIhUlKJimw2Q40du4oL8dn4jmGrZU8WCsz9vlnNpCiRsPzT2wCVhoHo++Nn742Q28A5kkeKxqqUAsuvR6iHXVKUvFsA3z32VRIhELKQQF2j2SiFUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVyUwzxHfI4tTSVlImEGxF+daEm0IvBED5qt0xYcoeM=;
 b=a1lvWneZW2ld6z2L4txc4Av537scTG3wBQ0HEn3pWvxgd21Dts0/lp4zJ17yWCjMwMWiWYTvJsVQuQNIL8A3dFtVFsOKXYsoSaJ3g03qv+/IabUMIWdE3+lKzizXSB4QT4jQBfaFNtrxrD+LAWIpzmy1Erdke0TYXInfTNFD68eAQj/Ey9XLeCvZeA6MffSexNZiKpPNd/io8YyLzjq6+DQ8rU4Yvof8dfXRSd90LaWwhP/wqAK7pOZYI/SWWyQHpHVz9Y7RjdqCskhXzPB4yEo/kFjeNLVtrAy5R4nmu6uYQJpG3t6A6H5wJ/dfPto7yuoSEouQtRanPawcc0qUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVyUwzxHfI4tTSVlImEGxF+daEm0IvBED5qt0xYcoeM=;
 b=piJhzkEDpo90vyz5ZbtXC9IGOoBH5okMIm4+4GYVqeDe7z1QXYmZBwWbwXzr0DQl+XtjM3sWwXLWd1596rNW/yhQqYAZ+AfbWCqokq7c1PyJfGF9LsCqxNUQr5SaRL/HMt+kH7ueE7EkwAkrASNUcfDAvRAmOBwP9GJXDOVfJ0VYIWdaMC+2MinsxDYN/hscnD7HQ3DHc43szvh5MIeGvbpgZCpwilVyhxNf8WXQ/t5diIuI5r8DUoI64GAl01dIvomheqne0I1XZyHq+dlPyf4vXCfDKoawKc7lWUVz3LbI4uOSbHFMl2D4Vj82SviVEuCTPMDBzc4UFvJLWCSCEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/3] xen/arm: validate IRQs before descriptor lookup
Date: Mon, 10 Aug 2026 21:38:45 +0300
Message-ID: <271952244ae71ade885b3619fe161ed4f47777fa.1786385827.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786385827.git.mykola_kvach@epam.com>
References: <cover.1786385827.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|GVXPR03MB11092:EE_
X-MS-Office365-Filtering-Correlation-Id: 79716599-33e7-4502-41eb-08def70ea94a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	DTnUM2/yO4tjM4VCe3opWtzRa8++oAhrGjQfzYkLtdJjUPPqLBX90BF7HK7JUwdwZbmg53ENtQnt+r0fBKZWOn2SrLu33aEp8zNxz0hzgeUo4VBlUQz4t9ip8VGxTfZNU33wOp9SOlgpJlHIbpWUP0Q4iTucTim2d0hK4ZbOzexE5P7cOuTBI/UBKhFc9vR7AyNACVSDrT/0XPaPUVrCim+CkeRxETL+lfU0i1At8lMJTC7OPYJ8mNGC6muf7NkxIgVwmNu8nxU78af93OkOcXHGr4x2sQ5be/Y4Jn+6nCT15Y+pWNOuOIM3FN2XwRUDME8JfZMbL35nFr+OAMnSdHGvxka7kAhBBGKmz/0EClXD6iZnXJGn1cFogFwMEqRxX6NkMzQaFaU1fq6JGEtz+kiZupNQHCYuJtmZuWNUzSmcmIwiQs2FCh0JfXFYsBcP/JiQadRSIciADhLDU3kHemWJVXFFO/aZa1edAfT4+dA7ui0QbXmDCfNNCkDuFCH+8tA3viBcYcI1t7uGpM/JX/DtMzEGC9V2rw2kqkTd6Av02OM6sDBOt/N4F9OiQv7pbnhyfZ8HTouv6g7bgWCO1CCfSQNwn7krloCQMGsP8+wKSa/UfBZ56kjjjbFG/2TNmHRBIoUoTYHBHW6oe5W7S++jj4uyWQnMrPGspG1rMTQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8TwRj4t0Dm316TSSixjbA2N+QImoV6fuL2ASZC2X79mr52JBUeIsygCCsLTk?=
 =?us-ascii?Q?j2epDIzrZivut/lnMXwjURk4TAyJshZOKi5fHokUfPMvoVdr5+KzLSdAw7ML?=
 =?us-ascii?Q?vNv5McFPJk/fFUc1x3bDU0kQUYrHKsp2LeJnmqE+Pqt9wzAxsTtPf8UO/j87?=
 =?us-ascii?Q?lp6L7cK2TnLyX34EuejsJnmC9YnHsYGulngsuRqMNn4z6ogYasHPKJwCCADM?=
 =?us-ascii?Q?S74bHXA/OCeexVYurTIGdtN65CKqWCdXhqYlG0mfmllJCRRTTWxquhHvQ8Sf?=
 =?us-ascii?Q?1Vsr0FdYVvJaBxXsaFh6E9hr9qLAiSF+Nw1S20HAzBevjRaCrbFSuh1Wc3Ps?=
 =?us-ascii?Q?pE49w0E0Dn9LlUwLWDWB2+ZDBvp+4hdmSf1HS2EXxkBDfchFEAnTH8FKw8zP?=
 =?us-ascii?Q?S/Xhu4FIZ6WfWnBdfJo0Ff71f0RnhevYj4z6AbXTJWS9o1vbnRem8B0HD4jv?=
 =?us-ascii?Q?6511hXNWoNMhwqYbYkBQ2lUK+R0dSLOat8eNzYfAom7Eo/K7B1BGWSOIiwZ0?=
 =?us-ascii?Q?8NHRPgyf6hOJlHMhZZRfqn1RDNxkhUuDE9lQ0NaBHZTHAPcUGCFqVAgdA9V2?=
 =?us-ascii?Q?mOHb7EXxUjYSnG+14o8eO3mNQYpjMCytBAi81vMl1MqRhXVi0FwO5RMcdK11?=
 =?us-ascii?Q?WVDOXmvsh6s+XJu3jYqeWVEfVxV/Hwd2ArRr1YbQ2D+uxBwZrXNXL8sIZdfr?=
 =?us-ascii?Q?+G8he6vuy2o+PHBbLYAnzkejK1I/31nno6df7GOdxquAxJgHWzE2NPoTDr82?=
 =?us-ascii?Q?UZFD/vOg3ha8LjT/MNfz1cuOFBOcKLExXp7s8PddpSJzcQ9kpE4UiE453I1x?=
 =?us-ascii?Q?XgVesgdVVG9iqvagS9xhofu7b7NxVJMLR8fihhPRzO3Ca94gtBMtWeEJF7Ws?=
 =?us-ascii?Q?GQfNfUuFTn4vk31yGcViRBu3mg0e3i7x20qfw/i4zxYsvaI85GwqIVPfm20z?=
 =?us-ascii?Q?cI+vRo5kG+i5Gw9tIWFGEkd4FBrb6Y9Qc8EZ63upfWhpezykNApG/uCQcOJI?=
 =?us-ascii?Q?PfPcUjxTCJPikQDcrEJ8M4mpP53e1zBAwJsuwVCWawZ/eq0rMVjJO8o4DaC4?=
 =?us-ascii?Q?isBx8vPM1RQxYcJIt2+yj1xgQR1V/F6yR2+mSDXjMVGJLWra+r8cGLX+67gH?=
 =?us-ascii?Q?x08c2ryYStJsH6SWp9TxHNX/nNKU4SkDk7E6CSGwY/jZGbTTUuTkSrtOguAu?=
 =?us-ascii?Q?40kUrPsMVgkTgVGRJRrfx9QVOnVt2ivimUL6nIKEFPDT4HQnuIh/VkPe/4DR?=
 =?us-ascii?Q?RnYzWqJn+DcVQeVa2QResrsKTQZK9FAWaWXxwQIgjZG7CyPbe5J4cWJHm4Lq?=
 =?us-ascii?Q?2gt5z/L7k/cUP2Ck1/w8Snw9+odWmlG7Iqo7lvqPj0el10GcAEIgh1/pJoF0?=
 =?us-ascii?Q?khxh+O+QzaNWj76g9Quzt3sZKs9/GYX3K0dG1dftlg4p56MfvMB3d0xAnbuX?=
 =?us-ascii?Q?TvDOhVhE33r9QfER6LSf6qkOwXdjdiJhBg0F3BN4PxAJO36PZZ5itznjR2xE?=
 =?us-ascii?Q?BymYBkYjnNiQ/6oiIKNjC7dQT865siQaUNWWEgKmRcKY2nK/RdiA2CZwjAJg?=
 =?us-ascii?Q?2ZyZ1oRp8niZ2T0oYuonzmaWAPOnKjMgZ2fnEWXj5ac55tzfqw2mianJ+79t?=
 =?us-ascii?Q?1GZf9a5I6FaW4sNOwHNuHNnA/YboPFybqLLGrKHEniQtvo08tkMvOVhnsRie?=
 =?us-ascii?Q?Zm521yO3L1FmmcVz6k1XwvRmh2j+UfWQHQU/VLnMg0N3uy+vDiCNH+3XnV7w?=
 =?us-ascii?Q?D1+f4dbmdw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79716599-33e7-4502-41eb-08def70ea94a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:39:07.6512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pmxpi/7tZS1iZXG9ZIIbY5b8dD1xyie2gBhHlftMJYOGWGnj1ARdYFPeGvqXZxQqO1mbWlQvOAG+AxHor37qhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11092
X-purgate-ID: tlsNG-d25034/1786387149-00ACCA5B-B832265C/0/0
X-purgate-type: clean
X-purgate-size: 3677

GICv3 eSPI support makes nr_irqs span the architectural INTID namespace
through ESPI_MAX_INTID, but descriptor storage is sparse. local_irq_desc[]
and irq_desc[] cover INTIDs below NR_IRQS, while espi_desc[] covers eSPIs.
INTIDs 1024 through 4095 have no backing descriptors.

Validation based only on nr_irqs accepts an INTID in this gap.
__irq_to_desc() then indexes beyond irq_desc[], and callers may lock or
update unrelated Xen memory.

Reject INTIDs that the GIC reports as unimplemented in setup_irq() before
looking up a descriptor. irq_set_spi_type() can run before the implemented
GIC line counts are available, so validate descriptor-backed ranges there
before looking up a descriptor.

Call is_espi() unconditionally in __irq_to_desc() and provide an
espi_to_desc() stub when eSPI support is disabled. This preserves the
is_espi() debug check for eSPI-range INTIDs when support is disabled.

Fixes: 98f7060b9ed5 ("xen/arm/irq: add handling for IRQs in the eSPI range")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- Validate descriptor-backed ranges in irq_set_spi_type().
- Validate implemented GIC lines in setup_irq().
- Preserve is_espi() validation with CONFIG_GICV3_ESPI disabled.
---
 xen/arch/arm/irq.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 73e58a5108..0f5d3496bf 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -23,6 +23,12 @@ const unsigned int nr_irqs = IS_ENABLED(CONFIG_GICV3_ESPI) ?
                                         (ESPI_MAX_INTID + 1) :
                                         NR_IRQS;
 
+static bool irq_has_desc(unsigned int irq)
+{
+    return irq < NR_IRQS ||
+           (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
+}
+
 static unsigned int local_irqs_type[NR_LOCAL_IRQS];
 static DEFINE_SPINLOCK(local_irqs_type_lock);
 
@@ -77,6 +83,12 @@ static int __init init_espi_data(void)
 }
 #else
 
+static struct irq_desc *espi_to_desc(unsigned int irq)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+
 static int __init init_espi_data(void)
 {
     return 0;
@@ -90,10 +102,8 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
     if ( irq < NR_LOCAL_IRQS )
         return &this_cpu(local_irq_desc)[irq];
 
-#ifdef CONFIG_GICV3_ESPI
     if ( is_espi(irq) )
         return espi_to_desc(irq);
-#endif
 
     return &irq_desc[irq-NR_LOCAL_IRQS];
 }
@@ -416,6 +426,9 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
     struct irq_desc *desc;
     bool disabled;
 
+    if ( !gic_is_valid_line(irq) )
+        return -EINVAL;
+
     desc = irq_to_desc(irq);
 
     spin_lock_irqsave(&desc->lock, flags);
@@ -647,13 +660,19 @@ static bool irq_validate_new_type(unsigned int curr, unsigned int new)
 int irq_set_spi_type(unsigned int spi, unsigned int type)
 {
     unsigned long flags;
-    struct irq_desc *desc = irq_to_desc(spi);
+    struct irq_desc *desc;
     int ret = -EBUSY;
 
-    /* This function should not be used for other than SPIs */
-    if ( spi < NR_LOCAL_IRQS )
+    /*
+     * The implemented GIC line counts are not available when early
+     * callers configure IRQ types. Check descriptor storage here; setup_irq()
+     * validates the implemented line before the interrupt is used.
+     */
+    if ( spi < NR_LOCAL_IRQS || !irq_has_desc(spi) )
         return -EINVAL;
 
+    desc = irq_to_desc(spi);
+
     spin_lock_irqsave(&desc->lock, flags);
 
     if ( !irq_validate_new_type(desc->arch.type, type) )
-- 
2.43.0


