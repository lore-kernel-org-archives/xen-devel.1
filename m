Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15BFC44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:30:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367306.1617140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqsj-0007yc-AT; Mon, 20 Jul 2026 16:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367306.1617140; Mon, 20 Jul 2026 16:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqsj-0007yN-78; Mon, 20 Jul 2026 16:30:17 +0000
Received: by outflank-mailman (input) for mailman id 1367306;
 Mon, 20 Jul 2026 16:30:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wlqsh-0007jH-Ru
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:30:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqsh-007jXT-8S
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:30:15 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5e4d09-e002-0a2a0a5209dd-0a2a450187c2-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:30:15 +0200
Received: from [52.101.229.80]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a5e4d0f-5984-0a2a45010019-3465e5506d27-6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:30:14 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB6790.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:419::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:30:12 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:30:12 +0000
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
 b=hpPBfT2zTJBuJs4DbZMM07t7LVQyH4GgW3Q1zOQGqtC5FeISPRWYQQrRR/DgzQbJurY7sPFPGgUMUiwPj5J7nu3lTCSNirB8OqMflyDsycbf3sUuEdVWXUBdUDxXRYJkn3EAuN1A6e2hA6m8HZoMMWrEQzRB1Cq1paMvTmi0/mABVZ5lcxnuiZCllChxKme4O28tljFroayo1YGR3cvsGVjk4kaltk2Cdtf+yhxzUFMWSDnWRlXf7SDpL/bvOEKvEiHojp9q/7oW6cq9cPNs5H1/TcO5tTPoNJNqj3rhPOdOEFU/94hFOkHLpAeU5ETIaStkDB/v3uWwMF2sC37isA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFICUonHJZJoac1NdNgiIOkW7B7hkFZDYI80EIK19zA=;
 b=JnB/bNqQuTu+sduWN61XNodAJgz72ij6EAkmLzYDMVaZuyq/pr6V69FN2Mj1/WcuukQhuzk9frrfPbM9sARnaDKh0wqaW+p1e9Lj4nHRa2gDundHnJH5G00cWmXwmfphA1d7OF4SfX6cHZIFqMf7ecNmHmjh6l3RR97jY3SkRN1HrCGD5SmA/XSvYVXKQUQUVUcdHydqVhwEYmYLzwPUc6k0kvUx0yPTY1Rl+/9wJiV2iT3JGMppHGUrW2+GjkPDjzC+aIWEYKfgNIaSgdOwKunEyfifv+jXgkUIOnDSag16QBobwuszHJ4bmZuJ6cBYRXCwB1sOI4AKppquxu/OlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFICUonHJZJoac1NdNgiIOkW7B7hkFZDYI80EIK19zA=;
 b=b8T92V/TMc0naS56rm0jgr61B/Ity7/vEvaFCLQRzONGnjba0+Nf87nRZEva0FzU1M0mEh+XCWSz6EKeyda458i/Cto/1aIsFUkzwWTzPTi9wlhM1JrBpvn3NSfcOC9pTXMQGTYY1yap0wu9CSN4IZ8KQhc+YB7r7ifswBlDWYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 5/5] xen/acpi: Parse PPTT to initialize CPU topology
