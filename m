Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07825CA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:16:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445013.1661552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU8G-0006KC-TC; Sat, 10 Oct 2026 10:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445013.1661552; Sat, 10 Oct 2026 10:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU8G-0006JJ-Q7; Sat, 10 Oct 2026 10:16:48 +0000
Received: by outflank-mailman (input) for mailman id 1445013;
 Sat, 10 Oct 2026 10:16:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU8E-0006GG-Ra
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:16:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU8E-0044YC-8C
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:16:46 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca1063-2eae-0a2a0a5409dd-0a2a4507e9d6-34
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:16:46 +0200
Received: from [40.107.200.30]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca108c-b4ea-0a2a45070019-286bc81ebe9c-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:16:45 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by DS7PR03MB5591.namprd03.prod.outlook.com (2603:10b6:5:2ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 10:16:43 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:16:43 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwraQ8W7GR0UFWGvMoTuIbQq6veXONEoc5DRSQYpqzUAPw5v5Tx5yjh246Cu6dj3r9W09UyPudLL0OezSySF+1N+A96HoDHHu/8cDUcmx3vd6Zo/zWayvYK3EAkB73dXcUCL/3yrR3o0z+S9BAOUL6dUy+dM4qXKpddXUu5xOc/WLDazAoi8r/pWrKJmE5sV+7ijY5EDb9u91FanGGIUh8zm5q2QHlNYjNw8VKiH+OiBfp/Bm1LXsevZ37zoiRGAOu4IVsE2p/agLimJIsl/iko9q5edNRnAmXv2B2+MzJOJAnendsiDzVSyQwXKGMbrOOsRIAXiwrzawwYgf1ISeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbsvD4NFq5A2h8etUsRMpbeRgLqfmLD61kIxJLAZioo=;
 b=akN9F4rpiTzdV6lUKUBqDAJozN5CLSY0ojIRTllQFa2UMdWvenOFIJgS6KsIZn9k68OTen0Zk+zl7t2dGV6dPbsqeC7Omkhb36qAe4AZfe2anNhDRuAaCG8NlFWoWWWWbJDFJkO6FPM0PiUpq90KTGJKk2uf6jAiEl8YWmSCGh2QDaiHsqt3a8yHGtmv0G0+A5n86ADquaxVk7x3lu4l0X/6sE2iCYcJvNdva368RanWu8Uye90eji+z19X/RXInd/yMGIbxngEniqnziIRNFnFh8IK5FgZy6aKhSWCAHAJVZjpAVGjOhVcspVeLSNIhlh0miKTWBN1xNQ6UCiDKWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbsvD4NFq5A2h8etUsRMpbeRgLqfmLD61kIxJLAZioo=;
 b=OJVehhq3KXq4KKzd5Gmx31mIpS9zAe1CPgD9MO6PbY9SafNCRp6NLvru5BMOZePbBFsdlHe+81fSnsbXyYUUmnj32ViM6F6jhSOQ0YKlz5qmiWEzIK6XuJBZqDEas5OIrdp3nlQvGL+QGedzquWxfOUfHmtvF32hDpi4zG1Ujao=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: ross.lagerwall@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	stephen.cheng@citrix.com,
	lin.liu01@citrix.com,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v2 13/13] x86/nestedsvm: update vmexit without pending or deferred flag
