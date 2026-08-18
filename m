Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EEEC5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 11:33:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393999.1632804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwI4F-0006Vq-CA; Tue, 18 Aug 2026 11:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393999.1632804; Tue, 18 Aug 2026 11:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwI4F-0006Vi-96; Tue, 18 Aug 2026 11:33:19 +0000
Received: by outflank-mailman (input) for mailman id 1393999;
 Tue, 18 Aug 2026 11:33:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wwI4E-0006VW-P1
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:33:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwI4E-00BTlp-5j
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:33:18 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a8442f4-2eae-0a2a0a5409dd-0a2a4503e17c-28
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:33:18 +0200
Received: from [40.107.130.130]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a8442fd-fae8-0a2a45030019-286b8282bd98-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:33:17 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by PAVPR03MB9598.eurprd03.prod.outlook.com (2603:10a6:102:301::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 11:33:12 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0315.012; Tue, 18 Aug 2026
 11:33:12 +0000
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
 b=TWaTj36pJ4WdZZW1g/zPgznk+Ex/RrdlyfmDg8HKdtu4JYRyOyWZnrf7nxRhVsKNoav3YaG2J43DZctUMGJLsFhi0yCq5bhYTT4Mi0zrRT7SBZisUjXBiCCPO5G7GOpTwyKxGohOLr3C3hvSWwUNFtp7K80bhOxIi84HjDUUuEbayObecVLxZaex59WrJQeEMY4AtH/jTT2h2MAZvPcjNjRGg1aadlVgMJBlkMTW69thjD02RuOS/xC74xXomJuv4ozm4KHTf2sJvJcijI4UDU+SOW503TrA2MqLhg4PfFJXJC8ZH35UfdTEss1NeYwua1Om7O682CSehFzzYZXoMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbPdzC7WpK/2tg/s9h3Y3KTdD8QT9vS/xIsoEwcoJ4c=;
 b=TzqmxZNmrr0bYIN70vxeiaGvzzXEBcetL9FrdFSf50zFXioptKetCUpUYW71zoBIMFynJ3uD9YNfzFZgbUxMq8GbGQi6rT3IDeaI1bsFf5alowPCWmLhDOogPcSre6Ul/b9PtTYJQMgrpQ73rYwb6qN7tOVTli7qj7kFPgew20+0ADFEmyEJQiES5RGy92SKb7NHgdbxX4Fn0PDa0t/266N2IMLFSPe00SF5MGsHw8ZG4Vwbg/Pm7lTu4xqOQKPkRGC4zwYIRJ+pYw6ElpAis+wMn4bn12G/edT0peLtd+YlCt89nZZnDMr2OEPmnGcbBPNGf05j5kKR994ciH7+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbPdzC7WpK/2tg/s9h3Y3KTdD8QT9vS/xIsoEwcoJ4c=;
 b=lx+7VhOwO2dZPvODrJqmT1Qp37qWEvFA/m0uyk4CStB4eYh6+qQ2oHyKN9voZFwohz3gcRFc/+WBpV3R/gzG0iw/Y17BPabG59gI9F7cMTksKRbHQH/cfKHjKy/ExYcT6RsTgn+vAIYFWbYBvRlwj+H3XCTF8oz6/3NydUEBv7KpWY2gxZAx1JLP/UyO0vDgGqnbqXxV3nQzORvgqGYqsPO7sPALRQFyXmfaeGm3HUvL0+rEVxH8Y7P80U/ftkQhnmgWD9EM8Gl7dgCSWarngy9KLB6Z5qSBiHg3VgRO5y6zifLi+uGIAfzvkApxlKeJjlscvadB5jZKjxIxErDIKQ==
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
Subject: [PATCH v3 0/4] xen/arm: Fix eSPI IRQ handling
Date: Tue, 18 Aug 2026 14:32:58 +0300
Message-ID: <cover.1787050437.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B92.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::63a) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|PAVPR03MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a28dd87-6f4f-4b26-67d3-08defd1c7c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10067099003|56012099006|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	5sDXSX7sHK+pO5kIDCyVQ7xm9XUcJ/QxTFewR0SyWmbxJKkPYbSz6XNlqbJIBNCten15OhIzDWAlOJJeoCtnh1t1kBvbDMX5Lh/tWFmLBUq3tvRIu3wAO62pmbyoKEavIp+MlCQXWap5SswSXYT9vx1tAsko/tiVM93UGuk6LWFhr4S8s1W8nY62gHk2XeI+HXHRMaV+9RAJ8NRZWAf5z9VM31YRQJTjJNQGpeCy1BGcobucoNXKKDEh+BI1Ye4PvANMmAEIzFStLSlapaVRqFePuSBAuer/rWdlodm9RCk77GOoUFtsyaBvM11B8YY1w6Y8MCzmf/3n5B8hcWoHLOdMrnneZIf2odQrobKdFcc+CC3+v7hreXzYnVP7SOoFMLU20QIh4tzR2a8A0keYaEZnLSP6095r8LipxUeS+5Z+E/7kkAtYFOn8VZ+YgwYZam2Re+LZPJWqmT+EeMIx1U5NQAHpYlQSKNMyza2gnwG6d3NLaoEBaHy4EihgK4ad8ENsddS7Az6xBo92LOzVhCnSyP8DYLFKnjAC1LrzpisqMaynAGO2P1W1hQa+r0MkDd8l48MZ0qy2hNnT8ZqpaJrw7cubNiu6o8xmpf+aEORnO6wsgmWsDpbnBsXK16t5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JwbJgBo36aBhgkExis4RjaGY/Dm1es6jCJug2DiCuHP3isNxN4Mk7T8VaCOr?=
 =?us-ascii?Q?xwGsGqa328YXs7ow4IK95etmh8IwFlXGR3JObpk+LloF27CeZ+Fj2b21Lnoa?=
 =?us-ascii?Q?UPNxsQEbJwQbP7hzjkIe+56LR6sVBhF1pR7wYJrQkp7Nth5AMEYGldL8M8qD?=
 =?us-ascii?Q?PSd4S3Tx+nyor8U6vekJ63oClxlm8WQqKtiXS1PgnTuL7IatBE7ZpT+ORYri?=
 =?us-ascii?Q?5lEtz3GynFZO6dvJZ9YU5EYBNkr+GU4yglI4bSdf0XHENWs3Jn+++3judC1q?=
 =?us-ascii?Q?gm98swlm9JFjOGG0+UsQDTuxVXcpr4djggZXwrzCXL2NFIvwEdzO3mI8AS9D?=
 =?us-ascii?Q?MWpMfj/8E7bp0GgWOFrcaqIHxpb+Eves34BAACJh6QvJWgXMiUIrQH95jD4Z?=
 =?us-ascii?Q?VUZWFJVVRX3s6i5QeQCxPD9389KSAMwuB+Zyfc3vRAh/AV6Jd2nPjnh+KUac?=
 =?us-ascii?Q?FCczBXGJFtUpkYgJn90ujjyiDQxIRlMKJY1P/tXRimlFHj/CD5wLSAEV3NJ3?=
 =?us-ascii?Q?sAEOcr/0JxSpQltdYQxkTrgFUnChrMJLeI3oa6RM5ThN4t8cES+HWpVvu0e1?=
 =?us-ascii?Q?MJtmIeF/kd9MOUQHaEuXeVDb6fSCpaaaEBigbkDnv+a1MXPJG9ERzztp/+Xl?=
 =?us-ascii?Q?NrMxiWgE4Chm+Co6l5HHXHrCoUlhrhIGot6iDSRqhR67be9pB5rQM79rfDvj?=
 =?us-ascii?Q?o6orlzsmNCZlDFhj5wtJ6MuDOJwYWNlNjM7c9j3b5FP7/uCoQZLPOd0vONfU?=
 =?us-ascii?Q?Y8Sn6AgOC4mbpu6vdfIhGBTV95GP2U6vkWHG26CYWq8qp9l96Xn4CvjTsqqn?=
 =?us-ascii?Q?x1hqSeRjJ/1+LXsww+rlbLhbirC99p/NKHAmr0ksQOuN+p7OsCytOdQZEBn/?=
 =?us-ascii?Q?KsxfC6egGA4vEtYEMJQsTVVC5wwB+RfFtShTXwL1AMi8Df9v18ax83GDg8He?=
 =?us-ascii?Q?2TJ8Cm2yaAARdxds0ZV6EEIPw0VrsL107tnDB23QxLWiglL8MFTOW9O0IOZP?=
 =?us-ascii?Q?NDtu960DkH1W12fp4JmCK7ctDqcpIjE4DuSWK/OYl1+kj/jOABqX7JsDqif9?=
 =?us-ascii?Q?MAstWmog2XKb9Nw7SevkghbNrUQehTqv2GbJeYMe1MkyEaPHsEa2kAyC/nYd?=
 =?us-ascii?Q?EfUu1ZffnwEaTX8wv3PTmPVaPbmdPaNoNXwjzbZpsKKmAKXX9+myToG97il8?=
 =?us-ascii?Q?/l1dcw29AwDG7E8jBOZ6jOpWkhj4cbboNVmu8LaPytymFSTJ5FGHawCPk2tQ?=
 =?us-ascii?Q?qXEqr9uMmuotrP8FK6KuRMNvJM8wWjrkWHhiNG/F6FbaJJjfBitCzEIKj8ra?=
 =?us-ascii?Q?lL14dXJg7TAihCbhQ3OteY0gz84DqfK12OrzvLYV959oD64eyug8Zww3cE6r?=
 =?us-ascii?Q?0M4YBhMmrpnufpxUJ9A3jgVfYkdF28duKTDjaNR1W/GAMNB/CzwcSMtg7047?=
 =?us-ascii?Q?1vOr++9nCMEcNJoUY6Nwj2X7NOljWEbdRm2h2e/0aYQyTHBGG+FtkRnACagL?=
 =?us-ascii?Q?fQeW8iio6na3Jblj2LoEdFU4DoQyQRWeEJT2n4s9McaCFzBYyP9Yn2BkOVvR?=
 =?us-ascii?Q?jFzbtXvw4RfR9vd4IEb+nCW7r+lvi13h3pRK7E/UQuKieDmnLNucRh826ROI?=
 =?us-ascii?Q?PNJC3Doy1DHTnNELa9hfLc6AIzjYSnG6DEO5+ddLboDWLGLmtcf8BzrNFCIi?=
 =?us-ascii?Q?yXZd25JPhOGbDx3PXITbNoM2b6NdDwtPlUX51Fr8EdjA1Z4KK0sXtZC4phoh?=
 =?us-ascii?Q?JABrVSg9uQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a28dd87-6f4f-4b26-67d3-08defd1c7c54
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:33:12.1780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYm2Fq7Ug/wXv8RHPbI4E6CMeaRd+lugECTO8BT7CVBM8mAQpy97yGItrMjMC0euekD/SIpnSbrI6p0P2AqGRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9598
X-purgate-ID: tlsNG-33051d/1787052798-74E874E9-32FE4DE7/0/0
X-purgate-type: clean
X-purgate-size: 3112

