Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549E7C44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:29:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367295.1617095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqrO-0005Ma-Lh; Mon, 20 Jul 2026 16:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367295.1617095; Mon, 20 Jul 2026 16:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqrO-0005MT-Iv; Mon, 20 Jul 2026 16:28:54 +0000
Received: by outflank-mailman (input) for mailman id 1367295;
 Mon, 20 Jul 2026 16:28:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wlqrM-0005MN-Ch
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:28:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqrL-00GPXm-F3
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:28:51 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5e4cad-bab6-0a2a0a5309dd-0a2a4508b85a-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:28:50 +0200
Received: from [52.101.228.137]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5e4cc0-f659-0a2a45080019-3465e489d062-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:28:50 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB6790.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:28:45 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:28:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sogOiI02iMMaOTa9zKVbSW7gDft96RqxPPsTelcizkYqbZNoiliB+7WfxzIdfNp8suu219A4Z8S+sqnuyJA20Yd1nXdNorsBiyI6BLSnN+NS9XiMyomdV01N17xveLJd5vmQ+hbIYqQP62USw48WLnXaiY4JoFRJh3FCnuMWiCSGzM6iLJ7ksdUH9hEgedx0K/hlZkAaLrETF1CbdWhwl3ZDbTVco6HYNzyyH/WMinUYunW1AY817s8rIBWKympA8wvDsCXIkd9We5CY94yekrWaOTc6EcHIhSFdND6Ug/cbuPInqXlAFs62oCJqL1clu5+OgFYiPSxW7Q56L4iAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tsy5KVKAwICehSQz8yn7E1ndoLB9bFACkryYy4c+9yU=;
 b=Q/81DNTKZgyCaXCX+t0ckh2lpBAZ5qCbCqf6Qh3x3VjzFN+dAtP6ir6EjwiuEwNR6Jgr+UZsUFoJtyqkSqBmhntfnUu02repBnxQ+y7GSIK09tdykNb6hkHobMZxKw4EDJbnxdDvGjxDmdi5YL0/JeHEFVFjf/QAfWuBct8jUy9jFGZ5mfGdPY9QvGO1aZ5dx/hj6a7hmKwpEz0ABjAoKWttuD3ucfM1t5r1/uBARu9zcW6RTiGBVkfTPZL4rE2D/e9ms3RfThEmJUYk3RJ54ZbzPTvHGe1M0TyAFXEs6nR3mx37kzW4hZLjyIAMukHFFnQ/2VzuuQAlsp7pHf+HAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tsy5KVKAwICehSQz8yn7E1ndoLB9bFACkryYy4c+9yU=;
 b=E0Regft0pPUgKwQOURrFtZgNXlYxgyOjwnooKim4EfrrL9s8c5CuVHxZFK0uy467wYw8WgHVkUe/Kezret7kfTkNc98xo+sZt946mopwQodCcBXKe2Nht4vC0g58x9IIhkJiYRLkE5GiSj3npNdmCbGCRr0hLnRCeOcKiGQ7ico=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v7 0/5] xen/acpi,device-tree: Introduce generic CPU topology support for ACPI and DT