Date: Tue, 21 Jul 2026 01:28:19 +0900
Message-ID: <20260720162819.308326-6-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720162819.308326-1-taka@valinux.co.jp>
References: <20260720162819.308326-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0107.jpnprd01.prod.outlook.com
 (2603:1096:405:378::15) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc73da9-5fa0-4adc-268b-08dee67c2c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|10070799003|7416014|376014|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8txK6h/UuKvOyOuYQOf3aSxSD958FeJgHJqhSMyvSUhgR9UzVPF8RiiO5swpzGNfR3rdGS/28iihOHTxYtiBNUf0n3O7OS+DeWJWQqYheeIp2ZIwEnuGurEQsgq3I3HkUJKfWDcPKANhDXyxHv1f4/B8nI4WWfLpjwd9uXbrBk/LEwbxaXopTEdh/doQbtuA69Ntlf974C5MRPfye+onrtq2TbcKypNbHFtfc9LUo4lSLzx8G0ZiA9AJ4Bp0erxHnS/vkIT+y4ZxLaYVbEA1HUHCGLRvRLuawvVl1ImLm7gTHOQldztTVEIpa4bctKkzwLxsVKxp9pI7umtbaHYWCyNhIlsLl40yvp5SXVnozmZqgfkdTANkRp/f7pJj2p9U8yDZMQtL6XRs5CzuVYvwqZ+/UVQXO8dTJUzVjMoOSrLhs7UeECLBRVLcT99okkUInHegygbhbnro4AE/Mzrg/gLW/Ev8oHVMXWJDsnLZZqrT7zKxj4BACvog2Ly4yTDsyyhAdtWB8Af4FPjXl+BL+ZRr14uBq6j5+jQhuVosk+81KZ0yMTVEcTv+UT20DYi2oSm60lxPHPcaCsoNGaKnnD7u9kBM/82KFkgARsLNU4n5vw+gYEDJD0R9CKzu5CtkFgUsjToxMphswsblAtnUVOYai6iXXVUWSnlj/lOQw4M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(10070799003)(7416014)(376014)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lr1wL0Mgs2eHoMqsLPI3T2YV6qwcjawbnfD+dTLTrO0fsulAvv3XMernJlEm?=
 =?us-ascii?Q?cMp35FQydFPeJiqXMuV+QAhKpZVlaQ4yMXqDtRjNiHzM6kHlougDdk+Y/GjM?=
 =?us-ascii?Q?FTSxq/j5iDCYbvGYRNkBezxMGIvNVxdWCVE+UtygOFb886vvltFdi/qobr4R?=
 =?us-ascii?Q?vi8E3ysCyPmgj35iEQrUAHLzxHs0XZzLOLtgGlgeoXhH/43QrU8b0J7D80WI?=
 =?us-ascii?Q?/kL8R51WzrANBIBFczK7rPWAJTZyo75Ts2V7QYO/xZHvuUnS0KZUalArDYzi?=
 =?us-ascii?Q?1jTSAfLdPQ2LXl1Z5Wy0ajntFEzOsiLuiRBQP2aj6wy8rcCRinOA7quIY05l?=
 =?us-ascii?Q?OAzgA6YxfMGQzxYpGvdl+A/h/4Ooaws4Dw0ZKYu1Kq/ziwqKIGN7zOGJ1GaD?=
 =?us-ascii?Q?jjOryUvFx8oH1YKrxXiJyCIjx3Q43h0SfeDfoBFLVPpTvx0XhJ/WMDnO5rSR?=
 =?us-ascii?Q?IkePCP06O853IyCmmn2Ws6F9cjJYwgo3isqoYn3K5HirEhyEhzHtO7oy8Ni1?=
 =?us-ascii?Q?Cb8HgUvY6fvWFqHkOp33KBt/2g0DEw2k5gc+9tbmyAJ4Y3WKxfK2pB+L6sO/?=
 =?us-ascii?Q?mbJefh12jPLaHUBOkFRxqQkY0OJtt73/yJ+rHXcTVFUW19Va7DoAxnZJ/iJu?=
 =?us-ascii?Q?tcfZvkFLBOA4qJP13npoQDwKhX9T9vMkVxHjG+qQ2eOBf586u5F0lnweDal/?=
 =?us-ascii?Q?5gjwgNb148QkgW870vE1noJDDoax+779hLesTDydAb1WK9ZicjGI9Z2QX/EV?=
 =?us-ascii?Q?KD9UmVE0NtmogLG1xG+Hu8FUhaB9om2KtJ94mKJjYXytCMM+AoJI8jnDtMT+?=
 =?us-ascii?Q?yCKM0NCwhs1DI2TPHCa2FW0hlgDGpYVZRHhZa3kDQ3HLHFnGZavrOAL6f9rv?=
 =?us-ascii?Q?BFhuJbo5bG9twc2d8Dj9qzoKw3X8ThLawOPmsULmAeEkwYf94AR+KKtPwio2?=
 =?us-ascii?Q?nokuIZK2IhQGefw/U80aC1oomsSrFySH8Ep5uV/XQvG98vZPIjMRcy7mGuXc?=
 =?us-ascii?Q?UgAGAdYBfHuQ/FgRqyh1G+lG5cM0Rjm9/pjv/Bn12xZUKK7BW3dTe+l1Sy2X?=
 =?us-ascii?Q?cotLMCK8F4jo6mkgf0RJ9PSHXGLrSOBYmslDiWG9OqtgAoKw+xuqRFvBYwHk?=
 =?us-ascii?Q?cqTUxGGb+nXz6l83lavmEDGrn5IKX+QzCANawPKgWm5RjoVn9et6fVckgu4l?=
 =?us-ascii?Q?OB+ECLloXzfI9CRu4rqKC+J5c2TfAzlXEX6o1EqOfvhTTwP9GVQ8V/mKV/3d?=
 =?us-ascii?Q?JeN5IY3fGn3gB5Xb4+Pxm/WcvvPUb2Hby0ETlZdhFGTAnNioW2MjheZPay0Y?=
 =?us-ascii?Q?G31zmyncX8ZbHkSanKsLvtv3zXshF3YvDJDBo85edwdbl0pNoQm3CGsx+qm2?=
 =?us-ascii?Q?8xkIHmTaeCq7tZvTa8p4dXvSN4WiHw8/TdNjFTHV3qDmZGKGv+zvEaichmNW?=
 =?us-ascii?Q?93c2yKBGAy5B8mKBIaPW1gs6pgAKHXISlPOwbmVvuzk+ob5cK886ryefIp5t?=
 =?us-ascii?Q?79fzD2u2IQEiMtZrASLGNy9vxz8c59hMa56VTgDqeGkEhFYeYEdgZLKuJuLo?=
 =?us-ascii?Q?kSl8PwSaTHV04LGHzfpaZ2pAoLUa2S35jFvdTuLP/zqQYbKKTmmkDoJDXdXf?=
 =?us-ascii?Q?oOY5xIH+cEaaBYdI9HAnOD7kO95OSaVqBD5z6lrCyopeSdqC/G/wQI80bJtG?=
 =?us-ascii?Q?w5a3kLPnJmToOm1ZXDWPaHdI9odZlLxOH/NUWr3NZmLNtp/qjZp6adFJ1X49?=
 =?us-ascii?Q?EvVU28wCHQePecjdq4G/ibdFwfvV1lHY0jRuDfcm3ZK6DJcaCp1E5wAYnKqc?=
