Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F905C54FCD
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 03:03:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377009.1623339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpH3K-0000Y7-6x; Thu, 30 Jul 2026 03:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377009.1623339; Thu, 30 Jul 2026 03:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpH3K-0000Y0-4M; Thu, 30 Jul 2026 03:03:22 +0000
Received: by outflank-mailman (input) for mailman id 1377009;
 Thu, 30 Jul 2026 03:03:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1wpH3I-0000Xu-B9
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 03:03:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpH3H-00G3XI-0l
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 05:03:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6a6abeef-e002-0a2a0a5209dd-0a2a4509e2be-22
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 05:03:18 +0200
Received: from [52.101.61.53]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6a6abef5-be1a-0a2a45090019-34653d35f0a0-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 05:03:18 +0200
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by MW4PR03MB6618.namprd03.prod.outlook.com (2603:10b6:303:129::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 03:03:13 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%5]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 03:03:13 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLXyma42BoVdXdlSgXiY/zqLBacL1MfNvw5vMwBRUSbHWpDs4lvoyooVELS8VF+RkNhsOP1otp+v3ovLuERVtIbPaNYVMSmNcJLQKtatjgxNE8ZSQ9G4HrJOfHbJaN1PjSRNR2beRtUtnmD3VQfliUIlelPJcTM0GjKzEmoy7q6Ofhb/Mcg4XouPWOzkW39WL8LywiEx6qMFw99LPBj6SZFjGMda2aZtACmg1aJNpcvIGmuRG6DbJQaed5TAfOnwAU0on/oOtLZDsOeC2pcrig0eK6831cFKHh3jvdvXbwIN2VxCWtl3WFF8INtHuZqNqUhMWv2xH4xdSNaZgW9wfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thUNhPVrSqsh39u30ukzZsaD61bWiNYS6JsEfE/vAZQ=;
 b=x4rLK1jfFSDwGP1uxtxa5xblM7awvemCeax37bWWkMMq1hpicuagwCT8sOj7W/Ore6nK+IEKx4n55rrIC3TFuDEscau6mw+fipIqnJNXn45VZzRzGiQZvq0eUbLRQW2zWke6zEcqemNmOhfO2SxS9+fXYeegsX/Nx9KjAYNd4eL67gD/0JojQZ1t9zxavVSEKcfDK7pPJfheJ9TZqeSB8/AgSJbPBzP7aLM2KrJqEnt39zWs5flpoihERkTwqgFJShudVOa7a7h7SK4u4UVfSpN9xU+mLuDj9dqj9GwveKRXhHxhYELGvdJQllqdxCNK3ZTlKCaajsLiEeFlBNiMyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thUNhPVrSqsh39u30ukzZsaD61bWiNYS6JsEfE/vAZQ=;
 b=gMdupJuqYhukGUfECaiqvVHiJpzLLW501ej5er3WkkRsJsop4zU5ABWhc67HqMOpJ4CE/3Be9TIxHuy9IpehiENv3LSJDTyJSA7nvyPjoM1LgaYoxYlqJf6qJl86SlmF60wO37CFdSnB9nV9khq5fifw/uKgk8ddPTioL9ND23c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stephen Cheng <stephen.cheng@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2] x86/svm: require VMSAVEvirt for nested virt
