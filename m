Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A48FC88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:47:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416181.1645351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xr0-0001CS-W0; Fri, 11 Sep 2026 09:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416181.1645351; Fri, 11 Sep 2026 09:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xr0-0001CL-T6; Fri, 11 Sep 2026 09:47:30 +0000
Received: by outflank-mailman (input) for mailman id 1416181;
 Fri, 11 Sep 2026 09:47:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1x4xqy-0001AL-UJ
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:47:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xqy-00DOxT-At
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:47:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6aa3ce2a-8faa-0a2a0a5109dd-0a2a450b9902-10
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:47:28 +0200
Received: from [52.101.125.124]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6aa3ce2d-b7e8-0a2a450b0019-34657d7c3aca-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:47:27 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB5003.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:14b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:47:23 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:47:23 +0000
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
 b=mV0o2nDR1s6YSzc26X4oTYKase8EE2OGXv7vI+Fix0xNT3mh+J6Ner2+GYFSW4qIxuXYR00NkyWVfMdW1hDWSyPVrjG3HIY/B28gTmwo6FNicazh1HySi+igG1d4Qxaq5/PYnJUuUg9e8E2sK18RoiZKn5cl3kHTvZNOlxsZOgzgS7QcMGYacZb4LwT2wwsq1vuRZiE4a3xLcmFdWTq1fBXWRtHDfYRJggykbfdExJ7wrqmklz0cIJOueUfaMPaRzJQNX0rma7++aqW1MESTmaA5iZVgNtDXMtoDFrmx9axB4RLNytZhZzByO2+dmFGrDg+hE6zhi6KWuCerqhtyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSMNjH+uFDnifcc7j4z3D1fg79w6dp+9PaRbS2TleWA=;
 b=Iq3WzHnTqdf97sKSHW4ul4fH/9LG8IStHpj9MwBcxJfSe0sTFz1g4sZozrKlOn1D8QC12w6BJVWnTwXRWSAz2hOz6CFWl+sGPGiP4V0xQJ26XI6sJy068nb5QpE+/Hi4XxLIZILzpHvnrDacg4WhyPr3FyJ4m5LGgqMhVvW6VECBmcikoaB6SIlDxpxV6RDOfcHUASL1Z7u2CK6M5mA/UDcxOZmj0KPNCg3mQgDnMrAg7RHk/w1GB37v5tBfgvIxC6d+2GEu9EDI/tJsosBn66+XA9NVis+Rwy4Pomusjpt6ZryV4SipgOTw8ovcUMgU/AKrzBiGSt8FrfMIdrfFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSMNjH+uFDnifcc7j4z3D1fg79w6dp+9PaRbS2TleWA=;
 b=tSb7nH/OSN/lWYJCkNY4/nnwGA1hO1MlIKi8N5XUmxF3vbRdraNYSEcm9IAZyy9Oht9QiSOgDMO3AN7nxIHuIbeGgHJCtvWH0NleEqdcIpQiKZE5u2ylfHpPXqu+eVB/VRiV8UC6N1S2hQXeU2Etl1oT0FiXjuv/PRMKjhx/1rA=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v10 4/4] xen/acpi: Parse PPTT to initialize CPU topology
