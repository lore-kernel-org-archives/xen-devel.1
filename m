Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC85606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gem1lHvQ
Received: from list by lists.xenproject.org with outflank-mailman.1481795.1685706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlqX-0000lH-2b; Tue, 10 Nov 2026 13:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481795.1685706; Tue, 10 Nov 2026 13:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlqW-0000l9-Tv; Tue, 10 Nov 2026 13:25:08 +0000
Received: by outflank-mailman (input) for mailman id 1481795;
 Tue, 10 Nov 2026 13:25:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xQlqV-0000l1-9G
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:25:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQlqU-006E2S-Lm
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:25:06 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af31b2f-8faa-0a2a0a5109dd-0a2a450c93ce-14
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:25:06 +0100
Received: from [40.93.201.17]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af31b30-f479-0a2a450c0019-285dc91189dd-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:25:05 +0100
Received: from CH0P221CA0047.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::28)
 by SA3PR12MB7783.namprd12.prod.outlook.com (2603:10b6:806:314::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 13:24:59 +0000
Received: from DS8PEPF000000DD.namprd05.prod.outlook.com
 (2603:10b6:610:11d:cafe::4c) by CH0P221CA0047.outlook.office365.com
 (2603:10b6:610:11d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 13:24:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS8PEPF000000DD.mail.protection.outlook.com (10.167.23.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 13:24:59 +0000
Received: from jim-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Tue, 10 Nov 2026 07:24:56 -0600
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
 b=gGNEZ3YYW0IRABdlmxXA1GzMAsKLE7xorH9D4YK8BLF0560QQYwU7psq7zQZHR5VnDXFDVmQJ7r5KHendegLG/j12cj1L1UfYXXRSxHpf9RtwdB7JUY7OB34xpsCCxGVIDG0h/rojpA7AvaWZoVK4cgatvROF4GAcXhOuYS4K4HrA+PsnimzsYV43L4trm+gWztSKwCNsbvJnMJb7TGMCleF21ILfXSCcOZynHACwciDtcUSkWSzhd8Z52/9Otb2irpkHk8QvsqS2cBOlv+V1jSHoTniRw+vNdG7f6YDfmkJQlCzB8YNKeRl4zS1HirRXvSTE1SFSTK3rk+0SHLyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PifvduunsXrPJFSN7G5FFSDvXopwr8oe73duphPpOT8=;
 b=bmVzGAQ+xNZc/h2JsqK+p4ResFliyaqLH8grYnSbb+1574Bd1riEismwro1FujzVSzOfwBEvJus1FPPFRWgI2h3ds4XN/dJjKdcii1KupDvMhwrW3KpXHzStGZeLNtUQIhS7Y/Szuz52GIqb8bfYUdtW+Te5jnD9pFWoy7HujhaSjhtm53OF4lnykQsVbslzGD+W7AYa9d9/Aof/Af5ltF81xjEGItXsSB8MmAi4ZuABuTPKy76DQlt2aiFdGcvqSj9Q2Th2G/xWjSGk0LFXCPzo3roXIe3PtXM4EWvGESriWWjTJGUUXTzFf7Qqe5R6CPG0yCefUzUD/dUSx8tJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PifvduunsXrPJFSN7G5FFSDvXopwr8oe73duphPpOT8=;
 b=gem1lHvQ4DBvBgsrtg0rA19HhtKg8+rO14BdPmZbfgyr4OCT8OAVjt4rKB1eXGmtTG14f+CE+qQwCbIOwJnIuvhuY+Txkvrx1qyRCawYWkt6f70CrYKqKdVoBAUAaQTNBF+MUH3GNf+5gRtaUE62NgR5qOt5L+r3WYv2mLnOJFA=
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
Subject: [PATCH v2] automation/eclair: deviate R2.6 for the x86 emulator
Date: Tue, 10 Nov 2026 21:24:42 +0800
Message-ID: <20261110132442.2891216-1-shuaidong.chen@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000DD:EE_|SA3PR12MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: b59184a6-8fbe-49bf-3d6a-08df3f2e04cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|18002099003|10067099003|11063799006|261009223027099003|261102123227099003|261026121527099003|261028144727099003|56012099006|261022105027099003|261022115727099003|261022075727099003|261022113327099003|261021121427099003|261021130227099003|261021123027099003|261026135527099003|261021135927099003|261026140227099003|261026130827099003|261021133027099003;
X-Microsoft-Antispam-Message-Info:
	dO0cALOql3xwkuMuI7RafdSTX/Dp04NUBeLsyhF/+VKhc4MhATQhcw9x7vDCmC+v+r54Y/qr4U4PWzKTM/HDHDCEwL6eSjxqbT3VTMgSAmWBLLFx2XQ84ZazHXBycJqiHUZMM3KQmI5q32AHfXr+A+KjTxGZLwKNh9nfsAlrX1uXHrXFDN2iyEXvd45ykNKoE6y9jB/+PZ4kbb1CKgrBIKEdwVl9pIR2MJmNlrRnjFu3BSkituW3pp4gI6U7hreRpTNFWDwU8A4f+QuCCa4Z5HEIvf+L4TpNevcjHWlUDdb3cQ3y+UuMRA11GRzvtlZMju+kER3+S7STeY837Bwz/c0PtLv57EBHX64jDmQe8TxhF+WAv9xDLpiSkZu7ttg4TS27GplxccpAaoDsAhAl2A2wc7/DfWCbSwnFeshah3G9GqpfESLdQnwNQSrG0Unozyuo33oNwM9G5uxywYxkYNK+hOOr7oHew/SQvoo3AjjgjR8aPY5/oFN3u4V7fXWO4hv/qrN8LdpDYtKfOONXXm72VNcF3c8RHo8/MwyamawakNRP5kcN3QTFt2O//gwamQAkigfsgOWp579FbpHf/UTc0Eiijp2vKg5Na5G2sFhF204iEG9Nl7VTjswnc6DCq1dVMBBzBctXud369PdT9wemc+QkBH581l6Biv2gH8EJId8VXlWF2nyWWgj76CT50Jpnpy68K3vi0mvD7HnXpg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(10067099003)(11063799006)(261009223027099003)(261102123227099003)(261026121527099003)(261028144727099003)(56012099006)(261022105027099003)(261022115727099003)(261022075727099003)(261022113327099003)(261021121427099003)(261021130227099003)(261021123027099003)(261026135527099003)(261021135927099003)(261026140227099003)(261026130827099003)(261021133027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GUgmeGwJW8ZcKkiG0cr99zTkrGMBCf/zbuimHNM2eVL2E9MwgJBLyBi20BC+eXgcgRZKH/KULaoqlcGug8QVF2iiXEde5Y2yAFEAwQ6gUKRtZTqsFbh9F26J1drRpWTphq8uQFiTxrxaDIDpTDAccZnvijBHYkbgdfMErcthpyF3202qeRwVd+vO3hnQ2sp6ydI1w8iYscEzw4gDd1qzkjt8Hy0YboVz3zQmnHlb/dxjQAAwJvO6qyxGolmFPWjViToQyfqBxjGfhA23HVpxPT9/IAt232gFlSLyfcHFBqXOF5GadTTIWBOSlMSDbXBUxyrJpoxOy5uvnhJZjvQEz7LXBeSXoSVbZu0j8c3DkvrDmNgqosl2LkB8nNXp6/qhLyTk8EeJ4H3Ii9hLxM2Ye9tu2Kyq/HcHqsHuVN+bI8O0U0x2cRyGBFCte+Tglrmg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:24:59.0627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b59184a6-8fbe-49bf-3d6a-08df3f2e04cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000DD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7783
X-purgate-ID: tlsNG-d25034/1794317106-50520A5B-BD9272DE/0/0
X-purgate-type: clean
X-purgate-size: 2788
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MISRA C:2012 Rule 2.6 (advisory) states that "a function should not
contain unused label declarations".

With CONFIG_HVM=n, private.h defines X86EMUL_NO_FPU, X86EMUL_NO_MMX and
X86EMUL_NO_SIMD.  The CASE_SIMD_* macros then expand to plain labels
instead of case labels, and the gotos to several hand-written simd_*
labels are preprocessed out, leaving 91 unused labels in
x86_emulate.c.  The build already acknowledges this by passing
-Wno-unused-label for that object.

Annotating these labels would only add churn to the emulator.  As done
for Rule 16.2, deviate the rule for the emulator as a whole.

Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
---
v2:
- Drop the __maybe_unused annotations (v1 patch 1) and the CASE_SIMD_*
  specific deviation (v1 patch 2) in favour of an emulator-wide
  deviation, following the existing one for Rule 16.2.

 automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
 docs/misra/deviations.rst                        | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 296340bb4c..4679e8b250 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -55,6 +55,11 @@ removed by the compiler, the resulting slowdown is negligible."
 -config=MC3A2.R2.6,reports+={deliberate, "any_area(text(^.*__maybe_unused.*$))"}
 -doc_end
 
+-doc_begin="With CONFIG_HVM=n the FPU, MMX and SIMD parts of the x86 emulator are compiled out, leaving labels with no goto targeting them, many generated by the CASE_SIMD_* macros.
+Annotating them would only add churn to the emulator, therefore it is deemed better to leave such files as is."
+-config=MC3A2.R2.6,reports+={deliberate, "any_area(any_loc(file(^xen/arch/x86/x86_emulate/.*$)))"}
+-doc_end
+
 #
 # Series 3.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index bee4686675..7e70b2b79f 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -116,6 +116,14 @@ Deviations related to MISRA C:2012 Rules:
        such labels poses no risks.
      - Tagged as `deliberate` for ECLAIR.
 
+   * - R2.6
+     - With CONFIG_HVM=n the FPU, MMX and SIMD parts of the x86 emulator are
+       compiled out, leaving labels with no goto targeting them, many of them
+       generated by the CASE_SIMD_* macros. Annotating them would only add
+       churn to the emulator, therefore it is deemed better to leave such
+       files as is.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R3.1
      - Comments starting with '/\*' and containing URLs are safe as they are
        not instances of commented-out code.
-- 
2.34.1


