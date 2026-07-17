Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35971C44517
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 07:12:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364686.1615693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcji-0005L1-Ht; Fri, 17 Jul 2026 07:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364686.1615693; Fri, 17 Jul 2026 07:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkcji-0005Ku-EB; Fri, 17 Jul 2026 07:11:54 +0000
Received: by outflank-mailman (input) for mailman id 1364686;
 Fri, 17 Jul 2026 07:11:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wkcjg-0005Ko-GY
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 07:11:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkcjf-0083ci-MI
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 09:11:51 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5b2-2eae-0a2a0a5409dd-0a2a450ab5f8-18
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:11:51 +0200
Received: from [52.101.70.136]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a59d5b7-f2d2-0a2a450a0019-346546882cc0-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 09:11:51 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB7985.eurprd03.prod.outlook.com (2603:10a6:20b:428::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 07:11:50 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 07:11:48 +0000
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
 b=LPkGhq7ccghLZUB68pVz67BS0Ml7LT5DzDFw9njTGqq/mH7e4s8k0rzCG9u/sGGvhAeq2ndz9V9f4sgzJXoMi2zKVBbJiB+MZZwFAejOoF8ZUDPgbDl84UJUYDyUAwE1MHNluB8KK+F/DJ0vFuHGeYyUmVeeI++fN/ASslrq16RNwNhxrP8pjprSmrXIWvehGU2uUpHXmyYZhxhaAO8ljXtu4NcxK4a7jRbNBuFZZRBCWqvgdRcyP/qhLYorR61sbtkoHxWmEdclv6FIJzlOlnehwVIz3vTPUM2KWI3kifLciPj0Ewk47Y5DimSJQ9jdEi2EQkBAREBiDAz6tOEU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLbehy9U2/IQ+lIXOREgc8JLuPhOZg9FYNjAJwc9rGU=;
 b=DtYX0FddwHN5uR/1OlnxQe6BM/2yeqI1fGEE7ZuYbdrUrSk+CDveF3GqbM37urq6iboxviVlTNUZErXnHYsKhnCApqtmTQXFzqWufM/jZzRkQ+LZznZxchQxDXCM3TjCsoZFOMoS8qzTIJ9dI00pOhYC4J0hvQ6UePnASow9Xgnr73r+fBABFbvfBdlYNxbqfwgVZt0KCjwjSQYAYtuIUm7IOiNnavXeVD2xGkdeNYVoxjBFrvO4WpC4xhkTuSOmFKttNEEfHCjB9s5L/GEjydp4LVPtX8nE5+gfGWXvWZ1ZKidpELRfSzT4cTvK443U3sjOsDFQ9HV8QTEbbGATsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLbehy9U2/IQ+lIXOREgc8JLuPhOZg9FYNjAJwc9rGU=;
 b=LpGOPi7lAFygfUqeJ2xaq7277eDugquEw9sleeaQBvl7BJmYRibNmKBVHpIwvHVXmdU1frymk6pn9Kmc6CtJe2IA1TVIxyvcN5y0hM+qTrKEM3PiwbGT85sD5UMEQrfqzuO70dT8iCUoFqbLzGRYOdj3INA73KNq/PyalvnDA1PyJZstC2sRbAlGHyKE9Dmhi9yeUBSSUhCzi68/pI0RNAdX/zpfnjat1iquGC24bxhPALPPc5fDH5bD5h+ezRUfpRcfXcxvqiWbWlZP+UNjeGhTXOr67qGCH1TaFQ41XAPEqr0kK9WG0qSiGBg3Q6ekTRZcy5HNxwNWc/cTd04YGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Subject: [REQUIREMENTS][PATCH v2 0/6] reqs: add Arm GIC requirements
Date: Fri, 17 Jul 2026 10:11:21 +0300
Message-ID: <cover.1784272211.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1fa0b0-d82f-4216-9b65-08dee3d2aacc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	NGmPmKOxfPdJvg9N8h+7KPQiO6jJ1FPSj4+IxNSCo9FCv9XyGvXG7ndFsJMAanYM+uWXwH/ttxXKsV0zsG/shnnkcnT01nuJ2Ds+ymA/Vtww0emizD9H4PfHT+kItsCRXO0BI/Q5UK4D3MxR26La5fW89u2nUklzvlDQ6gjUL0bHR5FrUDLs6v6tCoiEWBsdDhlzrYCWYmAz2l/yebfiYPW9rMwMjWnZ3BV1kUUT5NnI8f7aZwF/IsPF4DYLALmZo9P9Xeh+xI5GkwJFkC60HACty++QcdnJ/mNsa38QFPigxEEAZbLPgfOxmYsORdPoHOaManoo4xGhLriAA3zWo1w3NaYr++JLqN6cOZV45vkA7N3kb12PJ3uY2Q+0qD9rO1X2ns7jfGFPfNq8wx1hpDq1cLZcJJsPFDxOEeEtByXPLVSltUfLdLfQuR+usrbtWlWOIGX4SdY3UbzcqqsYBQ9idgmzB39yAB6VMtrRh9CDRrlyau6JNhzBwazqCkf7UmJtTJ/iJSVr7EHLwcvPMmg+dqu0x/nLDUB6IqdEntsfumpeY0DgDVtZXosTbz1KcREUAp0MRhw4dS+nyzs/jy296jauQgTD5KN8nFPJhxyTc6Kr13jtK3ua/o1NKf7e4oJ99U6eWr2lJME21XDe5rDAaT/jsD9RUKn/T8yVnhw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?axglwFHCQ3B3UYYEc1FXJgjoY/3VG8NI5N+7G2TrU4tGVJsgoF6pxOSJ1KDl?=
 =?us-ascii?Q?0P7HHHpJHvyC8w027J4Jah7rm15SGym/3h+5MFIX7FFcS1jrpE3uRvjC6PfJ?=
 =?us-ascii?Q?ejF2fKlcFznPXS875E3dCyASLPQtuw5k4IY43MJ786R8hnamKiYAFt63o0Bx?=
 =?us-ascii?Q?PoTAZj735eR6ehP8WwybTsEc+D5Vk8KJypcA4f8dhFeO9LLw95y25iIBsAZD?=
 =?us-ascii?Q?1ZLmmPMuK6TyGvhybgbbeK4qsXZsOXgOkSABfg3BtUHF2KfeBxaq4ze0J7F1?=
 =?us-ascii?Q?C0COxjn1PQjzLcNjcpvCQZJfTf76r5W0PTw5XdNLRDTz9f54bhvzydp/j5Pf?=
 =?us-ascii?Q?rZvbQUteT4KSz0lBFzSwklVN/aBSRM31WS7hhTy7TCeSqHzxlULHl7ywdG3v?=
 =?us-ascii?Q?8OxV7CFc8pHXzEcQR1XbImwZNiSVJJ1nmdWdhPnkgoxWJ+HrWe//SVshaxw0?=
 =?us-ascii?Q?xRH+LEgJXGAly3aT87EppaE89EylQXDHmAEXEhTWhnqkWnxO5XdN2uuS9uBV?=
 =?us-ascii?Q?pN2rWgxsh7PYx6HqZzqsdIYke+v8pCk7G9N4MiWUxW6ofka19+abpl8RTWGy?=
 =?us-ascii?Q?KOK3eWFqpLEC1q4NHvOWBDXu7G36YsyiCMvERNrowBwVc4bWvKb3T77P5hgt?=
 =?us-ascii?Q?GIQOf9fX+oS0Eyirn4rZQrOrO82ch6Hi7gPaMtvE5d/WUXdeGEcDvwXgcpMM?=
 =?us-ascii?Q?3PrIVD0nBPMIbJ2h7w97BCh+AIHOhGNMkceBRuBEa+I9BgtCKsS0qdoSDF3K?=
 =?us-ascii?Q?Zsqa3C5g6G2gbH3cINqraP43ousiXr1IROXQq7eFJljP0JhxITQUqbZTfEHh?=
 =?us-ascii?Q?m2tFiSewhqcYNPY1wsISPLZ9KBB1P2IeEHGi3mMUDqJHtDrd/ihlc/5JdtGI?=
 =?us-ascii?Q?W3SVzS8WxB24UzvOhuD0Ae5EVKIdnzOsCh6yaX+c2Jibcm8KmFXD1kzedila?=
 =?us-ascii?Q?bNS5xOLC02OpzmqSnoOq1GKvaBgzIBgNAaP2U3FEuH+X47nkPV34N9ScnhNR?=
 =?us-ascii?Q?wbQOvzd6gt+mS634p6XsdBcEHq6zt9kb7Qw1HLPlHUvqqHAgN1Orj8lIldoc?=
 =?us-ascii?Q?7kYZBPLrDjzb8mqi+L25+ZSGako6WTtWY4Yn10nhkj4crrPthZTl2Rfl7F6i?=
 =?us-ascii?Q?HhnvxJ+e11CNs6zfymILr4PyzAuyP0igTdQKBj8OZPeeBJqfKDn76Ym+R1UX?=
 =?us-ascii?Q?eoNPd1bQHMevWJH37FSvO33UFcER0Bzl8FCxLKz0lOANqvWotVn+XHdU+DY8?=
 =?us-ascii?Q?wvEaELHrcfUe2BBnCP4iQw9uOqkIVWsPEDmR6/9Z+NogyYiUKqAQ24haPjTs?=
 =?us-ascii?Q?hqY9FC4m+FhusVakc7Wbda3XO8uEin0NVmele2Aa+dseBe+iIQQXgRHgWr6j?=
 =?us-ascii?Q?0uS5rpm2eR4On/ylUK//b0rwD0q3Udph0gbyx39P3bBZHwXcOAwu0vzVt+Gf?=
 =?us-ascii?Q?RrMVOwCgUKL9HeKl5n7cvwi2ZJud6typL5NJpFE19/myQfXMiedHmBYel9y3?=
 =?us-ascii?Q?LxpT8UXqvIw3HG9Yokt1uQ897STLHB0mc3LzyzyTSNTwD3yfY1Zy2nm5WaFp?=
 =?us-ascii?Q?wGT8yNG3FSvDASPB+DMsc/3hhXSq9Ov3wpTSQt2USP3r+skf4IjhjwnJRKbV?=
 =?us-ascii?Q?njAliACl/H25Vme1pgasO82RODF2ImXPvk0IJ1VqkzjiAygXDVa0WHM2LXd9?=
 =?us-ascii?Q?noti6J7vMQtptTfNxr9Kx3b0PaYv8MK34hr8443a0JlCgQlvtCaQdke15wh/?=
 =?us-ascii?Q?dQY4GoOQgw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1fa0b0-d82f-4216-9b65-08dee3d2aacc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 07:11:48.4737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOyQhtIjL0v3NQI39WbY3ooEh6lnrZ6jezhYCdtEqwv79+embMIjNKRrrNyFcHG8diHFNyre7rHmduERw4Qs0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7985
X-purgate-ID: tlsNG-4011c0/1784272311-587CACFC-20A92C6D/0/0
X-purgate-type: clean
X-purgate-size: 2641

This series updates the existing interrupt-management and guest GICv3
requirement groups and adds missing requirement documents for host GICv3,
host ITS/LPI, guest vITS, host GICv4 direct delivery and vGIC direct
delivery.

The interrupt-management change keeps Device Tree primary interrupt-controller
discovery in the common interrupt-management layer.

The guest GICv3 changes keep the document focused on the guest-visible vGICv3,
move register-list scope into SSR descriptions, and document Xen's limited
virtual GICv3 pending-state and active-state MMIO observation model.

The new host GICv3 requirements cover Device Tree based physical GICv3
initialization and interrupt handling. The new host ITS/LPI requirements cover
physical ITS discovery, command handling and LPI state. The new vITS
requirements cover the guest-visible virtual ITS command model.

The GICv4 requirements treat direct delivery as a backend-specific mechanism
used by Xen's virtual interrupt delivery model. Host GICv4 requirements cover
vPE, doorbell and direct-vLPI backend state. vGIC direct-delivery requirements
cover guest-visible direct SGI capability, request control and direct-vSGI
state handling.

Mykola Kvach (6):
  reqs: clarify guest GICv3 virtual register model
  reqs: add host GICv3 requirements
  reqs: drop duplicate GIC version AoU
  reqs: add host ITS/LPI requirements
  reqs: add guest vITS requirements
  reqs: add GICv4 direct-delivery requirements

 .../arm64/gicv3.rst                           |  46 +-
 .../arm64/index.rst                           |   2 +
 .../arm64/its.rst                             | 382 ++++++++++++
 .../arm64/vgic_direct_delivery.rst            | 166 ++++++
 .../physical_resources/arm64/gicv3.rst        | 564 ++++++++++++++++++
 .../physical_resources/arm64/gicv4.rst        | 515 ++++++++++++++++
 .../physical_resources/arm64/index.rst        |   3 +
 .../physical_resources/arm64/its.rst          | 519 ++++++++++++++++
 8 files changed, 2175 insertions(+), 22 deletions(-)
 create mode 100644 software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/its.rst
 create mode 100644 software_safety_reqs/domain_creation_and_runtime/domain_partially_emulated_resources/arm64/vgic_direct_delivery.rst
 create mode 100644 software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/gicv3.rst
 create mode 100644 software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/gicv4.rst
 create mode 100644 software_safety_reqs/domain_creation_and_runtime/physical_resources/arm64/its.rst

-- 
2.43.0


