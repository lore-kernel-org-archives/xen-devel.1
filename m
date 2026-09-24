Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BBDC98318
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 20:58:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433044.1653900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qWO-00068y-5Z; Thu, 24 Sep 2026 20:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433044.1653900; Thu, 24 Sep 2026 20:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qWO-00068i-0y; Thu, 24 Sep 2026 20:58:24 +0000
Received: by outflank-mailman (input) for mailman id 1433044;
 Thu, 24 Sep 2026 20:58:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x9qWM-0005t6-M1
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 20:58:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9qWM-00HWLS-2v
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 22:58:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab58ea4-8faa-0a2a0a5109dd-0a2a450bd730-44
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 22:58:22 +0200
Received: from [40.107.130.143]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab58eed-b7e8-0a2a450b0019-286b828f2f50-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 22:58:21 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by GV1PR03MB10503.eurprd03.prod.outlook.com
 (2603:10a6:150:16f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:58:20 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 20:58:20 +0000
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
 b=meGH4WxeuPVP4MAZTO7adCw6H91j2xa4eIsAQzrF2xGl/tMw7Qjx/HJcjphAZfqDdnkek+3cRtyr2AdyYAJhUR/tT4+n87F0kOMi/unpRimLCNTJnxNTygMwWbYKUg93RXzOdyRuPBGUK2EktcLI10TmkO60/HLWwk8qZA9RT2XPlESgQP7W7rPDXd05XtL2vuNOLbE8wF7P0k1ruRy7nez9vI61WPp0+Fdks8kBggziZAEy9GgtZBvo7KyqtVC3CENjHuZq65rahnBuuOI0aYQZaaPIsHRB6vAQyP1BVzXYaLcVd8enwUjoNYedFkhFOv0gqzT+Sr+AM6G7I5UW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1X45a1bjO90dQ/nHOuk0lZMguN6rIuX4USnlTBTDpU=;
 b=zQVmSuapbvtoL4ahaByiL+fpeya/INXk/QIsQvGO8Y9ub/N9yYhAP2wSpZKRQq2DDngxqnQ5Tvcsi9CF02+ayJQaklaN0Ml2ampIir6PN8PFPzC5/CJVdAHNJphUrj/BAU2l6ErDD4T9Kg6S2+/9dJnFgoJ2mW0wSriPVIai3FpoVyL5xS/E1VlggjY9a48nDRDTTHQrwcxKuY5iyeXW7H/QZga4nhTY2zoVd6QiDFO5LMcoy8+TFQ/qvZxZhi0+Ez1oyErI73JH4776fGQNMv9gFchASy9q7CYhjKwTmLIOL1S9or4yzLa1qedsmGOM5QchMUjaNMH5eeahIqR0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1X45a1bjO90dQ/nHOuk0lZMguN6rIuX4USnlTBTDpU=;
 b=uTMRvf0+yl9WAyAMOe9zEI6GuhObGerZiU3ZSlLN96KWuuCJ9McFOk8JJ6mmobPaC/QTkf0Hl1a4doF6P07ZH5HH25Te8jwMb10xWgFTAhQABFe0Ue6Cg/S7OpYJZNrPf1F97xOJS/XttsrfrdDH6GiZzzccbWOBjVWE3CpdZWE+S/01/r63SOq6QY9P9BcbzyKJE8GZMtAkrR+tZLnaBFhMGlBv3IQSPq45aVDoegM/s+I2J92jSgqhKCq84ifkiCgOKimQ9V6S/4XQYVgIcnnrrCwDqGLRagzNkicUp0wimSjLb+1kmzz6pckIkH/J15aXhilqkgCJCR/w01OHFg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 3/4] xen/arm: validate IRQs before descriptor lookup