Date: Tue, 21 Jul 2026 01:28:14 +0900
Message-ID: <20260720162819.308326-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3ba::12) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: ceff422b-f51e-4d04-8946-08dee67bf803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|10070799003|376014|3023799007|6133799003|10067099003|56012099006|29003799003|25016099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lZsqbQO1bW/yc7XWxExroTaPT3dPVqQIw4bhlRMxIgWL9683POvIehPXvNNmH87jxk4sJAxWqvL44fg6ipE8ICeVObUWbXYvKuPOh9DbvOUjop4QgGHgGKQmM0Novn1aRYoeeNZX12St/WlGS8kh6saubfu3p5JbygXrZr57EWLDrBULv3+ast6CAx3bTyENKKyplSCjqBrfI7XSd6XVcI940yLtzodw5km9bv5Xsx5MF3L+ocEYBmO1WBh1n0pBuvUf5iLpNDK0xwbPsHnHczo/xmFre3Nh+Kgo9SfOYdUc2Gfu4m42RIOd6HM3oEDQkBpSlVO/PgDoPdsXrN+6xcuLTU7Z3ygnmeJTlGD3xChhEq6beAYSJ97ru/yMMqgHYF62YSvsNwNMjO+OXS9rZmF0M2D+kJ1ewUyeZROYBzQjg0QT/ffyIt8Vw5rKzIpMpTmt6yM7Jw2t6oOp7U0h81N0cLqg/c4aHCxs/4WPgpNtQ9SIx4DRXAs9MoKpg6ngdMTBTyMPyH7xP9ByaOx82lJ6U60Jh6YQbl7ZABuLFOIPE7G3FL9QdyTGwycru3y0c/LJm2keJH0w/00kETrGnAWvYLnT9cfnz5NcJDC3StfCOKxc7+OldbyXXkjUm8HSj1ajkyUSoe1LZJYifM2PkUx5WHDpObJc03aRYm72qfw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(10070799003)(376014)(3023799007)(6133799003)(10067099003)(56012099006)(29003799003)(25016099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qQ3uMg/Yub4i9Cic5vNHPFTBjIBuMpd64q7Wv4l2P1F+YnPaewCmqd+T2NWU?=
 =?us-ascii?Q?Z5sU+THZ+gzci+FR6D+jQ4+X552r1LFxLsZSsf0elnbwRmG120ZPyjGX6Li9?=
 =?us-ascii?Q?g+MxAeYqXsN8LQa4h8mRtEAhaO7bxSBbTPqnsa54MZCKIqmMiDLQJIo9kY4+?=
 =?us-ascii?Q?28xu+TmUKaMVa2oZVVEdHBjqAilxeOP6bSm2GDPc6Jyvotr9NSTWIU+HYecT?=
 =?us-ascii?Q?qLmhR6/QDPDR0BBZB6bvX8hTxflC6yJSfWR3QYHcb6c8QXVn44qvZ82J88Fn?=
 =?us-ascii?Q?nH8TnW3k6Z6iCzkMSSgKdSsvbJSxUK5EPeF1AE++uc+JWUhtwPeF9gKkmQHD?=
 =?us-ascii?Q?qitDXSgE6Jt0c7qc0M33iaDvUyTRckMkDEeHwLosl+NFI1EFThD6XYsMhiLn?=
 =?us-ascii?Q?fnyIlYCbfnqiHbqRwnyHdTNL3YU82eT8AK+lqWkEZv7qbzR2uM51EDJhB79u?=
 =?us-ascii?Q?tTQJ2CoKSWrX1zEsrIFJdPMjpm2O9Y3CQXgLX6fvDZPZ3wvGEvPqpqwLj00p?=
 =?us-ascii?Q?262Tx9KU+LlKQSUknGYCviQ3aGavrCrbRHiIzM90sCtL16QUH59NjMRNisxQ?=
 =?us-ascii?Q?aEs5wa1UV7toDaRDU70WwtET96+OBzOEk274Pxzj9fcMCBtnpTN6vGaJnZ8n?=
 =?us-ascii?Q?PvAVE+kBupfXslU+XFqT5ZSJpZJzcf6hZ5/qzT9rXs31QFNqut6MzChrby/g?=
 =?us-ascii?Q?YiCNCKfDIxRoh5lMf4W4Z/YaMgTALnl6kTclpYMEGqkNlANrmNG70s5QqMpH?=
 =?us-ascii?Q?CbwI3P4287ZQAGWP3dobn+9KL5ODNvVJvE2j4NpgLfPmdkZ3svwoEASUo+1B?=
 =?us-ascii?Q?vp8dl/FNKiPbbNU7IW3wHe3IyXoPcTw/bXrTGnvcHEy1p7r8bh/Gzb377USc?=
 =?us-ascii?Q?v+C4fskupVgvTYq5nDAHPhlOxdVqO44DkNZHILHsF3kN/NIn2I19/gM3YZYa?=
 =?us-ascii?Q?JBnCSc1GFaDYz8IqUqxexWH8QgwTJ+yGjCqu9iZTOoDZW9fKVb1l/ycNsbMR?=
 =?us-ascii?Q?cUv5Z4UcWc5NlzSdWphPJd/cwvp4Yd+DB1hevSIS7wikfvlubeV+1edpvUEq?=
 =?us-ascii?Q?ZN5TqwfTCaBK9OdqHlXfbbvX5S/iyWwvOMDCAbNhAWfaK7eW2XxNPHAUacxU?=
 =?us-ascii?Q?ve2V69xVHJDDiZm5K7GLehyL9chsZzM6aeiJhXG+GgD01F35XU0/3a2QHpZU?=
 =?us-ascii?Q?al3WpLPD0LFg6mPl81i57REKjgk/Gd9CmLgPSGn8fwSy/fKR2RLOcMrsBSxC?=
 =?us-ascii?Q?5/yg6+F1nnrTxjMz4mWqolhx61i5P1ayL9+UY6Zve30zTjxLxW4xMKCK0EyG?=
 =?us-ascii?Q?kvDWyLxq2K1ZwilvPlqW3X8qQY1ztnBL8YOy/tBkDB7uA0LDfD6amHrSEElP?=
 =?us-ascii?Q?2uI7ianFRVfxxQdyqIKi/XDN3OYrvdRI2+NlC4i3b1eHOROxXcpKMtuvFxlD?=
 =?us-ascii?Q?mR703OzfKKCKNvKN4gNFDOqEyvCNjj/ieQ9SJRTnwNatfxz4XFoftks8yFQY?=
 =?us-ascii?Q?h/5L2CTkqEbB2nxckRntd6huoBbfZaTVxmOj7VdGxCol7GTM8aeqSrTzU58f?=
 =?us-ascii?Q?MR0VIPfmCd16J5eTvhWEnWFiqsNkY5e6ryIAfae5gDGrVGy5+8Ecjg20Rkfk?=
 =?us-ascii?Q?IIlAy8x+SH9b1I1bxdeRNrud0XGvgWFmmL+wVUWb8tXSnC0g4pmgjY5FavE+?=
 =?us-ascii?Q?3KcVZfPgANIfRkzdqyt3Cw8Nnh3mxxMbGifophsQPI+Ot2W/ZhdYU+wnbo0q?=
 =?us-ascii?Q?fjvJrQFDBPfXL0qooRa2IhpYS8PD6xGwbbOIHUgjOn7aSZvfla0PTwfakxhv?=
X-MS-Exchange-AntiSpam-MessageData-1: 3E9yDg3+aiy+4g==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ceff422b-f51e-4d04-8946-08dee67bf803
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:28:45.0478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QXlHrMskYTxpa+hpKdruVsyr94UiC/lXGoxkr9eGIi9h2ILOCMs7DDPhDMe34EepZRdd2JE2ZcNNPIXiLsSiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6790
X-purgate-ID: tlsNG-c1860d/1784564930-D5F4787B-C07AEDBA/0/0
X-purgate-type: clean
X-purgate-size: 10084

Hello,

This patch series integrates CPU topology discovery into the Xen hypervisor
for both ACPI and Device Tree platforms.

While the primary PPTT parsing logic was introduced in v5, this v7
focuses on hardening error checking, enforcing strict table validation.

Changes in v7:
- PPTT Table Validation & Hardening:
  * find_pptt_node(): Added leaf node verification (ACPI 6.3+).
  * acpi_init_cpu_topology(): Added bounds checks to ensure proc->parent
    validly references memory strictly inside the PPTT table bounds.
  * Factored out shared table checking helper functions used by both
    find_pptt_node() and acpi_init_cpu_topology().
  * Added subtable alignment checks and strengthened processor structure
    size validation.

- Graceful Fallback & Allocation:
  * Treated missing topology definitions as benign conditions.
  * Used xvzalloc_array() for temporary memory allocations during
    initialization.

- Build & Kconfig Adjustments:
  * Updated Kconfig to use "depends on UNSUPPORTED" instead of "if UNSUPPORTED".

- Code Cleanups & Style Conformance:
  * Used designated initializers for structure data initializations.
  * Consolidated topology helpers with IS_ENABLED().
  * Removed redundant error checks and reduced unnecessary pointer casts.
  * Switched type-based sizeof(type) to variable-based sizeof(*var).
  * Added leading spaces before labels ( out:)

Changes in v6:
 - Renamed the series subject from "xen/arm: Device Tree based CPU topology
   support" to reflect the inclusion of generic ACPI PPTT topology parsing.

 - Infrastructure & Kconfig:
   * Updated Kconfig to make both DT_CPU_TOPOLOGY and ACPI_CPU_TOPOLOGY
     select GENERIC_CPU_TOPOLOGY.
   * Ensured that if topology parsing from either DT or ACPI PPTT fails, the
     CPU topology table is freed to fall back to the non-topology behavior.
   * Moved the `cpu_topology` definition to `cpu.c` so that variables and
     functions in `cpu-topology.c` can be completely freed after Xen init.

 - Topology Logic (DT / ACPI):
   * Set the cluster ID to 0 when the cluster definition is missing from the
     Device Tree `cpu-map` node.
   * Handled cases where cluster info is missing upon reaching a physical
     package in the PPTT parser by assuming one cluster per socket.
   * Split out the import of ACPI PPTT definitions from the Linux kernel
     (including unused definitions) into a separate standalone patch.

 - Robustness & Safety:
   * Avoided assuming `np` becomes NULL after exiting `dt_for_each_child_node()`;
     explicitly return NULL instead.
   * Added bounds-checking `ASSERT`s for values returned by `cpumask_first()`.
   * Added explicit braces `{}` to nested `if` statements to clarify `else`
     scoping and maintain style symmetry.
   * Enforced an upper limit on the PPTT parsing loop iterations to prevent
     infinite loops on corrupted tables.
   * Treat the absence of a physical package node definition in PPTT as a
     parsing error.

 - Optimization & Efficiency:
   * Optimized `setup_siblings_masks()` to eliminate redundant loop iterations.
   * Dynamically allocate the temporary data storage used during ACPI PPTT
     parsing.

 - Code Cleanup & Refactoring:
   * Replaced the `invalid_topo_id` constant with the `INVALID_TOPO_ID` macro.
   * Initialized all members of the `cpu_map` array with `INVALID_TOPO_ID`.
   * Added a blank line between `<xen/...>` and `<asm/...>` header groups.
   * Reordered `#ifdef` blocks to prioritize generic logic over architecture-
     specific ones.
   * Corrected code indentation.
   * Applied the `static` specifier to file-local data structures and functions.
   * Minimized the use of fixed-width `uint32_t` types, restricting its use only
     where strictly required by the 32-bit ACPI ID specification.
   * Declared `map_cpu_acpiid[]` as static and introduced the helper function
     `acpi_map_cpu_acpiid()` for managed access.
   * Renamed local variables to more intuitive names.
   * Simplified the implementation of `get_logical_id()`.
   * Refactored PPTT parsing to reduce type casting by using `container_of()`
     and switching from `char *` to `void *` pointers.
   * Removed redundant error checks.
   * Cleaned up unused variables and eliminated debug print statements.

Changes in v5:
 - Extracted CPU topology information from the ACPI PPTT.
 - Corrected the erroneous use of CONFIG_CPU_TOPOLOGY to
   CONFIG_GENERIC_CPU_TOPOLOGY.

Changes in v4:
 - Only display the CPU topology configuration prompt in common/Kconfig
   if the architecture defines HAS_GENERIC_CPU_TOPOLOGY.
 - Move the definition of the global 'cpu_topology' pointer to
   common/cpu-topology.c.
 - Update the Makefile to explicitly build objects as .init.o when all
   functions and data within a file are annotated with __init/__initdata,
   ensuring their memory is reclaimed after system initialization.
 - Add an error log in the CPU-to-node mapping function for out-of-bounds
   cases.
 - Use ARRAY_SIZE() instead of raw macros when guarding array accesses.
 - Rename variables and functions to avoid ambiguous or misleading terms:
   - Avoid 'cpuid' to prevent confusion with x86 CPUID features/instructions.
   - Avoid 'node' where it could be confused with a NUMA node, explicitly
     renaming them to clarify they refer to a Device Tree node.
 - Move local variable declarations into the narrowest possible scope.
 - Replace the unsupported "%pOF" printk format specifier with "%s" and
   explicit node name retrieval.
 - Remove #include <dt-cpu-topology.h> from cpu-topology.h, and ensure
   the header directly includes only what its definitions require.
 - Remove #include <xen/device_tree.h> from dt-cpu-topology.h, replacing
   it with a forward declaration of 'struct dt_device_node'.
 - Use 'const' qualifiers for pointer declarations where the pointed-to
   structure is not modified.
 - Explicitly #include <asm/processor.h> in cpu-topology.h to guarantee
   that arch-specific definitions of cpu_to_core() and cpu_to_socket()
   take precedence over the generic fallbacks.
 - Introduce inline initialization functions for cpu_sibling_mask and
   cpu_core_mask in cpu-topology.h, providing separate variants for both
   when CONFIG_GENERIC_CPU_TOPOLOGY is enabled and disabled.

Changes in v3:
 - Use (nr_cpu_ids - 1) as the maximum CPU ID here. The fix for the sparse
   map mismatch issue on ARM Xen has been split out into a separate patch.
 - Switch topology sibling masks to cpumask_var_t for dynamic allocation.
 - Allow the system to keep running with a degraded fallback even if
   the topology table allocation fails.
 - Remove the temporary definitions of cpu_to_core() and cpu_to_socket()
   from RISC-V and PPC processor.h.
 - Minimize the use of #ifdef blocks, leveraging compiler Dead Code
   Elimination (DCE) where possible.
 - Clean up the code to follow the Xen coding style. Please let me know
   if I missed any style nits!
 - Verify successful builds across x86, RISC-V, and PPC environments.

Changes in v2:
 - Generate topology information even when ACPI is enabled. Note that
   this is a temporary implementation and doesn't yet parse the PPTT
   (Processor Properties Topology Table).
 - Added support for cpu-map node in Device Tree that doesn't contain
   explicit cluster node definitions.

Changes in v1 from the previous series "Introduce Device Tree based NUMA
support for ARM Xen":

1. Optimized Memory Allocation:
   The series now allocates only the minimum required memory area to manage
   the essential data for the CPUs.

2. Flexible Device Tree Parsing:
   The parsing logic no longer depends on the definition order of the 'cpu'
   nodes and 'cpu-map' nodes in the Device Tree. They can now be read
   correctly even if their orders do not match.

3. CPU Hotplug Readiness:
   To support future CPU hotplug, the system assumes that inactive CPUs are
   also described in the Device Tree. Xen will pre-load and generate the
   topology information for these inactive CPUs during the boot phase so
   it stays available in memory.

Thank you,
Hirokazu Takahashi

Hirokazu Takahashi (5):
  xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
  xen/sched: Link CPU topology to scheduler
  xen/sched: Make cpu_nr_siblings() architecture-specific
  xen/acpi: Import PPTT definitions from Linux
  xen/acpi: Parse PPTT to initialize CPU topology

 xen/arch/arm/Kconfig                   |   1 +
 xen/arch/arm/acpi/boot.c               |   2 +
 xen/arch/arm/include/asm/acpi.h        |   2 +
 xen/arch/arm/include/asm/processor.h   |   4 -
 xen/arch/arm/smpboot.c                 |  15 +-
 xen/arch/ppc/include/asm/processor.h   |   4 -
 xen/arch/riscv/include/asm/processor.h |   4 -
 xen/arch/x86/include/asm/processor.h   |   1 +
 xen/common/Kconfig                     |  22 ++
 xen/common/Makefile                    |   1 +
 xen/common/cpu-topology.c              |  62 ++++
 xen/common/cpu.c                       |   4 +
 xen/common/device-tree/Makefile        |   1 +
 xen/common/device-tree/cpu-topology.c  | 409 +++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  21 +-
 xen/common/sysctl.c                    |   1 +
 xen/drivers/acpi/Kconfig               |   3 +
 xen/drivers/acpi/Makefile              |   1 +
 xen/drivers/acpi/topology.c            | 330 ++++++++++++++++++++
 xen/include/acpi/actbl2.h              | 113 +++++++
 xen/include/xen/acpi.h                 |  15 +
 xen/include/xen/cpu-topology.h         |  76 +++++
 xen/include/xen/dt-cpu-topology.h      |  35 +++
 23 files changed, 1091 insertions(+), 36 deletions(-)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

-- 
2.43.0


