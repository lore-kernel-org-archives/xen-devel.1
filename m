Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF8EC54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 05:07:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372048.1619441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woa1r-0000ZK-3r; Tue, 28 Jul 2026 05:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372048.1619441; Tue, 28 Jul 2026 05:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woa1r-0000ZD-0U; Tue, 28 Jul 2026 05:06:59 +0000
Received: by outflank-mailman (input) for mailman id 1372048;
 Tue, 28 Jul 2026 05:06:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1woa1o-0000Yv-00
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 05:06:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woa1m-00Fj7M-Mw
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 07:06:54 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6838ed-bab6-0a2a0a5309dd-0a2a4504d6a2-0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:06:53 +0200
Received: from [52.101.125.79]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6838ea-b57f-0a2a45040019-34657d4f8021-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:06:52 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3277.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 05:06:48 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 05:06:48 +0000
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
 b=flmWxBVhf2Bwo8el3iB3hRs/hMG6YputCcmyrZjPwp9ZHXCRF9i8oQW5RIBYR1bycA5lktAjYCDtUsfnb8uaYsSo9QfMJGrb/cr7lM0LzMDvKZFjyv+aFg/lsQlY2r0xnZrrTDsXLFDa9wjYULn6mbs1XzSB+XvFFSI/Kd5TJBGfHxbXl0eXKoHzcQWTcFLhjciTtQSx64qvx4wq+T4PUMCURv0YbPOLrFSEvcmgWzAQZqVfTlLpApy79CvWjbFHZ7x1syXxy1cUZrCtOu1GI7dn4aPKjSHIkwc4Ms11wK1kSu3czCjcKhm20wCSDxrjDZqFxenEmJl4wQzOkXLWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIH8iTkHiSnoxIPOsKQcpvdot41oBGlcBy+kpYGk440=;
 b=tD+4JcjCpOzqDcEmXKckXGS/WkQaDt4Rxkto41Ib0U9CsRYCTz8Vc+1X/MaGz4/66PznLl3JLR3qVIpeQIFQOEDHkmZlBJ7N7SDuEB3yV7OrJEELahkAuo1/2d7gl9ez/mOyGcN3Wnhi501YnbS2WystDURekC3ioqZnhb0RUDXZ4YQCiSkCGnGDHqEzoJTi91v134WA5AaoKBzMblWAUemmribG/zXMdepufw6pY+M+b/g5QsArJDwIlY5+aekzDUpD6UI0RqACdl3zx5RjRS8s+EhYlE/AmPcLm36njoGYxV6sls+mGLuVmLaqrCqCZ7798okK4SfIEc2sqzpraw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIH8iTkHiSnoxIPOsKQcpvdot41oBGlcBy+kpYGk440=;
 b=rBcR2ygloXQaDabXxYu3hjk43T9ulaeNZw1Oy2MuXBEp9mhRfJzeDs8U9qkQk6JfKjLK4VZHlcVUfI1QwPPpjre2Vd0dx6d62by+SalHeQ/uBzP/MMyBCjcMmr7D/CKjk29hJDqQuuZ8F5rdlt8DTsW708Zik+pr1iy5wY1fiwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v9 0/4] xen/acpi,device-tree: Introduce generic CPU topology support for ACPI and DT
