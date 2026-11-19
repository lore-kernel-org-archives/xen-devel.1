Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93934606A335
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dTJ3Xfll
Received: from list by lists.xenproject.org with outflank-mailman.1496491.1694986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU3OC-0005cY-LZ; Thu, 19 Nov 2026 14:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496491.1694986; Thu, 19 Nov 2026 14:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU3OC-0005c7-Gm; Thu, 19 Nov 2026 14:45:28 +0000
Received: by outflank-mailman (input) for mailman id 1496491;
 Thu, 19 Nov 2026 14:45:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xU3OB-0005W8-1y
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 14:45:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU3OA-009kwI-EO
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 15:45:26 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aff0b81-2eae-0a2a0a5409dd-0a2a4509db76-18
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 15:45:26 +0100
Received: from [52.101.43.17]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6aff0b84-be1a-0a2a45090019-34652b11edae-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 15:45:25 +0100
Received: from MW4PR04CA0127.namprd04.prod.outlook.com (2603:10b6:303:84::12)
 by DM4PR12MB8522.namprd12.prod.outlook.com (2603:10b6:8:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Thu, 19 Nov
 2026 14:45:14 +0000
Received: from BY1PEPF00026958.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::3c) by MW4PR04CA0127.outlook.office365.com
 (2603:10b6:303:84::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 14:45:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026958.mail.protection.outlook.com (10.167.244.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 14:45:14 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 08:45:08 -0600
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
 b=o7KR7qKto7kWQsMVGYlKPJmfF1efvSomzrgp7Xbf7bgxJnDgBHLSg04W3YgKCt9RtpHCQPh9rnVkz5Y1eE9ddVrstxE0UjNl5ssEPxtkkWWC3l3zBWdJQuBjt3wOnROcLmCbL0s6MBltZJbSJDqXwdMxKqjzTslcCepdAf3Y7BJ3hPzdjQ/xyS8DSAZBbN0b+cPREtLMz60vbaGz7J4YvfewUXAgP5YMhiZJkWZZR1RzYRN5OW1jJS/X8uKp9qwGe9Yoxw8VNHNgSiZuDLRhQpTFu3Ll+jRYKZryxa5cPh5DLHUcO8nFZyK4JdLOOitIy7wF+CEgeart44YIbRrm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsfT5QhBsaHde56OKGmLGZxmru6vmTKcyrMVFYt00mM=;
 b=x0JbxIy1rWZnjjc1SBhOJjff9CV8OxH2UrlSurUriHa2tEgQIwQb3evhEaf7ndufl0bkip1XrsZ8xNlPYoZ7fLROLGBOyQ4w0M+cup+ZoGVJuaVGWAeLVSgCKO+b7nhstrMNfvAn4gLZUbtbr75einIRQtYkGJ+LFc560sbgLmUFqtUGNcZjSg+soF41xQ/fUd/nLDfvhEeUizuern2lylWTjHToH541ANTDgRZQRXfhcOgQzt/q1PwiDhNSPp+cH244+OkGIq9ybi8gI2QrBWiEaBb+Znmp7zHRq97H+OgNcJn2sqovp3fqOjuHqhIQXB2MOb3hzGeN1Wma2g1FVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsfT5QhBsaHde56OKGmLGZxmru6vmTKcyrMVFYt00mM=;
 b=dTJ3XfllmwAtDI2Dt56WBtmWFSXu7d/ALZD4wSUeXoMyoX+y1Fgy17ijPAjw7Kernx9teCdWMjw3ojOxeXu6+z1Y9/g3asan4VLg2IuKkZAl4DHACd0vZVVRw8jQ51Gykefw2QUWuJMrfByZhlF+Vl+Hc8MZt6/WzdfAMnhzTe4=
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
	<teddy.astie@vates.tech>
Subject: [PATCH v2 1/3] x86/amd: Consider only Fam10h affected by erratum 383
Date: Thu, 19 Nov 2026 15:44:48 +0100
Message-ID: <20261119144453.529009-2-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026958:EE_|DM4PR12MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: d17fef0b-c5ff-4435-9196-08df464bb888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|10067099003|56012099006|11063799006|261026140227099003|261022105027099003|261022075727099003|261021121427099003|261026121527099003|261021123027099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3TI4gGpg+igrqkhejoZfr073cilj0a6APf7N7nkCmUCCynP+ndAmERKiNrK6w5iUt9ERBDbW7Gp8GENQMgHKu8dTQ8krPpUPD7kAq87CcVn9drgFD0YOprTQiOy6M4H3XUZpMsNo5CNaRNXcwc/0/VgqjmeysSD+zizq+PrusES0XYES7WHwhbH3q3GJMRtbukE5alRInCypBK73hSdRVB744DaqpckbDvhRsT24gQhjI6ct0XeFFVDTj6v3sY+ThSqxk3H8vd//pcOXKO/O5NNWTznF9fl0XA33kX+ubQYK23qa3JRZtNcSt2TbGJYvPuH17Lvkf19zJmm5J+m57ft5k7x+UN1JG3sR/sQlY2EKX5opPw7r/KWLAVT+dC4BZzBUxDMV4DIpZ06kInEsRmNQh4VxEZ+7qiWa1MG2AE6pyZhG1HdJl0oWRysrBF9ka3bTKk6ptj+c2GVnny6ufyuDgtn3O+c8+JMQMUhB+yvZOgq2gzAuB+tLNHmFW7r/GtkBo8tYhAJRWLyJdR/9SgI9UgL0lEOcT1/e0+6kAJd28ZpFDOkkae/ApYhEhBgKnsHD8KPQVAAZnK5uTIClPKoSQSTElM/MoZQYpps4e6ftsYB/GdM8DsNp6luW+FAJenrr+Ity7NgdoEQJlJcX3uNM2gwD36vzBW4MYNGby67qzOTleElPSBglYW9jgm6JVgzjwxKpQDOLDy4wJmFeMg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(261022075727099003)(261021121427099003)(261026121527099003)(261021123027099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Qrt/Gao8bVEw/LYyLBcYHAoOgEE5tr2v3e1P6zcuL0HH5cR7uMevW3arFxzTCvlgzmcadiht/8SsaY9fhlA4VF+X1oDtDZQjKk8FRSJdCLDfBPLR28F3agCNaTjxmAtO/2jCCkWFHGDDFYSbTUOBko+gggocjlDr4F9QaIPVqVVgQ/JvNCAya6V7pDlzhVwHLOkNd4aqPbFUATV++Z61u31QbZ6J2ySUYRGRQEFgAgJs97YzeSJNieYk5MXIk4pnQ3teksBLilccPIMajjVB+ppZNDaFAH8AF6OwQEX2C96i/GuWvOG4qoh+tblEfPd4SdaXuX0OFtAFK8WRQGG2fSm7vtC1ySmPGNp2ndZ+/CwskSOLNFhRd62q0W7PAmskowuV77QAB97EO3NEsMB3hJPIOxqTBWnxNOiPBodpMLWY7+/SUEsx3iYCBprdCqNm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:45:14.1214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d17fef0b-c5ff-4435-9196-08df464bb888
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026958.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8522
X-purgate-ID: tlsNG-bad1c0/1795099526-FC610034-E76ED5C1/0/0
X-purgate-type: clean
X-purgate-size: 4917
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

2604adda4f81 introduced the cpu_has_amd_erratum() machinary while adding
erratum 383. The commit message claims it was based on Linux's, but in
addition to cosmetic changes it also added Fam12h as affected. It is not
acknowledged as so the relevant Fam12h revision guide, and Linux itself
never considered it. My best guess is that OSVW always returns early and
doesn't let the "legacy" mechanism ever match Fam12h (the relevant bit
is always 0, according to its Revision Guide).

Seeing how all K10 is affected, and Xen only matches OSVW for this
erratum, drop OSVW altogether while trimming the list to K10.

Fixes: 2604adda4f81 ("AMD OSVW (OS Visible Workaround) for Xen")
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
Fam12h CPUs where firmware wasn't exposing OSVW would change by not
(wrongly) applying the workaround. I'm not sure if there may be any such
machines. I'm also not sure anyone cares. I wouldn't backport this, thus
why I subsumed the Fam12h removal into the OSVW removal.
---
 xen/arch/x86/cpu/amd.c         | 21 +++------------------
 xen/arch/x86/include/asm/amd.h | 21 +++++++--------------
 2 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index ff9fc0689f..0515a314dc 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -321,7 +321,7 @@ void amd_set_cpuid_user_dis(bool enable)
  * Check for the presence of an AMD erratum. Arguments are defined in amd.h 
  * for each known erratum. Return 1 if erratum is found.
  */
-int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
+int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, ...)
 {
 	va_list ap;
 	u32 range;
@@ -330,23 +330,8 @@ int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
 	if (cpu->vendor != X86_VENDOR_AMD)
 		return 0;
 
-	if (osvw_id >= 0 && cpu_has(cpu, X86_FEATURE_OSVW)) {
-		u64 osvw_len;
-
-		rdmsrl(MSR_AMD_OSVW_ID_LENGTH, osvw_len);
-
-		if (osvw_id < osvw_len) {
-			u64 osvw_bits;
-
-			rdmsrl(MSR_AMD_OSVW_STATUS + (osvw_id >> 6),
-			       osvw_bits);
-
-			return (osvw_bits >> (osvw_id & 0x3f)) & 1;
-		}
-	}
-
-	/* OSVW unavailable or ID unknown, match family-model-stepping range */
-	va_start(ap, osvw_id);
+	/* Match family-model-stepping range */
+	va_start(ap, cpu);
 
 	ms = (cpu->model << 4) | cpu->stepping;
 	while ((range = va_arg(ap, int))) {
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index d21df0741a..762b1fbf7a 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -9,25 +9,19 @@
 
 /* AMD errata checking
  *
- * Errata are defined using the AMD_LEGACY_ERRATUM() or AMD_OSVW_ERRATUM()
- * macros. The latter is intended for newer errata that have an OSVW id
- * assigned, which it takes as first argument. Both take a variable number
- * of family-specific model-stepping ranges created by AMD_MODEL_RANGE().
+ * Errata are defined using the AMD_LEGACY_ERRATUM() macro, which takes a
+ * variable number of family-specific model-stepping ranges created by
+ * AMD_MODEL_RANGE().
  *
- * Example 1:
+ * Example:
  * #define AMD_ERRATUM_319                                              \
  *   AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x10, 0x2, 0x1, 0x4, 0x2),      \
  *                      AMD_MODEL_RANGE(0x10, 0x8, 0x0, 0x8, 0x0),      \
  *                      AMD_MODEL_RANGE(0x10, 0x9, 0x0, 0x9, 0x0))
- * Example 2:
- * #define AMD_ERRATUM_400                                              \
- *   AMD_OSVW_ERRATUM(1, AMD_MODEL_RANGE(0xf, 0x41, 0x2, 0xff, 0xf),    \
- *                       AMD_MODEL_RANGE(0x10, 0x2, 0x1, 0xff, 0xf))
  *   
  */
 
-#define AMD_LEGACY_ERRATUM(...)         -1 /* legacy */, __VA_ARGS__, 0
-#define AMD_OSVW_ERRATUM(osvw_id, ...)  osvw_id, __VA_ARGS__, 0
+#define AMD_LEGACY_ERRATUM(...)         __VA_ARGS__, 0
 #define AMD_MODEL_RANGE(f, m_start, s_start, m_end, s_end)              \
     (((f) << 24) | ((m_start) << 16) | ((s_start) << 12) | \
      ((m_end) << 4) | (s_end))
@@ -42,8 +36,7 @@
     AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0x67, 0xf))
 
 #define AMD_ERRATUM_383                                                 \
-    AMD_OSVW_ERRATUM(3, AMD_MODEL_RANGE(0x10, 0x2, 0x1, 0xff, 0xf),	\
-		        AMD_MODEL_RANGE(0x12, 0x0, 0x0, 0x1, 0x0))
+    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x10, 0x0, 0x0, 0xff, 0xf))
 
 #define AMD_ERRATUM_573							\
     AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0xff, 0xf),	\
@@ -72,7 +65,7 @@
 #define is_zen6_uarch()   boot_cpu_has(X86_FEATURE_FRED)
 
 struct cpuinfo_x86;
-int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...);
+int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, ...);
 
 extern int8_t opt_allow_unsafe;
 
-- 
2.43.0


