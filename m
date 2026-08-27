Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D5DC61DD3
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400675.1636237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9Y-0004ln-6i; Thu, 27 Aug 2026 14:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400675.1636237; Thu, 27 Aug 2026 14:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9Y-0004lK-1w; Thu, 27 Aug 2026 14:32:28 +0000
Received: by outflank-mailman (input) for mailman id 1400675;
 Thu, 27 Aug 2026 14:32:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9W-0004Xu-7s
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9V-009cNd-KC
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:25 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a78-bab6-0a2a0a5309dd-0a2a450ca9d8-4
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:25 +0200
Received: from [40.107.130.101]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a79-f479-0a2a450c0019-286b82652c5b-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:25 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6742.eurprd03.prod.outlook.com (2603:10a6:20b:295::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:23 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:23 +0000
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
 b=C3v6TzNBY7Kn8BT1F9BRvwMzy/iGCuk3sNkP4ckAuCYrT+1OnD0i3Qbu5KfhGI1kdh0y7um4d3s/W02627E/WBQbHP3lSWPb5fC90/51QRqXgoSx2uEARD6yrw1f+5KYklFNTI3iyvzKDpIpn5BpcCqacKxB5BXDkmTqDFS0JgbXX4tLCNXDLSamGRFo+XntwtZgHkn90v2pengYOJchSW9VV8tLQzIC7RTeV59X5JzkIvYKxtiOG+e//P5SYfMhY3SsayiS6kSsmXyNQ0H2nEDETTt0wJBvB2O5B3YTAhUCK/FrxNo689IV3QQLyEIQF0bgMARa34S0Og78LG5ZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB/RFfs74+GICdQ6AM31qkw97XkZfD7mC0XQ1Y1nMno=;
 b=WajoJ+LNW5AgQG8jJUScJQHa72tIcsramMZg4vnLVpvnttYTd11dqfMqw5iJZ7Y/ZsYmQZ12CnszdIlogfsaLpZR3bSXfQbDd9qB9ylhJ0rArVOE5XX3qF2PcBfYPToVaqna7jLhgEV9YN3hfiegJNihbY52T2tI46qgRXq/IWLCr8ruaWZJ2epR1e/P6TrnDDJTw3ULP76JIyYa5C98T6Gy7YTQw04DsXex9+PQIcPpkTu0026CJ+ZNXBWmx8QH51b8AG62VnnjTtNIM1PiJviPE8wgDSMiJpbSpwp8d08EPgbHOLwcr/yqgJLIuAOjbimvBstwwB3vzRbHH/vlNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB/RFfs74+GICdQ6AM31qkw97XkZfD7mC0XQ1Y1nMno=;
 b=TjtpsK54tuR9akWHOiaX4hKaxDD4J6VteM3kA4SF0lgLeA9X44HLvLwi+CG9A9u/T6jTNDJKRHyRkK+4cku2cewYmzDz7QMIHs9E+1kmnSpa84zlZZIEjfTAHKw33DjIl1U4n4NAS19+e3YsTJsZrto2XVXwcUjpI5N8Fxi2bLpZNL/YrxN/SfqckCpjr+H5gRJR56wYDXOIMSYArSLFhO+1ni5+YapN9JDpoQBmD1sp18hywH1Bu4EkExZ6o1XLP40kNPXXTlsoW1zZrH93sTPoor97x5AAjNWALIC5Vctl8dxc8Kuq6y4xEwbdxOqn/E3yvBnCzBMv9DBABErs2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v12 03/13] xen/arm: gic-v3: tolerate retained redistributor LPI state across CPU_OFF
