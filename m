Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F322CA5FA5
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 19:02:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436700.1655383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBd5z-0001Ql-0w; Tue, 29 Sep 2026 19:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436700.1655383; Tue, 29 Sep 2026 19:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBd5y-0001Qd-U9; Tue, 29 Sep 2026 19:02:30 +0000
Received: by outflank-mailman (input) for mailman id 1436700;
 Tue, 29 Sep 2026 19:02:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xBd5x-0001QR-Qr
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 19:02:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBd5w-008g6y-Ho
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 21:02:28 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abc0b41-8faa-0a2a0a5109dd-0a2a450cc434-2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 21:02:28 +0200
Received: from [52.101.83.141]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abc0b43-f479-0a2a450c0019-3465538da00d-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 21:02:28 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by AM9PR03MB8053.eurprd03.prod.outlook.com
 (2603:10a6:20b:3df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 19:02:24 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 19:02:24 +0000
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
 b=lwmWEWI/u92wZR8x/Gy/QS85gbTB0FjfmV4fwruoaQ5eijaMoLasglmQTU5Qb/qhqoKKHQvR1svGSPE/1eB//mbwKC0R88jiQYbXoOksFMQVqbeZDFWVutZzzoGqDQOF13I+eShfklE75E+vkPAXkm5AhTrvpTMScUXKLLdi9NPtHI8wZsFozMRDwodrckvzDE0C6+1Ot5wmjucdUiP37IUACqWLwclV8FHt8e1eF/NREW6TB63Yso1QOYaotZE+hLHsmre3JdI35TKdVD0JsaCZT/Qc8pJzE5gYxQSwMKpRx4qx3VOp6wJQhYo8hi1gHTAsN6pp+hfVQvJHCknUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raOXcDGzR6uadzFUR7XAe+LYU37m9FEzA/cBfWVAzX8=;
 b=scjmXu01a0q0Je/j1zwrK+nJahPgQyZ3xYzQBnzdx0FY0/M7I8kt7vt4hwdaaGqt2U/N4OXYAmPtuILPFOv4LfXqXo5x2Qy137yCTRoxLN+HcWBy838FyrPU0dlFbv4buVGYpvtNkwic2K/OmekbpdsNKMtbS/L0gbJ6qtCp/Tv0DUmQFNYa6U4po7vF0nV7Rp0RjrdmGF9y0BBhEAkJeWKGGDmyj6TzZ4z7MCerb/IwmftcgsNLNbhWnvRIevmxK1QNK5nCaKiJm4Tjao8vxKoBcWFe+LEAn0q3I39pOTkYQGShqmZljPuO2ehUBE5yyq9xJcCcI5r0i4hfxM9fVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raOXcDGzR6uadzFUR7XAe+LYU37m9FEzA/cBfWVAzX8=;
 b=IBHmc4tO1symphrsL3esLoON/y5C1cmQPctqVfXwTRgY0kUH7sBxsZOsUR+m9cxxBRLNsS1eG7pVRzzF/xCxLzqroTYTbCgPxV+hbIHu/MT/Vam7NZjUVj9EmV5WhwPqhGdvQdU0JcL31D+mmakFzE/PstqwlMy31F8PviaBXPm6PZmfWrAt3+PrkyteQ0cOdzO8JPMP5ofzMkId0jWHCaT12tiFvgjp7kcxefuCDyOqmdIaj3atoeaXggeJIJFHnBLBDOcoPaRNcd+14WPyAyyiL3PQqVQdEGMSk4jrzjUO1PFX/sqc9+vd8kqkQ9TqQLDfYPJ9jc3XE+B9KlDfgw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 0/4] xen/arm: gicv3: defer host LPI init and split ITS/LPI quirk scopes
