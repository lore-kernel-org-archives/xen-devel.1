Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B793606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5UOj8L/2
Received: from list by lists.xenproject.org with outflank-mailman.1481831.1685732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmE3-0000tf-Ed; Tue, 10 Nov 2026 13:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481831.1685732; Tue, 10 Nov 2026 13:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmE3-0000tQ-B3; Tue, 10 Nov 2026 13:49:27 +0000
Received: by outflank-mailman (input) for mailman id 1481831;
 Tue, 10 Nov 2026 13:49:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xQmE1-0000rx-FV
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:49:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQmE0-00Asfv-HD
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:49:24 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af320d9-e002-0a2a0a5209dd-0a2a4503cb58-36
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:49:24 +0100
Received: from [40.107.201.16]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af320e2-fae8-0a2a45030019-286bc910d113-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:49:23 +0100
Received: from SJ0PR05CA0206.namprd05.prod.outlook.com (2603:10b6:a03:330::31)
 by SN7PR12MB7810.namprd12.prod.outlook.com (2603:10b6:806:34c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 13:49:18 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::53) by SJ0PR05CA0206.outlook.office365.com
 (2603:10b6:a03:330::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 13:49:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 13:49:17 +0000
Received: from jim-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Tue, 10 Nov 2026 07:49:15 -0600
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
 b=aND7mpj7gDgIlje9hFQACScsqjQVME9OLze3rTlf5ZTBxYwF2u1kDrz7Pd/RqapdeMyP5BK4XWEuqw01dEtJ+/dp+C7cceWB2OiwOap4aYPZ2co/QHASYK40iGrv1p+lXJ2PhebmZ2v74kdka7estU9zlW2H5ik4Ern4VjkN6s4SvLtZrS3Y29zKYq8F6tQHjBetUvoHOPUxuhIZfyOX2ROC9DSJ0YGA45Wiv/U0+FXOK3Q3KsWPH7Yf9fDwKVP3T2l4lqjalEqXAZTSk26NGkfJsDEuCN8Y6AO3H+d7lyVdZebcNiruAhUatV/lUdEiP7uMMM3psrjwIqSS0uKtVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dE2zp+rFWGkRR9tJlzJkOjTI0CowSUW9LQLrai0vfs8=;
 b=D+zMvwabVpONebjdKm7Nm86/9c/EC2+IbrPkqBoUT3I2vtOSUVSdz98IQPR+OAWeipFLsAxeFsB+JDaLsBRqnFHDN5sahG8LgDDZyool7rGstS2lFi25I8273y/aYEqmPPmBkFQLUH/VaiD7x50XLkRWhATteRA81hJS0EepZsrlw35mXnp9kDTf9xOv6e1KrxwS6h21gPt5F7rfdCcanPZp9VrUjIvyS9L2JxGC66TgYAenUUMyBQI+PFosU3r/i7bFQXlebjV3yf0cKCijeHv/xupwdbSeqCIL5mJ035clPpckiKRY8QLxHNCnibw4KbGdH0tbNuRp57jMDLUpCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dE2zp+rFWGkRR9tJlzJkOjTI0CowSUW9LQLrai0vfs8=;
 b=5UOj8L/2Fbp3Ru4xZjPgPwlL6AUg3bRavnl43LYWywhLkbK7HZS5vSX2XWGzdTTYDW42xYA50kdZpJfXobeFDrrPvaUQjiX7YFBc9e8Y5fACG8IlEBbgGIrvcE5iy29P4yYYZ9cuBpUfoRBDSv7Q6JFvTcP5C+ILEf+/GZpJiqA=
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
 Vetrini" <nicola.vetrini@bugseng.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Shuaidong Chen <shuaidong.chen@amd.com>
Subject: [PATCH v3] automation/eclair: deviate R2.6 for the x86 emulator
Date: Tue, 10 Nov 2026 21:49:02 +0800
Message-ID: <20261110134902.2891528-1-shuaidong.chen@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|SN7PR12MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae757ae-0f49-44c0-3882-08df3f316a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|11063799006|56012099006|18002099003|6133799003|10067099003|261009223027099003|261102123227099003|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	264Yq43Nl4pYacNHe7wvkpNbz4aV6MtY78+ah+4pf/EKiOWYoJ3m/29FLQc61/18BpKeF1KOlev/IxutIQz1qWf6S72U695GK35CE6/c3vx/MmZVyHFoMNPP5PQBMFhzqvdv8YtWEGag2kVxKy1mrlnY7aoxLhyj11E1Ql6/vrRRxVN0vz+2oS9eSsTWOFkV2c1dKlfGmHeZnR4DmmNFRDRqlUyfePkHQLMkSq9ienwqOmtXjqq1GdwpvlEn6v0RFnHW+kXJYDfMfc+rYaPktArgs3WAjb0EfupWsgtxzIRP9DnlgfsrA2UMFSU/XlJqMaeN2FgU/VwQhAOQBiZsRq6fAQDbKQ/fRylqdud+yQmIp64I4mRuhnhtYYWZq3npERBRp8qmX+9WQkk2zWubOMcom5N2QQ/uVMTUIRINZeIpFRu9A2EVScqf2r3GS4eLh/VPjDwPSdQBV3jIGvWv4qBVGvTb+fjN92MGtv3bQ9Jm5DKGP2WM3MXmGwpIAaslPWznW4jn8WqyOiSJZYMqbqqTOZ87Vm898+mhCptqqAEPUuwsLZAwj2NT5CRr9yW4dx82wg9t07Lzw7wQvjbW/PA2p6lE2jczvlAV6rcqfHORHFnqrc9GfG+mKIrOytAY5c1ZeC1W1OjUfyptUtK9wICzcYvxk/GrX4qBktueeos66iXscn6DtrAhK/pWEzefU8nBpK1nZrfdbxZ9s9F+jQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(18002099003)(6133799003)(10067099003)(261009223027099003)(261102123227099003)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LcUwnrY2q1qWhT8ZtLwc0ulU/+X58POUamubQ4zwoY5MZ7BZPftRYkB+pvEPWsKrSFaib1xks+X8wAx1j29QQoqJIXmY0QGTBeCEgUBpjXrvgy3vXeO0ooeAlMSM8Yc3IGzw7hmgCejvJLLUSW+XVYbfMtnZ82CWcZ6O4DkMA312XB9ph2Uu1cS3789MQLWfab+GUcjYZSh34NvHI2MaaQCYU1eMvNtP7wgHcv9NOQ+TzLKBQk1axkN7E4bcOqo2Yh/GVn+T7jpgknmxcivbHsGpGswG9T/xCXp94mdJvy/18WAx113uPz/3zOIGkgdmAk/FnLbh9o3n7ti54V4p8yBUAMVRQoog9//jOZL6YVnKiW9M/MRCbyigD1sUAX/BSQcno/r1Gv2iJPItD5PzLzdDpyfuGGbd+ZZv/XNUoKUTBPpJrZFtWifyKcRhyPVp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:49:17.8533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae757ae-0f49-44c0-3882-08df3f316a55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7810
X-purgate-ID: tlsNG-33051d/1794318564-75EFF4E9-3000DE17/0/0
X-purgate-type: clean
X-purgate-size: 3067
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MISRA C:2012 Rule 2.6 (advisory) states that "a function should not
contain unused label declarations".

Depending on which parts of the x86 emulator are compiled in, some of
its labels end up with no goto targeting them.  For example, with
CONFIG_HVM=n private.h defines X86EMUL_NO_FPU, X86EMUL_NO_MMX and
X86EMUL_NO_SIMD: the CASE_SIMD_* macros then expand to plain labels
instead of case labels, and the gotos to several hand-written simd_*
labels are preprocessed out, leaving 91 unused labels in
x86_emulate.c.  The build already acknowledges this by passing
-Wno-unused-label for that object.

Annotating these labels would only add churn to the emulator.  As done
for Rule 16.2, deviate the rule for the emulator as a whole.

Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
---
v3:
- Drop the CONFIG_HVM=n specifics from the deviation text, as the
  deviation itself isn't limited to that configuration.

v2:
- Drop the __maybe_unused annotations (v1 patch 1) and the CASE_SIMD_*
  specific deviation (v1 patch 2) in favour of an emulator-wide
  deviation, following the existing one for Rule 16.2.
- Trim the Cc list.

 automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
 docs/misra/deviations.rst                        | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 296340bb4c..12afc758dd 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -55,6 +55,11 @@ removed by the compiler, the resulting slowdown is negligible."
 -config=MC3A2.R2.6,reports+={deliberate, "any_area(text(^.*__maybe_unused.*$))"}
 -doc_end
 
+-doc_begin="Depending on which parts of the x86 emulator are compiled in, some of its labels, many of them generated by the CASE_SIMD_* macros, may end up with no goto targeting them.
+Annotating them would only add churn to the emulator, therefore it is deemed better to leave such files as is."
+-config=MC3A2.R2.6,reports+={deliberate, "any_area(any_loc(file(^xen/arch/x86/x86_emulate/.*$)))"}
+-doc_end
+
 #
 # Series 3.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index bee4686675..7b983db264 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -116,6 +116,14 @@ Deviations related to MISRA C:2012 Rules:
        such labels poses no risks.
      - Tagged as `deliberate` for ECLAIR.
 
+   * - R2.6
+     - Depending on which parts of the x86 emulator are compiled in, some of
+       its labels, many of them generated by the CASE_SIMD_* macros, may end
+       up with no goto targeting them. Annotating them would only add churn
+       to the emulator, therefore it is deemed better to leave such files as
+       is.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R3.1
      - Comments starting with '/\*' and containing URLs are safe as they are
        not instances of commented-out code.
-- 
2.34.1


