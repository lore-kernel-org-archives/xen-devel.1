Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C2E606A325
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=HolKXiD1
Received: from list by lists.xenproject.org with outflank-mailman.1497891.1695930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKW7-0006Vt-5C; Fri, 20 Nov 2026 09:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497891.1695930; Fri, 20 Nov 2026 09:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKW7-0006Vm-2R; Fri, 20 Nov 2026 09:02:47 +0000
Received: by outflank-mailman (input) for mailman id 1497891;
 Fri, 20 Nov 2026 09:02:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xUKW4-0006VX-Ni
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:02:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUKW4-003Mcm-3k
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:02:44 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6b000ca8-8faa-0a2a0a5109dd-0a2a4509cd14-30
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:02:44 +0100
Received: from [40.107.208.22]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6b000cb2-be1a-0a2a45090019-286bd0169719-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:02:43 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by SA1PR03MB6419.namprd03.prod.outlook.com (2603:10b6:806:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 09:02:20 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 09:02:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJVIQdU+UxoZ5yFtHCgPKx4Ikwifs9iXof70s0T5CqnhGVxV6mk2uFbLrcmN2N2d+uTaCQhu0msWpYxqHQo6yyg0FZvhCGj6Nk2/8Y95depC8guUXa8T5lgZ4ucVRPXQCWrYHX1/+3luEUbZ1teHxn/q/lwqsWNjkgA2mLQPexz7g0L/PKrYjVbn/n7HJqhsqrjyAskbmJ/s0IdRcHqcWSN1Uwj1JGlYsaIDM2hVW75ZpEssN9Cn8N1OIg1s2oZoIm4Rs6Zv9EdzGe1MIv/IYTjJH0MExi+ogWi+gcR417YiIiAMj0CF0y6MiOQA3LOGJy6gqgZJy1JOdaFzIfRPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxXW2HUpvs5QX4GPROPRKxD07ArAj/dEkBBUcu/lCn8=;
 b=tPs5I/t7E7OuSlNoCDQ2Rc/6GBZluCXJ4RcuzEajCkpzLKiKWC4YJifIaiQAt44EnLW6lXlDnEwa1NvCkoKeUtG3+R2DxL1aCjZUTwVI/LCsZTmGKrnIp/+QlP9Kzwv7n6L15CXfO6u6eeOBkVeRbCmSvfWXog1o+fie0kP4UA73ypGlOrGYBpolMRxkFNqh/g9xhdx3ZmNG8hRwdLdVOwvMKYlGT6ULdQNZ9V02dBlRgb2EU0dtbTLyNOJ4cTn1xJ1/A+pZFivkWVqEPwqPWa17LU5hjv+SOmsgX8epJhZFj4PntxQWN7PdNsnfPZWf6n9Rlt8v5/J59F1w9qq65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxXW2HUpvs5QX4GPROPRKxD07ArAj/dEkBBUcu/lCn8=;
 b=HolKXiD1BEvyU/fj+8EBBh8CBiGFAe1fYXbc/FDiY19q5ahk6TiUKvtohZ3a6CaD5itwuPAylWl+9oB6FqrtYTRrcXLqlNSStKwlYnbUKL370CyERchtNwV4ft8bVsR5W10vfmO1OAwxLfUUEzBuTW1LVkwTnTMHWqMVcBeYn9k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stephen Cheng <stephen.cheng@citrix.com>
Subject: [PATCH v2 1/2] x86/nestedsvm: Record NextRIP with the deferred #VMEXIT
Date: Fri, 20 Nov 2026 17:00:12 +0800
Message-ID: <20261120090013.271926-2-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261120090013.271926-1-stephen.cheng@citrix.com>
References: <20261120090013.271926-1-stephen.cheng@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR0401CA0017.apcprd04.prod.outlook.com
 (2603:1096:820:f::22) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|SA1PR03MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f63bf8-91e2-4bb4-7094-08df46e4fc25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261022105027099003|10067099003|261022075727099003|11063799006|56012099006|261009223027099003|261021123027099003|261102123227099003|261021121427099003|261028144727099003|261026140227099003|261026121527099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	etvURuHoGsUqRO5LeduCj8AnMCkulBCsxQ1cjmyYDj2lQzhWgJcmHX6odPfQ5BlyopJoAsjntHknLSfIzF4tIB4Ynu9ZVdS23IYM1GjDIT+oBk14HzbfzMzcEU/n3t4j/YYWkJU9ZH8kLewNUJzR80ImeZY+FMIbthMO5hUbm+A1/c+SRHEyCQVt+RpnkrU5KViOocAgZgkzOXG9AyJvmTRS570p24gtG+1XOw4oxiJJ9IPKWtU8fXia/eweiHoxa57i/4ToCm203wcHSgOWsXurijNxzVcBW/iiOJsRVIW52TPOBo07rvPnyKgMIELNV0/yA59Es8VP6nY2ne091W3vYfVn1YjtIq5wEZoGQQIHijMVEP6jwLTKbE9YFid67L7jPSZwquAj13wYlcjhpadjgI/flTSiaSdTyfFEUuYGMXrGC/HArKl/BWH6pR5cMIBqINd507MaJumgNMIWmSkq2ErNois9UxFGt8n8+BbUS41UnL+tFXAaLXN6dKhloAxtbSsBy7N5pRLkwKGgz7aD50OJ7VGcfKjJndY9/KpqFNur3R/Bvp/nb1I2dsVOEVMG0t5V8iZLP7OaMdCqPEB85My3TUuxOWgl+fxJPh/vI+zx/Uxok39oZ/EUPVF6uTGvS1muGHs2CkQ5cN7UZIn+ZqVbMdk30l7FH94Jta4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261022105027099003)(10067099003)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261102123227099003)(261021121427099003)(261028144727099003)(261026140227099003)(261026121527099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e2hfDvYy6Vz5j6JX65DFo2w77Jb2dxXUKd3dxO6zw0P5Ztf+oVYEYXdvGxF8?=
 =?us-ascii?Q?Gl+AD2leaYAdYzY+JjtAoOltGwn6BKRTFCrxj28HkUUlT7pRQ68RZ1Epuw4S?=
 =?us-ascii?Q?7Wb6uQeIh1Co5nwYfnwCUClCt745f689qPvcI5HKJXLjHTlf1nDWthwjwAJL?=
 =?us-ascii?Q?fFSfkRe5FeBv4+uz+AGoVQsqWdJuqwBZPNKj6Zczyevet3LruDEQblROiXyK?=
 =?us-ascii?Q?EzLHBGtfusNEvBLXJP41Gp3ugIiIkvTGYtzIdwmxprzTs/AtC4WNX215HnhQ?=
 =?us-ascii?Q?GdJZxMWV4yE8YfeodTLSbBtXZut3vRFPynIYOyqCF9HtjajlM12AZE3L0hBr?=
 =?us-ascii?Q?thHCv7ozY88K5imxseTmPthcwYS9tjkfpcUk+CI49RiyJuM1IW+Iisq3rGz9?=
 =?us-ascii?Q?6Lw6xgcmsz92riqSeIHqSrZY3dyA/fHPaQOWzOcdUSSvkHXkqL+mEC3+MBZj?=
 =?us-ascii?Q?8ONYrbxMZwLRX+LM5m9Yu9IxxRP/kfEORkEO1uvCUGum4y/e9GxYkaWalV5i?=
 =?us-ascii?Q?05MEPTK4o1XYNPDLDCNYdHmMq0fdDgffJDi9flT1TP3sem1X3nd5VKGhYBzZ?=
 =?us-ascii?Q?mmj5t7PX3gnTYoWVygCg0z3em0aDnLgUFxBJSRfnYzPIPAFXEYlzNWCSIU3e?=
 =?us-ascii?Q?RK2IrF2C1QB3s8AwFkouI2sgn8l1VbWrtTJLejWZ5OvmfPOHVPa5SZTJ60Vw?=
 =?us-ascii?Q?BiWj1OXGn1yIUJOM0INKpFsGnA3xETFyimF/ITmOi/WMiakBfdQMqvvbHiZ3?=
 =?us-ascii?Q?7fDXU7VUbK5TBDYFoUxyFbnqtIvotjskqdNE6gH+3w8Zo1kT5TCF2btg9dn2?=
 =?us-ascii?Q?W5Zn6EmUxMow5xWM7hKn+mwnBqtZtltxRL8JN20xJc+N7PP/K/YZvv2dZ2+4?=
 =?us-ascii?Q?8Db4LB/KA5eMD1JFex2ieGQwFbJlomtjjjBnDZGs0uo210KJq/OwnQLBz2cC?=
 =?us-ascii?Q?uwARBUdXExtpwgcQj+E8yf4GcQqxtcYg+9qFNYiQbyUG1OC2Z9LQD+H+ugbs?=
 =?us-ascii?Q?stLst4EOGaFXRklOSdj5Fy/F0ysckgMPZGlJY46hkd56TMUG3L+GTUKhX7aF?=
 =?us-ascii?Q?HfYZOvgSw/mvmrgmp4z+bIVHdyhKjIbHCEW7cjXwXU0vUaqqHqtKWzfUVifq?=
 =?us-ascii?Q?XxR3dyVuPx/MOmF6JuYHW0/cx0UDfgEWjV3xJh9sLrzZUvSQTJPA4fyjxnMp?=
 =?us-ascii?Q?4JH/BDor/klZI7//JGgUHgPhvNAAPjCHGpW2BJwkH4HrUpVsPYw3e9bR+xTs?=
 =?us-ascii?Q?Fv247x74fNrZanDfQBXdEqN9n6rMct0tjdotBP4f+gl5uiV52IVMADXXTyn6?=
 =?us-ascii?Q?DKdYJiyDY6h4uRKzkT1Duu94sPn2JX1ZZYDCuRy23C8KJcImYBsxSucdFxFR?=
 =?us-ascii?Q?BTqmc1NTQMka+RLAyssT9Pc2e3WmHDkIuiAQz6qADwXZRx54vlf1ydipdW0a?=
 =?us-ascii?Q?frAVskXEQ5Q0GQjyklkuaN9MmD/XzO4gnh/M5E5CuP5R2zuaI1Y7vQ0JbA//?=
 =?us-ascii?Q?ry9tST6nmyxpTL79YBApnP7pWIV4lBfaT/M1ixVoBI81vj18vDFAJUrNy2bs?=
 =?us-ascii?Q?i24l3T2iI7NJs7yfm7F6WBmaUgZUdEgdAfBVqoP9iAbhXgUmo/S0hHGBMuOY?=
 =?us-ascii?Q?rGTuzaOztcszp3Ap3FvljC48dva4ZuUvzw9F/gCNx7wYvJikdl73C6IXtHAP?=
 =?us-ascii?Q?8YDxrZNYBdRKEn1CTvG5f4WztDFmElXOQ/rJF5I4OMxYonR6HqOC2S5p5e+b?=
 =?us-ascii?Q?O2QxVTwKxw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f63bf8-91e2-4bb4-7094-08df46e4fc25
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:02:20.8080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /h1aAqDw3FOgLjkM5qf4IBQR6n7fY2OhG80yWQoIClFypJE6gFO8iwEyQ0vUGcxg97Cq3G20M4zIefBVcTkktq1g/1AyMM2CXVaZGsWfNA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6419
X-purgate-ID: tlsNG-bad1c0/1795165364-FD469034-25E6EC4C/0/0
X-purgate-type: clean
X-purgate-size: 9113
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

nsvm_vmcb_prepare4vmexit() copies NextRIP from the hardware #VMEXIT,
but L0 also delivers #VMEXITs it creates itself, for which that value
belongs to a different exit.  L1 should see the NextRIP which the APM
defines for the #VMEXIT it gets: zero for most of them, such as an
exception or an interrupt, and the next RIP for an intercepted
instruction or INT3/INTO (AMD64 APM vol 2, publication 24593 rev 3.44,
section 15.7.1).  For example:

 1. L1 intercepts #GP but not MSR accesses.
 2. L2 executes RDMSR of an MSR which Xen doesn't implement.
 3. Hardware exits to L0 with VMEXIT_MSR and NextRIP after the RDMSR.
 4. L0 handles the RDMSR itself and injects #GP into L2.
 5. L1 intercepts #GP, so L0 delivers VMEXIT_EXCEPTION_GP to L1.
 6. L1 sees NextRIP after the RDMSR, instead of 0.

Record NextRIP in ns_vmexit alongside the exitcode and exitinfo, and
have each source of a #VMEXIT supply it: the hardware value for a
reflected #VMEXIT, the next RIP for an INT3/INTO which L0 emulated, and
zero for everything else, including a failed VMRUN.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---
v2:
 - Rebased on current staging (struct vmcb_struct is now struct vmcb).
 - Reworded the commit message: a #VMEXIT which L0 creates does not
   always have NextRIP 0.

This is the #VMEXIT counterpart of commit 9d6b6e4f7394 ("x86/svm: Sync
nextrip during virtual VMRUN").

BOUND's #BR is raised by the emulator as a plain hardware exception
without an instruction length, so it still reports 0 rather than the
next RIP.

 xen/arch/x86/hvm/svm/nestedhvm.h         |  3 ++-
 xen/arch/x86/hvm/svm/nestedsvm.c         | 32 ++++++++++++++++++++----
 xen/arch/x86/hvm/svm/svm.c               |  8 +++---
 xen/arch/x86/include/asm/hvm/svm-types.h |  1 +
 4 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 9bb04a04343..963390e8a99 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -28,7 +28,8 @@
 
 int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
 void nestedsvm_vmexit_defer(struct vcpu *v,
-    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2);
+    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2,
+    uint64_t nextrip);
 enum nestedhvm_vmexits
 nestedsvm_vmexit_n2n1(struct vcpu *v, struct cpu_user_regs *regs);
 enum nestedhvm_vmexits
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 366178ff54a..70ef50eb845 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -154,6 +154,7 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     svm->ns_hostflags.raw = 0;
     svm->ns_vmexit.exitinfo1 = 0;
     svm->ns_vmexit.exitinfo2 = 0;