Date: Thu, 30 Jul 2026 11:03:03 +0800
Message-ID: <20260730030303.71388-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260727071709.196088-1-stephen.cheng@citrix.com>
References: <20260727071709.196088-1-stephen.cheng@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5a::18) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|MW4PR03MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e57dca-7892-4166-ab38-08deede7185e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|5023799004|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GeM7jn9Cys63dWvYkywqAKlV3SIgMlFgyTfkhd5FB8TjU7WKgXQkfph+FmaLzVtqcPlZh17YPWjDw/mKkJFX/F7l4VN64Kg+AUzNExmmz68a9CzUiwKT0kEdks0akXv+wpdBle7hBkCfQAu5FyM10JvznBef36MPqjQeRB9I6lwwcOmOdNAc4Ewod8VEMORheqFHqACvEprmLZ/kKn5stCVJT6Gy7ohH9uoUaPn5QLkaOSBE1vaKtZny8NsjC4hTBvwVOLWS9CFv/goRHRVR40Wq6u2UHfWgejbv42wOxUc2Hd6U+EXPzjuGE6xAPOGlYe3X266cAzCLyvDL5Aeee6CSHWrZDzCTBgWlDeDi/LIVJhawfVO4VqVrHXG1hGSHuZGiOpcyUqFwTLY4tSf2Lm5RYLarZnEcPEQ4NXGauvtx2wHpm7462UvWtg+x/ZHn6dwcIqH8uN6S20enqMk4OrJuk+FmXqC27U5IO5mqMIPofHqZ8AlMq1Rttas9IP3F1VfPHpxYkTg03+KBh7ombza0PEIsp6CZObXCHTCjUrBfZ1ce3RecbUjCegVgszdcD7UIHrmlCk454H0ta8R+Z2cLOzz9Pl5tRoMWWURe4sK1M6bb9K+qiZRV6ENn1+sFU+tUfu8Q9rCkuyczV2QiRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P9v+Ttv4HRuPj5w7J4gQbptEJU3diRsLpi1TbPIki6P8saVK2C0yp2HTBIPg?=
 =?us-ascii?Q?KEcUa+o6abBcKBzYabDNiPTMVWtfXHVsEEgA/4UaqFlFVle3RrDdJAI7fqBn?=
 =?us-ascii?Q?khJ1QcbMb5rzFQD8vN2/gA+ZKa9jn32UYCPHzk/5CsWd/oTAOggSEWQsskAw?=
 =?us-ascii?Q?NQzb8kcpFGC231SRdDe3HyoLU2AZMA3mgUDpFofSJQYnpCNv0Z4a2Rt6FQ7o?=
 =?us-ascii?Q?DpkAZ4co8EWVUpaFAA/88A8KkY88dqCGUhmTUFuBUL6/e20oYRxTiTZpUwyY?=
 =?us-ascii?Q?7fnJ7B950zVt19nOXNovKGGsONrOmSGBfAeT9avt2EmVHG7d1Oe35rKfk4Dz?=
 =?us-ascii?Q?b+5rLAH3cFPvjwX3tmjMRAjFxLgmEkKVjOafhaiF005vp/aaAsZVtj6luNoO?=
 =?us-ascii?Q?C1E5oDX9YFNFA+yFs7kSOQfTaH71Kgh1RaW17Lpsob2qsgYqdNNG6qW3PdnQ?=
 =?us-ascii?Q?h6JNlOfcISTDcfqn58W2q6mA55PfVmV8Y6ztd+Vy/S5hG2StsaWrWCvQ8aKV?=
 =?us-ascii?Q?1jXH4EUYdGNkgODsnl1iTi9Sd0ZUOAx/Etb1u81VWUgSx+Zm5SuO2AerjKBk?=
 =?us-ascii?Q?Cqfr6h66VZq3BW8HIPmYuMCFzsWD6JGad8xc3wQ2+F71kHHjaNjefi98Kznz?=
 =?us-ascii?Q?F6CcPeVcgKeMyfqbbdqsp1NF8kkVuUZUbAOlTfVJFcck030jMrWwihOG2g3n?=
 =?us-ascii?Q?Pen7afVTALXJn/Myu1DxH44K1eZPHjKFD7ZyqgkZaQEVoJ2BkXb7V/7pZ45n?=
 =?us-ascii?Q?J5gnIjB8F9AhMUMkLcHtm8wuB+qZEWD7FqV9Q5CfHuKcxc+ySXZ5j0s5M6Ah?=
 =?us-ascii?Q?bp/67rft4sqrdxFxszLMksjJvXijdRS+WJKwMXctLaRuF8YJMaWUyUMFrzfd?=
 =?us-ascii?Q?JMHdOW+KZQwK6l4kqv9wFp4aoF/VqXNeI/+jgWOfiYf1dPWp5RsuBBWjaHaj?=
 =?us-ascii?Q?wF6NQudc/UqaV+Cp5Tyk15r21bUDsG27LpGR1Q5/7itgfPCiCUebW/cDyU0b?=
 =?us-ascii?Q?0Uxkx472la1zgkiReak2fAiEVGQa5ShpTaSIsBSl0scF72kElrVbXm62o5KR?=
 =?us-ascii?Q?Km8R8g3oVERU77io52qNPh4xiU2M0Ib+dDWQDFE70blvDeH9y4ujfDMCqtFO?=
 =?us-ascii?Q?kAWbkAjwSXfAcaUp9Ro6QBbJvmDtNrEMkV/1bPzRpnGomldoXJECKG68KWs8?=
 =?us-ascii?Q?Fp1LqVKZFY+ocmfv22h0GD0zZtBw4zVlj7/1Wf7TJ/SloNyBIEPtnDPy3cIE?=
 =?us-ascii?Q?pFrsfMOpAsvVEwFHcJkGD3D80CP1D6+tLlZ6SvBFHKaa8jc1LRX2esXcbCx5?=
 =?us-ascii?Q?Cxfz7N/NAD7u/cZ+BPV/U1AAGovRktQPX3lvJiwqmWgvsvPEdK5vLj4umTrb?=
 =?us-ascii?Q?fGRJdedqEv/iOblt9uLHBI2SkjWqSU8jYA9gL/Qkv35HVOiABcQ9fs+wsTXy?=
 =?us-ascii?Q?zMwyuKgCNbsR9dnusTq+/JAKeIxCwtPfpQHhNmg2VeAg5mQ16jMWzRazsFKF?=
 =?us-ascii?Q?jd4ej5sh4N7xdcq3/lan8y/fwR6m9NFP3sVm0Llo7dmGA8UjvV29cmGlhkHa?=
 =?us-ascii?Q?f8Lo6YCjK1Naus4a5p6X4kEQP6EVdKmeSxcBldN5DzqIZXp61IGBLatFEiM/?=
 =?us-ascii?Q?mtIYvQsnQDOsL8K8NPAoQeZ3RC6hIKDmExT0lW7EP97CzgCVdFzf3hWIu2Mu?=
 =?us-ascii?Q?vuArL9MKFl3N109vSyMrO5utVPH13B58f13eXroH6/Zc6RvWLAY3688Temla?=
 =?us-ascii?Q?QKvWxnf0Fw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e57dca-7892-4166-ab38-08deede7185e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 03:03:13.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeqQdXbFnlw9zQdwa9hfiimex0Iuk6g9Ai7FGyM9CJrRa/9HTSKcL1HsTWlf1FUhWnWNRzanMgWHnXJRWa27S/tXQtE0kCuLpakpl7W6K8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6618
