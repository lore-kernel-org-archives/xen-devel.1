Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD68EC88E4A
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:46:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416164.1645323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xqA-0008KX-1E; Fri, 11 Sep 2026 09:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416164.1645323; Fri, 11 Sep 2026 09:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xq9-0008KQ-Uf; Fri, 11 Sep 2026 09:46:37 +0000
Received: by outflank-mailman (input) for mailman id 1416164;
 Fri, 11 Sep 2026 09:46:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1x4xq8-0008K4-Re
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:46:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xq7-00DZoV-PD
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:46:35 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6aa3cdf2-e002-0a2a0a5209dd-0a2a4504d672-16
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:46:35 +0200
Received: from [52.101.125.101]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6aa3cdf8-b57f-0a2a45040019-34657d6558a2-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:46:35 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB5003.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:14b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:46:30 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:46:30 +0000
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
 b=ElL7oN1QigY2qGvUKJr4ue7+dyuoZ+F+86sNC2KI23gRzaptSfwH4ZYDXuqPcVc4FVucRO6CIuwvMF2tefhh6H51zxiXJkL9KmPOG+OOmS1ywUBZ1ZQ/bWNynmsi2rvLJtdWGxyg/dXSVpXhbtTdMzUG8V08jbzogNMb3zmqAsrzUJjFOmdyMKnzRKzlfuVuuY2583leJI5aYgTDe0udpBbWnlmvYULjEgbXWpYDEoQZX5Ksbb4KWHjF5J/+R6Q7szcgyJsWFNUUDC9LbUdGped9DcAof3p028vHFgQpGKkNGBSXiAxxKR/TcblMR8PWKs7cPje6U2Uh4muSiQTOGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98Ejx9hGWuJ2tgdfHUsmj4uLOcuV/PMVq9M0S9wHihk=;
 b=lWIi2A4EKDWA5JYO+hfORouThDqTKcm1+fBSQkUhUL4fGNTLzgJZfrLZrdYLB6qSXNA4MWKgY1Lz4c4Rm+WermGF8P+GCmQ1u0xZGpWIm/QzEkPd7npBqkaXBBg8HuqQSmOV6m65x9DW6hDbgxLF+PEeZO7ZGqkIKLgR3r1CrW4Nu7klJ6WKjb4MDdHDMyjysSrP9zdJARBeWTV7ckr/nPIhUqgzQGi7Dr00jvdaiNaoVfhaJrVxRChDbSx7b0Y53BGskfaroIMsyXnQhm3wnHfv/0h95T+WUCURayewY9jCaezxQal641fpfjPdvo0p1Nal3HfnDNbNE8TkmMeW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98Ejx9hGWuJ2tgdfHUsmj4uLOcuV/PMVq9M0S9wHihk=;
 b=pUZrFqUbq4mjUtszoFdBD+4Ig7DLKoWVgqH6t+Gqh+cnBbpxkNCWhSRAf4nEJBaDdlcHKTVFBnqZ+SBD0ic5G5rxNE0JUrmcIBAWRx23kVQXpMZqvmFZK5QaQtQta5AmaLivjZLQwLbbC6AkAD3zQJnRvgv/DYhPnMswE/rGWEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH v10 1/4] xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
