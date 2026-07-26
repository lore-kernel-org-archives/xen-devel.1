Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA29C53200
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 00:56:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370884.1618783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnn9g-0007gM-QW; Sun, 26 Jul 2026 00:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370884.1618783; Sun, 26 Jul 2026 00:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnn9g-0007gF-Mi; Sun, 26 Jul 2026 00:55:48 +0000
Received: by outflank-mailman (input) for mailman id 1370884;
 Sun, 26 Jul 2026 00:55:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wnn9e-0007ch-UO
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 00:55:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnn9e-007Oo9-BN
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 02:55:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a65598d-e002-0a2a0a5209dd-0a2a450bc172-30
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 02:55:46 +0200
Received: from [52.101.125.142]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a655b0f-b7e8-0a2a450b0019-34657d8e44af-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 02:55:45 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB5490.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:397::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 00:55:41 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 00:55:41 +0000
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
 b=ah42GzXthYp/knocBHPsbAHIjJe94fKskPW3Ye9+crgW6fXcxAfG4XZPEG/l8OsB0X1Zkw53zW40g6V0ofQpHukZ7GBBjEyro+vDI/boOF/7OKn7SLJMxW2BUXcH6TJyFpmKzrD0GajE3Ai7y9gyYAkkw9LTgOna2aLcH3UIAMB1BXENs4paflM3xz5Nvkov2GD/FBEJI1c5uA5W76RaYAAv/5LDSeNVPev8LlJkQaBq3pI4GKm1AONLQer5N3T1dcaZI13QqWcuOVw1a8r5AeyeH9/zONGBTTLM9mAIF7wsgXz3lRKrHx9P4gpU7j/BAA/kxFTMjoy7P+WSKnlwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01BVibp9N+6FzbKMto0Oht3aSEyswKGmnDSZws9+QRs=;
 b=YF3q9VqsZYYVUqkg5rtvSUihAIlKu7ch8kp+2IncvX3EW1RfKN82wpH3GOd9oYlnMqv3TJ9j9uvNHbbqRD0ExDgceq63ZAqiUiARuecqBFbja8cMgGzWIPdxg+j1MNxyiNlSZaJj2H4CF1nyHMG+89T4NikaZNbne275jjpRF1VtDEuwcGOCnKdYQcQ9UjGGcmohZCxlF3TFRZLRrueqk2tnwdnGXIEKOAzzah04KFPNPsAIlpTL9BD3btrUxfagX6orxa54IJhfKZZfFPQ3a0gWgQtAtn3/ds9LJOMt4kF7cPIBt4qWV4O8v/IoX2qKc44AABOnBT98AKmqHyGgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01BVibp9N+6FzbKMto0Oht3aSEyswKGmnDSZws9+QRs=;
 b=fT7Ub2TOCFtzR0bdz2txEL+4x5aK7ozmmrY2u6IXRqP2pRCZl6yMunGEYA2f1dOzrRSVRMsrvPfpT/k4nSgrD+23Wy2UQTYTT1GXTI7gXtfChByK8NnoP6T/XtnqxI6fWj81xCIzYxHVKHEVm88AFE2aYH0GvJMHFcidNykQNTo=
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
Subject: [PATCH v8 4/4] xen/acpi: Parse PPTT to initialize CPU topology
Date: Sun, 26 Jul 2026 09:55:17 +0900
Message-ID: <20260726005517.379267-5-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260726005517.379267-1-taka@valinux.co.jp>
References: <20260726005517.379267-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB5490:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6cb3b6-5a7c-46e4-fc6f-08deeab09dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10070799003|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ri0YG0hUyWtNm+eSCrZl/moSFuvMrOzbUDsb7tm9zqIbOJiS/SPTV6llTuZ4flgBNheHJK50FvykPZ8Geow63W1hBJi+2F/PYKDWVXG1V2NnlFGLY8Azqwq5BmSJFekR7dwyFPBVzZSkHLUhkwXLMr3FDoTKdgktxMcZi+Ruear+Q4jNobDPSvAv/OiOB6UXeVIypdmH0/BAn5a9rmi/9hJBNT67A8ixa9PUaLOug5NxttbFxDP0768elCRF+fikQW7uMof/n3+ADXDGPSJWLmy6MaYIHNkal3ZdfGHFeCAbbMyyK+CUPnJUdpFXopkZtOzSfCxesxgkMGBG1uVvf8Zwnd4b6v+cjoIVUf3cq4erhW0UU7qGiXgFgC+Us+q3SJqmYowBiEHy1/VxRqmhlcVc2cDSlTrWJXU1WxZncrb1n21hFvSqj0f2PnsJpMs0ei+BBBVWKDCRd8B8ygdcmBvzmLHi8vFW0KhE0u+M4PRuxjKtCaOysh5oORHCHHo2gHzVgbOaGmytDao8WO/U4hr/yWoQ7Yf0WN3SVvV+j9dTuP7QLcKIbTmBcn4iKjN1j4JE68YqtcZvuJyv6UjfDv+EYhAOkNc0pO0jfNupJGM+aVsNowRkHVO4M/dWTO+6uHy0KKIUpgzZ2qHyrWfqI7+9AFV1u295kWuZ8BUK6H8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10070799003)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ja+cLe5JSr4P2HtayO+FneS9bN9mfM+SHy1siH1XK9hVGi83lyCZTMS/4bja?=
 =?us-ascii?Q?OQkLP/4++OVzo1yE/Dy5Xw2Belq9QilFrMIAXWLU1qQ3yH2ErrgXnUzQKH6/?=
 =?us-ascii?Q?afjeQU3WSiMSKcecgMJzOF4GuZ6zl3GL0uas6L/Fp8WUrg9By+4ZldNNuOqX?=
 =?us-ascii?Q?WYiS5OfzDscsStxpi1oG80g5HI4bbuW3WrVVut/4Qt1xRXT05O2xyIRHHUDL?=
 =?us-ascii?Q?HIJXHM4RXAULvQJuSQXQtcNqeklx/s3ELbXAodnWS7XWOyhTTy57ljGXMofX?=
 =?us-ascii?Q?hY/32P5kaSiYxCNUySv5EM26mcQE+XNTZv6g7TI6zCAIZYRQgyDDPi8ufs6+?=
 =?us-ascii?Q?wNpjSMpzYPMrKvhi9OiC0IqygD+BNpir735F4D5kF6ivsTRqQIek97zRcxMK?=
 =?us-ascii?Q?F+EKpegwdzaOyt6zWgPNAop97zd1WjK0N0hEjrRcxhtMZh14KwEE6VkOsa1G?=
 =?us-ascii?Q?uVQA+Xg7tcR/MrReu5G1eg2hyI48whlHmjFNObMo27j/TD9x9RYaj3RZt/kL?=
 =?us-ascii?Q?NMY1uqdnpysK8jD45K29B0luU0ljBr0oZXgramb2NMuSCdiUrFNhVSOYDlpe?=
 =?us-ascii?Q?Bv1K9BtR4z6i0Hwj+/C4P2pRJESN2QhzGsYCmSbEC2qBQufLXukK4wIQU3nW?=
 =?us-ascii?Q?9eWNtaeorpAryZbpGfKOjGbNP7RiVms1S7ql6iRpbeAAJaTw9tVtJUNk7JT6?=
 =?us-ascii?Q?F0cBEvQZm8QYxCOyPZg28JnYBX5qgIvZQnNw7JeeL0sSIAce+oJb595zS5HG?=
 =?us-ascii?Q?vADEUaHkN+yhqRSS2RvxRLdoyLQRmavw9/d/DFX6U4AE3Gz5bjmgiEICdGHp?=
 =?us-ascii?Q?T2d+ZxCdW+Tr5wTtYV6C4Q9JIHq7gxprzSeWinWD06oMcMuqIPyg2uzCWDIx?=
 =?us-ascii?Q?gQlAgogAQmIbs5EbAh5NjW2KOd5gn1YioVwlNdLOPJUPXzWXdkeXwAgweomM?=
 =?us-ascii?Q?SeqPNc84tLx4AjBQr0u9SFzerktm9IgLg5mSJTdeQW+CCVowA50y5uByFcBV?=
 =?us-ascii?Q?kOwzepxSF8P2YDUJ8hytFViMflIAi7Sg1ATqEb49VFpjA59Q1kqcnZThAg5Z?=
 =?us-ascii?Q?DH2igaAPstGMVlTYUr8oqH/vZ0vI+vAoaME95OTohls2QycgFgdZ3ZXOkhV3?=
 =?us-ascii?Q?lPWGCzOxgg6ShTflH2YA8jE5kFsfSSpfqYgt+BvdLVcGD8h++UEfgRffMibf?=
 =?us-ascii?Q?pghMr5J+YsGHy+gxvejfIxuENOvWBjnCiCV6YGfOu/9X+7WHXFYrCMjUszmG?=
 =?us-ascii?Q?lrCGYWPhCNMgbIPKH+EiqXzUeh1BVQ7+SvgOfOagm88SgH5CpR4nkvOQ4Gb7?=
 =?us-ascii?Q?ufXnMGYGDrrkRSSKebmoXCLylMeNS6HA43UOiVt1CSKg9Y6RNnIv0Us7w6wC?=
 =?us-ascii?Q?/6bv3Tfqai9K8/bHTm0rHcY2woK7pn1Ucr3fnWCRxTcaqGg5xh9ipsDF5IKQ?=
 =?us-ascii?Q?iUQA/8UEhK/afcuRQ4dCkZqFc9CaRz8jc1KM131tJMWLj+GvgndccsWlSCLg?=
 =?us-ascii?Q?aClFVPvGHBGSb4nTvaUEzW74fDWCZXbL7KIPTk2BpN5Ih9mhYuequm8i3TBi?=
 =?us-ascii?Q?+ZOl+9dYx03dXPSHOUbxuJSsDTpLDmMHzR4PCM2TDH3/Axnp2ec1a8Lpy2OZ?=
 =?us-ascii?Q?kglFeOxABel4z/RmiVwME6Yls0L6cAfsqpVjFWURZYpF/ZcOuSikeeNnAU3q?=
 =?us-ascii?Q?lv1TmP++NNk79WoYndgQnGnIrextE5i1x5EtJv6WinyOv+ozG2QGXO/XboIJ?=
 =?us-ascii?Q?e8OUBsaDaTLneH29/3zGjCD00LhiaA5CDQzkm1j18O9woKPN6gGgTE8BbLJW?=
