Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C17606A33F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CHeB56B8
Received: from list by lists.xenproject.org with outflank-mailman.1496490.1694981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU3OC-0005Zx-Bx; Thu, 19 Nov 2026 14:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496490.1694981; Thu, 19 Nov 2026 14:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU3OC-0005Zk-6k; Thu, 19 Nov 2026 14:45:28 +0000
Received: by outflank-mailman (input) for mailman id 1496490;
 Thu, 19 Nov 2026 14:45:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xU3OA-0005UU-UJ
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 14:45:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU3OA-006FQO-AM
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 15:45:26 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aff0b7c-bab6-0a2a0a5309dd-0a2a450cd60a-44
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 15:45:25 +0100
Received: from [52.101.201.11]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aff0b84-f479-0a2a450c0019-3465c90b3792-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 15:45:25 +0100
Received: from MW4PR04CA0147.namprd04.prod.outlook.com (2603:10b6:303:84::32)
 by BL4PR12MB9481.namprd12.prod.outlook.com (2603:10b6:208:591::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 14:45:16 +0000
Received: from BY1PEPF00026958.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::5) by MW4PR04CA0147.outlook.office365.com
 (2603:10b6:303:84::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 14:45:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026958.mail.protection.outlook.com (10.167.244.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 14:45:15 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 08:45:09 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugEeFO92ljNbekcaqmr2pHK+TVFdKF1un0yRCIkG51kJn0GhK1dM6PZPxURO7h5Oe5VwreV2CLyLfvdLvdxpA4yNFl52FN+8G7B5915gQxVSDxVjXk6yRJz9stazh6CStDz94v4uOKX55qldb85TXzepnNGIQyrcBmHlBS89pYBz54C/2ZM5At+HuVKTJ2Jxhyg6Eb03P0xYEevdHvgZLY/u0w5PoC59r+QsDYzQVZq3Zc2+DH43U0FhtmG0eYbmCcDjTEXyB70JuifNteXUAr/OtNpG2JhtBlLho0/Qtdi4a1Skf+0uZEYK8NxCTBwjt+pi2/AcGMgJmV1nEz8tuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thPzFhszw77qbfHzc6yGFu8o7XzCPHwP+GovSWGl2Ls=;
 b=HVqmgsU2bHO4nTCkpsPbAmIJ9rSJfn7iu4W/TrDpkdSezqjBCRRBJVlcL9k+Ot2Q7BquIQIMAUNXJ+9WktawO4InJqESesSspVN9tPwXqs9XmX6VPEfgSKd2DalTh8FNYn9wN0gMNoMor/O8t3D8e/LQE/syLbcL+tMIswp+tivHRsgxL3PUQp4T2C9c+n6R1+VmG7HpgSfNHS48Y0vO/Uy2FToTOqHycIBWYlqOuLDzP5U8evl1lcEa/Og/OgWmYY/pfuDfTNIQObEtP+rsSfZG7RDIjB0ST0LOmX/NdowAL1sNbzcUxx97OUtDGr8M2SN+oyWGXZaZIfAOUyOEJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thPzFhszw77qbfHzc6yGFu8o7XzCPHwP+GovSWGl2Ls=;
 b=CHeB56B85YqoxcJoPhEtI/mbTOIhZiuwqNxZ9qcPq32I1d+Z7xsd6Nrexokv6PcCkpTlZYGvjvTlrijPMvBFfYnEuZI61n03sksW0dMM2SVL5b/gleCxyg/u9rdMRzLxi1TKaVowXvHAaKt0KuAKXv2Gax+SFdcBikpTbTOLiVk=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 2/3] x86/amd: Drop cpu_has_amd_erratum()
Date: Thu, 19 Nov 2026 15:44:49 +0100
Message-ID: <20261119144453.529009-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119144453.529009-1-alejandro.garciavallejo@amd.com>
References: <20261119144453.529009-1-alejandro.garciavallejo@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026958:EE_|BL4PR12MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: e88d1399-ec43-4ed6-d7f2-08df464bb99b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|261021135927099003|261021123027099003|11063799006|56012099006|261026140227099003|10067099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TWAw7Zg4qeXQ2LDGy8Aup1oxFUo7qRxr5150GF7aKVGb0cOkgXgtVrwV+RVtQype04DdlW99RPL/Ev4jCAFZTrQnugG7PyDBMkp1Bg2yfUYV+YY+IAUKVXy1TsF1iGIKaXURVdYU6PyZDf2sYo6ISKlfmwgtGB1lFTZCUSSqqGZYNJTBqzBQWGov8eiDmGywHPoltlouDlpLAIgJgHRHAxxVPcP9rZpj0OFqpxzoWetpcDkuqDgLItMqbTENPfsnbt9LE9gBJ6Sok8/2wLroxJ1n10lQqtnPoDtjLVuqUAf++328TqwGB8rRvrD2iT9mXphfQ64+N4Ht+u1HdoKufo0Apki3BI78t9IrYHsLQzMiaU1Pf97mCUYY75ArdZNkubpv0uEupn+qvVs1FJTM/7x/rbdg8bpbT+dfeQ2oDoXeI7ww3JH1uBAJRJYsh7vic2mx0ar8/NSYjkPsC3xp8JPeBa927N1GgxOz9a2ULYDiKtF377ax1Y8/0e9jN5GkfuEpDGnMfuBL2dIF1N+Fqh0koAeXhi14HkrGGU6lUvdKG6x+3d/gJl3CHmRPCjgsdRJocTF69LE33lBstOuLmVL+jD8CTlKGMkcT2wOwaHe5X0aWL+IboTid6O3bQOqECg0Q5stmyy+MI8dt5OXcSKpYV3d8XKKEAPCHyHkd51NIqsr6DEczvZqBAZD3dEP0FY03KKrKHSt3aSSzE0lT5g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(261021135927099003)(261021123027099003)(11063799006)(56012099006)(261026140227099003)(10067099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WJ+zta0drAyKpd+MlhNPYbjWomXTl4SgSol8aMLJnd3nxplUPQm8UrJlX8SlCFLAq9ODp09eE9Ac6KjXLDGsW87Ao5pGbD2IxM31t9tvg24z2PCNDw0Djm9Abx76h8IC/Dqhjfir2XbxLHqJNX38/uar5OUVIBBZCT7AyViWilA5MK0t3SqrdG6+jbMczX7RKoYnxqjpU9VyFOY0kjJC9RzsqHZz16uG0hNSr1XdY7L8yka+7efhvgO/4025UQ2X6oB3ceFuUirY8nTgeBmxNXMfLxvOSXQQ2gnTXwZv8vggYwocsK8hmZlAaHAW2c5xYFgq8oySlABARcmnU+1h2QnHOzJUEfYTZFEG05nW8vxfVQZY6Ahzc1Rnfy1SVjKqGWv9PNG6ZrI9M4BdkP5hWtGpNN2esRTDEKnMbsQpeai9PQ9Ubx1sZkAZD01Nu5fW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:45:15.9126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e88d1399-ec43-4ed6-d7f2-08df464bb99b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026958.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9481
X-purgate-ID: tlsNG-d25034/1795099525-5270FA5B-A928C57D/0/0
X-purgate-type: clean
X-purgate-size: 8986
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cpu_has_amd_erratum() takes the family-model-stepping ranges of an
erratum as variadic arguments, which MISRA C Rule 17.1 forbids, and the
ranges themselves are packed into integers by AMD_MODEL_RANGE(), which
makes them hard to read.

Replace it with one static inline predicate per erratum in asm/amd.h,
stating the vendor, family and models it covers.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/amd.c                 | 32 +--------------
 xen/arch/x86/domain.c                  |  2 +-
 xen/arch/x86/hvm/svm/asid.c            |  2 +-
 xen/arch/x86/hvm/svm/svm.c             |  2 +-
 xen/arch/x86/include/asm/amd.h         | 55 ++++++++++----------------
 xen/arch/x86/x86_emulate/fpu.c         |  7 ++--
 xen/arch/x86/x86_emulate/x86_emulate.c |  5 ---
 7 files changed, 27 insertions(+), 78 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 0515a314dc..a2386cbfa4 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -317,36 +317,6 @@ void amd_set_cpuid_user_dis(bool enable)
 	wrmsrl(MSR_K8_HWCR, val);
 }
 
-/*
- * Check for the presence of an AMD erratum. Arguments are defined in amd.h 
- * for each known erratum. Return 1 if erratum is found.
- */
-int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, ...)
-{
-	va_list ap;
-	u32 range;
-	u32 ms;
-	
-	if (cpu->vendor != X86_VENDOR_AMD)
-		return 0;
-
-	/* Match family-model-stepping range */
-	va_start(ap, cpu);
-
-	ms = (cpu->model << 4) | cpu->stepping;
-	while ((range = va_arg(ap, int))) {
-		if ((cpu->family == AMD_MODEL_RANGE_FAMILY(range)) &&
-		    (ms >= AMD_MODEL_RANGE_START(range)) &&
-		    (ms <= AMD_MODEL_RANGE_END(range))) {
-			va_end(ap);
-			return 1;
-		}
-	}
-
-	va_end(ap);
-	return 0;
-}
-
 /*
  * Disable C1-Clock ramping if enabled in PMM7.CpuLowPwrEnh on 8th-generation
  * cores only. Assume BIOS has setup all Northbridges equivalently.
@@ -1208,7 +1178,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	if (c->family == 0x10)
 		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
 
-	if (!cpu_has_amd_erratum(c, AMD_ERRATUM_121))
+	if (!cpu_has_amd_erratum_121(c))
 		opt_allow_unsafe = 1;
 	else if (opt_allow_unsafe < 0)
 		panic("Xen will not boot on this CPU for security reasons"
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 74513a79a7..031b292b08 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -833,7 +833,7 @@ int arch_domain_create(struct domain *d,
     if ( !is_hvm_domain(d) )
         d->options |= XEN_DOMCTL_CDF_oos_off;
 
-    if ( d->domain_id && cpu_has_amd_erratum(&boot_cpu_data, AMD_ERRATUM_121) )
+    if ( d->domain_id && cpu_has_amd_erratum_121(&boot_cpu_data) )
     {
         if ( !opt_allow_unsafe )
         {
diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index c8d86938d1..e070d97ef8 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -16,7 +16,7 @@ void svm_asid_init(const struct cpuinfo_x86 *c)
     unsigned int nasids = 0;
 
     /* Check for erratum #170, and leave ASIDs disabled if it's present. */