X-MS-Exchange-AntiSpam-MessageData-1: ZlKmJgnXlFIhCg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc73da9-5fa0-4adc-268b-08dee67c2c39
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:30:12.6295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knT+IIRmVPIPw5ec6002AWJPpunaeqtRw6bHbCdoKzCMR/q0jmOVkj44tofl8++TZx7q/nVZMnxY32eaEkibGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6790
X-purgate-ID: tlsNG-d62444/1784565015-C5540757-E8DBCCDE/0/0
X-purgate-type: clean
X-purgate-size: 14249

Parse the ACPI PPTT (Processor Properties Topology Table) to
initialize the CPU topology.

For ACPI 6.3 and later, the ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD flag
is checked to determine the presence of threading. For ACPI 6.2 and
earlier, CPUs are assumed not to support threading.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
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

- Code Cleanups & Style Conformance:
  * Removed redundant error checks and reduced unnecessary pointer casts.
  * Switched type-based sizeof(type) to variable-based sizeof(*var).
  * Added leading spaces before labels ( out:)

 xen/arch/arm/acpi/boot.c        |   2 +
 xen/arch/arm/include/asm/acpi.h |   2 +
 xen/drivers/acpi/topology.c     | 312 ++++++++++++++++++++++++++++++--
 xen/include/xen/acpi.h          |   2 +
 4 files changed, 305 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
index 4ac0fd8f51..fc7ecb5749 100644
--- a/xen/arch/arm/acpi/boot.c
+++ b/xen/arch/arm/acpi/boot.c
@@ -85,6 +85,7 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
             return;
         }
         bootcpu_valid = true;
+        acpi_map_cpu_acpiid(0, processor->uid);
         return;
     }
 
@@ -119,6 +120,7 @@ acpi_map_gic_cpu_interface(struct acpi_madt_generic_interrupt *processor)
 
     /* map the logical cpu id to cpu MPIDR */
     cpu_logical_map(enabled_cpus) = mpidr;