Date: Sat, 10 Oct 2026 18:13:26 +0800
Message-Id: <957eded24f073f5b6d05c83a6e13dd3d093892ff.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KUZPR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:d10:32::6) To CH2PR03MB5320.namprd03.prod.outlook.com
 (2603:10b6:610:9a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|DS7PR03MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: c167f3d0-509e-4df0-4a61-08df26b79513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Xutdq2874zBXQmBKpUH6imSP23Vf33Dw39GZvQCGM+uLp3QLHI/IK4eSyHDgLgmFt2NPxF4auA1kuPmd1vTgf+h0wgMn3gLNlZ7m7BAwC/X1sGlWVxHf0K79PZsO/DcAtilrhTSufdm3q+b2z3Q/xeZZqScsFrtdaJV2SNV+dr2ERPAXyD/U/904g/gH03QHbUdEjP/A0u9aCUOCG5sGxb2pojXy6DQOpQfLwLz6+2mo+GTjH9pX3Jd1c+dXuqrfd+DLkVakwOP7+smN3leL1ly3Wqc+ua7G1jC7KHgjFrCECqQuvHSvSK6UePXZ6Y7mo47q4fsq4prnjAeA6HUP+C9gXDjYMh1NpE7aJ4Tq3X47nYa7aOS+XTXVJmuQYuZgjOTOd+LDf5NGj/AT/ml+1pRm65wOsUiOd7Cpd6lvNckiwm5A5pKIsfCjhAS0zmq8CkKG0ALhIq9N14KOnaovriw4aEtoyyTfXwQMiCSklljwhTbp8bGYwyvB0f8rfnIbjYUJnNUaR04WzQsFJEYH0oAH+7Ovg7ORLFHGl4fhonWaisi/wur48Ob9lbUl/2xP8jG1+AyRV6f7/bV99rHZfEI59/gquRqV8veMH/yaxk3XEzYMVbFJTv4KwsrNf44Arr34Huv+/FllBKSmf1Ee3BC1ayIk8VogtFW1ELtNjd0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KN43jGYbkO+99GLOD02iZfAyCtZnqyf1i4xPp9ncBzrEawIwdQ21uR4B/WUR?=
 =?us-ascii?Q?l058fhxa6CydXHwSvFFPWpfZPa40TqN+G0wSDoDv3iM8jH12zZcw5W6ScxN7?=
 =?us-ascii?Q?gWVVAbUE1zwAb88lj2bFM9nKo9mKls1BHCI5e6o+bk26KxqfXuKov3rCXPAB?=
 =?us-ascii?Q?6AXS72MnAAYpUgi/6weVSGwzLspAlW/PBHvZfbiMjVfj6FtBJsDCIqW8+I7O?=
 =?us-ascii?Q?D6KvdYiVs9swJtcEfdsxhAL2Yb+Gs3JZ/U3Ai+eNryw2d2eGjgbKFHkaPvEu?=
 =?us-ascii?Q?dJb4UweWhimmm/9Tl84Qu9UTH1gHN996mlNO+sIT2WuZ3kLvbQyak9hyI8lw?=
 =?us-ascii?Q?UN14p77DxtlbJgmdRnr8b4MDUg7TUKR0ymfuydgU2t0ZqU75D5sMI6mw2ARV?=
 =?us-ascii?Q?SH8gvPHQYFMzg8/Z00L54U8ycgeMT2ZPCNd9qNd2UJhx1RXMWjxVTPPf8yPW?=
 =?us-ascii?Q?RdzFlNzQc9JaWVarM06LRCEY48sLibN4clq0SsRGzf7UBCrRLlp5lQJfEQzE?=
 =?us-ascii?Q?ty+50tlal2WfqJKW1X6wZgvBJnx3vG51ITIgkbi3k03H0q42Qg2VwPKk9RCo?=
 =?us-ascii?Q?EkbQs1+Orm0QTc6DZABRQs2oMK/tNVI+XyPpkSqf1QIJy9nyziUsZy1uuHjx?=
 =?us-ascii?Q?T3YKHIG6eIoHhwLw1P22LKi8i3yCEH0M7huwU4M7Esftyucpoiuq1G7XX7rI?=
 =?us-ascii?Q?Wvikxj+zk+UH2EwpD5myDhv5xgmCIzVEE7dICDfxh+GrP7vifwINYv84JRye?=
 =?us-ascii?Q?gqyevtq3BE8Lu24ebxseyfHvrInw8TN494o4/aicFNxUda15QCMCTW2ol1fW?=
 =?us-ascii?Q?6kpd4p8RjPVdpDHSsC/GGIxjIvI8Py6ayk4zgL7CFNf52AclybTKWSIg2g/g?=
 =?us-ascii?Q?1IWfWNJ7h8HEfSlCNn02UIxtzxAB7JVNIrgX7KefWkxSyPLmkTswak8mawVI?=
 =?us-ascii?Q?mwblN3xE8lOsWdKZ5MUeWMYzzm2FfutDDg7s0r8nipNomC3b+jq7af2/WytL?=
 =?us-ascii?Q?6V95BwiYbAal/4odV54gWkOycOaeQkCIIbHj6I999e92M9srVtQGmQUYCq8G?=
 =?us-ascii?Q?SzRgHWabOHn4sIyF5IS7zDIN9zsKowtdCNaNkAnQHbBvkZwAB/29SmR/K2nZ?=
 =?us-ascii?Q?USPvy0oB9tWpDw/OE3fKXUF28ENwd7NHuhl5LHSnNPxR2xftFChBP3hUiTAF?=
 =?us-ascii?Q?f+xYXhNBJZLqZQl+LbfzFjcLOoaDXIYtP7XqE+qV3fFqXJsrpHhAOndzVNT2?=
 =?us-ascii?Q?gDiRkuvEUJCGQCMoid8n9qiOsU6hfcA/Qd3n/QdzC4UDQoWqCtAloHZrlIgZ?=
 =?us-ascii?Q?82EyH/j7DnAdAAQ+aEnNWBh4WCUr+KjxKK1RZ+AbBmicyrjuF0PzhCLoKJxj?=
 =?us-ascii?Q?n7OpsfcL9F6qnKCSIaWmXpdLZXEpvEABE2f6O+4j1SROneIAzXttQnG23IoL?=
 =?us-ascii?Q?Dz2V2MiDhD/WKCrAQ6Fc+cW9IeVpKRqyLGJEj8ydjjdL3ZE8PyFnMoIjzuBf?=
 =?us-ascii?Q?5/6znq7xgeUAiXvPjISH726PXuM/AT0amtoqFehioLE7KpEjbO7afZ/MRVpX?=
 =?us-ascii?Q?B36T6kl08UP8C3Epkh8Zf6X/td1qxvPPogVjZ4Qxu966RFUGT0Vni+2L59fn?=
 =?us-ascii?Q?J+ZrZZS7Od4J7wJouI+gvX8hcHTs7e/g2Zi2vPnkhceOC0DEVPkNz5lN+Bo/?=
 =?us-ascii?Q?T/AUUkLipWSo87SNm4IvqrGbwVOVwBSF7qGWn67N19QJ0smRtBZvCT1j7hH1?=
 =?us-ascii?Q?pNAKf0HOLQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c167f3d0-509e-4df0-4a61-08df26b79513
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:16:43.6315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCkTJ2AgOAKYnb6P3Yya2NHqr2yTihFRMk0JaOVyZy1r2xXZ5Q9wW5exyL1v1YhwC7U+r7r+sapEtQMuu6RTow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-purgate-ID: tlsNG-ef75cf/1791627406-3C610AE4-C6EF7C7E/0/0
X-purgate-type: clean
X-purgate-size: 14365

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
Changes in v2:
 - Rebased on top of the preceding patches (nestedsvm_vmexit_defer() now
   removed in its updated form that uses the correct VMCB for vGIF); no
   other functional change.

 xen/arch/x86/hvm/svm/intr.c              |   4 +-
 xen/arch/x86/hvm/svm/nestedhvm.h         |   5 +-
 xen/arch/x86/hvm/svm/nestedsvm.c         | 164 ++++++++---------------
 xen/arch/x86/hvm/svm/svm.c               |  10 +-
 xen/arch/x86/include/asm/hvm/svm-types.h |   7 -
 5 files changed, 71 insertions(+), 119 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 7f6cafb6db78..f9b59a0d6a46 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -55,7 +55,7 @@ static void svm_inject_nmi(struct vcpu *v)
         vmcb, general1_intercepts | GENERAL1_INTERCEPT_IRET);
 }
 
