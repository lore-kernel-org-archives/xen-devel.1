Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B65C98302
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:59:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429189.1652115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92tZ-00052l-FU; Tue, 22 Sep 2026 15:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429189.1652115; Tue, 22 Sep 2026 15:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92tZ-00052e-CJ; Tue, 22 Sep 2026 15:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1429189;
 Tue, 22 Sep 2026 15:59:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x92tY-00052O-Do
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:59:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x92tX-0051tn-3A
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:58:59 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab2a5b1-2eae-0a2a0a5409dd-0a2a4505e8b2-34
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:58:58 +0200
Received: from [52.101.70.73]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab2a5c2-4cb1-0a2a45050019-346546493c53-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:58:58 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by PA4PR03MB7454.eurprd03.prod.outlook.com (2603:10a6:102:e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 15:58:56 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 15:58:56 +0000
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
 b=EjGhAmv94wQwmbQTPoWivMOmGv5se1OtwgRUoDFHUOZdHF88/6g58lXk0WB85B/SbaCFOy8VIRBtRQejKbh4v2Jv23Y0+rVvYIjCR75LuPLcTD8mYe8vZmSBXzha9qI+N7U5eTil9Z/pwODt9XXhy7YfO3u+tL3Gb4QL3ooxZzv7m4fGRj+5KRYoym/q4mz4nfKV/uov5/13+BMJVMVPHQEq6D5jLQWAE6fPmf6HHVIm+Mahcki0iSNnelVRY+QPArwCwBwUw5zZmZPOHZQEpDp+gETZz66CW5i0y99bEZWEMS77nQbA9PHHa1AFrOA1wBp9ggum7QQrc4pL30g+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xa+6kpBTzi8jr+B+8LiuaqduRKG8Hj8+jv1H6RbdqYY=;
 b=xiS3yTCOQb6Z663FPFDoXlF4rHkf4sbhudZGUBlFHawmJS1bGf6ACBYXhs6eiLujsr71sPAATdUf2Rlb8LQWoNTWiF8IzmueiHCUGGMwNpLux4TEhNmrqe7XrzNo5FY1T5e2w7o6QtR22XsTacNbcmqavOyW0XZVI79g5qmLjue2ONvkdwsOUQKM7+IiTTT9fxjVbxCIQGO0b/bBW751BqL6ETvOEoH13nQNPgzBMeuGdPvM4GWXX8uKId01D5R9Q1RHTGnEvos48Ia8uNnWNwa0itaJ21SepIB6crAarBoH+9ydcpjb0OQs5eF39n65kA3Lq+IxaSSvXNQZEYQleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa+6kpBTzi8jr+B+8LiuaqduRKG8Hj8+jv1H6RbdqYY=;
 b=B/RVCT1FPTPRGZr+0HsWLQodn6y6wKIlQHijcP5wnGcquRdPDiSC42p9iiWoWE4ttFUZytbR0ePylOztnyutNuCBMXBWvCkjDP8ik4/PlMgOTo18tL4g+QIpAw9sotttoQdygMKyAiqR2HWpfCdildN2rROWYbOD3HIq+yK8amXIrUTOZXrA2MJggrCVDRKxYWoITU4KZXXQ1BMSpciWty50GXzUzI/WoooHbooJ6W7kPqk8slRQ0ZLJPFELldTqHILn2mNaejZJorwBr0LznKnq4whVkNaCo/tI6SS/QhDs01pe0YVz/7m0raJgNVMWRxiwXW+0PhVcvWM48Xqi1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 0/4] xen/arm: gicv3: defer host LPI init and split ITS/LPI quirk scopes
