Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1238CA5FB1
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 16:55:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436604.1655292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBb6J-0003jK-79; Tue, 29 Sep 2026 16:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436604.1655292; Tue, 29 Sep 2026 16:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBb6J-0003j9-3j; Tue, 29 Sep 2026 16:54:43 +0000
Received: by outflank-mailman (input) for mailman id 1436604;
 Tue, 29 Sep 2026 16:54:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xBb6H-0003d2-TP
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:54:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBb6H-003jmP-A3
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:54:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abbed40-e002-0a2a0a5209dd-0a2a450b9de2-22
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:54:41 +0200
Received: from [52.101.83.93]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abbed50-b7e8-0a2a450b0019-3465535db6b0-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:54:41 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by DB4PR03MB8683.eurprd03.prod.outlook.com
 (2603:10a6:10:383::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 16:54:39 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 16:54:39 +0000
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
 b=xodWTRB5zmRAOLs+s1l44LjGA31qX7Cq2zr+vVTtjP26e6jLs+mNKxOxLQB9rjTovpK+fatunfrwdD8Rk3xScUnYqv3mXM0Uq34wx5FFrulO7QOndIWKhWt6TM4Vl8nXhfkMhBxNFSAQoM5GgnJfuHKwQgnVPFLSU1Y9bccLLIVaX+akqMG8PH6wV2MvqS9n/rXNdA4i7Bbc7sX353WLWof6cHdwdiNE5B1ya4knIA7xMZ4c0JJbbwGQs/8DbHbnAXNDQGGWaJ8k5fdTOBh95QzIT0D/uTYXRLgimhFR5Rv4w4n5tdwLhI/bTuoNtKaSPLGYYS4pvUMYOG9Lr9KpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1X45a1bjO90dQ/nHOuk0lZMguN6rIuX4USnlTBTDpU=;
 b=AD5D5HvyiDBFH9ObmHVZlfaMRPTTDfU3Og914MYjamABkyewZK/+oHQnQY44Za3JlXUYN5Q7UcjBuFHRAZTYI8pm85/lxURlXAABMwT6iWdBu8rWgRSEZCen6lY+3LqxIfantEousM77W79Hm2H0Mp6dc2QqOFyOBxkMz+RcFsUvgua1hdeadnkU2c2g62y9S+Be0OQtdLHpnji76OGszg2iSsXA6IDB+1KveZQITdPoq2bgwHFrmxfdbA9l7pnYromkRyJQ/T3XtXFCy/DkjDkhPzuKbKONEUh4RP4DrzNZx36xAj2uFuVPjthxVjqjZUDghiXRDUB0k638BK5Tgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1X45a1bjO90dQ/nHOuk0lZMguN6rIuX4USnlTBTDpU=;
 b=nvkNB3jnEhNrCHa+aswPWW8AaXC0QLbzZ+Wx2WgABri4b69OCrZFh3GthsJ7X3LJj2HBoreA/NGKtIQTBCFDjo1DFjvSer1AcDZ7i/jmwLSgaLCs1qAfjuDrqWCOI5SGhbbJikSswuG1W1rmrUTZWfd3C0pOrYGg/Gb2EBsJoUKxQw9neX/pGvfv2VJ0xc+s8GlIQ4VSTK4gX3jGvklW3z0pEQ/4h87tN+e2I/nx9Ftz51uwQFkIPKj58Xr7BL66ljwY/S21AvzWvdzbk9CDIBvzmh2lT2wNN8XSwCwyrXqm5N/TAB3Z9TscuK6z09RBFewGmJGXSYMjR+RhEgX9hw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 3/4] xen/arm: validate IRQs before descriptor lookup