-static void svm_inject_intr(struct vcpu *v, int vector)
+void svm_inject_intr(struct vcpu *v, int vector)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     intinfo_t event;
@@ -69,7 +69,7 @@ static void svm_inject_intr(struct vcpu *v, int vector)
     vmcb->event_inj = event;
 }
 
-static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
+void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     uint32_t general1_intercepts = vmcb_get_general1_intercepts(vmcb);
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index e22ef259c171..5876a948f39a 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -27,7 +27,8 @@
     (!!((v)->arch.hvm.guest_efer & EFER_SVME))
 
 int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
-void nestedsvm_vmexit_defer(struct vcpu *v,
+enum nestedhvm_vmexits
+nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
     uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2);
 enum nestedhvm_vmexits
 nestedsvm_vmexit_n2n1(struct vcpu *v, struct cpu_user_regs *regs);
@@ -65,6 +66,8 @@ int cf_check nsvm_hap_walk_L1_p2m(
 #define NSVM_INTR_MASKED         0
 
 int nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack);
+void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack);
+void svm_inject_intr(struct vcpu *v, int vector);
 
 #endif /* __X86_HVM_SVM_NESTEDHVM_PRIV_H__ */
 
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index da5cd4848bb6..8c673bcea9f6 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -152,8 +152,6 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     svm->ns_vmcb_hostcr3 = 0;
     svm->ns_asid = 0;
     svm->ns_hostflags.bytes = 0;
