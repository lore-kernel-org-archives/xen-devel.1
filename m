Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30447CA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:15:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444986.1661498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU6y-0003K6-0E; Sat, 10 Oct 2026 10:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444986.1661498; Sat, 10 Oct 2026 10:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU6x-0003Jz-Th; Sat, 10 Oct 2026 10:15:27 +0000
Received: by outflank-mailman (input) for mailman id 1444986;
 Sat, 10 Oct 2026 10:15:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU6w-0003Iw-Is
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:15:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU6v-009G2i-W9
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:15:26 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca102f-8faa-0a2a0a5109dd-0a2a450786f6-10
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:15:25 +0200
Received: from [40.107.200.22]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca103c-b4ea-0a2a45070019-286bc816586d-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:15:25 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by DS7PR03MB5591.namprd03.prod.outlook.com (2603:10b6:5:2ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 10:15:21 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:15:21 +0000
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
 b=PGmOXBkh370l+GU50wxY/860Da+jdD6qaunC63Qs+Ant9cmCWihJGnCJapPd5Px9qwLCkvx/fAV3HMWputQlnMupQdCVJhAh1J2O3yrjEMYswQDlZ4TFjGDB41SLt2EDcZdPAZEs/YcwZ0rGklHiFhFaJx70jpB2RJukC5M0BtuAuJNtQEC/O2yJGopR4yO46gJVw8+5+hrIgLG9isVsGJu6TNdWrNHma2jPFQWEy+Xu1SW04Ue9fp4VkRRLEOlmFKzlwwrhFQJVuNqj5MyOEwmOM1JIjM12OZTYLMDYKWa1NabquSmoIERB+qiBX7xH9lSB1jaKcuKsVVikITc8ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwX/FVYmbOkdCgYbltdQ1OEvaIYZaWMFwkVw65AldX0=;
 b=Ub1vLtOGpz6+ogPsW3uDmZaWFUzOs1nkzwVL7cdUQtHYF6fBY718ENqqabvwlk0JeQSdIUsUTSPdEgZFqtx0RwWE1oHaR1m4TOu9KnwTNcbEomXU4fMLght1tcIZkv27ftD2W+bgRFTXHH2xB+r9hVDeyUq9KzAvHYqrNc92P1JsouRisZ0/9fop6dnF6jxmKsYYiuQvILy2fg/nXzxkFEjwX2FVe8C5wNa3NUTkPga78MAzhY1vBrQjjWqzREnFv0pxZUtyTAz4A6D1V3DJ/r6Dl9gF+4PX4IwwRziINgTirw2p1bDrWCV/CPFCTmQPs8xmKvq6Nbos7QvcjhOK6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwX/FVYmbOkdCgYbltdQ1OEvaIYZaWMFwkVw65AldX0=;
 b=r4fu248fRHxt3bBvMgp2SiLvWBOY6dP0+uaqi8c84oDI73OF+s1eEC0FDtDuJXwKR11THBGq8f2+alDSCiDrQGUhQCDs8Cmrb0+fqD0swa0z0lWflE0yDGh5WG+cx/1nIv37Qh7q1kxNuzBLy00ujPaA2iby+bsCdFvn9LD1Q1o=
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
	lin.liu01@citrix.com
Subject: [PATCH v2 07/13] x86/svm: require VMSAVEvirt for nested virt
Date: Sat, 10 Oct 2026 18:13:20 +0800
Message-Id: <a4d34bc3a3c7e173b654ef7238597fa8c96838d0.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU2P306CA0064.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:39::15) To CH2PR03MB5320.namprd03.prod.outlook.com
 (2603:10b6:610:9a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|DS7PR03MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: ab6162bc-3a4a-458e-384c-08df26b76433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|5023799004|11063799006|22082099003|18002099003|6133799003|10067099003|3023799007|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	s8lePsEfAZ0wYj4aTHWCuG3EiMYPYkEYOzClvTyh6DX7AYsevpHFOsw8amARFVSKyPnYWf2qjQQUCNZ0FHUEubDt7VTQlGdem7bHPf5iYzh+1vBZs1YpIBvHlYGwXDaWBCklzCzinphK6w8NHI5eKOIAPnjS0e9vtE4L8I0IheaOjCeoifdzWogiOyzldIDjkRSuuZSpPKl+F0qovdnd1r0o6ITu4i7MFkxHOPgDuJd8es7Sx/JYKT5OnslpZFBQNiCpw2NBLlHXxYki8zSmz9Cb6wCVH4InPFL8HlBNp0xjgiusvyj/z20ObCgHBA0k+5fXs0s8NkNo8bPwlmNNlrTVAYuRGefNGbxuI22lvJSG8XvNXj7uwmkAlaAHLzUw3uN6DkjwmZ8y7B+aOuKQAzkFvCgnbiWPUwo0J2RpVG+g4W8cWKZG0FLhF4QafZZIM8zJvn1epLfpbsX8E5WUp/MHamk9HCmUnKqtxL0IlIg3jx71Q8XAM4BqRW1jFMnmMQhdhD9GYgy5qxbdVz/NF7NjDP3egVxQZ2JCqrJznrQyRk/GOmxgtG+68IsXHZDzHHK4lfzi67kzTJiFoiJux6tB/KohyMKv6B7lzuAgginDTXezhM2h8JzjIPRTUyJ++337nmVlJ04y3maV3s5YZwPtnoQTceLayWyukj+ai5g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+vUbYyxuhfJ5KfuQ0pDwh4tKOKKRXSC9XAh2HxdfVgbziazBBPlv6H0vuMDe?=
 =?us-ascii?Q?Euco47V5j5HtKv94ZGguPLvSmMPd4NSTE24jJ+eig8XfPbvWpS7T7/cyO2cu?=
 =?us-ascii?Q?u9EgJQOUEAZcAcy7CtQby/joMm2FlWWgbZPXqcrg3zbvYCcpJ9/ld90DFy7R?=
 =?us-ascii?Q?I0qQGXCsfCXvPcB+FGIR2ngRp+Q0KFewjpIYIHuANw75HSyMMdcusoEMV8c5?=
 =?us-ascii?Q?r8dPet8bnKLiLmP/FOwYU4aVjR2yadqJQ4N3YkYwAzdnjqaxQH/kJkIwRLZJ?=
 =?us-ascii?Q?0pxBa717NpH6AxGtPO6mjUkQoCYoDHo8yA35eEroAiy5c1VkYE2anHAHX+K1?=
 =?us-ascii?Q?yN2bEIsRgXQB9WfgUZI20I/Mho3+O4ssXcPzgt9M0cdGCxJApZMhHX3CQBp3?=
 =?us-ascii?Q?YojDCU2Z1G5rzYqYPSO51i6G8AT+Ld/VoBNl2GfJkC3IR2UJPb7ZnXOLj9NF?=
 =?us-ascii?Q?lHGmuf4YWhY5GQ1eFJVsKusZn2BeK0syr4P8I6T/kI1weSPKBxWVEaxaNwMj?=
 =?us-ascii?Q?A2x6famnnCGZXBktTeRR/0ndHFWSzujZu7ApMtWNXMS0ZUj+j8cqrEnBkhcl?=
 =?us-ascii?Q?I1ptZCQAJRNJ/T+EoTzk8njD177ICFIIYO2OoI+TaA09OdHD9T/ZkDEZM9pK?=
 =?us-ascii?Q?Dg+uIrAfw7N5qfKjVbeipwiufdSBS4JIGuvIoteCcqfmZoQ0osprGkQrCvBX?=
 =?us-ascii?Q?dqzIYDKxleK/SQRJ47c93h8RyvSPrXT9gXzVb+ysiMUYUoPP85kHYq1isAWG?=
 =?us-ascii?Q?KB0fpeP1YXnFKbzd/fdq5T+HZAODPnQrvpZf9sAdDh+2UkV2GxgxxFY+0uel?=
 =?us-ascii?Q?k058kulujB56hzMJs3KlPUBc1MTcjAV1Hv2diggOtMMcRoyH3GNV/xaZDWcj?=
 =?us-ascii?Q?drLcl+nu4GC+0mqFGPfV1FjQ5Dgk/h9Njz/P24UVHZOo2X7gR3nKU0pZpNSc?=
 =?us-ascii?Q?aDtZE8M/UD8+GVAHt8T4jRAa8GaTKKb1pS5lpT4kIIvCVF5kdk7zsPPblZg0?=
 =?us-ascii?Q?M4JwHZuDVdA2A1ngKAy8n/U6zrarqeO54R1UH2w8HGj57gSo97MW4YXDMX+Z?=
 =?us-ascii?Q?I+zPZjL5WDksaGtR2zJ5K7y74eyvDZEnwpMjEJzM3pyQnGm4tvDj8Fr/ehz1?=
 =?us-ascii?Q?2AqCWNRYaysvisnDxrPS2y0abCkxROJ2UNSCBB+1BEpGhIsTHsOhXjQmLgQz?=
 =?us-ascii?Q?uMpslF9FlYkz5Mmj/oaKfksz3RASdzHZ5mB90g58bbNbDgtBQOdARCBgCG6I?=
 =?us-ascii?Q?Wrr+ckfw6r9+LafKiuMNmKL07gCrR+kmmtDh6hh6ZZoCOVRQpmPeosjHwmeU?=
 =?us-ascii?Q?HEAe2UEJxe1oOPRhCWDRfFLLFkNS9DKnPf/+DfcVny6kbtt/5nVaY5yjhL3y?=
 =?us-ascii?Q?rj+ZIFdBfkxMLXYJMyEDUbJhVF+niQu50Ec8fkaOOM4QlpbXp0DXu30kTFro?=
 =?us-ascii?Q?hqwQDI6xuI5d9VI4RJ9IDd2AunHKn4tqwNeS91Xr1U39Q/hbFaewoFjWxfLL?=
 =?us-ascii?Q?AEI4SKt6z+oEFvowOvVPmgYHQE3B8JptttPMiBgxf5uicMWVhoT+29+3mvyO?=
 =?us-ascii?Q?ZuBEwcwlvfOpj5M2EkyWX/yqQLRtX6dIoB7Imozq38xxmViS9nTfSNc7NcvE?=
 =?us-ascii?Q?Ze4MPjg4vALT6lsMkKruYrs0itRrCmAd5ZcSmumGVd3dp/5rNPPTKRTcdFYT?=
 =?us-ascii?Q?RiF03ECEvShksOwwzQjhpSL/BU9fRLaU3HmVS63Km1LivBqOTl9v6c3GCS+q?=
 =?us-ascii?Q?GoP3iAxu2A=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6162bc-3a4a-458e-384c-08df26b76433
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:15:21.5519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYw7e/awR6pF3MQWewfDcuGwRvUOWipQHV9mX/EjpDa+cubPt0I48a9pRR55IIxvazygQmuG3FZUst5kJr6GEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-purgate-ID: tlsNG-ef75cf/1791627325-36EDEAE4-9C06361B/0/0
X-purgate-type: clean
X-purgate-size: 9887

From: Stephen Cheng <stephen.cheng@citrix.com>

Virtual VMLOAD/VMSAVE lets an L1 guest execute VMLOAD and VMSAVE
without intercepts.  Without it, Xen has to map the L1-provided VMCB
and re-execute each instruction in L0, complicating security-sensitive
state handling.

Make VMSAVEvirt a hard requirement for nested SVM.  Advertise it to
L1, enable it when L1 enables SVM, and remove the nested VMLOAD/VMSAVE
emulation path.  Any remaining intercept therefore comes from a guest
which has not enabled SVM and receives #UD.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---
 docs/designs/nested-svm-cpu-features.md |  11 +++
 xen/arch/x86/cpu-policy.c               |   3 +-
 xen/arch/x86/hvm/svm/nestedsvm.c        |  24 ++++--
 xen/arch/x86/hvm/svm/svm.c              | 100 +++---------------------
 xen/arch/x86/hvm/svm/svm.h              |   2 -
 5 files changed, 41 insertions(+), 99 deletions(-)

diff --git a/docs/designs/nested-svm-cpu-features.md b/docs/designs/nested-svm-cpu-features.md
index ce168e68e1b3..798480b259c8 100644
--- a/docs/designs/nested-svm-cpu-features.md
+++ b/docs/designs/nested-svm-cpu-features.md
@@ -109,3 +109,14 @@ leaf 8000000A:edx
   Using it in L0 reduces the chance that we'll make some sort of error
   in the decode path.  And if hardware supports it, it's easy enough
   to provide to the L1.
+
+- 15 `VLoadSave` *Virtual VMLOAD/VMSAVE*: Require for L0, provide to L1
+
+  Without this feature Xen has to intercept the L1 hypervisor's VMLOAD
+  and VMSAVE instructions and emulate them by re-executing the real
+  instruction on a mapped copy of the L1-supplied VMCB.  That path
+  handles a complex, security-sensitive subset of state (the hidden
+  segment descriptors for FS/GS/TR/LDTR plus the SYSCALL/SYSENTER
+  MSRs), so on faithfulness grounds we'd much rather let the hardware
+  do it.  When present, the instructions execute natively in the guest
+  without a #VMEXIT, which is both simpler and faster.
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 48a3185eed8d..a350270f2229 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -845,7 +845,8 @@ static void __init calculate_hvm_max_policy(void)
                                (1u << SVM_FEATURE_NRIPS) |
                                (1u << SVM_FEATURE_FLUSHBYASID) |
                                (1u << SVM_FEATURE_PAUSEFILTER) |
-                               (1u << SVM_FEATURE_DECODEASSISTS));
+                               (1u << SVM_FEATURE_DECODEASSISTS) |
+                               (1u << SVM_FEATURE_VLOADSAVE));
         /* Enable features which are always emulated. */
         p->extd.raw[0xa].d |= (1u << SVM_FEATURE_VMCBCLEAN);
     }
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a76cec1fecf1..79242bdd9117 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -573,7 +573,10 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Keep the host values of the fs, gs, ldtr, tr, kerngsbase,
      * star, lstar, cstar, sfmask, sysenter_cs, sysenter_esp,
