Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2548606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aW1fg8zU
Received: from list by lists.xenproject.org with outflank-mailman.1503612.1699251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWbnt-0003f6-CT; Thu, 26 Nov 2026 15:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503612.1699251; Thu, 26 Nov 2026 15:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWbnt-0003ey-7U; Thu, 26 Nov 2026 15:54:33 +0000
Received: by outflank-mailman (input) for mailman id 1503612;
 Thu, 26 Nov 2026 15:54:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xWbnr-0003em-Vz
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 15:54:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWbnq-00Bprj-UP
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 16:54:30 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b08561e-bab6-0a2a0a5309dd-0a2a4504931e-48
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 16:54:30 +0100
Received: from [52.101.48.37]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b085634-b57f-0a2a45040019-34653025f71a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 16:54:30 +0100
Received: from DM6PR03CA0164.namprd03.prod.outlook.com (2603:10b6:5:40::43) by
 DS4PR12MB189445.namprd12.prod.outlook.com (2603:10b6:8:53e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:54:25 +0000
Received: from CY7PEPF000000F6.namprd05.prod.outlook.com
 (2603:10b6:5:40:cafe::40) by DM6PR03CA0164.outlook.office365.com
 (2603:10b6:5:40::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:54:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000F6.mail.protection.outlook.com (10.167.247.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 15:54:25 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 09:54:23 -0600
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
 b=fvaFAFWwKiPlbsuUxmWQNjv1KAbxLzdrPqwh/7qmMnq3eYGn3l/qaR3eLTRErCJiCKPMyDDCFirnaVqmweuYSP3xmQKmxD73u50fQkjSJI66oLTEVQgERKGpCcz6qz5a6pBAJFmGihW2Rdw0ciacCy87hHS3deaue7FCJnEDdDMqbvlmBbQBZypZ88OKgbyk15fxQQEDOiNzil3uj0KMDrOKcPeu1V1QN7pSISNNLOXtgTKvxywb1ltH975dTvWj6tsOsf9ZjeMdmRQ2/Hp8Cklrq7xBdYDJoxLU+40gqYLfFtbuEZ3UqyipbLN6AavF3nSO9CWXBDCuJ2+Q8+Ohbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6D6LDeN7ha9vAg+ZV+XUDDAvk06U6X4WXIcVVQuF3Y=;
 b=Na390hvS6YAo/8v8zHB35kvadEoSMfULK9RcIOFhiCDzlWsf+h2PW/KWs9UZfs3PaV2a1IqnSokRv6pPPRuma28X4nXRtnqnD35ZACTbeLSPpmFgpZx9bTAhHWNMRLphaBFc1v74kRlR8a0rD85FOFIJL34CXOSCMKZ3iOwIatxsP+tQAM0DpymhlAISLVCXw/fxxSWYqhzU6kKdRRbpRH1sa7coNR2J923y9bV4z7wlKIg0+Y1IltwRHL+6ttUhcX8fAb74c0k9qlPD1S8ReNzGYjxibH14Yr7OcLySQq+GwY1TRpLPBKnWWVjrpHWjnKgo9TtjEqIGqKIxgj44pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6D6LDeN7ha9vAg+ZV+XUDDAvk06U6X4WXIcVVQuF3Y=;
 b=aW1fg8zUG8GlZKLcT5JEjU6byniT/4wkbCHUjc5+eJhSvD8sLXMIuk35BQfuJzfEA7srfCfO9euqAzdnU/6GSa8AqnTxN9OpspBL/S2QxmnQFS1BFQmEYTyQ45ERRMEHlrK6LpK0I3fLs9Vi5e6PICAlyRE/AUfrFkmiheJVpUs=
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
Subject: [PATCH v3 1/3] x86/amd: Fix off by one error in Fam12h range of erratum 383
Date: Thu, 26 Nov 2026 16:53:59 +0100
Message-ID: <20261126155404.3996205-2-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F6:EE_|DS4PR12MB189445:EE_
X-MS-Office365-Filtering-Correlation-Id: b8de4a9e-d962-41d9-18d4-08df4bd58be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|56012099006|10067099003|11063799006|261022075727099003|261022105027099003|261026121527099003|261021123027099003|261028144727099003|261021121427099003|261026140227099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0lUeXnFUE82X3wgsX5gqAqrPiE7wMWLO8Zs/AyS8oYinxdkVWphgENUOQx40yGZOEV3XFMnSAFU6US/WveZJpTj5pckDCEy5EkjOVlWTq7SgTu62uifKx5GEK+3N5Nt/IZb71lBSsnPNJRCOqLgA/YNa5t08qLxXc/KOdXFK8rerWsZUMLkmDE1SEmf6+qxZBUylhNABChUKSrFAzXBLVYGngkuZNsSOXm2JNupHlbUB0CSuHXMlNnjWPmhwyCQd/JRILk8zinOxQa2VP+hVfpwP4p38v7n7dRO//Hn9RGLPEeJ5M54D9n4h1Y/dL6UG8qRAfVeAOG36FAKs5BuRipj0saPKlYLG6Rz2X4U6XjPjzA+ItjDuhTj8EXgK0hnN8e1PuK3lQoKXVrgVevnsSpmAhypblhJ/d1O6KWY0N71le4bOe5yZkK2BynLL/xXZWq1J9zE/tlLbWxG3UBwOfCpOXUVvH9UGf6NPLt/0Bo5cZXL5b9nlW9Nw3UEiN3+svCt3ioav5DX8goj1fOElL9IBDJhNDZsShDbkVU5tmLzp3Kc1wCw6r5XnvFL2n9l2C5vQt3RWZ6t1y34K2G89tUjE7Ctgytrs0ThhYq2LT9dy8p9N2oNxd9sy5ARy1c20DsjKTmAQC6+mH9FIbyn+D4OwRNtOjahk0zJw2fkhFDpbsUjIDO0UIeJPCZfZGaFUecV0IgztSU25XVVvIXWNNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(56012099006)(10067099003)(11063799006)(261022075727099003)(261022105027099003)(261026121527099003)(261021123027099003)(261028144727099003)(261021121427099003)(261026140227099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iYwn9EuOcJBq/BEbLCo3CZbrOoEx/rveOSdct/x5f05T97ZiNfpkeLm0GfS/iZvQ+/RF/WuzXbRVDjDU0z/BbOYKOEMjWj12kc0RgqYbauKcr7QYvkRFdLhyYEHMsqzpjIm6iDj8i0z4zJAZsuGStiCePEfdlbDtCLmUuZOiRfwC+i0vyLSeHPQuo0mVuspuci0z6fmIgakuFCOjJFM1PA24aQLfOGA9XTSabLJCLvHtUUuP87rilTh5TrUt58jXkeUEcYGa0stdPiu+DWXqPa4e4GvXNKEIOuR6jJHF0sN0S8J3SUzTGrZBQd7f8lk/1213WOVim6i0DuoUiIJ/5M+GxgnObXZfeorar9gcfID9PEJgG3FMQVxUfi4DkAeBS3rnUmyCF45cxvQ2GndJxvt3Am4Cr26Q9xCjI3G1vlBZ59haskrTwxf8C5cob6lw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:54:25.6124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8de4a9e-d962-41d9-18d4-08df4bd58be4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB189445
X-purgate-ID: tlsNG-ebf023/1795708470-508D9B50-568CDA61/0/0
X-purgate-type: clean
X-purgate-size: 4562
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Model 1 isn't affected, but the macro says it is (end is inclusive).
Mark the limit as model0/steppingF.

While at it, note  that OSVW is purely redundant with the fallback list.
We only use it for errata 383, but that has a well known set of
processors it affects so we can rely on the exhaustive list.

Fixes: 2604adda4f81 ("AMD OSVW (OS Visible Workaround) for Xen")
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v3:
  * Kept Fam12h on errata 383, because there might be someone hoarding a
    15yo engineering sample and expecting a 2026 Xen to work well on it.
---
 xen/arch/x86/cpu/amd.c         | 21 +++------------------
 xen/arch/x86/include/asm/amd.h | 22 ++++++++--------------
 2 files changed, 11 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 8fd0b67516..c6d6913cfa 100644
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
index d21df0741a..d87a57f7a5 100644
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
@@ -42,8 +36,8 @@
     AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0x67, 0xf))
 
 #define AMD_ERRATUM_383                                                 \
-    AMD_OSVW_ERRATUM(3, AMD_MODEL_RANGE(0x10, 0x2, 0x1, 0xff, 0xf),	\
-		        AMD_MODEL_RANGE(0x12, 0x0, 0x0, 0x1, 0x0))
+    AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x10, 0x2, 0x1, 0xff, 0xf),      \
+                       AMD_MODEL_RANGE(0x12, 0x0, 0x0, 0x00, 0xf))
 
 #define AMD_ERRATUM_573							\
     AMD_LEGACY_ERRATUM(AMD_MODEL_RANGE(0x0f, 0x0, 0x0, 0xff, 0xf),	\
@@ -72,7 +66,7 @@
 #define is_zen6_uarch()   boot_cpu_has(X86_FEATURE_FRED)
 
 struct cpuinfo_x86;
-int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...);
+int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, ...);
 
 extern int8_t opt_allow_unsafe;
 
-- 
2.43.0