+    svm->ns_vmexit.nextrip = 0;
 
     svm->ns_iomap = NULL;
 
@@ -674,6 +675,7 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     if ( inst_len == 0 )
     {
         svm->ns_vmexit.exitcode = VMEXIT_SHUTDOWN;
+        svm->ns_vmexit.nextrip = 0;
         return -1;
     }
 
@@ -695,6 +697,7 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     case NSVM_ERROR_VVMCB:
         gdprintk(XENLOG_ERR, "inject VMEXIT(INVALID)\n");
         svm->ns_vmexit.exitcode = VMEXIT_INVALID;
+        svm->ns_vmexit.nextrip = 0;
         return -1;
     case NSVM_ERROR_VMENTRY:
     default:
@@ -758,6 +761,7 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
     }
 
     ns_vmcb->exitcode = exitcode;
+    ns_vmcb->nextrip = svm->ns_vmexit.nextrip;
     ns_vmcb->event_inj.raw = 0;
     return 0;
 }
@@ -765,10 +769,26 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
 int cf_check nsvm_vcpu_vmexit_event(
     struct vcpu *v, const struct x86_event *event)
 {
+    const struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
+    uint64_t nextrip = 0;
+
     ASSERT(vcpu_nestedhvm(v).nv_vvmcx != NULL);
 
+    /*
+     * An exception intercept saves NextRIP only for INT3, INTO and BOUND
+     * (AMD APM vol 2 rev 3.44, 15.7.1).  The emulator raises BOUND's #BR as
+     * a plain hardware exception, so only INT3/INTO can be recognised here.
+     * As in svm_inject_event(), truncate it outside of 64bit mode.
+     */
+    if ( event->type == X86_ET_SW_EXC )
+    {
+        nextrip = guest_cpu_user_regs()->rip + event->insn_len;
+        if ( !((vmcb_get_efer(vmcb) & EFER_LMA) && vmcb->cs.l) )
+            nextrip = (uint32_t)nextrip;
+    }
+
     nestedsvm_vmexit_defer(v, VMEXIT_EXCEPTION_DE + event->vector,
-                           event->error_code, event->data);
+                           event->error_code, event->data, nextrip);
     return NESTEDHVM_VMEXIT_DONE;
 }
 