Date: Fri, 11 Sep 2026 18:42:10 +0900
Message-ID: <20260911094213.79936-2-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911094213.79936-1-taka@valinux.co.jp>
References: <20260911094213.79936-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYYP286MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: a9278e18-1c65-4b78-af55-08df0fe98eb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|7416014|376014|366016|56012099006|22082099003|18002099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	57Y7wa/bICunFTF7nnEaEFUsQjtFagRcw9ljjRl+h/k25UzRAsuD4bc64BDeODvOFYZAhly5q10IsGg6OYmHEw7UNCJZq6rdoGl4Y0LtGagkZmnqRV2qyZy7gdB9m7/jUAwV3XWGfU90Z1fO/Pamxz0Vk6ZMD96T6tU012QNcMki80qIO1NBPRpyMd8VlCotIUvR5AD9NBf1VMFg5pJm6WndcZyo2KvXORd7qF0l49IKF4HEIgvqTow4l68kVCc5Y61pdETW526lRrOXC5xoYyJKN6tovpGkvTQ4zsiuUmAPpBbhvYGHfB/WV799KxYr6hYTrs2ik20nz23uyuFXtmMF0Oq8A+L3+Ij4Eq6UuJTV9jnxT8zq6HO1VxxhFBFfKVz6X2YApEf1hC03D8zenO4NtMzBfT/lNcnzaP4VF61q461576xBH+K2RXnowCoNLO8tGCppdygOmfWMwEo4gyo11VQUSbfBFGgGH7i6wAMBcBagWww4RUFid2hIHVOXhE7STVpvBaAdv0GtnVc7mGuBv3P30gXtCZ1tJ0zQXxHAeem0yCT05SwZjWm2mSD2xj2As5CloU73bKQYGB0rgg4jw0c5zSxcC1I2FmipzRWOdOuwjaP0dtudmwxOiFdLlepyy2IS5UCICctmN3Xzfwz/M+ovi82G96SO5mNkvYY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(7416014)(376014)(366016)(56012099006)(22082099003)(18002099003)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jlCsbeB1dzopRR/eh7vO8dNbHqPeiGSzJ5mpToduUSDQsb0rZsv2VUGl2bUe?=
 =?us-ascii?Q?DJi1XX2zjdyGiBYDatXN1voU8rTE8khrYFT1WQCvPjTNRpnXW1XzhAUWn9/n?=
 =?us-ascii?Q?koZkueFlOUJitTAljTHM1ArvTHPnOuKTz1EzgduftDWco2vogbyP0b+WtmUP?=
 =?us-ascii?Q?zjRYsUIkJyCkS1sE5Tct1K+0fpoF034R63l7vjl320PXwBpHoaSFU8Qh+D7E?=
 =?us-ascii?Q?DuAuaaqi28bITxpYjllXJ6TI4RP/nTBNkz6G14ZbSDS3M35ljo2qR5vBLC2q?=
 =?us-ascii?Q?sEPMZFtUe9LROn1SyC/O3/RQM8EAvwNwGfnOBFIM6le22w13IIRC7y3dEGoL?=
 =?us-ascii?Q?C/tWkHiAmfn8J/V9wT1uLpgCauW+j7Nz1B1LumXGLr91OYzaEke+C2oddY7e?=
 =?us-ascii?Q?YCbqELGI6GIetGq+Fm5CYf/RtvfguAwv3E0AXgmL7rdh+Ct+m5GDz+O0Bk6/?=
 =?us-ascii?Q?tpD/iolJACdbK6+iCBK6GwaH1ZPMUryf7IgUoMqc6I0WVPoDrUb+q2pk3Wt9?=
 =?us-ascii?Q?xOdeTBDrSErrbFIrgDjHryy6cSsuLTSoNaxUGpborWKliUW+ngOp3idob5Rc?=
 =?us-ascii?Q?fMjvOobeZZg/Ppbh2BTw77VR4v/sI5+mbxbdUJvnGH9ZWpZNA5lPOz55p/bv?=
 =?us-ascii?Q?4jDMS5jDwuJF48sicmYthcumQdawINCSok8dO/uYMJI9pjseAWo+DKZCk1JI?=
 =?us-ascii?Q?UTbDp9VVTovY0JW1hxoWUjDko1cZmmvNsWyd0FK1BEALuoH4I5nPWXX10fZA?=
 =?us-ascii?Q?p5G+7YaexRdig4u2Qh/gZw4IzcFRrbGqjviKDVRnPSAPggWntRe20E7KdnoC?=
 =?us-ascii?Q?w+xrENWbksQaWnIm1bwpLSzACjFrwSos1xi45eGiMHQvScZe9lf+l+fJuCav?=
 =?us-ascii?Q?NLIQKdA9EyXYSxLslnFMytbjh6ujOtsGtWB+kgP7kMh3qquiZma+ObXTLPRq?=
 =?us-ascii?Q?y8VC8AdEB0y9H2e4x+rkz4Sl0Y3OYuiFnPdPJLe9tFQIvAt9eImU48rk7Rox?=
 =?us-ascii?Q?jDBkG7Lz6LH8Wh97MTdNP09ihFKaqitZ6VPhu0kvodQLEDUV7lc2K3hNsLP2?=
 =?us-ascii?Q?YmLNanGwcJsgc7xV8bvuwntVKrehQgBkbHTBc50D9ULQTAu+dEwkSHIKRuIz?=
 =?us-ascii?Q?mqzx6dItfe0S1sA017rhc8lL6NRFQjM1A6IPaRBzif4RwB14YHigYAP9akU6?=
 =?us-ascii?Q?UqqYdadgrVQ/kKQfQefdvFPQKbciGbameEGzZJykWYYTLtREnoKIYMJ/HoL/?=
 =?us-ascii?Q?EU8az24C9wna6ELuZZSUELkwKthZ958udiwIKxNiRa6fw5v9xc4eaVI+Exfd?=
 =?us-ascii?Q?HhUck+YJFUaCxY7fAkDqWK2wKPV006aOHwULyRDxCnsL3iW2reJxUzG5p1lF?=
 =?us-ascii?Q?83OFwUM1keWhmxnNOI1+4VHsOrwgDs7MR0uY5Hjzay1DrQ2CJXqqO3SV99I1?=
 =?us-ascii?Q?47l1jZr1yGZyFp0VzI9wERDeCyTZbGoFk9XQBBWYAFpEitDfOssa+Jf6EqNX?=
 =?us-ascii?Q?mYwUU/8GFG2fnljS/EsTTxjsiQgyR+lOFmTaCGcnRukKquago05M7sH2yPfx?=
 =?us-ascii?Q?vJRL+HJjjK5K4JET1uhh6eGSpIn3gYXQV0QHWfeteCafTE7pTZLuW1LpF3N3?=
 =?us-ascii?Q?ohVZFFiLzYP4icwsklrcd5hCz1ESg2ZfescnsC6rp5PQBy7u1C6Hbk4dZJY9?=
 =?us-ascii?Q?NSXbWegcczmUraukddzFzJQmnrRjg5AHCno6Zq09CtPFV2mIEqnl1w0c1vbb?=
 =?us-ascii?Q?zJys3QLZoZYuouTwDn4DkB3hvrLSGApM29C1HCMRsVoJFn34ceJgQSmwtrmp?=