Date: Tue, 29 Sep 2026 22:02:09 +0300
Message-ID: <cover.1790707009.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIVP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::11) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|AM9PR03MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 668d8168-a963-4f7f-4af3-08df1e5c32ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|3023799007|56012099006|11063799006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	64e2tbzjFufERzm3CfqLrFIWYtPXLEoESdUiUrxJxsJoazTySLZ30zWAWtXK6P0cBUMdLmWaQBUNzHscdgqP8AL1YGx8WHYIuBD7EdMdh4VF4ugJHwioqNdteoUJ+54dd5MRj6rwJl9zQVyOw8ss15KZfq618XT0Hx+JiJJt7dVOJSGIlXtTwCKxCQAjY3AxUaAXL4T8G9Cm3L732okMYQrHW/+MZWelgHR0GJVoyEAOMY6bs/QdIc1uoJPKz4AwviVwXZX4tx4oM2NRB00hbPiDfpHaPgkl4KVmt2a2ypgN1d9tEGM+VsxfOSFgKgFTuszESQhN9IQwdrKTM6PDFMeNSf1OjQB4EI403NdGCyOFBoWZx+TsnyRbDj2B3/0lY9xdp9vunmzPDoFYM1ONDbO+H/5pULTF4SHljhL99CR63v2UvnCk+yqYYU4YeS+iZ+Mh1yUMkf82ipmcrNFS22Ip5d+KJrTxFi9eL5mRHADfh6X5lEP4Q8Mj/QjPgHqHJksnp7+9bN2ZM9dL5Q4geC0PDLCaJVfLBumjBSBop+cFeJnAT55bftxF9mgOmZloitGyIqYLYZwv/+F0gQJxXNmMOKWjMjytiLs1/6JaON9qcl90OBhV938yAgmx7NhlyxEA5H+uh5HI1/xkmcZ7IK+nQevimdnRioHNKg7NwkM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FI0Auu+dLW9TD2YaE5fgZ0J1jG72wC7kWBcEB/gqhMeaTiMEOClfgkpaH8EY?=
 =?us-ascii?Q?BnB8PmHSKTgbgJfrs6WKD65aNZrNx8wdiZRd8Y/Nz0mV45RSTD+xkqzm38qT?=
 =?us-ascii?Q?DaVYg/vkXjnx3oCQJlrsTFehtoggfJhFLiMrxi3vHLgK4OFvEOLw4a6VH2Wu?=
 =?us-ascii?Q?ZtoGmOsM7VpXtnY36ZdjBCbagLu+20+eg90v6U7Qmm+qfLIwTOINutMKFjG7?=
 =?us-ascii?Q?4dmXGKA5+uZ36gXYSPSldEkWxq62BOqW3ikmcSRM1/Rjm83r6mhDrDEerhVq?=
 =?us-ascii?Q?erxkUcN9ZYsBz+56DK5XrpdAuu6/SP9dDap1es61a5Ku4IxdQLcq1aeRY29v?=
 =?us-ascii?Q?/FRubTWsSEFxF+BNIPq4sSqk4OIAwFNax+PgrXG12hPdebzG3H0YBCJVDJhD?=
 =?us-ascii?Q?BPUayQClei+CkJEfglzCICmk/lLdMsLygBQT1NzRHj+cTBc8VGakoo7lGWZt?=
 =?us-ascii?Q?Dy2tudLQbAFMxf6037sGnwM3Njte9s/a3ntDn+5vluEi5aq7hPlQVmnYUtEi?=
 =?us-ascii?Q?5CRHuFrQozvvuije3pBfFGM8I9ALGU+Ify7zawcyk14unKTeJFMsu7Fbpdxb?=
 =?us-ascii?Q?HgsWSkxyR8uO8gPMaevBThDqov0yhT18BjtqxKMGkZfYRTGOfCBWGpiBwozu?=
 =?us-ascii?Q?lK+RXUBqA5DXBYbNldo9UJSdA8OwLEyEHGmuGC4bub00iK/QK0X+DOLK8sAW?=
 =?us-ascii?Q?dQfeBrl/hPVpS7txMmmBA8v9T2MmMXZ/RDVBafcXdLm7ko/3bZbpunVLlPEd?=
 =?us-ascii?Q?OPFCadIvlh0w/WnUy/bKWVhYkEuc2e6+Wh8/ygxRL6kSvJuefG5tv635e1yN?=
 =?us-ascii?Q?TF15OsrfQzCfCaYNw/tGqEBmuGDJA1RYh4bOy5PYfC6zDQH0aORNtrbMe39Q?=
 =?us-ascii?Q?ASfVcUNf5mjgxxUpJzbkRT/XcuzcMJYj7rfQ7NU+WZMO0kLhQD19Rdx0VaAU?=
 =?us-ascii?Q?sPT0oLxwg8Ek+iDTdWDxpBfI9IAUReZXsoKEPljtakzvFq3ee1si84YzT9WH?=
 =?us-ascii?Q?tG1x/kazIKH3VFZEQ6jNEvpGI4m25vFqj/bZkIXblRc25lvFHOnNhmQjEyG0?=
 =?us-ascii?Q?YxMMV/q6zHwJtM0KOkxW65HPxaU5rrbvbZZfThat/tzuKabG2fnYDuGvxRMo?=
 =?us-ascii?Q?3y3nwcXGs6O6bUqCSkgwbgckw5yAuY5/t8vK+SBegae1NQxh/L9W3DAHp3dj?=
 =?us-ascii?Q?l56FvQaDm/NzJR/+kJ44atirs9nAXXwHLNaPkkUK2zgxIvHp8Y6UQGfMuL8n?=
 =?us-ascii?Q?+TsB3rZpCBIb+3NRcEB2yuoeBDoA7bvW7ivwm3jkDrPR+b84fETjpFrfUUER?=
 =?us-ascii?Q?kSWrJd+t6pAK7LvtdOQhj3OtE1AYws+/xQzm+3XlbLvTVFQ6kvXEdlay7iPV?=
 =?us-ascii?Q?+BtCeuVIXpnL/xT6kQ+q7naPYn0Fz5C28S2/0sjMjszqKcv7rvNwQngISeR7?=
 =?us-ascii?Q?+5V3MzQ8A9VpKVXqPqoVwz2ea2747BoPB0jhbxekFIsyCCw7kocsT4WegZM+?=
 =?us-ascii?Q?n45iLA7UYueQThEyNU9HuwNd8K9X22NAvI6jwR8FiEcCXvitH/LMGYp/pQhn?=
 =?us-ascii?Q?talBChb5ILlATdh380YwqiNC5VUCB75mUeXbLJmptRUBqlw9p8XA8KvdY1W4?=
 =?us-ascii?Q?QngUyW5I/DekMlRMNBVbzwvGZ0lbPOwVNBNIL0UkFBkQo0Kg5bkqedlgemMI?=
 =?us-ascii?Q?EaSNfsiOybjypRLOe2/Zd+w1y0L++a5bKT4jQKpZkO1Rulw6+NA02HnykKWR?=
 =?us-ascii?Q?YJ9DllFYEg=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668d8168-a963-4f7f-4af3-08df1e5c32ab
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:02:24.7311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iF+PQqwz1Dp1YVmeH2I3K+mS9moCwKiEe+s+7BFIVSUDMqzbAboP8Rh5RBVfl6eyOY2TxrCrFpusKThyMqgLvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8053
X-purgate-ID: tlsNG-d25034/1790708548-01AC4A5B-D19105DB/0/0
X-purgate-type: clean
X-purgate-size: 5719

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

Changes since v3

* Move the empty ITS list check before the preparation loop.

* Calculate the table entry count and select the table type inside
  its_map_baser(). Keep the ITS/LPI quirks handling comment above the
  shared helpers.

* Use BUG_ON() for a missing match callback or missing IIDR match data.
  Keep the existing quirks variable name in gicv3_its_find_quirk().
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
  was first. In v2, patch 1 was intended for 4.22.

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

 xen/arch/arm/gic-v3-its.c             | 233 ++++++++++++++++----------
 xen/arch/arm/gic-v3-lpi.c             |  65 ++++++-
 xen/arch/arm/gic-v3.c                 |  15 +-
 xen/arch/arm/include/asm/gic_v3_its.h |  23 ++-
 4 files changed, 222 insertions(+), 114 deletions(-)

-- 
2.53.0


