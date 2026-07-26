Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B8EC5321C
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 00:56:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370880.1618749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnn9T-0006hc-Q9; Sun, 26 Jul 2026 00:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370880.1618749; Sun, 26 Jul 2026 00:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnn9T-0006gi-Mv; Sun, 26 Jul 2026 00:55:35 +0000
Received: by outflank-mailman (input) for mailman id 1370880;
 Sun, 26 Jul 2026 00:55:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wnn9Q-0006ff-DS
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 00:55:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnn9P-007Oo9-11
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 02:55:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6559e3-e002-0a2a0a5209dd-0a2a4509e574-46
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 02:55:29 +0200
Received: from [52.101.228.97]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a655aff-be1a-0a2a45090019-3465e461c552-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 02:55:29 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB5490.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:397::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 00:55:24 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 00:55:24 +0000
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
 b=lzAp97MRndH29kxgGFzkFHvdygi4ExlN+xff93T73fmY4IKdbX8gcjvaIB1YC/rYZtpcID4Y3iCW9SdZxh067T+pu9B/MTAEBcxOfKGkmOrq19oCUQW6ib3qqLRWvNV94VGuWDtp4NeK4LFyaN+9wio09z4uYpd60GfAMlI+xBgXKO8z817symyiRcTMJs7ewrJuP6F6BpR2yOxPjr2wMlg1GUAjJKc8R0ifbjyoXJZCBwtGbl9O7ishQksovwkAI2X/EWdtAPk9DjGLRaJsy96ozL8j1iC8tLrC2yAFCY/J4w/1xyvj+BRjyAlw6Fj07RL5lxZGBCjOI4NbvvpxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Otdd1qgjSYtJZkFP64pxjtAf0Wai1BR3H+bHKcVJJs=;
 b=ZIPCTBg4tFMc2VHDwjIzqVvIPG1ns+phzTQquBb21+emiY6JA0uy2iKBrAg+Bx+xN1lXN2hHxU2syMZNVB+Gb/IJ+Lqhi+VVFSHVR2Gh3WLnekfj8wmdrXSNSbH4cRiUPZdifZS+NFwpKoN8iccFFngjxuU2fT5jiVqhmxQkUs7XdLxHsFhXXXy0xeclD3zD8br7UAV1MxVJqIUypS1HO3eGO/MtQrt+hAj3WnuYqLBpzNSs395kYy6Smzc2HNyNoyH+JHXCDLq6N1+xoNW7Hc1PwH/lPaalBTg13RAtVe9jQi62dueJmxJVLqSbwnMVi/210tv4VjlVxOY6P61maA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Otdd1qgjSYtJZkFP64pxjtAf0Wai1BR3H+bHKcVJJs=;
 b=Ml3+3tbce7fk1geI51Gc6PCIhAkZ+Pox2qX3IQPJznEb8tsw1w8gXrUFqp89RoHay1WlEMuz//mc6qzm6FM15QgtcggI0IsULRi3fp8knrQrRoN4v1lzuIlQLV+lkxdcCMq/yI7qo1dUiLIUSuAdTmAvEqtj8hjuHDtGNQ+1sa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v8 0/4] xen/acpi,device-tree: Introduce generic CPU topology support for ACPI and DT
