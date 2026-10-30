Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77365606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=zAkT7MCs
Received: from list by lists.xenproject.org with outflank-mailman.1466044.1676423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMsX2-0002t2-CW; Fri, 30 Oct 2026 19:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466044.1676423; Fri, 30 Oct 2026 19:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMsX2-0002sv-7b; Fri, 30 Oct 2026 19:44:56 +0000
Received: by outflank-mailman (input) for mailman id 1466044;
 Fri, 30 Oct 2026 19:44:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMsX0-0002sp-LG
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 19:44:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMsWz-00ETqJ-Dd
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 20:44:53 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ae4f352-8faa-0a2a0a5109dd-0a2a4509e102-32
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 20:44:53 +0100
Received: from [52.101.201.46]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ae4f3ae-be1a-0a2a45090019-3465c92e649b-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 20:44:47 +0100
Received: from PH8P220CA0041.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::20)
 by BN5PR12MB9462.namprd12.prod.outlook.com (2603:10b6:408:2ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 19:44:36 +0000
Received: from PH3PEPF0005961B.namprd05.prod.outlook.com
 (2603:10b6:510:2d9:cafe::23) by PH8P220CA0041.outlook.office365.com
 (2603:10b6:510:2d9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Fri,
 30 Oct 2026 19:44:36 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH3PEPF0005961B.mail.protection.outlook.com (10.167.243.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 19:44:35 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 14:44:35 -0500
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Fri, 30 Oct 2026 14:44:34 -0500
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
 b=ONLci2N3hUXXEfR7kS0knzuU+KSHGBrKfXjs5bCssph7we1mInj/U4pbFl0pag/EMBxYfVaicnnxfj283w9/avW4ZRzG5NoG1mJsMDYn+l4DmfzTJJEDchTURCxq+XDBbJ6ctwn/GQvxHjOr73B6h6H0ygP/pGcgSqCV6lN9+uy4efGlIg0dHEiHpMddakB1zbs6eUkSWZ/FuYREmngNPJ55ydEyiQM0WQS/rBL80y09xVU8TEXK4cOlGZ0SZl9BbD3VO0rcY2krjQyeepdxrcgZKK+GVKJ4TS2ValxwTUKPpp1/AnZQG9wGZJ23u/At2AvAsw8yLkJi0zIz4WQqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5FGtXxz13+SI2Duck3/v8izN8CZQ2+IGHg79WF2CM8=;
 b=U7OEbVhyoVXQqv13DVqsodcz4zTt+ARhb9C6yWLVlTHpIVfx//zewCfN3BG8mrRzPF6mjR71Uo2ZjVRz/OjkiWTuTkKT649KL9a7mE0exrqkuM+Us7J63b6Y9J9Ptb86R+F5dVpFiLFk4gEevwlw0xUoSMrFKgFHdhiOJQRKOf/8t6UoNYJNP8x2h8l8SOpOlFTKsVkeZBDs/DHPnGRf06AubTSPpFcnmWcfBxUrOBCxAOJU9ZqXoS7OVTdBLQ6XzHdV2JJrDf13d0uQwCHYAvYjndeTqYOAPFsHHpTcYaceG/mVyQPIHt9JHOkxJ1J2/uUKsCZNe/dz/00NchtjRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5FGtXxz13+SI2Duck3/v8izN8CZQ2+IGHg79WF2CM8=;
 b=zAkT7MCs3PCbD9781pwzVJ+WZtm4fo+l4zwWBLkC3CEYFE7vs9B3lqasfQV/za+aGlhJhot9gFntV4TO/gxg7f5MPUnWVI8Y8YTNxR17VqkjGuHxPHIEZBylbE4gWZbxIKCEewNq+TYBmSuYdSVBEErxWLsivz6thFOz851Np4g=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Roger Pau Monne <roger@xenproject.org>
Subject: [PATCH] xen/gunzip: free the code-length table on an overlong length run
Date: Fri, 30 Oct 2026 12:44:28 -0700
Message-ID: <20261030194428.1320905-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961B:EE_|BN5PR12MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ebf8132-2e04-42c7-3293-08df36be3a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|18002099003|11063799006|5023799004|56012099006|261009223027099003|261026140227099003|261022115727099003|261022105027099003|261022075727099003|261021121427099003|261028144727099003|261026121527099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ylvpEaqNMTC1gTYlFUdULvMvJlbVn0tN86LSazqpSGrtbPDDYHAq0O7AW8FgybYMHIIvlu4NZ5VlunYSgMdxa2y2QqLA9g61eZ1UnGS9xk9cwQTwzTh4kER0q8yua1DYMgob/f9gI619d5akHTw33zagMyZIbBml4A0mF1tPpgkoxC6lbtf32KHYSEo4JzwnSg11/FvNAo1nxHtkN9lPVQlcvw2VyDq/uSAgc1U348rRMh0bqdEn4e/48hZBB5Xpues7Jsso1YDiFCsqLAaNd+8xmXzbHsnnT12bGHW7QsPINoF3D6L98Yiu8jrrF10hprCf9dUnglP090bQbgj7weImMcOaK3PrmCu9qF5U4b2dmDAFD56Z1SYZ3PFTov5IA/R/R/jI8mH4CraR4ltG7i7kPZKCWIGzVh1ws2sqKHqouw0ZjFlIZiGq7CH1a5SSnomLRc8Lo7bxfZwWjnnTMcXyva4eJrj3TXMpOE6lc+uViocabHr225w8ic9tAGdwbsBz/TrrPecqZrncaebYURg/lc5CM8pNVYmyXoKrcII55rXySRUCvJklp7OaTNM8xMQMv+UEacEUiAX4MyR6RwQcfYMS4M03pADqN4an1rVjJD+J7rz17BH2y0L3S635gfQKbU5LoqQrDAMu3qY4gW3OpONveLBZ1mOIilLy1Zow94rwYXd/S9uQIzlmjJ5p5sCkpQcRCp4VZZmJt3Fvmw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(18002099003)(11063799006)(5023799004)(56012099006)(261009223027099003)(261026140227099003)(261022115727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261028144727099003)(261026121527099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P3sIE1OhI0P8Ltt9DPrhmN9dItseZsC8XYdBWQMm5onVzg4NV6ET8GL45DM6lY0stvw8dV3sYvWwhP/3fJ1kJhm/ylobNIXQ9+xrmOHr8RXmKGIbg73yMkOLMJCAQPkdNhXT/R2GRSYZ2FiPB5KXE3tj6HMjDWM8nDU5IhaHNEJ0p4W6VPJikMsN9+CqF8GvhdczvSoKFhZXD/eq3JNx+rhsGy5n4tyhEYcvSgyH7V1QwnpFWoB4VZ/cuowaWNfpTz0zMd1U6xksaycgeeLmgpZYPZwXbmBFlFX4i4Yj7YDlhHGo0OrmRpZuT71RFTtrJ4QxqD3n2+aw3qvV6bM3X8Ccnusu/j6jnU20Lx+VVBNMSc0fLC3xVlzbT/WquE5gpSvk1yAVd+LvFIoErs06F7ZjnK1Msy8fL/UsCUCJnCwBELxuFdTGGrXeSBcwASGn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:44:35.7353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebf8132-2e04-42c7-3293-08df36be3a3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9462
X-purgate-ID: tlsNG-bad1c0/1793389493-BFED6034-B6D8F0C1/10/78276251493
X-purgate-type: spam
X-purgate-size: 2157
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

inflate_dynamic() builds a decoding table from the code-length code
lengths of a dynamic block and reads the literal/length and distance
code lengths through it. A run of repeated or zero lengths that would
go past the number of codes the block declares makes it refuse the
block with 1, but that path only frees the list of code lengths: the
table is left allocated, and nothing else frees it.

Free the table before returning on each of the three kinds of run. The
other exits of inflate_dynamic() already free what they built, or are
taken only after error() has stopped Xen.

Fixes: e2b1ebf4de50 ("x86: Support booting a bzImage format domain 0 kernel.")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau Monne <roger@xenproject.org>
---
 xen/common/gzip/inflate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index cb146555c8..69bed78a38 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -858,6 +858,7 @@ static int noinline __init inflate_dynamic(struct gunzip_state *s)
             j = 3 + ((unsigned)b & 3);
             DUMPBITS(2);
             if ((unsigned)i + j > n) {
+                huft_free(tl);
                 ret = 1;
                 goto out;
             }
@@ -870,6 +871,7 @@ static int noinline __init inflate_dynamic(struct gunzip_state *s)
             j = 3 + ((unsigned)b & 7);
             DUMPBITS(3);
             if ((unsigned)i + j > n) {
+                huft_free(tl);
                 ret = 1;
                 goto out;
             }
@@ -883,6 +885,7 @@ static int noinline __init inflate_dynamic(struct gunzip_state *s)
             j = 11 + ((unsigned)b & 0x7f);
             DUMPBITS(7);
             if ((unsigned)i + j > n) {
+                huft_free(tl);
                 ret = 1;
                 goto out;
             }
-- 
2.47.3


