Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54BB606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 21:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=on0KDxh2
Received: from list by lists.xenproject.org with outflank-mailman.1456552.1669805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJHSd-0002Gs-NS; Tue, 20 Oct 2026 21:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456552.1669805; Tue, 20 Oct 2026 21:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJHSd-0002Gl-KQ; Tue, 20 Oct 2026 21:33:31 +0000
Received: by outflank-mailman (input) for mailman id 1456552;
 Tue, 20 Oct 2026 21:33:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xJHSc-0002Gf-0k
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 21:33:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJHSb-005hVM-4S
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 23:33:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7ddbb-e002-0a2a0a5209dd-0a2a4505c05e-46
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 23:33:28 +0200
Received: from [52.101.57.4]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7de27-4cb1-0a2a45050019-34653904971e-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 23:33:28 +0200
Received: from CH0PR03CA0276.namprd03.prod.outlook.com (2603:10b6:610:e6::11)
 by CH3PR12MB7523.namprd12.prod.outlook.com (2603:10b6:610:148::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 21:33:24 +0000
Received: from CH01EPF000BE945.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::5d) by CH0PR03CA0276.outlook.office365.com
 (2603:10b6:610:e6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 21:33:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH01EPF000BE945.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 21:33:24 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 16:33:24 -0500
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Tue, 20 Oct 2026 16:33:23 -0500
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
 b=X3QCgAMpPQUIqx3CKVoR/1xEbntiUU+97w7Fi19SVtw3IdcmS22p1W+UTdltIkYv2Pc/2OUpq/GDrQYDMRgRztvJqQNlckTQoLmdeDxz6V1+L2bpwoMMhvp7l/zVVX35fhkKvL12WW2ysQ46hP6GvB0jqJBKqlMriCe4iM/xE6ozdmNQ2E0//EH6fmmuMkTrm5+PSpsPDxL+VxZyqsG+Ub47k2xgwyLD1/UaeesPLrVcRpL2rhQNLCYqnrYGEHRTy4i3OYC6zuSj9BrYORzdCLeLMSeD9/YnH1OFA0NBk355AonlTb04qIN0JkD4z9AUM42Q1hDgkF86a7LToMDqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mLmovPYFSQH+pk2lrvaukpqTjj7fDJAJGejPwRKTs4=;
 b=hv+4ZMP8KjSyfCbww+7tZMiUuKEA+6jEK+TUPXmBVccmv6MzvJvVVouVtafOal6y0hHb3Gko89DElBZ7Hg04Tnq826ohkxADPixq0iN2dC1h0LymXw/sOWa31nGt3fhKZK3ygGeeCb+QLbcFw6sOXEisiG2cOj/+HTTyNq3UAj6JYXK6SqH50MK7DB4QmC6cYLSea7//uiVHgTqejy009W1/g4OGSVW8vNWijgi9ybaDeGZonRb07YA0Yz4rw1SDU+JanskXEl/+nHzvvXUIrhBfmfNuMH/LLKF9GyDxprSFAII+3tRudLBLFoNp3AP3hczSucj/mXeVN5nIACh2iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mLmovPYFSQH+pk2lrvaukpqTjj7fDJAJGejPwRKTs4=;
 b=on0KDxh20XdmlxYpFme69MYy5NuVBLfcalxNSVEUZtbBpBbBXVqqWQNc+T7ej0+3k/WxaHY1Yu/K6gbFOuIUCMVc0hWDrfYd1pXlL5KsgNNR/XUg74G2o3r/kG85TY1ZMu+pvYsndnpIfvMmJd3IX+NqaQWriNAYhrxDog9vDoc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger@xenproject.org>,
	<jason.andryuk@amd.com>, <teddy.astie@vates.tech>,
	<stefano.stabellini@amd.com>
Subject: [PATCH] xen/x86/hvm: Propagate emulated CR2 writes to the VMCB
Date: Tue, 20 Oct 2026 14:33:15 -0700
Message-ID: <20261020213315.3641133-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE945:EE_|CH3PR12MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ebdd492-458c-4f93-69a5-08df2ef1c575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ulKqh5J86RKXsGSRXlHzrUCptnSN/cDumwinnhASOkvBcXr5oPKDeuyfSHPPF0TU/tDRTaXFBvSPq9a0aHcLqOuYaKG/bUVhfj5IHBqtNRVjD5GUgeyHodhP2+eFeXG6pACr/glfsrDG4PunEz6re2Dl/BT/Pk59RZQ4dXEdP6pyPjzSfqIqF4W1FwKjiqhPAY7YAWda1wLIDa/pAmkFmO3yxIsoXvROIlScL3g0pEEsNdFU4/SWhLHo1BApbsZg44Ow0ujmWQYPTfWDGr7bw6k+iBfaZFZDYzV8b1xJ8Bmws6p/C7v4kRFQTh5a24dIKCgxdC3DZZpnQy1sMJ9JBSu9lSglRnMAKP8ehYewNP6wOZKTm5oKerFiPHC1gwR2rbfVGX5KuuMJ/6vDc0VUmR4FJ/eA35y7FPxkWub90c6QEuV0EmcR7UCcMIVNRmAR5D5UJBD5DcgVjmXGRlffHc0UXOaLUgrXWEEz+xLOLiwCK3RvD5wlZdEQsuj8eLxDIWVxaCGVyZfiK8zYHnifl0JPjgU7TWSfErbuf13CIi6usCd3UF6YaU0cVZyGHn7kbCAuvJPVkGCjXepEOjNyhj0EzQKoBWqMtojiieAzjKK2Nll2ZTqupt1RMokB/YexxADLK7T4aDQdm4+RWrEloDUHClS/glF1RT+uCa43fckuL853v5sc4AbleAPrO26USmVaLRaVzKtBy0LjE/g98g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b+ry1AOAK0ZCXUEdzHgGQ1tG1ub9I5KxWHEKYBWI+K70fGCMpaE0Cbve3GyD+zbt0uZKRRdMvtjO1EWu5Be3OeXd2Mf1bBP0ilt5x+dSge7BJRG2UPykyC/0irrdVDSXu+z6U2u2fPFyHskSIjCMYA6n0M44mQDkDwkkMi+tV1LWiXXsSm1L7cY9P01FuoRki9yyuXSXCgRqXnjIWEy2eG/vqAarYthM8iZUbWryKAYU+7TWfA9J61DmPyh34cyUgrU/88AI+ULBbpJMTipvbzcyilunns/BUdlN7MGB6AkoZ9qFkgcM3SzjGR1/bFHlszsycH0fXGtLVNwvrz5h9reHZlF+e+rPmlGZnfB6SAJxfL5lt7muDe7T3PydXJKmmd9s5lLXNVGib8y+7CJt3pUNDjEj99D48iPNOg+NmP6hBRA3g44LbXgKF5XzGsXn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:33:24.4145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebdd492-458c-4f93-69a5-08df2ef1c575
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE945.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7523
X-purgate-ID: tlsNG-c201ff/1792532008-720AA2A1-93755F36/0/0
X-purgate-type: clean
X-purgate-size: 813
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hvmemul_write_cr() updates guest_cr[2] but, unlike every other writer of
it, doesn't call hvm_update_guest_cr(). On SVM, CR2 is loaded from
the VMCB, so the emulated write never reaches the guest, and the next
VMExit overwrites guest_cr[2] with the stale VMCB value.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/x86/hvm/emulate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index c09ea002ec..cd2831d34b 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2350,6 +2350,7 @@ static int cf_check hvmemul_write_cr(
 
     case 2:
         curr->arch.hvm.guest_cr[2] = val;
+        hvm_update_guest_cr(curr, 2);
         rc = X86EMUL_OKAY;
         break;
 
-- 
2.43.0