X-MS-Exchange-AntiSpam-MessageData-1: bqyDaIL2eqUv/Q==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a9278e18-1c65-4b78-af55-08df0fe98eb1
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:46:30.7039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQv9AkxHzqsDHq7boSbM99xtBMtQQlIzHJUEGCDUJnV/BMFJ7rbcQHXROHl7zxwj3yXceDgAkiXNW3u/LRDmiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5003
X-purgate-ID: tlsNG-ebf023/1789119995-C22D4B50-2AE1035F/0/0
X-purgate-type: clean
X-purgate-size: 22213

Parse the 'cpu-map' node in the Device Tree to extract CPU topology
information. If the 'cpu-map' node is absent, simply ignore it.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Reviewed-by: Jan Beulich <jbeulich@suse.com> # common, acpi
---
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

 xen/arch/arm/Kconfig                  |   1 +
 xen/arch/arm/setup.c                  |   3 +
 xen/arch/arm/smpboot.c                |   5 +
 xen/common/Kconfig                    |  22 ++
 xen/common/Makefile                   |   1 +
 xen/common/cpu-topology.c             |  62 +++++
 xen/common/cpu.c                      |   5 +
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu-topology.c | 347 ++++++++++++++++++++++++++
 xen/drivers/acpi/Makefile             |   1 +
 xen/drivers/acpi/topology.c           |  41 +++
 xen/include/xen/acpi.h                |  13 +
 xen/include/xen/cpu-topology.h        |  34 +++
 xen/include/xen/dt-cpu-topology.h     |  35 +++
 14 files changed, 571 insertions(+)
 create mode 100644 xen/common/cpu-topology.c
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/drivers/acpi/topology.c
 create mode 100644 xen/include/xen/cpu-topology.h
 create mode 100644 xen/include/xen/dt-cpu-topology.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 843a43897e..1e0fd4957e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -19,6 +19,7 @@ config ARM
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_DOM0LESS
+	select HAS_GENERIC_CPU_TOPOLOGY
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
 	select HAS_STATIC_MEMORY
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 86532d0a35..108f1c703e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -10,6 +10,7 @@
 
 #include <xen/bootinfo.h>
 #include <xen/compile.h>
