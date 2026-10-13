Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00C8CA9ED2
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:37:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446953.1663089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZsF-0005Mv-T2; Tue, 13 Oct 2026 10:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446953.1663089; Tue, 13 Oct 2026 10:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZsF-0005Mo-PG; Tue, 13 Oct 2026 10:36:47 +0000
Received: by outflank-mailman (input) for mailman id 1446953;
 Tue, 13 Oct 2026 10:36:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xGZsD-0005Mi-HY
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:36:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGZsC-00CaEj-Cm
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:36:44 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6ace09b5-8faa-0a2a0a5109dd-0a2a45098d76-10
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:36:43 +0200
Received: from [52.101.125.110]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6ace09b8-be1a-0a2a45090019-34657d6e0fb3-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 12:36:42 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY3P286MB3732.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3d2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 10:36:37 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 10:36:36 +0000
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
 b=QcYGbmoO96VmUpJFTFjA6H5tMONRxaJwN9qgi0dErZQFA6DDfPjirO0QzKt+Xrosha+4TXOFLsjIhhVdggJC4hE+u8lC6IxTB4uc317ptLTf47ensKZrRNxMFU9gNANpvMfVCVjKWnp43JUHDDGdJWxsxSnjPNYkAoGFwQLw/pQ8fJk2ZrZ+I6mAZNoUlzUtKXzCi1k8CP+V+2K7NbNzwmqqM63N6bfNbU6xNQk9IPOhkmqL0yNbbzV7X3yg1KcR3xL7+9Q3Qo5pvb21K6PGciXVAbJkLsv3qGO7djyqIILwxZ/x3+e+f8/dwGwUUNshDaJiqNdz+Y8MyJ+uEE9v7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaL68u6SlJ4JTjioq7tV6Nt3en9lumuNxYWn57RJHxo=;
 b=L1LqJe3mRaoaIiGb6X93ODKT0DTF23O+jO7F9J0xjw+gRr/SlCOgwKUOnp+d66ZG5i7Av6xbe4AVuqZ/RmJWWzoSgCsNKTjaRSNKXm68gpUwlByuTR9FBZuN4MtrAd8A3Qd/AJe86sC6nspEAwg5gZx7F24VGTS69kv/dGO5w02CjHyd5hDD3ytfknGn2WFAzCI3lvZVp0Y5eKn9KFfsnWpJyJWo6cmm3d+NuxtHEb0RQ2o9kHEOIS1vWR4MLcB/gv9ni2Z66YshGYVjohmlF9Xm9F/JwjO4cbmcrLYUQD7LxmWwl2usUBqOZHCWgOmFn/131FtbdBODrz98yl63cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaL68u6SlJ4JTjioq7tV6Nt3en9lumuNxYWn57RJHxo=;
 b=WTkrRboupDfPykvZM1MaJyQSszShjLXC6CKlt1ugjauqgGCT8V2CsUY776qY1DdLMz/IxjEnj9v2EFanDAwv2gwVs6Kj2aaD3e3JVI1GxvIl7YXwzI/QWw+xb2nUExLFpmJ+51Wmo2q3+jeqdqeXmY0B5+EZQ+sEZjhkP1XUims=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v11 0/4] xen/acpi,device-tree: Introduce generic CPU topology support for ACPI and DT
