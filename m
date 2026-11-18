Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05689606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 00:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YK8Uo1P+
Received: from list by lists.xenproject.org with outflank-mailman.1493461.1693445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTU1A-0008Tc-1d; Wed, 18 Nov 2026 00:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493461.1693445; Wed, 18 Nov 2026 00:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTU19-0008TV-UH; Wed, 18 Nov 2026 00:59:19 +0000
Received: by outflank-mailman (input) for mailman id 1493461;
 Wed, 18 Nov 2026 00:59:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xTU18-0008Q1-Ns
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 00:59:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTU18-001be4-4N
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 01:59:18 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afcf772-2eae-0a2a0a5409dd-0a2a450c8dc4-44
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:59:17 +0100
Received: from [40.107.209.69]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afcf864-f479-0a2a450c0019-286bd1457338-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:59:17 +0100
Received: from CH0PR13CA0037.namprd13.prod.outlook.com (2603:10b6:610:b2::12)
 by CY8PR12MB7433.namprd12.prod.outlook.com (2603:10b6:930:53::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 00:59:11 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::49) by CH0PR13CA0037.outlook.office365.com
 (2603:10b6:610:b2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Wed, 18
 Nov 2026 00:59:11 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 00:59:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 18:59:10 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport;
 Tue, 17 Nov 2026 18:59:09 -0600
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
 b=ljwgnYNZR0jBp19UHuGdrRRUhrzZffq+7XY45gcGHY1kYrfltuHDkFigaaw45ZiSHYTTyCThYIIizYtYFIsUZV+1LMCyfmZdn2dyYNiec3/FI6IDhqIPs7ZPbllO7YTVrcjZ51nUtM7pF85roqvt/l+e/txDzLZaF4GMPfielH6MHqWVKGqRwTViox0io4d6aq7rdPF7jbTZx0vpFsJJZBUxopZYHkiwqQ5SDLOCkHFEp3J5iZgdaEm2YvpRpZpBlKaZKmqv1wJbt/vOcGbuKLglel41VLZhxJtK1BE2TIO3Sglv+io52MoYLoCmt2H1L5/Yv8rEtwHSuWNU0O73Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGJszfWfoSqr3opBXAHz7+BtojPST/zZUmtV8ooETSs=;
 b=ZVZG4Mrz4tPxgcYwkVUei05iD68ZNhj3Hs1I2XMAGxYEZUJQBJFVQ/F8I7s7hzPzR/5E2b/5zYHu7k3xo1h0nA7fccjMl5hir00uyFcS/xP1vBLfA28VQpkV1REwX0pcsWVrcOW7qra8vYMowyGRax6HPsOx8DefH7ZQQw2wMCppvdZSiz1Kf5Z0U0nh3luxwfDWnuioa4N8NZuwHNp+b03MEnXLSafaShdf5ZhQ8HyqAMaPLHT6oo4zVLS7xV8bf81W1Ewt1qAhabuo0vrCMQnDaWPGQa9Wiq3YiP3AktyCSpLydnPzWRCe/9+lZUPthLkpHznlS/k2Ce+Ri5cvxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGJszfWfoSqr3opBXAHz7+BtojPST/zZUmtV8ooETSs=;
 b=YK8Uo1P+1QGiUE4Zq/7X0sWwcBp5gPjP1fWVhIeHTU1RZqwnmddY9Jz9FSwDGMOLwida4VGMfAhkPjF/zSRTs/ccJGvQi/quOP6B5e+Ct2IxYzK1Bq93RA3udzSoImtmw47ThOwWcT2CQNIgxyxDCFqdliw3o+bjqtAJ5CmLIrw=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/4] xen/arm: guest_walk: refuse an address outside both halves of the range
