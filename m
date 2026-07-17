Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EB5C44507
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 07:12:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364687.1615702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcjr-0005Zo-TT; Fri, 17 Jul 2026 07:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364687.1615702; Fri, 17 Jul 2026 07:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcjr-0005Zh-Px; Fri, 17 Jul 2026 07:12:03 +0000
Received: by outflank-mailman (input) for mailman id 1364687;
 Fri, 17 Jul 2026 07:12:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wkcjr-0005ZD-3s
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 07:12:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkcjq-00H0XY-F2
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 09:12:02 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5bd-e002-0a2a0a5209dd-0a2a450adb1a-28
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:12:02 +0200
Received: from [52.101.70.78]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5c1-f2d2-0a2a450a0019-3465464e3484-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:12:02 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB7985.eurprd03.prod.outlook.com (2603:10a6:20b:428::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 07:12:00 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 07:12:00 +0000
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
 b=RAPvapBvKI/vJeqAF8+wLuMaGeMkUX9WztCw5aUp4I4qNkn9p3zlHnA2EnNTzkqCz3sYCwvV6KiC6+wwaRr+k0X7SJ2dPLeNky2CZD859H6zQgKvPjTTO2RsB9q6c50Zx9OkfvrZAiK3raIo09//ayyIj4Lpdw2nIISbL85NLlWZucIqyvzqf6GxohJZmNb2uR7Ib4bwy0y56M8mCwgruklWl99nqV9P2IXzcPXoZe5QPDqZ6ELT3w3keOnDy0PEH/2sRDvAp0sQyhApeJW775ZkkuQ/ARMN8jUY3Xrktuk5o37vF/OI4NTLqka8pPQbR+fg8RYQ0JhxKjJnhWDTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eIyVAq2TjvKOCUTXCBrr0CN8dsLL7rvIdBMxGGR0TQ=;
 b=MS40/3/8pfVf8GZ5J3ymAm7Yj1AVx/jNi2y6P2SLchVB0kcz/z8UobXpxOJqHEL6B4x7jSYHxfUTbJnXkOeoc1sOr9P2BYYDbvuws11QVAVOF5b20lxDIwCf27xRd2WA2R6mQPV3R1btgFO4+KDSOKg+dRcmWaGi7IK2qKhiAul9NQCJFgU2yDJqHJKlxngDJeV9ptHzNMCXcNAS2yo8DHOFz3l4k93c00zXf9pKeqkNo5VXbmz2YSD5V2YsXrxMaQFTobCuEw/sYBRW0Y+o4kaYl7mIT4m4Ti7i5Asv5Z0C/Tj1pPzobgLKz7f96GxN+scySPXv52r9IHoHEL990g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eIyVAq2TjvKOCUTXCBrr0CN8dsLL7rvIdBMxGGR0TQ=;
 b=I90weMGKpg+9zA5Lq5VTwOGvw0DcX8gjUJ0jXSykhCtc5wvH3n+KaLZFTQ5NY+KSzCXz3F6uyPbM6uZdEx2baznEB0TSx5Z574hbF6O08AEvyCyVWzQQ4LbKmW6BEr9TIsvZCH9Q5sHA4smRhOVJ39MMZ7OC/m4Hm4dWEotx9OPyTvfGx9/HBgClfHkbHov+T+STHjGKZsNUV/gI2CsbVbyZTT4l4Qw3Efqzm4VDjX0NE7jI00yVJBo/oEZ+eLw3n3IXn7dmQxD4HZGFwqHWlJS1FzhGAmYsUyIpX+DzS4TpUc39ViOYe72kREV87lLp/0Bn0FypP+4a6tBNyzZ74g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Subject: [REQUIREMENTS][PATCH v2 1/6] reqs: clarify guest GICv3 virtual register model
Date: Fri, 17 Jul 2026 10:11:22 +0300
Message-ID: <a91c8b7dfc16dd21f1d26a7779a34cea0d594e49.1784272211.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784272211.git.mykola_kvach@epam.com>
References: <cover.1784272211.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7515d2-d55d-44e5-f3af-08dee3d2b241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	u1v/VZp6qSNzK1R/S0FC+3SiHzkNrRJvh7Dhnjc/HZGWjQISjWS69bnlffr8ooo8ss5c1QC+Vm9N0LG7KXJrligtA8vz8yzDkPvQFX9GDImWnQHRcDxL7l3dcY8MlrJtDfuL4aDPBAMeIFjfHJQ8Myjyh61Ecc0Nj3k6TM9kHsMsIYxYPoMtiOZXb8TIcBheMwUSmxtYepJ5OeZmw6eadHRyHqDNwceYy799mTTp2qvN6+VzjFE+E/StA/6ARMIQitJVW13/OtZgMcBt5N5bBv8UoP/eGWY4tlQnpBHLJ8Y9WXUoag4LILqZ1spv+BnhQ0xKzhl5NO7CGslJzDkhhm4Q2Py2+XulCAUUlckI70eXVoNHUxuHEQGKfXolC0e2qcWBbrCMcmhedR+OYuAg94HPDfocdecnP1SYLY1iyF8k3duWM5CC528B5Etl39QW59F7NC8DP03BJPKPA2pMFanjrLkMwWKp/CTMYg8lH8Pfe1XWgSAFRMmKvp1/Jb15jatE4MJLxlwaxFvSBdDeO3hAiIwthAILwuNAFT6ycO7oi/ErjxIp3W4P2CxymtYIGPpAOjearbd87Eih1QScMNmDZIeYaoF7ma1mCgxNDPaGKTdVZ1UsYVgY1xLl+mX7b4NXovL5D8YovesgMCD65uVz/gHDO0nfJtiIiw+HD2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8nXAO71SHAC0BFLsD+5BSIo4QxdDOCJO2r93b+czLLWYZSGyxU9CScwY3nep?=
 =?us-ascii?Q?X6cIRq3xXmJQdlGquBWY3dJyLr0N5fD9DIgIk6h8vtxkTYZkTPplcig2ACQA?=
 =?us-ascii?Q?gywR9Do7Zb1YxWlJdyyHS73qccQd9gYrkbEkR8XNeIVdR1OlVJ2pQ4xjxGhb?=
 =?us-ascii?Q?TMS3QdPp/Or9Zu3nGg7O8ONar/aGcw56ZqcH89pL+mpu/xta3mqLXA9b6iet?=
 =?us-ascii?Q?NsOpXFinLJLIZJnmUnKEBSxRsT8JEqwCOeRRmxRKBvR2BqTM2JVhkqvFvwWP?=
 =?us-ascii?Q?xmCfrzy2ze7gPu6+DFV2TsK3OfN7LD5TPFXNWgX0CDTbNrgVh9oYUlY9wChi?=
 =?us-ascii?Q?U/qA//nrUuxbEKt6lSF5TAwza3abD59nULdpPe4D3Uv1G9+jyteSE5x6+Y3L?=
 =?us-ascii?Q?uEHth3Atj/H/vd9YXrnuc4e6sboaFkb7oEds8k06ZC9TbAAE0XsQii0Xunse?=
 =?us-ascii?Q?BsIPbf54b43r2PjrsXgGCfsol/knbQOcMe0EeKIn5e+JUbTguCqbpxTcm+SG?=
 =?us-ascii?Q?91CDRqOgNLoU/eyJlIeryjJI0wRiF7/XT/xj23ddxfB2EHQfagwTmxF1o4II?=
 =?us-ascii?Q?fG6d7j2rfibi9nDNBja6AG0VBOv7QibgecElEO9Skq5y/M5FTcwV0jVJMUjl?=
 =?us-ascii?Q?qSSfub0TzoXGUcRYJibdIxHhuHhecUi6NamXVnSZ5Tmmif4ZthN+AS6AmVGN?=
 =?us-ascii?Q?EoBicKNGY0F30z4FeTbjtxmfy4QC3NeYrIfhu2sOuQDv6JUMsC+pXZe4Ysxq?=
 =?us-ascii?Q?3ms8UNloIclUv1/8cdouEsurgILSG4xQi5nT1EtLQoZK7vSSnIkNajSZBtA7?=
 =?us-ascii?Q?VIuassPPHXTLU8KjRm3UIEBQymZm2UfZt7lshWT4PVool5drceJs0UmRwsOn?=
 =?us-ascii?Q?7MSSL6gfonb6QShZ5KKI8uGB+tWI3p9S5lBoRk9bvpVtBWyXTRWIxjW4dbuQ?=
 =?us-ascii?Q?YhJydiJYN4oUXcGf1v0j0oVm/sA93su0P/Kd6tZRE9qt2DKCfjf4TkWNV2PR?=
 =?us-ascii?Q?04+kDNYVW9hDYhvlj7Au+bnm1zlAafgLcme6WG6mN6DCF8LECz5GQAzu9UVp?=
 =?us-ascii?Q?5YMxTM2Q8c01a0WbaHM93unuseZ6524yoidkiszJ6KysHIyb3QGdGhKnkehq?=
 =?us-ascii?Q?O5thocu39xM2aarPyFexZFoz+XUJX7IjLrPkV4prwuhXAXhc427H78PC3o25?=
 =?us-ascii?Q?O5qbWyttjhqlp8k/WFfAq9qoNWcB2AISimmJnIhnAyq3G9tvpH4C7kUd0mRD?=
 =?us-ascii?Q?6GHSGLGQ8OQIOUu/9LClPbLkZb0pgGs2aHNXcQq0btbkhZHDmARx/oUO92jF?=
 =?us-ascii?Q?A9YbGvLB1uVIrSU0gnj2IxDWyQ0sWXSVuR7a1IM9DW6OWQJbbk5osXC4pu4q?=
 =?us-ascii?Q?zIp2UHJjfrOCEvN6ej/3Ea+DD7jBeZxL4PRVc09u+4l+zsfNJEkbFanljAbe?=
 =?us-ascii?Q?P/kW/5OcYQ9EtKQ3nHIDrWvt0ufEwmlqQ8/ODwKaJVlSHvRmoznvuPP8zbny?=
 =?us-ascii?Q?Hczmoz1T5mvkB3yyAukLbGZ5vlF12aa0uHQs7ndp/bgv4sz30goD4cqpocpB?=
 =?us-ascii?Q?jfcSJ58br36NSBzXMbuNUCxzfzvUn4jqWOVmMfbcM9/1yKVcKQ6zN2WVe/04?=
 =?us-ascii?Q?5UU+BLIZdRuWwbwY1bItqs9lM/yu2fKugrBQgGaN63P0Rw7QVc00FFurPA0z?=
 =?us-ascii?Q?7+DUU9Sbd3eg/zokWh1jws2CzZaOVbHkItIs7h5TknB1M+vaOdnMfSoyIUAT?=
 =?us-ascii?Q?oYdrj5Zf6w=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7515d2-d55d-44e5-f3af-08dee3d2b241
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 07:12:00.7752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bOEACeAciWAE6Qx8o9UPgcSInTIVgIAEOZKI6OmqTT8UK2ezxg2YTVvqE5EQrBNmtufdtHZAvdua5Cb9W5bZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7985
X-purgate-ID: tlsNG-4011c0/1784272322-51AC4CFC-159338FB/0/0
X-purgate-type: clean
X-purgate-size: 4020

Clarify the guest GICv3 requirements by adding an Assumption of Use for Xen's
limited virtual GICv3 pending-state and active-state MMIO observation model.

Xen exposes a virtual GICv3 ABI rather than a complete emulation of the
physical GICv3 Distributor and Redistributor programmer's model. Virtual
interrupt lifecycle state is maintained through Xen virtual interrupt state and
through the virtual CPU interface acknowledge and completion path.

Do not add AoU coverage for DS, security-extension registers, legacy SGI MMIO,
WAKER or unimplemented ePPI/eSPI bits. Those cases follow architectural access
or capability rules rather than a Xen-specific guest compatibility assumption.

Keep exposed eSPI pending-state and active-state MMIO register groups in the
AoU, because Xen can expose and allow guest use of eSPIs while still providing
limited pending/active MMIO observation semantics for those INTIDs.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v2:
- rephrase XenAoU~arm64_vm_compat_xen_virt_gicv3_reg_model~1 add details
  about Xen implementation.
---
 .../arm64/gicv3.rst                           | 37 +++++++++++++------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/gicv3.rst b/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/gicv3.rst
index 2ce30e5..e16576f 100644
--- a/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/gicv3.rst
+++ b/software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/gicv3.rst
@@ -23,22 +23,37 @@ Rationale:
 Assumption of Use on a VM
 ^^^^^^^^^^^^^^^^^^^^^^^^^
 
-Domain shall not write to GICD_ISACTIVER<n> registers
------------------------------------------------------
+Guest compatibility with limited interrupt-state MMIO observation
+-----------------------------------------------------------------
 
-`XenAoU~arm64_vm_no_write_gicd_isactiver~1`
+`XenAoU~arm64_vm_compat_xen_virt_gicv3_reg_model~1`
 
 Description:
-Domains shall not write to GICD_ISACTIVER<n> registers.
+Guest software shall not rely on the GICv3 Distributor or Redistributor
+pending-state and active-state set/clear register aliases as an
+authoritative view of virtual interrupt state.
+
+This applies to GICD_ISPENDR<n>, GICD_ICPENDR<n>,
+GICD_ISACTIVER<n>, GICD_ICACTIVER<n>, their extended-SPI equivalents
+when exposed, and GICR_ISPENDR0, GICR_ICPENDR0,
+GICR_ISACTIVER0 and GICR_ICACTIVER0.
+
+For these registers:
+
+ - reads return zero regardless of Xen's internal pending or active state;
+ - set-pending writes are supported;
+ - clear-pending and clear-active writes are ignored;
+ - set-active writes are unsupported and result in a guest data abort.
+
+Guest software shall use the virtual CPU interface acknowledge and
+completion path for interrupt lifecycle handling.
 
 Rationale:
-Xen does not support the emulation of these registers, therefore the domain
-write accesses to GICD_ISACTIVER<n> registers will result in a fault injection.
-Also the domain write accesses to GICD_ICACTIVER<n> registers will be ignored.
-The more, the reading of an active status of the interrupts via said registers
-is not supported as well and Xen always exposes all bits in them as RAZ which
-might be an incorrect state of the GIC and confuse the domain's expectations.
-The domain should not rely on these registers.
+The virtual GICv3 implementation maintains interrupt state in Xen's
+internal pending queues and hardware List Registers, but does not
+reconstruct the above MMIO register state from those sources. Its
+readback and write behavior therefore differs from the Arm GICv3
+programmer's model.
 
 Domain shall not access ICC_SGI0R_EL1 and ICC_ASGI1R_EL1 registers
 ------------------------------------------------------------------
-- 
2.43.0