@@ -1036,8 +1056,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* LBR virtualization - keep lbr control as is */
 
-    /* NextRIP */
-    ns_vmcb->nextrip = n2vmcb->nextrip;
+    /* NextRIP is set by nsvm_vcpu_vmexit_inject(). */
 
     /* Decode Assist */
     ns_vmcb->guest_ins_len = n2vmcb->guest_ins_len;
@@ -1191,7 +1210,8 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
 /* VMEXIT emulation */
 void
 nestedsvm_vmexit_defer(struct vcpu *v,
-    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
+    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2,
+    uint64_t nextrip)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
@@ -1204,6 +1224,7 @@ nestedsvm_vmexit_defer(struct vcpu *v,
     svm->ns_vmexit.exitcode = exitcode;
     svm->ns_vmexit.exitinfo1 = exitinfo1;
     svm->ns_vmexit.exitinfo2 = exitinfo2;
+    svm->ns_vmexit.nextrip = nextrip;
     vcpu_nestedhvm(v).nv_vmexit_pending = 1;
 }
 
@@ -1326,6 +1347,7 @@ nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
 
         case NESTEDHVM_VMEXIT_ERROR:
             exitcode = VMEXIT_INVALID;
+            vcpu_nestedsvm(v).ns_vmexit.nextrip = 0;
             break;
         default:
             ASSERT(!nestedhvm_vcpu_in_guestmode(v));
