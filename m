Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB02606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tumXZ0gA
Received: from list by lists.xenproject.org with outflank-mailman.1503613.1699270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWbnw-00044d-R2; Thu, 26 Nov 2026 15:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503613.1699270; Thu, 26 Nov 2026 15:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWbnw-00044W-Mt; Thu, 26 Nov 2026 15:54:36 +0000
Received: by outflank-mailman (input) for mailman id 1503613;
 Thu, 26 Nov 2026 15:54:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xWbnv-00043f-7r
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 15:54:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWbnu-008a1j-Jk
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 16:54:34 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b08562d-2eae-0a2a0a5409dd-0a2a450cc2c0-46
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 16:54:34 +0100
Received: from [52.101.85.17]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b085638-f479-0a2a450c0019-34655511b7c5-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 16:54:34 +0100
Received: from CY5PR19CA0123.namprd19.prod.outlook.com (2603:10b6:930:64::25)
 by SA1PR12MB6702.namprd12.prod.outlook.com (2603:10b6:806:252::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:54:27 +0000
Received: from CY7PEPF000000F5.namprd05.prod.outlook.com
 (2603:10b6:930:64:cafe::83) by CY5PR19CA0123.outlook.office365.com
 (2603:10b6:930:64::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:54:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F5.mail.protection.outlook.com (10.167.247.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 15:54:26 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 09:54:25 -0600
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
 b=TLrRyXAtrjzCw9Bhtwra/IwarclSdD66Ten9LTb+EX5HOes55YiaenNHoLOnOXnA3kh25WIknKt8b89zq7oFCWOCzgJyiIZACeozMx45ue+rJOUhD4M2yih24uoeeLkINVmSbu0JxXVZN+olVAjL/Pzsr64+KSkQhim+unqF2dA+Rxxo8erQr1cHWi3UXpWORAulUkk6TzmHG1JWPpNBF40TKc6ZC67YVF4Mve4ko181UMxyDWwDaZo/yepb4RG59aT5/jdPM6iSliD9h46tPIlDn2qgKuSu4EjHDPB7wk0Db+Qa6zXAQGDVyf6/DHUMkTj/3aD+oSYaP18KcR4tEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsA1rY2ybE7CXQq2TRf9UTNOGF6YyME+cRh4YL5OUsU=;
 b=dr+jtQCXcgmeJMvyi0t/Jf42tm3J6WnZCh7IeGAUgapATSNm4EaDdp5RqvyWHnIb4GeKoRzz4MVacsbanBY5PGpSM79sB9DZQMIHZFHl3pNK5y2uBdu8Gq3k1XX9Y42F8/KsEMzyj60vnPpprVif57kUUyA+o3lgAvdwCcmZrfOA3pFVoYKJOe3b+mJGJfc5kRy0Jw2UMO2ZBgj4wRCNCdp1dSqT1QNKsN+UQPsTkpMzHkG9TI2g4c74C3WD6zCeunnI16NFIELHhcpvH009++ECVQKGh02V2tfJoLDAKWADmkR8j40X2xAhV9nDQOIDDyjtL9dHOwjRJsXyoYAlzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsA1rY2ybE7CXQq2TRf9UTNOGF6YyME+cRh4YL5OUsU=;
 b=tumXZ0gAK9mAWoUAP+xFAT2wAtXU50GnflLZuTM/vrVfc7BhsEn9wrJPxPlvWotya2jvpZQMs5FJBkrcnps8O2WfyX9RUECuaqPHxfIkMv7BNCnH/cCEihkcx6s6sPDyv9mPBZOkOX+pmnEjsDYRFFt7S3afdcesQOJYNb/Q710=
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
Subject: [PATCH v3 2/3] x86/amd: Drop cpu_has_amd_erratum()
Date: Thu, 26 Nov 2026 16:54:00 +0100
Message-ID: <20261126155404.3996205-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126155404.3996205-1-alejandro.garciavallejo@amd.com>
References: <20261126155404.3996205-1-alejandro.garciavallejo@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F5:EE_|SA1PR12MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd455df-7b2b-439e-af97-08df4bd58cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|261022075727099003|261022105027099003|261102123227099003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261026121527099003|261021123027099003|261021121427099003|261021135927099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	zHB0LPI4p+hLn1rWNMQa4FbAJ9Mctj7V4qaAKUaTS49JW0Ti6tJz2fGc8d6nKQR0XiqWH0d+KkMrzTxW22dwRkyo5mIe9MmQZDN/0JnlxW8BmDvuu7PANYeNsdBM801aeNd1KnaUCcWI23+FBRULNyu7BDWroT59ecDzUpQ7ruYeHxvov2pYDyKJ+gH3xU67b+r1zOUAYjFda1+Gx5fBQbI2bHJzMv/MHjIHa+m20ZggRs9mAWqHm4jFNg2h+R9XO1iME3CaU5yg8FSN7UIUSd95aJ2srMEnQfLZwA5UB6m2QptSOoqjkLY7x1UR0RuF+Qeg9A/CxcANPZXpzfyU1SXXuzGWlyhor8AEDKGfXdCl1mjlTuUozrhk60tlmPQYk3KwrFw3d3KIM5jHcy5JpPwx+zHqCZI5xsIlRoNi+M9neltbyYFe+UUB02RNFjN4n92wmSvy2YDb14Dl8vNoL68XdNf5ClXSdbZk/S+47747/tM0CNkkmkd11A8GM8S8Du2kWVZnpSFmPV6LQpiIly4eKS7cUAhcjdjwp0CeHfFsgxGUC6NbgfR7+4KCoWlisjhh/2+tAYTC1/k9ZdF7k01kPXjpECMKSH/vQ5qRfwng2NbEh5q8Foo277W3GKIr5lw6ZXoUK5dXsHpaSLwJdJ1A3q9CiOQo+4KBN6f4o97B0o0BHafNhFvyW+K/tYQDi/fkb8yU+ub5G2bwn3fULQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(261022075727099003)(261022105027099003)(261102123227099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261021135927099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oIrdlA9Z5DxkCCnGrynfXChpFXgUr6jn6sQA0hupWsMDKM4OYHevtoRm2qEG86p2afZBMONQA/YFEGgeuUHskG4G9T9S6dh5TBsHCfBwXKMupFlCphFU6mXO0c9pRQojKlIFp07ne7fImntje1hcoWyAYqMqliiVls1zxYbs73IMqz8R2KHLJVqpqrR8f74rICeajvH+1DlQ/TWViEIevS6vwQA5K5nJODOn138KNkL8cnKsCrxmDjX0ikBb6x4MWMwXtnPX62hSYsNrkrQhQQtlid45bUUqxTbSy8wloFn/X4PUfE/RIokWPraPXui1jcQ7sEMSFC49CH/HrY9DEMvDSwBiNw7+bJj5lPA3SvPrdBnzUj9uIIX3PGyvMZB7V6lDXSZ/nnEX5p5oysm52FgxLHdEiGtJ+rihISrMUGX9cTJ7PIlrNUCIXFFVrRUu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:54:26.9319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd455df-7b2b-439e-af97-08df4bd58cad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6702
X-purgate-ID: tlsNG-d25034/1795708474-036D6A5B-93D8134A/0/0
X-purgate-type: clean
X-purgate-size: 9526
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

For errata 383 specifically, take all of Fam10h as affected.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v3:
  * Change the commit message to highlight Fam10h starts being
    universally filtered.
---
 xen/arch/x86/cpu/amd.c                 | 32 +-------------
 xen/arch/x86/domain.c                  |  2 +-
 xen/arch/x86/hvm/svm/asid.c            |  2 +-
 xen/arch/x86/hvm/svm/svm.c             |  2 +-
 xen/arch/x86/include/asm/amd.h         | 60 +++++++++++---------------
 xen/arch/x86/x86_emulate/fpu.c         |  7 ++-
 xen/arch/x86/x86_emulate/x86_emulate.c |  5 ---
 7 files changed, 32 insertions(+), 78 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index c6d6913cfa..4944437e65 100644
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
index 2407c575d9..a8bd6b6364 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -845,7 +845,7 @@ int arch_domain_create(struct domain *d,
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
index ef42d5eb98..f89f5e8dc9 100644
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
index d87a57f7a5..6c24d2494e 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -6,44 +6,37 @@
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
 
-#define AMD_LEGACY_ERRATUM(...)         __VA_ARGS__, 0
-#define AMD_MODEL_RANGE(f, m_start, s_start, m_end, s_end)              \
-    (((f) << 24) | ((m_start) << 16) | ((s_start) << 12) | \
-     ((m_end) << 4) | (s_end))
-#define AMD_MODEL_RANGE_FAMILY(range)   (((range) >> 24) & 0xff)
-#define AMD_MODEL_RANGE_START(range)    (((range) >> 12) & 0xfff)
-#define AMD_MODEL_RANGE_END(range)      ((range) & 0xfff)
+/* Sequential execution across the non-canonical boundary causes hang. */
+static inline bool cpu_has_amd_erratum_121(const struct cpuinfo_x86 *c)
+{
+    return c->vendor == X86_VENDOR_AMD && c->family == 0xf && c->model <= 0x3f;
+}
 
-#define AMD_ERRATUM_121                                                 \
-    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0x3f, 0xf))
+/* Incorrect code bytes fetched after a world switch. */
+static inline bool cpu_has_amd_erratum_170(const struct cpuinfo_x86 *c)
+{
+    return c->vendor == X86_VENDOR_AMD && c->family == 0xf && c->model <= 0x67;
+}
 
-#define AMD_ERRATUM_170                                                 \
-    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0x67, 0xf))
+/* L1 TLB multi-hit causes #MC. */
+static inline bool cpu_has_amd_erratum_383(const struct cpuinfo_x86 *c)
+{
+    return c->vendor == X86_VENDOR_AMD &&
+           (c->family == 0x10 || (c->family == 0x12 && c->model == 0));
+}
 
-#define AMD_ERRATUM_383                                                 \
-    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x10, 0x2, 0x1, 0xff, 0xf),      \
-                       AMD_MODEL_RANGE(0x12, 0x0, 0x0, 0x00, 0xf))
-
-#define AMD_ERRATUM_573							\
-    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0xff, 0xf),	\
-                       AMD_MODEL_RANGE(0x10, 0x0, 0x0, 0xff, 0xf),	\
-                       AMD_MODEL_RANGE(0x11, 0x0, 0x0, 0xff, 0xf),	\
-                       AMD_MODEL_RANGE(0x12, 0x0, 0x0, 0xff, 0xf))
+/* FSINCOS instruction may corrupt %rip. */
+static inline bool cpu_has_amd_erratum_573(const struct cpuinfo_x86 *c)
+{
+    return c->vendor == X86_VENDOR_AMD && c->family >= 0xf && c->family <= 0x12;
+}
 
 /*
  * The Zen1 and Zen2 microarchitectures are implemented by AMD (Fam17h) and
@@ -65,9 +58,6 @@
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
index 5cd97eca8a..d893ecb296 100644
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


