Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD3DC982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:40:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428177.1650916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uAe-0004v7-AM; Tue, 22 Sep 2026 06:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428177.1650916; Tue, 22 Sep 2026 06:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uAe-0004uh-5j; Tue, 22 Sep 2026 06:40:04 +0000
Received: by outflank-mailman (input) for mailman id 1428177;
 Tue, 22 Sep 2026 06:40:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x8uAc-0004Uk-Hx
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:40:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8uAb-006dEr-V1
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:40:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab222bf-e002-0a2a0a5209dd-0a2a450bc35c-10
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:40:01 +0200
Received: from [52.101.69.84]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab222c1-b7e8-0a2a450b0019-34654554fa92-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:40:01 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by FRZPR03MB11709.eurprd03.prod.outlook.com (2603:10a6:d10:1cc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 06:40:00 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 06:40:00 +0000
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
 b=MXL9t3KlhV7hawE5DBO1/kiI5YfsvwCMotTQ+7eSRYZAXQnXVvML5C5tUyiHHOWdu7kz2buPTJKaF7HyhoNShkWDcqpGX8s0RhosmeSucmKEFaf5NRvPvsvCWq1Q0hyqpAeCJlcC+8ssuQz9IaBDSrLIxoY1zs5DJz8GtDZz4YHFgkjM7yTsLMMaeqzaYwxetcSrVMvd0gFDJ2bwNt1jCnlNwjza36Ojco1M8WpIilT4/7KLwuPNcRcgE9Hlp7ofHrs5ejDnbha+XxQK0UoG/b6WKSMYA58maJT5gycoFYfz6ieoToXsOpeOKgoLHJcxpT24y+LUj3FGBAGXwLsWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cKreGMUElULo1QhsKeoGyzZB+m+nWVmEkjFZ6Y0E/o=;
 b=per9VJBhHS0WI6vjKHSYHdP9kXXHSVg8+7OiWLzdjaV6wTdHDIf+ldzZ2jrL4NkVbavbYX0STa3Z+SZlBMO7Byv6DpJE6/s96UMjBi1KhD2MkSFvZ6b/WO2lY0ViBSv778D+uHpjzqoMCZxhLfYUXIilYak+L9KPHy7De95Y1/IOK3udJ7g/hFv9fQ72gXGtE0aM1CCfNnu7IzYs1MfmOf5LSo2ZxhYVQtPfLMTdqCl9bi/qTQuRvQyKNyrAb1Ez1KJkJG8UTMxrizncEgR7IZEzLNC7Zl2SbAmIeaSQGpJfu5OdYvi8PdrreNTJGC48gNfP4HOGlsKOyQbVPsRN6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cKreGMUElULo1QhsKeoGyzZB+m+nWVmEkjFZ6Y0E/o=;
 b=hU/VcaomblbdUuqp65K+tA9902Q22o/jR2R5fSxXmag7E+fQ3wN7hwm2uZwEGDQdISLSxIf2f5+V3SxGve6oPLDfLMF04+W/W3RZKXDZbX/LHMrExCcOPwhGv9a78vDfb2u10HgVwJJj9lX/JRO7Hu4u46MMwlvQkjkmBFLTmKfe95q5MsN+VBUHTvYLd5L04jLYYu1wwmZfY2OF45a8nnQDTNL24NfM9tAwkbzS1hkMQ3/hCU1EylG7qnSnc7ekF9FkbcW6aePleMV9gazOxmMeudxtkvbQpwvyvFsHpTWmGbFUztIeLC79imdryuxSPQdQxvlWfBIXWUq0kKE48A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jens Wiklander <jenswi@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v4 4/4] xen/arm: handle irq_set_type() failures