@@ -1445,7 +1467,7 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
                                      guest_cpu_user_regs(), exitcode);
     if ( ret )
     {
-        nestedsvm_vmexit_defer(v, exitcode, intack.source, exitinfo2);
+        nestedsvm_vmexit_defer(v, exitcode, intack.source, exitinfo2, 0);
         return NSVM_INTR_FORCEVMEXIT;
     }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index bfca1eda4af..8b1ae241d46 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1621,7 +1621,7 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     case -1:
         ASSERT(nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v));
         /* inject #VMEXIT(NPF) into guest. */
-        nestedsvm_vmexit_defer(v, VMEXIT_NPF, pfec, gpa);
+        nestedsvm_vmexit_defer(v, VMEXIT_NPF, pfec, gpa, 0);
         return;
     }
 
@@ -2564,7 +2564,7 @@ void asmlinkage svm_vmexit_handler(void)
         enum nestedhvm_vmexits nsret;
         struct nestedvcpu *nv = &vcpu_nestedhvm(v);
         struct vmcb *ns_vmcb = nv->nv_vvmcx;
-        uint64_t exitinfo1, exitinfo2;
+        uint64_t exitinfo1, exitinfo2, nextrip;
 
         paging_update_nestedmode(v);
 
@@ -2589,6 +2589,7 @@ void asmlinkage svm_vmexit_handler(void)
              */
             exitinfo1 = vmcb->exitinfo1;
             exitinfo2 = vmcb->exitinfo2;
