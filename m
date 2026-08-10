Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B905C5B567
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 18:39:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387757.1628987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtUtx-0003rI-TA; Mon, 10 Aug 2026 18:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387757.1628987; Mon, 10 Aug 2026 18:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtUtx-0003rB-QC; Mon, 10 Aug 2026 18:39:09 +0000
Received: by outflank-mailman (input) for mailman id 1387757;
 Mon, 10 Aug 2026 18:39:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wtUtw-0003r5-68
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:39:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtUtv-009VLW-J2
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 20:39:07 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a7a1a9c-e002-0a2a0a5209dd-0a2a450ba360-38
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 20:39:07 +0200
Received: from [52.101.70.125]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a7a1acb-b7e8-0a2a450b0019-3465467d094f-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 20:39:07 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by GVXPR03MB11092.eurprd03.prod.outlook.com (2603:10a6:150:2a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:39:05 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 18:39:05 +0000
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
 b=jj06GD4Ya6mMdi1TTCLyxnC2ZcN8Dza/D87t2MSRCtMEqqaT/VXhdioR5GbpsF6yqpZ1A/SqipH6S+FP42VWKDCMfRzqAKzyZWP9RyLaKf48AZpPydhj9rmUI2OZxuwShqDZKqCHxx5ee9IVvnGFmsxO2DgNm6W/yWgDH1B2UNh/E3XETFOHZy/TXg43vJEoKKgRWXWSXywvdrrhFo/6K+6cSRfl4/qVYSGDd6Q8HOrSlSXbCIn+jOE4FLDEJQdUVgCa0DtoUNt475V3ZUs3guc1pEsgbv30TrXovNfKSdlksj4F2PyhL/e5W5/KcD2TVXEA0K3C48InX3yPdfOqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApfjuVvydupd2rUlQk2WyhjFCE9BsKkNyBdZC9YvoY8=;
 b=dXPFgJllcdkfgk+U9eu7g+ScQZvTWOTQ6R+2W3exXnFtnlrKLk9yIfncBYWBRCWZFUsibybGvJmdvayVkG6fAjw1ABGoTgSRNF44kseKpPBrQIqpCg+xYBmiWRqJC2yCLXjuhnODuHSoSrsaP3Oyz1PRrVMq1MECWkZiiIEgdoxXUfU1FgmnfuT7GALifqMrNxQiaPPgrGiWXBBxmchMapzWOk+dbP54Iuopa7h9Xy+U0lFBOks6uOoDvjYnMW5o4tAHn2uib+hWGi36DHFUEpLlH2J+uRDlvunlndrijAt/aMGxU2Ibx3Dhcg9BazYeHF6+0iiqu13oRiod6YO7gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApfjuVvydupd2rUlQk2WyhjFCE9BsKkNyBdZC9YvoY8=;
 b=BwexvDA3nCJqyxCDH+K8vrNGkjfDdEqAiqNl1VQnW/p4fPNoduOhi9g10/oqRy1sNfVDxwcu/hOzm091PNyVWzU5koDpeLKqqtB1OMmuupUoxI6OPz0C50EobHg1UIE0E4CjX1js0Mzy4iQ7qck4baFoN4LP/fM6h9FSINARbZMKFzeNqv8u4kj9iysE1jaTfpW3xEbS6ObE8kZprbYQsmClHzJOpwAfXDqD+7xVsohRS9uPxOShoIGJgwL4uARpgnwkyynKXnpsdTl5A0NLaaOoqjwfg2YtzmP0cpknhIzUlwrqzVt1u91vWUoDtjbrhhmteFUxkwukK30tmscyjg==
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
Subject: [PATCH v2 0/3] xen/arm: Fix eSPI IRQ handling
Date: Mon, 10 Aug 2026 21:38:44 +0300
Message-ID: <cover.1786385827.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|GVXPR03MB11092:EE_
X-MS-Office365-Filtering-Correlation-Id: 320c9fd1-d5b5-41a6-31b3-08def70ea796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|18002099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	qKGKiW4ol7W3hk3YPSqDQOjW/jHbwjwSVHyzVgYrsH/mpyBr3OTZeU3/boPEc3RSBk975QUBXZ8pdL3szIrHs0RXvjmeov+i29u1wrT0NB0lSfvcwiIPYEWg5OkT8humvTEqI6ScZHFMTCTZm+sn4aXuwmXEtceKDN1mgy/+q9dBlAQ9EefXihNpCp40jTaCPbP9FAXBPgBdlT2K0eudnK0bbJiDtOvBlIGuCJ9vTca3LSzeZJNBjB9q+XUpBGe2rZPcdkeOPsjQsCP3z8zdC5jPyOdAONdIl+CSQmgsQYgmw1AGvOwxIuRw3pK4oQG0UckfUXtfIh1U2fuRMXsLOJsCgvR0R9XXoIsfmJTUOz6QmxkHz71pGNXQRg5nOjXOrWryclNI+ViBTHuh9+tv8C8wB2X0FMvfCSVsI0GG0Tnj46mTRrG0uAUNVBu5X+DqqgC4XV2Ze3mqUB2heb5l6gnqIciwDp9sRefp9QCinfp0WVSLVG4YN1tfy6Qy00rR3WJq0sjCXIKyAxgemGQLUlkkNWV933t2UQsyx5eL+8vyRaJCOPF2jaKezGihfwp0QK46xqtGRwOAlkbKXSgWH+h1yVgdzeQ+lN8zsJZraIY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jpIRXTn8qK8h832UI4Doeo7kwPOQPwEKHYsVNTPwYxylw4ubIOviPElKni/0?=
 =?us-ascii?Q?B0lVB9PQr4gMhm3S2hsENLvee5Vos38rST5KZjoPROxu4DUxx6V7FCK8HyuY?=
 =?us-ascii?Q?g65qX9lNDgMLiYsOf6rBJ6u6Ml/5qGar3In7VMka6e+fkFQke+X07+qhge1f?=
 =?us-ascii?Q?HkirX8GzGeOEjIJaGtO3z4xc+iFMkd8HJAVWn/evaUJ5FrjuD3ionOwzZh5i?=
 =?us-ascii?Q?bU9kAAFaho95N2GS4mNeRVx8RlnIFMWjsraHHC4eso9wlEIJrBDcMOJgHY7P?=
 =?us-ascii?Q?VAKZWzGQUBeK1pTkiPquh3vYv0SGuM8VTL/lL12CI4y6/LfK5EJ+LkfNumYD?=
 =?us-ascii?Q?BLHMaUY4S2q+PtCwOeuu7JRoivydZhcYxtxi7SbYEe0aaogGtXAMIADwe8rR?=
 =?us-ascii?Q?lhS0CD39LFlixPG7KeIfjQyOOFtusINJ7ZJ9iq9IUbHE7LhRMM5JB3tlqwJL?=
 =?us-ascii?Q?KZbjEAT/Nztv2YRduLTg6G5oeFIE3gI5zey5RF+AcQLXKav+mBUFMLmYgXp4?=
 =?us-ascii?Q?0McrUZM9LPdBEVJ+v85tEf+3JRxFVxTxm4kBMdtjIvM+Tx2JBZjfHtiYTw7v?=
 =?us-ascii?Q?yqx9m2Li6sjy01e6uuk3aoY9dnsJ1EQSf1UfrUogQAGoo1+042a9jF+eEpk8?=
 =?us-ascii?Q?GxWGS+ZN7QNpebpABHHQJzHJgDGZI7Q+9ayhHPV1gvXwoCawCvP/7GvDzJ+X?=
 =?us-ascii?Q?smjzHdeIXvuIbjMjwjNGMg0Jg+OZAGYi7wk6wxNAw1BioNkvIyOFuhI0jNt1?=
 =?us-ascii?Q?DfNwLxHdO1gAmXC0TptKUyY5bXAdgRaqaAZoRKq7KHWTKZ9LutyCWUlFIWNE?=
 =?us-ascii?Q?STiM+XQhmPBaL6ygTwCgsq0aDrMIgT8ZvIFnXuDu3VaGtQGiI8dE3nCyyc7w?=
 =?us-ascii?Q?lsBI9MrufDcT8thFpQv+OY4niooKTe7IF7dFoRFRF0OJifm7I8ZSdpeik5VC?=
 =?us-ascii?Q?fGdRieitfO5rCv2a3eKrSlUT6vAig60Kj+KIOCQxYooGTJzqFPf/YJPG8M2U?=
 =?us-ascii?Q?kBN8dWb6ISkQO+xFrDXF8CS3W9RgjT5x4Hz1dUG3edKR3RJ+RI98qIirOAKg?=
 =?us-ascii?Q?H1KgCx/TwAXR60HOyfTlShvVJA/dPNNy/FLDXyc+c/wtDb5guEq41SN5GKt/?=
 =?us-ascii?Q?tIxxP/+5o5bs8cofNncDufbhuRJOI71q2OgwjXhvXyg9o0wRwM1LXhcNcvcw?=
 =?us-ascii?Q?14ovykgpiMhKNwAJLpOqgBMSPuDGKFVVcXR/EOO5fl3hIolmRWQPkXlm9kS7?=
 =?us-ascii?Q?IJ3wrFIOe2s2+6GST+7zIPxu1y2qKt29VzWIWFssO8IasQp/7jLP+VoKc5HV?=
 =?us-ascii?Q?99D1Htf0ixkmiPTbIt6rE4e+ZNRbCEsOLI7cyv9rMonl98wHXUdhier0r+Uf?=
 =?us-ascii?Q?c7wMFaIO40VhY2eCfQWCvVHwryO7mpPx0DvzDJJs5pFBzreuyeUBDDFDIEM+?=
 =?us-ascii?Q?lFyab8lMp/lAgol1d+sDUxM1RiJ3LDwEWg35eQc2RB3afGkZMHifktFhbSDA?=
 =?us-ascii?Q?OWtiavUVm9qb9MdSOk9rELNV3T9xFRuM2GFxRpi3RFzK4IunKYYUAdRtrzk9?=
 =?us-ascii?Q?h1brqKg9N1inCiFHoS6pPtGhTxsESruHQZzLFEg320jgrK0xH2DZSb1aA7dU?=
 =?us-ascii?Q?zCVCcB7GnHdyYyJ/Q+L2QHoxa3lI320ydWzWyBlki1+ST7SANZgY7B2gBk+P?=
 =?us-ascii?Q?3BXbzRbx8XAtuaFKMfCkbul9fpCgsM4eTVOH3acoxTNe4nL2eTa3V00wOH6d?=
 =?us-ascii?Q?OMwQUyP1Uw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 320c9fd1-d5b5-41a6-31b3-08def70ea796
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:39:04.9618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mU9lD0hsQBYUO+WNhSqACEc/MVrbt1DKKhBWpmZEIMzbGRmkcASGvWO9aWeiVL97EAsZyCs86vsQPRoXWcicQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11092
X-purgate-ID: tlsNG-42698a/1786387147-AB6D29EA-AB4E72D4/0/0
X-purgate-type: clean
X-purgate-size: 2349

This series fixes sparse eSPI INTID handling and checks errors returned by
irq_set_type().

Xen has IRQ descriptors for INTIDs below NR_IRQS and for eSPIs starting at
4096. It has no descriptors for INTIDs 1024 through 4095. Patch 1 checks
INTIDs in setup_irq() and irq_set_spi_type() before these functions look up
a descriptor. irq_set_spi_type() checks descriptor ranges because the GIC
line counts are not known yet. setup_irq() uses the line counts once they
are available.

Patch 2 fixes the vGIC allocation bitmap. Reserving an eSPI used a compact
bitmap index, but freeing it used the raw virtual INTID. This could write
past the bitmap and leave the eSPI reserved.

Patch 3 is new in v2. It checks errors from irq_set_type() in the GTDT,
MADT, SPCR, and FF-A paths. GTDT and MADT could keep a rejected timer or
maintenance INTID and later use it in a direct descriptor lookup. This
patch also fixes MISRA C Rule 17.7 violations.

Tested with:
- Arm64 debug builds with CONFIG_ACPI=y and CONFIG_FFA=y, both with and
  without CONFIG_GICV3_ESPI
- FVP Device Tree boot with 64 eSPIs; Linux dom0 started
- QEMU virt UEFI/ACPI boot to a dom0 initramfs shell; this covered the GTDT,
  GICv3 MADT, and PL011 SPCR paths

Changes in v2:
- Check descriptor ranges in irq_set_spi_type() and implemented GIC lines
  in setup_irq().
- Keep the is_espi() debug check when CONFIG_GICV3_ESPI is disabled.
- Remove a redundant CONFIG_GICV3_ESPI guard from the vGIC code.
- Add patch 3 to check irq_set_type() errors in the GTDT, MADT, SPCR, and
  FF-A paths.
- Target master instead of the 4.22 release.

v1: https://patchew.org/Xen/cover.1783671887.git.mykola._5Fkvach@epam.com/

Mykola Kvach (3):
  xen/arm: validate IRQs before descriptor lookup
  xen/arm: vgic: free eSPIs using the bitmap index
  xen/arm: handle irq_set_type() failures

 xen/arch/arm/gic-v2.c        |  8 ++++++--
 xen/arch/arm/gic-v3.c        |  8 ++++++--
 xen/arch/arm/irq.c           | 29 ++++++++++++++++++++++++-----
 xen/arch/arm/tee/ffa_notif.c | 11 ++++++++++-
 xen/arch/arm/time.c          | 18 ++++++++++++++----
 xen/arch/arm/vgic.c          | 25 ++++++++++++++-----------
 xen/drivers/char/ns16550.c   |  5 ++++-
 xen/drivers/char/pl011.c     |  4 +++-
 8 files changed, 81 insertions(+), 27 deletions(-)

-- 
2.43.0

