Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78F5606A322
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 00:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IUWlBfLj
Received: from list by lists.xenproject.org with outflank-mailman.1461752.1672778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLUoi-0005nj-Kz; Tue, 27 Oct 2026 00:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461752.1672778; Tue, 27 Oct 2026 00:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLUoi-0005nc-I6; Tue, 27 Oct 2026 00:13:28 +0000
Received: by outflank-mailman (input) for mailman id 1461752;
 Tue, 27 Oct 2026 00:13:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xLUog-0005nW-T3
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 00:13:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLUog-007ANf-1o
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 01:13:26 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6adfec89-2eae-0a2a0a5409dd-0a2a45078e02-10
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 01:13:25 +0100
Received: from [52.101.57.62]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6adfeca4-b4ea-0a2a45070019-3465393e6634-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 01:13:25 +0100
Received: from CYZPR14CA0014.namprd14.prod.outlook.com (2603:10b6:930:8f::12)
 by IA5PR12MB999277.namprd12.prod.outlook.com (2603:10b6:208:608::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 00:13:22 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:930:8f:cafe::84) by CYZPR14CA0014.outlook.office365.com
 (2603:10b6:930:8f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 00:13:21 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 00:13:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 19:13:20 -0500
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Mon, 26 Oct 2026 19:13:19 -0500
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
 b=AwNNXjRaO1Z7CuqCddIMg8GYlqUY6JrpgegxcBXaDqlenJgxo6lcYs5vQUXQ0w1d4H9uBedjaUf7iRqeU9Qcnx6i8BVy+Ny3gvUYfJaNgPS/rb98joCYQXoApvFlKk7jiTi/ogxd/r/z0r3W0qN94DJrioHecVoPPDN6/SWSukl8zZ0tu568rLCv07FhCIcJUnNCH9Qy3IfnJxfEMNfwiYrKnDm7yw8Z/RnVwrXtfTK6cJxRaIKGc1T3YsHtkOYGS2j8w3/Yc6s5Atrk3Ef3S9Q8aMoLyy5kC+/9mehHg8fDJTPijhrsMPu4R+YW0iNNDsA252z8hGvQjn3WwbYUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKWyD/YCXCvvIxGVkobaSjoSlS4NRyj9YHykWk+m4uk=;
 b=pEg5dGBKUiZS5MRDOwDEGigVw5/ogttrE1500cCrn+WHOxDvcGMKirA6ueY4HP11r1SqncpaZt4clegY5+8QTy3EiXJY8qXPWuUXfKSW2bAUhApv3v+e6PBWlzJ2fFmlCovDEDoFvFn4iYA8PWObHBJ6gptR+O1C9sOTNDnaB7ZbNWWAc5LijJu4NCKaM2EnQoUSxdNuHDA+T7yFbLx2ipr3NFX2OVTfdE7QMVAm2Va7EQpJJhG21ePN9NoZg9wbHtM55gM7QKk89MZ3KyGx1/Y6vwKNNEo5L50IjENVDrHehKvwnokyUSTjfRFyRambp2N5t6axiVZ9beKHh5ZgNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKWyD/YCXCvvIxGVkobaSjoSlS4NRyj9YHykWk+m4uk=;
 b=IUWlBfLjzHLRwS6UOG5wLwWEdZsEudLYC39+MepsM/mYgm/IEslzXzItLzv+BT5XIUjpOglrezkeWqCVOpOjF715F417SqCGUjTEw8EBSVxkp77Iq0RjlvNffmyZIIM9lgXomdnotpQyF+7MtKWMlV5CQ6MMK2SWATYo1VpNVSM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger@xenproject.org>,
	<teddy.astie@vates.tech>, <jason.andryuk@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@amd.com>
Subject: [PATCH] x86/mcheck: keep the banks past the end of the CMCI map polled
Date: Mon, 26 Oct 2026 17:13:15 -0700
Message-ID: <20261027001315.2614976-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|IA5PR12MB999277:EE_
X-MS-Office365-Filtering-Correlation-Id: aa2f0620-dd83-40a2-eaa0-08df33bf1bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|261026140227099003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Wn6QECMABzWji5XHpzPvKPyluIQA2oqnCQZ2pWCw0qnJlKZTYMwACmgbkI2PsGbtDP1waNJCe1usSnECaQgg8F2hyi8VLRjr1n2buZY8zBXF5fvxD33wa9DzSyP9wqGN4VkoA7kIopB4ZT92fihh3LgMrE2+RjUIba19PoYHn4k3Mrh9fzXFjkGqc3t0xdW7PzLR+GkLDqKn8xKY6uf4sQApnCU4yXKqzWpWLKjqiOZPXbXESj68F/c6QXBV77hUK+66ilo4UbhtLQEjdf+1/Vb1aOKnBfQleNoWNrIUzIXDBY7/JoFzIaA2/jP8yA+fNG8t/WDcbvCbo971PzeQhCOEin0MsF/ucw8T2ROyeQzbOv4C7qXZP7yxbRybSo9aL7syNHWRfy8/6ODg8hVatQxM4NArHXAypAGZBlsDypJNFjhBVLqNXKk8fAHOSMq82Xts1ODZwWoj0y/ifMWU02j/i6af2hfCdEfyuN9xxFl/a+GL2Y7WbL9eQloaZeRJPKHtVoQ74UIPFZXjhgetGSsbEeIGtJHc4oPNDhNGnjg4IVADFDhQCvjeHznVgGMUunftlb5rJZwQg8TFqt+c1sj4zcWFolfTwdKW3JXU92tjsL9E9QAyyu5B/lkQ+1JemnYkaazDiOVPJTeY+Cd952O6k7fUPz3Luw6lw5C0ZaelKuCzzups7XFllH0Z56ILuuxZXN+pB4TrzjpgiYzK5A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(261026140227099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xA7zG7M1e8ckRnR7IQgh/8ib9hXoihmSWXX2sldKw1U+hX7imNakC5v9NM337jmHC9vDWYylrSd/BoEeP6HTyHK4FdPfynLWFm6kPOx/+ioDGOdbtsAWoG/TM1uptWoci0iyr6VsO1bqT9eeQ9Q1b2dl96lQszLVLcOJflszrazVhZgeod49TBPnrqhwxAQAe5IYn3Eeg4dSEcqXp0v1t1xPMjSqXhDdHYFFPBI+d46uAR2TFaNH5mWlSVMMyJPVJaVw4xZnZxyS1oZhhMs1iuGFf4xQ2VEG0trI6WlFibEdKZNRH/21X4O2ZZorjkdh/spSfNkbfh+dX1xY/3iD0Xwtgyr4AFXP5HoFkZMWiIan0t/bDkI+k16bpcX8yPV7MsLINy58Rinogpxe4A7vCwI0GN5ejcfYgDtmyQn5Xq8nqo5t65C2El0SQsvc7//M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 00:13:21.0299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2f0620-dd83-40a2-eaa0-08df33bf1bf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR12MB999277
X-purgate-ID: tlsNG-ef75cf/1793060005-A7AD0AE4-8892929A/0/0
X-purgate-type: clean
X-purgate-size: 1502
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

bitmap_copy() copies whole words, so in set_poll_bankmask() it clears
the banks past the end of the CMCI map that bitmap_fill() had just set,
leaving them neither polled nor reported by CMCI.  Set those bits after
the copy instead.

Fixes: 560cf418c845 ("x86/mcheck: allow varying bank counts per CPU")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Acked-by: Roger Pau Monné <roger.pau@amd.com>
---
 xen/arch/x86/cpu/mcheck/mce.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 1888f22d15..f9a1389516 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -621,9 +621,14 @@ static void set_poll_bankmask(struct cpuinfo_x86 *c)
     {
         const struct mca_banks *cmci = per_cpu(no_cmci_banks, cpu);
 
-        if ( unlikely(cmci->num < mb->num) )
-            bitmap_fill(mb->bank_map, mb->num);
         bitmap_copy(mb->bank_map, cmci->bank_map, min(mb->num, cmci->num));
+        /*
+         * Banks past the end of the CMCI map are not reported by CMCI
+         * either, so they need polling.  Set them after the copy, which
+         * works in whole words and would otherwise clear them again.
+         */
+        if ( unlikely(cmci->num < mb->num) )
+            bitmap_set(mb->bank_map, cmci->num, mb->num - cmci->num);
     }
     else
     {
-- 
2.47.3