+    acpi_map_cpu_acpiid(enabled_cpus, processor->uid);
 
     enabled_cpus++;
 }
diff --git a/xen/arch/arm/include/asm/acpi.h b/xen/arch/arm/include/asm/acpi.h
index 13756dd341..b2e156e131 100644
--- a/xen/arch/arm/include/asm/acpi.h
+++ b/xen/arch/arm/include/asm/acpi.h
@@ -61,6 +61,8 @@ paddr_t acpi_get_table_offset(struct membank tbl_add[], EFI_MEM_RES index);
     (!(entry) || (unsigned long)(entry) + sizeof(*(entry)) > (end) ||	\
      (entry)->header.length != ACPI_MADT_GICC_LENGTH)
 
+#define INVALID_ACPIID		(-1U)
+
 #ifdef CONFIG_ACPI
 extern bool acpi_disabled;
 /* Basic configuration for ACPI */
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
index 56fcfa4945..2966117fef 100644
--- a/xen/drivers/acpi/topology.c
+++ b/xen/drivers/acpi/topology.c
@@ -4,33 +4,319 @@
 #include <xen/cpu-topology.h>
 #include <xen/cpumask.h>
 #include <xen/init.h>
+#include <xen/xvmalloc.h>
+
+#define ACPI_PPTT_MAX_LEVELS 16
+
+static uint32_t __initdata map_cpu_acpiid[NR_CPUS] = {
+    [0 ... NR_CPUS - 1] = INVALID_ACPIID
+};
 
 /*
- * TODO: Populate the topology information by scanning the ACPI
- *       PPTT (Processor Properties Topology Table).
+ * The first argument 'cpu' is the logical CPU ID assigned by Xen,
+ * and the second argument 'acpi_id' is passed the 'uid' field from
+ * the ACPI MADT Generic Interrupt subtable.
  */
