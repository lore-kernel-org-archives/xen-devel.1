Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51252C88E54
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:45:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416151.1645306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xp7-0007OQ-Fg; Fri, 11 Sep 2026 09:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416151.1645306; Fri, 11 Sep 2026 09:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xp7-0007OJ-BT; Fri, 11 Sep 2026 09:45:33 +0000
Received: by outflank-mailman (input) for mailman id 1416151;
 Fri, 11 Sep 2026 09:45:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1x4xp5-0007OD-G0
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:45:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xp4-00AziL-BY
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:45:30 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6aa3cdb0-8faa-0a2a0a5109dd-0a2a450ae514-16
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:45:29 +0200
Received: from [52.101.229.97]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6aa3cdb6-f2d2-0a2a450a0019-3465e561c0b4-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:45:28 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB5003.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:14b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:45:24 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:45:23 +0000
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
 b=vyl76/WuZDFO5DWAlgyoinFRVqPl4XclLt1gABD+rAtnatrUZ/BsJ1dRYAs9yFwi085Ull9Bd0QvQfEWUJ0xZAPJKgpCbxeAhIXLKZ0+HFPWb8OqO0AshRI9Xm5sBbLffwV2GS9n+4+KT1K/1rqRjTqKARlBK8q+bFaMARUcX9qvooVusOLwMqqyD2+qa4VtRlFSqW+xQBfczaGPpPF4UO8hULdO8l/goxVspMylc90hwywLXqmV93xfCHn11HB7raYehlR3APKocYNyXRm6k/wOW5tsgVaGeQy5tfrp1hAA33bBnDNFEax4GMs2pWgmRXZHF7D7abtmsgFRyiIM6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2v56xrYrz4wk5bZJ3cphgVcd9vTKypTw1w4TbLN7Ld0=;
 b=CR+YNCOq+agAS4k9haBBqG0S0HwiHVnKSZj55+6qL4PhgGbTxF3ri3hRj5iVRqYjWu8yzgrazf/O0HH9K+Zz6K4e5ySBu3XatYShExZ7mJ8/qw/9k/bG3+xGjtVbxaRFvJkseCTJbKLpdLG9S6TkxAoXTGmnF81jbhSy5NcmbiMHGmR1pKKWbbZ7DWuUqfFq7ttmz4wMmShE5Z5ZNfk8b3MC8kW4Mvw7zCyqMC9Ph4PlJqXccGbsX5fBGGz/PB0OJqZ8xA/JBHtJ87bVIAh+5Dx1ZNmXQ+aCh5h2VrF7oOJNnMtMSiVv9stf/1LEtd1rYCH2Mzgtv43UTNQdWY/zsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2v56xrYrz4wk5bZJ3cphgVcd9vTKypTw1w4TbLN7Ld0=;
 b=cX1UWO4dDmn4dYV0MF+SmfsgOAUfU2C8DR2N3jPot0stztH4BMacK/JB3BPhCXcImHQKQhlAfsX06TQ2cF6TQiviAlirV/paFTTum/wwbMS+LyXjxtB1YofnREzJ59TfXJmvr+Ka0Kkn15bbjNghtsMrcYSIFiciEENaCLZcGjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v10 0/4] xen/acpi,device-tree: Introduce generic CPU topology support for ACPI and DT
