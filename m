Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A60C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:40:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428172.1650879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uAT-0003ad-8b; Tue, 22 Sep 2026 06:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428172.1650879; Tue, 22 Sep 2026 06:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uAT-0003aW-5l; Tue, 22 Sep 2026 06:39:53 +0000
Received: by outflank-mailman (input) for mailman id 1428172;
 Tue, 22 Sep 2026 06:39:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x8uAR-0003aP-R9
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:39:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8uAR-008iIB-2y
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:39:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab222ab-bab6-0a2a0a5309dd-0a2a45068b34-36
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:39:51 +0200
Received: from [52.101.69.128]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab222b6-195a-0a2a45060019-346545800f7e-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:39:51 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DBAPR03MB6565.eurprd03.prod.outlook.com (2603:10a6:10:195::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 06:39:48 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 06:39:48 +0000
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
 b=r5T3Wwt2O+pfbXn/VONfM1aU9kbmJts/TCCtehrymI3tphR6ve9ve/9c09qPiLRoC4U6U1gMFsXIAtb2TZ6yfbi4HhXtMmEcOIZJ7a50QaKXBDn6PzfZUBKKJvY84LCALEOt2MgkA5Bd/GB4nvonvoQtVkTZ9H6QEDLIul2P/vcLkVu9L+Frq4WsDHxDuMKyXUiWMIYt7tgmpc0gm6KX5HaiUZtt4t7GbPx9TcbtTTJSZw2Jk1EK7OTX5Kv8Xao0xNzEuxhDsjoU+eyiK5OBBPfWTs3yKghkPK2vBJ3iCVz6kgSp2lksQoydtdyUnpwPB9lFpQ7WQSNQu7B0M5aJtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkE4kVFHXRYexVWKiajm86ZbpkVDEaJuKyl2Ebglm9Y=;
 b=OeVMO9LBDqMaIRtjmcG/Ep+5FqyH8wLBkII7ZnpSOR82GTUfTEsLYAX+tZYi79o1ECI6KRo11+PRsPc2bTS113hHjXUqvgB23qi59cyLkqJCQCgdnE6jWeTo8yYry5gx0F9eV0ZNkuMKd8+dgaStm6H7QDUEEVTHGN7U2OSPnrma4zH3q+gPLhh4vcRSUs5rxritH9Y35vqFTMnBDJdv7PYZqAm0YXaYkhGu8Su8maeOgBRVd3R6Q6vLhZXE1w6Bz+gz3kudqh5KRUqga9bTbkwLM3S9JyQKSSRWAbj0mFn021dTpw+pKEJ51qEMOcqxSjizrpNVylAJHaT7STMWBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkE4kVFHXRYexVWKiajm86ZbpkVDEaJuKyl2Ebglm9Y=;
 b=su5wyfmIQPYXZ/ZeefLUll7WfZpTbLRh3gLsSABgVTBOhEfdZS7i62NZIK2/5k66tqFsmhAvLzFq3LyATwbfS695JassJy3/b81D7q7wTvYfy5dPoniZ6FynhLI2n+VXHDzkJXmzuY6Sia+vWiMHlKDTMpH6oaklZEEbDsTfFzCw0TO+MnzGGD/KmVjkbZDz9yAR/ZbR5/IgVb062t8mXS8ePkcpubRY1Jbh0Z2d/vAgRUxzYWxTu/WWGIeFI8cK4WLter1RBrCR7xRiJJF8Ep0UiJ/NtYfr+A+mpuca5JheVxYrsIPw+eIoWwpzemZOXd+ePeocxHj3WUu/oAonmA==
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
Subject: [PATCH v4 0/4] xen/arm: Fix eSPI IRQ handling
Date: Tue, 22 Sep 2026 09:39:28 +0300
Message-ID: <cover.1790056623.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B7B.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::613) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DBAPR03MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aaf9d0d-3bbf-4081-f319-08df18744bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|11063799006|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DfRSt8qqz9jkmBOTS3juVKaVj8vDWYcl6S1mrqOqoc6uzmIifFTBqdjeQqNaBnUymN9JC6tb0ogWNEkOpTccIuYUTxXcZnKLIkn/AuLwbUOrviEEuMkm5alB/mD4GlPI5rfUjsqQA+pWXJu9400y+VOOKbuvi/aAFXbNyxhCRehJsCgSEtrIRF6a1lp3ItjZE91M3xyhP6X2iKgMKqLjE3AgcOZ5xxZ7iJzLHiSOG0QJgsdhvtklMzU3hrsiiqZCUSORjVM1bCc4S1XkySHpjudOte5LfSM1LQP7MUQoqqH7BBiwkQ7+mbsNsMns6zHa+3svZ9w4iZSWx2dmLJj93GuTmaqzYOjKTK7QD/fe2Zq5EA1K1eDNaZCANxCTJZEHKTBNM6vY6NLSh0JNu/HY9NuN8PH011TxwoaI3r7UADHeRdkn6GlX/JHZGZaEQ9JdQ+Y331164M3V9e0IAdOS1f5HAvs4gtxdXitDuFfy2+lRBo1lKu/fzKQISKnL5ieNswaIfsAD1y4Jm9LNBuqF9WxtKl1by0K4/6V2NWnHbNWqGXI2AY9N13yaiiNbiQ4OeGntqudzN+V0n4WFwBeBCIX2WObDQOQmD+lZET0Wzekx8+bkSZZa7kUYKkv4gz9+3RkIvN4Pd06YyA5IRFkpRBQmpi6uXxSyYmHd0q4MB+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(11063799006)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lvZW1H4OB+CelqRAOFl/XW6Hq/SpgDFlQJareTMKnJMPB7WgJOv/nYxFMEAp?=
 =?us-ascii?Q?5TC/iYEu9wearS1/0NLbJNJ2GLFla8HD2ApdZtH+Z5pIbJzyFA5A0/V00nxt?=
 =?us-ascii?Q?/mI08KCPjs6hk99KCx2ediK1HUJnNy4aMMoyjNrP0127xbvV00V30+sIY8s7?=
 =?us-ascii?Q?jHwFo4zvznnxNOW9dgGImUXJ5OIE17esVqw+gorSw83VX3U4My+oE7cQXWVY?=
 =?us-ascii?Q?dEv/TeycMDV6V0vGOpP/q68reqP7bGR9CEzVPOtwiLbLa4FnJ5gBcMFmN0w4?=
 =?us-ascii?Q?+zMteuRBHeJNuqGF9M1cnByPpCHt9X5p7Oc6eKyiNimMoWJ73Y2PAWwoSuf8?=
 =?us-ascii?Q?tcS27M5H5JWSditvslX8w9ygz0FjEIM3Nw/mFn41ZdrfhvrQRY8DDGrpgj2G?=
 =?us-ascii?Q?VmWZL7n0q9fafnGXZUNXt2+2kzL1qmY2vSpi61EKtA4bPwGRlRP6zOyxNezf?=
 =?us-ascii?Q?xVwa84fqTcVpq7LuMZ9vF5Ib3zRuUSMI5YQ5/mNZq4R2pgJuZoas4Uv0Y3wB?=
 =?us-ascii?Q?cKSD8KAQTwS0KHoKwSHOcCDJ31Dl6F8djLkUVSUekLneUzi3qLd3KChzJ+Hh?=
 =?us-ascii?Q?fCQ8+bzSnVhMRG18J0Qx1w2DjSWYmFvVC4I4XY9i60sFansaZCb+DkupfvU2?=
 =?us-ascii?Q?NniRvZXk+DXL/GTRLps4klhn4TOnTf+R06B37oWrjDXglwL1gUxDfnX/0w2+?=
 =?us-ascii?Q?MRrj3QdgY/BIK5fWN0rmOsRfc38miHvt8u7bJDdBiwhIqBlx8zffw8Hwk25D?=
 =?us-ascii?Q?QNDG2RQK5zBT7O7T23ra1165CgZuJ/YIDmghBJsJ7xuAhCtHu5WmBZGbRrTQ?=
 =?us-ascii?Q?AAi9UiFZ0E+mLAswYbLEqC5/9mEslwGzLbhUWO+CDn4o5gZFCBfjEXTcMa5i?=
 =?us-ascii?Q?z2fUODrbdP3FuOts33PFDd2rEUn0nFZK7MxCw7zYV5sbicYyeroAm9gQ+jD6?=
 =?us-ascii?Q?wiiQIH3RCRxVHUooIHszXtchILV6Cy5v6Ot2BzoPvmeAMQY8oKW3D0rSj8oI?=
 =?us-ascii?Q?GfuJslRpotMNZOp9anTqo+EBp8xMycCffM9FkuI2+m/kZ+E5mGo5oUq0T+X0?=
 =?us-ascii?Q?WpslWcmnohAjpo9N7AyLEtlTDuM7KiWBoHlgoC1vPOeHawCv35otut2b3HxU?=
 =?us-ascii?Q?a7JCPgmzUNcbE6oFyGEQL+UMYxk2v1kNGTQcbdoG7yl/P566Zt5qjPGtt1/X?=
 =?us-ascii?Q?sMFzqbuA9hn3nPA2h/7WIJ6jFRn+E+nH7oE+v1HdOKPE8OZdeeckgKVMrCuP?=
 =?us-ascii?Q?2yg7fkTb1Me+me/MU7g1qV8Zs/buxBDXYehdrs7A0ag6sUu2XRt7e1nOV5uC?=
 =?us-ascii?Q?bD/BKFVfWbJ+q4SZ8exeCqKjyQX/9yPqTzz3yjucUetMoz48IuDBl+YiLeBG?=
 =?us-ascii?Q?9OMPQYn7sU6+whXOpgMcLiWXjV9ppFO5AFiydyL19+5DcLD5ceDD2amIdI+e?=
 =?us-ascii?Q?FrqxE5UiDofmZhfH052eH/RpDdTlhtiKeqn78DyVAuQrsviSARHl+sgeD9oz?=
 =?us-ascii?Q?5LBZbNzRnermMjCzddg8vVMzhELpg7Hhhb5nKisZbjRSfzv1dmfuQroM5aRY?=
 =?us-ascii?Q?pf48J/KIUVvp56s/d4E+inX1/lPEKFGutXp7m9uaR5M8Ily+MG7FZ16hkoLN?=
 =?us-ascii?Q?8/kV/ZFRIo7908xPSnbBlUGFRjzbWc023m9b9wfw/gge5FNSXtTEoTbHX5la?=
 =?us-ascii?Q?ONiA49oVahxI3TD8mqq6zaj0REuJs16e790ObmW7rhf/gEMPEh8+3dJiwINJ?=
 =?us-ascii?Q?5m19sgbtqA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaf9d0d-3bbf-4081-f319-08df18744bd7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:39:48.3503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbmEuwiSQfB1TpomqcxIaNbRlXdl8vedH0xgqYZyZIVQElbdm/2K9Pj9J4FqY5ClfziptHZPAT9Cw1YPKrSJoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6565
