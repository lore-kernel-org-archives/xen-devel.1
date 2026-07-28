Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6ABC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 05:07:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372052.1619475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woa1t-0001IK-Km; Tue, 28 Jul 2026 05:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372052.1619475; Tue, 28 Jul 2026 05:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woa1t-0001Hs-Gp; Tue, 28 Jul 2026 05:07:01 +0000
Received: by outflank-mailman (input) for mailman id 1372052;
 Tue, 28 Jul 2026 05:07:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1woa1s-00011Q-HG
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 05:07:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woa1r-00Fj7M-UB
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 07:06:59 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6838ed-bab6-0a2a0a5309dd-0a2a4504d6a2-30
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:06:59 +0200
Received: from [52.101.125.79]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6838ea-b57f-0a2a45040019-34657d4f8021-7
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:06:59 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3277.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 05:06:57 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 05:06:57 +0000
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
 b=kYlJlerv89DcY5PlB0gA2Jy5rfjxKteyAQA2B4xzTQFR7lfZhC2v7ugm76YUfHklkKEQqKGlNgdu0xpJPvKrD5V5abNSCuYbMIG8V7AmUsFEsUT9cof/JWJNXWliFlNAj1cq6yvGGZqAPuCV7u+cqY11d2SHbX3JujyWzTzqZlCZnyd8NQRYTGy5dpuKNsB+eAHVSj+rIEvi5vR5h3qhCE7JqIkx7kqvldCW18FahZREgUDlwv9dXDMM3WzdHg5n53+mlPDNrC0mS+rIgO/4DaOPEZiY3xKG1Z9Ir/QKJr2xLF1Xlxl1obv5SUZ9CCF7LPCguXT/LzY01woP2nIsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRJALSvaO0+13oGmqfWWX2m0DlQpLj2Y93MTzehhhNM=;
 b=uFlae9nVykJzHD9Cb3xgdOsXKWvUnxixh2XBzz9rt5Ox8JHthMoMWQIxxiG+U/oL5MXD3cvg06Bx08E/MBu9CfMmQgX4KnutRUncItX09Ozb3Yek5S6VCJ5qzIPZ9ZE52F4uattx1Nkapa2H87kPO9B11ckCfSWOet5D/TUNycBWba0ikg0cdZ568Z3XPkxfyE25gLyPtjQcLMsT2q7L6q3WMAtr6vSC9q1cjb3WJ9Zs0iV1QSFSVWkbKr01H9vnUt1g/Tta24aloARxOFdgJTNqpLXCljWz211blUpFokKMBxKAybVYRqErjKUsW0HIs9fwmJlPU+WkS1nzNn1NBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRJALSvaO0+13oGmqfWWX2m0DlQpLj2Y93MTzehhhNM=;
 b=uKbAEwiKS2R/N/MaiDMqJScXBov/lvNTEdvX+5VfvjsO6kxOb/b40tGnuAxCpmoX5IjHhnfxts1f8CjfdfPP5Wq3TdZBkMbA6TVspBXajx8y6VwPYqSNQSz5O8CYEtTanMGec9HuColGMgknD3PXAhCNQ42AgWyoNhNkVwk5xeE=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v9 4/4] xen/acpi: Parse PPTT to initialize CPU topology
