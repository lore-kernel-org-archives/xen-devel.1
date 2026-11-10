Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83C7606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AwUtUneZ
Received: from list by lists.xenproject.org with outflank-mailman.1480691.1684459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQg2m-00076s-0X; Tue, 10 Nov 2026 07:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480691.1684459; Tue, 10 Nov 2026 07:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQg2l-00076l-U7; Tue, 10 Nov 2026 07:13:23 +0000
Received: by outflank-mailman (input) for mailman id 1480691;
 Tue, 10 Nov 2026 07:13:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xQg2k-00076G-Pd
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 07:13:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQg2k-004xNd-66
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:13:22 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af2c407-e002-0a2a0a5209dd-0a2a4503912c-16
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:13:21 +0100
Received: from [40.93.195.55]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6af2c410-fae8-0a2a45030019-285dc33787b7-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:13:21 +0100
Received: from BY1P220CA0044.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::10)
 by PH7PR12MB9102.namprd12.prod.outlook.com (2603:10b6:510:2f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 07:13:16 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:59e:cafe::15) by BY1P220CA0044.outlook.office365.com
 (2603:10b6:a03:59e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 07:13:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 07:13:15 +0000
Received: from jim-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Tue, 10 Nov 2026 01:13:00 -0600
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
 b=SGP7wDfWA/kMLYjURGFPR1C6X56HgSr99gBJOG3kRgAbHXPFSPBOYbxtbgRzd3Bbsrw+zDSdwS3KB+vV+G9E/om8UtBxRLCkatojh8m3D4sWBjm+87uTh+aeSZPT2ImMD3Noklp1FgNB5UyiXBFBO145lAnkD/1/KUGtQZhKZ+wuFAkBBCg8SDnfi4M4ke8mJwDiMyPX7TVOh0DLlgeVRDZN22wR5Dynusmyqg8gTwCzoMkwab2lrYwyZgXtizowW/fRYUIpaVmhO6UhcySzUBBPMtjUPxDvlTFTqv0/3sC0PtZlBfNga0Mil9PzukVXzeBkMeUqJ3VhuhjoXy8+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pdl88cKj8eE4YyVdxLsTs8gNxyGygoBD5SWqFeWofUM=;
 b=ZaT4AOhC84f5kRRuYc7QyUryQgOH2Slj5HRpT9N5sAaYUZ0zCAFmWOLO+NBcyA4/U19zmhfb9HSZB0nVKU7LtHlI4uX0ZDenaWzAHGSE+OZjJ+q8dNAGZZ/mXNdgMPIS7PvorCDTVgPZYzw9OYO/jJD8gOARkpGdz4AOkrmItzzINpzuRjfQH6SW356OM9YzAUW2exrSzgXHtYorswUOQ2AVIwyr7wN8rnLAb1j6MRqn5gQthoUlE9QHsb2YqPCtBETKhJ2YR4ob/lRZ+A1dbxxl27uZG3Vww1Zn1y3v4V37/0aX3JOSWFYlXeX6S0L+ApsIHPeA6ujqUpWt3TcYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pdl88cKj8eE4YyVdxLsTs8gNxyGygoBD5SWqFeWofUM=;
 b=AwUtUneZMMUBJqMBg2bnbf1kHaC1ab+iPhriwLq82v77bk5CCwwKdTnsKUDh0xG4rnJyE3WliU9qfXtkyphBe890/4NcHoemuzmDaZNeF0I0vc3IbKQtWec1hSO67r5daiCWNNrbCFZb+4wOhhntBvTbSyDvyq39d4HFuQCTDiM=
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
Subject: [RFC PATCH 1/2] x86emul: mark the trimmed emulator's section-internal labels maybe-unused
Date: Tue, 10 Nov 2026 15:12:30 +0800
Message-ID: <20261110071231.2888628-2-shuaidong.chen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|PH7PR12MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: 71bd7eff-e98d-4a47-f5f8-08df3efa170d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|82310400026|36860700016|56012099006|261009223027099003|11063799006|261021121427099003|261022105027099003|261021123027099003|261026140227099003|261028144727099003|261102123227099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yWbPfqI2CsPNMPzH4XDd6NNB+OkqBoSnoN8XxZeQ8KMVbMWJ1McPF1kvj/adCdju5HsZlnldlhuNRFCu0hv9nNIRYdBC7r0JYy/V5f2XpWcC6sIVZ4HesVqSCR5WcQg2lPbF5VnxaCgT4GHiP2herk8nC7JEqF7rmIVC2vS11hJ7JBAOeZa2Ja2dbPNBT6WmeqCJ7GQ0uMAOVlvQlxSEAnBFXYKJyoh5WX21V6tADc1KT0FHHWeBb2gICKpx/uqGhjO+DOX+Yd/9iI/vVBh4ixrbtufzXMUYvQ7yoAduzOVThXX0wA1BA52hUeXDqgWKle6Cj5BQs/k2rsuG/4Ak0iZ6agi7TxD/oFt3JA20xyv/WKyDAItB/6vU+fmf+ux2Jm1aNsQVuWjY4072MYNgM9X5/hY447Evsd0aqAdMY+ScQzsCNyjGs8txYpva7h7F2Q8MGB1siGTGrx1rikaq6u1sEGYnJM+RRTyGhgL3FFovikxRk0mx4zH/sImG6B7Ma/MmBMTYOsIuuii9fpvUGCbpnwsRE/cOqgCT/hCow81KCC2g/maIQXvmNfn23hiDHKQuALVKIIN20enxPEuO6gznVWxgayhEZsKe8tB6MuiGOvj0ybWgRNBRClGCIdlhIEx1Aod81freUURJ3XoblpZm4uhwV1mrYbOVG1nma9wVpfFtkzeuL75iXB5tW4W5dqDZ8bg8V+jhZwjGcYzLxw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(261009223027099003)(11063799006)(261021121427099003)(261022105027099003)(261021123027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PlKeoi2ly0QImikU/K5P+ivyIz6+NsnsuESmLUTeErLSiA4XRY44KJnZQlfm0lN7nzQUss/EUtgCmSzW2Rgkw6WmXoU1h0rUEHWLSkLWz+HU6q1CgT7250l257n4u9FNFBkRHMIDdBdAp7LtQH+7fNt6XemO6UfHWpwKjqn75HJ85fCPlDmWo2gzUNq2RjZwHfvA8tayL8kImXF6SpD1I5pwSLVoD5MZGRoJSSgqnnm7XT7XNV9ZYTA97c/AmRKGc2no4AoFqmO9yxqXY4LHk3QvQcJmkeNKbjjdxcaBq51aS8oggHcqFcXKCUWH94CrKMMa6EMuiabUS+w11WGWea8Q4QSMspwn3G4dgsYjI2lliGD3br26lR8h6YMzzaai2oEO97mAlpMEBkeVVs/8+xrLaxZOKIVh/Ztx02WSbfJVr5wO32qBFTYEgfCJSIvS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 07:13:15.8735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bd7eff-e98d-4a47-f5f8-08df3efa170d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9102
X-purgate-ID: tlsNG-33051d/1794294801-776F34E9-D7E306ED/0/0
X-purgate-type: clean
X-purgate-size: 3938
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In builds where the FPU, MMX and SIMD sections of the emulator are
compiled out - with CONFIG_HVM=n, private.h defines X86EMUL_NO_FPU,
X86EMUL_NO_MMX and X86EMUL_NO_SIMD - every `goto' targeting
simd_0f_fp, simd_0f_xmm, simd_0f_ymm, simd_0f_cvt, simd_0f_mmx,
simd_0f_imm8_avx2, simd_0f_imm8_ymm, simd_0f38_common and
simd_0f3a_common is preprocessed out, while the labels themselves
stay.  They are unused by construction, which the build already
acknowledges by passing -Wno-unused-label for this translation unit.

Say it on the labels as well, the way the rest of the tree does
(unimplemented_insn here, done in blk.c).  That also clears the reports
MISRA C:2012 Rule 2.6 (advisory) - "A function should not contain unused
label declarations" - raises against them, with no new deviation:
docs/misra/deviations.rst already recognises __maybe_unused as the way
to express this.

No functional change.

Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index f168f3ebcf..8bafe6b308 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3406,7 +3406,7 @@ x86_emulate(
                                            /* vdiv{p,s}{s,d} {x,y}mm/mem,{x,y}mm,{x,y}mm */
     CASE_SIMD_ALL_FP_VEX(0x0f, 0x5f):      /* max{p,s}{s,d} xmm/mem,xmm */
                                            /* vmax{p,s}{s,d} {x,y}mm/mem,{x,y}mm,{x,y}mm */
-    simd_0f_fp:
+    simd_0f_fp: __maybe_unused;
         if ( vex.opcx == vex_none )
         {
             if ( vex.pfx & VEX_PREFIX_DOUBLE_MASK )
@@ -3416,7 +3416,7 @@ x86_emulate(
             }
             else
                 vcpu_must_have(sse);
-    simd_0f_xmm:
+    simd_0f_xmm: __maybe_unused;
             get_fpu(X86EMUL_FPU_xmm);
         }
         else
@@ -3426,7 +3426,7 @@ x86_emulate(
                 d |= TwoOp;
     simd_0f_avx:
             vcpu_must_have(avx);
-    simd_0f_ymm:
+    simd_0f_ymm: __maybe_unused;
             get_fpu(X86EMUL_FPU_ymm);
         }
     simd_0f_common:
@@ -4147,7 +4147,7 @@ x86_emulate(
                                            /* vcvts{s,d}2s{s,d} xmm/mem,xmm,xmm */
         op_bytes = 4 << (((vex.pfx & VEX_PREFIX_SCALAR_MASK) ? 0 : 1 + vex.l) +
                          !!(vex.pfx & VEX_PREFIX_DOUBLE_MASK));
-    simd_0f_cvt:
+    simd_0f_cvt: __maybe_unused;
         if ( vex.opcx == vex_none )
             goto simd_0f_sse2;
         goto simd_0f_avx;
@@ -4354,7 +4354,7 @@ x86_emulate(
         if ( vex.pfx )
             goto simd_0f_sse2;
 #endif /* !X86EMUL_NO_SIMD */
-    simd_0f_mmx:
+    simd_0f_mmx: __maybe_unused;
         vcpu_must_have(mmx);
         get_fpu(X86EMUL_FPU_mmx);
         goto simd_0f_common;
@@ -4607,7 +4607,7 @@ x86_emulate(
 #endif
             if ( vex.l )
             {
-    simd_0f_imm8_avx2:
+    simd_0f_imm8_avx2: __maybe_unused;
                 vcpu_must_have(avx2);
             }
             else
@@ -4624,7 +4624,7 @@ x86_emulate(
     simd_0f_imm8_avx:
                 vcpu_must_have(avx);
             }
-    simd_0f_imm8_ymm:
+    simd_0f_imm8_ymm: __maybe_unused;
             get_fpu(X86EMUL_FPU_ymm);
         }
         else if ( vex.pfx )
@@ -5683,7 +5683,7 @@ x86_emulate(
         vcpu_must_have(ssse3);
         if ( vex.pfx )
         {
-    simd_0f38_common:
+    simd_0f38_common: __maybe_unused;
             get_fpu(X86EMUL_FPU_xmm);
         }
         else
@@ -7206,7 +7206,7 @@ x86_emulate(
         vcpu_must_have(ssse3);
         if ( vex.pfx )
         {
-    simd_0f3a_common:
+    simd_0f3a_common: __maybe_unused;
             get_fpu(X86EMUL_FPU_xmm);
         }
         else
-- 
2.34.1