-     * sysenter_eip. These are handled via VMSAVE/VMLOAD emulation.
+     * sysenter_eip. These are not transferred by VMRUN/#VMEXIT; they
+     * are moved directly to/from the L1-provided VMCB by the guest's
+     * own VMSAVE/VMLOAD, which run natively (VMSAVEvirt is required
+     * for nested virt).
      */
 
     /* PAT */
@@ -1113,7 +1116,10 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Keep the l2 guest values of the fs, gs, ldtr, tr, kerngsbase,
      * star, lstar, cstar, sfmask, sysenter_cs, sysenter_esp,
-     * sysenter_eip. These are handled via VMSAVE/VMLOAD emulation.
+     * sysenter_eip. These are not transferred by VMRUN/#VMEXIT; they
+     * are moved directly to/from the L1-provided VMCB by the guest's
+     * own VMSAVE/VMLOAD, which run natively (VMSAVEvirt is required
+     * for nested virt).
      */
 
     /* CR2 */
@@ -1565,9 +1571,14 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
      */
     if ( nsvm_efer_svm_enabled(v) )
     {
+        /*
+         * VMSAVEvirt is a hard requirement for nested virt (see
+         * start_nested_svm()), so it is guaranteed present here.
+         */
+        ASSERT(cpu_has_svm_vloadsave);
+
         if ( !vmcb->virt_ext.fields.vloadsave_enable &&
-             !paging_mode_shadow(v->domain) &&
-             cpu_has_svm_vloadsave )
+             !paging_mode_shadow(v->domain) )
         {
             vmcb->virt_ext.fields.vloadsave_enable = 1;
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
@@ -1621,9 +1632,10 @@ void __init start_nested_svm(struct hvm_function_table *hvm_function_table)
      * docs/designs/nested-svm-cpu-features.md for rationale.
      */
     hvm_function_table->caps.nested_virt =
-        hvm_function_table->caps.hap && 
+        hvm_function_table->caps.hap &&
         cpu_has_svm_lbrv &&
         cpu_has_svm_nrips &&
         cpu_has_svm_flushbyasid &&
-        cpu_has_svm_decode;
+        cpu_has_svm_decode &&
+        cpu_has_svm_vloadsave;
 }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 8f97f6c31716..ea32dcead218 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2136,95 +2136,17 @@ svm_vmexit_do_vmrun(struct cpu_user_regs *regs,
     return;
 }
 
