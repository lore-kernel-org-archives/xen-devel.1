Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0F2606A332
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2026 02:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=k+A5CRsP
Received: from list by lists.xenproject.org with outflank-mailman.1477741.1683047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPVxQ-0005de-LV; Sat, 07 Nov 2026 02:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477741.1683047; Sat, 07 Nov 2026 02:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPVxQ-0005dX-IZ; Sat, 07 Nov 2026 02:15:04 +0000
Received: by outflank-mailman (input) for mailman id 1477741;
 Sat, 07 Nov 2026 02:15:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xPVxP-0005dL-3x
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 02:15:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPVxO-001QRF-DV
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 03:15:02 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aee898a-e002-0a2a0a5209dd-0a2a45068412-8
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 03:15:01 +0100
Received: from [40.93.201.2]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aee89a3-195a-0a2a45060019-285dc9028f52-4
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 03:15:01 +0100
Received: from BN9PR03CA0254.namprd03.prod.outlook.com (2603:10b6:408:ff::19)
 by MN6PR12MB8592.namprd12.prod.outlook.com (2603:10b6:208:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 02:14:56 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::5a) by BN9PR03CA0254.outlook.office365.com
 (2603:10b6:408:ff::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 02:14:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 02:14:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 20:14:55 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 20:14:55 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Fri, 6 Nov 2026 20:14:53 -0600
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
 b=SKrWA+jouTBv9VgZTgoSP+9LbpXncoIvS9Mr8pdss9jJkrGZ5zk/lI8voJeurqV0t9S0t9kPYQCko3rCerBV5fPkBdRvVfP25ffSodWPbvGLMQXPO1SaJ2DdIDaza5jH7Zaig7vUrZftGh6Pri/9pDaKp0TyDWIkc1C4CxAHFagPvjBoA0xJBES3il1cCHg1qx/gLSrLZD5HZV91qazBG/vKK82A92L456XlNd7EZCfIQiLYHNwqrQkIhXXXFgV0aXO27DYuZ+kBUPR6AxILLa+bsQn2ntLJh7JqNq6qcN7a51O1B6mAhhjeVt2BOwlOtiz2jKiw6HKLGWHSJF7kRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBxdKwWMhnQrWEpD0g4Fhaowq9waeLjtwAV1Ocf+/3s=;
 b=AIWiocHDUt5JOJgNFiNSmyXrvzTBcjwE1oIlwvJM9bWLM+GC1a0N13pptRtTsSENbuNnv1S8pxTE/Nr1HPmdwuG9mb88dp8RmZaJa1VKd8/7kCUIuPwYjx3ORQY8hxB3MBivrIqSqZUaWwRtfJbUF8CcB/xkYKEGdDBlwKyFJ/2SP57fhKnqaQzekK3lUk9gCC37Q+Xme7fUGxldNzECzcKIYAiC16kavpbEAeq6VaEhqsFU4fVqq031xG29eQoc9OtBzKEvkfye8mVt0mF9UeX1KeyVL8x3K1GsXO3QrMcyFPuFTz8VKYKwfou1H8cF5vszEP+VMNwFQV53FMDfag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBxdKwWMhnQrWEpD0g4Fhaowq9waeLjtwAV1Ocf+/3s=;
 b=k+A5CRsPQC83avsFElyYiOlu2bRYq+8ijUHrlU2ADsTbLVFMW5n43qc6g6MTeGk4vgLgnKDgik9SmIGTikDFwtbqdMzEBOJG6okIyp4r1ZBTFYsN6GTyrWlGRHZ5T7sEHAhfl7iVnu5yoFvF+ly7MV0ZeogzgM9dz2qp894rIYY=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/4] xen/arm: guest_walk: refuse an address outside both halves of the range
