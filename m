Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5A3C61DC2
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 07:26:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399665.1635654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz81R-0003Zf-OF; Wed, 26 Aug 2026 07:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399665.1635654; Wed, 26 Aug 2026 07:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz81R-0003ZY-L0; Wed, 26 Aug 2026 07:26:09 +0000
Received: by outflank-mailman (input) for mailman id 1399665;
 Wed, 26 Aug 2026 07:26:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wz81P-0003ZS-VL
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 07:26:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wz81O-0006oY-Be
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 09:26:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a8e9503-2eae-0a2a0a5409dd-0a2a450288da-28
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 09:26:06 +0200
Received: from [52.101.201.43]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a8e950c-6ca4-0a2a45020019-3465c92b21b2-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 09:26:05 +0200
Received: from CY5PR22CA0080.namprd22.prod.outlook.com (2603:10b6:930:80::19)
 by SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 26 Aug
 2026 07:25:51 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:80:cafe::3e) by CY5PR22CA0080.outlook.office365.com
 (2603:10b6:930:80::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 07:25:51 +0000
Received: from satlexmb07.amd.com (149.199.90.133) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 07:25:50 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 02:25:48 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUbrDCt87TUHqMcTARr8GSI0MmAW+dwPkwUTCiekhcKvVvlNzjbPzL8GEEZcHC2yqeabIej+LFXMMdN8jPEk1lh/LjwmOLeXRHM7KgUZ3Bfp6spLAShWqqEfFXEypXF1O44J2quuaYq5GUWI3os9zvJO6DrnNfrfnlhVckxb+GLK+YE2Q2vixGppDRyOxw5GglEiLcO8Jzi0gmVNJ2CWLMNB9Fm38sCe+jDBnTb9uahMBQd9EQEzxXi6OnThoNEDIDuFISQBakw79Ml53rB0PtFlyR/w7p6lIyLpAr1EjzhpUpwcPMv69vtJJAEgYaHXWIZnEWxZAfEgyEprtRujcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VD7YGXn1R4mrSF8Z9nVENyoKgDNQ1X3q79iAvYgzDY=;
 b=NBeU+vgTTV1GTQXYEUNGYmijRlc2LjqxxsyGJzueB+LT/mpWVkzOg4U2cFFntkcAbWfk6ha2i6mJCFo0301zIqaotuYo4ivjwalJw803ZLfAUES3s4PC0o/XwK7QFN7ZWfe4/Zh2Eg2o8AZKx6xJpqVEDwS9I8rzZrh/AxLNzOGlSL7BlhVUcUKuzJ+UjWN3qDlTkEgroC6LiePCLHYcUjgcFn4k4vkeffVPsFyHAQjTCyEC9d+LtjfrsGtAPLqigOSfEdp15xk5brxwxJ8my2m3OATqYKxR2pqPorDBve05OjkfN6Ydfgs9LnpTUmST2imydmg+h1yLR37SdEFDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VD7YGXn1R4mrSF8Z9nVENyoKgDNQ1X3q79iAvYgzDY=;
 b=ojLc/KxHYeGR0rGiR9KwomHwpppXYBnaETWZAr5bj+/gGnwJxU1oXAgmUj4pw+43GWpCjrnnL6vJ/taY2SF/tFYOhuCDJI7JLzM8HnubdLivGC4RMqPWejdKXSzTjjQUT/iI0IBr7HioNWmlITzXqC2OW1yiSjpcWJ6A8GJhwDI=
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Jiaqing Zhao
	<Zhao.Jiaqing@amd.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>
Subject: [PATCH] x86/cpuid: gate the hypervisor PV-only leaf on is_pv_domain()
Date: Wed, 26 Aug 2026 15:25:26 +0800
Message-ID: <20260826072526.767424-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|SJ0PR12MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f762f29-ea15-4440-ef90-08df03434152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|10067099003|11063799006|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	0v+ahpYOFjZnYs7ymZg6uGvaJbqBgyrBV2hVXQ5NQCMVrU/oy0ddqvloASiSGXTYAKvPto8NM36Rssjo5MkLEDu+/ZovryVtq2K/AFYWsUFky2cVEJ65CvOlDicoHdrKicIs19VI2o2Hp1yQZE2HcX2Yh7bkfEy4/APBLPRLToMxtmAA5W1D3ljQ6OB0OOZM0zzG6Y9wbeReI3ZADsgp+YUiDXI/tRw6M2x6Hd8EvIKz9onMYaSGnw5sXjOyYCRmhS79F/XtkUfS3n/t3rNOc2Z4K39LWRoioklwp5q8C2jGjGp7vFgxWXMLEEUfrsp5IG+YBo0+ihN1WrbY5EDjtCPJQMkXzjS3tTGRAUbUlcM4nWip4fuvAyRb/Atcxjd3wMmA6pKkWQ+Kof+3RCEL/QmZQtsqpTkuN58wFDOgFtwsZv8U+En4r6DzBng4BmnPFluZQOWuqyySEldl9ixoFylWRFULywEs0aWyyXcEK0tISOTKyoHcF13LaBFQ5qY5VBIAVQbZh5IM+3ZxTpR20aWCdd+GHIFCq05IbDBi7Zx+O6lbA2Ro76d3H8kOQao4NZNSRjlTOIPyEDqvCuxX5DTNVGVZV1/cBN1UeR72J9PTlNjTRQ5LEXgM6RKEdZZ4xQ+iVkZL1NiDHn4rVPhgoK+BpV6Q4tS+EDBZZb/o7hmLU24KS+TqPmRXH0Gsm4uHMJFTXD8CTJb0pYYheYcpUQ==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(10067099003)(11063799006)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lYR5LWIrJVI3jBFCfBJn7Si3OFsrKXwpz1tpIfTlKm+TgkwAN8YgUzlYXTK0FLLn3rUHXCn8oR18g9teVfUZbZTPkfySlwAYoJOeyfFh1Yw+PerM+nAFQRam9AR6TxQ+JVHy2bk1WFAeC3d7otVUUMZ0MYgBvWMArhLKijbkntVrC+X1GgN8EHparR/933PEtciP+GlkhGf57/utAFZCFtBn/kmAfnuV6nplOABSryHVN1n9mG+TJdKaFqKw7tbgyLHyxBXz7JyQll4KoFh2CQxVdCmmv/PZDd+gYjQF8ySvZjlG4+99z3+6GZ50cmpad3Aw1toJ8QMxWX7FJe2rIr4ZGK0ALkgCfvzzcEaisBO/Ti1WNODbiOVf8shmR+7/gc91IHg5J28GBw162PVEgxCQm74gFobF48OT7GcCLaVmo3VQGmy7jzbtzwbnPZjd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 07:25:50.2658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f762f29-ea15-4440-ef90-08df03434152
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880
X-purgate-ID: tlsNG-720697/1787729166-674BE2AC-05BD3BC5/0/0
X-purgate-type: clean
X-purgate-size: 929

Hypervisor leaf 5 is PV-specific, but is gated with !is_hvm_domain(),
which stays a runtime test in a build without PV support. Test for a
PV domain directly so the compiler can discard the leaf when
CONFIG_PV is disabled.

Suggested-by: Roger Pau Monné <roger@xenproject.org>
Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
---
 xen/arch/x86/cpuid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 6e9b15c9c3..a9aeb2d268 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -157,7 +157,7 @@ static void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         break;
 
     case 5: /* PV-specific parameters */
-        if ( is_hvm_domain(d) || subleaf != 0 )
+        if ( !is_pv_domain(d) || subleaf != 0 )
             break;
 
         res->b = flsl(get_upper_mfn_bound()) + PAGE_SHIFT;
-- 
2.53.0


