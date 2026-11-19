Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3118F606A324
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TA1LhDIP
Received: from list by lists.xenproject.org with outflank-mailman.1497488.1695787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUAB4-0002fW-I2; Thu, 19 Nov 2026 22:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497488.1695787; Thu, 19 Nov 2026 22:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUAB4-0002fP-ER; Thu, 19 Nov 2026 22:00:22 +0000
Received: by outflank-mailman (input) for mailman id 1497488;
 Thu, 19 Nov 2026 22:00:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xUAB3-0002fG-9V
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 22:00:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUAB2-001yx1-Au
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 23:00:20 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aff7162-2eae-0a2a0a5409dd-0a2a4509a89c-20
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 23:00:19 +0100
Received: from [40.107.201.30]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aff7172-be1a-0a2a45090019-286bc91e6f53-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 23:00:19 +0100
Received: from PH8P220CA0050.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::24)
 by SACPR12MB803698.namprd12.prod.outlook.com (2603:10b6:806:544::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:00:14 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:510:2d9:cafe::62) by PH8P220CA0050.outlook.office365.com
 (2603:10b6:510:2d9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 22:00:13 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 22:00:13 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 16:00:12 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 16:00:12 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport;
 Thu, 19 Nov 2026 16:00:11 -0600
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
 b=E7UVm59cPywdjorlKL+nDl3NBxaRa06a8OD+aXQpCelss6ANQI1xTaD60mQYQS8NKADbQ8yraWWsbB3Z3TJSrCEAKGlkNITTihkvPr3x+nCrNtBC7lMCRHmlfDVqFXPt6L6dwo3CMn2pfCK7BcGvzfTraIeTrNduqzcrhbs5NESPlpeqUZd6cE10rXxrqSkI7GUFvC8WB4TEriWM6FhzpTcG2lR/Q8wCA1jmQq6J3SNpE1sSewwHXRZliVk3+ymhCtg9C8CDNOPLC1sM3BII0LmYO42PEByW7SqIp5Xsoqa3DjGmlnxl46H8yoxK/yC7+Y7WDBlMD+G9YnQzmxKNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybpWGRnz0YgzptcCH56dZZXiEu2ZDPhCyBMsUrxtBHU=;
 b=UHo2phCeEC2PG3XGJga5qpCtjKjwWtUGjdmANNLoGTXtXih4ib75kRcOfO4VoiecGvNQaj0kDv6ETNhlSEwlxGvqa/S0WG8v6M7lHpPjsjBvKrkQMsTHgUW9OHuLPatru3SpfMBDLXA6Ff3e1OBANVjZlLuAp3Ujkl0Kw8tXxmbm9HkP/TvGC9mU0nB3hkR1CbIUyKf1zwxkhUwYJEvG/qMDtOXk3BSVnGEpJUFI62Zx/VX+SW2c3CoRFs8sr8fHeDeQGMH86l22Zg3ZaGdpw6w61qINVhQ6CM8s17u5lxteTmOL47MNQmMRzmf4aPJFj7PIHrIbFyOO//KrBKDTZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybpWGRnz0YgzptcCH56dZZXiEu2ZDPhCyBMsUrxtBHU=;
 b=TA1LhDIPegFXTGohdVYeRMUeHkwnztoYexP/5KUHcnhiTwlFdM8fw7X5O+D5Bu87sX3fy2wsq92YoqfQ3wYpzUU5UKW4bFMlzzBoQGGR9dMoG3WwuCV2dnY/57wwWlAp8OEjg97+0OFaQC1i1/9SO/7HT2deDwT3hKcvOFVabEI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 2/2] x86/passthrough: skip disabled vLAPICs in vector_hashing_dest()