Date: Thu, 24 Sep 2026 23:57:55 +0300
Message-ID: <1cbd9431b0cacc1406cc1716636a305ebe2b7ed2.1790160605.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: c63ba9f8-9213-4955-58bf-08df1a7e904a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/6T3SB/1OzZqAI2uTvkFUYH+52QjUY38IZtHUuliEZVPzic6gB+BzfFpIu+0OJQwcdZhofBwchkPySkQBkKTJyh0mquI2Srf8JxNgJ/BBCxWBFD6+BTUMfOfSiKvZV10ixl0Nu01Lw73MxNlE0bSxzfejFJVkem/2mVoM8OltL0se4LN4S1v6mjMS2UVlp0vD1FMA3WOhwbru5+Ye9H4wfQtIJGBhgAcCdQ9embEHDx2WQ5slI0R6/JvZ3M6/rt3fcvNPZmIjwdl3nTb5IXFca0vYIpl7ro7YXgwrI5zFsa16e4ouos4Mi0p5Zjzf70Ty96GPGwBnLYt+3cWkeMyKa/lETSMGd1w2PWfFMUYvEwgHlF0s5xetNcf6Qx0Mhydy0tgShxf5hFz75cBdrVIXOmGcakJR9447fdaemPZYDfvTySwI/Bsj+hzOO16N/okHfJpS0GgEaZSxKElgBGQtL36kzTJngU0Lb/VpHoAz91XVi7UgkaKZBWHf3ZfA1SHrMbKJFDUPeX5AtNs6ExxV7kLi2qrnnSVPMFcJKb/mn2BGdekWWsh++hKih0ATmunlE6nN5Xwca/k3o7uiCz84IWW5LMp91TFUPNuoLYPUb/FY52doXDilF8wDoko6UGSnbpkldY1DwjZZBhJnBC+gUtIuxOhThaNAhCaw8nBd4Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vJJHrM18Iq3R/uRcifIEnrLvgXfWSJ+/SqjfeArE4sOnxvA4EDvo1wevRArF?=
 =?us-ascii?Q?cbqf3PmZgB1fRQsloIj818Ro2v1VW6MvagLJt0HxT+cG792QpFDQiByJlEeC?=
 =?us-ascii?Q?g3rfx3aVBk/xT1RowW4KDIrvLN3PRnMvrrX+K1VbHqIQYkkoUlX5bUaIWb1i?=
 =?us-ascii?Q?IfWGVVhdH4haClMUpT/lTeEDKOiefiFL7jI8ydCD+z8wS205s4N1QG8ZlQAR?=
 =?us-ascii?Q?2qTI5PLUzy1gMwjleguAUcuU8mHglpM2brVzEQWfH1bj9t10TNzGyjPjtrnB?=
 =?us-ascii?Q?OwIJ5zVcDNvc8RHx9MNtgPMhxRITASFsMw3Xt9f7Jr+8MZwKFnXBLAgCP0HT?=
 =?us-ascii?Q?iG6XvwTsmgCHPTLaZHp+HFnIkBhhcub0VzUPdHiu029xxrCiR7//UDC/eG7/?=
 =?us-ascii?Q?vlUBwynJr4KrQZSW/Uyz2/XvkxYG0OtMDl8IbefllNTV5L1shDpPwqSVsg71?=
 =?us-ascii?Q?jSVhHgR7RCZxe1aXHVS+39cIyH3wwhusopBvNHrWIHxTN7l7mAnsvK1ZvNpV?=
 =?us-ascii?Q?FJfc1DQOm5DzRp8UtyExligoFSiXlDgI+HJJf1vP680W1wrwdicQo6ujpdJj?=
 =?us-ascii?Q?tMQPtJjlDwtUQa0daw/EIB/k7VvI4f6zv8qZIb2lCm8VvnIVnn7p475PRC2g?=
 =?us-ascii?Q?YJBQgbzoQXWdkPHxCrknvXoQ66dZ3UlHLnnwto9dvqn55lR+iVUkD4V3UKbF?=
 =?us-ascii?Q?kdSUV9xAmeqUkHyX+h7QRVbPFNslYk4UAzf7JZj6V4Fp1aUJiUjMaipznByK?=
 =?us-ascii?Q?6U3Y/ZlIWcMPisu2DUCuC7DGLw5pf6n7+o37U5xI7qJ8/ZgnsPd8XVetNtCq?=
 =?us-ascii?Q?+pqEHpVJTfVpMaVr3yRjfLfHw9ddkM5pCzE7uxFNrbQoLIh34QXjpjFqFeam?=
 =?us-ascii?Q?wluUoW2BFNH9Ze/H5eGGYnJKAX45cSfFDZbITgn7Nb0HlF/1mgC1o1QL5knA?=
 =?us-ascii?Q?a/YbjEZVfJI2QeXmqQrbADFHqvPIC3NrzxSj77IQ0tdy+ufisTjuR7376pOC?=
 =?us-ascii?Q?2koSW3MYskLPj3saC1WD6IZS68WUhoGhyL/qG8sMu1+IGqP1fci8mdBvVHop?=
 =?us-ascii?Q?eOCkjfQLqiJGsnxYGD868CyibTWor/9GRXljJB2+v8jwtXB+bm1Ve/3cyZnn?=
 =?us-ascii?Q?J7kog44gXiNRc8FVKXNmhaxnVtzD6N5HYF2Vd6DpvXpycxRAQlREit7/LbON?=
 =?us-ascii?Q?a4AaIP3LiQ2rLlqPyp4DqekWkmLICsgK1Y41J1qwmHkW4GMABf0tauw3Sl7T?=
 =?us-ascii?Q?N5xiFzNllNTXf24WveuARzGmWJtzVnamjMrWij6oBP4K3oEQSWa7bXgMIhei?=
 =?us-ascii?Q?3+jQ85RTLnuCzHv6h7T8Zx646S8dTvOHDTe/atlIOx1PKJSa1BrNlg4yb3Xt?=
 =?us-ascii?Q?Qb+l3U7QCTmWCGCkU6HtAM1Syu5XOhWD8mNhiBagP/Qd39xhZ3rfrBf924FD?=
 =?us-ascii?Q?uVYFewnwE7oMXzXfv7RFu7gcrthwpTqEocmf0bMqUlWrRn+03GZK34gFaD+X?=
 =?us-ascii?Q?3XlM3rY0YYF33gYZzMfg3Ova/3aeuSrnrxyrS25IWEBC1D+KKU/5A7NM39pO?=
 =?us-ascii?Q?4cy76CIaTr6259s7rYcf6K23REotPkITbZb5P3xR8X1yagQ4/pgLEAqDMwy6?=
 =?us-ascii?Q?Y0KEGdeG1Ppsc3sqF1OXPc+gvgOyuXoSUH07kUCwuBRY23aMs2gjc+ZdR7Tm?=
 =?us-ascii?Q?PVMSF5AmkhyDxw0H0gztebxcjj7WzdWMYCA7ogzp1df8pjRQOP37ZaN3x95p?=
 =?us-ascii?Q?RzzJDLGcWA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63ba9f8-9213-4955-58bf-08df1a7e904a
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 20:58:19.9926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpnoNm2mODLXOh8cXzFqM7EN3bqOT8tWJCR/Hv0B8Lg6ii0USaoShez3waoppJv1FvGkaB38060itjhM24RMow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10503
X-purgate-ID: tlsNG-42698a/1790283502-18AC89EA-79862BB6/0/0
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