X-purgate-ID: tlsNG-16d1c6/1790059191-1F4C977B-0CBFD5A2/0/0
X-purgate-type: clean
X-purgate-size: 4220

This series fixes sparse eSPI INTID handling and checks errors returned by
irq_set_type().

Patch 1 makes is_espi() check the architectural INTID range regardless of
CONFIG_GICV3_ESPI. If the GIC reports an eSPI without compiled-in support,
Xen stops with BUG_ON(). Virtual eSPI pending lookups return NULL when
eSPI support is disabled.

Xen has IRQ descriptors for INTIDs below NR_IRQS and, with eSPI support,
for eSPIs starting at 4096. It has no descriptors for INTIDs 1024 through
4095. Patch 2 checks INTIDs in setup_irq() and irq_set_spi_type() before
these functions look up a descriptor. irq_set_spi_type() checks descriptor
ranges because it can run before the GIC line counts are known.
setup_irq() uses the line counts once they are available.

Patch 3 fixes the vGIC allocation bitmap. Reserving an eSPI used a compact
bitmap index, but freeing it used the raw virtual INTID. This could write
past the bitmap and leave the eSPI reserved.

Patch 4, introduced in v2, checks errors from irq_set_type() in the GTDT,
MADT, SPCR, and FF-A paths. GTDT and MADT could keep a rejected timer or
maintenance INTID and later use it in a direct descriptor lookup. This
patch also fixes MISRA C Rule 17.7 violations.