Date: Tue, 28 Jul 2026 14:06:42 +0900
Message-ID: <20260728050642.411240-5-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728050642.411240-1-taka@valinux.co.jp>
References: <20260728050642.411240-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0157.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::10) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3277:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a8b051-f3c6-45bf-c610-08deec660c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|23010399003|1800799024|6133799003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	U9BaHD7BqVrFWkrt0r4EdTQhLXVEVIldRjPPlhOoF8joANhWu+ngR8v6F/nfjQaLBJ3KvzfZcIC4KVerQ7wFtBK4EjIkwXXM7O+fXbRWrVHfDQKMuUH0UaFdRKqTkz64UmCYu/0dB+SGnUqRK35t30TcMPQmvpCIa3P010PIdwM7ZBqRsqlXUsBndRfF1NJ4tXvZJeSGT2E4Wt4o2nGSpQYSrGY6pPHIoMyKOlzzlXoCIII7Cp/pIUdM943Sm/fjgMwhp87dyspAFNsM9vqQ0Q/77QazKDI6YUQ3G9+p4gN8b+/iXwyaZVviZ3hbw84Pep1sYHB8Dhz4E4V78ooSOEidY83TwoP9RyHbY0AbCm9As+19AFlIxJ2+HlmJUtUb7T8eX3BfE08GSVw2ILBegKr85tBMR9ktfU99jj4y7tsrcKLHnOkorNwsae+jR4AAmYPAdmrCuWg9GDkd2A9sdV7QtR6tuhf72i4oYyc63sFuCguQp+d8sNXeZwdYO4QokyH9oMRZBEDKMRMPCQbT5Ibfj3OK/N2OeOV625Bh/U0ykEv/ztOB0FGUZKOZz+2pSHMHGfx67wABjxEBMulRqb88MDJlM/rECMthGNvo6fxIxdWrEOkXqzWWXfOB6drUyDBRv5RCOVHA1W7j84VdzQuAxaeFRErFTsSWbaUxBpY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AMjoq4XAp0RSTdOXLivQZMn3moZ0cryEh0FC8O3PFznFolElxcvxSfoIw5/7?=
 =?us-ascii?Q?i6pdGL8OBOD+058kiDXr+pjmurivzHZzL2SgReycgAjuMVkHy08dHbLop6la?=
 =?us-ascii?Q?xLxYvT5l2IfbxxI38Pr7QyFAV+6AnTHurIS2TVTZpvdQc7jVvegQP0pT90A+?=
 =?us-ascii?Q?yNo0l7Z/d9qX0LFNTG/+j17d2yhzgnGG08ygVuTf2qdtIVq2fbLmlT7M5zWo?=
 =?us-ascii?Q?HMD6/mDODqanxpQpqLnxJFefi07OYIB8ZjEdg2lnGYP8th6GSks91cGTpoW3?=
 =?us-ascii?Q?QFYmpgs6tfdCjJwV6/KmVBlwY86bEezCIFWBpUDPhD6SqcdvY4yD/V15F5O0?=
 =?us-ascii?Q?Ui5ys7N5UHEtJ+WFGIj0rqRAyyP6XK73oIIgbeThRRAwnvkbbSCV4AdIWwI7?=
 =?us-ascii?Q?5Pen6Yx3ZKHCEM0EfHpnQ6WSrLqLmanNDbDz65w8v2gsCaz/iy/Nzo4UkFi4?=
 =?us-ascii?Q?cIJkCrCLEDi9QToCWmznR5sPmQfNqTvcamB8Yeld4zmsIkAVVw8UajHwIFKa?=
 =?us-ascii?Q?HbIvB1DS9PVz6uEiZLp3s+fumwBU6S50IWHBMMMvCMVAkMDSuVZEWKxCta6c?=
 =?us-ascii?Q?5CTW/2BIdSsxU1xVlXOYugMjwySiZXzJd5pjRHV3nBEGYHVPhs1ZW5g2ddK+?=
 =?us-ascii?Q?YVRnJ2gPSr7Y7vIPjZ2CjOffBEjcpcyg33moyFOb4qZC8hEHkRTJ2MOb+eD6?=
 =?us-ascii?Q?l2NRBSRoOFYwZYfKsi/I2l/atXzIXKrrJti0r4gG8PIDHZhyd65n+mGaRvl5?=
 =?us-ascii?Q?S2U0CZ/3g5WwU69oBjb7a30/KcnPFaC5JFZwLIID3Vh2BI5jSDxiaRY53YxZ?=
 =?us-ascii?Q?qb9OE1BQUudtSKbH2fwRn74IOJqyEN1JJOUFxDoyWzIec2UzxeGQPq5LtHnJ?=
 =?us-ascii?Q?N9yHj2XLQ2JkKr5KckdG7Q7V7IzYnfayis5pVZ76H5DD0np7CIMWC0Q3ajQE?=
 =?us-ascii?Q?sdW6p4YcEUYPLW6yJ+2lhHM5FswKQZvgEzkh2jDKj2GGh+g9w9Kqcia3CxUc?=
 =?us-ascii?Q?Jzk758diJKQYlGAqEGGSYyEuCNDS5QRtXouWtZgemY4aLCzG/jrxN0dVfdne?=
 =?us-ascii?Q?6hoXLgEYO34l/Z2QQ553r64PoCY4FCpSlevLn6PB/pms29JHRorxO4fMTIDY?=
 =?us-ascii?Q?vzLPbS74mS3ld5VDOhZkKovvRWOpUZr1WURIca0wLszL3I7WjDoeAcXUmS78?=
 =?us-ascii?Q?9ecZuSw7IH/DOGt+SumrccpnbVy8DDTLvjIkNVXEXqUaCDE2sHcYGGHO4B9J?=
 =?us-ascii?Q?c78taqqO66bL/2PE/0Sn3oIvX8PT+LXIkMRQVBcLZZCVjxDO9BgEHqUflGyW?=
 =?us-ascii?Q?s0k64cqPp7ysUUlyodsQvNxuuXXU92DuzlkgjnF6vRMAWy/Ig/zjHmXfyVWE?=
 =?us-ascii?Q?mljj1TRvEvstKNZq/EStd4R5shy7E6wDQ4Nce28mjtpWD0U4lyPIPANoN5Fw?=
 =?us-ascii?Q?62DrnULjN4TLxWx0t3EgJkuABTi90qzsDs+D08QwOv/LeOFlO/irpSNxgyC1?=
 =?us-ascii?Q?HwR7Hw8UTvaMyMilmx5YtWuR5Q3r8sJ9kI0vdIO3gYG5ktpA2lJuWdoBSApU?=
 =?us-ascii?Q?RsoHVys9HbgQsnwNMi3UJO0zyRGtcFz1W/t8JNRsbz02o1nm7iMlGsd+78A3?=
 =?us-ascii?Q?QI5MLuXykEPhOr6ElYaGfQi31BtPkMo5f1QtVwRSIbDbmPemHJTWQZGXGc/F?=
 =?us-ascii?Q?wwkIq6VGyZIbtWx4L+H+B88+Qqn3ceUFNfp7SOzYJxzGvfYcT+DT3VLD3ehm?=
 =?us-ascii?Q?6LIv1rRLKjMlrjtcMPVV4+e2kFo8PHMKzNQk8WfE9VSbWdvotACZOLNGRKU3?=