This series fixes sparse eSPI INTID handling and checks errors returned by
irq_set_type().

Patch 1 makes is_espi() a configuration-neutral architectural range
predicate. Configuration policy and debug checks for unsupported eSPIs are
now explicit at call sites.

Xen has IRQ descriptors for INTIDs below NR_IRQS and for eSPIs starting at
4096. It has no descriptors for INTIDs 1024 through 4095. Patch 2 checks
INTIDs in setup_irq() and irq_set_spi_type() before these functions look up
a descriptor. irq_set_spi_type() checks descriptor ranges because the GIC
line counts are not known yet. setup_irq() uses the line counts once they
are available.

Patch 3 fixes the vGIC allocation bitmap. Reserving an eSPI used a compact
bitmap index, but freeing it used the raw virtual INTID. This could write
past the bitmap and leave the eSPI reserved.

Patch 4, introduced in v2, checks errors from irq_set_type() in the GTDT,
MADT, SPCR, and FF-A paths. GTDT and MADT could keep a rejected timer or
maintenance INTID and later use it in a direct descriptor lookup. This
patch also fixes MISRA C Rule 17.7 violations.

Tested with:
- Arm64 debug builds with CONFIG_ACPI=y and CONFIG_FFA=y, both with and
  without CONFIG_GICV3_ESPI