Date: Tue, 29 Sep 2026 19:54:11 +0300
Message-ID: <a1a57eb8584f51bbdb11b157b7f8370ac9b45fc0.1790699282.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790699282.git.mykola_kvach@epam.com>
References: <cover.1790699282.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIUP296CA0096.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35c::10) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|DB4PR03MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 73995b5d-8f9f-4680-3658-08df1e4a59a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WYuD0cfD7cZj96i+sDAvkEhy27OZQJ3t451t/EaXJWXKBWKc0kaNIdzTASRptWb+PPRwMRZbMeqlypCDUnitzCAKEmGCIcieXgbNOPp15Btymu86RrbpW/56w4ZJ0xsXzGToVJ9nFMpMllgwiWXqYvVzA2ty4tCgGl/GZAqU6VDMjSqYzUSPnG7r0+IX+7ghVYmrnENFwnW6ljAlawOIl6psZvKD4V9xXYEH5+jkask4lDjbSJFjUpYY9pimqmne4Bx7n43/oBRorybsglw7WDA/TQ5osrekIjzQfxeiA91LEH6PlgPqQNye7EBsIsmCcx95M2f62BRVF74N0tg+xNtR/2G2uGMzgnz2WMOg6ngXVt9yzzkj9nYUQHSm9Y4JTtVRgCFl+USlTN2KfKXgyAFy/NY8gnjVD9Rc8rQlzporirNK2P9wvL7c7wNHAWcAILAjVEyp0kdzQla6InpICqLAW43cIq0iHRak3NECeS3HBFL/tbkOZKUwfKYIN368Ff1EbP/qp+EtfqTQcHAPjllDPrqW8VS5qmrVYZOlNsWn5v/COi8U9Gpwzpg9m3sc+gNpRyNa04z44X5g0BWKsQM804ypMHIDqDjAEMaAG0/hNtnDOfewNL57MVIohtRYTEvWPrt8zv1yoOMwigVpPxouUgbyzTTCt2ybfG0lNq4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cDaJh6qbX6LhYZY4ZKpGA7tZD4jNmGanVKVOiYg4B7/NOLPQkzby0ptk5wLo?=
 =?us-ascii?Q?VvPgMGhoiZoQcE5wO3cjg7OfAJ8csKUoOu8J1hA1SdtADS5762R1IDfsUjJ3?=
 =?us-ascii?Q?j0XUfJyfg5wr4Qb29ODF9kfMLipEQVmuuTUWwCLxlBuoFeY8a+v9C8WudHWc?=
 =?us-ascii?Q?h8RilGGSEzR5YCzn7gSIsQNrmhNpjYP6Wjs6k+6a7fhyNIkY45vJvXnhJRCa?=
 =?us-ascii?Q?vY+XC5jgAdS+ZbRZx/UA1NcDpYhezmp9BgA89SbeM6f9GF39wYpHnaIGvoYm?=
 =?us-ascii?Q?sf55xGmEZOC/Uqc1TKkQZVtHR5tdkmxfTPn0hbllljCNn/sBUzAV4tIJzr5z?=
 =?us-ascii?Q?vHpzl8IIYNKVb/4qn3YxHPGBPO+p0kcfP9Ra4R3BOAXz+NPdK5/7fM43iaXl?=
 =?us-ascii?Q?3KafjOSbEJJhXto3PkS6N1bc+/NEbFYH6DpMqx8V0j+mt686NKa3aKXdkvw8?=
 =?us-ascii?Q?/jJncr8sH41CnurSEltmPbIQzq2033Z7JMwBjf5+gVo5q5AEaqSQ1M4bdD5D?=
 =?us-ascii?Q?IHNZ2P/jY8BnXU9CjEHm1vLplfNrq8yvFmnv+pYPZZvNNoqLaZmGiGDRCbRX?=
 =?us-ascii?Q?gzo8REWoaqRAKkgf/PcqAFQb87RZCx4HVsm78CqwluU2DAA/3e1WLKv61Y2G?=
 =?us-ascii?Q?LV1NTMUXTFe+vtnE0sqft6t7ClepfQQC4/inJR/R3DLgtHQv54AT/ZzdWNYA?=
 =?us-ascii?Q?umAyzQfdnP/T/H66oSvtgBw9RZV1HgOPMg1LjGhXu4Rnu1cx5KPGn/nNtDI2?=
 =?us-ascii?Q?vhCGw+F7vcDd3Z26pPt+dE26vkCpo8G056+AeAZuXQU3NWxlzrYF3afVLDFJ?=
 =?us-ascii?Q?O+k/M2LshVFduK4c3yiWwUsiGr5J2nu+PGMH1sjGtI5CFvhawFrdUPmmrzfv?=
 =?us-ascii?Q?Mg/+o+QrO7btjPxhUvxA+Y0GdakTsUc9jiVgDTaDrlCzSj1evWl0jz9MFU8L?=
 =?us-ascii?Q?Pi0FVMyjpDvGw8Qo8VHLPe64rCrL0oHEgAnvsJykSeHYZxdu386iomU5XdMQ?=
 =?us-ascii?Q?Gyli6AsNQgjgFka2LRmLAB5Sl/iBlkmz8lHl1N/ywVyz3dKq8VpLE20CNiKL?=
 =?us-ascii?Q?sJPpC6Pg+nyB5ZY4bnwwateBDSMXnaRXHV/NR3/6FkgRgQOI2zgDDLs7UniS?=
 =?us-ascii?Q?B4ubxdiEn7rM00X3Sw5hgdr+5lkBv55vB0A//3al4ztUs5V58pE5yP27FQuq?=
 =?us-ascii?Q?/H3WwEyVVJrE+flECOlsV1edVEWvEtKBvgR0mJmpyxhgEmLXSEg3fu99vtCc?=
 =?us-ascii?Q?zSueae6K9dNkqhmc3ccyxXhFRQ2b8IKyyqM8cFDRCAgM/nWmWdfbrKX8zkWX?=
 =?us-ascii?Q?Ngj9ymigAWX9b2+iNZ1XhLKqT22fTVo2U7RLlulCcDXRaZ4FCsIA+eVEnVYW?=
 =?us-ascii?Q?Gl+SkapDYFRUKK7k6A2fssheR4OLF1i6MkvqcT8cXkRP5H+7UcJO1s42PKG5?=
 =?us-ascii?Q?kOzNFeVas8r/OBrp0JOvR5vWpN08oWiy/487juhUbDyKVSl/gf5o35SZLcmC?=
 =?us-ascii?Q?A6oWyw/LSR20yPVieqZ3fAYSULHvJLo+vG+Ifnh/uhUSsa5OFrBU3rDfD1gI?=
 =?us-ascii?Q?oHvQLUzbINEqK2+KOusX1CZKTKgzgLSX+HNEDKMtigS7suQHzr2mj8hFLrwB?=
 =?us-ascii?Q?ftK656DmdIN3hfRFHzwUYY4NWMFhgrr2hdU91PW1sGY9576Pn56sIBhGlYHC?=
 =?us-ascii?Q?YsARlkXuJxnij7HVmfnUqV8geTkeb/XOp0j8homGSstkRojrM9oIAViOvqsL?=
 =?us-ascii?Q?i8XVfvmDQA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73995b5d-8f9f-4680-3658-08df1e4a59a7
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:54:39.1414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ny0rmY+BKd/xxgXsrLNqpKWHQ3pTEJsoCQFfME4ssxrxswER6Y1aZu/XKjOHMdNUYaKFHCN/MkHAbOR5dOw8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8683
X-purgate-ID: tlsNG-42698a/1790700881-1B2DC9EA-AB596E80/0/0
X-purgate-type: clean
X-purgate-size: 3693

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

