Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60920C5CFE7
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 13:08:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388204.1629434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtmDj-0004S5-EK; Tue, 11 Aug 2026 13:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388204.1629434; Tue, 11 Aug 2026 13:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtmDj-0004Rx-Ae; Tue, 11 Aug 2026 13:08:43 +0000
Received: by outflank-mailman (input) for mailman id 1388204;
 Tue, 11 Aug 2026 13:08:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wtmDh-0004PX-De
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 13:08:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtmDg-009MW2-Li
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 15:08:40 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a7b1eb3-e002-0a2a0a5209dd-0a2a45038ce0-38
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:08:40 +0200
Received: from [52.101.43.24]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a7b1ed6-fae8-0a2a45030019-34652b1869b7-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:08:39 +0200
Received: from MW4PR04CA0205.namprd04.prod.outlook.com (2603:10b6:303:86::30)
 by DS0PR12MB8072.namprd12.prod.outlook.com (2603:10b6:8:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 13:08:27 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:303:86:cafe::3b) by MW4PR04CA0205.outlook.office365.com
 (2603:10b6:303:86::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 13:08:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 13:08:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 08:08:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 08:08:24 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via
 Frontend Transport; Tue, 11 Aug 2026 08:08:23 -0500
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
 b=yy3IHdIRV6uSAY3yuBKGyRBwcGgOKMsVMJ1OUAgK7+YZ2virNNgMhkkEtbHLqxscGcOXxI/fZGrAAJuMXCUeIynXFLKK8idJQfsVKTTRkFnQwlCKSijTcqJGMH3CsFAsTF1PGVqpG1wiOngAiLIFRPNW/GWZN/EgfcqBr6BMi1aOf3pX18IK3cXV0ERNFkDwcAkHVrZrq33zH+Z7wmdOhiXc9lmWwjx2uji9GsNyf2qeULEjTr0JJQ/b9L0DcX9mif6c5ShdL8pG8ihazUmZNVAY88DuGJXU5VhaHpy/Xe4p1vRzZBU3cV75IwyL/Z3F4wJMF1GwqIsOKCZsVx4u3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2SKxcmYWgXuUTR76GzBaCM/d/NBn5uY75sGmQkZr1g=;
 b=aZKp+Pgbg00aLn7VpRdehZuG2kU3AKAOJzAQTyo85U/nL5Yph5Ey6jdppCq4tsFeSiC5V89qGLtD8Yn3Y7UUeVnzudP+EAJYN1Enjb7OTCnO+nUtzkkzB/it4PnVvj6TDwYKWT44MV8JiqL+pFvN/mlqvVDbVtoQ74Xkl+rqr+QiuqcAEGN1U+N2F6FjCZS5OSy6SSwKtUXEIfbU5/ms8tdQmCmNB40cJj9O6DG34YafRp8Ez72eqdmhk83w3ZOtUyKOCxa4vfgFy1oMcKaU7jmF0SpR5+ij4JmeE0BO2umt7r0599wAx/fMi4yhIncUeQYwkh7htIKyGDIyOqQJgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2SKxcmYWgXuUTR76GzBaCM/d/NBn5uY75sGmQkZr1g=;
 b=rK7XlvLHHmsCUEH4w0qsK8D2kBceaJvCdZ9DgHpVVsM/jpGn1RaTaIVpbD372POpTr8FYJ8sgcX89YDE5p1f2bQuPCgBnY2ntelctSD8onazd4feuUMCE7FcnTKF7CfSAsS5Lhdwf0iL7sUPmJOgZzer0jX9YucE3ivG04TpFf8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm: drop incorrect EL0 accessibility comments for PMINTEN{SET,CLR}
Date: Tue, 11 Aug 2026 15:08:18 +0200
Message-ID: <20260811130818.123862-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811130818.123862-1-michal.orzel@amd.com>
References: <20260811130818.123862-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DS0PR12MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 58746e1b-f68b-4e02-711c-08def7a9a0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|22082099003|18002099003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	J2XZbPqGvmm0NBQVhW8WSto4Ng7tUUm0bKcNd8AX8RpfoiBzQa68Fgkr1XQhduV8Sq9tClJiDSl3uiatDT1vF4PhHwWWFNYlb4losAJWYe85SCUHqoPr7vvHFrNNKdIJwfHHbjranvuN5goV4j6axBhDBtropEhKUc4ofQbeyd3UxeFS0ORiQrwgUaqEujiB7FYPM/ynD1PNtsxklAGKTtVo95FpXSMIjcu8YSAYV0V/L1xyMnpy1GR+zYCUfd63p/2DXzuG1rMU0r2iSJX2nMJM8xKk159ntPACr667gHZQGzLKyGyIAg6CAimeoAiLCrDzJA0vwL79/OhBBnHAo/V0MpKzK0vmfKtT4dyu7rv4VohFgXiERGL5VZfhdlURrN0Ljfi+1h78bs+9MnmipStsuTeEa67Se4lUTlBR4QCuVGQA7RukKaAIvpOcjcpb7N6ZA9bmz0oy5ckWSiY13CAE44FXZ30K4gayn8zFGLz9B6EpQPQVXAijk0Tp1DE/RbVVMCZIXEGNDrH8TL6f05bwwh7PXL6+Qc/TXfkHz8LPNIO5aKeK8y5WqA17TX81jHO8movwdRKPz7eEkAd8UIvwkBkzw5mKsx5qeZCtYRbI/WlRWf/MBkfOWuCEL8eBH871kE2pwNPeNaSx5JmcOwSj/YLL9sJ4h3pLcdXbIaXpTOogXCEyzUkUis727SReoKblNX9KyUVVzkkEwvOrtQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Hg783r01a0go50NxmbIleMxqijc28z0+ZRMoIuBQI8uIrcIHBo2bm4xxHVgYledrfL5Ffx55R5Nqm0M+b9mQSH8wJ9dru3K19Wd7Gu9Y9zzsyeHR97afWbahDfrAl+QkQfkMK0G+eMG1BSgOzX9b75ox1+bOUmjssKNUHhrvwQgYVWlx4K33/Z7jz7Gvkw4czX7ngVEdu4KH0B1liD+iumSXP1P5ZFEJBVJw2DOukIP4FyJcumSBQwQjFA7ARP1KJGwAD5R44e6R5Neg6IahB/aehdtJbh+R+XG4W0l/BFBSrYaCwEQEm/8EE6j5mpK/wz1GOgHI7TbAx4uBvd6Xuy/kwsqC6UKNqAaXDLb3/0en3cC31l/POUzUN3Vrb+7cRWNe3vkooSvqXCPJPPAZy+IH0AwJZSPVF+NvRJ/lO6VQNkSYDtSMfkj3NNGYDeki
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:08:25.2958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58746e1b-f68b-4e02-711c-08def7a9a0e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8072
X-purgate-ID: tlsNG-33051d/1786453720-6D4D74E9-0487D19E/0/0
X-purgate-type: clean
X-purgate-size: 2068

The comments on the PMINTENSET/PMINTENCLR cases claim that an EL0 access
may be trapped to EL2 when MDCR_EL2.TPM is set, and that such a case is
handled. Both are inaccurate. PMINTENSET_EL1/PMINTENCLR_EL1 are accessible
at EL1 and above only, with no enable making them accessible at EL0.

Arm ARM (DDI 0487M.b) D1.4.5.6 "Prioritization of Synchronous
exceptions" orders the two exceptions. An access that is never
accessible at the current Exception level regardless of any enables or
traps is priority 18, whereas an exception taken to EL2 as the result of
a configuration control in MDCR_EL2 is priority 24. An EL0 access is
therefore UNDEFINED and taken to EL1.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm64/vsysreg.c | 4 ----
 xen/arch/arm/vcpreg.c        | 1 -
 2 files changed, 5 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index a59848889659..2ada791f4ea7 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -228,10 +228,6 @@ void do_sysreg(struct cpu_user_regs *regs,
      */
     case HSR_SYSREG_PMINTENSET_EL1:
     case HSR_SYSREG_PMINTENCLR_EL1:
-        /*
-         * Accessible from EL1 only, but if EL0 trap happens handle as
-         * undef.
-         */
         return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
     case HSR_SYSREG_PMUSERENR_EL0:
         /* RO at EL0. RAZ/WI at EL1 */
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 749ce6d3a57c..b0f3c7759a04 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -295,7 +295,6 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
             return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
     case HSR_CPREG32(PMINTENSET):
     case HSR_CPREG32(PMINTENCLR):
-        /* EL1 only, however MDCR_EL2.TPM==1 means EL0 may trap here also. */
         return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
     case HSR_CPREG32(PMCR):
     case HSR_CPREG32(PMCNTENSET):
-- 
2.43.0


