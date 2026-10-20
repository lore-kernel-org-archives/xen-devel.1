Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E608606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 22:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MqTvVkFu
Received: from list by lists.xenproject.org with outflank-mailman.1456607.1669852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJIR8-0004BS-4H; Tue, 20 Oct 2026 22:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456607.1669852; Tue, 20 Oct 2026 22:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJIR8-0004BL-0x; Tue, 20 Oct 2026 22:36:02 +0000
Received: by outflank-mailman (input) for mailman id 1456607;
 Tue, 20 Oct 2026 22:36:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xJIR6-0004BF-5Z
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:36:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJIR5-00EVP3-Ib
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 00:35:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7ecac-8faa-0a2a0a5109dd-0a2a450bdc02-18
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 00:35:59 +0200
Received: from [40.93.194.23]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7eccd-b7e8-0a2a450b0019-285dc2178a51-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 00:35:59 +0200
Received: from CH0PR03CA0231.namprd03.prod.outlook.com (2603:10b6:610:e7::26)
 by CH1PR12MB9597.namprd12.prod.outlook.com (2603:10b6:610:2ae::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 22:35:51 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:610:e7:cafe::38) by CH0PR03CA0231.outlook.office365.com
 (2603:10b6:610:e7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 22:35:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 22:35:50 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 17:35:50 -0500
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Tue, 20 Oct 2026 17:35:50 -0500
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
 b=c42g3tyEN+Y0tQxCOi0ccS0HP+tihUmxpIa1B9F2okmIRcfApZ3mSPcAm2Op2kn0mfG95gpuyiiH27MHyHkrdt/1UY1+ciAAn+GB6322eXAQP4QK3CZcH0bLSV0k86H8D4ab1npJy50eITU7eHr7YOgqsxaMNfcWO6Mrvm4+scPk3nSwFOeo6guqkzwAg9DSu1zJjfLQIS7jyv0MiOolYihwH7u3DQRvfPGiA7rddr1b+SlLHbrsSVLsBgJE+V5r1Y1kGAiMHlMA4iQ1N1TD1k7IdPvMlvpUxO1KO9wx1xx1XHFP//TWRjFv7hmdkctW/pgCMZ4k3X1ACSuUPLgHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzji5eITuo5XfFpeBwgxfWgE41NZan1QMZX+6pDPknM=;
 b=IWR3o3KGO9KAXzVaes0Eh36OalUxsUjKEJRb4UfchrAYoAlTJ++19B6OnRAm8LuEUlUAg1iBocNFhgke8e5K5VlA5ShRRP8uueYMkHr4xdPE2mKe0Rw9/ygfURXdWQxut9vg4pWwjn8i7YshMqpMRs6tC+mhj60VuDLga0Z145PKL1tjipstG1YuCsWb+pWeiKm67FxjmWptYS9wQn9klgVCJs3f4PUjJLnkQLkkpAN4XlXBH3IyFpBm7z5SkVpDDEJ32E3EjZvl6tMuaXs/7qhC0XdszQyY65bb+QXVVMDxU3IghGFqBYVGuFJYHbcstfy/v/l+dckYF+MgYG3BCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzji5eITuo5XfFpeBwgxfWgE41NZan1QMZX+6pDPknM=;
 b=MqTvVkFuHINQ/YXDXL1rhBJ7ENvtF+GuHNkUpANGdSL++EZ2RceyHj4VkxwfkydHinFZrU7W/1+OhMsjtQg0yA62pmGOk44TiR1ZqhhrsuEPb0s9AVR7rYAsWfCjxILz2/M9V2GlE7x9A4qYORl72Tq2ce0rFOy/VpeBdJ2vEf4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <dfaggioli@suse.com>, <jgross@suse.com>, <gwd@xenproject.org>,
	<stefano.stabellini@amd.com>
Subject: [PATCH] xen/sched: Fix the sorted insertion in sched_domain_insert_unit()
Date: Tue, 20 Oct 2026 15:35:34 -0700
Message-ID: <20261020223534.3703199-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|CH1PR12MB9597:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ebe48e0-f78b-4fed-ba3c-08df2efa7e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|56012099006|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	63tDwmKz6EPwXBcLzqin/lqR6t9IJmUKtFP0MhKaoR3KMRyhmoumKAStTo3r1CguNoAkp5dBScleiHJCHfQGhgXhrzjjCDzBqEbsH14h43vQY34aUnatIVqHyibxa158nVXQD1cCUz5X88pMomIJztpEej5LUR4rfqj0x/yI6viljS/E/lG9W478y4ytck+yMcfBhESgobYCl/WO4Hm/yiv0YfRzxuUJJTD4N9oNhn86414qCe3PgLtn+HTbxgI7QcRgOB3+/aMOVKe+i9ak81wTutCH7YUD4eS2L2QgBekeJXfodCAaB54GIvSa8pANpjN01UYXpB5OygwED2xuquEip50fXx+Nm6RuwnXCSRCd4jbLbsGlLYHDkpXSEoLEJP6PEZlcRkx2v+eus2URf8N5yw+TyAl1A0j8UKR36oKZ6lPcoue+/bh8djuZ90NksE9W+jeqpdzmFXvrVPKE0yB2KjJMWr2hNIJ/zrM2dy0vfSJ8dwKYeF/HUz5lP91T9WHkFvk40+sosvOySXCmDOXSyZ8+qtxCFQXT/08RkPAnj/gfbXFygsOYMKdGLBRnytHPRgtm0uClf93decjHLb1YidyblNcVtPqpnM2oiQokOgzHsCGj5qkQNU1L+DO253/cg5SdRUbnEJM1PoCV+4NHc8Dr2kBHyfTF1bDPyp6ZGCTGTZ/R+vqeLbWMgojCJ9d7EZw0R3q4hTmC/ySwKQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+0oRefM57GHDGrOhCKKiE1CHLwvO88Vrq2oiWqc2t3z3YasTmfgJwBLIsPe3sTfOj3bkHl+wuYhzEShTdfxDz3JUCuQ4nkHh2u84ksmJ4xYSDEOiVu2YiIA5SldGUzANguAWtzlOJNuySEYoKelk5Unpss1i5UylhTyitqF1pL3zt4g9QsJaYj6wWT7aAlnQdSs0qOIxd6hFivVWdB3iXaKJT7bXdb8VVYw2hiwobd8epDaPaP6LpE5CKam0n3pQihfnf1NOB5eXccf/tLxh7vnQsgDvDFCUQur5F4PY9L+nZbbVMj4IwtO+yGkGlStjChVVswkjoNvU9wu0fpo0KKEnQRQkl7vGk1GJH35w1EahcnSS6Lfgdqzi7ZPxCKqovyhEWj5+j58UxRMxHz5Q2F2mwLKW0qBi7l0+egWHe7e8LTAtQvQz0Nd+t9wcdWr6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 22:35:50.7585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebe48e0-f78b-4fed-ba3c-08df2efa7e72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9597
X-purgate-ID: tlsNG-42698a/1792535759-AA0C59EA-C606D92C/0/0
X-purgate-type: clean
X-purgate-size: 1070
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

I think it usually works because guest vCPUs are typically inserted in
order.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/common/sched/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 0b072bdee6..a95d6752df 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -489,8 +489,7 @@ static void sched_domain_insert_unit(struct sched_unit *unit, struct domain *d)
 
     for ( prev_unit = &d->sched_unit_list; *prev_unit;
           prev_unit = &(*prev_unit)->next_in_list )
-        if ( (*prev_unit)->next_in_list &&
-             (*prev_unit)->next_in_list->unit_id > unit->unit_id )
+        if ( (*prev_unit)->unit_id > unit->unit_id )
             break;
 
     unit->next_in_list = *prev_unit;
-- 
2.43.0