Additional testing during v4 review, before the final edits:

- Patch 1: QEMU and FVP tests with CONFIG_GICV3_ESPI, CONFIG_HAS_ITS, and
  CONFIG_DEBUG enabled and disabled.
- Patch 1: pending lookup checks for all eSPI INTIDs, including NULL
  results without eSPI support.
- Patch 1: physical and virtual eSPI delivery on FVP, including delivery
  to both vCPUs and retriggering an active eSPI.
- Patch 1: injected an unsupported physical eSPI and confirmed BUG_ON()
  in both debug and release builds.
- Patch 2: Arm64 builds with CONFIG_GICV3_ESPI and CONFIG_DEBUG enabled
  and disabled.

Testing on v3:

- Arm64 debug builds with CONFIG_ACPI=y and CONFIG_FFA=y, both with and
  without CONFIG_GICV3_ESPI.
- FVP Device Tree boot with 64 eSPIs; Linux dom0 started.
- QEMU virt UEFI/ACPI boot to a dom0 initramfs shell; this covered the GTDT,
  GICv3 MADT, and PL011 SPCR paths.

Changes in v4:

- Use BUG_ON() when the GIC reports an eSPI without compiled-in support.
- Return NULL for virtual eSPI pending lookups when support is disabled.
- Remove the redundant CONFIG_GICV3_ESPI check in IRQ dispatch.
- Share irq_has_desc() with the assertion in __irq_to_desc().
- Log invalid IRQs rejected by setup_irq().
- Document the compressed vIRQ allocation bitmap above the conversion
  helpers, with an ASCII diagram and a reference to struct vgic_dist.
- Clarify the is_espi() commit message and drop unrelated blank-line
  removals.
- Add Reviewed-by tags.

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

Mykola Kvach (4):
  xen/arm: make is_espi() a pure range predicate
  xen/arm: validate IRQs before descriptor lookup
  xen/arm: vgic: free eSPIs using the bitmap index
  xen/arm: handle irq_set_type() failures

 xen/arch/arm/gic-v2.c          | 15 ++++---
 xen/arch/arm/gic-v3.c          | 15 ++++---
 xen/arch/arm/gic.c             |  2 +
 xen/arch/arm/include/asm/irq.h | 11 ------
 xen/arch/arm/irq.c             | 28 +++++++++++--
 xen/arch/arm/tee/ffa_notif.c   | 11 +++++-
 xen/arch/arm/time.c            | 18 +++++++--
 xen/arch/arm/vgic.c            | 72 ++++++++++++++++++++++------------
 xen/drivers/char/ns16550.c     |  8 +++-
 xen/drivers/char/pl011.c       |  4 +-
 10 files changed, 125 insertions(+), 59 deletions(-)

-- 
2.53.0


