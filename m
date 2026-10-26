Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA79E606A31D
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 23:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dxSbexO7
Received: from list by lists.xenproject.org with outflank-mailman.1461731.1672760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLUIS-00007h-PL; Mon, 26 Oct 2026 23:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461731.1672760; Mon, 26 Oct 2026 23:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLUIS-00007a-Le; Mon, 26 Oct 2026 23:40:08 +0000
Received: by outflank-mailman (input) for mailman id 1461731;
 Mon, 26 Oct 2026 23:40:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xLUIR-0008Su-3K
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 23:40:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLUIQ-00EeOt-91
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 00:40:06 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6adfe4d1-e002-0a2a0a5209dd-0a2a45068ecc-12
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 00:40:05 +0100
Received: from [40.107.209.61]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6adfe4d3-195a-0a2a45060019-286bd13d1fa2-4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 00:40:05 +0100
Received: from SJ0PR05CA0128.namprd05.prod.outlook.com (2603:10b6:a03:33d::13)
 by IA4PR12MB9762.namprd12.prod.outlook.com (2603:10b6:208:5d3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 23:40:01 +0000
Received: from CO1PEPF00018866.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::99) by SJ0PR05CA0128.outlook.office365.com
 (2603:10b6:a03:33d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Mon, 26
 Oct 2026 23:40:01 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00018866.mail.protection.outlook.com (10.167.249.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 23:40:00 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 18:39:59 -0500
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Mon, 26 Oct 2026 18:39:58 -0500
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
 b=L2jNLnWBXlUH4tfKsHhu7NA8BxxgBPZ6jLYXMgU1BQoArO6GzvsQ2Sb8sacP1sClb8pubJkwYh//mZNWlH4EImcbQcn0FqF0Jv+YqZo9FS3/WEkIrCCd/oUVkIZe4gmMpY51LtQlRyMqHKTglY/fS3sHVQZzoFHkWR4y4YpOHSzppnySjNA8Vk/L5qFfJ5wh8n4Vz2dH4Cu+WtGqRy5me8qx7puwDsvY6R1pvQxEH8zyOOIZ/c0aQW+6V0XRcgj8mkV8/u7tqC139a+rUld/dmhVz3V2EtmqJY+IyAOPQ1+a3E0N1b5A+UsBTrlNDo3yszaSGuNKeXUvUxbxBoDRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahjVg/6HXjNeC9J3Powm8bLZ+kSAojsaF2JTC35Yw3o=;
 b=erVn3ZqjSODOGnyom7m6vQpMBf4ArGInUEFWZ5NM3xoL91e7z6FYhg9U10pIZqIVVHm51ArTpFXMuERjyamtir2NBaKo6h7y9fpq1rWfIsChJeelo/kPxje17rCX6fLOY7QTRCmDVeSY+dzRayxT2zYftH2KSq2xD6CE74jMMJ3osyALGZtXPk7ed+NWzBe+kqjxAw99CBETH8JvpfsJgilL+iN08f5DbFX14zE68X41cRv3LC5VArhSM2ZDqieskLe9Pk4hZ8VqDVPQoYOdeNd4tHBwRp2cq9E1/yOXbsuR4YXjl9K5clR9TQNYcOPlHeGu5D/OsZf+7rwYrC9O4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahjVg/6HXjNeC9J3Powm8bLZ+kSAojsaF2JTC35Yw3o=;
 b=dxSbexO7VrJcjkqyLxMA20v5QK+mIaHQR8yzlRlyY/KecSdVElzS5u1aiRi3StRTsBnwwL+GiU3DrSdpzuTzzJ+7DjrPbfoKZlFiYF60rvsshOpANRimNcwRbxL1Juao3zhakQ2jhCyjqsQQZoa8nGt0BXpO0Mti1utfpispDo8=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, <dfaggioli@suse.com>,
	<jgross@suse.com>, <gwd@xenproject.org>, <jbeulich@suse.com>
Subject: [PATCH v2] xen/sched: Fix the sorted insertion in sched_domain_insert_unit()
Date: Mon, 26 Oct 2026 16:39:36 -0700
Message-ID: <20261026233936.1330117-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020223534.3703199-1-stefano.stabellini@amd.com>
References: <20261020223534.3703199-1-stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018866:EE_|IA4PR12MB9762:EE_
X-MS-Office365-Filtering-Correlation-Id: 215c1f2c-5a17-427f-aee4-08df33ba7397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|261026140227099003|11063799006|56012099006|261021121427099003|261022105027099003|261021123027099003|10067099003|261009223027099003|22082099003|261026121527099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q3LMM7i1m9jc/ZjsaTt7wsNPIrbrRWvT+03OMP9iwsRfEwXu2E2zj5eC/OGzJhhRZHg/TgAIYDKppOUA4KaYePjSFkBe8HJmA/EVm7MJlvr0Qfnk8xikHqkX2RjegYK5jRUE+36C6t4fxfNDfodPzvmJtWIADlscoUDHie21CIJ2OuHIB6D6m3TA5PNx8ITCjxVOdZt+ynSxmRQkKqsYG3v9LUlFbWG4+lF3C8DR+lWDwrI4+kCRfGped+xpD0kG8XfE3QSVCb0c0yZq7vpQoNLr7YeKQYc/+Grt2x8GD+FoGin278lTteUtT8jdI241WU9i3qG27KoOA0lLxDS/SmLaFvPkg4Bv3wRKbZAu+KVn4e8QjsQDgf05GWbfdejKeRRlLaAlR3dBtqbaAf1wt9h9QOdDjVjLr8n+CmvfaZRldDpGtZTzsAorpPwxJOdPNTmItzaSrV9K5CI/U3GQgSdcYlO5InCIZaKWM2HwbWxEAQbrsEH1ZYzDBs1lCrm4yzE510mN0Kn5xq4S9pTTYGsYPRpaZIiEyEkcMD/eun8ytzMdvAZLATWc/F5FYoWe4aMQUaxu5yf/uRn+jOeycJiGlMGHrzSXYZ5QmaFuLef95i6xOGQCLit7hIfe3eSDIiDVGk2dKsaxnCHmAEf3buaWfYESI77v4SABn3SICzfpMbzo9S8LpZ3xrWMul51kPLb/UByNWzd2fDKSp6I9wA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(261026140227099003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003)(261009223027099003)(22082099003)(261026121527099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ttE9pvfBDh+r8NdnXNza6ccRtzuLdLWq6BNuWnKCi3WEskozMn8pzqU7/ks+QYkAV1NDqhjg1vczhJbnGIOjaDLM2cH7FnC58SRVGaCdfssZQgUqcVwqrorerDWwaXtsquzoxxuHVVNI1+/+tp3B7xH04WE3zc5fAHVp+MiD/Fwg/QGz+QyYHwjB7bHAZj5WtdDJE+gxE42lFlMHm41l4nQMIKEel9KMIs7ry4X+XdkKUXGkV632rU90l4GM464uiJb2ffXlHO22+RifpLXqdTKbxozthzaDB3bHC/jPJZrKp7N+hBuJiK5WazAV54HLq8xI0HSjEKetsy/Kl7IxWEIAA1TmUNfpiZR1lI/o6ITGFFTJ8Set7obQHyG6hf/fDOplVK4PENAIMjAYXgeJJi0Wzs9fxke/rxR1O9UrFmrtbzdxKzzUrT3lJC1vvMa6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 23:40:00.4799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 215c1f2c-5a17-427f-aee4-08df33ba7397
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018866.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9762
X-purgate-ID: tlsNG-16d1c6/1793058005-FC20077B-C68682F4/0/0
X-purgate-type: clean
X-purgate-size: 1836
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The loop links the new unit in front of the unit whose successor has a
higher unit_id, rather than after it: inserting 1 into {0, 2} gives
{1, 0, 2}. Stop at the first unit with a higher unit_id instead.

This goes unnoticed as long as units are inserted in unit_id order, as
guest vCPUs typically are.

Also rename prev_unit to next_unit: the new unit is linked in front of
*next_unit, not after it.

Fixes: 141db7fd4d2d ("xen/sched: build a linked list of struct sched_unit")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- rename prev_unit to next_unit
- add a Fixes tag
- reword the second paragraph of the commit message

 xen/common/sched/core.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 0b072bdee6..88ae40f954 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -483,18 +483,17 @@ static struct sched_unit *sched_alloc_unit_mem(void)
 
 static void sched_domain_insert_unit(struct sched_unit *unit, struct domain *d)
 {
-    struct sched_unit **prev_unit;
+    struct sched_unit **next_unit;
 
     unit->domain = d;
 
-    for ( prev_unit = &d->sched_unit_list; *prev_unit;
-          prev_unit = &(*prev_unit)->next_in_list )
-        if ( (*prev_unit)->next_in_list &&
-             (*prev_unit)->next_in_list->unit_id > unit->unit_id )
+    for ( next_unit = &d->sched_unit_list; *next_unit;
+          next_unit = &(*next_unit)->next_in_list )
+        if ( (*next_unit)->unit_id > unit->unit_id )
             break;
 
-    unit->next_in_list = *prev_unit;
-    *prev_unit = unit;
+    unit->next_in_list = *next_unit;
+    *next_unit = unit;
 }
 
 static struct sched_unit *sched_alloc_unit(struct vcpu *v)
-- 
2.47.3