Use the same descriptor range check in irq_set_spi_type() and the
assertion in __irq_to_desc() to keep them in sync. Log the IRQ number
when setup_irq() rejects an invalid line.

Fixes: 98f7060b9ed5 ("xen/arm/irq: add handling for IRQs in the eSPI range")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v4:
- Share irq_has_desc() with the assertion in __irq_to_desc().
- Log invalid IRQs rejected by setup_irq().
- Drop the unrelated blank line removal.

Changes in v3:
- Add the requested bound assertion and retain the SPI-only comment.

Changes in v2:
- Validate descriptor-backed ranges in irq_set_spi_type().
- Validate implemented GIC lines in setup_irq().
- Preserve is_espi() validation with CONFIG_GICV3_ESPI disabled.
---
 xen/arch/arm/irq.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 73e58a5108..8d3517e761 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -85,6 +85,12 @@ static int __init init_espi_data(void)
 
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
 
+static bool irq_has_desc(unsigned int irq)
+{
+    return irq < NR_IRQS ||
+           (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
+}
+
 struct irq_desc *__irq_to_desc(unsigned int irq)
 {
     if ( irq < NR_LOCAL_IRQS )
@@ -95,6 +101,8 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
         return espi_to_desc(irq);
 #endif
 
+    ASSERT(irq_has_desc(irq));
+
     return &irq_desc[irq-NR_LOCAL_IRQS];
 }
 
@@ -416,6 +424,12 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
     struct irq_desc *desc;
     bool disabled;
 
+    if ( !gic_is_valid_line(irq) )
+    {
+        printk(XENLOG_ERR "Cannot set up IRQ %u: invalid GIC interrupt\n", irq);
+        return -EINVAL;
+    }
+
     desc = irq_to_desc(irq);
 
     spin_lock_irqsave(&desc->lock, flags);
@@ -647,13 +661,21 @@ static bool irq_validate_new_type(unsigned int curr, unsigned int new)
 int irq_set_spi_type(unsigned int spi, unsigned int type)
 {
     unsigned long flags;
-    struct irq_desc *desc = irq_to_desc(spi);
+    struct irq_desc *desc;
     int ret = -EBUSY;
 
-    /* This function should not be used for other than SPIs */
-    if ( spi < NR_LOCAL_IRQS )
+    /*
+     * This function should not be used for other than SPIs.
+     *
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
2.53.0