Date: Fri, 11 Sep 2026 18:42:09 +0900
Message-ID: <20260911094213.79936-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0067.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYYP286MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c20f3a-7a79-410d-581c-08df0fe966ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|376014|366016|56012099006|3023799007|25016099003|18002099003|10067099003|29003799003|6133799003;
X-Microsoft-Antispam-Message-Info:
	XwR4dc1vUbUplUNicr+UpPGu+o3j1+InZtFKOe/Ph9tIoaoaaE63BAUeRvkglLOpKenCA/omkp1ySWM7CQY9qUVX+CbIV0/lpcHsRQ0lC1QYCnlhfkEMjihVJg06t1eeDtIjoYz611S7JY7HsgL5Q8Jz791aEGi4czpEjTtzB8vRpDGtwtShULPwxIxtPovxqWnSdHDKGeIq1jCSYAxY9tj+gBkKfl4lsMrQh8mO1NilBKXOeHs8n7Yh7hl6D8BceNeCVt81aATM9VXSlIVwkfWe+IyQD1pnQoqP6QSkRjrw2AWMtHOdT2egnDILNtEdweU++NvIMD/Lr7sgE4435T5KU3OhDMDa7b83f79WaguMbOclU55Wrp6njb+rFMDYYmIF/12DhGuCN+W3JHiE4vC4gDcAGOtDnAMOUrkLTWI4p0FuPQrut1zr51f98mt26bXWg9N5oDlaB+CllP2d5CtbRqB6CM/dhASsab2+yLIDlFLeLcLxB2hgx04a4blZdyoCSF1ewprecLuY813FPyXYdh9mxfRY2830ns+Mi/eR/RS//N8yRIjoSnabIiZ72x8j3CfgAmZQpN40hYONK3dU/TE57dBwSN68QeSMHcBRtM8V4h3htNN6zp1Sh06ljgn1MYkvrHzZUhxPIG550QVrh/TdVOXjCotYZQ9T0+A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(376014)(366016)(56012099006)(3023799007)(25016099003)(18002099003)(10067099003)(29003799003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IruwKqZXYkLhTzgitwAFstuppa1XsiKgngVcwTs/waisqrvK6ke+V2CyvjfY?=
 =?us-ascii?Q?GTDqF9TIWZfOoqaU8rD/lcaPch+mOsToQSyA3C81pf+zw4PvXIvIF8capAHd?=
 =?us-ascii?Q?N/nB3rfOAElssaprMvcGw07yRwqSN8ipGD/nms8Pf1k8HSJVPXlqemvI9+9C?=
 =?us-ascii?Q?LMlhDUQQPkM1f4Tvg8T2+o+hhplUzVG7oUuTZhNqgKn4ocwBX6K2044DrUSL?=
 =?us-ascii?Q?4c6OPAZEGjYqyfRNhq0iiz2pfjy8EMaWOxD/7qgrDMauxMi917klPKIggonm?=
 =?us-ascii?Q?5VKzh0eFC/7f2yQHAwXB39s131YNVow769jFgYhHOEk41phDBBKKGVVd7d7J?=
 =?us-ascii?Q?ciNby2O1g0ne9GBqCGeTVAf/0y2aZJNhzgIBQq4V9q64LoziMXuIopg7G7es?=
 =?us-ascii?Q?IaNzukgNp074dLDixxhjTY7k2RibJIPlTiBlchIy/7fCTRsIaG78YM1oREog?=
 =?us-ascii?Q?hUswSoCLMBGW+YxOm8LiEHg/D8nxIv+LQdLn/dQXLyy6hOIzOwdCwKghHieA?=
 =?us-ascii?Q?czpULa/YpnTKuvc5RcnkHw/VWo3AZBJYioPvblw0vCDNiXveK3Yh8dTSnNpe?=
 =?us-ascii?Q?KmneLsVALrL9mjqYjbsRmYWTNJwOVsvqDylL6A33IJY+lH5ASAHlMQ2ZlCrD?=
 =?us-ascii?Q?Nh/XSwn1wnHTDpO596tWm5SSqXga7vhSqslhmn5QY8wBuPXb7YDDgRDf6/9y?=
 =?us-ascii?Q?LRsaneQMON8tMzD7/g0djwiTKjQMgOyf6Yi9Q8lV5Ooqv3qEEagyxh4JNjBD?=
 =?us-ascii?Q?bC4/5NEy5CEbURvISMSiqQ0LXI+RvqrTP3gaUQCl5iv5BxFb2qltwzCiUG7U?=
 =?us-ascii?Q?WAkE7gOstwaxhpAq+6sRrd4qoZGJJy5x1tA/TknYaOcYx+jjUajOJensa9ag?=
 =?us-ascii?Q?5L8noxZpl0BLRH9ReOiY0WeLkw2JRMcoEx3Nz7OCutaiFyd/uoXCiKeR5OjZ?=
 =?us-ascii?Q?ZiITk7oveyfEWywGZryGpt/7zvaGA+kw5Qxq7R0bvfesDvAUUiVW/mebZkBX?=
 =?us-ascii?Q?7hi+wNUzM6ZDTs2niN7YEo17jqScwua6W4+KcW4X5fuD4JBn5X986GzY8Mys?=
 =?us-ascii?Q?G/8hzeUdNagY3BUnVr4KgxjTSM0xtxPZj2GZvmobihQWPf43cklxVETsvTPm?=
 =?us-ascii?Q?MgqqS2WFOEqZF5N5D7Jk7mseV7CeGKYObLAP6x7FqyaYpvRj9htDYFmm0Be/?=
 =?us-ascii?Q?dVFcjHdeWhjytT50Th9JWYofN/6BxTSFJddnWMIQQZ37hNXhOMkWt6nHDkqB?=
 =?us-ascii?Q?6YOiJXlFXU/2v+vFiAHGG5oC0hiSY9+y8kUD5QnboWXbIS4h98cFM0vKgESR?=
 =?us-ascii?Q?XykiAHFUmsvw1RqQYdLCVStWVqPKtQ0vR2ed4u5KdiP9Dr04V0v0IPD9Vf2n?=
 =?us-ascii?Q?OA9UOJbmATz7QbEENeW+7SQKtBFMc0i6C7tTk6BJHHaUI8E7Pz85mOT7bcL9?=
 =?us-ascii?Q?dBCmTXn4VX7E2pIbQjlD1WuyLLaLZorPI8taAHnOHc1oS7OvJoAylJoUdQwp?=
 =?us-ascii?Q?QP5T32K9CyhYpahzgvpCwSpDoMCGgIjuWw3DRdDcSEgE/taSDKWqwTaKJfEI?=
 =?us-ascii?Q?odFNAEzzpFIokJNhnz5Umb2XYUnF8kxfrVB38axpb71vqMJ7UPD+8CZZ+4Wm?=
 =?us-ascii?Q?feMeIqhUEk4lFBYrd5itHNePFbwPZFpL7OOzzlBu1389D0cQfjHO8JqVo6CX?=
 =?us-ascii?Q?JdpwNJM1O5dx9hmQkdhl8U4APQUDN6Pgw5ao6RytAk7aRJB9L519v5/SB/Bc?=
 =?us-ascii?Q?IcpoNXAIAV0sG5Dn77dGAKk/bbd1wdmoyjymAtM6kIbNpPRxQRkZO/JUelGw?=