- FVP Device Tree boot with 64 eSPIs; Linux dom0 started
- QEMU virt UEFI/ACPI boot to a dom0 initramfs shell; this covered the GTDT,
  GICv3 MADT, and PL011 SPCR paths

Changes in v3:
- Add a preparatory patch making is_espi() a pure range predicate and move
  configuration policy and debug checks to callers.
- Add the requested assertion before regular descriptor lookup.
- Avoid partial MADT and UART state updates after irq_set_type() failures.
- Apply cosmetic cleanups from review.

Changes in v2:
- Check descriptor ranges in irq_set_spi_type() and implemented GIC lines
  in setup_irq().
- Keep the is_espi() debug check when CONFIG_GICV3_ESPI is disabled.
- Remove a redundant CONFIG_GICV3_ESPI guard from the vGIC code.
- Add patch 3 to check irq_set_type() errors in the GTDT, MADT, SPCR, and
  FF-A paths.
- Target master instead of the 4.22 release.

v2: https://patchew.org/Xen/cover.1786385827.git.mykola._5Fkvach@epam.com/
v1: https://patchew.org/Xen/cover.1783671887.git.mykola._5Fkvach@epam.com/

Mykola Kvach (4):
  xen/arm: make is_espi() a pure range predicate
  xen/arm: validate IRQs before descriptor lookup
  xen/arm: vgic: free eSPIs using the bitmap index
  xen/arm: handle irq_set_type() failures

 xen/arch/arm/gic-v2.c          | 15 +++++++++------
 xen/arch/arm/gic-v3.c          | 15 +++++++++------
 xen/arch/arm/gic.c             |  5 ++++-
 xen/arch/arm/include/asm/irq.h | 11 -----------
 xen/arch/arm/irq.c             | 26 ++++++++++++++++++++++----
 xen/arch/arm/tee/ffa_notif.c   | 11 ++++++++++-
 xen/arch/arm/time.c            | 18 ++++++++++++++----
 xen/arch/arm/vgic.c            | 31 ++++++++++++++++++-------------
 xen/drivers/char/ns16550.c     |  8 ++++++--
 xen/drivers/char/pl011.c       |  4 +++-
 10 files changed, 95 insertions(+), 49 deletions(-)

-- 
2.43.0