Date: Tue, 22 Sep 2026 09:39:32 +0300
Message-ID: <85c5f8f04b19eea8d32e875a8b7e94f4ebb88292.1790056623.git.mykola_kvach@epam.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|FRZPR03MB11709:EE_
X-MS-Office365-Filtering-Correlation-Id: b9454439-9a24-484a-5102-08df187452e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sUaeZcfEWsfWgbF09lIKlCd44Q+srzeqsyZB9RmvLpO6p05sv9l2YWxFdaFPaIY4IUtrXL++HHDzILCqBEHhV7QViu7UICTT3jFSh8iH66kZo7jPJUxEkzKebxrRqpfdPbdIEzSx6PUf/BSKhaq11UU8dB/wrOOqJGwHdbf8n8U1WJTy94jxIbA9IPnBQzS1ZDRixgNOhSmj0Hx9Ig1A6RjjerTHqpCu7PWgQohrvGxdKM5fqxVYiqYY+oB/DL2NjsOxpQvmi9QKpS6GsgVxeB+Lv31xQP9QSiq8VLdrGFHjHSMdzBKpObte+uAMOj5tQK8+0hvk8UsvSxcnKuRBwMgm4FcqDxsGPEPlmvoL5Bc7BTKodm3KLh+F9dWSriHTQbhbC2d1jh+BdeF1DdRzMPA7AcmOAUSC2EUiKPZiELvMHIiKgVRqTbLuV+4rBCEdsaE3X0TLbk4TDMTsEIemNvcmMb+erXvVV11Nyg3XfaQcerMo8PRMTkfftk5E+iZFzxHOuU7IXhapQamm3JskkFtsXJQYT2rCk8G4azgYcfkEpxY/L3mP56eoMyQSsr/gwkyRio+bgiQcYSfjXp/kRXGJa1sG9sJSxbS2XBbvcuVLUtko677HzjyXbzCnoWY85hU3gVv4OF0G7c3TIvNbPme8vQwDhycOZeUaVvl4JJA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RZSJ+kUxijYejledWBimWehGJfHXUAq4D0kio7zGv6ilPfkIz14R0exZumsp?=
 =?us-ascii?Q?bcyfsNeT49mriCQfSX5R9hx5g/B1tjOJ1XWLJc1tvBy3l51Sj7SuT5DoFNxh?=
 =?us-ascii?Q?dfIEWaILGbyVqJdo4pPUIPgFATy/tUUHuO7RPLn98vRTHgRmyINztQiW0Y6O?=
 =?us-ascii?Q?5YYNoXx/cTWh5LGTCPJtbMbaC4f5YDDNAZZsP2z2r/swHIoretnVYycFBr/w?=
 =?us-ascii?Q?YBcgmSC4/b8P9QJxdBqN7f5V2hajJBIoHjHumDtuL7OyPpu4t4rhDxTySnTw?=
 =?us-ascii?Q?kFfvNNzlV+0iBz5glYlaS0JyUxg6jMCGV78J+suENdFxeXj+41C3c3vfznSI?=
 =?us-ascii?Q?K2DpYlx+P0cwV16EydBQR04PVxcAMWwFv1b1JR7wRFdnoEI34Jp4/RX1U4Zu?=
 =?us-ascii?Q?n9bJCztYtbgVBtO3s4nU4SXI0u6YUnH/njyGLkyzBjl8o4iWbAeFyd72uGW9?=
 =?us-ascii?Q?RclQfi9f4vr15uIlhuJWyBvXtNXisIjgRyB3CN7KYlTYXcd3i7FQGDird329?=
 =?us-ascii?Q?WMESftz3OgN+WGPcA5O8TGuC+2HTtYo1V8DKuERWPE6CxpCCKm13uJ+XN472?=
 =?us-ascii?Q?OLMJ60lvSq68TvIdgIXcBuz9S0BbY7i8fgbT24neI8kutaOJG6WROZa6wqP5?=
 =?us-ascii?Q?pnFv3Gkgua1JbyooqUpJcOkq/IWNRpJrCsegFsyq2/Zf4UDLp5WSnD3Es49/?=
 =?us-ascii?Q?nabwfdRAq2J5Kae4tIPS9ohtjSuhGmgh2ogs6xOjpa0hnrFe/33amk8WPGCn?=
 =?us-ascii?Q?2UiuuV+4JeXN7GOlZbm6ZQaXI3ocH/3LY4m1oeMuCswpWjrscMYrK9RGvmSl?=
 =?us-ascii?Q?tOvFhOJ6dqLkOtkYmUCqZ9RBEs2Dy2whViQcVtbwaNFdR0OflaPPKdtmSkSS?=
 =?us-ascii?Q?YfxchiwKVJBC6bnA5bfR7UtjECFAjEEGKt2CkVV69FPi/PBrXMELFRq8Q3Bx?=
 =?us-ascii?Q?YCEUWyKHCkGN2RX1+Us05l+8DwMxRXo5QxglIhCe08WeqT58OSMf2lNZiWA4?=
 =?us-ascii?Q?8KI5vopgwD3G2XAARSEoIXmGbff8Rn1vrItkE36+kWh5AgnjRpZ+G9AzHjiv?=
 =?us-ascii?Q?diSJ3tYIPnCWUQUBOWekxes/qR9oDeX3Q1kNkWy7xYcp27x1KWWxiXZTvijV?=
 =?us-ascii?Q?QfKspCHmSi0E2X72D0Lup8i9o7m7QNzAwwBrZFX9/Dk+VXGKw6HcXzU2KX9a?=
 =?us-ascii?Q?7yKoBnsIGpkzWjkGPDLAmSHkKNS+BooeyO9k2rzOhGPn4Ro0z16r0/E4plOH?=
 =?us-ascii?Q?1/R/W0Gm8PQ8mYDtiy9j+iqGV/5WUCgRr3tiwccExH8/chkYhDFKnlixi4H1?=
 =?us-ascii?Q?XHeAxmVjIt0wbn3Oct/nFpGAGxQVaGqzVh/zKkM5LFBFU2OO266FdKj14NCJ?=
 =?us-ascii?Q?UVvNpGcPCeGXzS9R6cVKuKQCK5jJxKnL2P8f+enOxlOeo/+5VWvqgpplsYWi?=
 =?us-ascii?Q?AR1oizeymG8KKRy3+ogxeDR7WkgJP5vwJquSvR9ka0OXdI6i9HVwU2bN6R+m?=
 =?us-ascii?Q?ZpE+l4Xj+WJ6cSTFulGdfwWHE+qLRD/1xnSsUCrhhDzXm4X9RgOS1aOyzu2K?=
 =?us-ascii?Q?vTKheeaps1lTKyX1jt2R0+RMCBF5VHIsH5HF1VS506fN8ZW86ssq37jp0tow?=
 =?us-ascii?Q?jWSVqh7tL8ODy+wW/5CaOSjyjNGCSuCGGS9VGeRUCFKnmyJBUXI4XzxqGujY?=
 =?us-ascii?Q?rp0ICrT0Qf6CQIb89+j1dEDFcljjLnFkGrR2lOL0KXL6OzITggvV4uEH62DB?=
 =?us-ascii?Q?u7yVNs8HBg=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9454439-9a24-484a-5102-08df187452e2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:39:59.9608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MD5bZgr04u74Qqp8rz18uQEocvPpxd9RSS93/Xv4lRvCcNeW3TSpyViII/s7X7VLD0SS7DN7Sj3W9L2omidBoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR03MB11709