-    svm->ns_vmexit.exitinfo1 = 0;
-    svm->ns_vmexit.exitinfo2 = 0;
 
     svm->ns_iomap = NULL;
 
@@ -717,14 +715,10 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     int ret;
     unsigned int inst_len;
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-    struct nestedsvm *svm = &vcpu_nestedsvm(v);
 
     inst_len = svm_get_insn_len(v, INSTR_VMRUN);
     if ( inst_len == 0 )
-    {
-        svm->ns_vmexit.exitcode = VMEXIT_SHUTDOWN;
         return -1;
-    }
 
     nv->nv_vmswitch_in_progress = 1;
     ASSERT(nv->nv_vvmcx != NULL);
@@ -743,15 +737,10 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         break;
     case NSVM_ERROR_VVMCB:
         gdprintk(XENLOG_ERR, "inject VMEXIT(INVALID)\n");
-        svm->ns_vmexit.exitcode = VMEXIT_INVALID;
         return -1;
     case NSVM_ERROR_VMENTRY:
     default:
-        gdprintk(XENLOG_ERR,
-            "nsvm_vcpu_vmentry failed, injecting #UD\n");
-        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
-        /* Must happen after hvm_inject_hw_exception or it doesn't work right. */
-        nv->nv_vmswitch_in_progress = 0;
+        gdprintk(XENLOG_ERR, "nsvm_vcpu_vmentry failed\n");
         return 1;
     }
 
@@ -765,7 +754,7 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 
 static int
 nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
-    uint64_t exitcode)
+    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
@@ -779,33 +768,44 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
 
     ns_vmcb = nv->nv_vvmcx;
 
-    if ( nv->nv_vmexit_pending )
+    switch ( exitcode )
+    {
+    case VMEXIT_INTR:
     {
-        switch ( exitcode )
+        struct hvm_intack intack = {
+            .source = exitinfo1,
+            .vector = exitinfo2
+        };
+
+        /* See the comment in svm_intr_assist() for why this is necessary */
+        if ( unlikely(vmcb->event_inj.v) ||
+             hvm_interrupt_blocked(v, intack) )
         {
-        case VMEXIT_INTR:
-            if ( unlikely(ns_vmcb->event_inj.v) && nv->nv_vmentry_pending &&
-                 hvm_event_needs_reinjection(ns_vmcb->event_inj.type,
-                                             ns_vmcb->event_inj.vector) )
-                ns_vmcb->exit_int_info = ns_vmcb->event_inj;
-            break;
-        case VMEXIT_EXCEPTION_PF:
-            ns_vmcb->_cr2 = ns_vmcb->ei.exc.cr2;
-            fallthrough;
-        case VMEXIT_NPF:
-            ns_vmcb->exitinfo2 = svm->ns_vmexit.exitinfo2;
-            fallthrough;
-        case VMEXIT_EXCEPTION_NP:
-        case VMEXIT_EXCEPTION_SS:
-        case VMEXIT_EXCEPTION_GP:
-        case VMEXIT_EXCEPTION_15:
-        case VMEXIT_EXCEPTION_MF:
-        case VMEXIT_EXCEPTION_AC:
-            ns_vmcb->exitinfo1 = svm->ns_vmexit.exitinfo1;
-            break;
-        default:
+            svm_enable_intr_window(v, intack);
             break;
         }
+
+        svm_inject_intr(v, intack.vector);
+        pt_intr_post(v, intack);
+        break;
+    }
+
+    case VMEXIT_EXCEPTION_PF:
+        ns_vmcb->_cr2 = exitinfo2;
+        fallthrough;
+    case VMEXIT_NPF:
+        ns_vmcb->exitinfo2 = exitinfo2;
+        fallthrough;
+    case VMEXIT_EXCEPTION_NP:
+    case VMEXIT_EXCEPTION_SS:
+    case VMEXIT_EXCEPTION_GP:
+    case VMEXIT_EXCEPTION_15:
+    case VMEXIT_EXCEPTION_MF:
+    case VMEXIT_EXCEPTION_AC:
+        ns_vmcb->exitinfo1 = exitinfo1;
+        break;
+    default:
+        break;
     }
 
     ns_vmcb->exitcode = exitcode;