Date: Tue, 22 Sep 2026 18:58:38 +0300
Message-ID: <cover.1790089161.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|PA4PR03MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: c7539e0b-313d-4ab2-4d8e-08df18c2684f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|3023799007|6133799003|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	iK3NI73cXfMP0vGDqdqsyBSEKd44ENGWRw6MiWeWmQCPbcbk2GmjdkiZ+100QgWvnWZihc2Yka7ZakHlvormB0TnR01zwSLpDYRkFEH7Bg1KBvKzJi3NoI4irbaHRfrxZgj24Vdj6qYAD4G0EK6m7GxnVlPxCDWlKdWp8xstkTcEWKysNxJsB61quldLV22meml7pSuE3aKOFEfAaEr1pzuiOTP1rw8ShKLYn1DpPXaYy2yu+I5rR/+4CsnyYcGucryKxe2muL7mh/ipSb8G5m/83Xdw3yH2rnq28POX1bvfP1e1Uz0LmX1QJqBkjYkwVhjwplsyVpi5SAbx2XrU5WGkO1jILRXayYejtAiQ95cCqNaorpivcP6vkU5oJ0TW80Z7gJQ5A45lVIe/IPM5j225v2f5cnffHEHIhrnckZPDpxqgIrtrb5ySDnPc9Bh6wS7Y31KnxsmzqNDUyqtERjj9Kut7oB9E7i3gqnq7hMMMdecqvHQ47WuuyXH17UnchjY/YguHo0q8uLxnk+FEedj4d22MXYfWYkyvsMB7KL2RVn8pzVLkKXz1C2dLh/ZzHJIXZI0PvM3cE5qTam5aQDxMISbciJKBh68+7byWV2ipcHCssoxl/R7csDWjrVXESkSCCBY8BdamXNpOfslvP7VhAZamVxgg4TZFDzvyuh0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(3023799007)(6133799003)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?luch2lsej+wY0/qWj45QsfqVD1pMsjbpy40Kdj55lYkxfENTx6FwNq0SDhiq?=
 =?us-ascii?Q?qdi6E6XaES+tzl5SygkdxNZfOGSP1KT11nbvGWwYE+ByXqVBMJE1I7LDS/Xx?=
 =?us-ascii?Q?tlgwHEE/OOQkPh/r5LO38GEH2V7lF5UYPGdlRp7EbKvLpqiq0l3skO/gOZa7?=
 =?us-ascii?Q?QdWVdVo2DlHXrcXBMoWFbOjHHaCAKySOEGYeQoP1FJfJuFq+gTKzvGKeycj8?=
 =?us-ascii?Q?d+lCFg9JEbDXJUH5CMrzuPwWcrk+Ah/I2tEMpo9osMqjBayJS6HBboNGQrTZ?=
 =?us-ascii?Q?rUjVner9aSr2RrlNSBaZwXJCXdjtPcuziPZwq3nua4GjzGqj6NimyNaczOP9?=
 =?us-ascii?Q?fCA9+p7LPLwV4Kmhs6fBUImSsfKUQdpgdudazHIQbS8jl6tMQ68NaE+GmWKW?=
 =?us-ascii?Q?2prSoP+HdSSB+nCzFzbJ/j4maUihTWvTK9LCM/XcO5HAzi9Ozx6et3D+jxZK?=
 =?us-ascii?Q?GMbou+jULDRUX4yW+Oc9mh4P/xiqC/CbGvFu3guv9um71l8nsBauWkLqdheo?=
 =?us-ascii?Q?4GLbKSulhDHdVvUSMseES5eLbgIOTe7O30xZLeWSvowx/uUztMJ3NSivFij3?=
 =?us-ascii?Q?55sUIEd5df6HxV0GJzM6IO9s65sWCsmyBAWuPr8S/3APJPIPpY1LKwnIRmtz?=
 =?us-ascii?Q?2nmN8xT28uZqhm5x9FaS3hZutoQlg6vDM1bfGzfF15/yTKxcjPXjW4moaiS4?=
 =?us-ascii?Q?siqX/RzyOnC505o4LKWSGdwRBP4sIAgNgNj6vWbffeQdJFZX3DqfKP8MWO/i?=
 =?us-ascii?Q?3hQUOR0J+FYQBKXkguxIK97JL4hFzSI+K7iQs5smT2jF3BpLv7vMQPtzWZB/?=
 =?us-ascii?Q?ppqtq6/xGtzfXdc1bL1lOXEjazMScMn5axIAmZIvKYPAZ+YI8+VVlsJIfqlN?=
 =?us-ascii?Q?YWVSqlKtQN2x4TgfTWJlrwl6EmYdw+zG+JBTxHTXnnK3SWtud5drOp6sqOnS?=
 =?us-ascii?Q?FgQX5hpMoLwyk2r/M7KwT027s29U0h1TBo7kq53ocMUzyEAhXMdZgWzgBi11?=
 =?us-ascii?Q?+b5KcHUGr6hqjsbufo0Kp3fkiHtYU6qWg+evkqc3DioFr+gr3DNV1ZpPST8F?=
 =?us-ascii?Q?EhcEsbSd3CeGEdMNYdt5TGfQWHUhohMmTrj2oURRZ0d7RasShuOLDIT5Xh2K?=
 =?us-ascii?Q?FIHutISr7hrR3Hd9e+JOQzGVIWeZ86DPN59tw5rRN74MBYZSanl9OhfRgeln?=
 =?us-ascii?Q?UCn2SHAzScfJvyUaioVJZ32oEse21t1lXWwIr7rBH5yeE6RO7UfOKZaZWVxe?=
 =?us-ascii?Q?ENJfv/o+vhj+TJkTLBfLbH4uoRmOzRTNQ2d22JjgJPjPKx/Ne2ESrfb8C+QW?=
 =?us-ascii?Q?vLk3QjtqtKIXr3PlfseqgmDm7m7kUhaVX/BAxe5sqEexFLRudQxdBUSP9KOM?=
 =?us-ascii?Q?b8p6Czm9nZABU2Gqro8uqdj0gyuROSjIfleK0X+SXHCvRM785xmUNhlxFR1H?=
 =?us-ascii?Q?wh4ygJurPCsikw/nYsf03vgh3wQqVSNPwJibhkbZs7ndFAsZlA5hEWGht87I?=
 =?us-ascii?Q?Z8STjqlHFTr2kECCS0sPvLu0sv53P+/7RwP2NrCBcqiFaPst/JuXzAThYX/o?=
 =?us-ascii?Q?D9jT4HfunkvUpZjvRYMyfydkv7GO2QkXE3wSVXGrZEV2GGVLRcQOJ8W7goW7?=
 =?us-ascii?Q?2zVpRtZcXRiQQRr3RdG2JuB+CEDzuqoHoU+kovMlvBXlAkx4hYovgFAYz1Bm?=
 =?us-ascii?Q?Y1J0N4yPH4EsQc8FzqwdJ7kLPtP7KV3VbBUZLLr+N2RjinWcEGUgzgkGag/e?=
 =?us-ascii?Q?GEmJkndM/g=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7539e0b-313d-4ab2-4d8e-08df18c2684f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 15:58:56.4890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIDbIIpwT3zvS8Eqe8I2Yszi/a1RqXxQMLt+UJ8llJBfVtVaO/6D3DnEsajSWAsrnyXBIyh2IaGk22uK/eWW2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7454
