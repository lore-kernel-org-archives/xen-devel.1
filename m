Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CC6606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xb4P/0/N
Received: from list by lists.xenproject.org with outflank-mailman.1502116.1698107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB5f-0000CT-J8; Wed, 25 Nov 2026 11:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502116.1698107; Wed, 25 Nov 2026 11:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB5f-0000CM-Fs; Wed, 25 Nov 2026 11:23:07 +0000
Received: by outflank-mailman (input) for mailman id 1502116;
 Wed, 25 Nov 2026 11:23:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWB5e-0000CG-Nq
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:23:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWB5d-003pcy-MX
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:23:05 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6b06c510-8faa-0a2a0a5109dd-0a2a45088dec-42
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:23:05 +0100
Received: from [52.101.201.40]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6b06c517-f659-0a2a45080019-3465c928268a-4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:23:04 +0100
Received: from CH2PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:59::36)
 by PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 11:22:59 +0000
Received: from CH2PEPF000166C4.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::54) by CH2PR03CA0026.outlook.office365.com
 (2603:10b6:610:59::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:22:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000166C4.mail.protection.outlook.com (10.167.244.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 11:22:59 +0000
Received: from zjiaqing-u2604 (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 05:22:57 -0600
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
 b=ADL+Y4v3Eb5evBG8ZNuFTDscHjPgIG1NAR9rmEB4DsT68hZ4V4NPn3w/N5C9JN2Osl6ah45hfr4n25M68NaVl5VhCBCxXqjEn//Xm7+SqEzOiyTm/9EZZufHiv8l/t+7xVpuQ22wJpNwtf7AdYZcbrL1363N6PdHIMn27Al6Nr3FIzretwZQQoZhpGHPfcbOIkRpgdDZT2tHh1a97fXOfpc3BJj9OIl2VBAFbvAt0K/sRkoqzY5XMp9tdluWoMP1DbR+SDH7FDzr5NVlxeBA2iY6oBFtTfxbuZkVdr+INI/zsZ++s494HRum6CB1rmQWMGMgd7jGNqKtu1Ea29OsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=el9PPCLrYtUeZTLF/RYkA/k6bJtLGzghYnWNQGSVbiU=;
 b=JBg/cJ0Kd7pPDQQbUlO8nZjinxjkAnzkpqKsTTRingVLkwLkxuL5lr4nAGmJLoWdg4YvWRJzQMA9dH327ZKEe8sT0mqRdc3S4SvL17ydE7wJjvLFSYWpCwlqltC+iBj2BgrSQuBafiNAP51JQhOALybKEJOIdCJvQjet8hpo4IrWtgbvoFz/envI0lPv6s6sBljGO4xUL6fVx/FSigtZSqhDikbomMW16En7yvCH/mCe5/vaHIlPEvjQpibKTy1bcwzuhpwEum324HtdHWzuWBUxhTEUPcQfDEiQlguDubLs1WHv0yvtsSnO3AdQc6MhJOh3ifcoD3njBYbge5iuuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=el9PPCLrYtUeZTLF/RYkA/k6bJtLGzghYnWNQGSVbiU=;
 b=xb4P/0/NqQWcc2raIBu7NlcNn2snfIZgk3gvhLimPaDIXUjO8ylwtXANQ7/u/GfaHQ6OvI9rVrerx3/IMsqa2Kxb+BbkLj7VpCv07Lx0bHrIHXr+9hNiixqguyMUVbP8cpYF0mYqsxZJUWaCkNdNGgov9ENdF2EFvGUgLr9X6qQ=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jiaqing Zhao <Zhao.Jiaqing@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH] x86/p2m: acquire temporary reference when removing foreign mappings
Date: Wed, 25 Nov 2026 19:22:32 +0800
Message-ID: <20261125112233.14046-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C4:EE_|PH7PR12MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e287b87-a09e-4f41-5fa0-08df4ae6760d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|261026121527099003|261021123027099003|10067099003|261022105027099003|261021121427099003|261102123227099003|261026140227099003|261028144727099003|261009223027099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	qOtu4GgKizTUJK0TBwgqa64o4KgOaM3Tnqk5X41ht74lpx5HGVjqbcDxBJp3tmVvtRghSgqUw90S0j/cOXBKljm6dIwywBIFvRaXNABxw5EpFaqaeCDCxfxR65+gs17w5QnV8M62677mavHi+tdHlmHPFUei+wNjOwrCJ6cA+U2SDV+w3Vu6f13bV6K5IRWccLzCygjIhNv3dvX+d38+um09DRM2VXVvGSUQk/5V+31hT0e1VQ9ALEQ1gIiRNqIcRL18BYyBSgFEc7TOcQMhhWVADxRrtSAhDM5iMS0Sj4RoEuMR0e5EQtlJdYV0fBC0PiL4SC92Mj7mE6yX1gYh9zRRaGu4c09dpeBQhtEA+NwLAxaK1TPMkrzrq2qzmCZIFbBQ6GKIUPwFSOBXUXrB6/ruZVhet0fu/Rn3HXU49sxH6lIfIIKGzbq1ktMl+JC0m0aGnCUrejR2xmmTWmH7DPomNU8WFCLCCaOTfkBlPA8yImvt3Ftbzg+xzWyX3Q5cdP45dOfXNrZj47mT7dqOFN7swc43vXN5Y1JQUtEQXyHsRTXd5+AYMD1p0jwDt/+9uv2q2jtwSvT+B/R0a8w9AAoLBtX/H7OAeJhFKkHYQzAsor67uDC5tzT5dYhOIX7hEP3BPVZTmwoljYHWW+PTYcZIQi/mAieLzAFHyXySiMsnUif9A7ELGObRwJnuYpuHk6cOTFC7XTkfZcF4zdSN6A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(261026121527099003)(261021123027099003)(10067099003)(261022105027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261028144727099003)(261009223027099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zolx7TGh5XvEuj+TeZiZXL/XwoNyEdbfwUUSJ/W7opUfUPLPREUCNTgo99DF83Ef90sOoFibd5tTd6j33Dzuk3KWJhGoaLfcucNlntRR8K8qF+9XaiTXAilDrCnJHeR2LaooPXzUdRcchD+JGc5e99XzO3N/5qYzqwAvi/Kyb3k3MvH9A7cxGBnVm9kvbUrjloCh4q4ztqSVefj3POnmWyfFOKy9eyEgMZSIG+e0RpdY/6cFr1qLMn671bboGKomkgw6TIDuFDFen8Swf+oqFh78dImWdk2w9elRZzyUn9w6QgYkEutNv9i35EUEk3rSh3ElJ2/XMjFdtsk0gGh8XcKvU4FL3l3OA9IjhCPEuFlrE40GuoB6udzbGdcSF2vxRAR+dEf8/SPelJXqcEPMAugEYuBKPaUKMK3IsYarWPyR/QuYVHo/vdZrbwZYS6DO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:22:59.2851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e287b87-a09e-4f41-5fa0-08df4ae6760d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8056
X-purgate-ID: tlsNG-c1860d/1795605785-D5B4987B-BCCC230B/10/78276251493
X-purgate-type: spam
X-purgate-size: 3857
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As p2m_entry_modify() drops the mapping's reference before the P2M
entry is cleared, since ac607edc2e26 ("x86/p2m: clarify foreign map
handling in p2m_entry_modify()"), p2m_entry_modify() requires the
caller to hold its own reference when removing a foreign entry.
However, in relinquish_p2m_mapping() and the special page handling
paths, foreign pages are unmapped without taking a reference of their
own, causing the unmap to fail with -EILSEQ.

Acquire a temporary reference in p2m_remove_entry() for foreign pages
when unmapping, force IOTLB flushing, and drop it after the P2M TLB
flush. Use p2m_remove_page() in relinquish_p2m_mapping() so it takes
the fix.

Fixes: ac607edc2e26 ("x86/p2m: clarify foreign map handling in p2m_entry_modify()")
Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger@xenproject.org>
Cc: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/mm/p2m.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index bb0356396c..cf56826a17 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -542,6 +542,8 @@ p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
     p2m_type_t t;
     p2m_access_t a;
     int rc;
+    struct page_info *fpage = NULL;
+    bool dont_flush = false;
 
     ASSERT(gfn_locked_by_me(p2m, gfn));
     P2M_DEBUG("removing gfn=%#lx mfn=%#lx\n", gfn_x(gfn), mfn_x(mfn));
@@ -561,6 +563,25 @@ p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
              ((gfn_x(gfn) + i) & ((1UL << cur_order) - 1));
     }
 
+    /*
+     * p2m_entry_modify() puts the mapping's reference before the entry is
+     * cleared, and an outer p2m_lock() holder may defer the TLB flush. Hold
+     * a temporary reference, and force IOTLB flushing, until both are done.
+     */
+    if ( p2m_is_foreign(t) && page_order == PAGE_ORDER_4K )
+    {
+        fpage = get_page_from_mfn_and_type(p2m->domain, mfn, t);
+        if ( !fpage )
+        {
+            P2M_ERROR("%pd: cannot reference foreign mfn %#lx at gfn %#lx\n",
+                      p2m->domain, mfn_x(mfn), gfn_x(gfn));
+            return -EBUSY;
+        }
+
+        dont_flush = this_cpu(iommu_dont_flush_iotlb);
+        this_cpu(iommu_dont_flush_iotlb) = false;
+    }
+
     if ( mfn_valid(mfn) )
     {
         for ( i = 0; i < (1UL << page_order); i++ )
@@ -579,6 +600,14 @@ p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
 
     rc = p2m_set_entry(p2m, gfn, INVALID_MFN, page_order, p2m_invalid,
                        p2m->default_access);
+
+    if ( fpage )
+    {
+        p2m_tlb_flush_sync(p2m);
+        put_page(fpage);
+        this_cpu(iommu_dont_flush_iotlb) = dont_flush;
+    }
+
     if ( likely(!rc) || !mfn_valid(mfn) )
         return rc;
 
@@ -2156,8 +2185,9 @@ int relinquish_p2m_mapping(struct domain *d)
         unsigned int order;
         p2m_type_t t;
         p2m_access_t a;
+        mfn_t mfn;
 
-        _get_gfn_type_access(p2m, _gfn(gfn), &t, &a, 0, &order, 0);
+        mfn = _get_gfn_type_access(p2m, _gfn(gfn), &t, &a, 0, &order, 0);
         ASSERT(IS_ALIGNED(gfn, 1UL << order));
 
         if ( t == p2m_map_foreign )
@@ -2165,8 +2195,7 @@ int relinquish_p2m_mapping(struct domain *d)
             ASSERT(p2m->nr_foreign);
             ASSERT(order == 0);
 
-            rc = p2m_set_entry(p2m, _gfn(gfn), INVALID_MFN, order, p2m_invalid,
-                               p2m->default_access);
+            rc = p2m_remove_page(d, _gfn(gfn), mfn, order);
             if ( rc )
             {
                 printk(XENLOG_ERR
-- 
2.53.0


