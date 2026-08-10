Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1D8C5B567
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 18:39:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387760.1629014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtUu7-0004ZL-JX; Mon, 10 Aug 2026 18:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387760.1629014; Mon, 10 Aug 2026 18:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtUu7-0004ZE-GA; Mon, 10 Aug 2026 18:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1387760;
 Mon, 10 Aug 2026 18:39:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wtUu5-0004Wm-Ay
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:39:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtUu4-009VLW-Ne
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 20:39:16 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a7a1ab0-e002-0a2a0a5209dd-0a2a4504df76-26
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 20:39:16 +0200
Received: from [52.101.84.111]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a7a1ad4-b57f-0a2a45040019-3465546ff7a9-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 20:39:16 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by GVXPR03MB11092.eurprd03.prod.outlook.com (2603:10a6:150:2a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:39:12 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 18:39:12 +0000
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
 b=DkkjgM1zCRqu84KKXeQQrMnc5lhcYnlJ4p3z1131szpuOdKEYi6rkveNK+IlHfSA0hUky+5knXpPgqYVoR292E4YBpcyxyhnb2L8R4zfdvgh2oSKzkN/0XuQ/ir2A/uBXT1h3nDQAMvV0wtOMXAimHssGbQKUPjfMijHho50pYl5zIi7bdFlbRr+OdciNxTuyv4NQwla4FIC6adSJWBtK1gA7QO7ElhfAw6secHtQYMMNpQa+KBZYSQEgWQyFAxzkkt5sN8cza07JxyQ6HU7Iyr1X99fD5jYckPmo8j6d79RkjwOwwsjQj2vfGhRloNn538gdIzDaut6FAOsvPWKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDjLrGD/FUY/UDHLWYqh7U+MOkaV3PZOYHp110xkPAI=;
 b=BpJCzoyNePC0uVUWau9rDGPqsTamiKrVEz5GCFr7hj7irCF3sAc4M0DhGORRK2OElJP4h0LrPaicmLZq2GfFGtXpTO+dAFeQX955eZciAAufl6coL/oiYOA4wfNZmi3kuyQinJGi2D3eZcdoEtb77a/FbrsqjdgXVYtzIfEophgrVDIGk25axuwtCvKRAtGWb2XpToK41woC8ieq/5fl9vsPvUgWfJ4/5ehzrhwWqwYPGc1LRd5RJLo0G6kUxVHpmGp3lRtoUWewEoIPa0XIgtLWormcygeKXMN8gFRdtBqhFopCDyxc1uMWYjW9EctV00Bl/84kdX7FSSJ/v9Xlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDjLrGD/FUY/UDHLWYqh7U+MOkaV3PZOYHp110xkPAI=;
 b=HW+3Ug3RRUhFXjtQp14lc3aASZPPbFsXMhkdvPWZRphZL6sHg4aoSGmqFGz0ek5R4tFLXPcMQpjLfOUah8MBok88SMHaMtGPfVxxRSLdo0eNbXTCaeL7g8W3tdHOB2+4imR6kI+8pPZaVzbEZgJ0E22Hjm1lQAQHGkY+fky3kEAtJjOLIOcDwIQrzn3UrHu3E4hv9qa+SXpZipIBdP1Rf2fGOb+yIAQi0dIJErIMdIsCjBS/6y4xNc8whW1ZLv4n2meEaFS5nJVfT+/AvkKiOUN7LcdEutPt3uzPCEpWJ5h8D4CWvz6gVU4XYUlXiGeTjoNNbATrarIH8UTqW4S7Xw==
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
	Jens Wiklander <jenswi@kernel.org>
Subject: [PATCH v2 3/3] xen/arm: handle irq_set_type() failures
Date: Mon, 10 Aug 2026 21:38:47 +0300
Message-ID: <d4087afce93cd4bb1779507393ac74c5dd5baea3.1786385827.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 47e88541-b80d-49b4-e333-08def70eabd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	uJMqOoXTb+FbCoY2yiaYePu95xHg/G0UW74CG6WUc2aW7rJuAKw97DeCbap2Zp3GkQK0Wxey1v1o415gRRHs1vshQOSsZy7K1LzdFx8r6GKoV7dEBLDGtiiZEA1g4r3xqbEdcOsMzlB9H1fNdidXC6dnZswPJQWGwDF/pcHr4ISAs9RUuWAUVBXSvENa6i7TwggttRj+ET0sKsWqONhlb2xFR/rkwOj/1GDwvQK3Km6CLpn64SDgYcvbbJpe45SYs/o8K1csG7CEobeCDW/vtCoalZ6WUm8DW61D3G716MaJ4E77lAOzjUgTriG+PiIgn45zSjXWY1wva5fsN2G0XZzkJj3aA3L4GgCkc9C+JELagDRlw6N2r2cNERZSX0qYUrQpjSO8Qm/1EFb04yYeEC2LM3uywDHHX1PBpm6XO2U/1j1QKj+y4TRrYlzw6RK/7TGrv1a4C382BstfTyhl58gz8rglZDuA0hyLsySmT2/EPzCk6wcA2SzG9Fk7wlhUZ6iFmbEsOxYpXaBEG389IJRyyf7hU7McjCfZAY5H8ZsYz/ABil9/C9959vWWQGw34543oje5TxPXl8wXpnO1uCs5FBte+EL4vWDt6L2axi8Vn0SQFyIOxIUSPWxLolDblYqUonJ4vpB8yxmGr7CsxGbxh9VIzW9jOjctb6MPWLI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l/FuCPR1KArHyj4uVex0HQRtYlHdgo5hmiefPb3gKIEPc2QS0QW+puYjsSkB?=
 =?us-ascii?Q?ZfAcwElNDPaW05kTb3TpVFWbFR8BAWGut/1UZPen6SuQPOy46W8ZPLbqLWFb?=
 =?us-ascii?Q?SncFTf6SdsxpcsqVliPIINfdCrIEMyY955wPdU/84y6U4ohwiNT7VFXQOU+1?=
 =?us-ascii?Q?sK9YS0KhxiBvoK4ROdet2u3PxyyrNitL9OEAJfVHffqTrI4GHYwPZfiHDJ6g?=
 =?us-ascii?Q?0aweKGxq988xOdbXWGRDF2ySQkLxavG1h9N7sxKygRW3vUU60OEWcp6M2o7C?=
 =?us-ascii?Q?JyYoWXb+iWUqj/l02if97He2c2zF7/qRcQphaW8fI/5DWCYXo8zV92OncaSy?=
 =?us-ascii?Q?qjLh40iwPbwOhPBuD6HtsEt/XL5CtjZ0ac54nstsUL1AsMSKwH5mg/lLwj8x?=
 =?us-ascii?Q?iJ9pUKgBgJdokHbtLV13CaRmJVzwxBuDAqiDULgNu/Rqel/mPwNKwNNv1VX5?=
 =?us-ascii?Q?zgw/4ACyZVEUF2JLE/TSVuShVFz3jpINMOJehVkM9OXLlxySjfWF5QtJb9y/?=
 =?us-ascii?Q?WCLx7tIAQbtSyR6aLugVqSejpq2t4pB9B12SsWfoQ4/WBtEnA+Ja4Y2qH+g9?=
 =?us-ascii?Q?uhvYdw7V6pGZYinGBq91Br2h5eXNQ30S43fNbwYxAAXYMsFB79oCuq5YxSYy?=
 =?us-ascii?Q?Mrux61rvSd82V1tdp+1CHkk2YroByItxBfU3bHGOkT8pLsuG2edmw31dxrzl?=
 =?us-ascii?Q?00Th7WwRcbFYsAUtt6YZsAJMzqiFegjj1Va/Rq5+htgc2RIheJIApwf9o7mI?=
 =?us-ascii?Q?S7laDTrgaDOLo3ZS/CTaSWJTchReAE8vhiJHmYFlR4GzHuKAIKgXywY4c1Tb?=
 =?us-ascii?Q?VgWTDxBLJNrhCSPqkOznEf6OAqlBC0qvdAWxKTZ0BBMSP+iGImbazhXgA4Gx?=
 =?us-ascii?Q?p5Zm7bkzPlERzdRf1qkruFb/RCYlTNGWRwqynSKKEKNRva802mvh3BtCHqRC?=
 =?us-ascii?Q?xId/nUhJeWXR5L8NDqQA7cWSaXZ4b1+d30C3byAHlu82+6l8RR2pVmp4TvSp?=
 =?us-ascii?Q?q9c9BXJFPi3GsZhsBlBlPZzd9i7ZHeJBE6DE75nGcMgRunXQW7EPak7cd09P?=
 =?us-ascii?Q?F/tZXdFzMuUiUHfCrARJbkTm0ugAkYdaSvZbmsQq5OLwOangndfavezcrN7v?=
 =?us-ascii?Q?mAzzaGH1ABD9wO52/nSkUhvddHWFK2jmouCU5+NCnSeNpInk49+R/g6A8rDN?=
 =?us-ascii?Q?KShV7qh2b93k+4D6PD78mT0LYsbxTeUaAZCb4D97rdRsVE5eplhGkQRJhm96?=
 =?us-ascii?Q?K6Tw61+pafnqLs9ubEh9t5ZcepqbGWOWs44VzzTyWkyIrwz2OAdxFbVFJnz8?=
 =?us-ascii?Q?ktNJPrCYR8kRV2zotFJbYqMN0nEsQEtXLdtA/rWg554EkuefUOMpnP6W9b9F?=
 =?us-ascii?Q?grxsb/788k7SGgKPmr6YDEf1HQdZyUDQRKIPp7u4cam63Vs9A0ASxQP9+dzQ?=
 =?us-ascii?Q?rdZCJGzaJyDDD41tHKBh/omb/hv0A3fVrX1lBXb65mVj5jEVgtEXbyYs/ilj?=
 =?us-ascii?Q?upsfXqfVUylqfhBBvjPqlF0yGNeL4FAQngiVZBYtNGGij8C9/oIsIYVgQPL7?=
 =?us-ascii?Q?ap/1O7royDgzg/K4aUO4KYHDtAlClhIlzwGG/TI+s2GKVouHp8FcbT1IA+YL?=
 =?us-ascii?Q?Setjv7t4pwTzzg44k/0nrDWNj7JMj95q9pf++fNMl4YpI/k0p0TcrYzaX3OT?=
 =?us-ascii?Q?TUpXase6qo3CYC/LipVPUYHCr+nvYpRjQyw9ikQoWYvKsZEG7UYhNPIVPq6F?=
 =?us-ascii?Q?tej3n00jrQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e88541-b80d-49b4-e333-08def70eabd7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:39:11.9409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cP677HKJHG0aKoTZVTXUorLx2TcQ5bgwgAIZKBZBF5KZeFUk8saS1KugqqeO/mvbcLZP89NaYokt5OgWHFNvQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11092
X-purgate-ID: tlsNG-ebf023/1786387156-502E4B50-C89FB731/0/0
X-purgate-type: clean
X-purgate-size: 7395

Several Arm firmware initialization paths discard irq_set_type()'s return
value, violating MISRA C Rule 17.7. If trigger configuration fails,
initialization continues with an IRQ that was not configured as requested.

Check the return value in the GTDT, MADT, SPCR, and FF-A paths. Store
timer INTIDs only after successful trigger configuration, make GTDT
parsing failure fatal, and stop UART or notification setup when trigger
configuration fails.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- new patch.
---
 xen/arch/arm/gic-v2.c        |  8 ++++++--
 xen/arch/arm/gic-v3.c        |  8 ++++++--
 xen/arch/arm/tee/ffa_notif.c | 11 ++++++++++-
 xen/arch/arm/time.c          | 18 ++++++++++++++----
 xen/drivers/char/ns16550.c   |  5 ++++-
 xen/drivers/char/pl011.c     |  4 +++-
 6 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 43a379fdda..b8dcbb0bb4 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1157,6 +1157,7 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
                         const unsigned long end)
 {
     static int cpu_base_assigned = 0;
+    int rc;
     struct acpi_madt_generic_interrupt *processor =
                container_of(header, struct acpi_madt_generic_interrupt, header);
 
@@ -1173,9 +1174,12 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
         gicv2_info.maintenance_irq = processor->vgic_interrupt;
 
         if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
-            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
+            rc = irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
         else
-            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
+            rc = irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
+
+        if ( rc )
+            return rc;
 
         cpu_base_assigned = 1;
     }
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index acdac22953..d92d0b9b3c 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1734,6 +1734,7 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
                         const unsigned long end)
 {
     static int cpu_base_assigned = 0;
+    int rc;
     struct acpi_madt_generic_interrupt *processor =
                container_of(header, struct acpi_madt_generic_interrupt, header);
 
@@ -1748,9 +1749,12 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
         gicv3_info.maintenance_irq = processor->vgic_interrupt;
 
         if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
-            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
+            rc = irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
         else
-            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
+            rc = irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
+
+        if ( rc )
+            return rc;
 
         cpu_base_assigned = 1;
     }
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
index 6955b2788f..39b5eabe7c 100644
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
index 120ac09d23..4bfdcfebd7 100644
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
@@ -1976,7 +1977,9 @@ static int __init ns16550_acpi_uart_init(const void *data)
     uart->reg_width = spcr->serial_port.access_width;
 
     /* The trigger/polarity information is not available in spcr. */
-    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    rc = irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    if ( rc )
+        return rc;
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
2.43.0