Date: Tue, 28 Jul 2026 14:06:38 +0900
Message-ID: <20260728050642.411240-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3277:EE_
X-MS-Office365-Filtering-Correlation-Id: fddb030b-bcc5-4634-d091-08deec660707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|23010399003|1800799024|29003799003|6133799003|18002099003|25016099003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	GZAPflQFMGMnj/UAkqQSTHcTMZsOH7L7kh6ElLZ3T6avwcpZOU/2PAEre6PwexUPyTmFUDHZ1/BOT/2GGJxNDXFeTwLTGMsU1Vo7MzDtBnA9lzxhBcOkGM2CNkJIlYzC3iSmF+2DYT95tW5au9vxxpn8lPlwCGYhViMqhOIgYUzDnVKo/qUpdQcIpN0t4Sw3B6GpQCh90GCjI/sijNjD/PvXjKbduoAUos5M/OgOM16nP13uBgDZO8ryWvUmrvd27SVgacBkHxUcnqFRr6RI9Ot2oNRAFA0x50w6zTl1JkjAzrXx9kFF0/pfch948jHB/L51CIfrDDkSs39yT6gpS0dACwsgjv2i0nkX/oD+Muh8vOj8WDaUWcsxxp91txx2Rhj1inOVAAM2ndbNe+ZzSV0d9V7ZVbJRaNO1wY5aQPFYLVEB4q0cYrTLgZOhwr69Lb3q3hkEUcMZi35wpfT3VhbevnfynhwI++nh3HCldLUvpy/sk3/JmnOwVz9WhvSYJUEZ4Dl4lNKfNj3dk2/gdDKrZTTRK1ZC+QyskP3XUoae0QRHZfc2RaPvT7kph8qCTUTILnPQqs3HhiGYKxREm6YIadvpeXd2njjWxuvWe5lnCWtldCCRk2Qj/rHGMY6ocYYLo1r4Ih3dCfk6moLDKHLtea9VK8pp7dTEtxoQH68=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(23010399003)(1800799024)(29003799003)(6133799003)(18002099003)(25016099003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0IBbGEk9RlW5KkF/EQUu89X/fdkipBj6b4oZCxYmrB3I3B96Gw1/hl/lYUnU?=
 =?us-ascii?Q?1hQBo7r/rkmq0x6g3v+Np/0imgmRW95Yvq5X7+n93qo5IG7eFSV/1ZblbcuE?=
 =?us-ascii?Q?QQCAm9ANwTUkYu9yonaLMxMVYIgBDCRc4CPKbvjj9sJTF71lvSodKB3TYth/?=
 =?us-ascii?Q?Q5glSg0l3nmAtzU5H4CDaQ5MeDR+WR3Mn7Rje6X2LDbHxkxlPzP3qmOTOjZI?=
 =?us-ascii?Q?a1ixLnMlPpcGpKeHAruzFGZOzHJAiLKOB0kqcYma0dOO6maRlZOm54TwtllO?=
 =?us-ascii?Q?Bow7n0Hb/T4HP99yw/MYYYlGsvF7QyOfzzMvJnIS+DL7DWSLfM3BwdG/RUCA?=
 =?us-ascii?Q?rQPwDUHFaYghF2u/YFFBdY029MftedJo+lfZIBn3hkYB4uL2zZqAbrUdaL2R?=
 =?us-ascii?Q?gt9WajsVstniZOo2tsVZDtdXerpklcU5aja+oK+j8EeTp+oPyZceziqYocRV?=
 =?us-ascii?Q?gIBoCuAlCh5SYe/QJnrWswEVP0m6XBAGoSUB9smlH5lj9A3Xjz7+Dm9dw8dF?=
 =?us-ascii?Q?jvahVtIhSXpSiZQbMiqPxTWkp2plcjFmEV79PYKIwWMORDkyhYzli/QZwpaP?=
 =?us-ascii?Q?mGl8iiaDV8+YbKnEZ6h0EZ06IHHwq7InlMgVJhB50il53Y3gFTm3z5h4/vZR?=
 =?us-ascii?Q?Ta5PWdF1/L4B8zhetJbLIGu5tbSSRqADQzjoPW0+gGTyN4yY21surjEwVmwa?=
 =?us-ascii?Q?3kotLesGHGboU0GMsJWFKqQSmWlIHynq0CqVlaN5j6SR2CwlfQn8CXeXQfjQ?=
 =?us-ascii?Q?ag/S3Q+lKvf3IKC7AF2WZH5o5cHoxyF2b7rF4PNW4GVDhgCv+jdVdXP3nHnS?=
 =?us-ascii?Q?zvtOBcB64o6VPLGBI172Tz49NrtFe/mHQPethPbG+YsLz9wpBE6N83E05Crz?=
 =?us-ascii?Q?jeRZCCtFNSwGp1y6OfLuP0vU7Gdx1wEScLbLDEUWphG5b5elnbiC8wgCns+l?=
 =?us-ascii?Q?xDVrPm3WYWkdsqd6v0Goocsyn0Fo1nReCm2NWd8pDuhFYn7gBcY22/bxtZ99?=
 =?us-ascii?Q?LznAbRwdwUSEWGnCPlkbVgvYh2IWwByqQYMXGmtOoLbYvrIVzVsM3Avv7FLc?=
 =?us-ascii?Q?Ei0P3/XqIH0QANgpYNE0OOAcYGki+vWTwp+N2WZjO0fRO/ix6WmqkDMygGAb?=
 =?us-ascii?Q?ZhtQBTlqq8iziDYc6onP4zr5Ax1B2OS18weUZgRrd1jjcbakrNhUxqa97ia0?=
 =?us-ascii?Q?1VMZ6T4QM/Y6tuwxctFn4cEqgrV5homQkTOmoDYBkKaHT+p4JTCcHzVbqjSo?=
 =?us-ascii?Q?Cisjtxs7jtwEpgeiXH858kx97xSspEzrQJiETQcPXShXOr97wWdh5nOT2Dgx?=
 =?us-ascii?Q?REpez22b54oexIVJ8zdeparKgOJIOj8huXJAjbDYVjJ7a9CHF8VPl31IYvxs?=
 =?us-ascii?Q?dGTFQBixwJCOq9IXSqxFr31Z4FOR9pJz2z0/dwFsestnunYtFG9BkgWJ3N0G?=
 =?us-ascii?Q?8aYUKxhhxfQdJ/LwfpxrN4VWqLOWI6jpnVJXToTGoFa451QIJW47S4hoB7i6?=
 =?us-ascii?Q?ITV+BET0PiPVUQL5KfLwgQdEB4qN0sVns21uwQDflYZM7bXDxKTFZO+PP51q?=
 =?us-ascii?Q?QDxZ8g/+BMx+MmMF+sVWKqZoP9xLwgGQCJfrzKxIu/6g8s5pYdmv5dWluNzk?=
 =?us-ascii?Q?JVBmeaadYkfXTrKy4YXCAMaTtjoBFsDTV7vusC5HqT7YXTB721FvaEhF0cg/?=
 =?us-ascii?Q?9uScMagfNOWyMURi+gFWmxbl9MTX+IQ+7qfKEbU0uOKqpwWUUIxyritwlcWP?=
 =?us-ascii?Q?47/r6ywoksri6eUmCXHyXJhgYJEXTt+diacRmLyyveeHs6mep7+t3urn07/w?=
X-MS-Exchange-AntiSpam-MessageData-1: pwdX/IUX3rfCGw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: fddb030b-bcc5-4634-d091-08deec660707
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 05:06:48.3477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tco9q+oZKBcmPdNqbA04Jbsn/J+v88/bIw0YKov7BwZ+1iEsUyAQxLf7vqQ2lwmEUZN/zES76cKGCdX4SiSe+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3277
X-purgate-ID: tlsNG-ebf023/1785215213-C0AD8B50-9C0FCA69/0/0
X-purgate-type: clean
X-purgate-size: 11491

Hello,

This patch series integrates CPU topology discovery into the Xen hypervisor
for both ACPI and Device Tree platforms.

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
 xen/drivers/acpi/topology.c            | 341 +++++++++++++++++++++
 xen/include/xen/acpi.h                 |  17 +
 xen/include/xen/cpu-topology.h         |  76 +++++
 xen/include/xen/dt-cpu-topology.h      |  35 +++
 21 files changed, 987 insertions(+), 38 deletions(-)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

-- 
2.43.0