@@ -816,10 +816,16 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
 int cf_check nsvm_vcpu_vmexit_event(
     struct vcpu *v, const struct x86_event *event)
 {
+    enum nestedhvm_vmexits ret;
+
     ASSERT(vcpu_nestedhvm(v).nv_vvmcx != NULL);
 
-    nestedsvm_vmexit_defer(v, VMEXIT_EXCEPTION_DE + event->vector,
-                           event->error_code, event->data);
+    ret = nestedsvm_vcpu_vmexit(v, guest_cpu_user_regs(),
+                                VMEXIT_EXCEPTION_DE + event->vector,
+                                event->error_code, event->data);
+    if ( ret == NESTEDHVM_VMEXIT_FATALERROR )
+        domain_crash(v->domain);
+
     return NESTEDHVM_VMEXIT_DONE;
 }
 
@@ -1192,7 +1198,7 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
         if ( v->io.req.state != STATE_IOREQ_NONE )
             return hvm_intblk_shadow;
 
-        if ( !nv->nv_vmexit_pending && n2vmcb->exit_int_info.v )
+        if ( n2vmcb->exit_int_info.v )
         {
             /* Give the l2 guest a chance to finish the delivery of
              * the last injected interrupt or exception before we
@@ -1201,43 +1207,15 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
             return hvm_intblk_shadow;
         }
     }
-
-    if ( nv->nv_vmexit_pending )
-        /* hvm_inject_hw_exception() must have run before.
-         * exceptions have higher priority than interrupts.
-         */
-        return hvm_intblk_rflags_ie;
-
     return hvm_intblk_none;
 }
 