+#include <xen/cpu-topology.h>
 #include <xen/device_tree.h>
 #include <xen/dom0less-build.h>
 #include <xen/domain_page.h>
@@ -387,6 +388,8 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
     nr_cpu_ids = smp_get_max_cpus();
     printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", nr_cpu_ids);
 
+    init_cpu_topology();
+
     /*
      * Some errata relies on SMCCC version which is detected by psci_init()
      * (called from smp_init_cpus()).
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 1806c47a08..904130efdf 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -9,10 +9,12 @@
 
 #include <xen/acpi.h>
 #include <xen/cpu.h>
+#include <xen/cpu-topology.h>
 #include <xen/cpumask.h>
 #include <xen/delay.h>
 #include <xen/device_tree.h>
 #include <xen/domain_page.h>
+#include <xen/dt-cpu-topology.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/mm.h>
@@ -244,6 +246,9 @@ static void __init dt_smp_init_cpus(void)
         }
         else
             tmp_map[i] = hwid;
+
+        /* Pass the info to dt_init_cpu_topology() */
+        map_cpu_to_dt_node(i, cpu);
     }
 
     if ( !bootcpu_valid )
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index da80fdba84..29879a9131 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -140,6 +140,9 @@ config HAS_EX_TABLE
 config HAS_FAST_MULTIPLY
 	bool
 
+config HAS_GENERIC_CPU_TOPOLOGY
+	bool
+
 config HAS_IOPORTS
 	bool
 
@@ -191,6 +194,25 @@ config VM_EVENT
 config NEEDS_LIBELF
 	bool
 
