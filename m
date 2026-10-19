Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB81CCA490
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 01:58:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1453941.1667425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIcdm-0001Go-RH; Mon, 19 Oct 2026 01:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1453941.1667425; Mon, 19 Oct 2026 01:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIcdm-0001Gd-LR; Mon, 19 Oct 2026 01:58:18 +0000
Received: by outflank-mailman (input) for mailman id 1453941;
 Mon, 19 Oct 2026 01:58:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xIcdk-0001GX-0I
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 01:58:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIcdi-00Ex4U-VA
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 03:58:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6ad5784d-8faa-0a2a0a5109dd-0a2a4505e946-40
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 03:58:13 +0200
Received: from [52.101.228.120]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6ad57932-4cb1-0a2a45050019-3465e4789371-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 03:58:13 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB6254.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Mon, 19 Oct
 2026 01:58:07 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 01:58:06 +0000
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
 b=ewUvIfwfaA/Bzs6eE4pQejIRl1J1W+PzhrDXPkedgE1/E8B5JWhYjYyIPq55q0EErRJyPtIW0EJXi1JkHITE3Dp1kjCFEw5V1+cckp8qQ8DAxpxqi7NG4ivr8x1Vp+iAHqf76XDkEmTJNCOq/lKkkQPGPUqca26SDOHavU3FoBnNKXhhokREcftXflv6WGKZPNVth3Gk9ayeH61gvf778AMJUnXQNW9r1nKgnrOOOowU7jKUtwrD9V9hH1Ai24gFoiyplHcZTDI5ndjzh+GKFXwtqy7mSkTYKWETIIzy6ByqeHBQExKyQlZeSuoUh6P4FfiHMogMvYwkAk7jt23P8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agZnjvMikmQ79yhQ2WRHinwlYMDjvKES0ewjDk52J8o=;
 b=d82f48d0JhC7IDn1rYP4kFvFjNQPgy96+n9WP+PeEmdy9GwQYFSBPJ6NoygjIDYjNqYb5ykQdtE646nwG/BwNRZQV1vpBxlc+b1Tpav86y5Oa8wrJxVeEcIbFak6aGCNrPKnZ+Cxaa2p14XSof2sCweBAZ1xWP/uLczKSVlRJlxk9l3xmzxggzy+a4v1XMsXGXd6jz4SugT0RAuIWq1Qpuby3QgSnUABBwFBC9mEh3IG4QPZkADWGlFYbxb2du08GRjPf67CdTjAdlQ+wGc8xVL4qjoXUyXQYbEpRaYZV/OYlD4WpJuX3YSgfz5Eb5sTR9kzSRDC594UiIESs8oA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agZnjvMikmQ79yhQ2WRHinwlYMDjvKES0ewjDk52J8o=;
 b=iSMz9Wmv8ciV4wvPyOuImtfABZm0MLZB3OT1/frVCIwXCmHAERZ2rnBIH+JxYlNjlOeTTqgMZa06RJ9VG9e4FxNfGMUJV3JA/XsAcHsBS479oKoYnxqR7TiUR8Aelqha6rmDPFDec71x2fobkZ6YVyEF1jjoMRbsiQTEVTS+tI8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	jbeulich@suse.com,
	Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v12 0/4] xen/acpi,device-tree: Introduce generic CPU topology support for ACPI and DT