-    if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
+    if ( !cpu_has_amd_erratum_170(c) )
         nasids = cpuid_ebx(0x8000000aU);
 
     hvm_asid_init(nasids);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index bfca1eda4a..fd89b9bd36 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1439,7 +1439,7 @@ static void svm_init_erratum_383(const struct cpuinfo_x86 *c)
     uint64_t msr_content;
 
     /* check whether CPU is affected */
-    if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_383) )
+    if ( !cpu_has_amd_erratum_383(c) )
         return;
 
     /* use safe methods to be compatible with nested virtualization */
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 762b1fbf7a..3ed133fcd5 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -6,43 +6,31 @@
 #define __AMD_H__
 
 #include <asm/cpufeature.h>
+#include <asm/x86-vendors.h>
 
-/* AMD errata checking
- *
- * Errata are defined using the AMD_LEGACY_ERRATUM() macro, which takes a
- * variable number of family-specific model-stepping ranges created by
- * AMD_MODEL_RANGE().
- *
- * Example:
- * #define AMD_ERRATUM_319                                              \
- *   AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x10, 0x2, 0x1, 0x4, 0x2),      \
- *                      AMD_MODEL_RANGE(0x10, 0x8, 0x0, 0x8, 0x0),      \
- *                      AMD_MODEL_RANGE(0x10, 0x9, 0x0, 0x9, 0x0))
- *   
+/*
+ * AMD errata Xen works around, each named after its number in the Revision
+ * Guide for the families it affects.
  */
