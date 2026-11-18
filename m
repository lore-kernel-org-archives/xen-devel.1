Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3B2606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 17:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aRZbq+Za
Received: from list by lists.xenproject.org with outflank-mailman.1494909.1694145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjId-0001UO-0n; Wed, 18 Nov 2026 17:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494909.1694145; Wed, 18 Nov 2026 17:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjIc-0001UH-Th; Wed, 18 Nov 2026 17:18:22 +0000
Received: by outflank-mailman (input) for mailman id 1494909;
 Wed, 18 Nov 2026 17:18:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xTjIb-0001U7-Tf
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 17:18:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTjIb-00GaiP-9a
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 18:18:21 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afdddbd-e002-0a2a0a5209dd-0a2a4506deb4-30
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:18:20 +0100
Received: from [52.101.52.24]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afddddb-195a-0a2a45060019-346534185815-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:18:20 +0100
Received: from SJ0PR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:33f::13)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 17:18:13 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::af) by SJ0PR05CA0038.outlook.office365.com
 (2603:10b6:a03:33f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Wed, 18
 Nov 2026 17:18:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 17:18:13 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 11:18:11 -0600
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
 b=qvpXx1yH1NqBPapbp8nRkhcviBSgyJ0awadaWBW2uUoDnMzByZZakQIWd6nWvxQl/LZnv1g9PTI5krvFVEL4X3Tz2xiUEbF5/Q4Rxv/ItDX6/rMm1Dg3fBGijViBL1xESgOmlJE7qClk4JIHsJlDHqmVC8sG/vCNf2TyRPWHkQlY6Jc5IfLkaSWeljag6oBQaJBAorwi0md35QjHC+UOrwwGs/IhydpVnqz2jNTP7zgmN9DCdGwZcC7M8hv5dp+qRa2jKnMakQOy6Bk/Xpp7MQwqlga95hucH6xgt77jgqvypzofjo/VLIRZMXw8gXoycslor9PrFoBpkdtiSlOeGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8K1UhyhD8d/PYrkJMQnHID8bEtC613aGqT+nT6QczM=;
 b=NiJZv9iKgNUdMTIjZFAqb7nVIbWjv3LJ8VMTzkvXBbKy1C+T9VkcGkTz2/EYrgpY538oxeiyTpMX4oUeE2DRquSJ0VqhrL21q/z9fN94tYjlAg76WHh0skiHPLewMdWEsGhEx48x1kyZIV3HARlKSD8V1lUPs6z3Ef55TIdr/eY9FUCdesyKXh3v6xYxjInJwLRDpdwuXKwCVVHOFuD6KZOdIci1vpP4xgbnA4KsgU7aeXGXUmlg/F1ZBFL7ZzbZ2lcZ+DVJt+TyM3UyWZU8FSIFQXBzMciNO9LSP8V4gBhqiRKSGWharGdt/l7Za16WJ3cBe2TiR0vDu/qEDW2HVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8K1UhyhD8d/PYrkJMQnHID8bEtC613aGqT+nT6QczM=;
 b=aRZbq+ZaCHlxuVxS8LWD90jOgP/+X7fqvL6RyTC9e1tA8AjXCbFukRvU9znKjM3FIl90t1jIy7Ip6vT8W0SioFvjK5GvIwnGh1AOMAjpH3jmMj+tMpfuquZVHx7of13rPvPKc3hdPJQ18+BScWQDAMYRxmvnYAjsGwFLgyRm/s0=
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
Subject: [PATCH 2/5] x86/mtrr: Address MISRA C Rules 5.3, 8.3 and 8.4
Date: Wed, 18 Nov 2026 18:17:53 +0100
Message-ID: <20261118171758.1125066-3-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|MW4PR12MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: acba46c8-1ea0-40a2-84b8-08df4597ed4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|22082099003|18002099003|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|11063799006|5023799004|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	hltHvNbazkW4JSXcwILIcXJJVAxsH8AMRfH4pTcoNi/PA7v/geF9skA9FHTpqvqwbRLYSbZNMVIKuIL4DgQdWKwM0tRoTBgvXXheVgHsz4jkPKS236kQyYAnKN0KFVAw4UDGts38r0ihzIlCt4pqVCDasiqdTUcZcZrNURrKGbhKQuWIsyMaPSZ0tnJs9KmATNr1pJxlHbfRfaiH+el1g937VWsHY7fatMi85XvAHpPETqeyZod0kvmZ0D5ZI5GyQxWBkT80J3vPxORbr1e1i6b/iq3piG3J5DtVB4xMqeGIJb+JwnCbgx8MRfi1Ppiu3pebRu2Oy6SCo45C5KWv1nWDB0wYPmXZNz83xfv7Z7qQyGVnVLaE+KVumpIyRQ4/i59+yKOxv3qW4jd6P7P08YpTJHqGTZ5zvCs1OQuvWs/j2Wzt4yN+Bn9u/BN7Wlf7AYz6ka6+xFtDG6GR/UifIv2AhpGRjb6bBQUh4SeeNAYi9tYp/rB5Aqldg4Jf5rwdkABeaD+uLfh/lN016ATkI8mCpAB5hltfpoAE2LA9NedNCmLKO9KcMPW1mEV+QaR4u556ZilATILyJ3gXUi13x215lJXG+zumXxYjIB1hYRfjdB+/IZlBVRzodqyASBEX+sRaqJHsdO1srnPFaLpQs9LK4DBZp77laJgoaHqllJ3jB2zs2yGSXMDVJoU9vIOiTezHsXEqrzV6Ppw5HyXmMw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(11063799006)(5023799004)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U/W1Vj/U5GtVtNe3l8HfbtLgdiIwMywTA+kHlHDHx+IbcmyyQ/AyX+5rYby8gp/i/SjTuQMpE95xxDtQJPjef7GXgLimEcgA0ON7ovOkUlG/EjQI+NnRvnGRhsqhhHFgsHSjDMr1gO7Y0cmngFVpbmNOgjKDHkfPOYOvuO9UcsBeLIPB1NgK5g8lHLHJV8/CxNXuEt/qjLf8lT2IDVF0ztbrS2nD8XWbV+iCpLotyQl1sWVFW56FdQiqRHQgWbAd/tDjRKi9/R1WiSNJUzZD+3Zk1WdQeNwRRHFikOHlahz2C2p8LVldu38gBQJ0H748tSAp1EtTNL06oTmsAP/NKZAAeUEHO2//aqvy67C2iKg6vbwdUXvwm4kf7aIirX/s2iIi4aHgwFI9Ae/WoxEPW24kS2E4D1EQO0sA1QIl7OHBu7Lw8FOofHEj2zJqpWvG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 17:18:13.2151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acba46c8-1ea0-40a2-84b8-08df4597ed4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777
X-purgate-ID: tlsNG-16d1c6/1795022300-FCE0677B-B3C56BAD/0/0
X-purgate-type: clean
X-purgate-size: 2186
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Define num_var_ranges with the type it is declared with in mtrr.h
(Rule 8.3), make usage_table static as nothing outside main.c uses it
(Rule 8.4), and rename the local variable in is_var_mtrr_overlapped()
that hides the global num_var_ranges (Rule 5.3).

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/mtrr/generic.c | 6 +++---
 xen/arch/x86/cpu/mtrr/main.c    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 4cc7c8bd5d..5df3cf491c 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -57,9 +57,9 @@ get_fixed_ranges(mtrr_type * frs)
 bool is_var_mtrr_overlapped(const struct mtrr_state *m)
 {
     unsigned int seg, i;
-    unsigned int num_var_ranges = MASK_EXTR(m->mtrr_cap, MTRRcap_VCNT);
+    unsigned int nr_ranges = MASK_EXTR(m->mtrr_cap, MTRRcap_VCNT);
 
-    for ( i = 0; i < num_var_ranges; i++ )
+    for ( i = 0; i < nr_ranges; i++ )
     {
         uint64_t base1 = m->var_ranges[i].base >> PAGE_SHIFT;
         uint64_t mask1 = m->var_ranges[i].mask >> PAGE_SHIFT;
@@ -67,7 +67,7 @@ bool is_var_mtrr_overlapped(const struct mtrr_state *m)
         if ( !(m->var_ranges[i].mask & MTRR_PHYSMASK_VALID) )
             continue;
 
-        for ( seg = i + 1; seg < num_var_ranges; seg++ )
+        for ( seg = i + 1; seg < nr_ranges; seg++ )
         {
             uint64_t base2 = m->var_ranges[seg].base >> PAGE_SHIFT;
             uint64_t mask2 = m->var_ranges[seg].mask >> PAGE_SHIFT;
diff --git a/xen/arch/x86/cpu/mtrr/main.c b/xen/arch/x86/cpu/mtrr/main.c
index eff0500f0d..e49ac1b508 100644
--- a/xen/arch/x86/cpu/mtrr/main.c
+++ b/xen/arch/x86/cpu/mtrr/main.c
@@ -50,9 +50,9 @@
 #define	get_cpu()	smp_processor_id()
 #define put_cpu()	do {} while(0)
 
-u32 __read_mostly num_var_ranges = 0;
+unsigned int __read_mostly num_var_ranges = 0;
 
-unsigned int *__read_mostly usage_table;
+static unsigned int *__read_mostly usage_table;
 static DEFINE_MUTEX(mtrr_mutex);
 
 u64 __read_mostly size_or_mask;
-- 
2.43.0