Date: Mon, 19 Oct 2026 10:57:45 +0900
Message-ID: <20261019015749.48492-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::18) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: cba3786f-3f0b-41a7-2789-08df2d846b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|1800799024|366016|56012099006|261009223027099003|10067099003|18002099003|25016099003|6133799003|29003799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	x/6rceu44374btB6WH85y0MCLGdjNKfEK9LO9WE/Mh7Ee+wuhKUJmxEahi6P5z5kJ30H/1/NgKis7QKHpH0tMBuMYgoHQVljaWv0IUxlNsUsObYOI8gP5OaeEQ88OAavM8qJ0aeDrWm6p73EMxOFLSsaF3ADeOGLpYvet2LkhFi5cAYzSc4SqaMS66I+DUS7DZYKgZpgeZV8ideQxjXUd1/M0tJCvOlyHyGKzEDo0QV7RuQGKpZNV07ZHDqGWnjvaXolG7L9W78iHfcbPSducJYqWOaIdM5wLgsQAkkCL7j1gyGgYZ1CRJT2RN+T5YaD9J9P6pJlwaafE+7/rG24donITXjLX3EDufyakviGjFIj0GbSj2hJcGDIIqO+/Nt/Crm7nEnqJjuSgyIPJN4jt2aoHXJWaDWxMJR+1+j0HUrmaEhguU/mEB6v7EGK2vKomk9X3pHUGpIb4hWGHOVWY1X0eFTBYEFXWjUbXbG5RZxZodL/PcEj5H5EbB7L9xLkxNRoqv4/HYiJpHpN4E9XyTNLRGfOjIrg7+zK2o7CF5V58sGqYDfTaIbb1zZNa2kiURlnQkT7hJgLwISln3FhvpNcyTrFiuIbgZ1PKNU4GKLDy3xS62GsXamLEEQdQT8jINLN9H1jXqK2l08RKclNYA+5GiLc51WFaNyHaZDcW4I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(1800799024)(366016)(56012099006)(261009223027099003)(10067099003)(18002099003)(25016099003)(6133799003)(29003799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dJK8tmymqz7khr1Lxnebsh5ZIQyPHiT9ZRY9qw6pzezO+9BM4sdFVikriueN?=
 =?us-ascii?Q?eHNEF/uqL746pCiy7yn/+5xOr5VFEiTrWKkh8Y2ZN6JUguUENrbXVMkrA6Hg?=
 =?us-ascii?Q?z2o0/mctcY6WKX7oYGQPeTGMAFnf0sGKS0D5QS5ZyMj3RPMAJi3JHeCY2wia?=
 =?us-ascii?Q?Jl14bFTsv5Tei4cijCnta3Q4QfI0IPp5m0qOu0sS61F8v4O4RDAGZiI7SC+8?=
 =?us-ascii?Q?eNxA+2ycWTaAGDQTRJ1RsSStG3tDrgX4eFlKJsrGhz91I2OnmIUct+ee3RrD?=
 =?us-ascii?Q?JMOGP649QnJrFBxVmgX6xuFQ7Po8tIHj5RXdjIdxr2l+dSlZZeL6N1Ivjhn5?=
 =?us-ascii?Q?HVHw2JDTkLmFEJmedrisfkpeQ4eEfVHNJGN8ptqAr10QkjeIvYCLL9Yp6bc3?=
 =?us-ascii?Q?th8Tv0TcJ1dzNjhspFGYO9/CmtGm/FrYAAUUQh1nkKX8FALwFBhcb5gT4sBr?=
 =?us-ascii?Q?2frvZFi9VEju5aPDWBj9b3i49G3Y5/pTxMBeGALAzy6R5Tsbhm7h+tfdRqmS?=
 =?us-ascii?Q?899FbUg97WRA4gYTClKJSu3p8EAL/2J+efvM0XOxDSKfc+upucUIB7K3xoNw?=
 =?us-ascii?Q?3NiNO1nzVWJw9NmOzPa5bvaCJIh4p3xThgpLAHd0qBxTEIOwKU98jL5k3Lpz?=
 =?us-ascii?Q?E3KpmQcJz5IlP7+eokDWpXemzAdtPR5tRjs+RkhRHmuLGxpas70LrqB5YS8J?=
 =?us-ascii?Q?hBfgVxddT1ACJUDX/25ZkQnTLTgN/0wM4fzy9ABeintWyaqvdv3glWtJbxey?=
 =?us-ascii?Q?jxu14/5AEAyczmiOZvhIPlsGc6zQfGlLNE/6ft+yZf31+UoZBKPDQ6AiJI9T?=
 =?us-ascii?Q?ORPQJv2fRIb125Z+iYWnikMaacqpu1LfjJVglO6MX/1idoCwVnXwKS43FQBm?=
 =?us-ascii?Q?eWkmGcY3ji65AA5QbfYYDQScb+/RCAhjdwz7kAbcstd4GOf8sGyl8p++5kFc?=
 =?us-ascii?Q?1/QURpO7T68ne2TDzGPnd+O4DMDa8xCCV0kKnfRFLCjJRLRH5k4nagem6JTH?=
 =?us-ascii?Q?KifC9bSbWZVGa0ZhOqgLfj5iuUMKzt9PNLWtbXy2tM7CcYIf1Zabo1asrkfH?=
 =?us-ascii?Q?aZUeWCneGJYzUVyzBtHNyEzl4lKsBzEw7+TaeKzuHhtL1ZLKNE2zX2RPk0DN?=
 =?us-ascii?Q?+cs2qbatE+RnjQsWdteAbW5637+6/OT9G5ofi+1vB+WhN5bylkpGbvRNGvx6?=
 =?us-ascii?Q?QL+Nvr5fEubAG5FsEap2j4LnB0MJa087kYZlM7ojrNiDcjsSudub0wcUjG8n?=
 =?us-ascii?Q?K4OS/3W3AJq+fGwE4Rpf79UDAUzusafg1JzPDX6oyliI4Lp3yNGMDZQE4oVN?=
 =?us-ascii?Q?NXRFQbXKehFgmydIzUXXiDfOw4q5D+hwiuyfSg75KUEJkF2Wz3nO7pbahnwT?=
 =?us-ascii?Q?qJelOh+WnoPS3UPmnW/ZTg82rohyFSp2WWdo+RsZMCjUp9SOq7ljmbGtdQyK?=
 =?us-ascii?Q?q3jfcgdCmw/dpwjwXbPscElMRD7fosklEqVsa0AE0WAx7wypJ7Jz2NDhUeFg?=
 =?us-ascii?Q?K67m8QPnPU19Ib98FEPwgZ+q573koyq0HkcUemusae2IJD8xawuV8wxHpuSI?=
 =?us-ascii?Q?EPeRlEQoBYs/feGWq6m+rawnmEXoUmq/LBVH5OwsnWiltZ9mXseyEbFvCizR?=
 =?us-ascii?Q?lTU4pgKQ7bLH6MhQOddfsfnx4XYTXLHlHHtX73H1UgijtLqhCAkOxOrSjw9Z?=
 =?us-ascii?Q?1YF8H2+BgF2rwX+tieil3ORdN7BENWWGQrcSHowz/fsJijZ+jcfiNwRbAn2J?=
 =?us-ascii?Q?3MCLeNJD6PaM1d7+qslSWvX8dSVPVnFBMtqKhqtmLwbhfpem0pYP?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: cba3786f-3f0b-41a7-2789-08df2d846b2c
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 01:58:06.8459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMOVKdaEt7jap/bxk1JdL0Zbodpmj2FX863kGyQvOpnxbWRXcgGRpTYL836NZCLN2EzC8/Pbk3zEqkklxnzLGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6254
X-purgate-ID: tlsNG-c201ff/1792375093-F70B22A1-DDAB1B32/0/0
X-purgate-type: clean
X-purgate-size: 14352

Hello,

This is v12 of the ARM64 CPU topology discovery patch series.

Changes in v12:
 - Error reporting for memory allocation failures in init_cpu_topology()
   into a single error path.
 - Emit an error message from init_cpu_topology() when
   dt_init_cpu_topology() or acpi_init_cpu_topology() returns an error,
   explicitly indicating that CPU topology initialization has failed.
 - Drop the Reviewed-by tag from patch 0001 due to changes in
   common/cpu-topology.c.
 - In dt_smp_init_cpus(), add a comment explaining that the boot core
   remains valid even if arch_cpu_init() fails.
 - dt_init_cpu_topology() returns -EINVAL if a leaf node lacks the cpu
   phandle property or if the target node is not a valid CPU node.
 - dt_init_cpu_topology() continues parsing subsequent threads instead
   of returning early when a referenced CPU is not tracked by Xen.
 - Update the log message when skipping an unmapped CPU to reflect
   that secondary CPUs have not yet been brought up at this stage.
 - Remove trailing periods from log messages.
 - Drop the Reviewed-by tag from patch 0001 due to changes in
   common/cpu-topology.c.

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
 xen/arch/arm/smpboot.c                 |  18 +-
 xen/arch/ppc/include/asm/processor.h   |   4 -
 xen/arch/riscv/include/asm/processor.h |   4 -
 xen/arch/x86/include/asm/acpi.h        |   2 -
 xen/arch/x86/include/asm/processor.h   |   1 +
 xen/common/Kconfig                     |  22 ++
 xen/common/Makefile                    |   1 +
 xen/common/cpu-topology.c              |  73 +++++
 xen/common/cpu.c                       |   5 +
 xen/common/device-tree/Makefile        |   1 +
 xen/common/device-tree/cpu-topology.c  | 435 +++++++++++++++++++++++++
 xen/common/sched/credit2.c             |  21 +-
 xen/common/sysctl.c                    |   1 +
 xen/drivers/acpi/Makefile              |   1 +
 xen/drivers/acpi/topology.c            | 343 +++++++++++++++++++
 xen/include/xen/acpi.h                 |  17 +
 xen/include/xen/cpu-topology.h         |  76 +++++
 xen/include/xen/dt-cpu-topology.h      |  35 ++
 22 files changed, 1032 insertions(+), 38 deletions(-)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

-- 
2.43.0