Date: Thu, 27 Aug 2026 17:31:51 +0300
Message-ID: <54a655ad51d994b46dff43e67c969a31772cec4b.1787838455.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787838455.git.mykola_kvach@epam.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c3dcd7-25e2-444d-6b85-08df0448026d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	aE9vGWpW0eWbLtavphJOqDC2sq2g2UDP33X7RbFgx6NkvoM7O4rYtof8s3HfEbOsFyD6Sb5V1oPh0tMvZz2a4vgpvG5LXeLqPn88GNHuJKWLWsJ33fcdIW0cSHUseimV1XA6YVI1z0Q3EzC6IVzLf90J5v6r0COJztoDybfluJEsIfR9WSifQ88HwCAFaDvrLY8jD3pR/2xqS6dOtFxmvLdxVJZfG6RNUFPL9OPkuQH15Qy50ksddxYloZ5nHNgt+0HQHHRERdlySKbe+IKVEkv7zN0By82xhXnFThl3524P5J9GFmNhUajT39p+4DvwgtyJ09VK1WFoapPv9Z86VSlg7BnmNYfgyaNl3Ij8u+xSMskktxQNQK5sIUWmm5+RC4EYjCEZjdiu4lT1d2lctybH7+VKW8kf0AkbeiT+9a1WodmblyKCl8Qfx6WGMqjBGwXD/8qNZKTyoOVcsH2ztvlDyDq2XRCK3UMehDUvCMtgxrAmjXEHKzGUoxsJ7J15X/F3tmTF0+2QE98BuOa71Ps0OoXfXz95lR2l6O+B1T6z+f8fBKCOXJLyQ7n0j7p3NjHBp6LmAP5FEVfFhZG29rZKj4/qeP2Y/wmD7eRQjjaBTP5KmBkS9Idi2R8ieXVA6QOG/iCLqHzz82Z0A7qhVWRXhnP4KTIFAW/7ZqGVl54=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xASgQvdk9+2VWbtPwPMmfg55+i1zGqLjaXN0lLSagc6F/X6Iuk43Fn4Mq2O7?=
 =?us-ascii?Q?8zycpmfKMNWZxVryIDd8CXTqnxD2ZCvGPsS7nq/TLujzILLLC/i0Oy1lqYAZ?=
 =?us-ascii?Q?OlXJ9yYzk9GisobwHWPvD8p9Qn5W/6OaXO7kRNkv9CArwoo5U0MYzfcuPItg?=
 =?us-ascii?Q?ErM1POO/gtdh1s0QjfxvcbyphY7pN1X0HEKl9twpJj77GzIawccPI+D0g+Mr?=
 =?us-ascii?Q?97p4wM7lwBR8GWv2X50Xdr36q6wCPAv/U9zvHjp3eXMRWOMFSdZhd8uMALj2?=
 =?us-ascii?Q?tTAdQx33NBMK8YKstJf4ZwLWSuc3VgCvD9x5R4FSdUE/9Qw0/s6frDjK8p7f?=
 =?us-ascii?Q?099yxKefzjgAEC0/xsa2Q/eIM9GEvnvwtMNd84pEm7Ek9/zM5i/jQIsDbJHq?=
 =?us-ascii?Q?InGlZk+kylJ7F7tre5cs8I+7IDJy1YVSYjgAOACW38nWqksXWQv2G3+g35d8?=
 =?us-ascii?Q?Gsv0x6UVU+tzlB8feiTCD152VAkR5FosssI5r4LF1aWm7KbjNPv558PN+JB9?=
 =?us-ascii?Q?OIF9NGP8wc+aLCoU3A/bHj1eGPK3PvSOOP5XX5AVQhhPlpQSjBH4Gz9YPb1t?=
 =?us-ascii?Q?e+Y9Yx0qlQXj7k6zUP449HByRpd9yCEat5P/MSG87ctObCJjP3vGoHLPx0tl?=
 =?us-ascii?Q?i7X0SXoXH9z2QbiiWFUDrlme8NTbdjfxL4Uiv9AxnGED6svotxpozB0ep/Do?=
 =?us-ascii?Q?ZUKt2KRMC8s4Q3PLt5ci81quCmcRcoYYJcLvj6N8nYf6RsZStLb1EucLK60I?=
 =?us-ascii?Q?BW1A3rx7I2ktAELzQuELv4AgLGPTVcDuzVALJEaXThLrq72tVdYJHQN2xT6d?=
 =?us-ascii?Q?GUdGaT7FyTtUGX5ZngCinhMR38gokVSVV28gc4/hlL6BHWd2uxr11Gre3ql0?=
 =?us-ascii?Q?nnyZ9xOEqDnumsuXG94QnfX6aBdgrmBmcUEpdTp2BfJbeNMC46m5ziajLUvf?=
 =?us-ascii?Q?KMKmaMr3OMat94BuMhUcr0qhMAg7hUIplQPtQW69yZAi65K0uA1VjYM5QmFw?=
 =?us-ascii?Q?VasXrt9TMNwvbjSoEu41/2c3IoasNz9J2KI3a+jvxGe3tTN0c4Gf+jPYN5xo?=
 =?us-ascii?Q?BO9fZIsNFXGTp74J1aCo4JJx6ENYhZNYm2aBfQCpnGKWR02G0XUrkTytEFqG?=
 =?us-ascii?Q?6qP33ATDepDbNQETuMS/f5qkuljvcl6L7GoT/17f2IhedSY91GsxRRWqL9kG?=
 =?us-ascii?Q?7NjX51Bcqk3aRY0CKVJyM496TtWpTHv/htR4vF7+BChdZ6rMtOGk7kyiIBeE?=
 =?us-ascii?Q?41kpqhkClb3LT3mmfkfoMUise/rKDCINvTXfSnBd3ygtUWZ0S5RQvX1T6Jyx?=
 =?us-ascii?Q?zkQUg9CXNMJHl7YAs3WGV6yWMXZ6qfvgGYiblFh6JFmNO5EmFcbb8IwQqu7k?=
 =?us-ascii?Q?LWkEwQAdKobTF3GIYKp0YI69TBVmzxGJhIwuYolbONmC40Z6mYcH+z2EMUbO?=
 =?us-ascii?Q?N+WaLZHZQEMwPzSOWwKzjx1AAzJZ7Ad2oGhw/0q1KyGgkxezchl/JdjTLGp5?=
 =?us-ascii?Q?oikMbNlSH3IJTqisryo5l5reLs4d3RVI3POUbVO8tOt6r0fLnu/oP0g6dMiB?=
 =?us-ascii?Q?s8H5Z319Sj43ETomQkYQlZWAdmifOloQULAE8L173V2qPWPwyk10EdbsrDxR?=
 =?us-ascii?Q?6F7+CorCAGgJ20FNg+n7bjH8rAL/9YtKo1hbDUso6DF8EmQfKWvhvVckSLz3?=
 =?us-ascii?Q?qu57Vhdu7HSP/KSRLqmPzk7gm6JTVA/TV1FHPNJcR3dXNJgJot4JTIbBUDKM?=
 =?us-ascii?Q?l5z/coewow=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c3dcd7-25e2-444d-6b85-08df0448026d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:23.6005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rx0F+W1Of38FyfJnBosLQD+G/ngamb7XVCS2OR9/6T8X6v1A0UzsukDhiQy+Gba7LV4oy9q+A/Ojxi9nivYTFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6742
