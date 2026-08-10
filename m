Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7599C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 18:39:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387759.1629005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtUu1-0004HA-D6; Mon, 10 Aug 2026 18:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387759.1629005; Mon, 10 Aug 2026 18:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtUu1-0004H1-AH; Mon, 10 Aug 2026 18:39:13 +0000
Received: by outflank-mailman (input) for mailman id 1387759;
 Mon, 10 Aug 2026 18:39:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wtUtz-00043z-Tb
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:39:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtUtz-001Qiz-9s
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 20:39:11 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a7a1a97-bab6-0a2a0a5309dd-0a2a4506e8ae-28
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 20:39:11 +0200
Received: from [40.107.162.106]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a7a1ace-195a-0a2a45060019-286ba26ae5de-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 20:39:11 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by GVXPR03MB11092.eurprd03.prod.outlook.com (2603:10a6:150:2a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:39:09 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 18:39:09 +0000
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
 b=Q5uBXhzZOluqHZr0P63zd2MnW5MM1HybjByZYGeEQdeVkyWY0vTsEjGbHm3nyJOBdXm5eGKZ4O9VptcC7UF50wGYPDvtDIywmSS2djXXY2/QUdu6XlGspGkE9Q9LxLMM+DCkQ1NnjZE7PzNITArbjH5Btp/U3ZRXNxcvwlVxpM63sLZ7ppSkrreQkmVhH0IJocjqXgIlEvgC6IBYk2NCymoMGGhSQzdqkc58D7IwN6S5cB9vwDtlLPmZSO2fNakfGf8bhC5DW0OgcboVoDPimEbNucdpcj3HkcOrOlnB7Xgp/jU5muGz8tYO1yxLTV7En8+MvgWHhAz1rSSgYkxocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oS5+tMpm/5iXbHipLKgLe69zKs89CKb5K72EOJFaZw=;
 b=m7QzPTf1vCaIA+54KwKVqE0+fOyBelUiQ0wdpRCjmREd3E662KF29u+zkjy2dR5OgYf54WCDOz/ytpdG8FUUkAbvXLsCRF5uXwMIQkjfcd7ZCyd2W++UnTqe9BYO8MEjg1sbmPYtf8aY5GSMjW6lXDbAvc+qBBMTg1+aAL7FOBhNe1nj8lLt7EeRXc+v4UW8ENkcAam5Y0HErWOjic5jGmL3Io/dfFId+2DP1bNh5tmUJd47/TUKYY8mm1AwyGQnpj0HIyeYyC2OW7n67hVffbBBVVr5MNPhg15QRRCERfQZxZI4th1JUdx9k1r0jxszBfyktpr7MBvT5SKlc8rhIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oS5+tMpm/5iXbHipLKgLe69zKs89CKb5K72EOJFaZw=;
 b=DRg3NnZs4JflfK+CJPbmb3WoQP9Ce8g6/0xsgoEBm9CBUvc9dFcKzxqo2/ntLlZ0f1TvEoFkqAm1I8HDKKlGMHNjBt2QYbEHez6ns+oom0OnOm1lCr3lIpv2vzYNxX4tVLW4zQp+1Jh1FA/8gQDLPiwcdNQuyitxhFIEpGvZxw7zcaDglUt4aT13O6dMcr4Z9FSQOZGzi8ag/zRm5L/gg+wyEJMxxJJlexkrT9jdn6L68lN1LnEYWJxBL/DzT8w5QIYDCQSJqG3lY7NgPfSXCeUmH0ouNjsLKOYqQSgbTP1Lpdjm6BkjXZk9fXoBua+oeJaCPnuF8rM50lQCsJLlKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/3] xen/arm: vgic: free eSPIs using the bitmap index