X-purgate-ID: tlsNG-bad1c0/1785380598-FD86F034-3FB9DC71/0/0
X-purgate-type: clean
X-purgate-size: 4262

Virtual VMLOAD/VMSAVE lets an L1 guest execute VMLOAD and VMSAVE
without intercepts.  Without it, Xen has to map the L1-provided VMCB
and re-execute each instruction in L0, handling a complex,
security-sensitive subset of state on the way.

Make VMSAVEvirt a hard requirement for nested SVM.  The
cpu_has_svm_vloadsave test in svm_nested_features_on_efer_update() is
then redundant, as nested virt now requires the feature, and is
dropped.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---
 docs/designs/nested-svm-cpu-features.md | 17 +++++++++++++++++
 xen/arch/x86/hvm/svm/nestedsvm.c        | 16 +++++++++++-----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/docs/designs/nested-svm-cpu-features.md b/docs/designs/nested-svm-cpu-features.md
index ce168e68e1..eed40a958c 100644
--- a/docs/designs/nested-svm-cpu-features.md
+++ b/docs/designs/nested-svm-cpu-features.md
@@ -109,3 +109,20 @@ leaf 8000000A:edx
   Using it in L0 reduces the chance that we'll make some sort of error
   in the decode path.  And if hardware supports it, it's easy enough
   to provide to the L1.
+
+- 15 `VLoadSave` *Virtual VMLOAD/VMSAVE*: Require for L0
+
+  Without this feature Xen has to intercept the L1 hypervisor's VMLOAD
+  and VMSAVE instructions and emulate them by re-executing the real
+  instruction on a mapped copy of the L1-supplied VMCB.  That path
+  handles a complex, security-sensitive subset of state (the hidden
+  segment descriptors for FS/GS/TR/LDTR plus the SYSCALL/SYSENTER
+  MSRs), so on faithfulness grounds we'd much rather let the hardware
+  do it.  When present, the instructions execute natively in the guest
+  without a #VMEXIT, which is both simpler and faster.
+
+  Whether to provide it to the L1 is a separate question, deliberately
+  left for a later change.  It needs care over whether an L2's
+  `vloadsave_enable` should follow L0's setting or L1's, and over what
+  should happen if L1 leaves the feature disabled without intercepting
+  VMLOAD/VMSAVE.
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index b06124c2c9..96de03a5ec 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -562,7 +562,10 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Keep the host values of the fs, gs, ldtr, tr, kerngsbase,
      * star, lstar, cstar, sfmask, sysenter_cs, sysenter_esp,
-     * sysenter_eip. These are handled via VMSAVE/VMLOAD emulation.
+     * sysenter_eip. These are not transferred by VMRUN/#VMEXIT; they
+     * are moved directly to/from the L1-provided VMCB by the guest's
+     * own VMSAVE/VMLOAD, which run natively (VMSAVEvirt is required
+     * for nested virt).
      */
 
     /* PAT */
@@ -1097,7 +1100,10 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Keep the l2 guest values of the fs, gs, ldtr, tr, kerngsbase,
      * star, lstar, cstar, sfmask, sysenter_cs, sysenter_esp,
-     * sysenter_eip. These are handled via VMSAVE/VMLOAD emulation.
+     * sysenter_eip. These are not transferred by VMRUN/#VMEXIT; they
+     * are moved directly to/from the L1-provided VMCB by the guest's
+     * own VMSAVE/VMLOAD, which run natively (VMSAVEvirt is required
+     * for nested virt).
      */
 
     /* CR2 */
@@ -1548,8 +1554,7 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
     if ( nsvm_efer_svm_enabled(v) )
     {
         if ( !vmcb->virt_ext.fields.vloadsave_enable &&
-             paging_mode_hap(v->domain) &&
-             cpu_has_svm_vloadsave )
+             paging_mode_hap(v->domain) )
         {
             vmcb->virt_ext.fields.vloadsave_enable = 1;
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
@@ -1607,5 +1612,6 @@ void __init start_nested_svm(struct hvm_function_table *hvm_function_table)
         cpu_has_svm_lbrv &&
         cpu_has_svm_nrips &&
         cpu_has_svm_flushbyasid &&
-        cpu_has_svm_decode;
+        cpu_has_svm_decode &&
+        cpu_has_svm_vloadsave;
 }

base-commit: 644ea6f84510af27ee1847e981df945a94068479
-- 
2.49.0