X-MS-Exchange-AntiSpam-MessageData-1: hzfyaBwDCKnJOA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a8b051-f3c6-45bf-c610-08deec660c6a
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 05:06:57.4042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ddBm6qrEYYsLuMZ/uvPlDFpA/YkKcJx5O3Huf7dJomzXaVwwvU1iPFkcC/6mNdq6Q8lYNHROFB15EFV/rGvMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3277
X-purgate-ID: tlsNG-ebf023/1785215219-C08D9B50-33643606/0/0
X-purgate-type: clean
X-purgate-size: 14692

Parse the ACPI PPTT (Processor Properties Topology Table) to
initialize the CPU topology.

For ACPI 6.3 and later, the ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD flag
is checked to determine the presence of threading. For ACPI 6.2 and
earlier, CPUs are assumed not to support threading.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
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

 xen/arch/arm/acpi/boot.c        |   2 +
 xen/arch/x86/include/asm/acpi.h |   2 -
 xen/drivers/acpi/topology.c     | 323 ++++++++++++++++++++++++++++++--
 xen/include/xen/acpi.h          |   4 +
 4 files changed, 316 insertions(+), 15 deletions(-)

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
diff --git a/xen/arch/x86/include/asm/acpi.h b/xen/arch/x86/include/asm/acpi.h
index 217819dd61..7a89baa143 100644
--- a/xen/arch/x86/include/asm/acpi.h
+++ b/xen/arch/x86/include/asm/acpi.h
@@ -132,8 +132,6 @@ struct acpi_sleep_info {
 extern u32 x86_acpiid_to_apicid[];
 #define MAX_LOCAL_APIC		MAX(256, 4 * NR_CPUS)
 
-#define INVALID_ACPIID		(-1U)
-
 extern u32 pmtmr_ioport;
 extern unsigned int pmtmr_width;
 
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
index 56fcfa4945..c543ed85c9 100644
--- a/xen/drivers/acpi/topology.c
+++ b/xen/drivers/acpi/topology.c
@@ -4,33 +4,330 @@
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
+ * and the second argument 'acpi_id' the 32-bit ACPI processor ID.
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
+    if ( entry->length < sizeof(*entry) || (entry->length & 3) )
+    {
+        printk(XENLOG_ERR "ACPI: PPTT subtable length is invalid\n");
+        return false;
+    }
+
+    if ( (unsigned long)entry + entry->length > table_end )
+    {
+        printk(XENLOG_ERR "ACPI: PPTT subtable extends beyond table end\n");
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
+        printk(XENLOG_ERR "ACPI: PPTT processor node length is too small\n");
+        return false;
+    }
 
     /*
-     * Generate temporary cpu topology information for now.
-     * It assumes that the cpu doesn't have SMT and all CPUs
-     * belong to the same socket.
+     * Each private resource is represented by a 32-bit resource ID.
+     * Reject if the number of private resources exceeds what can fit in
+     * the 8-bit limit of proc->header.length.
      */
+    if ( proc->number_of_priv_resources >
+         (UINT8_MAX - sizeof(*proc)) / sizeof(uint32_t) )
+    {
+        printk(XENLOG_ERR "ACPI: PPTT too many private resources\n");
+        return false;
+    }
+
+    /*
+     * Ensure the structure length accurately accounts for the trailing array.
+     */
+    table_size = sizeof(*proc) +
+                 proc->number_of_priv_resources * sizeof(uint32_t);
+
+    if ( proc->header.length < table_size )
+    {
+        printk(XENLOG_ERR "ACPI: PPTT processor node length invalid\n");
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
+    unsigned long table_end = (unsigned long)pptt + pptt->header.length;
+    const void *ptr = pptt + 1;
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
+            const struct acpi_pptt_processor *proc =
+                container_of(entry, const struct acpi_pptt_processor, header);
+
+            if ( !verify_proc(proc) )
+                break;
+
+            /*
+             * Leaf node verification is only required for ACPI 6.3
+             * (PPTT revision 2) or later.
+             */
+            if ( (proc->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) &&
+                 proc->acpi_processor_id == acpi_id &&
+                 (pptt->header.revision < 2 ||
+                  (proc->flags & ACPI_PPTT_ACPI_LEAF_NODE)) )
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
+    acpi_status status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_header);
+
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
+               "ACPI: Failed to allocate memory for topology parsing\n");
+        ret = -ENOMEM;
+        goto out;
+    }
+
+    pptt = container_of(table_header, const struct acpi_table_pptt, header);
+
+    for_each_possible_cpu(cpu)
+    {
+        uint32_t acpi_id = map_cpu_acpiid[cpu];
+        struct cpu_topology *topo = &cpu_topology[cpu];
+        const struct acpi_pptt_processor *proc;
+        unsigned int level;
+        unsigned int core_group_key = 0;
+        unsigned int cluster_group_key = 0;
+        unsigned int socket_group_key = 0;
+        bool threading = false;
+
+        if ( acpi_id == INVALID_ACPIID )
+        {
+            printk(XENLOG_WARNING "ACPI: Invalid ACPI ID for CPU %u\n", cpu);
+            ret = -EINVAL;
+            goto out;
+        }
+
+        proc = find_pptt_node(pptt, acpi_id);
+        if ( !proc )
+        {
+            printk(XENLOG_WARNING
+                   "ACPI: No PPTT leaf node for CPU %u (ACPI ID %#x)\n",
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
+            /*
+             * If this proc has no parent node, it is the root node. Treat it
+             * as equivalent to an ACPI_PPTT_PHYSICAL_PACKAGE node.
+             */
+            if ( (proc->flags & ACPI_PPTT_PHYSICAL_PACKAGE) || !proc->parent )
+            {
+                socket_group_key = offset;
+
+                /*
+                 * If cluster/core info is absent upon reaching the physical
+                 * package, assume one cluster per socket and one core per
+                 * cluster.
+                 */
+                if ( cluster_group_key == 0 )
+                    cluster_group_key = socket_group_key;
+
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
+            if ( (proc->parent & 3) ||
+                 proc->parent < sizeof(*pptt) ||
+                 proc->parent > pptt->header.length - sizeof(*proc) ||
+                 (proc->parent + sizeof(*proc) > offset &&
+                  proc->parent < offset + proc->header.length) )
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
+            if ( !verify_subtable(&proc->header, pptt) ||
+                 !verify_proc(proc) )
+                break;
+        }
+
+        if ( socket_group_key == 0 )
+        {
+            printk(XENLOG_WARNING
+                   "ACPI: Could not reach the physical package node for CPU %u (ACPI ID %#x)\n",
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
     for_each_possible_cpu(cpu)
     {
         struct cpu_topology *topo = &cpu_topology[cpu];
+        unsigned int tcpu;
 
-        topo->phys_core_id = cpu;
-        topo->num_siblings = 1;
+        for_each_possible_cpu(tcpu)
+        {
+            struct cpu_topology *ttopo = &cpu_topology[tcpu];
 
-        cpumask_set_cpu(cpu, topo->thread_sibling);
-        cpumask_copy(topo->core_sibling, &cpu_possible_map);
-        cpumask_copy(topo->cluster_sibling, &cpu_possible_map);
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
index cbb02e0f35..9788586be4 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -52,6 +52,8 @@
                 (!(entry)) || (unsigned long)(entry) + sizeof(*(entry)) > (end) ||  \
                 (entry)->header.length < sizeof(*(entry)))
 
+#define INVALID_ACPIID		(-1U)
+
 #ifdef CONFIG_ACPI
 
 #include <acpi/acpi.h>
@@ -137,10 +139,12 @@ static inline int acpi_boot_table_init(void)
 
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