Date: Tue, 17 Nov 2026 16:59:01 -0800
Message-ID: <9ec26a7839aa586343f6c566e07dde208f781a3f.1794962603.git.stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794962603.git.stefano.stabellini@amd.com>
References: <cover.1794962603.git.stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|CY8PR12MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 14fb17f5-9621-4855-481b-08df450f27f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mjd/qi/39zQpK6GuQWR6LnLn0lvlYxqLTS1BC8EKKVcWO5KkifgnJQwlogvawoUH9Ko4TwIX+ldQFy+sDmR4vXH0pLEDY/TWAuij36q5mC6Boa/1hEGQBaq+H36EbAPkSMK17tEscLifO6zpzWcSsC5f4sDyl1TwBg9TYXGqZaGZ6M1pORuB0oZYy2au2SsONaOwrrSjZhZRS37CI7RA6PJtLWVajMY+TNtXcgd5YWjVkhfVx/wpk01tiZ/CwDn2QxicF00XITqer9IpSp61Jbl657Vx+RLIiNUs9NmC4vzVm36ZnDbUA1nNp8vajRxEPEd1N9d+YXZqSpZm2t9IJm5QIrv22lCaUkApKIKfqIVUQVvIBcDFWZk2lcqoxZdr+cinQJqTe1rqpKzHahvuclAveJRyVouyNVqtzYI1fADKc0k0eZJNzBPRMpcS0QBuma+n491AyXnAusW3aMEGaRDqV7Dl1CucQQfKuZUuGRGE55toIHijgdiFh9nqbbCiIDqq/pLjxEiRGF94y1Fd/tok3MSBCg8cXFjp0qo6+F4wi4DEx8XCYOzPm8YK+AX9AoGi8OkY2KOG7COG56TIhbPx+7njxDYPKTRJsyp3kGTlk7BTIMVAdWFQTBBckdQIeHNsT+P9CIAI9n65Ad2e5wvMAIXhUdDfK5f/U5093A0NZksggG1SDe+VX5Cd6XhNV9ZOaqJGHWwhL3QuIpSuPw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C9PA7AhMo9Mb+aDyth7fJ/18kdLwdr6eQOHKaDccHJbq8cp7PKU/waoXYDGP5Qx+v8bfe5G4iulwfmlrP73+yjAprb9h/R61CVvTsdPIyl2iTLhoYyPr9B7eQli0D7gHcPuixg5931DWqGMbpPwewCPMKkYW0CJo+av3ryheBLk7DOtzU/k57ZY0o+gzPsVE6jhjc5F5Ug6jopycGiS1pOzpYhEMpZiyEiVCRmEPP25R6FomT02uZgZTHiSMMGcfgjF4RufnNQfJTWA37X761TG3RmQTS1D776v9xClMVlH9XLZRJx8Hp/nhFV9JyVeubO1We+H7i+1yWg0dlBzbH4RHypOUcjaoeTJfh09JeY7XhBoanIhR4BinF+H619tLZyvdpuYaWPMfYCpnSw7QZJRXukq/sqhERYAok+pdWoIpRlTsMbuRPfZcWruYKzux
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 00:59:10.6594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fb17f5-9621-4855-481b-08df450f27f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7433
X-purgate-ID: tlsNG-d25034/1794963557-766DEA5B-3BB47B2A/0/0
X-purgate-type: clean
X-purgate-size: 1760
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The bits of an input address from its top bit (bit 63, or bit 55 with
the top byte ignored) down to the input address size must be all 0 for
TTBR0 and all 1 for TTBR1, else the walk faults (ARM DDI 0487 M.d
D8.2.4, AArch64.VAIsOutOfRange()). guest_walk_ld() chose the base from
the top bit alone and translated such an address. Refuse it before
reading any table.

Fixes: 7d623b358a45 ("arm/mem_access: Add long-descriptor based gpt")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

Changes in v2:
- Cite ARM DDI 0487 M.d (D8.2.4, AArch64.VAIsOutOfRange()) instead of
  A.k, in the commit message and the comment.
- Move the Cc list after ---.
---
 xen/arch/arm/guest_walk.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index 151b837541..8c73ceb04d 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -408,6 +408,15 @@ static bool guest_walk_ld(const struct vcpu *v,
         if ( (input_size > TCR_EL1_IPS_48_BIT_VAL) ||
              (input_size < TCR_EL1_IPS_MIN_VAL) )
             return false;
+
+        /*
+         * The bits of the GVA from the top bit down to the input size must
+         * all be 0 for TTBR0 and all 1 for TTBR1, or the translation faults
+         * (ARM DDI 0487 M.d D8.2.4, AArch64.VAIsOutOfRange()).
+         */
+        mask = GENMASK_ULL(topbit, input_size);
+        if ( (gva & mask) != ((gva & BIT(topbit, ULL)) ? mask : 0) )
+            return false;
     }
     else
     {
-- 
2.47.3