+static inline bool cpu_has_amd_erratum_121(const struct cpuinfo_x86 *c)
+{
+    return c->vendor == X86_VENDOR_AMD && c->family == 0xf && c->model <= 0x3f;
+}
 
-#define AMD_LEGACY_ERRATUM(...)         __VA_ARGS__, 0
-#define AMD_MODEL_RANGE(f, m_start, s_start, m_end, s_end)              \
-    (((f) << 24) | ((m_start) << 16) | ((s_start) << 12) | \
-     ((m_end) << 4) | (s_end))
-#define AMD_MODEL_RANGE_FAMILY(range)   (((range) >> 24) & 0xff)
-#define AMD_MODEL_RANGE_START(range)    (((range) >> 12) & 0xfff)
-#define AMD_MODEL_RANGE_END(range)      ((range) & 0xfff)
+static inline bool cpu_has_amd_erratum_170(const struct cpuinfo_x86 *c)
+{
+    return c->vendor == X86_VENDOR_AMD && c->family == 0xf && c->model <= 0x67;
+}
 
-#define AMD_ERRATUM_121                                                 \
-    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0x3f, 0xf))
+static inline bool cpu_has_amd_erratum_383(const struct cpuinfo_x86 *c)
+{
+    return c->vendor == X86_VENDOR_AMD && c->family == 0x10;
+}
 