-static struct page_info *
-nsvm_get_nvmcb_page(struct vcpu *v, uint64_t vmcbaddr)
-{
-    p2m_type_t p2mt;
-    struct page_info *page;
-    struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-
-    if ( !nestedsvm_vmcb_map(v, vmcbaddr) )
-        return NULL;
-
-    /* Need to translate L1-GPA to MPA */
-    page = get_page_from_gfn(v->domain, nv->nv_vvmcxaddr >> PAGE_SHIFT,
-                             &p2mt, P2M_ALLOC | P2M_UNSHARE);
-    if ( !page )
-        return NULL;
-
-    if ( !p2m_is_ram(p2mt) || p2m_is_readonly(p2mt) )
-    {
-        put_page(page);
-        return NULL;
-    }
-
-    return  page;
-}
-
-static void
-svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
-                     struct cpu_user_regs *regs,
-                     struct vcpu *v, uint64_t vmcbaddr)
-{
-    unsigned int inst_len;
-    struct page_info *page;
-
-    if ( (inst_len = svm_get_insn_len(v, INSTR_VMLOAD)) == 0 )
-        return;
-
-    if ( !nsvm_efer_svm_enabled(v) )
-    {
-        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
-        return;
-    }
-
-    page = nsvm_get_nvmcb_page(v, vmcbaddr);
-    if ( !page )
-    {
-        gdprintk(XENLOG_ERR,
-            "VMLOAD: mapping failed, injecting #GP\n");
-        hvm_inject_hw_exception(X86_EXC_GP, 0);
-        return;
-    }
-
-    svm_vmload_pa(page_to_maddr(page));
-    put_page(page);
-
-    /* State in L1 VMCB is stale now */
-    v->arch.hvm.svm.vmcb_sync_state = vmcb_needs_vmsave;
-
-    __update_guest_eip(regs, inst_len);
-}
-
 static void