X-MS-Exchange-AntiSpam-MessageData-1: bhAhowBSYrmGQw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c20f3a-7a79-410d-581c-08df0fe966ca
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:45:23.7274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Js7e6g66q9qSMQFZzwasSZPeJPZ4DhJuWz9YOSe2YxLjqjO6E/9QkyoY2kolqP+Nic89CXnPcMQNsdieXpvYBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5003
X-purgate-ID: tlsNG-4011c0/1789119929-53CD3CFC-2D6CEE2C/0/0
X-purgate-type: clean
X-purgate-size: 12263

Hello,

This patch series integrates CPU topology discovery into the Xen hypervisor
for both ACPI and Device Tree platforms.

Changes in v10:
 - Postpone the invocation of init_cpu_topology() until after nr_cpu_ids
   is finalized.
 - Improve the Device Tree cpu-map node parsing logic:
   * Rename functions and variables to accurately reflect the DT nodes
     being processed.
   * Simplify the parsing algorithm by eliminating recursive calls and
     avoiding passing INVALID_TOPO_ID as an argument.
 - Unify all license headers to GPL-2.0-only.
 - Return an error instead of triggering an ASSERT() when duplicate CPU
   definitions are detected.
 - Replace BUG_ON() with ASSERT() for condition checks in
   dt_init_cpu_topology().
 - Update commit messages to remove details that no longer match the
   current implementation.

Changes in v9:
 - Add bounds checking for the number of private resources in the PPTT
   processor table.
 - Verify the validity of entries when indexing into the map_cpu_acpiid table.
 - Coding style adjustments (following Xen standards):
   * Place logical operators ('||', '&&') at the end of lines when splitting
     multi-line conditions.
   * Place arithmetic operators ('+', '-') at the end of lines when wrapping
     long assignment statements.
   * Enclose bitwise operations in parentheses within conditional expressions
     that combine logical operators.
   * Combine variable declaration and initialization where applicable.

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
 xen/arch/arm/setup.c                   |   3 +
 xen/arch/arm/smpboot.c                 |  13 +-
 xen/arch/ppc/include/asm/processor.h   |   4 -
 xen/arch/riscv/include/asm/processor.h |   4 -
 xen/arch/x86/include/asm/acpi.h        |   2 -
 xen/arch/x86/include/asm/processor.h   |   1 +
 xen/common/Kconfig                     |  22 ++
 xen/common/Makefile                    |   1 +
 xen/common/cpu-topology.c              |  62 ++++
 xen/common/cpu.c                       |   5 +
 xen/common/device-tree/Makefile        |   1 +
 xen/common/device-tree/cpu-topology.c  | 412 +++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  21 +-
 xen/common/sysctl.c                    |   1 +
 xen/drivers/acpi/Makefile              |   1 +
 xen/drivers/acpi/topology.c            | 341 ++++++++++++++++++++
 xen/include/xen/acpi.h                 |  17 +
 xen/include/xen/cpu-topology.h         |  76 +++++
 xen/include/xen/dt-cpu-topology.h      |  35 +++
 22 files changed, 991 insertions(+), 38 deletions(-)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

-- 
2.43.0