Date: Fri, 11 Sep 2026 18:42:13 +0900
Message-ID: <20260911094213.79936-5-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911094213.79936-1-taka@valinux.co.jp>
References: <20260911094213.79936-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0152.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::14) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYYP286MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6257e6-ef7e-4de3-38c2-08df0fe9ae6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|7416014|376014|366016|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	dbDz2/ueeLPYe1FHZSp5HF02C6BdXH9A/9ywYSvzw25T6Ali1+jZXtO5JwrnUSEAJiJ5yFUglF+J8uI6bu46cZBw5jrilVUyZKUoCOm6p2yKb8mKBxqqhLtMAdexmPiAzuiK8LP+YUKQ9mpIpUWDxOdmv0ZTZQPUgDYPrqFu11CtYuYdNjUyNboC17DghdhU/IM4qqteIHH+rgY5+pqwVti+8u7vaxA0frSeScRhuKWovu7nA74N8ryHB8gmAnAML4oRJ0Ok1yioKeH1ltI/txtwYcbyrIiQs8xR6CiO259vblo9U2+RD7W5943k4EjEnASUE2+POu/rapzHiOI7MXDRzxbpLGrJfahwyqQCpGGbDlTvYAI/h9liIY41JZG8XBAAW7CFjMjA5q9sb5IpoQKKUlx6hy7khtGkPg+qJBZMkUZbyipj8iLShpO9PScgl3F37dt4CRKgjPar8u9+GRzZYi+LGxYB4pSU4t3V84lXkgmz/hkYtcjZUQWFhdfgM44Pqp/ClAwpZWK39SYfk2u0354EIg7pKtS7e8R0NF0Y+29qvPmfvClCABsJLLocYT5tkvyWQPtcFNZUKUEqdjCw342vEdU2jD+REo9q6SFueGL5piSxQglZlhSU/+SSF1K300ITsZ2L2G2B/9dvA1w76cdvG/24jK9XwY0d5n0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(7416014)(376014)(366016)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?geIxV0Xq1/nIvsGglbZ+ELnKvh2q4pvCZwGyKdolvDqFlc+MmCRh/HtA3Hcq?=
 =?us-ascii?Q?yZboz//IRaZNPOdO8k24N6R+93wRkJdZm6Vohw50j/H4hHKd5BqLvl7pw6ii?=
 =?us-ascii?Q?Q0mJxjbV3dQhiP33m+7ampoAkPh/bfB9ck21Bf17IJCIyUMiLQEbaf8VROcN?=
 =?us-ascii?Q?HG5wQsvh/B7taomJMi7N9/rlAQ6aT+3zw4rfA0+PTh9z7Nb6p0mkkVcXC/Uj?=
 =?us-ascii?Q?9HayatuAysFXPsh/FI40+SxNSxVnIpXiKoni2NqcldgMrD5Fl1T8xDBp7I+w?=
 =?us-ascii?Q?AXjP/dg3+vZQAIDx1/2u+b8poSzWRTzgRR7XioKG4chsw6lJ0JooOqDW3IR+?=
 =?us-ascii?Q?jqhH6kKtRcwLcdOuc1Xmnxmiy5peDzHXpOOAL/CKfeo2Z6jx49l1mcJJzTVM?=
 =?us-ascii?Q?3UfehZ+NZeQptexVzX0mndmFaezUzFwUlf6jtPcnt8lTW8VUarURRH3Ga8D2?=
 =?us-ascii?Q?JX0BReZh5Tcmh62J3T91w5zGxR3nho7gwnANGT4wazxKDjk791pKwBVrGolW?=
 =?us-ascii?Q?Gsz8BcPlCLrvveKuVRcR9cdiOd6IzgjmL9XGl3t4XCtws7fvCQXRB/y4+Si4?=
 =?us-ascii?Q?GPNiadqdbg+sZFrSnmjCv6J+0Mzc1fJJEEke5f2/JczBCXADCk20OrQQRlXR?=
 =?us-ascii?Q?gMsjoK6RGcJJFqHdKoJBp0k9/L1FmNfRyGbcLNolq1UPwVyfBbTmRhPLfTMR?=
 =?us-ascii?Q?pNWZu7bRwyj33hRL0FvF4u77C/gd8zL9WfFx/utdMLri6ujP+EHyptuEhVXk?=
 =?us-ascii?Q?cKyDUsIoNby8A+3dW0Z6C2VfMP6SC4dIYurL7ZB2Zjl/AcJvFOnnVp2UXNPJ?=
 =?us-ascii?Q?WNTJe1STk35uoriE2le1VulNtGunBggrhhQ0ycvRV282s8JWWsfzqgRCtDaU?=
 =?us-ascii?Q?3UNqB+S/hq9rEcCgshRXtSzY9rjLTK78REL+IPkqLrR5vzs0JamsOHaRHpWt?=
 =?us-ascii?Q?DpSmjvwcSLw6wR1qbBoOlUw9VF6gNuYwy3XzU7JrOElP8KQEm9YREUTbC6oE?=
 =?us-ascii?Q?Xrj/H5q/ANSEUc2wzYENR+H/PHc+eJO773+nuAtll0Os5kkf/wylmLJltX1S?=
 =?us-ascii?Q?qyBD2r1RX4TsOtpj/U8658g4IMLusVQofGp+7Q8IyZn3g06Np2aWyHuK5tuZ?=
 =?us-ascii?Q?YOBTkEHBjHe5joatN99q0d0wWhLOFs6YyGqIYCFIVvKVYHpSy+WHKuwVjnrd?=
 =?us-ascii?Q?wCIt9VSl67Plzydrh5pLfpiSS9Ql+bFg1XD0UpTHSzFROzNSVe8E6VDyQlzN?=
 =?us-ascii?Q?TfldQTZwC7yC9XV73j/XXrJKP2lxhocdtPpuUV3plWQTq1AsXtgDBmyNzV/I?=
 =?us-ascii?Q?Fc60ffRyvEINFQLdQJJiAXXbZfY1f2nyUmhgNNFv15qRwJA+tiuK4DDoAl65?=
 =?us-ascii?Q?/kTKVFXddWA7oKqjVnxBFdI+FbWpqn6Upzqm1Ie66gHkbBuXN3HdKsq+FQiP?=
 =?us-ascii?Q?tRtsZ+/2wbxJUvsGbdJqq28pghYhuFOEhNRe7mFl9M/qJdexgI1UUd5P9umA?=
 =?us-ascii?Q?ZQSdrmwOgddtCxlqDSYzKSVZcPUUeVyQzx90UpBtcKoBSbOop1Bq4xTbZHFf?=
 =?us-ascii?Q?27R+KcOLbfj8nybSoIA6sLKSAQ+NJUuHMWt6ri0x4AZoXVctN8vpmm1Lfa3p?=
 =?us-ascii?Q?Dvc6gpGX+8Uxo3zgcNsoCOyoew3lA5ySmQu2Eb9xm2l9qoVuZNmdXIs+FGf+?=
 =?us-ascii?Q?R8HGY30nrLMZXbZDqriwlxGaxQaRP1kWnNfvWdNsCg+Tr5EF/Tm1yQbNi4+i?=
 =?us-ascii?Q?L7raJ+2BYvTEOy+Mb39gWJjkS4mIpiu78vDD0wNCf8Yob61QFSAQnOnbT9Kj?=
X-MS-Exchange-AntiSpam-MessageData-1: 1mfckpDcXo7RIQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6257e6-ef7e-4de3-38c2-08df0fe9ae6c
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:47:23.8730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: co6cPM2ItFQQkaHYJvWQ3K7j8uW/PaLLCBmzhjad5JzKc9lkWmsWuNI93+i1SaO/sPtNw11/UjiIpobOLnzNrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5003
X-purgate-ID: tlsNG-42698a/1789120048-AB2DC9EA-737AC99A/0/0
X-purgate-type: clean
X-purgate-size: 14080

Parse the ACPI PPTT (Processor Properties Topology Table) to
initialize the CPU topology.

For ACPI 6.3 and later, the ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD flag
is checked to determine the presence of threading. For ACPI 6.2 and
earlier, CPUs are assumed not to support threading.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
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
index d6fe4ffa67..c9b545115c 100644
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