-svm_vmexit_do_vmsave(struct vmcb_struct *vmcb,
-                     struct cpu_user_regs *regs,
-                     struct vcpu *v, uint64_t vmcbaddr)
+svm_vmexit_do_vmload_vmsave(struct vcpu *v)
 {
-    unsigned int inst_len;
-    struct page_info *page;
-
-    if ( (inst_len = svm_get_insn_len(v, INSTR_VMSAVE)) == 0 )
-        return;
-
-    if ( !nsvm_efer_svm_enabled(v) )
-    {
-        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
-        return;
-    }
-
-    page = nsvm_get_nvmcb_page(v, vmcbaddr);
-    if ( !page )
-    {
-        gdprintk(XENLOG_ERR,
-            "VMSAVE: mapping vmcb failed, injecting #GP\n");
-        hvm_inject_hw_exception(X86_EXC_GP, 0);
-        return;
-    }
-
-    svm_vmsave_pa(page_to_maddr(page));
-    put_page(page);
-    __update_guest_eip(regs, inst_len);
+    /*
+     * VMSAVEvirt is required for nested virt, so once a guest enables SVM its
+     * VMLOAD/VMSAVE execute natively and are no longer intercepted.  An
+     * intercepted VMLOAD/VMSAVE therefore means the guest has not enabled SVM:
+     * inject #UD.
+     */
+    ASSERT(!nsvm_efer_svm_enabled(v));
+    hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
 }
 
 static int svm_is_erratum_383(struct cpu_user_regs *regs)
@@ -2956,10 +2878,8 @@ void asmlinkage svm_vmexit_handler(void)
         svm_vmexit_do_vmrun(regs, v, regs->rax);
         break;
     case VMEXIT_VMLOAD:
-        svm_vmexit_do_vmload(vmcb, regs, v, regs->rax);
-        break;
     case VMEXIT_VMSAVE:
-        svm_vmexit_do_vmsave(vmcb, regs, v, regs->rax);
+        svm_vmexit_do_vmload_vmsave(v);
         break;
     case VMEXIT_STGI:
         svm_vmexit_do_stgi(regs, v);
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index cfa411ad5ae1..56a1a4840b37 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -52,8 +52,6 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
 #define INSTR_XSETBV     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321) /* octal-ok */
 #define INSTR_VMRUN      INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330) /* octal-ok */
 #define INSTR_VMCALL     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331) /* octal-ok */
-#define INSTR_VMLOAD     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332) /* octal-ok */
-#define INSTR_VMSAVE     INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333) /* octal-ok */
 #define INSTR_STGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334) /* octal-ok */
 #define INSTR_CLGI       INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335) /* octal-ok */
 #define INSTR_INVLPGA    INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337) /* octal-ok */
-- 
2.34.1