X-purgate-ID: tlsNG-d25034/1787841145-766DEA5B-5377B1D6/0/0
X-purgate-type: clean
X-purgate-size: 9556

PSCI does not guarantee that a GICv3 redistributor is powered down across
CPU_OFF -> CPU_ON.

DEN0022F.b says CPU_OFF powers down the calling core (5.5) and CPU_ON
brings the core back with a defined initial CPU state (5.6, 6.4).
However, PSCI leaves interrupt migration and GIC re-initialization to the
supervisory software/firmware stack: the caller must migrate interrupts
away before CPU_OFF (5.5.2), and the execution context that is lost in a
powerdown state must be saved and restored by software (6.8). PSCI also
calls out GIC management explicitly in 6.8, including retargeting SPIs,
preventing PPIs/SGIs from targeting a powered down CPU, and reinitializing
the CPU interface after CPU_ON.

This matches the GIC architecture. IHI0069H.b Chapter 11.1 requires the PE
and CPU interface to share a power domain, but explicitly allows the
associated redistributor, distributor, and ITS to remain powered while the
PE and CPU interface are off. All other GIC power-management behavior is
IMPLEMENTATION DEFINED. DEN0050D Chapter 4.2, "Generic Interrupt
Controller (GIC)", says the GICv3 redistributor may live either in the AP
core power domain or in a relatively always-on parent domain. So after
CPU_OFF -> CPU_ON a secondary CPU can legitimately come back to a live
redistributor with GICR_CTLR.EnableLPIs still set.

Handle that case in the LPI setup path instead of assuming a fully reset
redistributor.

