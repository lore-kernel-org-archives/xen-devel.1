Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C143606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 07:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MQCAnGfP
Received: from list by lists.xenproject.org with outflank-mailman.1480692.1684469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQg2o-0007MV-9A; Tue, 10 Nov 2026 07:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480692.1684469; Tue, 10 Nov 2026 07:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQg2o-0007MM-5O; Tue, 10 Nov 2026 07:13:26 +0000
Received: by outflank-mailman (input) for mailman id 1480692;
 Tue, 10 Nov 2026 07:13:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xQg2m-0007Cd-Iu
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 07:13:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQg2l-004xNd-Vg
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:13:23 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af2c3f6-e002-0a2a0a5209dd-0a2a450a8152-46
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:13:23 +0100
Received: from [52.101.48.5]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af2c411-f2d2-0a2a450a0019-346530051b96-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:13:23 +0100
Received: from BY1P220CA0041.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::13)
 by SAVPR12MB999143.namprd12.prod.outlook.com (2603:10b6:806:4e5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 07:13:17 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:59e:cafe::f) by BY1P220CA0041.outlook.office365.com
 (2603:10b6:a03:59e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 07:13:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 07:13:17 +0000
Received: from jim-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Tue, 10 Nov 2026 01:13:06 -0600
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
 b=pDULDHevmnKHo3WGUqScNRVDUfJYphkfsChOTznnclfiQXLtnkM9uY0Vn2FlpCztKiICsAPpfNoPn6OfRerJbkcVhEYmtgDV1qRGLukhKvzo7fiJPe4sVLRTc7s3oGGfp6Umoeim67dXY8xwfGZz2BB9ltNhCscGo4ASJyZlcjZR6PSu0iHddtwPgsMG3bY159wOX6ajRBhlMWm2oBIZzx+8ofBUV9Y/JO04/m2TDRgl577b1pFXVQBg/bUPMLV1pVTTYYZIEYKeROUV0kUIYLukwfkrnKOuaNJ03dUrNlW8CCKq2ILly4uxhM/eh59TQgdJivRJtruG2ZU58qMwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwG8GIj9d9ouz4R9r6IwbYqqep3MBKMHa8e6lIDKyFM=;
 b=ryPmXEcOxZFULNrvIPMgKvKljAUTVWnjm4dQfssuPP5msW+yLyB8izgruhMgKwAvkOuDgXovBWQKH4nAhfdgQ0Lng9Al2dBvKL/97Lk4IQpKNS7PFdEuwiTXSQeb8BTCp/aOF/Zj3DwFiQX/xkGPPV1MGRDPTW7Yg0tYE1+w4yHd8lwvnZCMN3mBDEqxmboeTM1Zc7VrzNjfzhaaaNTvwRGlJ/z5V5ep2o98CCniku9eIw4b9ymUs4fLRlbKbt0MXCwlrcTVFA5KfD3k4/ZA5kXd3WKATFN1DAKMOE7FREVtGZJy+ZjCQGZFjMsleWcEXN4rCjUTDyHevR9HxphpvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwG8GIj9d9ouz4R9r6IwbYqqep3MBKMHa8e6lIDKyFM=;
 b=MQCAnGfPppgDKqXc6TMln2ic8ILyRf8jTRnmU0Gwjio4Xhh0npiMRNO+Ur1ebMNATU4lsMNBekkXdNtTo5GSXKPC+dHH5oAvakx433iOfQ9n+MYNNI2S+gmNr2S536gpyzBZfsC5d2xtLxzeTS935dyf9OOgtaaGSOGqO6L2WgY=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Shuaidong Chen <shuaidong.chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "Nicola
 Vetrini" <nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Teddy Astie <teddy.astie@vates.tech>,
	Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Penny Zheng <penny.zheng@amd.com>, Ray Huang
	<Ray.Huang@amd.com>, Shuaidong Chen <shuaidong.chen@amd.com>
Subject: [RFC PATCH 2/2] misra: deviate R2.6 for the labels generated by CASE_SIMD_*
Date: Tue, 10 Nov 2026 15:12:31 +0800
Message-ID: <20261110071231.2888628-3-shuaidong.chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110071231.2888628-1-shuaidong.chen@amd.com>
References: <20261110071231.2888628-1-shuaidong.chen@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|SAVPR12MB999143:EE_
X-MS-Office365-Filtering-Correlation-Id: 845e9fff-609a-4dce-4868-08df3efa1800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|36860700016|82310400026|260925022911599003|260925021311599003|260925021911599003|10067099003|11063799006|5023799004|261021135927099003|56012099006|261026135527099003|261021133027099003|261022105027099003|261021130227099003|261021123027099003|261022115727099003|261021121427099003|261022113327099003|261022075727099003|261026140227099003|261026130827099003|261009223027099003|261026121527099003|261102123227099003|261028144727099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	93l/honr/uzSUj7AqC3ZgsMJ0+Helo35dRLrdQy2fAr/KE9oKbvWkvPbKYMqtbyXciO2aSEPLoiqtUYnHGfBegUpZKJexeGjVizxCvCyrIBPoj7g2nklHtCzQu9pGRZ2uINVuy+Ub4k6KKrLmTT2LkgNzWfC/fMcreqDruQZW2CNh6I8oNiZfeOY0oSodOrD6h+IH5F45td6dV7k5kQktBncnvPlo+ZXVeuNdA4zP4GWaR7FOkyCHYP+YkmgsgTnxSq01BN7qnKMo9ZlVgjXyHwDKyFa0LxLV5xFQY/YMh8EjMXJKgGiuBcZGfOSxQCNzR4euKq/wlFaOIDalrAXeF61YmpC6RsCHb54oqa2jjIzkShx/M1qLmT2VQCQYKqVgIzEB1Y9c6dw0edtPEG1dgv8vqR7UgkyA6Em6WUhp585P5qdUW0TTyu+0AS6/3+nFGACtglR8uZLeZhYLLYtkLGmuumkjXAIbffel48xDLqxWtfIX0lohOAbv0ylNH9WlkCnp0DwQF0Gi2mdtW7llpdcAAFpp+BNsHLsLBjry5Jxeh5zdnLDm64pa+oEk+kSvSHSEUqW/sVfYp0FXtHzGb2aK8sqk7PFHx+3AjH4jB0TBVvQvQ4jH6F/t3iPzKjG0F6tL5a9Z0QdRSiuYoXgt5O7CwOQNkYvr4j5EtlWkQvCDj1bmGfDOVsGBuzsVcotPPZ3thHfzL4Scpr1ZkrDkg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(36860700016)(82310400026)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(11063799006)(5023799004)(261021135927099003)(56012099006)(261026135527099003)(261021133027099003)(261022105027099003)(261021130227099003)(261021123027099003)(261022115727099003)(261021121427099003)(261022113327099003)(261022075727099003)(261026140227099003)(261026130827099003)(261009223027099003)(261026121527099003)(261102123227099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TXxdhWkIgubThmTjrVDTQvmJBHBK70gfPuBBXe+07pU41mNb13snadaE6wEhmzSK37UWahSEJPHuQGq7ixUZAepwKiUn+QHZTMv5IEvdggTcV6m72QOT5X+9pIzrmW/P8h5b8OelrRa4ZCW9JnnKEOFm1KlKidmPd+crcIINfgN1pD97Oz83mhtSee698TRSptnOLxH5rSzEVQXPdZVHaFvD+mK0Iw6haeSTEMh1YEawzu5qr1VzjhOaDnvP/uz9bSZZOk07HxHiAUq6+vH88+BlK//KMuFZ50DGEb9m4gRjjl5XBDfjPKkJJLwS/W+hDYn8kP6j5EQR9+z9wp0XTpo9AO25cGurHN6ptmgx5pfm1Ayvt9iu1ZmpcVxwiQDWuhNnwA95Dl4rHNOjn1fmTsEd7W94jpSjQKwF9wVZlRYqXJzc/gjRZp7dpI+BPHns
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 07:13:17.4621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 845e9fff-609a-4dce-4868-08df3efa1800
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999143
X-purgate-ID: tlsNG-4011c0/1794294803-520C1CFC-8213ED6A/0/0
X-purgate-type: clean
X-purgate-size: 3075
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MISRA C:2012 Rule 2.6 (advisory) states that "a function should not
contain unused label declarations".

When SIMD emulation is compiled out of the x86 emulator (CONFIG_HVM=n),
private.h defines X86EMUL_NO_SIMD and the CASE_SIMD_* macros
deliberately expand to plain identifiers instead of case labels, so
that the opcode switch builds without conditionals around every case.
The labels they produce (e.g. Cs0x0f_0x2b) are never the target of a
goto, and the build already passes -Wno-unused-label for this object.

These cannot be annotated in the source: ECLAIR reports them at the
macro's use site, while __maybe_unused could only live in the macro's
replacement list, out of reach of the existing text-based R2.6
deviation.  Extend that deviation to labels coming from the expansion
of a CASE_SIMD_* macro, and document it.

Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 +++-
 docs/misra/deviations.rst                        | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 296340bb4c..6055279674 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -51,8 +51,10 @@ removed by the compiler, the resulting slowdown is negligible."
 -config=MC3A2.R2.2,reports+={disapplied,"any()"}
 -doc_end
 
--doc_begin="Some labels are unused in certain build configurations, or are deliberately marked as unused, so that the compiler is entitled to remove them."
+-doc_begin="Some labels are unused in certain build configurations, or are deliberately marked as unused, so that the compiler is entitled to remove them.
+With SIMD emulation compiled out, the CASE_SIMD_* macros of the x86 emulator expand to plain labels in place of case labels."
 -config=MC3A2.R2.6,reports+={deliberate, "any_area(text(^.*__maybe_unused.*$))"}
+-config=MC3A2.R2.6,reports+={deliberate, "any_area(any_loc(any_exp(macro(^CASE_SIMD_.*$))))"}
 -doc_end
 
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index bee4686675..658e438980 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -116,6 +116,15 @@ Deviations related to MISRA C:2012 Rules:
        such labels poses no risks.
      - Tagged as `deliberate` for ECLAIR.
 
+   * - R2.6
+     - When SIMD emulation is compiled out of the x86 instruction emulator
+       (X86EMUL_NO_SIMD), the CASE_SIMD_* macros deliberately expand to plain
+       labels instead of case labels, so that the opcode switch builds
+       without conditionals around every case.  Nothing jumps to these
+       labels, and the code behind them stays reachable through the
+       remaining case labels.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R3.1
      - Comments starting with '/\*' and containing URLs are safe as they are
        not instances of commented-out code.
-- 
2.34.1