Date: Tue, 13 Oct 2026 19:36:12 +0900
Message-ID: <20261013103616.121916-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0153.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::12) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY3P286MB3732:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f0a56c0-71d2-461f-e039-08df2915dba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|56012099006|261009223027099003|10067099003|18002099003|6133799003|25016099003|29003799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0yyXNpKpTsyUqq1829c/lT9g1l8UUky795oW5IUQ3BVd7chDx9vfjYgn8t33hud1AoByYgzr2MgGVcWD9dqfG89meFmZrAA1xpCqegHMVOzgx30sogepGoz0zPmh3p4kDuY5yY/flGxIFUddafgG3b+v7GBvQVRXOAnr/vBW6WP/TXvwFx2wPLPMJhN0bIN2pdlxORZ6hmFL/vqSXdMmqi4K9391RyeG/ZkUEESlfdGNGsO7w+KFv7nK4B9K7XF7p/QKhD0h34bs41H/B0voxj5dw2sQzl+yDI+k+y2aZjceR/Z9yVRHhDIf7QVj2B/l1v20k0DWFotG7w5NcnObEfNq9Mu/8Ui1NmCmUqguQkKS7CLi+ulfFp1kkX/qzFT8NnULluCRlU44DFaHaIW4NHqYZN71B/2UPB8I/pg4rtUNHfYnOgYbvTKCT8e8p7STEhYQYzUnNG82TkfMk8Hn5jl+I/IbC1CoOxRm3jHHhSBXkkedmRlntrnx30irLP8bntSfyLoyhL4vxWtn0NmXFM3v1oE54wudUTXy2Qr/hFLyfSpAMuT7ZJUR8Rq3e2UDuNP8JePm4iUPJT4jAiBz9zkRVWCiEYu8tbd6kFonnQD9RmO71VNnl1hLaTcoj13RHDHvAb+Hzuq+9Eb0FF7nVtxSpO182bNszadVZzu255Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003)(25016099003)(29003799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R8PzJMa/1qHeVfnQO0oPkGAmqG0zRUlQ4bV3eOgKUJ4SDLFgEf1nGJK0QfKX?=
 =?us-ascii?Q?PNTTvsvHsiR3LZQRy/GYc5W44g6AyQtG+Iahvjra18O//6R8t15HDrRa7X63?=
 =?us-ascii?Q?SAqEbReacO4xh9jgtezr0P9C7lG9teOqu/o9my2YFqrmaisoR5N3rdxeM0/+?=
 =?us-ascii?Q?3dh/3jjrgto8ijFpKkHHsyWm2AOqwq59C5xhgyisL7nVzk5DSoZHEZmByRzc?=
 =?us-ascii?Q?RQAtPY7opCLPRJYTMBvc3v+AXSJYPE55fTkZfk0jPFKPYYcup7fJIFW3ZPKG?=
 =?us-ascii?Q?rb00nfpttAbxqq/iO06myMCyAYxneuKhLFIKI1ubf/vsugYitd1WJWY4XggJ?=
 =?us-ascii?Q?BfwsxvclmbHF0sJ6foZ3LAcNF3ycfxePzec5SSo49sh+zBkaoHVHe5yKVqmp?=
 =?us-ascii?Q?I3WCFnNvAIRjgx4k6nCiSzUy0HbMqCu2sQzQKRouJxljDXDTXpTLgOZkQNKN?=
 =?us-ascii?Q?oRx9njSjIIqtnPT6WoAQr1Q+rrxnh4tzCNgwVpyCAQXF9KgUtG2NP/zAvoFT?=
 =?us-ascii?Q?mavI9bmz0ZsAERtSx6TXrPU3kLvatJyeMjX22nTQn1Nj1jtmTIS50Gm2pn2a?=
 =?us-ascii?Q?FxzibyeO7VaSZbxBdrXwLZ/lPJ9ij+SfPBe8cqNe1ALxLI/crPYrraiQoQhH?=
 =?us-ascii?Q?BjacJ5nSZA5u+f+0rNff/CAP12bp85dWye+hIxqHPiRfGHHDDz65QzXQZR6h?=
 =?us-ascii?Q?R5oi6URvX1fLZFssrROQVkR3ENEnURqqtvEnKPtXfjqqvhZwWAO8kDueUqOy?=
 =?us-ascii?Q?xlpjfgPBkYJb1PgHzebPL1DQC01tvpqMfQbMve9oL9f0BByMablSwePp0Z5t?=
 =?us-ascii?Q?Zd1QN/WmkUiYRLxr7eXIbDHv8t77nYOaMg87LaSIRvGuYk9ArXvEqG8DRxjF?=
 =?us-ascii?Q?z1ERYiLVGJdt6oCtVeeqjYLak71EW+MEoGgzfsL4h61Ice73CT9BWiT4f5cR?=
 =?us-ascii?Q?OD1Vk836TMtSi6jlWsl1qpOxIXx9VOgB9uFSM1jb16lWlyCZW1uKcOw8hThw?=
 =?us-ascii?Q?6PM5we2ksF2mKAwe9mV5LKDoZZqBgfBYzAzYnR+rDGrh+H9HLaiyH4hBqHmm?=
 =?us-ascii?Q?c1I+SL3UfX8tlNIwQqxkT1u4PzvlDsPPIs154KPkFkKibQs35SHVKxlm1ns4?=
 =?us-ascii?Q?8ZIMTnqAPmCGFnDxl5pxgxmbJmpTJL5a+WcsrcdaRSHRqAJBeapdVfjNyjcZ?=
 =?us-ascii?Q?+Eu4bqZkjAFLiCcEbFaEQ2j5ViPGHo0Htz58wA/4FMDeYNGQjvClkbXQDHZQ?=
 =?us-ascii?Q?5RycfHKTiiPALPH4X64rW/Vd0vKYc5lXM7iACnDxb2eZqDPVidYf3I4H1aE2?=
 =?us-ascii?Q?Q1xMH+tTTxNNQ15lRuYeKfobI2854pZPA7n8HhcgdfukmgEhc4mnafDQVlQ+?=
 =?us-ascii?Q?suQUd+fNCu8xWeeKCXgsD+i/9mHSJoRz0pO9eczKTJhDt4+mkYLwvzGsXkGZ?=
 =?us-ascii?Q?uxe4Agk97+J4m6iv4rybiOX45benxgITduTEXVBZu9PukmNfyL5eg43IWqOG?=
 =?us-ascii?Q?gnSiLQQ532tCqzM9P0Y+YwPT/CCgNwvdXtDUo3o2Rz3feMvmunVuj+eZOASt?=
 =?us-ascii?Q?wB5iDGwztmPnclgOciAFCay06WOd+Oxhhc8tS8Fm6lt2FHyogMgaByIYGHAt?=
 =?us-ascii?Q?ZPW3ovqhZ/vb8dPB+l70yCWVy+YHx9nNGmEEcGfilzy2Vx4Zk8FjJPfLWuwm?=
 =?us-ascii?Q?a6/NDm7c9cC5S+LMkgMJC/8ii2pU5ZnWKJsxqcKOXpwTsGzLhsdcqYiRDk+y?=
 =?us-ascii?Q?Pnnmk79gXE9nf/TisUX+SiIhB0RtWAeU8smbEMO9gmaSKUDEMg704//xNPAf?=
X-MS-Exchange-AntiSpam-MessageData-1: 8baa5o2ioAeyFw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0a56c0-71d2-461f-e039-08df2915dba6
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:36:36.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTWHJ0VZv/4GX35JOgXI9JXkuG3VJG7WCDoya8t+mQI+0u+IzIkdegZsTx3rAs+dPFpjFlmKhJHV05hG7jT9gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB3732
X-purgate-ID: tlsNG-bad1c0/1791887803-BE4DB034-4A9B035F/0/0
X-purgate-type: clean
X-purgate-size: 13459

Hello,

This patch series integrates CPU topology discovery into the Xen hypervisor
for both ACPI and Device Tree platforms.

Major changes in v11 include dropping the UNSUPPORTED dependency, handling
unbooted CPU nodes gracefully in the Device Tree parser.

Changes in v11:
 - When parsing the Device Tree, ignore CPU nodes if the corresponding
   physical CPU failed to boot, rather than treating it as an error.
 - Drop the dependency on UNSUPPORTED for CPU topology support.
 - Print an error message if memory allocation fails in init_cpu_topology().
 - Fix a compilation error involving cpumask_set_cpu().
 - Call map_cpu_to_dt_node() to record the CPU ID to DT node mapping only
   when arch_cpu_init() succeeds, or if the CPU is the boot CPU (treated
   as successful since the boot CPU is already up and running).
 - Use XENLOG_ERR as the log level for error messages emitted when DT CPU
   topology parsing fails.
 - Add ASSERT(cpu_topology) to acpi_init_cpu_topology() for consistency.
 - Code cleanups:
   * Use dt_node_name_is_equal() instead of dt_node_cmp().
   * Drop redundant "ERROR:" and "WARNING:" prefixes from log messages.
   * Move header file includes into #ifdef / #else blocks where they are
     actually needed.
   * Adjust spacing to comply with the Xen coding style.

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
 xen/arch/arm/smpboot.c                 |  14 +-
 xen/arch/ppc/include/asm/processor.h   |   4 -
 xen/arch/riscv/include/asm/processor.h |   4 -
 xen/arch/x86/include/asm/acpi.h        |   2 -
 xen/arch/x86/include/asm/processor.h   |   1 +
 xen/common/Kconfig                     |  22 ++
 xen/common/Makefile                    |   1 +
 xen/common/cpu-topology.c              |  69 ++++
 xen/common/cpu.c                       |   5 +
 xen/common/device-tree/Makefile        |   1 +
 xen/common/device-tree/cpu-topology.c  | 417 +++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  21 +-
 xen/common/sysctl.c                    |   1 +
 xen/drivers/acpi/Makefile              |   1 +
 xen/drivers/acpi/topology.c            | 343 ++++++++++++++++++++
 xen/include/xen/acpi.h                 |  17 +
 xen/include/xen/cpu-topology.h         |  76 +++++
 xen/include/xen/dt-cpu-topology.h      |  35 +++
 22 files changed, 1006 insertions(+), 38 deletions(-)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

-- 
2.43.0