+            nextrip = vmcb->nextrip;
             nv->nv_vmswitch_in_progress = 1;
             nsret = nestedsvm_vmexit_n2n1(v, regs);
             nv->nv_vmswitch_in_progress = 0;
@@ -2596,7 +2597,8 @@ void asmlinkage svm_vmexit_handler(void)
             {
             case NESTEDHVM_VMEXIT_DONE:
                 /* defer VMEXIT injection */
-                nestedsvm_vmexit_defer(v, exit_reason, exitinfo1, exitinfo2);
+                nestedsvm_vmexit_defer(v, exit_reason, exitinfo1, exitinfo2,
+                                       nextrip);
                 goto out;
             case NESTEDHVM_VMEXIT_FATALERROR:
                 gdprintk(XENLOG_ERR, "unexpected nestedsvm_vmexit() error\n");
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 3475ed6a06d..81b997a15f7 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -74,6 +74,7 @@ struct nestedsvm {
         uint64_t exitcode;  /* native exitcode to inject into l1 guest */
         uint64_t exitinfo1; /* additional information to the exitcode */
         uint64_t exitinfo2; /* additional information to the exitcode */
+        uint64_t nextrip;   /* NextRIP to report to the l1 guest */
     } ns_vmexit;
 
     union {
-- 
2.49.0


