Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10264C53219
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 00:56:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370879.1618747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnn9T-0006gR-M4; Sun, 26 Jul 2026 00:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370879.1618747; Sun, 26 Jul 2026 00:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnn9T-0006gI-GO; Sun, 26 Jul 2026 00:55:35 +0000
Received: by outflank-mailman (input) for mailman id 1370879;
 Sun, 26 Jul 2026 00:55:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wnn9Q-0006fz-RU
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 00:55:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnn9Q-007Oo9-8T
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 02:55:32 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6559e3-e002-0a2a0a5209dd-0a2a4509e574-48
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 02:55:32 +0200
Received: from [52.101.228.97]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a655aff-be1a-0a2a45090019-3465e461c552-4
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 02:55:31 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB5490.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:397::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 00:55:27 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 00:55:27 +0000
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
 b=cBg49bQqnAS3G1T7M7RsVJ900z/jRdzAro8vpIe5Boy6JWsfCV+Y4kbcSAZACTYr+9Fas8wSIhRpCTWtesdHlJLOE+H05hIr5avU+P890RmSGYMccEAI/jV7kWGhps3Pw0QmKNxkCG+81t74bRSFIvgpfpFYwtJuFxZiWNL+drDPi7aEVpQZrpYSu1fdtbBuGtg7HyxK+ctVaSftQoHLHO/4vcvj8PKCgxqNy0+j/Z1KONM9vnA3j/Ra53+b6PSm1FVjzekZJNb/6jvm4kWxpfUl4gEc5QVTM1EaE2thRMosA3QXW7jTGFQq9xhW1r/287ZxK/w+dLSiWLpvZR10LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Q4Sn6ZvbDxStJSJKmYRZ8YWSBhcchVL9I57LeHdLTQ=;
 b=SNMh9G0LXyB04ueMbsZJmc7taIgLwZdATKj0rSjXbc3Te5wmvJ9yLh6fp8kkMQQcAm/a3tvoOedOvUe7VqufyM8YJpHCoelnkqqP1HcuMJlsOeE+tLYnuLW0MyLqSrYt7Y7vVrrU7SQlm87RaxdXZpsINASrFABzZ3YNclnIzjL7tY4K4LY3kaLim/mwDwXjAZe+XAe+hiAf24Q8ZAU2RqZawedzLvXTQ8eKkr7U0kGQmonb3C+ZVTU87ItRza6ISJuC/FBbU7pdouyRw/uLo1do6Vqqddn1Ol/84LDioa/6PUtE6ZgA6nwwkF4ZA5jbQAnRTrPhIBT74gYdte3TDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Q4Sn6ZvbDxStJSJKmYRZ8YWSBhcchVL9I57LeHdLTQ=;
 b=M2rRz/RQgW19UDHvbVK0mx/lrpuaDh99qOT7QJqny2mnFAt/xBGSbYHDDcu7sxUBh1tptrz43m1VPREbOR4iwsLPt65+wILLT0SlO6G9TLIe2df1bYFg4W3WhsK/qiz1aNBW9mzk4KAj/3Fxfxp8uqUFE2SBZNrL+bJCEvsYTGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH v8 1/4] xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