X-MS-Exchange-AntiSpam-MessageData-1: A5G5evQY9PTdtw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6cb3b6-5a7c-46e4-fc6f-08deeab09dcb
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 00:55:41.6370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AelQKnLJ2zwI5AqncoRoEviK41Z/zok31SOxT2NIc2qmYt5J5dxxK30q7BJUS5OYnTGrlY0peKCzPTqWJmDOHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB5490
X-purgate-ID: tlsNG-42698a/1785027346-1ACDF9EA-6CA06AF7/0/0
X-purgate-type: clean
X-purgate-size: 14306

Parse the ACPI PPTT (Processor Properties Topology Table) to
initialize the CPU topology.

For ACPI 6.3 and later, the ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD flag
is checked to determine the presence of threading. For ACPI 6.2 and
earlier, CPUs are assumed not to support threading.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v8:
  * Relaxed processor node length check to allow
    proc->header.length >= table_size.
  * Treated root nodes (nodes with parent == 0) as equivalent to
    ACPI_PPTT_PHYSICAL_PACKAGE nodes.
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

 xen/arch/arm/acpi/boot.c        |   2 +
 xen/arch/x86/include/asm/acpi.h |   2 -
 xen/drivers/acpi/topology.c     | 308 ++++++++++++++++++++++++++++++--
 xen/include/xen/acpi.h          |   4 +
 4 files changed, 301 insertions(+), 15 deletions(-)

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
index 56fcfa4945..8dd397cc4d 100644
--- a/xen/drivers/acpi/topology.c
+++ b/xen/drivers/acpi/topology.c
@@ -4,33 +4,315 @@
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
+     * Ensure the structure length accurately accounts for the trailing array.
      */
+    table_size = sizeof(*proc)
+        + (unsigned long)proc->number_of_priv_resources * sizeof(uint32_t);
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
+            if ( proc->flags & ACPI_PPTT_PHYSICAL_PACKAGE || !proc->parent )
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


