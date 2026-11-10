Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D0606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 07:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Rqilw0S3
Received: from list by lists.xenproject.org with outflank-mailman.1480689.1684450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQg2V-0006pv-Ov; Tue, 10 Nov 2026 07:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480689.1684450; Tue, 10 Nov 2026 07:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQg2V-0006po-MG; Tue, 10 Nov 2026 07:13:07 +0000
Received: by outflank-mailman (input) for mailman id 1480689;
 Tue, 10 Nov 2026 07:13:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xQg2T-0006pi-Uf
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 07:13:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQg2T-00BiNw-0q
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:13:05 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af2c3ed-e002-0a2a0a5209dd-0a2a450590f8-36
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:13:04 +0100
Received: from [52.101.52.29]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af2c3ff-4cb1-0a2a45050019-3465341df99d-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:13:04 +0100
Received: from CH0PR13CA0001.namprd13.prod.outlook.com (2603:10b6:610:b1::6)
 by LV8PR12MB9452.namprd12.prod.outlook.com (2603:10b6:408:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 07:12:59 +0000
Received: from BL6PEPF0006C3DB.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::65) by CH0PR13CA0001.outlook.office365.com
 (2603:10b6:610:b1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Tue, 10
 Nov 2026 07:12:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0006C3DB.mail.protection.outlook.com (10.167.249.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 07:12:58 +0000
Received: from jim-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Tue, 10 Nov 2026 01:12:54 -0600
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
 b=oxcA/9RL4WZIvrcMlJqYI+NLv5oyCmabtQcZuLMYsHN6wosLMQ+wXxlF9wNWuAHAHfvfy5jsMMx+h6kpt5pXN3LbwMt1GhAwTcR6ztzYvfaiRlLJk7k5vPeT3yZdihjU8uqWOvYpgnAxXc5onWEuY+JEESgMl7ER5u/6TaaqNh0eOrbRHZEBigSzq/IHa5xdO4Z0datEZDHx5uwhz7AAcT8vnkpjvjE6Em038k8+45eziJyRt512vmRDP5pKnXbADGPmzz/rEcIxhYLzfpne5GqEuEu70zZZqqA110ryLRmvJ2t9TmOLbPl+SGsYJUfVMqytibHBWrajelz45BfqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lS4YaiSLDsQ4dKUlA8GrxsQ8fVuUXXvyhSkID1NItz4=;
 b=GEeKKEGMmQ2411dx/AJUSIoPtrpiWhRx11/QPBfB+zFnhqfx43U0l68ZMCp4nCCVzKAc8HU75KnKdrzDc7OvKtPMlzrLDJpdXTgNw1XlcpB2yTpL6eLZ0Jg2qroKsZyoIXoza/WhvzU/U9+VM/K6amqaNNRGhmY6YsrvboKiJlpL33Ek+zJ5PDngbUF3h0mtrgLOIEAsoUOvBxCXfb9PaFbUUhWZ5T3utL5x/LpqYqLAgHAD0HhrkmPJRE8vlgF6GSgQOznltwh4QG/9psdveiN/i23oRbzL3ydE/zrBoPjdElDMzlE6OLMdGV347pS4OWSax+U2nSf+kfoxevGjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lS4YaiSLDsQ4dKUlA8GrxsQ8fVuUXXvyhSkID1NItz4=;
 b=Rqilw0S3qjcc7e7/0gXELjmhRnIhLZyA3MBqYnpEKxYKRYFPnwlYpsXxJYXBgMxRPJ/oSgAq4GXfRvKfKALH4CWPz+gT5zsI2ZgaISRbiXNpHz+dtxCYzuCM71Q2hz6qWYFkLYopaJVob5UgDwAIV5IFQW5TaIDlgtO33v0vKKo=
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
Subject: [RFC PATCH 0/2] x86emul: address MISRA R2.6 in CONFIG_HVM=n builds
Date: Tue, 10 Nov 2026 15:12:29 +0800
Message-ID: <20261110071231.2888628-1-shuaidong.chen@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DB:EE_|LV8PR12MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 81755515-d388-47d8-515d-08df3efa0ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|23010399003|18002099003|6133799003|10067099003|13003099007|5023799004|11063799006|261028144727099003|261102123227099003|261022075727099003|56012099006|261022105027099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|261009223027099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	pF8d9ed4D6gi3ttIe12quzw3wDAo3C2uWrrusv7cKfD4T1sgt7GVR0shVIwDo8TlZko6mJMFGpNhXWLCrxPSWdmVQHVWUhQ+5Ob8ESk4MnFhfVjOn4K7j2o7rIVw3Oa26l38HKzl7plhv6p1XlTC1ixh/MF6zL4C3DJyDDQIM/Bwd62YnOtXbuPXhytoO3fxZtWbFcU2AjccUzbZkOjJCZSWzVAhrnoXQzx02xu9p2nQ6j/D0IHEzhnbqxmyZrH63cpxcmVnaniIsVTltXGH+cNEws/sWD3JxQ8hsjbkRXZya/sH4de82/jaER+Svna1K8jqFnNozPZVnhthuWUmpG/A10wl/wT46WYciwEywFEVGG7f/SCEuLPilxR/3vSH+oGBve8so8Wo55RN2hbuVSNSu0qG4xYcKqfw3OtbMDIClfmOoIWSGmIz0m/l7ZvYISXvSSBg3DJkAKfXV3DQ1X2LrdqNYkA34sdweJg0mc/SD+oIDKOHGPITKHMdTaoMHGOvDO6il4Nu2ccZhPsZEKuneB1PZa3AJwnfK1ADPScCyQcsWniH6cWgWM2q9dH8LbKAOUL0JQKOlnlPkGLc5ObWHRx8TasbYegRQr/QisEBSz40D5hkzfflTi57rmmolKAkAsp0TcSqmSaY0IEMYIAO9jX3VhTq+p1Mshaz9L0mrc5gjp7ekkAs4iQJCuxeR46xxKcvxt/LmE0qGGKS/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(23010399003)(18002099003)(6133799003)(10067099003)(13003099007)(5023799004)(11063799006)(261028144727099003)(261102123227099003)(261022075727099003)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ET4J+4nXzPLCfTF5jwcfxXRnwdQ5/aQaAiZXw1rlnNu11VdbMUXdxcmgE7xXK43CWtO4ydxEG5od/UoXoQmTcGobzM3E02GmkYBEsx7ikzEzLppoCorPwE2U1tz3VHIEJirQZ47JxNh/92JC9YMgWrZ8eqljGZ0nW7wns4AijLlUaJp0FMpG2rdvCXGofouAooMegE3Csabx2hq/XMxmpufLXFIREr/A4I+uCXs3UT4AoFziUwt1YhacbAVNDwDuj44HhKNZRHsx/yIIp0Pq32K7QlXJRF/ZhMdgl0rq03JO4TJSkbm5yVCKhJrREHF1T8JiaYXtkAyOCAhx2AOkJLZqP3HNi72Eb4ldj3JPRwLU+igSqpfKSmzAbVPwL3LzjTkUXotTl1MdRKqbOj3Oo+b6sZRA+y1n8RbBEQKrNrwwDU5USzDxbLbzrO5vb6ZG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 07:12:58.4564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81755515-d388-47d8-515d-08df3efa0ca8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9452
X-purgate-ID: tlsNG-c201ff/1794294784-F50A22A1-8B54C0EF/0/0
X-purgate-type: clean
X-purgate-size: 2145
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With CONFIG_HVM=n, private.h defines X86EMUL_NO_FPU, X86EMUL_NO_MMX
and X86EMUL_NO_SIMD, and x86_emulate.c is left with 91 unused labels,
which ECLAIR reports under MISRA C:2012 Rule 2.6 (advisory).  The
ECLAIR jobs in automation/gitlab-ci/analyze.yaml all build with
CONFIG_HVM=y, so upstream's scans don't show them today; they surfaced
while analysing an HVM-less x86 configuration.

The 91 labels split in two groups:

- 9 hand-written simd_* labels whose gotos are all preprocessed out.
  Patch 1 marks them __maybe_unused, which the existing R2.6
  deviation already covers.  No functional change: the code and data
  sections of x86_emulate.o are unchanged.

- 82 labels produced by the CASE_SIMD_* macros, which deliberately
  expand to plain labels instead of case labels in this configuration.
  ECLAIR reports them at the macro use site, so they cannot be
  annotated in the source.  Patch 2 extends the R2.6 deviation to
  them.

Reproduced on current master with clang -Wunused-label on a
CONFIG_HVM=n build: 91 unused labels without the series, 82 (all
CASE_SIMD_*) with patch 1.  ECLAIR on an HVM-less x86 configuration:
before: https://gitlab.com/xen-project/people/amd/xen/-/jobs/17763605066
after:  https://gitlab.com/xen-project/people/amd/xen/-/jobs/17764580898

Sent as RFC for patch 2, a new deviation for reports upstream doesn't
currently see:
- Is extending the R2.6 deviation acceptable here?
- Alternatives considered: folding the ':' into the macros still
  leaves the labels in place; expanding the macros to nothing makes
  the code behind them unreachable (Rule 2.1, required).
- Would an ECLAIR job for a CONFIG_HVM=n configuration be welcome?

Shuaidong Chen (2):
  x86emul: mark the trimmed emulator's section-internal labels
    maybe-unused
  misra: deviate R2.6 for the labels generated by CASE_SIMD_*

 .../eclair_analysis/ECLAIR/deviations.ecl      |  4 +++-
 docs/misra/deviations.rst                      |  9 +++++++++
 xen/arch/x86/x86_emulate/x86_emulate.c         | 18 +++++++++---------
 3 files changed, 21 insertions(+), 10 deletions(-)

-- 
2.34.1