Date: Sun, 26 Jul 2026 09:55:14 +0900
Message-ID: <20260726005517.379267-2-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260726005517.379267-1-taka@valinux.co.jp>
References: <20260726005517.379267-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::10) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB5490:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6200f9-3386-4592-3776-08deeab0955d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10070799003|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4DCqLUpwzeAjxQSCg4Y2MhTk3wJpEvRanypax0tM3t0Mt+o0xEWqrMhrmEtuR4dLyHfQgtMeAcoiY2WPI+OgP/94JmN/RWQFT8H6NjTDZyVxjhT5HHsVzBEmFS9te2OaiP84L/wedGFEy56euBwzAvuQ44GFJhAu6TTNeoEfKMzrC27mQJX2CQoXdqCZviDIdEzRTqfD/JJNJLJC7p0lyFxjsmg5CtfsoDCoGosws8EWmmHnHHEXaZWmS3n97JIy/OnInOgLbF5pgEpFkRRa1OCwOWFHx8LN5H9s1cwXosQIHLlLmiq4gES6jKSczum7kkM1CFy041m5eRrTGaQrt0daas2PcbS62i92ansxDL1iSKy/H1YVWRatI3wddwRAgqB6WKgIe1bXfeQtCBUB+7kVmmk6G+lG4YqMpKThWpAN0N+3KvfzglAUWt2XApoFGDB8Big0uJW+cxbtIUAOCKq/fQls6k8UOS/m1vLBeGzBKPifbmLSIzSuANjU3+2B+vj49Y05852qKYHrGA0/ZikyIVn1zq5bIk2sGknQ0s6HgfAgFNE+J0n+3NM/EE/bDwf3Lspa+OS7gG7E996wt4ukoXbHFqbIMlDrgHRusirftoiIGIh5bMJbgFW0cz3oY8PMkQ8zqon6XJI4spDJDNxbyRhTPw+KVLGv6V0fMy0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10070799003)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xk4Sj/yJ3+AgfupMDqO6tFxstpOfuQXAa2jCt1BSD86sUZRAy30dQeWq6ZUA?=
 =?us-ascii?Q?3mlzj/OxotkfY/Qf2zH0ETx0/jNJgMRSnuwUjM1+uD4pxvoV/v+E2Gv7mFrK?=
 =?us-ascii?Q?AeifSuN6o1ooZo1TcEH6zD4o3hcfIefIywVjgBtL/c4kJAiFPyhegMqdv87o?=
 =?us-ascii?Q?hlP2S6lmM9SF72dRlZgNpcPDvXOPVnmMW6JdlGt0gL8NpEnqoVlTOmyJjXIJ?=
 =?us-ascii?Q?VZs0l0Q44RKv/SeGaW8IR1J+RS9fGpr/HUyQrWSweLLuiSuyla+w2UOnxGUp?=
 =?us-ascii?Q?fAFx5zouZuKy58mNf7z/wHrqW/TOuMSTBLcXXlWC9WzkvzTtr4X405NXlECd?=
 =?us-ascii?Q?CV/4HGklUkeoxdOWxI3QMjK9OU2tx9U6HQn0xMTWPi/kt0AyZHNtWzjR01FP?=
 =?us-ascii?Q?vZHP4TzHSfzouWCFcIrcu/gqIM3FgaWk6ySk7FCHUSBS0vFmlGQgIPghaGX+?=
 =?us-ascii?Q?+ppU7d8JQBYOxmy3jtQn/cgzvrpBPhpD8JR/Z2Dw/r3bvbSlwmzP6TnqHV16?=
 =?us-ascii?Q?n1gqFz++eQR6SXByLh5/yJw4qnFsdmgkT/M1S4xMeyjKXyZC8erEAAzEYeCA?=
 =?us-ascii?Q?k6FrU0agRwUuL+SPT5WLYQ2cKLK4NM1Ugj6cdFFg0+O1LvFv9PQUmt7m3ed8?=
 =?us-ascii?Q?hBhGkq9Ay/U0rheBdGnpREE6r6Qj3ktJYdFqsgR8gO65/b7uB2WT7VhEc5t4?=
 =?us-ascii?Q?UZQyA5uebjjKn+10ZhKrrhJsCJvsecn7rxgtysXHr7TS0szbFJmoXUuyVoRj?=
 =?us-ascii?Q?d7ehlw0MwV3PmIrg4PCgzE7z1TIrQT6U9KtT2PqnBtY+0XCERNCIR8AGsGhj?=
 =?us-ascii?Q?gvl29vYqEoemoUdFQ43saZbRZBykWfotnS/HnQupRI0uVe5bXFnde2Kbs9Gc?=
 =?us-ascii?Q?lAgjPReNIWbzy3wjgbnQTmpSj6SKiC2SQTitqbyUrpmx4b52PnUFejiPEDkb?=
 =?us-ascii?Q?X7+PGq9dIuuAv8Fs1QKirKGp8KWVf59MwmtNRFKpqBhgYx+zUva8DRHExaIi?=
 =?us-ascii?Q?aMijk3z4/RTd/uRDfKuNblR+48f5Slf6c05UDavh0CqAbgCaU45cgFcTMOEp?=
 =?us-ascii?Q?IeQPbLgl3RwEbxeoDGBSvTFRi6cET+uwKB5nbzAlteTCYQ0fX6DOEwaBNzMX?=
 =?us-ascii?Q?qhoUg+F8hCralomCg8AAbo+2+zrYceq5gLrYvR2QMPhn0IlmI6gTNrsUOAnx?=
 =?us-ascii?Q?M2Y5M7rcsruF65SZ/5DiwvtZzmSumj0G1GkWknMRlaib+6Dr5VxvrJoBCYeC?=
 =?us-ascii?Q?2gDu3dMLgE+1SP+TO+gM12EAKGg9WL19Is6ENDIBGiXWOxbsjZZVxiP4PkeN?=
 =?us-ascii?Q?MBDLl6mU83yfXCxWvK0jQ2SXt1dPCnCe4VgYmc3SlS0IisSy2Hv2KOTw80Gx?=
 =?us-ascii?Q?AS1QQ5a64kCgyQJhQ0EscLR1zFTanzB2PH0aELazPdKKb6YjH2S3sUmUbRFl?=
 =?us-ascii?Q?T8QS5DfkI0Q9hRY3Vpt4T4O7plfZDSYTmDzMONsJkIr8o0yy89yzwLnlySsJ?=
 =?us-ascii?Q?tq0LPtKj8bbGu0fk/Se2CrwLouWjlfCDPfz9x4IgEFnuhEbDKKCckoemLVG9?=
 =?us-ascii?Q?GskzYlp17cwZdY54Xdr0CFj81K/lwlhRFYQEBGYolM8+fpbyuBacdKWigyOe?=
 =?us-ascii?Q?/b341R2g6gjyJOVPMKD5Ipt0UI+bO8gQmqS3ffmwgpPXV1kKGyF4PhHfD6tr?=
 =?us-ascii?Q?szvonf1o7A1n5Wr904Z/z1myLtxzkXHm62VzV4AvfETTJ5s6OBXdOgwYS9zp?=
 =?us-ascii?Q?QusqiYF1q8UvAcMg0HCnxE9FbCiKey8iz92I0UCkqyx4whMDTtVPDmjKs6O9?=