Date: Mon, 10 Aug 2026 21:38:46 +0300
Message-ID: <cba18900fa18730e717ac736b4cb4b5826bf6d9a.1786385827.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 45e6ca56-31ff-4682-4be0-08def70eaa60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ypElvmTH0i4qLpafa/XnfNhc3Usilr1pAn27RJImdMSJ8GMjgA+GWl7BCy+U3jK/Vp2eaZ4hcJn+a9Xm5Llr2tHjXLq1UpwzT5+78X6HFeAWN6WSUZfOWT/fosy9tL9QP56bPtynyQQxrrANYzckQsnGW0ZNbMUwn+2GQvExzM8B9WLVeoFCwxkpU6DXMEDpxerzuKNwwxNoZL75ltS9KaVyv8wMlhZd4i/bOIL4KdY9s8Zlk20ruKHCLYjcm96oxVGGsli2CjIOHukKkSVyW7GKFDxCuBbHB3KoXvlfirx0s30qtHLIX0+zzJsVzXyHUV5YRdgrc896Kjcl1eLEmajPAYu7GIjrMlkJeKGMd7U2yOt0qEuWHo4lwpI9okzHc6NTbnCOYz8+Z87Dl6JDbH8kvBAwAZIYYHX5dyiRlkiopMsp3j+Rzrdod+laQH3aFdgXoxyNN74Pzu9kjcAG1ktYjFzMzQFsWo+h26/dMhinvvB4DJQ+SDUHQOskSXWIcgvCffe88qUFI429ud7i7MF/6qyd1VVPCQLU3JvqeKOPEHZ7yOG6yJRxRMpiSazM18S8JeYcNxPabZeLKGTrueazyW6AGx76+tiq0uUCm714gbUIHqY9rd42TmT2NYufem6s1Rbcenw18PuCKi+9izi2Q/W637VF2nWonsk9U5w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UBAFgskfUvGkIrThajlleE2H9fnWTdt1G/nKVeMim5h/G+ovpRyARQJddViC?=
 =?us-ascii?Q?W5cPeVjyBjx/vwOblKlgvk1yVP7wgWTlNBAK562xs5CtWczKBntafvPy0i+p?=
 =?us-ascii?Q?GWR9rGtyK5N+os3wB524WZXFz5OGgSK/DkF356fYdrKU3qrQY/S36PxjbNrc?=
 =?us-ascii?Q?yHKEAflp3nYZR0YIQBBvAw5u8+7qk4lB5Hs45K8neV68/kB9Xp7f22dgfkF5?=
 =?us-ascii?Q?E5ys3MtK8YrTcIqPexM3yT8qgGRZ4V5PNtzZpesjtAsP48yACA4mS5PYfUMF?=
 =?us-ascii?Q?ytvakTFXbtcuU8vYvGVAlARsoNBtDMRCl7f98kuxIyfB+xhJe6PcwUSSiv+e?=
 =?us-ascii?Q?zyjglgIDaQWFZ7OtcYTMAHCfIAcPRgkBTfALAVbGXH/t6CIgyVl24LVE3aIQ?=
 =?us-ascii?Q?pHPAyODG+jS2IFnwlOLvbkCoGGoX2a3qtSju+Gn6yR8foIj8d6SbpZQ0Valx?=
 =?us-ascii?Q?G0OF7d083jve7LB03rgtGYmmaeKRYuBGHXs+hE0k9b/FAsg/7CRIDrnDuF1G?=
 =?us-ascii?Q?gx5KIvxSnu2+DJTvQC/qXvp1NqESWhXQf9agJs94jBzC3ndX1X9t5RmFoGNZ?=
 =?us-ascii?Q?+IJOeoiTkV7n6W023ML39rXYhhoeVW4SYeAfS1fNJdcCoEcAXB+EfjIbeBnG?=
 =?us-ascii?Q?tqHaO+IjVaWE0Zkq31vLNW3n0WNO3Kd67QOQpgqS7FMvBKtzBC3cAoFhzptJ?=
 =?us-ascii?Q?p7IfOenkTxvvWfRRUI1D5y41iFH6Caak4Jzvq4Jq9yt5buaeFQQHbGKj0kMh?=
 =?us-ascii?Q?dbmmEqeSabgZOxr+G9Da802V9dg7IeTu/AsxnU/qWQ28Ny1FRov+l5AWNTg+?=
 =?us-ascii?Q?5tZmQGsOgHej9zeqOtx6MMdJYoJFqd1Mpp4bIEG96yPs+roxc9R18J++aCJV?=
 =?us-ascii?Q?Tt0GnEAkFesX78wkh0ucrXij+oTgwzn0x2pHYaZIYH35QBP4LU3VId65CqR4?=
 =?us-ascii?Q?Y9anxqBFrCe7PbrQ6CDtuXj7O/OoO3jI6elg8kDihgyLk+qrD7QLLWUogYvr?=
 =?us-ascii?Q?fQpWfn0DgN6txKfdhfKLHswEtls55gIF9dbNbEwpFE2teUVXD4pHRQPHn3+c?=
 =?us-ascii?Q?/Wa9sSLuV0qcP+FQku4DA3V/7SDhnxPIx8Qc28/AIVsqDfq7lqYCO2ptRGE4?=
 =?us-ascii?Q?7TbL75uIrgK8LdblPOgG/ZtIUsDXV5z6wFDYFcFwfS194KXKnd/kQB9VX2re?=
 =?us-ascii?Q?gsw0s3cuXWpwoLkTeBVNP2MHWIhYFgQS6LslvVrkJnBkfVc+4HREpHjwBUhq?=
 =?us-ascii?Q?cKSiHnbOBmf6EIxPDeMsZuR5zHLPbhGLVOg1v+HHCCxipVsuW8TdgYWp4N4P?=
 =?us-ascii?Q?z4O/75Tmoy59GX8frO9ksPYsm9uwaJRLSTbskzBS4padX//0vErTtYZ0DsqJ?=
 =?us-ascii?Q?Wur/+qTAhJHuJVD+d9YDHPxt7GehdHH4U+wdmCXymeIVOThyOBvgZBeZ5Bm7?=
 =?us-ascii?Q?60aK3WkP92kX0QzmM8U34CaPBaCnBSJbPQhXVU082oHs/8+trTTZFwkBzFmi?=
 =?us-ascii?Q?ZvemAX3L/GCM3bEF4dEvMS2oBgYLJQrGhsiSsD1E1VJ0VBp1vMc4MflIu/ie?=
 =?us-ascii?Q?EraCPM1XWNiniPbAIjQe9Fe/KeT9O0ADgXL3gs9Up1Qf/7wPtNopecH0Cf2T?=
 =?us-ascii?Q?rgdmHTlcpmpwvFogEJ4u3WtMHKt/SM84Cr+slCwCIwTGQMJRE1dPP2uE85jF?=
 =?us-ascii?Q?do8F58sK/O6HtmQ65s0fzSA7Sb/U4Cja+KQcdTDfNDXiX6/hya7OgOjHZeOf?=
 =?us-ascii?Q?tnMxoxk5AA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e6ca56-31ff-4682-4be0-08def70eaa60
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:39:09.4525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nh03eeohrhTeOWSVYDkCxDfTFFFsnccC668bwvh8UmxPXNC5bW+Wb9gROGFqxYC3X0yTku7PRiLo+4IJWuYALQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11092
X-purgate-ID: tlsNG-16d1c6/1786387151-F440377B-99CEB5B5/0/0
X-purgate-type: clean
X-purgate-size: 2611