+config GENERIC_CPU_TOPOLOGY
+	bool
+
+config DT_CPU_TOPOLOGY
+	bool "Device tree based CPU topology support (UNSUPPORTED)"
+	depends on HAS_GENERIC_CPU_TOPOLOGY && DEVICE_TREE_PARSE && UNSUPPORTED
+	select GENERIC_CPU_TOPOLOGY
+	help
+	  Retrieve CPU topology information from the device tree to optimize
+	  vCPU scheduling.
+
+config ACPI_CPU_TOPOLOGY
+	bool "ACPI based CPU topology support (UNSUPPORTED)"
+	depends on HAS_GENERIC_CPU_TOPOLOGY && ACPI && UNSUPPORTED
+	select GENERIC_CPU_TOPOLOGY
+	help
+	  Retrieve CPU topology information from the ACPI PPTT to optimize
+	  vCPU scheduling.
+
 config NUMA
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 6018e25614..901bb37925 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
+obj-$(CONFIG_GENERIC_CPU_TOPOLOGY) += cpu-topology.init.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
diff --git a/xen/common/cpu-topology.c b/xen/common/cpu-topology.c
new file mode 100644
index 0000000000..f784afbd3d
--- /dev/null
+++ b/xen/common/cpu-topology.c
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/acpi.h>
+#include <xen/cpu-topology.h>
+#include <xen/cpumask.h>
+#include <xen/dt-cpu-topology.h>
+#include <xen/init.h>
+#include <xen/xvmalloc.h>
+
+static void __init free_topology_table(void)
+{
+    unsigned int cpu;
+
+    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
+    {
+        free_cpumask_var(cpu_topology[cpu].thread_sibling);
+        free_cpumask_var(cpu_topology[cpu].core_sibling);
+        free_cpumask_var(cpu_topology[cpu].cluster_sibling);
+    }
+
+    XVFREE(cpu_topology);
+}
+
+void __init init_cpu_topology(void)
+{
+    unsigned int cpu;
+    int ret;
+
+    cpu_topology = xvzalloc_array(struct cpu_topology, nr_cpu_ids);
+    if ( !cpu_topology )
+        return;
+
+    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
+    {
+        if ( !zalloc_cpumask_var(&cpu_topology[cpu].thread_sibling) ||
+             !zalloc_cpumask_var(&cpu_topology[cpu].core_sibling) ||
+             !zalloc_cpumask_var(&cpu_topology[cpu].cluster_sibling) )
+        {
+            free_topology_table();
+            return;
+        }
+    }
+
+    if ( acpi_disabled )
+        ret = dt_init_cpu_topology();
+    else
+        ret = acpi_init_cpu_topology();
+
+    /* Free the CPU topology table if initialization fails. */
+    if ( ret != 0 )
+        free_topology_table();
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index f09af0444b..9591ada60a 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -1,5 +1,6 @@
 #include <xen/cpumask.h>
 #include <xen/cpu.h>
+#include <xen/cpu-topology.h>
 #include <xen/event.h>
 #include <xen/init.h>
 #include <xen/sched.h>
@@ -46,6 +47,10 @@ const unsigned long cpu_bit_bitmap[BITS_PER_LONG+1][BITS_TO_LONGS(NR_CPUS)] = {
 #undef MASK_DECLARE_2
 #undef MASK_DECLARE_1
 
+#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+struct cpu_topology *__ro_after_init cpu_topology;
+#endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
+
 static DEFINE_RWLOCK(cpu_add_remove_lock);
 
 bool get_cpu_maps(void)
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 9036e455d6..6ee670b5f4 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,6 +1,7 @@
 obj-y += bootfdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
+obj-$(CONFIG_DT_CPU_TOPOLOGY) += cpu-topology.init.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
new file mode 100644
index 0000000000..ce9da0bb36
--- /dev/null
+++ b/xen/common/device-tree/cpu-topology.c
@@ -0,0 +1,347 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Derived from Linux kernel 7.0's $drivers/base/arch_topology.c
+ * Parse cpu topology information.
+ */
+
+#include <xen/acpi.h>
+#include <xen/cpu-topology.h>
+#include <xen/cpumask.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+
+#define INVALID_TOPO_ID (~0U)
+
+struct cpu_map {
+    unsigned int thread_id;
+    unsigned int core_id;
+    unsigned int cluster_id;
+    unsigned int socket_id;
+};
+
+static struct cpu_map __initdata cpu_map[NR_CPUS] = {
+    [0 ... NR_CPUS - 1] = {
+        .thread_id = INVALID_TOPO_ID,
+        .core_id = INVALID_TOPO_ID,
+        .cluster_id = INVALID_TOPO_ID,
+        .socket_id = INVALID_TOPO_ID,
+    },
+};
+static struct dt_device_node *__initdata dt_cpu_table[NR_CPUS];
+
+static void __init setup_siblings_masks(unsigned int target_cpu)
+{
+    const struct cpu_topology *target_topo = &cpu_topology[target_cpu];
+    const struct cpu_map *target_map = &cpu_map[target_cpu];
+    unsigned int cpu;
+
+    /* Update cluster, core and thread sibling masks */
+    for_each_possible_cpu(cpu)
+    {
+        const struct cpu_topology *cpu_topo = &cpu_topology[cpu];
+        const struct cpu_map *map = &cpu_map[cpu];
+
+        if ( target_cpu > cpu )
+            continue;
+
+        if ( target_map->socket_id != map->socket_id )
+            continue;
+
+        cpumask_set_cpu(target_cpu, cpu_topo->core_sibling);
+        cpumask_set_cpu(cpu, target_topo->core_sibling);
+
+        if ( target_map->cluster_id != map->cluster_id )
+            continue;
+
+        cpumask_set_cpu(target_cpu, cpu_topo->cluster_sibling);
+        cpumask_set_cpu(cpu, target_topo->cluster_sibling);
+
+        if ( target_map->core_id != map->core_id )
+            continue;
+
+        cpumask_set_cpu(target_cpu, cpu_topo->thread_sibling);
+        cpumask_set_cpu(cpu, target_topo->thread_sibling);
+    }
+}
+
+static const struct dt_device_node *__init dt_find_child_node_by_name(
+    const struct dt_device_node *dt,
+    const char *name)
+{
+    const struct dt_device_node *np;
+
+    dt_for_each_child_node(dt, np)
+        if ( np->name && (dt_node_cmp(np->name, name) == 0) )
+            return np;
+
+    return NULL;
+}
+
+void __init map_cpu_to_dt_node(unsigned int cpu,
+                               struct dt_device_node *cpu_node)
+{
+    if ( cpu < ARRAY_SIZE(dt_cpu_table) )
+        dt_cpu_table[cpu] = cpu_node;
+    else
+        printk(XENLOG_WARNING
+               "cpu %u exceeds the max cpus %zu\n",
+               cpu, ARRAY_SIZE(dt_cpu_table));
+}
+
+static unsigned int __init cpu_node_to_id(
+    const struct dt_device_node *cpu_node)
+{
+    unsigned int cpu;
+
+    for_each_possible_cpu(cpu)
+        if ( cpu_node == dt_cpu_table[cpu] )
+            return cpu;
+
+    return INVALID_TOPO_ID;
+}
+
+/*
+ * This function returns the Xen cpu number of the DT node.
+ */
+static unsigned int __init get_cpu_for_node(
+    const struct dt_device_node *dt_node)
+{
+    const struct dt_device_node *cpu_node =
+        dt_parse_phandle(dt_node, "cpu", 0);
+
+    if ( !cpu_node )
+        return INVALID_TOPO_ID;
+
+    return cpu_node_to_id(cpu_node);
+}
+
+static bool __init is_cpu_map_empty( unsigned int cpu )
+{
+    return (cpu_map[cpu].socket_id == INVALID_TOPO_ID) &&
+           (cpu_map[cpu].cluster_id == INVALID_TOPO_ID) &&
+           (cpu_map[cpu].core_id == INVALID_TOPO_ID) &&
+           (cpu_map[cpu].thread_id == INVALID_TOPO_ID);
+}
+
+static int __init parse_core(const struct dt_device_node *core,
+                             unsigned int socket_id,
+                             unsigned int cluster_id,
+                             unsigned int core_id)
+{
+    bool leaf = true;
+    unsigned int thread_id;
+    unsigned int cpu;
+
+    for ( thread_id = 0; ; thread_id++ )
+    {
+        const struct dt_device_node *thread;
+        char name[20];
+
+        snprintf(name, sizeof(name), "thread%u", thread_id);
+        thread = dt_find_child_node_by_name(core, name);
+
+        if ( !thread )
+            break;
+
+        leaf = false;
+        cpu = get_cpu_for_node(thread);
+
+        if ( cpu == INVALID_TOPO_ID )
+        {
+            printk(XENLOG_ERR
+                   "ERROR: %s: Can't get CPU for thread\n", dt_node_name(thread));
+            return -EINVAL;
+        }
+
+        if ( !is_cpu_map_empty(cpu) )
+        {
+            printk(XENLOG_ERR
+                   "ERROR: Duplicate CPU definition for CPU%u\n", cpu);
+            return -EINVAL;
+        }
+
+        cpu_map[cpu].socket_id = socket_id;
+        cpu_map[cpu].cluster_id = cluster_id;
+        cpu_map[cpu].core_id = core_id;
+        cpu_map[cpu].thread_id = thread_id;
+    }
+
+    cpu = get_cpu_for_node(core);
+
+    if ( cpu != INVALID_TOPO_ID )
+    {
+        if ( !leaf )
+        {
+            printk(XENLOG_ERR "ERROR: %s: Core has both threads and CPU\n",
+                   dt_node_name(core));
+            return -EINVAL;
+        }
+
+        if ( !is_cpu_map_empty(cpu) )
+        {
+            printk(XENLOG_ERR
+                   "ERROR: Duplicate CPU definition for CPU%u\n", cpu);
+            return -EINVAL;
+        }
+
+        cpu_map[cpu].socket_id = socket_id;
+        cpu_map[cpu].cluster_id = cluster_id;
+        cpu_map[cpu].core_id = core_id;
+        cpu_map[cpu].thread_id = 0;
+    }
+    else if ( leaf )
+    {
+        printk(XENLOG_ERR
+               "ERROR: %s: Can't get CPU for leaf core\n", dt_node_name(core));
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int __init parse_cluster(const struct dt_device_node *cluster,
+                                unsigned int socket_id,
+                                unsigned int cluster_id)
+{
+    bool has_cores = false;
+    int ret = 0;
+
+    if ( dt_find_child_node_by_name(cluster, "cluster0") )
+    {
+        printk(XENLOG_WARNING
+               "WARNING: Topology for clusters of clusters not yet supported\n");
+        return -EINVAL;
+    }
+
+    for ( unsigned int core_id = 0; ; core_id++ )
+    {
+        const struct dt_device_node *core;
+        char name[20];
+
+        snprintf(name, sizeof(name), "core%u", core_id);
+        core = dt_find_child_node_by_name(cluster, name);
+
+        if ( !core )
+            break;
+
+        has_cores = true;
+
+        ret = parse_core(core, socket_id, cluster_id, core_id);
+        if ( ret != 0 )
+            return ret;
+    }
+
+    if ( !has_cores )
+        printk(XENLOG_WARNING "WARNING: %s: empty cluster\n",
+               dt_node_name(cluster));
+
+    return ret;
+}
+
+static int __init parse_socket(const struct dt_device_node *socket,
+                               unsigned int socket_id)
+{
+    bool has_cluster = false;
+    int ret = 0;
+
+    for ( unsigned int cluster_id = 0; ; cluster_id++ )
+    {
+        const struct dt_device_node *cluster;
+        char name[20];
+
+        snprintf(name, sizeof(name), "cluster%u", cluster_id);
+        cluster = dt_find_child_node_by_name(socket, name);
+
+        if ( !cluster )
+            break;
+
+        has_cluster = true;
+        ret = parse_cluster(cluster, socket_id, cluster_id);
+        if ( ret != 0 )
+            return ret;
+    }
+
+    /*
+     * If no cluster node is defined, assume the socket has
+     * a single cluster.
+     */
+    if ( !has_cluster )
+        ret = parse_cluster(socket, socket_id, 0);
+
+    return ret;
+}
+
+static int __init parse_package(const struct dt_device_node *package)
+{
+    bool has_socket = false;
+    int ret = 0;
+
+    for ( unsigned int socket_id = 0; ; socket_id++ )
+    {
+        const struct dt_device_node *socket;
+        char name[20];
+
+        snprintf(name, sizeof(name), "socket%u", socket_id);
+        socket = dt_find_child_node_by_name(package, name);
+
+        if ( !socket )
+            break;
+
+        has_socket = true;
+        ret = parse_socket(socket, socket_id);
+        if ( ret != 0 )
+            return ret;
+    }
+
+    /*
+     * If no socket node is defined, assume all clusters reside under
+     * a single socket.
+     */
+    if ( !has_socket )
+        ret = parse_socket(package, 0);
+
+    return ret;
+}
+
+static int __init parse_dt_topology(void)
+{
+    const struct dt_device_node *cpus;
+    const struct dt_device_node *map;
+
+    cpus = dt_find_node_by_path("/cpus");
+    if ( !cpus )
+        return -ENOENT;
+
+    map = dt_find_child_node_by_name(cpus, "cpu-map");
+    if ( !map )
+        return -ENOENT;
+
+    return parse_package(map);
+}
+
+int __init dt_init_cpu_topology(void)
+{
+    unsigned int cpu;
+    int ret;
+
+    ASSERT(acpi_disabled);
+    ASSERT(cpu_topology);
+
+    ret = parse_dt_topology();
+    if ( ret == 0 )
+        for_each_possible_cpu(cpu)
+            setup_siblings_masks(cpu);
+
+    return ret;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 477408afbe..6d676e91d4 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
 obj-$(CONFIG_PM_STATS) += pmstat.o
 obj-$(CONFIG_PM_OP) += pm-op.o
+obj-$(CONFIG_ACPI_CPU_TOPOLOGY) += topology.init.o
 
 obj-$(CONFIG_X86) += hwregs.o
 obj-$(CONFIG_X86) += reboot.o
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
new file mode 100644
index 0000000000..090c793f33
--- /dev/null
+++ b/xen/drivers/acpi/topology.c
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/acpi.h>
+#include <xen/cpu-topology.h>
+#include <xen/cpumask.h>
+#include <xen/init.h>
+
+/*
+ * TODO: Populate the topology information by scanning the ACPI
+ *       PPTT (Processor Properties Topology Table).
+ */
+int __init acpi_init_cpu_topology(void)
+{
+    unsigned int cpu;
+
+    /*
+     * Generate temporary cpu topology information for now.
+     * It assumes that the cpu doesn't have SMT and all CPUs
+     * belong to the same socket.
+     */
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_topology *topo = &cpu_topology[cpu];
+
+        cpumask_set_cpu(cpu, topo->thread_sibling);
+        cpumask_copy(topo->core_sibling, &cpu_possible_map);
+        cpumask_copy(topo->cluster_sibling, &cpu_possible_map);
+    }
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 2fdf38cf74..cbb02e0f35 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -135,6 +135,19 @@ static inline int acpi_boot_table_init(void)
 
 #endif 	/*!CONFIG_ACPI*/
 
+#ifdef CONFIG_ACPI_CPU_TOPOLOGY
+
+int acpi_init_cpu_topology(void);
+
+#else /* CONFIG_ACPI_CPU_TOPOLOGY */
+
+static inline int acpi_init_cpu_topology(void)
+{
+    return -EOPNOTSUPP;
+}
+
+#endif /* CONFIG_ACPI_CPU_TOPOLOGY */
+
 int get_cpu_id(u32 acpi_id);
 
 unsigned int acpi_register_gsi (u32 gsi, int edge_level, int active_high_low);
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
new file mode 100644
index 0000000000..7cfe3752cd
--- /dev/null
+++ b/xen/include/xen/cpu-topology.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_CPU_TOPOLOGY_H
+#define XEN_CPU_TOPOLOGY_H
+
+#include <xen/cpumask.h>
+
+#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
+
+struct cpu_topology {
+    cpumask_var_t thread_sibling;
+    cpumask_var_t core_sibling;
+    cpumask_var_t cluster_sibling;
+};
+
+extern struct cpu_topology *cpu_topology;
+void init_cpu_topology(void);
+
+#else /* CONFIG_GENERIC_CPU_TOPOLOGY */
+
+static inline void init_cpu_topology(void) {}
+
+#endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
+
+#endif /* XEN_CPU_TOPOLOGY_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/dt-cpu-topology.h b/xen/include/xen/dt-cpu-topology.h
new file mode 100644
index 0000000000..72b35b3cf2
--- /dev/null
+++ b/xen/include/xen/dt-cpu-topology.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_DT_CPU_TOPOLOGY_H
+#define XEN_DT_CPU_TOPOLOGY_H
+
+#include <xen/errno.h>
+
+struct dt_device_node;
+
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+
+void map_cpu_to_dt_node(unsigned int cpu, struct dt_device_node *cpu_node);
+int dt_init_cpu_topology(void);
+
+#else /* CONFIG_DT_CPU_TOPOLOGY */
+
+static inline void map_cpu_to_dt_node(unsigned int cpu,
+                                      struct dt_device_node *cpu_node) {}
+static inline int dt_init_cpu_topology(void)
+{
+    return -EOPNOTSUPP;
+}
+
+#endif /* CONFIG_DT_CPU_TOPOLOGY */
+
+#endif /* XEN_DT_CPU_TOPOLOGY_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