-#define AMD_ERRATUM_170                                                 \
-    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0x67, 0xf))
-
-#define AMD_ERRATUM_383                                                 \
-    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x10, 0x0, 0x0, 0xff, 0xf))
-
-#define AMD_ERRATUM_573							\
-    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0xff, 0xf),	\
-                       AMD_MODEL_RANGE(0x10, 0x0, 0x0, 0xff, 0xf),	\
-                       AMD_MODEL_RANGE(0x11, 0x0, 0x0, 0xff, 0xf),	\
-                       AMD_MODEL_RANGE(0x12, 0x0, 0x0, 0xff, 0xf))
+static inline bool cpu_has_amd_erratum_573(const struct cpuinfo_x86 *c)
+{
+    return c->vendor == X86_VENDOR_AMD && c->family >= 0xf && c->family <= 0x12;
+}
 
 /*
  * The Zen1 and Zen2 microarchitectures are implemented by AMD (Fam17h) and
@@ -64,9 +52,6 @@
 #define is_zen5_uarch() (!boot_cpu_has(X86_FEATURE_FRED))
 #define is_zen6_uarch()   boot_cpu_has(X86_FEATURE_FRED)
 
-struct cpuinfo_x86;
-int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, ...);
-
 extern int8_t opt_allow_unsafe;
 
 void fam10h_check_enable_mmcfg(void);
diff --git a/xen/arch/x86/x86_emulate/fpu.c b/xen/arch/x86/x86_emulate/fpu.c
index 88df238981..c024f3c601 100644
--- a/xen/arch/x86/x86_emulate/fpu.c
+++ b/xen/arch/x86/x86_emulate/fpu.c
@@ -12,10 +12,9 @@
 
 #ifdef __XEN__
 # include <asm/amd.h>
-# define cpu_has_amd_erratum(nr) \
-         cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
+# define cpu_has_amd_erratum_573() cpu_has_amd_erratum_573(&current_cpu_data)
 #else
-# define cpu_has_amd_erratum(nr) 0
+# define cpu_has_amd_erratum_573() false
 #endif
 
 /* Floating point status word definitions. */
@@ -133,7 +132,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
         switch ( s->modrm )
         {
         case 0xfb: /* fsincos */
-            fail_if(cpu_has_amd_erratum(573));
+            fail_if(cpu_has_amd_erratum_573());
             /* fall through */
         case 0xc0 ... 0xc7: /* fld %stN */
         case 0xc8 ... 0xcf: /* fxch %stN */
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 09d43d204b..2027f7ee6a 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -12,7 +12,6 @@
 
 # include <xen/event.h>
 
-# include <asm/amd.h> /* cpu_has_amd_erratum() */
 # include <asm/processor.h> /* current_cpu_info */
 # include <asm/x86_emulate.h>
 # include <asm/xstate.h>
@@ -22,9 +21,6 @@
 # undef cpuid
 # undef wbinvd
 
-# define cpu_has_amd_erratum(nr) \
-         cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
-
 #else /* !__XEN__ */
 
 /* See gcc bug 100680, but here don't bother making this version dependent. */
@@ -34,7 +30,6 @@
      (typeof(x))x_;                        \
 })
 
-# define cpu_has_amd_erratum(nr) 0
 # define cpu_has_mpx false
 # define read_bndcfgu() 0
 # define xstate_set_init(what)
-- 
2.43.0