Date: Thu, 19 Nov 2026 14:00:02 -0800
Message-ID: <20261119220003.38517-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119220003.38517-1-stefano.stabellini@amd.com>
References: <20261119220003.38517-1-stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|SACPR12MB803698:EE_
X-MS-Office365-Filtering-Correlation-Id: 753a498d-71c8-4d4d-db58-08df46887caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|261022105027099003|10067099003|56012099006|11063799006|261021123027099003|261028144727099003|261021121427099003|261026121527099003|261102123227099003|261026140227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hBJFOmhtgdM/P6wTuLOf0phTqBaPK5ECqVqnCbHm36845F2d0a0UaYUXwD8tSwIGFdGD8ZcMYjGj/4UKkoytiD+26kTrhWiSMdau9xQrU6c++kGy9WvrTgi/0V02PlLIlS7zH6SHL5VipBbm/Hp0Gn4alwddawCTJYLP7ayg6StAGwjyU/B2FH9KXiVw9mj1wN7XVCJ5laDkHWMQSIhYAaWFGQr0nGAr/bFM8dFMAp6FGPRuF3CFd58HLPSLbulYVLEpd2p9kY06DXR5olVvaRBuVYW1mqx8LeyJx29DxNl4ve1NUVwtbNZURSzt+YI73PKB/yVocAndqNv245gJ5VN6cKIAvHBnme8S3XJoGjbTsSEJNLAyOP+ZfixzctD7ZSa6tr06BDl1nqr7Rw5bM4YWuRuTrns1/3tGInSPHiWVPBAb6kfAPfeH+WGqKoi+9CU11ZkbYOHZVpXW0UJWCpm2ZtoSNfsmu/qSr1PcF9oq47a1PPr48SwzG6UtaCvl7yu6l6S4kCXOpkFYYEktuVV/3gfRR2TgzN8LQwfesa0p2umV9nZCqNr/6oMJ3HJBoELGGfFL8jwmJP2lEdjtqWVBdqtxMoajr3diI3dmIA2neXS+Xypoia4u098ZdAgTSDwDtV7uybCfYn0tvJSwG5njyWt2KZPqL3KSJ+Sv7xhoBJOw5l0h+b9ePdYqu54nTMPLAiVipwPmayl7wxRTuQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(261022105027099003)(10067099003)(56012099006)(11063799006)(261021123027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261102123227099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mQ9uvPNANXLTp6WMDqI1tPNA1KcKYACSG8vo8kxsYb5VM9QoiqdhPe6NW6gMrYDx7887MqcA1DaO8wO2BkAD5hbWEWWx36yVMkyqZ4FvP+y7gkf0OTY3uw20ESSh7OTMsttftJOXgFj+rwtlNitmP2JMRM/1YIxLLofXzQLAtBFCUR/c615GGMY41/WRXTW1wHzwG8AeKkoopPwFS3W1jdnmxHZI8s8Ul/i7YZhugUOBfSJUIX2sCP7oP5hBfJz99NIVKIEw7/08DKj07LpV03Vf9aksAzsRc+6hFynSpTYj8K3+F8vitCKq6pA4PK08cnk8/0rv0XNS5+TLKtYGHm+mXcIGmlSjefkUV1gFPIWEmnxV54O+HWmvPfLTvvAPHRLavr+UzXj34P/AgF18zGQNI5FBmt/BxbstG8gbbRI636bETf0HcNWb+q51sRLL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 22:00:13.0474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 753a498d-71c8-4d4d-db58-08df46887caf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SACPR12MB803698
X-purgate-ID: tlsNG-bad1c0/1795125619-FD26A034-2CB69AC1/10/78276251493
X-purgate-type: spam
X-purgate-size: 1497
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Unlike vlapic_lowest_prio(), vector_hashing_dest() does not check
vlapic_enabled(), so a lowest-priority MSI can be posted to a vCPU
whose LAPIC is disabled, e.g. an AP not yet started, and the interrupt
is left pending in that vCPU's PIR instead of being delivered.

Skip such vCPUs, as vlapic_lowest_prio() does, and as vioapic_deliver()
already mimics where it uses vlapic_match_dest() on its own.

Fixes: 35a1caf8b6b5 ("pass-through: update IRTE according to guest interrupt config changes")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

 xen/drivers/passthrough/x86/hvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 9f8e6c8cd5..7971acadbc 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -191,7 +191,8 @@ static struct vcpu *vector_hashing_dest(const struct domain *d,
     for_each_vcpu ( d, v )
     {
         if ( !vlapic_match_dest(vcpu_vlapic(v), NULL, APIC_DEST_NOSHORT,
-                                dest_id, dest_mode) )
+                                dest_id, dest_mode) ||
+             !vlapic_enabled(vcpu_vlapic(v)) )
             continue;
 
         __set_bit(v->vcpu_id, dest_vcpu_bitmap);
-- 
2.47.3