X-purgate-ID: tlsNG-c201ff/1790092738-F46A52A1-83ABC2E8/0/0
X-purgate-type: clean
X-purgate-size: 5318

Hi all,

This series reworks ITS and host LPI initialization, separates
ITS-private memory restrictions from host LPI/Redistributor
restrictions, and adds support for the DT dma-noncoherent property.

Patch 1 splits ITS initialization into preparation and activation
phases. The preparation pass maps and disables each host ITS and
collects its quirks. Once all host ITSes have been prepared, host LPI
state is initialized, including the boot CPU pending table. Only then
are ITS tables and command queues allocated and programmed, and the
ITSes enabled. This sequence is coordinated within gicv3_its_init().

The subsequent gicv3_cpu_init() sequence remains unchanged: it programs
the Redistributor LPI table registers, enables LPIs, and submits the
first MAPC and SYNC commands.

Patch 2 replaces the global ITS quirk state with per-ITS flags and a
separate host LPI policy. Per-ITS flags govern ITS table, command queue,
and ITT allocations, and the memory attributes programmed into
GITS_CBASER and GITS_BASER<n>. Host LPI flags govern property and
pending table allocations and the attributes programmed into
GICR_PROPBASER and GICR_PENDBASER.

An ITS-discovered quirk contributes to host LPI policy only through its
explicit lpi_flags. Per-ITS flags are not implicitly aggregated into
that policy, and different ITSes no longer have to share the same quirk
state.