-/* VMEXIT emulation */
-void
-nestedsvm_vmexit_defer(struct vcpu *v,
-    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
-{
-    struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-    struct vmcb_struct *n1vmcb = nv->nv_n1vmcx;
-
-    if ( n1vmcb->_vintr.fields.vgif_enable )
-        n1vmcb->_vintr.fields.vgif = 0;
-    else
-        svm->ns_gif = 0;
-
-    svm->ns_vmexit.exitcode = exitcode;
-    svm->ns_vmexit.exitinfo1 = exitinfo1;
-    svm->ns_vmexit.exitinfo2 = exitinfo2;
-    vcpu_nestedhvm(v).nv_vmexit_pending = 1;
-}
-
 enum nestedhvm_vmexits
 nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
     uint64_t exitcode)
 {
     bool is_intercepted;
 
-    ASSERT(vcpu_nestedhvm(v).nv_vmexit_pending == 0);
     is_intercepted = nsvm_vmcb_guest_intercepts_exitcode(v, regs, exitcode);
 
     /* 
@@ -1326,11 +1304,12 @@ nestedsvm_vmexit_n2n1(struct vcpu *v, struct cpu_user_regs *regs)
 /* The exitcode is in native SVM/VMX format. The forced exitcode
  * is in generic format.
  */
-static enum nestedhvm_vmexits
+enum nestedhvm_vmexits
 nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
-    uint64_t exitcode)
+    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
 {
     int rc;
+    enum nestedhvm_vmexits ret = NESTEDHVM_VMEXIT_DONE;
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
 
     nv->nv_vmswitch_in_progress = 1;
@@ -1342,14 +1321,12 @@ nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
      */
     if ( nestedhvm_vcpu_in_guestmode(v) )
     {
-        enum nestedhvm_vmexits ret;
-
         ret = nestedsvm_vmexit_n2n1(v, regs);
         switch ( ret )
         {
         case NESTEDHVM_VMEXIT_FATALERROR:
             gdprintk(XENLOG_ERR, "VMEXIT: fatal error\n");
-            return ret;
+            goto out;
         case NESTEDHVM_VMEXIT_HOST:
             BUG();
 
@@ -1369,46 +1346,18 @@ nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
     /* Prepare for running the l1 guest. Make the actual
      * modifications to the virtual VMCB/VMCS.
      */
-    rc = nsvm_vcpu_vmexit_inject(v, regs, exitcode);
+    rc = nsvm_vcpu_vmexit_inject(v, regs, exitcode, exitinfo1, exitinfo2);
 
     /* If l1 guest uses shadow paging, update the paging mode. */
     if ( !nestedhvm_paging_mode_hap(v) )
         paging_update_paging_modes(v);
 
-    nv->nv_vmswitch_in_progress = 0;
-
     if ( rc )
-        return NESTEDHVM_VMEXIT_FATALERROR;
-
-    return NESTEDHVM_VMEXIT_DONE;
-}
-
-/* VCPU switch */
-void asmlinkage nsvm_vcpu_switch(void)
-{
-    struct cpu_user_regs *regs = guest_cpu_user_regs();
-    struct vcpu *v = current;
-    struct nestedvcpu *nv;
-    struct nestedsvm *svm;
-
-    if ( !nestedhvm_enabled(v->domain) )
-        return;
-
-    nv = &vcpu_nestedhvm(v);
-    svm = &vcpu_nestedsvm(v);
-    ASSERT(v->arch.hvm.svm.vmcb != NULL);
-    ASSERT(nv->nv_n1vmcx != NULL);
-    ASSERT(nv->nv_n2vmcx != NULL);
-    ASSERT(nv->nv_n1vmcx_pa != INVALID_PADDR);
-    ASSERT(nv->nv_n2vmcx_pa != INVALID_PADDR);
+        ret = NESTEDHVM_VMEXIT_FATALERROR;
 
-    if ( nv->nv_vmexit_pending )
-    {
-    vmexit:
-        nestedsvm_vcpu_vmexit(v, regs, svm->ns_vmexit.exitcode);
-        nv->nv_vmexit_pending = 0;
-        return;
-    }
+out:
+    nv->nv_vmswitch_in_progress = 0;
+    return ret;
 }
 
 /* Interrupts, Virtual GIF */
@@ -1451,7 +1400,10 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
                                      guest_cpu_user_regs(), exitcode);
     if ( ret )
     {
-        nestedsvm_vmexit_defer(v, exitcode, intack.source, exitinfo2);
+        ret = nestedsvm_vcpu_vmexit(v, guest_cpu_user_regs(), exitcode,
+                                    intack.source, exitinfo2);
+        if ( ret == NESTEDHVM_VMEXIT_FATALERROR )
+            domain_crash(v->domain);
         return NSVM_INTR_FORCEVMEXIT;
     }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index cb09e924dcd3..d955077a484a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1626,7 +1626,9 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     case -1:
         ASSERT(nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v));
         /* inject #VMEXIT(NPF) into guest. */
-        nestedsvm_vmexit_defer(v, VMEXIT_NPF, pfec, gpa);
+        if ( nestedsvm_vcpu_vmexit(v, regs, VMEXIT_NPF, pfec, gpa) ==
+             NESTEDHVM_VMEXIT_FATALERROR )
+            domain_crash(v->domain);
         return;
     }
 
@@ -2529,8 +2531,10 @@ void asmlinkage svm_vmexit_handler(void)
             switch ( nsret )
             {
             case NESTEDHVM_VMEXIT_DONE:
-                /* defer VMEXIT injection */
-                nestedsvm_vmexit_defer(v, exit_reason, exitinfo1, exitinfo2);
+                nsret = nestedsvm_vcpu_vmexit(v, regs, exit_reason,
+                                              exitinfo1, exitinfo2);
+                if ( nsret == NESTEDHVM_VMEXIT_FATALERROR )
+                    domain_crash(v->domain);
                 goto out;
             case NESTEDHVM_VMEXIT_FATALERROR:
                 gdprintk(XENLOG_ERR, "unexpected nestedsvm_vmexit() error\n");
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index beab9a3af203..256bf5b91402 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -69,13 +69,6 @@ struct nestedsvm {
     bool ns_gif;
     bool ns_hap_enabled;
 
-    /* Only meaningful when vmexit_pending flag is set */
-    struct {
-        uint64_t exitcode;  /* native exitcode to inject into l1 guest */
-        uint64_t exitinfo1; /* additional information to the exitcode */
-        uint64_t exitinfo2; /* additional information to the exitcode */
-    } ns_vmexit;
-
     union {
         uint32_t bytes;
         struct {
-- 
2.34.1