The LPI path needs special care because the GIC spec makes redistributor
LPI state sticky and partially implementation defined. IHI0069H.b 5.1.1
and 5.1.2 say that changing GICR_PROPBASER or GICR_PENDBASER while
GICR_CTLR.EnableLPIs == 1 is UNPREDICTABLE. After clearing EnableLPIs,
software must wait for GICR_CTLR.RWP == 0 before touching the pending
table. The architecture also permits implementations where, once
EnableLPIs has been set, clearing it again is not guaranteed to work.
Where an ITS is present, the spec strongly recommends moving LPIs to
another redistributor before clearing EnableLPIs.

Because of that, treat a retained EnableLPIs state as valid when the
redistributor still points at Xen's expected PROPBASER/PENDBASER tables.
Only try to clear EnableLPIs when the retained configuration does not
match Xen's state, and wait for RWP before reprogramming the tables.

This is also consistent with platform firmware reality: PSCI and the GIC
architecture allow platform-specific redistributor power handling, and not
all platform firmware implementations force a full redistributor power-off
through implementation-defined controls during CPU_OFF. Xen therefore needs
to tolerate retained redistributor state on secondary CPU bring-up.

Keep gicv3_populate_rdist() resident as well, because gicv3_cpu_init()
reuses it on secondary CPU bring-up after init.

Tested using Xen's non-boot CPU disable/enable path on Arm
FVP_Base_RevC-2xAEMvA, both with and without:
-C gic_distributor.allow-LPIEN-clear=1
-C gic_distributor.GICR-clear-enable-supported=1
and on Orange Pi 5.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v10:
- Drop unrelated gicv3_populate_rdist() printk() format cleanups to keep
  the patch focused on retained redistributor LPI state.

Changes in v9:
- move gicv3_do_wait_for_rwp prototype from its related header to gic.h
- drop __init from gicv3_populate_rdist(), which is reused on secondary
  CPU bring-up after boot
- changed print format for smp_processor_id in gicv3_populate_rdist func
- cosmetic changes
---
 xen/arch/arm/gic-v3-lpi.c      | 77 +++++++++++++++++++++++++++++++++-
 xen/arch/arm/gic-v3.c          | 15 ++++---
 xen/arch/arm/include/asm/gic.h |  4 ++
 3 files changed, 90 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 9ee338edc2..847da26ff7 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -81,6 +81,13 @@ static DEFINE_PER_CPU(struct lpi_redist_data, lpi_redist);
 #define MAX_NR_HOST_LPIS   (lpi_data.max_host_lpi_ids - LPI_OFFSET)
 #define HOST_LPIS_PER_PAGE      (PAGE_SIZE / sizeof(union host_lpi))
 
+#define GICR_PROPBASER_XEN_MASK  GENMASK_ULL(51, 12)
+/*
+ * For retained redistributor state, match the pending table by address only.
+ * Attribute bits such as PTZ may not read back with the programmed value.
+ */
+#define GICR_PENDBASER_XEN_MASK  GENMASK_ULL(51, 16)
+
 static union host_lpi *gic_get_host_lpi(uint32_t plpi)
 {
     union host_lpi *block;
@@ -296,6 +303,60 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
     return 0;
 }
 
+static uint64_t gicv3_lpi_expected_proptable(void)
+{
+    return virt_to_maddr(lpi_data.lpi_property);
+}
+
+static uint64_t gicv3_lpi_expected_pendtable(void)
+{
+    return virt_to_maddr(this_cpu(lpi_redist).pending_table);
+}
+
+static bool gicv3_lpi_tables_match(void __iomem *rdist_base)
+{
+    uint64_t propbase, pendbase;
+
+    if ( !lpi_data.lpi_property || !this_cpu(lpi_redist).pending_table )
+        return false;
+
+    propbase = readq_relaxed(rdist_base + GICR_PROPBASER);
+    pendbase = readq_relaxed(rdist_base + GICR_PENDBASER);
+
+    return ((propbase & GICR_PROPBASER_XEN_MASK) ==
+            (gicv3_lpi_expected_proptable() & GICR_PROPBASER_XEN_MASK)) &&
+           ((pendbase & GICR_PENDBASER_XEN_MASK) ==
+            (gicv3_lpi_expected_pendtable() & GICR_PENDBASER_XEN_MASK));
+}
+
+static int gicv3_lpi_disable_lpis(void __iomem *rdist_base)
+{
+    uint32_t reg = readl_relaxed(rdist_base + GICR_CTLR);
+    int ret;
+
+    if ( !(reg & GICR_CTLR_ENABLE_LPIS) )
+        return 0;
+
+    writel_relaxed(reg & ~GICR_CTLR_ENABLE_LPIS, rdist_base + GICR_CTLR);
+
+    /*
+     * The spec only guarantees programmability when we have observed the bit
+     * cleared. Where clearing is supported, RWP must reach 0 before touching
+     * PROPBASER/PENDBASER again.
+     */
+    wmb();
+
+    ret = gicv3_do_wait_for_rwp(rdist_base, GICR_CTLR_RWP);
+    if ( ret )
+        return ret;
+
+    reg = readl_relaxed(rdist_base + GICR_CTLR);
+    if ( reg & GICR_CTLR_ENABLE_LPIS )
+        return -EBUSY;
+
+    return 0;
+}
+
 /*
  * Tell a redistributor about the (shared) property table, allocating one
  * if not already done.
@@ -374,7 +435,21 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base)
     /* Make sure LPIs are disabled before setting up the tables. */
     reg = readl_relaxed(rdist_base + GICR_CTLR);
     if ( reg & GICR_CTLR_ENABLE_LPIS )