Patch 3 replaces the fixed IIDR/mask fields in the quirk table with a
match(hw_its, data) callback and an opaque data pointer. A reusable IIDR
matcher is combined with platform checks for the R-Car Gen4 entry.
First-match semantics are preserved.

The R-Car Gen4 entry matches only DT-discovered ITSes with IIDR
0x0201743b on machines compatible with renesas,r8a779f0 or
renesas,r8a779g0. ACPI-discovered ITSes and other platforms with the
same IIDR no longer match this entry. For matching systems, the
non-cacheable/non-shareable attributes and 32-bit allocation
restrictions are retained in both the ITS and host LPI scopes.

Patch 4 handles dma-noncoherent independently of platform quirk
matching. A property on an ITS subnode affects only that ITS. A property
on the top-level GIC node affects only host LPI/Redistributor policy.
The property is not inherited between the nodes. It selects
non-cacheable/non-shareable memory attributes; it does not impose a
32-bit allocation restriction.
---

Changes since v2

* Split ITS initialization into preparation and activation phases,
  with host LPI initialization between them inside gicv3_its_init().

* Collected quirk flags during ITS preparation. Kept the ITS init-only
  annotations in the initialization patch.

* Documented the intentional narrowing of the R-Car Gen4 match,
  including the exclusion of ACPI-discovered ITSes and other platforms
  with the same IIDR.

* Added the non-debug NULL-data guard to the IIDR matcher and placed
  the matcher data and quirk table in init-only read-only sections.

* Dropped the redundant aggregate host-LPI-flags log message
---

Changes since v1

* Reordered the series so that the minimal host LPI initialization ordering fix
  is first. Patch 1 is intended for 4.22.

* Dropped the v1 ITS pre-initialization hook.

* Moved the existing gicv3_lpi_init_host_lpis() call after gicv3_its_init()
  instead, so host LPI state is allocated after ITS workaround discovery.

* Checked the return value from gicv3_lpi_init_host_lpis() and made failure
  fatal once the ITS/LPI path is enabled.

* Replaced the old single global ITS quirk state with separate per-ITS and
  host LPI quirk scopes.

* Removed the implicit aggregation of all per-ITS quirks into the host LPI
  policy. Host LPI effects are now expressed explicitly with lpi_flags.

* Kept per-ITS flags for ITS-private allocations:
  - GITS_CBASER;
  - GITS_BASER<n>;
  - ITT memory.

* Kept host LPI flags for Redistributor/LPI state:
  - GICR_PROPBASER;
  - GICR_PENDBASER.

* Refactored ITS quirk matching from fixed IIDR/mask fields to a generic
  match(hw_its, data) callback plus opaque data.

* Kept first-match semantics explicit. More specific entries must be listed
  before broader IIDR-only entries.

* Added a reusable IIDR matcher and used it after checking the Renesas
  machine compatibles for the R-Car Gen4 quirk.

* Split dma-noncoherent handling by DT node scope:
  - ITS subnode dma-noncoherent affects only the matching ITS;
  - top-level GIC dma-noncoherent affects only the host LPI/Redistributor
    policy.

* Dropped the Orange Pi 5 / RK3588-specific quirk patch from v1. The
  non-coherent GIC integration is now handled through DT dma-noncoherent
  properties instead of a Xen-side platform quirk.

Mykola Kvach (4):
  xen/arm: its: initialize host LPI state before activating ITSes
  xen/arm: its: separate ITS and host LPI quirk scopes
  xen/arm: its: refactor ITS quirk matching
  xen/arm: its: handle dma-noncoherent on GIC and ITS nodes

 xen/arch/arm/gic-v3-its.c             | 203 +++++++++++++++++---------
 xen/arch/arm/gic-v3-lpi.c             |  65 +++++++--
 xen/arch/arm/gic-v3.c                 |  15 +-
 xen/arch/arm/include/asm/gic_v3_its.h |  22 ++-
 4 files changed, 210 insertions(+), 95 deletions(-)

-- 
2.53.0