X-purgate-ID: tlsNG-42698a/1790059201-A94C39EA-FEEC95D8/0/0
X-purgate-type: clean
X-purgate-size: 8128

Several Arm firmware initialization paths discard irq_set_type()'s return
value, violating MISRA C Rule 17.7. If trigger configuration fails,
initialization continues with an IRQ that was not configured as requested.

GTDT and MADT retain rejected timer and maintenance INTIDs.
check_timer_irq_cfg() and release_irq() later perform unconditional
descriptor lookups on those values. Xen has no backing descriptors for
INTIDs 1024 through 4095, so retaining one can cause an out-of-bounds
access.

Check the return value in the GTDT, MADT, SPCR, and FF-A paths. Store timer
INTIDs only after successful trigger configuration, make GTDT parsing
failure fatal, and stop UART or notification setup when trigger
configuration fails.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v3:
- Avoid partial state updates and simplify maintenance IRQ setup.

Changes in v2:
- New patch.
---
 xen/arch/arm/gic-v2.c        | 15 +++++++++------
 xen/arch/arm/gic-v3.c        | 15 +++++++++------
 xen/arch/arm/tee/ffa_notif.c | 11 ++++++++++-
 xen/arch/arm/time.c          | 18 ++++++++++++++----
 xen/drivers/char/ns16550.c   |  8 ++++++--
 xen/drivers/char/pl011.c     |  4 +++-
 6 files changed, 51 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index d05c574d88..87eda9d322 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1166,17 +1166,20 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
     /* Read from APIC table and fill up the GIC variables */
     if ( cpu_base_assigned == 0 )
     {
+        int rc;
+
+        rc = irq_set_type(processor->vgic_interrupt,
+                          processor->flags & ACPI_MADT_VGIC_IRQ_MODE ?
+                          IRQ_TYPE_EDGE_BOTH : IRQ_TYPE_LEVEL_MASK);
+
+        if ( rc )
+            return rc;
+
         cbase = processor->base_address;
         csize = SZ_8K;
         hbase = processor->gich_base_address;
         vbase = processor->gicv_base_address;
         gicv2_info.maintenance_irq = processor->vgic_interrupt;
-
-        if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
-            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
-        else
-            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
-
         cpu_base_assigned = 1;
     }
     else
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index acdac22953..b32a9b5009 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1743,15 +1743,18 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
     /* Read from APIC table and fill up the GIC variables */
     if ( !cpu_base_assigned )
     {
+        int rc;
+
+        rc = irq_set_type(processor->vgic_interrupt,
+                          processor->flags & ACPI_MADT_VGIC_IRQ_MODE ?
+                          IRQ_TYPE_EDGE_BOTH : IRQ_TYPE_LEVEL_MASK);
+
+        if ( rc )
+            return rc;
+
         cbase = processor->base_address;
         vbase = processor->gicv_base_address;
         gicv3_info.maintenance_irq = processor->vgic_interrupt;
-
-        if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
-            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
-        else
-            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
-
         cpu_base_assigned = 1;
     }
     else
diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 186e726412..d08d0a3366 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -407,7 +407,16 @@ void ffa_notif_init(void)
         irq = resp.a2;
         notif_sri_irq = irq;
         if ( irq >= NR_GIC_SGI )
-            irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
+        {
+            ret = irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
+            if ( ret )
+            {
+                printk(XENLOG_ERR
+                       "ffa: irq_set_type irq %u failed: error %d\n",
+                       irq, ret);
+                return;
+            }
+        }
         ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
         if ( ret )
         {
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index be54b87438..ccfb76e20f 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -60,20 +60,27 @@ static int __init arch_timer_acpi_init(struct acpi_table_header *header)
 {
     u32 irq_type;
     struct acpi_table_gtdt *gtdt;
+    int rc;
 
     gtdt = container_of(header, struct acpi_table_gtdt, header);
 
     /* Initialize all the generic timer IRQ variable from GTDT table */
     irq_type = acpi_get_timer_irq_type(gtdt->non_secure_el1_flags);
-    irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
+    rc = irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
+    if ( rc )
+        return rc;
     timer_irq[TIMER_PHYS_NONSECURE_PPI] = gtdt->non_secure_el1_interrupt;
 
     irq_type = acpi_get_timer_irq_type(gtdt->virtual_timer_flags);
-    irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
+    rc = irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
+    if ( rc )
+        return rc;
     timer_irq[TIMER_VIRT_PPI] = gtdt->virtual_timer_interrupt;
 
     irq_type = acpi_get_timer_irq_type(gtdt->non_secure_el2_flags);
-    irq_set_type(gtdt->non_secure_el2_interrupt, irq_type);
+    rc = irq_set_type(gtdt->non_secure_el2_interrupt, irq_type);
+    if ( rc )
+        return rc;
     timer_irq[TIMER_HYP_PPI] = gtdt->non_secure_el2_interrupt;
 
     return 0;
@@ -81,7 +88,10 @@ static int __init arch_timer_acpi_init(struct acpi_table_header *header)
 
 static void __init preinit_acpi_xen_time(void)
 {
-    acpi_table_parse(ACPI_SIG_GTDT, arch_timer_acpi_init);
+    int rc = acpi_table_parse(ACPI_SIG_GTDT, arch_timer_acpi_init);
+
+    if ( rc )
+        panic("Timer: Failed to configure interrupts from GTDT: %d\n", rc);
 }
 #else
 static void __init preinit_acpi_xen_time(void) { }
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 120ac09d23..eb608ab8b4 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1928,6 +1928,7 @@ static int __init ns16550_acpi_uart_init(const void *data)
     struct acpi_table_header *table;
     struct acpi_table_spcr *spcr;
     acpi_status status;
+    int rc;
     /*
      * Same as the DT part.
      * Only support one UART on ARM which happen to be ns16550_com[0].
@@ -1959,6 +1960,11 @@ static int __init ns16550_acpi_uart_init(const void *data)
         return -EINVAL;
     }
 
+    /* The trigger/polarity information is not available in spcr. */
+    rc = irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    if ( rc )
+        return rc;
+
     ns16550_init_common(uart);
 
     /*
@@ -1975,8 +1981,6 @@ static int __init ns16550_acpi_uart_init(const void *data)
     uart->reg_shift = spcr->serial_port.bit_offset;
     uart->reg_width = spcr->serial_port.access_width;
 
-    /* The trigger/polarity information is not available in spcr. */
-    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
     uart->irq = spcr->interrupt;
 
     uart->vuart.base_addr = uart->io_base;
diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index a336241033..97c53c11e0 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -363,7 +363,9 @@ static int __init pl011_acpi_uart_init(const void *data)
             spcr->interface_type == ACPI_DBG2_SBSA_32);
 
     /* trigger/polarity information is not available in spcr */
-    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    res = irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    if ( res )
+        return res;
 
     /* TODO - mmio32 proper handling (for now set to true) */
     res = pl011_uart_init(spcr->interrupt, spcr->serial_port.address,
-- 
2.53.0