-        return -EBUSY;
+    {
+        if ( gicv3_lpi_tables_match(rdist_base) )
+            return -EBUSY;
+
+        ret = gicv3_lpi_disable_lpis(rdist_base);
+        if ( ret == -EBUSY )
+        {
+            printk(XENLOG_ERR
+                   "GICv3: CPU%u: LPIs still enabled with unexpected redistributor tables\n",
+                   smp_processor_id());
+            return -EINVAL;
+        }
+        if ( ret )
+            return ret;
+    }
 
     ret = gicv3_lpi_set_pendtable(rdist_base);
     if ( ret )
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index acdac22953..b16888ad84 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -275,7 +275,7 @@ static void gicv3_enable_sre(void)
 }
 
 /* Wait for completion of a distributor/redistributor change */
-static void gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit)
+int gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit)
 {
     uint32_t val;
     bool timeout = false;
@@ -299,17 +299,22 @@ static void gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit)
     } while ( 1 );
 
     if ( timeout )
+    {
         dprintk(XENLOG_ERR, "RWP timeout\n");
+        return -ETIMEDOUT;
+    }
+
+    return 0;
 }
 
 static void gicv3_dist_wait_for_rwp(void)
 {
-    gicv3_do_wait_for_rwp(GICD, GICD_CTLR_RWP);
+    (void)gicv3_do_wait_for_rwp(GICD, GICD_CTLR_RWP);
 }
 
 static void gicv3_redist_wait_for_rwp(void)
 {
-    gicv3_do_wait_for_rwp(GICD_RDIST_BASE, GICR_CTLR_RWP);
+    (void)gicv3_do_wait_for_rwp(GICD_RDIST_BASE, GICR_CTLR_RWP);
 }
 
 static void gicv3_wait_for_rwp(int irq)
@@ -863,7 +868,7 @@ static bool gicv3_enable_lpis(void)
     return true;
 }
 
-static int __init gicv3_populate_rdist(void)
+static int gicv3_populate_rdist(void)
 {
     int i;
     uint32_t aff;
@@ -931,7 +936,7 @@ static int __init gicv3_populate_rdist(void)
                     gicv3_set_redist_address(rdist_addr, procnum);
 
                     ret = gicv3_lpi_init_rdist(ptr);
-                    if ( ret && ret != -ENODEV )
+                    if ( ret && ret != -ENODEV && ret != -EBUSY )
                     {
                         printk("GICv3: CPU%d: Cannot initialize LPIs: %u\n",
                                smp_processor_id(), ret);
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 29bb9a89a4..68003ab116 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -301,6 +301,10 @@ extern int gicv_setup(struct domain *d);
 extern void gic_save_state(struct vcpu *v);
 extern void gic_restore_state(struct vcpu *v);
 
+#ifdef CONFIG_GICV3
+int gicv3_do_wait_for_rwp(void __iomem *base, uint32_t rwp_bit);
+#endif
+
 #ifdef CONFIG_SYSTEM_SUSPEND
 /* Suspend/resume */
 extern int gic_suspend(void);
-- 
2.43.0


