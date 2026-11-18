Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12531606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 17:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=usGD2VKH
Received: from list by lists.xenproject.org with outflank-mailman.1494914.1694172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjIs-0002IE-Ro; Wed, 18 Nov 2026 17:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494914.1694172; Wed, 18 Nov 2026 17:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjIs-0002Hz-Nn; Wed, 18 Nov 2026 17:18:38 +0000
Received: by outflank-mailman (input) for mailman id 1494914;
 Wed, 18 Nov 2026 17:18:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xTjIr-0002GA-HT
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 17:18:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTjIq-005Owu-Tw
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 18:18:36 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afddde5-2eae-0a2a0a5409dd-0a2a4506e8e6-12
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:18:36 +0100
Received: from [52.101.193.8]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afddde7-195a-0a2a45060019-3465c1086442-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:18:36 +0100
Received: from SJ0PR05CA0031.namprd05.prod.outlook.com (2603:10b6:a03:33f::6)
 by IA1PR12MB8496.namprd12.prod.outlook.com (2603:10b6:208:446::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 17:18:17 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::7d) by SJ0PR05CA0031.outlook.office365.com
 (2603:10b6:a03:33f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.6 via Frontend Transport; Wed, 18
 Nov 2026 17:18:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 17:18:16 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 11:18:13 -0600
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
 b=piDb3EzM/+cuQtWL71JD2lfUhBia+Lsv+Q4h2/R7FMl4tpkzCNxeXcHJOTAycFDrwVsBFXg4azj7O6WkYPzEZ4UQyBbZ2rVllnTS475rNBbr4wQvTf/bIQQmJIVdpu+HjDgX2gtNKxU55xOGOBurCpDI2kUFagQBmPkgMDm0SdiznPT5XsNcoD4arVKFRlWFgV0UU7q0T2dz7V+ve4KZ9dyLxFvscAFtAVW0Opso8JbZ3CNZZ//9wDsTgr9klmWx7PWCCokZs0XADW1GJmim7D5rGkSYqLGy5IoD+5TQ0kLMrO/tk0BXvIcJvzRjnoSJhJoXrsXL6PivYYLkDBQgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=570usdvgqjyaV/aPVz22RPaLFmZG1ifiis106qZuf04=;
 b=YKGsElacN8Br71F/iJzciN1aq6hRZkuYToM5VUSXcH9ZzmMeTZgEKz5EZ1WmlZtHHbrUXqQ8Cvi1JUFYkeMVyWLn4ZyFFd1cVGXAUTJq/aGzsF0XzbOO/XuzrPRNZ5oJsJ38bxOaPbDd9IqQw6vqtfzAmH7jIFnk6aSfd83JAn8FI4XQDacH9WgiaMMmGUrDsdmGeL/2ro5i2rs83mopLWAYJLJQnTCCWKeOgtekw0mXhAioeZjmlirXMtFYcq0ni3G2kA06HTYvdeLYhrNj+6gQ9J7flr5c1OD3pfMSPCBJWo35SKAHqahRBDjuNwj/3Fp4nPvE6aslrgVfAiCDpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=570usdvgqjyaV/aPVz22RPaLFmZG1ifiis106qZuf04=;
 b=usGD2VKHwpKZbs1FJ9NcOUu7Do1sRjLt60ELKl1XWjSwcfzyOHz7SC0lvsqw/MMhJsMVjhP3GTRZ3Y68RW86AdxjOTIsPivGjc5wsRtl9EDUhoPA8zPzy971O6+mNj6SkxYikDBquASzIPaLlqsZS6mNE+KZjS2fAyv1OCmAuFw=
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
Subject: [PATCH 4/5] x86/amd: Make cpu_has_amd_erratum() non-variadic
Date: Wed, 18 Nov 2026 18:17:55 +0100
Message-ID: <20261118171758.1125066-5-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
References: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|IA1PR12MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: ef21fbb3-9797-46eb-962f-08df4597ef26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|22082099003|6133799003|261009223027099003|11063799006|261026121527099003|56012099006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Zdvk0uOWBMfRySGxhhjQiOjxSiHQP95TczibyNFLpecQ9AZbg5j5gsuMhXxTGkePVrQ4b9Zv1+anSpOOw6dPtuTtIhCtpmSY5Exw82AtGDERs0t165pQIkyLE6SSmmE1jgwoEXl5jtF/pFEVj4BWANMfd3QHqSQ6wOIFVjNJghEYMyMHl12XjwhqatvTeWuDxbzgRvMVmScGuGRK3TZlBsSB1zT31ITO5D3RpB/X6s8dfwUvs4saY5vQqIX+1QVC5aw50jjteG+oOkWFHw5EL/hTrwTTW4/vKu3yuBenS75DQMkvq50z3hhD3y8se0bQu7Zjz6eqYf8nzJfaxnzN2VMSCYrRin4zOJttNsUtAK14AypSO3AqA4Fxime68htSkW8lcrVX1zfWZqgPNeVH2EZKk9xbK1vM1/psljRQk25MqljOYjc8KoG8JVeStft5IDd9bz0VqNETIo8GKxhwSn8STPxpsFH3lb4UmMRHs44naSjpX61kIDRPDvaJCIPGrnwTF5UbKEcH2jfPG1PuUr3xpbcqbqVYu7vyR9d9ZGyl3Yi0hLQVnAqacE1ZyTh3X0jHgO/wQuujuBe0qQXwoUnZU5cPq1LwjsHHFenQ85wCS85IWDp1I4TVtigI/F/TWb4BeAhZU0oD7Cg1Xuo7Akp7nPvni++r4CoI7/sF1YVGwKMNUW2yPQhN2aAJpkdvOX5rJ1YSxMeokJdaGteheg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(261026121527099003)(56012099006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vj3q5SF7uET5j6VXwP+vu8+twrqPrqX9Mawjufxz6ZfbeU43Reo43vp2y2z/qfR+QcP2/Szm5HQC/d744CbagryclLy+fQfyfZD9XugCSwC3p3I3sBbiaGXh6I7hrMEQZDP/wlXPMoDqiGAR8oK7+C80DuKRCCzk7HzvKeYuZC94WvrNKQq43gj9THNLV7k57oAXHBUzgUAK7AHBkZ1B9pRnoqxFD2lxBYtYTUAtnGBcP2kJX1lnFQPv38usJZxMOAW4tBkK+4qiakGCy7g7rFwTLaTxmusjohbHOhgDpyfq/neC+AahJrlUzPLOr2KVXUlw9OqXV2HkFdxEZZtMJbs2NIrKF9Py/KYZxxkjt0AdSLhtvz8IJ0dm7lkTnj7gR96z+i5cO144kvo+bvfBsV0j4ceQE7q6uDtoBTmSYkH6qkqhMCnygofHVZVk7FOR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 17:18:16.3452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef21fbb3-9797-46eb-962f-08df4597ef26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8496
X-purgate-ID: tlsNG-16d1c6/1795022316-FD00977B-A723FEFF/0/0
X-purgate-type: clean
X-purgate-size: 3447
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cpu_has_amd_erratum() takes the OSVW id and the family-model-stepping
ranges of an erratum as variadic arguments, which MISRA C Rule 17.1
forbids.

Have AMD_LEGACY_ERRATUM() and AMD_OSVW_ERRATUM() expand to a
zero-terminated array instead, and have cpu_has_amd_erratum() walk it.
Callers pass the AMD_ERRATUM_* macros, so they are unaffected.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/amd.c         | 14 ++++++--------
 xen/arch/x86/include/asm/amd.h | 11 +++++++----
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index fbbba0005c..5e22fff81c 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -321,10 +321,10 @@ void amd_set_cpuid_user_dis(bool enable)
  * Check for the presence of an AMD erratum. Arguments are defined in amd.h 
  * for each known erratum. Return 1 if erratum is found.
  */
-int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
+int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, const int *erratum)
 {
-	va_list ap;
-	u32 range;
+	int osvw_id = erratum[0];
+	const int *p;
 	u32 ms;
 	
 	if (cpu->vendor != X86_VENDOR_AMD)
@@ -346,19 +346,17 @@ int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
 	}
 
 	/* OSVW unavailable or ID unknown, match family-model-stepping range */
-	va_start(ap, osvw_id);
-
 	ms = (cpu->model << 4) | cpu->stepping;
-	while ((range = va_arg(ap, int))) {
+	for (p = &erratum[1]; *p; p++) {
+		u32 range = *p;
+
 		if ((cpu->family == AMD_MODEL_RANGE_FAMILY(range)) &&
 		    (ms >= AMD_MODEL_RANGE_START(range)) &&
 		    (ms <= AMD_MODEL_RANGE_END(range))) {
-			va_end(ap);
 			return 1;
 		}
 	}
 
-	va_end(ap);
 	return 0;
 }
 
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index d21df0741a..d897943210 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -12,7 +12,8 @@
  * Errata are defined using the AMD_LEGACY_ERRATUM() or AMD_OSVW_ERRATUM()
  * macros. The latter is intended for newer errata that have an OSVW id
  * assigned, which it takes as first argument. Both take a variable number
- * of family-specific model-stepping ranges created by AMD_MODEL_RANGE().
+ * of family-specific model-stepping ranges created by AMD_MODEL_RANGE(),
+ * and yield a zero-terminated array to pass to cpu_has_amd_erratum().
  *
  * Example 1:
  * #define AMD_ERRATUM_319                                              \
@@ -26,8 +27,10 @@
  *   
  */
 
-#define AMD_LEGACY_ERRATUM(...)         -1 /* legacy */, __VA_ARGS__, 0
-#define AMD_OSVW_ERRATUM(osvw_id, ...)  osvw_id, __VA_ARGS__, 0
+#define AMD_LEGACY_ERRATUM(...) \
+    ((const int[]){ -1 /* legacy */, __VA_ARGS__, 0 })
+#define AMD_OSVW_ERRATUM(osvw_id, ...) \
+    ((const int[]){ osvw_id, __VA_ARGS__, 0 })
 #define AMD_MODEL_RANGE(f, m_start, s_start, m_end, s_end)              \
     (((f) << 24) | ((m_start) << 16) | ((s_start) << 12) | \
      ((m_end) << 4) | (s_end))
@@ -72,7 +75,7 @@
 #define is_zen6_uarch()   boot_cpu_has(X86_FEATURE_FRED)
 
 struct cpuinfo_x86;
-int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...);
+int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, const int *erratum);
 
 extern int8_t opt_allow_unsafe;
 
-- 
2.43.0