-int __init acpi_init_cpu_topology(void)
+void __init acpi_map_cpu_acpiid(unsigned int cpu, uint32_t acpi_id)
 {
-    unsigned int cpu;
+    map_cpu_acpiid[cpu] = acpi_id;
+}
+
+static unsigned int __init get_logical_id(unsigned int key,
+                                          unsigned int *map,
+                                          unsigned int *count)
+{
+    unsigned int id;
+
+    for ( id = 0; id < *count; id++ )
+        if ( map[id] == key )
+            return id;
+
+    map[*count] = key;
+
+    return (*count)++;
+}
+
+static bool __init verify_subtable(const struct acpi_subtable_header *entry,
+                                   const struct acpi_table_pptt *pptt)
+{
+    unsigned long table_end = (unsigned long)pptt + pptt->header.length;
+
+    if ( entry->length < sizeof(*entry) || entry->length & 3 )
+    {
+        printk(XENLOG_ERR "ACPI: PPTT subtable length is invalid\n");
+        return false;
+    }
+
+    if ( (unsigned long)entry + entry->length > table_end )
+    {
+        printk(XENLOG_ERR "ACPI: PPTT subtable extends beyond table end.\n");
+        return false;
+    }
+
+    return true;
+}
+
+static bool __init verify_proc(const struct acpi_pptt_processor *proc)
+{
+    unsigned long table_size;
+
+    if ( proc->header.length < sizeof(*proc) )
+    {
+        printk(XENLOG_ERR "ACPI: PPTT processor node length is too small.\n");
+        return false;
+    }
 
     /*
-     * Generate temporary cpu topology information for now.
-     * It assumes that the cpu doesn't have SMT and all CPUs
-     * belong to the same socket.
+     * Each private resource is represented by a 32-bit resource ID.
+     * Ensure the structure length accurately accounts for the trailing array.
      */
+    table_size = sizeof(*proc)
+        + (unsigned long)proc->number_of_priv_resources * sizeof(uint32_t);
+
+    if ( proc->header.length != table_size )
+    {
+        printk(XENLOG_ERR "ACPI: PPTT processor node length invalid.\n");
+        return false;
+    }
+
+    return true;
+}
+
+static const struct acpi_pptt_processor *__init find_pptt_node(
+    const struct acpi_table_pptt *pptt, uint32_t acpi_id)
+{
+    const struct acpi_subtable_header *entry;
+    unsigned long table_end;
+    const void *ptr;
+
+    table_end = (unsigned long)pptt + pptt->header.length;
+
+    ptr = pptt + 1;
+
+    while ( (unsigned long)ptr + sizeof(*entry) <= table_end )
+    {
+        entry = ptr;
+
+        if ( !verify_subtable(entry, pptt) )
+            break;
+
+        if ( entry->type == ACPI_PPTT_TYPE_PROCESSOR )
+        {
+            const struct acpi_pptt_processor *proc;
+
+            proc = container_of(entry, const struct acpi_pptt_processor,
+                                header);
+
+            if ( !verify_proc(proc) )
+                break;
+
+            /*
+             * Leaf node verification is only required for ACPI 6.3
+             * (PPTT revision 2) or later.
+             */
+            if ( (proc->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID)
+                 && proc->acpi_processor_id == acpi_id
+                 && (pptt->header.revision < 2
+                     || (proc->flags & ACPI_PPTT_ACPI_LEAF_NODE)) )
+                return proc;
+        }
+
+        ptr += entry->length;
+    }
+
+    return NULL;
+}
+
+/*
+ * Populate the topology information by scanning the ACPI PPTT
+ * (Processor Properties Topology Table).
+ */
+int __init acpi_init_cpu_topology(void)
+{
+    acpi_status status;
+    struct acpi_table_header *table_header;
+    const struct acpi_table_pptt *pptt;
+    unsigned int num_sockets = 0;
+    unsigned int num_clusters = 0;
+    unsigned int num_cores = 0;
+    unsigned int *socket_map = xvzalloc_array(unsigned int, nr_cpu_ids);
+    unsigned int *cluster_map = xvzalloc_array(unsigned int, nr_cpu_ids);
+    unsigned int *core_map = xvzalloc_array(unsigned int, nr_cpu_ids);
+    unsigned int cpu;
+    int ret = 0;
+
+    status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_header);
+    if ( ACPI_FAILURE(status) )
+    {
+        /* A missing PPTT is benign; fall back to the default topology. */
+        ret = -ENODEV;
+        goto out;
+    }
+
+    if ( !socket_map || !cluster_map || !core_map )
+    {
+        printk(XENLOG_ERR
+               "ACPI: Failed to allocate memory for topology parsing.\n");
+        ret = -ENOMEM;
+        goto out;
+    }
+
+    pptt = container_of(table_header, const struct acpi_table_pptt, header);
+
     for_each_possible_cpu(cpu)
     {
+        uint32_t acpi_id = map_cpu_acpiid[cpu];
         struct cpu_topology *topo = &cpu_topology[cpu];
+        const struct acpi_pptt_processor *proc;
+        unsigned int level;
+        unsigned int core_group_key = 0;
+        unsigned int cluster_group_key = 0;
+        unsigned int socket_group_key = 0;
+        bool threading = false;
+
+        proc = find_pptt_node(pptt, acpi_id);
+        if ( !proc )
+        {
+            printk(XENLOG_WARNING
+                   "ACPI: No PPTT leaf node for CPU %u (ACPI ID 0x%u)\n",
+                   cpu, acpi_id);
+            ret = -ENOENT;
+            goto out;
+        }
+
+        /*
+         * Limit the maximum loop depth to prevent an infinite loop in case
+         * the PPTT is corrupted or contains cyclic references.
+         */
+        for ( level = 0; level < ACPI_PPTT_MAX_LEVELS; level++ )
+        {
+            const unsigned int offset = (const void *)proc - (const void *)pptt;
+
+            if ( proc->flags & ACPI_PPTT_PHYSICAL_PACKAGE )
+            {
+                socket_group_key = offset;
 
-        topo->phys_core_id = cpu;
-        topo->num_siblings = 1;
+                /*
+                 * If cluster/core info is absent upon reaching the physical
+                 * package, assume one cluster per socket and one core per
+                 * cluster.
+                 */
+                if ( cluster_group_key == 0 )
+                    cluster_group_key = socket_group_key;
 
-        cpumask_set_cpu(cpu, topo->thread_sibling);
-        cpumask_copy(topo->core_sibling, &cpu_possible_map);
-        cpumask_copy(topo->cluster_sibling, &cpu_possible_map);
+                if ( core_group_key == 0 )
+                    core_group_key = cluster_group_key;
+
+                break;
+            }
+            else if ( level == 0 )
+            {
+                /*
+                 * ACPI_PPTT_PROCESSOR_IS_THREAD is supported in PPTT
+                 * revision 2 and later. Assume no threading support when
+                 * PPTT revision is 1.
+                 */
+                if ( proc->flags & ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD )
+                    threading = true;
+                else
+                    core_group_key = offset;
+            }
+            else if ( level == 1 )
+            {
+                if ( threading )
+                    core_group_key = offset;
+                else
+                    cluster_group_key = offset;
+            }
+            else if ( level == 2 && threading )
+                cluster_group_key = offset;
+
+            if ( !proc->parent )
+                break;
+
+            if ( (proc->parent & 3)
+                 || proc->parent < sizeof(*pptt)
+                 || proc->parent > pptt->header.length - sizeof(*proc)
+                 || (proc->parent + sizeof(*proc) > offset
+                     && proc->parent < offset + proc->header.length) )
+            {
+                printk(XENLOG_WARNING
+                       "ACPI: PPTT parent offset is invalid\n");
+                break;
+            }
+
+            proc = (const void *)pptt + proc->parent;
+
+            if ( proc->header.type != ACPI_PPTT_TYPE_PROCESSOR )
+            {
+                printk(XENLOG_WARNING
+                       "ACPI: PPTT parent node is not a processor structure\n");
+                break;
+            }
+
+            if ( !verify_subtable(&proc->header, pptt)
+                 || !verify_proc(proc) )
+                break;
+        }
+
+        if ( socket_group_key == 0 )
+        {
+            printk(XENLOG_WARNING
+                   "ACPI: Could not reach the physical package node for CPU %u (ACPI ID 0x%u)\n",
+                   cpu, acpi_id);
+            ret = -ENOENT;
+            goto out;
+        }
+
+        topo->phys_socket_id =
+            get_logical_id(socket_group_key, socket_map, &num_sockets);
+        topo->phys_cluster_id =
+            get_logical_id(cluster_group_key, cluster_map, &num_clusters);
+        topo->phys_core_id =
+            get_logical_id(core_group_key, core_map, &num_cores);
+    }
+
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_topology *topo = &cpu_topology[cpu];
+        unsigned int tcpu;
+
+        for_each_possible_cpu(tcpu)
+        {
+            struct cpu_topology *ttopo = &cpu_topology[tcpu];
+
+            if ( cpu > tcpu )
+                continue;
+
+            if ( topo->phys_core_id == ttopo->phys_core_id )
+            {
+                cpumask_set_cpu(tcpu, topo->thread_sibling);
+                cpumask_set_cpu(cpu, ttopo->thread_sibling);
+            }
+
+            if ( topo->phys_cluster_id == ttopo->phys_cluster_id )
+            {
+                cpumask_set_cpu(tcpu, topo->cluster_sibling);
+                cpumask_set_cpu(cpu, ttopo->cluster_sibling);
+            }
+
+            if ( topo->phys_socket_id == ttopo->phys_socket_id )
+            {
+                cpumask_set_cpu(tcpu, topo->core_sibling);
+                cpumask_set_cpu(cpu, ttopo->core_sibling);
+            }
+        }
+
+        topo->num_siblings = cpumask_weight(topo->thread_sibling);
     }
 
-    return 0;
+ out:
+    xvfree(socket_map);
+    xvfree(cluster_map);
+    xvfree(core_map);
+
+    return ret;
 }
 
 /*
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index cbb02e0f35..d2a1531893 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -137,10 +137,12 @@ static inline int acpi_boot_table_init(void)
 
 #ifdef CONFIG_ACPI_CPU_TOPOLOGY
 
+void acpi_map_cpu_acpiid(unsigned int cpu, uint32_t acpi_id);
 int acpi_init_cpu_topology(void);
 
 #else /* CONFIG_ACPI_CPU_TOPOLOGY */
 
+static inline void acpi_map_cpu_acpiid(unsigned int cpu, uint32_t acpi_id) {}
 static inline int acpi_init_cpu_topology(void)
 {
     return -EOPNOTSUPP;
-- 
2.43.0