The allocated_irqs bitmap in the existing vGIC implementation stores eSPI
allocation bits immediately after the regular vIRQ bits.
vgic_reserve_virq() converts an eSPI INTID to this compressed bitmap index,
but vgic_free_virq() used the raw INTID.

Freeing INTID 4096 therefore clears bit 4096 instead of the first eSPI bit.
This writes beyond allocated_irqs and leaves the intended eSPI bit set.
Valid eSPIs reach this path during DOMCTL bind failure cleanup and unbind,
and during vPL011 teardown.

Add virq_to_idx(), the inverse of idx_to_virq(), and use it when reserving
and freeing vIRQs. Validate a vIRQ before clearing its allocation bit.

Fixes: bdde400c6e1b ("xen/arm: vgic: add resource management for extended SPIs")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- Call is_espi() without a configuration guard.
---
 xen/arch/arm/vgic.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index e5aca17dcb..c095866709 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -33,6 +33,14 @@ static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
     return idx;
 }
 
+static inline unsigned int virq_to_idx(struct domain *d, unsigned int virq)
+{
+    if ( is_espi(virq) )
+        return espi_intid_to_idx(virq) + vgic_num_irqs(d);
+
+    return virq;
+}
+
 bool vgic_is_valid_line(struct domain *d, unsigned int virq)
 {
 #ifdef CONFIG_GICV3_ESPI
@@ -848,19 +856,11 @@ bool vgic_emulate(struct cpu_user_regs *regs, union hsr hsr)
 
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
@@ -897,7 +897,10 @@ int vgic_allocate_virq(struct domain *d, bool spi)
 
 void vgic_free_virq(struct domain *d, unsigned int virq)
 {
-    clear_bit(virq, d->arch.vgic.allocated_irqs);
+    if ( !vgic_is_valid_line(d, virq) )
+        return;
+
+    clear_bit(virq_to_idx(d, virq), d->arch.vgic.allocated_irqs);
 }
 
 unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)
-- 
2.43.0