X-MS-Exchange-AntiSpam-MessageData-1: kA5IhUOuPJWWLg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6200f9-3386-4592-3776-08deeab0955d
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 00:55:27.4798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmsNJ6jLTsMdM67kctMdM+QasxtwSLxMJAFJLO4QfwksHjvY7hMS8JHkC3e/jossDyQEhLCUKzQycxGkl0MIZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB5490
X-purgate-ID: tlsNG-bad1c0/1785027332-FD06B034-5BFCBC92/0/0
X-purgate-type: clean
X-purgate-size: 21786

Parse the 'cpu-map' node in the Device Tree to extract CPU topology
information. If the 'cpu-map' node is absent, fall back to
generating the topology data from the NUMA information. This
generation assumes exactly one socket per NUMA node and that SMT
is unsupported.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Reviewed-by: Jan Beulich <jbeulich@suse.com> # common, acpi
---
Changes in v8:
  * Placed binary logical operators (||, &&) at the end of lines when
    splitting conditional statements.
  * Explicitly included <xen/cpu-topology.h> in xen/common/cpu.c.
  * Removed leftovers of ACPI_CPU_TOPOLOGY definition from
    xen/drivers/acpi/Kconfig.

 xen/arch/arm/Kconfig                  |   1 +
 xen/arch/arm/smpboot.c                |   7 +
 xen/common/Kconfig                    |  22 ++
 xen/common/Makefile                   |   1 +
 xen/common/cpu-topology.c             |  62 +++++
 xen/common/cpu.c                      |   5 +
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu-topology.c | 344 ++++++++++++++++++++++++++
 xen/drivers/acpi/Makefile             |   1 +
 xen/drivers/acpi/topology.c           |  41 +++
 xen/include/xen/acpi.h                |  13 +
 xen/include/xen/cpu-topology.h        |  34 +++
 xen/include/xen/dt-cpu-topology.h     |  35 +++
 13 files changed, 567 insertions(+)
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
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index ba5fd2dd52..d957553a44 100644
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
@@ -280,6 +285,8 @@ void __init smp_init_cpus(void)
     else
         acpi_smp_init_cpus();
 