Date: Sun, 26 Jul 2026 09:55:13 +0900
Message-ID: <20260726005517.379267-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::18) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB5490:EE_
X-MS-Office365-Filtering-Correlation-Id: b64a2593-f9e7-477a-4b19-08deeab09372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10070799003|56012099006|10067099003|29003799003|6133799003|25016099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	ecU2s+wNITnNRbIF4PuKSu9HXAQykq+c1XbrzdWqq6EixSUXVzedjsueoyD9GZUGoSllTHY6bq8Oy5dIx2ztUQ2AEkj/rvAhy7AV7ybXW2MY4eI6UkDuhrdTU8d6wn2iDtLgunJW1OPHH7hmIY8f2mxH++1psYgq6lcramwllflleiPVWHBogj++PR9RdQaE3m5DrSpgShCbkHrz5OpRufVOdGYjIjgulAyejXW/nYdDzeFSLrf/T2tBXNQOvJsWpjMcXB3H1yacA4uBu46lDNuY+ZlkrhciULV1KCk28MdhNLFc5NGaPxSh5dwdz9k+vst6A/0fucEZ+X7zIIYYURV5/AS6a8zQumYAt6J/S62vp+j9yVCveiMmrczs015m5IHli89ewANINKa/v5r0Y4CVFIwkJPPzyyW/bAWXUdki0gHMa/ePYUEEvGshXB5fl0iYbpFcbnNSLnQkYWrdrAIyzZRQwgEojGZKXPI3c8jjWixsKkfKHe+U6RqbIlW/jA0Kan6aIpeSEpIX74SNf9btWmKWhLK070EUtqj+FL+4j/Vm2hxm5ezrWY2g/KKcm08nDroQZEzy7+ULBtIZ0LlwVHSt8LLrES0VpbCf6y31QZxoavjmltAmiUWdK+9dZANwxPPbl57hM0A8GEk8z2yYxUrjVhcyg1eaJCg8cGU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10070799003)(56012099006)(10067099003)(29003799003)(6133799003)(25016099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cvpuYRQB23uaa0Nzcm5dtoaAujQObc07CZoaaj8umbhanf3Y/XyZbigEABYt?=
 =?us-ascii?Q?bj93rpDH9aMGJZ6Ebn+73jIYyXzXduvLf1C4uAU03DKJgjuSINhFzOnhmcHe?=
 =?us-ascii?Q?HsU2I48aH2pe2dkduZsRWBbcm1C38LwRVhZotyNkyUq17M56+oTVGmoVSN86?=
 =?us-ascii?Q?8nORpIJV+udOZyJIhnD4hNENsYC/pItZTVzhyTxvU/U8yjcYyMLtmUI6yJ0N?=
 =?us-ascii?Q?QYq2IeyqjJWHlrTlJC/F9pevHUqQN+XY/1lgYAEHa178avSBX1DHbXzbFmPk?=
 =?us-ascii?Q?CJPts4mob9utVQ/siQq6VbG7ehBjIxOoCLxoOtcBLYztj2ZXzH1EqqwKmcIk?=
 =?us-ascii?Q?RSFL716Jd1mXhiDWwrq57AKaji8VIVBFr4W4K11aevrbN3ykP8wrj+xZ1y3q?=
 =?us-ascii?Q?DBgvI1LDX0e8Q0bPBedqjoPbI+a6LODkxb3RDY794ba/o0XPsUNTLaikEg66?=
 =?us-ascii?Q?8tOnFthnQ1XQFrCJO3trBdfIM5pIyRpnZG9sXbUJJLacppgQjp+r6/XHx+Oj?=
 =?us-ascii?Q?r5ovV8/psCUcrDM6vdvjr/1WofdBfquCyxe2No7tj4bhdNPTXaE40FZJ1bse?=
 =?us-ascii?Q?+Uk3MHhss6dKUyH4rATj/+b9L31h1mLJjk4JUVbpxIH8heUwnfkAWxDzo2YG?=
 =?us-ascii?Q?hNVHAzl+KyjycxUgnjppTVmO/KAPkQ6nZWN201LPUIcS3eWxOW51NBYCD+uO?=
 =?us-ascii?Q?8UJ7woL/2nhRmsYSZU0KUaX3mYJEJgcJu8X+wr3cjS9OEhh/1SKC5Y/qsMV5?=
 =?us-ascii?Q?xGEn/BRkZafwBvvIiXYRD+I3eqcDfeNkfXT6MqaSRJTQH1hH+M2w2WGD41BX?=
 =?us-ascii?Q?R2su7BlxG3Udpb5dipUOYPS5iaIF5xeoNtbxQ2StK3V5q3iW2UhWYORUjjks?=
 =?us-ascii?Q?X97tnquP1eQQPoVxLq5gT5XP/UX78ZlcZBCxEiFAmA8kJxkuLoTp4YH8CIP6?=
 =?us-ascii?Q?lXYDkPDDXViXBjGl6wEwhcrqIN5/U8Tw192GUYjvgj4vy5xP/h0dsM9kPQZy?=
 =?us-ascii?Q?5YrZVwY51oXB0F9Y6TsHcNHe8c3DyvuKHlAGpEnAPoQRAsLrPThG25/6Y2Sq?=
 =?us-ascii?Q?OpzN8W52l3irjZ3hc1Ui7OF2US9C1xCSmwx/YiKs81lrlXPnagGOP4JIBLmp?=
 =?us-ascii?Q?lNFFyrG0XVXhV0AOfqqNxbuYbfKDL3/64gn/RrU0tiFlQdjY+3IPlGgIp0XH?=
 =?us-ascii?Q?e8F3/v7y4eyTfwJ2LiBksBnBLYejjp2XiOw/McI8NHE0QVihiM6gGv9Gfzs2?=
 =?us-ascii?Q?rKXNY1L3QDN0wN2VoG345Zhos4C7kLR5c3l8Q0l5k8OL91EQBioO9oEzHvSs?=
 =?us-ascii?Q?ppKORN3MD9U0XKPhnCT561aue3aLFpaZRPNoZyY5/+JzUrw+bUEaQ3kJpd1B?=
 =?us-ascii?Q?2YMJptFrqKgsOwD0UuEPo+joB8V50AIrNgA0ZcvtbldqffJPIbCwqqDwDvfT?=
 =?us-ascii?Q?DtotYJdXT33BRSPJNi7Q+cGiuzaAhrJori5I1+6EwWC2FDiggG3mLGQFBtgv?=
 =?us-ascii?Q?ArllnS5+p+Lf7ljpEomqpN6rmDx6TYK3EfkyABts/Tzg2VqmIOtZc+0Wcd9F?=
 =?us-ascii?Q?mjQxMstspfdlAEThODdDYZGWLTq7rJvdQEtI4FJo5sifocEVi7JKyx2EOCkS?=
 =?us-ascii?Q?OmYkqg1Fo593VHaFWBL5kj6jFc12ogmNW50IORCIFPwTCnG8MH5YgTBY/AhD?=
 =?us-ascii?Q?EflPNNIXikTR37wLUxZNLWc2jmE3eruu6ASjaroI9ydviKgyuhg6YaCI/UC1?=
 =?us-ascii?Q?L2x9DPc1GtTlJoVhUXcEbFVaG/12wKCXRPwCC/URcs8WAtwv5kBgLKKpKkO0?=
X-MS-Exchange-AntiSpam-MessageData-1: Jz+UdktK0ijrYg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b64a2593-f9e7-477a-4b19-08deeab09372
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 00:55:24.2892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtI82WNcdnE7RKRKvfdR3OTI9+TZjyK55p27KrAEh/z8v31GedoBKrgSpiD1ukSAkkFPwcllq0Exs69yeTPdvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB5490
X-purgate-ID: tlsNG-bad1c0/1785027329-BF6D2034-4FCC0135/0/0
X-purgate-type: clean
X-purgate-size: 10835

Hello,

This patch series integrates CPU topology discovery into the Xen hypervisor
for both ACPI and Device Tree platforms.

Changes in v8:
- PPTT Table Validation & Hardening:
  * Relaxed processor node length check to allow
    proc->header.length >= table_size.
  * Treated root nodes (nodes with parent == 0) as equivalent to
    ACPI_PPTT_PHYSICAL_PACKAGE nodes.

- Build & Kconfig Adjustments:
  * Removed leftovers of ACPI_CPU_TOPOLOGY definition from
    xen/drivers/acpi/Kconfig.

- Code Cleanups & Style Conformance:
  * Moved INVALID_ACPIID definition to xen/acpi.h to make it available
    cross-architecture.
  * Removed ARM-specific references from comments in
    architecture-agnostic code.
  * Added explicit parentheses around bitwise operations in logical
    expressions.
  * Placed binary logical operators (||, &&) at the end of lines when
    splitting conditional statements.
  * Combined variable declarations and initializations where appropriate.
  * Removed trailing full stops ('.') from printk log messages.
  * Fixed printk format specifier mix-up.
  * Explicitly included <xen/cpu-topology.h> in xen/common/cpu.c.

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

Hirokazu Takahashi (4):
  xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
  xen/sched: Link CPU topology to scheduler
  xen/sched: Make cpu_nr_siblings() architecture-specific
  xen/acpi: Parse PPTT to initialize CPU topology

 xen/arch/arm/Kconfig                   |   1 +
 xen/arch/arm/acpi/boot.c               |   2 +
 xen/arch/arm/include/asm/processor.h   |   4 -
 xen/arch/arm/smpboot.c                 |  15 +-
 xen/arch/ppc/include/asm/processor.h   |   4 -
 xen/arch/riscv/include/asm/processor.h |   4 -
 xen/arch/x86/include/asm/acpi.h        |   2 -
 xen/arch/x86/include/asm/processor.h   |   1 +
 xen/common/Kconfig                     |  22 ++
 xen/common/Makefile                    |   1 +
 xen/common/cpu-topology.c              |  62 ++++
 xen/common/cpu.c                       |   5 +
 xen/common/device-tree/Makefile        |   1 +
 xen/common/device-tree/cpu-topology.c  | 409 +++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  21 +-
 xen/common/sysctl.c                    |   1 +
 xen/drivers/acpi/Makefile              |   1 +
 xen/drivers/acpi/topology.c            | 326 ++++++++++++++++++++
 xen/include/xen/acpi.h                 |  17 +
 xen/include/xen/cpu-topology.h         |  76 +++++
 xen/include/xen/dt-cpu-topology.h      |  35 +++
 21 files changed, 972 insertions(+), 38 deletions(-)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

-- 
2.43.0