Date: Fri, 6 Nov 2026 18:14:39 -0800
Message-ID: <20261107021442.253612-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107021442.253612-1-stefano.stabellini@amd.com>
References: <20261107021442.253612-1-stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|MN6PR12MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f680cc-1ac4-453e-4b8f-08df3c74ea6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|56012099006|11063799006|261009223027099003|261102123227099003|261021121427099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nncqDYbVySG1/oNKXfmlTbzw5If/Y2EdNxvHYu9P90hJgOglNjgsU1FetbVTiUkQJa/w9uX/7GMo6U0COypC8DJUs233KP3/2FqjOAm39h8npJ8UP+5HkgGZTZeMuojbsgMYxlaPOEs+LANOhT2k5WNHAMLyldGaPF+w8V58wOFSSBlwtc7UO6FuVIhJ1rXOk8Hkh9uhLJ2v5855SlCkWzk84P/mapOl6mc5gy7yj1t2bR40pg6FIGaRNKph8CER+Vk66bhIqwkBANMBODfRK73c+MSFyj5hUzvNOKXFV5xdQOFOxM3i4YkUdv9wEYMtkTv1klfMTdZd01YxuirfyJmP98Xgr6UrDmmNUzUYWbCERETZVgYV1Ik8Vm8o5MPi1tvSxQSzv/K6C/nYDcP/FojfLn6mU9YmTtiqiZw+qVwmELlp8Cb6iUbWxl0N/YvbcrGDProg8pssJO/GLUwvB+/BAjZkjeNACS1JB30mYMnv9nrVnxaMqxd9BG3qCinY0e4BLZSZbh0kVg4us2QPTgH/IVcaI6ZVwrHTSZ7N5mVXc28nu9sVKdXDpotpUSvIQsNGdeMcLWmSj55wR3+NS0edD2oKFa3SzobnhrR55UCAKeYES1fZGQbAP0lK+zwjQif9R/0wFqspi7/vnrePphwN1wDOD+Bm7O1c/nXgnHmW+fG9O6wkWVCpmgz6u7nB3hilyoiTkJIc37W+SytYFQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(261009223027099003)(261102123227099003)(261021121427099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rf2li5rA/myfmhmDjmitIWkE6LQlsJzW/6XJwVujBYOZSz3c50h1T8kp/Hdi8YY/o8NSMSUqK2q5fxmX+9iFUnSGsrr4UAcjso+fwXLJges/1+oHktJWpTR0VkTPDVQBDMY5hZH4EWcuZgmoBOQ2S/7sT7LW/RQ7q+/O5GhQaFiaIUQaFLr/jJhqKB3d5LdCQMCaaXqQul6nXe283InkMAFcyJf11qYNSpYIOkNe4+HH7ivXlkvA+bMU2meIbH6WWPvvLLsF511ob4fZ1zzOxSexJGABx9sIWOs/pH6saHpvKTJMYysO4bBU7W7q0H82To4cXa1OeUChzaUxSMeC82Tqr0fybxZazjljFLpYhVYZ+IGqJR/eKck+cOQGEpBsOWZmxKGh3XiJpe88iUoU5OkNCU8uPQQtkMCwZtrMLB3omJaaxlBNiN0ovxOUA0sb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 02:14:55.6504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f680cc-1ac4-453e-4b8f-08df3c74ea6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8592
X-purgate-ID: tlsNG-16d1c6/1794017701-F5A0C77B-CF8BD836/0/0
X-purgate-type: clean
X-purgate-size: 1565
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The bits of an input address from its top bit (bit 63, or bit 55 with
the top byte ignored) down to the input address size must be all 0 for
TTBR0 and all 1 for TTBR1, else the walk faults (ARM DDI 0487A.k
J1.1.5). guest_walk_ld() chose the base from the top bit alone and
translated such an address. Refuse it before reading any table.

Fixes: 7d623b358a45 ("arm/mem_access: Add long-descriptor based gpt")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
 xen/arch/arm/guest_walk.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index e23457869b..a8f8530683 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -407,6 +407,15 @@ static bool guest_walk_ld(const struct vcpu *v,
         if ( (input_size > TCR_EL1_IPS_48_BIT_VAL) ||
              (input_size < TCR_EL1_IPS_MIN_VAL) )
             return false;
+
+        /*
+         * The bits of the GVA from the top bit down to the input size must
+         * all be 0 for TTBR0 and all 1 for TTBR1, or the translation faults
+         * (ARM DDI 0487A.k AArch64.TranslationTableWalk(), J1.1.5).
+         */
+        mask = GENMASK_ULL(topbit, input_size);
+        if ( (gva & mask) != ((gva & BIT(topbit, ULL)) ? mask : 0) )
+            return false;
     }
     else
     {
-- 
2.43.0