+    init_cpu_topology();
+
     if ( opt_hmp_unsafe )
         warning_add("WARNING: HMP COMPUTING HAS BEEN ENABLED.\n"
                     "It has implications on the security and stability of the system,\n"
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
index 0000000000..52e31ef518
--- /dev/null
+++ b/xen/common/cpu-topology.c
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
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
index 0000000000..9259be73bc
--- /dev/null
+++ b/xen/common/device-tree/cpu-topology.c
@@ -0,0 +1,344 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
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
+    unsigned int package_id;
+};
+
+static struct cpu_map __initdata cpu_map[NR_CPUS] = {
+    [0 ... NR_CPUS - 1] = {
+        .thread_id = INVALID_TOPO_ID,
+        .core_id = INVALID_TOPO_ID,
+        .cluster_id = INVALID_TOPO_ID,
+        .package_id = INVALID_TOPO_ID,
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
+        if ( target_map->package_id != map->package_id )
+            continue;
+
+        cpumask_set_cpu(target_cpu, cpu_topo->core_sibling);
+        cpumask_set_cpu(cpu, target_topo->core_sibling);
+
+        if ( target_map->cluster_id != map->cluster_id )
+            continue;
+
+        if ( target_map->cluster_id != INVALID_TOPO_ID )
+        {
+            cpumask_set_cpu(target_cpu, cpu_topo->cluster_sibling);
+            cpumask_set_cpu(cpu, target_topo->cluster_sibling);
+        }
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
+static int __init parse_core(const struct dt_device_node *core,
+                             unsigned int package_id,
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
+        ASSERT(cpu_map[cpu].package_id == INVALID_TOPO_ID);
+        ASSERT(cpu_map[cpu].cluster_id == INVALID_TOPO_ID);
+        ASSERT(cpu_map[cpu].core_id == INVALID_TOPO_ID);
+        ASSERT(cpu_map[cpu].thread_id == INVALID_TOPO_ID);
+
+        cpu_map[cpu].package_id = package_id;
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
+        ASSERT(cpu_map[cpu].package_id == INVALID_TOPO_ID);
+        ASSERT(cpu_map[cpu].cluster_id == INVALID_TOPO_ID);
+        ASSERT(cpu_map[cpu].core_id == INVALID_TOPO_ID);
+        ASSERT(cpu_map[cpu].thread_id == INVALID_TOPO_ID);
+
+        cpu_map[cpu].package_id = package_id;
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
+                                unsigned int package_id,
+                                unsigned int cluster_id,
+                                unsigned int depth)
+{
+    bool leaf = true;
+    bool has_cores = false;
+    unsigned int core_id;
+    unsigned int child_cluster_id;
+
+    /*
+     * First check for child clusters; we currently ignore any
+     * information about the nesting of clusters and present the
+     * scheduler with a flat list of them.
+     */
+    for ( child_cluster_id = 0; ; child_cluster_id++ )
+    {
+        const struct dt_device_node *child_cluster;
+        char name[20];
+        int ret;
+
+        snprintf(name, sizeof(name), "cluster%u", child_cluster_id);
+        child_cluster = dt_find_child_node_by_name(cluster, name);
+
+        if ( !child_cluster )
+            break;
+
+        leaf = false;
+        ret = parse_cluster(child_cluster, package_id, child_cluster_id,
+                            depth + 1);
+        if ( depth > 0 )
+            printk(XENLOG_WARNING
+                   "WARNING: Topology for clusters of clusters not yet supported\n");
+        if ( ret != 0 )
+            return ret;
+    }
+
+    /* Now check for cores */
+    for ( core_id = 0; ; core_id++ )
+    {
+        const struct dt_device_node *core;
+        char name[20];
+        int ret;
+
+        snprintf(name, sizeof(name), "core%u", core_id);
+        core = dt_find_child_node_by_name(cluster, name);
+
+        if ( !core )
+            break;
+
+        has_cores = true;
+
+        if ( depth == 0 )
+        {
+            printk(XENLOG_ERR
+                   "ERROR: %s: cpu-map children should be clusters\n",
+                   dt_node_name(core));
+            return -EINVAL;
+        }
+
+        if ( leaf )
+        {
+            ret = parse_core(core, package_id, cluster_id, core_id);
+            if ( ret != 0 )
+                return ret;
+        }
+        else
+        {
+            printk(XENLOG_ERR "ERROR: %s: Non-leaf cluster with core %s\n",
+                   dt_node_name(cluster), name);
+            return -EINVAL;
+        }
+    }
+
+    if ( leaf && !has_cores )
+        printk(XENLOG_WARNING "WARNING: %s: empty cluster\n",
+               dt_node_name(cluster));
+
+    return 0;
+}
+
+static int __init parse_socket(const struct dt_device_node *socket)
+{
+    bool has_socket = false;
+    unsigned int package_id;
+    int ret;
+
+    for ( package_id = 0; ; package_id++ )
+    {
+        const struct dt_device_node *cluster;
+        char name[20];
+
+        snprintf(name, sizeof(name), "socket%u", package_id);
+        cluster = dt_find_child_node_by_name(socket, name);
+
+        if ( !cluster )
+            break;
+
+        has_socket = true;
+        ret = parse_cluster(cluster, package_id, INVALID_TOPO_ID, 0);
+        if ( ret != 0 )
+            return ret;
+    }
+
+    if ( !has_socket )
+        ret = parse_cluster(socket, 0, INVALID_TOPO_ID, 0);
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
+    return parse_socket(map);
+}
+
+int __init dt_init_cpu_topology(void)
+{
+    unsigned int cpu;
+    int ret;
+
+    BUG_ON(!acpi_disabled);
+    BUG_ON(!cpu_topology);
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
index 0000000000..45d1f2c5be
--- /dev/null
+++ b/xen/drivers/acpi/topology.c
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
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


