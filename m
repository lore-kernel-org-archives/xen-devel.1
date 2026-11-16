Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA63606A333
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 03:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=r6VJZZ42
Received: from list by lists.xenproject.org with outflank-mailman.1490170.1691114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSnE0-000610-65; Mon, 16 Nov 2026 03:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490170.1691114; Mon, 16 Nov 2026 03:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSnE0-00060s-38; Mon, 16 Nov 2026 03:17:44 +0000
Received: by outflank-mailman (input) for mailman id 1490170;
 Mon, 16 Nov 2026 03:17:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSnDy-0005zT-J2
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 03:17:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSnDx-006BQi-HK
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 04:17:41 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6afa75c0-8faa-0a2a0a5109dd-0a2a450cdb3e-20
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 04:17:41 +0100
Received: from [52.101.48.46]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6afa75d3-f479-0a2a450c0019-3465302ec769-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 04:17:40 +0100
Received: from BL1PR13CA0427.namprd13.prod.outlook.com (2603:10b6:208:2c3::12)
 by PH0PR12MB7472.namprd12.prod.outlook.com (2603:10b6:510:1e9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 03:17:32 +0000
Received: from BL2PEPF000352D6.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::73) by BL1PR13CA0427.outlook.office365.com
 (2603:10b6:208:2c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Mon, 16
 Nov 2026 03:17:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352D6.mail.protection.outlook.com (10.167.254.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 03:17:32 +0000
Received: from jim-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Sun, 15 Nov 2026 21:17:29 -0600
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
 b=H2ENzn0uzCKGJfgUc6gpQEeZWLbVHIgv/7ZxfBi1WaSur4MyCT5HOUIiZqJ+qv/ONyGmgfutZRMVqbHBXMjulHT//6RINw5FVc16o5b1ASrLMdbQL+mgWGL5TOob5MebiQe6MudiggTkgHfgxtLN+xsyuPwiRO5ElfooCxk7Q3grY9fmEEj5UmNVSSQEIzdTT00N/jaeAS9kmMNv6HLlkarzzPvmSbcGabffoKK4xcfY9jalMteOdXIQNZ1T64xv6h69xaDfU96m2kvDY/HDxBOWvHfGSBqIrjeGLDQb/3N2sx0ZiVQ+pl9dLrb0hs0XUKQOq8Wy62D1Q+RplzBEIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucd07rmVnYErfUwBTYjCRUjBPlaiNUaasRVdAkcCz9w=;
 b=sg2gXG+SKdFHcShAWbqZJTOysa99lZAWpr4YO+BlB4OIAClful+HujSmfn9WcRhRx9pjuXTJ6RwYi3hUQya7uW8x4ix6aWteiO3c9bpWloe8DuMnzZgN+QOeSouRslk438sFGqRpdS/XLvdu6Tm5sYKfwtpb4TXml6tA2uthupH5anf8tFd85ep4VLWxMe2Tto7Tze7TYNECxoLTDLBt7rQmVb188dQ42DOBeVlMPuZ2NmT2p18r4kfT4k+8iClBY697fKcl50zaIWg/Ox6m8Xhc2I0FKCBbs3NplPkbmhhE4mHJywTiMhKHwwJX16Qz4+mAnm9IKIKg+PWhqR3FNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucd07rmVnYErfUwBTYjCRUjBPlaiNUaasRVdAkcCz9w=;
 b=r6VJZZ42fDp3H93PJ79BCfZzGlgJSwYCmkWE7/l7Un4K2XAyPaiBdJ6tSDFhN+Zx+Ozkucx+bvcqtIA/zcqcxZBhGbidJP3E2km81gEkZG2ElVjSyKHUEVFf0HZ3VotIN1F4r2JO5ug3jA8yudRU6JBvXeyr0EvmtSJ76I4awp8=
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
Subject: [PATCH v4] automation/eclair: deviate R2.6 for the x86 emulator
Date: Mon, 16 Nov 2026 11:17:17 +0800
Message-ID: <20261116031717.2958306-1-shuaidong.chen@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D6:EE_|PH0PR12MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e3de1f5-0bf5-4293-4636-08df4390272d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|10067099003|11063799006|56012099006|261021135927099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261026135527099003|261026121527099003|261026140227099003|261026130827099003|261028144727099003|261102123227099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Ii9oaK5U77jLf8o6L0VzmkosyVepeG59KsSCTSOldbGfACjm2o/AB4r/iWZ6xlAgcODqQW/GKpUPPVpToZD6QsMwDnj2cWrxWViXIS6RXhg+UD77N6T05qpT1hAJbnUUABYMeOPCilZMlPGg7LhA7OR820CX+eF7kVD9SkjQ73APEQiQ+0s9qwzywLuZj/iRHJ0TdnqZ4SRe4KCXsMvNAmAiV5l4Swv50olU0DCrLH+AyMAzvb5WSNIphi+9r4dtd+60eswW3bfpEJUpvngQwAkNJ3Y5uva/fWi45fYiqt2dw69mXwUcGOQ0FMeAIKrvWLGfjeu5n0JOLdDlvsToWBvOS1Zy92v0pCcqPnvUmoTu69UbsTnYqumjvu2Jee+FgeGE9ALgduhkopDGGE3TRVRDQKOb43FboGi0VBZFM2ElA5fWm94bpc7a7OhfuelzNPpyl0OEnFbEe6WwFsZt/Mc8KVFn5mqJCYw6hU0AozVdTe6fKIsmG4GI4raLk1la0cOPOXA58FrcmAmn2KFTVDLK5fF5LCfr2Ki5ymOGI8OjhZt6APRd2gXjoGR+ALXtqMWsRttc7/LEUM4k0nvlBeSuNUNwBwKvO7rkAzxgpuJurCdR8IwHopK/ATvPK/OXB74xvQIAgD9Cx/ch966g9j1F6Bxi9OHb6rcrnXHlricD3m89h9QPFNyeSUExP/zBIcNR8i4NKpAhvPOVYtd5kQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261021135927099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261026135527099003)(261026121527099003)(261026140227099003)(261026130827099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YpIS+zr1ncUsJahE/T/7TGJt1KSUu/WJvsMvLAV/CLfmvbHWeT0iBwa3p4NOJcj8AsWEk5DrjVhblTtKHVyhthDsuocaJTCVpwlc4lOxG5nkcjy1eRHrNwepY1KmSD3we7R7e9sB7Dd0imTo+nK9QMz8jybJqkhnws+fBstFdrlO/k2lrPYLZZzzIkA5khnjPy+rDur22dJqUz0YlO+fHmxGHKoOqSy5CsevtJJ54OXpjV4fr/SQU5SARExADk8xJ/MIFoiHA9spn2puIAFm6cKF4DWqtjwPS87PnYg6Ochhh2O0S8qxZ/OCs0twgPakDhm4aJqSwSYC18aQuze+GpkyYdIEHV05WiyFP/ZZdDXBXqCUUimVQOCdAidOpEGFLXRf+lwnnRBtfVNLZcBAd2MC090QQLNyCLfqfATzvo9v8HV42PE4jb2AUKP9TiAm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 03:17:32.1102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3de1f5-0bf5-4293-4636-08df4390272d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352D6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7472
X-purgate-ID: tlsNG-d25034/1794799061-036D6A5B-2D583CEA/10/78276251493
X-purgate-type: spam
X-purgate-size: 3813
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
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
v4:
- Reuse the existing x86_emulate file tag, moving its definition ahead
  of its first use.

v3:
- Drop the CONFIG_HVM=n specifics from the deviation text, as the
  deviation itself isn't limited to that configuration.

v2:
- Drop the __maybe_unused annotations (v1 patch 1) and the CASE_SIMD_*
  specific deviation (v1 patch 2) in favour of an emulator-wide
  deviation, following the existing one for Rule 16.2.
- Trim the Cc list.

 automation/eclair_analysis/ECLAIR/deviations.ecl | 7 ++++++-
 docs/misra/deviations.rst                        | 8 ++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 296340bb4c..d49af53055 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -55,6 +55,12 @@ removed by the compiler, the resulting slowdown is negligible."
 -config=MC3A2.R2.6,reports+={deliberate, "any_area(text(^.*__maybe_unused.*$))"}
 -doc_end
 
+-doc_begin="Depending on which parts of the x86 emulator are compiled in, some of its labels, many of them generated by the CASE_SIMD_* macros, may end up with no goto targeting them.
+Annotating them would only add churn to the emulator, therefore it is deemed better to leave such files as is."
+-file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
+-config=MC3A2.R2.6,reports+={deliberate, "any_area(any_loc(file(x86_emulate)))"}
+-doc_end
+
 #
 # Series 3.
 #
@@ -531,7 +537,6 @@ therefore have the same behavior of a boolean"
 
 -doc_begin="Complying with the Rule would entail a lot of code duplication in the implementation of the x86 emulator,
 therefore it is deemed better to leave such files as is."
--file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
 -file_tag+={x86_svm_emulate,"^xen/arch/x86/hvm/svm/emulate\\.c$"}
 -config=MC3A2.R16.2,reports+={deliberate, "any_area(any_loc(file(x86_emulate||x86_svm_emulate)))"}
 -doc_end
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


