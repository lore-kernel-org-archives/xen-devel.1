Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1ADCA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:16:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444994.1661517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU7S-0004Pp-K1; Sat, 10 Oct 2026 10:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444994.1661517; Sat, 10 Oct 2026 10:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU7S-0004Pg-Fx; Sat, 10 Oct 2026 10:15:58 +0000
Received: by outflank-mailman (input) for mailman id 1444994;
 Sat, 10 Oct 2026 10:15:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU7Q-0004Mo-Fp
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:15:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU7P-009G2i-Sh
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:15:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca102f-8faa-0a2a0a5109dd-0a2a450786f6-40
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:15:55 +0200
Received: from [52.101.43.57]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca1059-b4ea-0a2a45070019-34652b3922af-4
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:15:55 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by DS7PR03MB5591.namprd03.prod.outlook.com (2603:10b6:5:2ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 10:15:52 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:15:51 +0000
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
 b=szgvBfbpZw/TksHMzhCDAn+s/+elyWAjN1U47k8iOJNfRGxT6HB3IqMa4hD96iAczlZ8/wJbj+q1kmE6TAAn60eu+MK9/8bQbzj2dP3SlFmjYf4faZ/eM4rLD4Pu03RaPkuX8QQgMDsnNpRrsx3Q9qWHxmLvMUMYIhbzJdxw/DINDpEkqs8iwsdIPH5wbAxbCHVC3qKujSbm0zbfLWROWqDEx4idVJf7MzTqvZPONAXvM5tXx4ALRWl1wsYIiXdRrPjruAaEaTNkTPVyP/cSjkCfqmqtMkp0I2C2lWVHl87nThTsys44GjtAF219lLpsYdU0mqqVjMiFLX2AOgobtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TubJ5WWWxAoWmbngom3t1u6MgQONdCbxh67FzIrAJEs=;
 b=Y8QldvFAqfsaTCj5U+5F9ISR/7G1xUNFrdUf2TlKMlyCeYu6E/KaaNIFkeofe3tK3P9hJI8HRCXUxUWMR+vjFOCEhHAlphCgJ2mdE0WVGFHRYZFUVvcCBB8Nf0lSUoD6YraK0CTICF+lRxkkny/lixhiuVfdKgzz8x2cf4aulSmPACrvAxWQOzqDnVw3foHrsGqbiQTVBWhYhRQZg4ji0BpVNNPqRXO7SuNe+NcaTe337qiXbqjkCKQzCMK7QE5QIgexl3rw0xr3Wn4SAatlZqtGO0F5UBYDg0o5KRHitP26ftvlXY55gCvSJI8y0/WGSEn0eWs4Cf6dyrfGGCsVZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TubJ5WWWxAoWmbngom3t1u6MgQONdCbxh67FzIrAJEs=;
 b=bXAgnb9JsDoKr1JhMXAojv42zIhj0bv3VVkdBKx9NTQXJ9iZPIWEPQCfZCO2r5i/SI/u2SQBNPh4SZJrsAgExKK9bI9m0vt1Vbt2nDmCOouP2LUGMBvczUbTXrxlOIXNXfY55d0waJDqKag6LvYzcHcLwhiCpEQ23dMGNqcyotg=
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
Subject: [PATCH v2 09/13] x86/svm: Fix VMLOAD/VMSAVE state handling when using nested virt
Date: Sat, 10 Oct 2026 18:13:22 +0800
Message-Id: <106eb64227ca2b0784c74791913ae049bb99a7d2.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To MN2PR03MB5328.namprd03.prod.outlook.com
 (2603:10b6:208:1e2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|DS7PR03MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: eecc38b1-902b-4ecd-dae2-08df26b77628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003|6133799003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	QuF5+bWgUoWFHaW4piL1Ow5Zmr40R/WBrzauMwuo7/hYaAybo/KQxXumzNMANuf3SOJxPjykJtuqwu8Qv+Q2L8YMseTe9lqQNvtNlwKBEzECJ2LUqD3pEFa8wbMlpTphUnz4NNvN7EcifG2VVysq7pOqraJwomYkrI3yRiZDvdbJOGCanD/sx78cIcPMQDEGYTzW10etDuXzafDNM5UdADnUmdcu8EZEWuK+OIwbFUQZ1GcOgHDCmbzC+BNHi2cqIRsop0lYaCAwr1hLqCCVCUYoPAb26lFdhCWB5tjlgI/psax4d8l5qGRUAseoO9uDqcPKEzeRq/qsHzCaiABibujnHw2Di1fV3/tWDN8ESJC9JeyhSfhM6cKlEUN4qWEZFmdV9ZwhX1IBS33GdshN/eS0VfIIuEDJUDPAZsoEVJN4NlHll7LtuhO4AIkW+njesvHiIho5FzjwFksLXhS58Pm5QZIzjp3k5NBMB40zHRgN3ghqW8FFyk5M4/gX3PWJfEsYOkWB9U6DVsvM5sV4QG1aLkDa5oZy6/aGWfdgmC01FtE3MJq+w4y9Om8YhZ8IYBeXjiYM3ZcIgN3pqqZDZNVhCnxKLH4jzjDiCf4R+WOr57oyjFG4FCFcMhYjYY4PQBsQLbjrBq3ez6z1kQ1EFqgDFIf+8JzXwLcD+Czvs8E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ANeOUzlpCh21YYFuMED/cNHTw/2O/7e8WZITgcElcbQqbIKZ6M+L1y0A6r0A?=
 =?us-ascii?Q?/PhX6j//S6g79dSZx3/tpQ//cqTrTHhY0k/2sgGuYJzfWw6TrB27VIFg3tzz?=
 =?us-ascii?Q?xb4WX+zDxg3VFvZTizN4yPgLfwg7fJajIwSQn7OfctVMAl4FpUsbMN0Uzr2o?=
 =?us-ascii?Q?eUbp6CTVphO2t+j/q5tOjBAsnozxD+aDb/aoAbPW3kluT1ffMMM04bXEejDE?=
 =?us-ascii?Q?uETSZKGIdTwPlnVckNDjQWM/GeSAv3+Js5+Uj7BXVJlHu403+JgZ8wg1c39H?=
 =?us-ascii?Q?JM9ya3hLo/Wapwc+Zxje8kG2HeeMigpao9IvbjKBMUpYinhhIYp2FPbVPmjG?=
 =?us-ascii?Q?M+FOTghk2knGP3AN+yhsjcRZHBCk+ZgDV3CF9AUkw7lQNDkAwelUbQr50+nd?=
 =?us-ascii?Q?JU7sZVhTPO+94B7diCM6wTfgImfcem3DHKHDqe2zI28U/+r5CH5+BlrO6vkI?=
 =?us-ascii?Q?zJIE7bLSe3k7CFEHxewxI7V2xbRn/1meQplNUZrrUciO5E2dVkWrJaEvDnSA?=
 =?us-ascii?Q?eNDR0N0KDinwpJGaOuIyyf1RzDzj7oOTYnp6cxo1J9bDDs6WIlFIsdlTRZjs?=
 =?us-ascii?Q?AMc8a+svnC/E5NbEiRUslS/ezRVSmtLVVYIQ0AUhUVaUF6SV2RlVG+utoqrc?=
 =?us-ascii?Q?idwhmNaCGP8ovXBo8cr/o5QD1ic4t2pPuMFC3amKDerlkHnPTe4pz12tgys/?=
 =?us-ascii?Q?YasbULaBHIuwoYUm0WHw57zF1VmAwHy4E+Jn70flel9I3WKh2FlQFU9Juwg4?=
 =?us-ascii?Q?xzggDeBs8mG3C8mtgQrFem8JON9BdPUS4mhDyYtPepVAJ4VZltjpZz5QXipQ?=
 =?us-ascii?Q?mV+TGIYw0Tq70robkjvSGh4xkI9ZLO2NJhKsla37ZAlkmmfGz75r+QTdkkBU?=
 =?us-ascii?Q?t1wPrNGvEXSiMIdUPzWKpSnkFnF/ophcDE9MURQuG+VgcVj5QLRLxi4j+Wja?=
 =?us-ascii?Q?YcbynJiZIKxH9uun8yAXVj18RjplvuNKnH+CN9SSnEtLVDuZYtZFT4eNRKSc?=
 =?us-ascii?Q?2D4/Sef+B1lp2L6hnTIerHgvMMyHFejT0w8+/fSgwDkuuohSSqYbeqYDBY7f?=
 =?us-ascii?Q?wnmXPy+eHlalosO3Qc3ceAyyuSZ/jTTwrhl9Jvh3pcD3CWtssIUUXEHJK1dv?=
 =?us-ascii?Q?WJyEKC6YqsEgSsRSxLQPB4aJKxV+MVySOqB4WITof63Je77OenwQwN+RSKPq?=
 =?us-ascii?Q?C3pYlBqt62Nu8qMT6GNa6HJps8dggqZAyjUTrj7T3An3cHc2n4JLOnMFkWgZ?=
 =?us-ascii?Q?aOao4iT8RMgrmPftOD1yL6iwPp+B+SlZPFZBzjao23bC4EYq9Tijxa6ZpgCQ?=
 =?us-ascii?Q?ndvpXEgGwiYAwlXZInTq2vRJCFMNv7rPK9B4W+H7sJIuaWqTTKDM3wCe3Siz?=
 =?us-ascii?Q?VzseBUta5JkJ8jBpdWyQeQapLUKY0DdlLFZeKsjmH5gYvvW/oMe78rOZwmaZ?=
 =?us-ascii?Q?BgV/QI1KuL3nyUJWImYCO9MpBZT5JOYtVAFEnprwA8vsvPvSaoP8SxYrse11?=
 =?us-ascii?Q?el/SBKDZ78DJA4LwTVcNTmgYulos2Y/o/TpUTLCJBAI5nezwGG7FALh2WxJP?=
 =?us-ascii?Q?Zb8UMxPOt9p2PF6U/2pzFuPlvF+FVD0UoSO0z8aUMbWvBLf+XiT41/gN8H1e?=
 =?us-ascii?Q?HlYhkhCWofR5LXo2UrESXPGbc4Xw4+iYaJGec8Q42aSd6j4j+uuY7JB7+yjt?=
 =?us-ascii?Q?wWvMqwCj7ZNwAzcCr8xP0G8LG74GptQ7j/vB0gjU4khP+yHLTEZVCqgHJbl9?=
 =?us-ascii?Q?SEByVGxOsA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eecc38b1-902b-4ecd-dae2-08df26b77628
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB5328.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:15:51.4953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/i6zPst8DHpni8ArSb7iPhE+6gXL1FBynRRQEvXiJEQ6rb57Z/pe5kOcol96PH4SkQB6jZfXqnXA2cHMf1hIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-purgate-ID: tlsNG-ef75cf/1791627355-374D3AE4-EDFF499F/0/0
X-purgate-type: clean
X-purgate-size: 16754

From: Ross Lagerwall <ross.lagerwall@citrix.com>

Currently, the SVM VMLOAD/VMSAVE state handling always uses the vCPU's
active VMCB to load/store the state. The active VMCB changes depending
on whether or not the vCPU is in guest mode yet the state is not
properly copied between VMCB(0-1) and VMCB(0-2) nor is the
vmcb_sync_state updated when switching active VMCB.

The most common way this fails is when context switching to a vCPU in
guest mode and immediately taking a VMEXIT (e.g. due to an interrupt for
L1 having arrived in the meantime). The code issues an unconditional
VMSAVE into VMCB(0-1) but the state has not yet been loaded since
context switching which results in garbage in VMCB(0-1). The garbage
state is then (re-)loaded from VMCB(0-1) shortly before VMRUN. This
results in frequent, random crashes in L2.

Since the state covered by VMLOAD/VMSAVE is a property of the vCPU and
is not affected by switches to and from guest mode, always use VMCB(0-1)
to store and retrieve it. This avoids the need to synchronize state
between VMCBs and fixes the random crashes. L1 itself is responsible for
using VMLOAD/VMSAVE to load/save the state from hardware into its own
VMCB(1-2) and this change does not affect that.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c |   7 --
 xen/arch/x86/hvm/svm/svm.c       | 107 +++++++++++++++++--------------
 xen/arch/x86/hvm/svm/vmcb.c      |  26 ++++----
 xen/arch/x86/hvm/svm/vmcb.h      |   3 +-
 4 files changed, 75 insertions(+), 68 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index d47e57c8a1d7..e1cb10e1de11 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -198,11 +198,6 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
     ASSERT(n1vmcb != NULL);
     ASSERT(n2vmcb != NULL);
 
-    /*
-     * nsvm_vmcb_prepare4vmexit() already saved register values
-     * handled by VMSAVE/VMLOAD into n1vmcb directly.
-     */
-
     /* switch vmcb to l1 guest's vmcb */
     v->arch.hvm.svm.vmcb = n1vmcb;
     v->arch.hvm.svm.vmcb_pa = nv->nv_n1vmcx_pa;
@@ -977,8 +972,6 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
     struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
 
-    svm_vmsave_pa(nv->nv_n1vmcx_pa);
-
     /* Cache guest physical address of virtual vmcb
      * for VMCB Cleanbit emulation.
      */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index ea32dcead218..5aeffd5e416f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -443,30 +443,30 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
 
 static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
-    data->sysenter_cs      = vmcb->sysenter_cs;
-    data->sysenter_esp     = vmcb->sysenter_esp;
-    data->sysenter_eip     = vmcb->sysenter_eip;
-    data->shadow_gs        = vmcb->kerngsbase;
-    data->msr_lstar        = vmcb->lstar;
-    data->msr_star         = vmcb->star;
-    data->msr_cstar        = vmcb->cstar;
-    data->msr_syscall_mask = vmcb->sfmask;
+    data->sysenter_cs      = n1_vmcb->sysenter_cs;
+    data->sysenter_esp     = n1_vmcb->sysenter_esp;
+    data->sysenter_eip     = n1_vmcb->sysenter_eip;
+    data->shadow_gs        = n1_vmcb->kerngsbase;
+    data->msr_lstar        = n1_vmcb->lstar;
+    data->msr_star         = n1_vmcb->star;
+    data->msr_cstar        = n1_vmcb->cstar;
+    data->msr_syscall_mask = n1_vmcb->sfmask;
 }
 
 static void svm_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
-    vmcb->lstar        = data->msr_lstar;
-    vmcb->star         = data->msr_star;
-    vmcb->cstar        = data->msr_cstar;
-    vmcb->sfmask       = data->msr_syscall_mask;
-    vmcb->kerngsbase   = data->shadow_gs;
-    vmcb->sysenter_cs  = data->sysenter_cs;
-    vmcb->sysenter_esp = data->sysenter_esp;
-    vmcb->sysenter_eip = data->sysenter_eip;
+    n1_vmcb->lstar        = data->msr_lstar;
+    n1_vmcb->star         = data->msr_star;
+    n1_vmcb->cstar        = data->msr_cstar;
+    n1_vmcb->sfmask       = data->msr_syscall_mask;
+    n1_vmcb->kerngsbase   = data->shadow_gs;
+    n1_vmcb->sysenter_cs  = data->sysenter_cs;
+    n1_vmcb->sysenter_esp = data->sysenter_esp;
+    n1_vmcb->sysenter_eip = data->sysenter_eip;
     v->arch.hvm.guest_efer = data->msr_efer;
     svm_update_guest_efer(v);
 }
@@ -578,18 +578,19 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
 void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state)
 {
     struct svm_vcpu *svm = &v->arch.hvm.svm;
+    struct nestedvcpu *nv = &vcpu_nestedhvm(v);
 
     if ( new_state == vmcb_needs_vmsave )
     {
         if ( svm->vmcb_sync_state == vmcb_needs_vmload )
-            svm_vmload_pa(svm->vmcb_pa);
+            svm_vmload_pa(nv->nv_n1vmcx_pa);
 
         svm->vmcb_sync_state = new_state;
     }
     else
     {
         if ( svm->vmcb_sync_state == vmcb_needs_vmsave )
-            svm_vmsave_pa(svm->vmcb_pa);
+            svm_vmsave_pa(nv->nv_n1vmcx_pa);
 
         if ( svm->vmcb_sync_state != vmcb_needs_vmload )
             svm->vmcb_sync_state = new_state;
@@ -605,6 +606,7 @@ static void cf_check svm_get_segment_register(
     struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
     ASSERT((v == current) || !vcpu_runnable(v));
 
@@ -612,8 +614,9 @@ static void cf_check svm_get_segment_register(
     {
     case x86_seg_fs ... x86_seg_gs:
         svm_sync_vmcb(v, vmcb_in_sync);
+        *reg = n1_vmcb->sreg[seg];
+        break;
 
-        /* Fallthrough. */
     case x86_seg_es ... x86_seg_ds:
         *reg = vmcb->sreg[seg];
 
@@ -623,7 +626,7 @@ static void cf_check svm_get_segment_register(
 
     case x86_seg_tss:
         svm_sync_vmcb(v, vmcb_in_sync);
-        *reg = vmcb->tr;
+        *reg = n1_vmcb->tr;
         break;
 
     case x86_seg_gdt:
@@ -636,7 +639,7 @@ static void cf_check svm_get_segment_register(
 
     case x86_seg_ldt:
         svm_sync_vmcb(v, vmcb_in_sync);
-        *reg = vmcb->ldtr;
+        *reg = n1_vmcb->ldtr;
         break;
 
     default:
@@ -651,6 +654,7 @@ static void cf_check svm_set_segment_register(
     struct vcpu *v, enum x86_segment seg, struct segment_register *reg)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
     ASSERT((v == current) || !vcpu_runnable(v));
 
@@ -689,12 +693,16 @@ static void cf_check svm_set_segment_register(
 
         /* Fallthrough */
     case x86_seg_es ... x86_seg_cs:
-    case x86_seg_ds ... x86_seg_gs:
+    case x86_seg_ds:
         vmcb->sreg[seg] = *reg;
         break;
 
+    case x86_seg_fs ... x86_seg_gs:
+        n1_vmcb->sreg[seg] = *reg;
+        break;
+
     case x86_seg_tss:
-        vmcb->tr = *reg;
+        n1_vmcb->tr = *reg;
         break;
 
     case x86_seg_gdt:
@@ -708,7 +716,7 @@ static void cf_check svm_set_segment_register(
         break;
 
     case x86_seg_ldt:
-        vmcb->ldtr = *reg;
+        n1_vmcb->ldtr = *reg;
         break;
 
     case x86_seg_sys:
@@ -1667,6 +1675,7 @@ static int cf_check svm_msr_read_intercept(
     struct vcpu *v = current;
     const struct domain *d = v->domain;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
     const struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
     uint64_t tmp;
 
@@ -1689,43 +1698,43 @@ static int cf_check svm_msr_read_intercept(
     switch ( msr )
     {
     case MSR_IA32_SYSENTER_CS:
-        *msr_content = vmcb->sysenter_cs;
+        *msr_content = n1_vmcb->sysenter_cs;
         break;
 
     case MSR_IA32_SYSENTER_ESP:
-        *msr_content = vmcb->sysenter_esp;
+        *msr_content = n1_vmcb->sysenter_esp;
         break;
 
     case MSR_IA32_SYSENTER_EIP:
-        *msr_content = vmcb->sysenter_eip;
+        *msr_content = n1_vmcb->sysenter_eip;
         break;
 
     case MSR_STAR:
-        *msr_content = vmcb->star;
+        *msr_content = n1_vmcb->star;
         break;
 
     case MSR_LSTAR:
-        *msr_content = vmcb->lstar;
+        *msr_content = n1_vmcb->lstar;
         break;
 
     case MSR_CSTAR:
-        *msr_content = vmcb->cstar;
+        *msr_content = n1_vmcb->cstar;
         break;
 
     case MSR_SYSCALL_MASK:
-        *msr_content = vmcb->sfmask;
+        *msr_content = n1_vmcb->sfmask;
         break;
 
     case MSR_FS_BASE:
-        *msr_content = vmcb->fs.base;
+        *msr_content = n1_vmcb->fs.base;
         break;
 
     case MSR_GS_BASE:
-        *msr_content = vmcb->gs.base;
+        *msr_content = n1_vmcb->gs.base;
         break;
 
     case MSR_SHADOW_GS_BASE:
-        *msr_content = vmcb->kerngsbase;
+        *msr_content = n1_vmcb->kerngsbase;
         break;
 
     case MSR_IA32_MCx_MISC(4): /* Threshold register */
@@ -1858,6 +1867,7 @@ static int cf_check svm_msr_write_intercept(
     struct vcpu *v = current;
     struct domain *d = v->domain;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
     struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
 
     switch ( msr )
@@ -1891,45 +1901,45 @@ static int cf_check svm_msr_write_intercept(
         switch ( msr )
         {
         case MSR_IA32_SYSENTER_ESP:
-            vmcb->sysenter_esp = msr_content;
+            n1_vmcb->sysenter_esp = msr_content;
             break;
 
         case MSR_IA32_SYSENTER_EIP:
-            vmcb->sysenter_eip = msr_content;
+            n1_vmcb->sysenter_eip = msr_content;
             break;
 
         case MSR_LSTAR:
-            vmcb->lstar = msr_content;
+            n1_vmcb->lstar = msr_content;
             break;
 
         case MSR_CSTAR:
-            vmcb->cstar = msr_content;
+            n1_vmcb->cstar = msr_content;
             break;
 
         case MSR_FS_BASE:
-            vmcb->fs.base = msr_content;
+            n1_vmcb->fs.base = msr_content;
             break;
 
         case MSR_GS_BASE:
-            vmcb->gs.base = msr_content;
+            n1_vmcb->gs.base = msr_content;
             break;
 
         case MSR_SHADOW_GS_BASE:
-            vmcb->kerngsbase = msr_content;
+            n1_vmcb->kerngsbase = msr_content;
             break;
         }
         break;
 
     case MSR_IA32_SYSENTER_CS:
-        vmcb->sysenter_cs = msr_content;
+        n1_vmcb->sysenter_cs = msr_content;
         break;
 
     case MSR_STAR:
-        vmcb->star = msr_content;
+        n1_vmcb->star = msr_content;
         break;
 
     case MSR_SYSCALL_MASK:
-        vmcb->sfmask = msr_content;
+        n1_vmcb->sfmask = msr_content;
         break;
 
     case MSR_IA32_DEBUGCTLMSR:
@@ -2257,6 +2267,7 @@ static bool cf_check svm_get_pending_event(
 static uint64_t cf_check svm_get_reg(struct vcpu *v, unsigned int reg)
 {
     struct vcpu *curr = current;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
     const struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     struct domain *d = v->domain;
 
@@ -2268,7 +2279,7 @@ static uint64_t cf_check svm_get_reg(struct vcpu *v, unsigned int reg)
     case MSR_SHADOW_GS_BASE:
         if ( v == curr )
             svm_sync_vmcb(v, vmcb_in_sync);
-        return vmcb->kerngsbase;
+        return n1_vmcb->kerngsbase;
 
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x) Bad register\n",
@@ -2544,7 +2555,7 @@ void asmlinkage svm_vmexit_handler(void)
     if ( unlikely(exit_reason == VMEXIT_INVALID) )
     {
         gdprintk(XENLOG_ERR, "invalid VMCB state:\n");
-        svm_vmcb_dump(__func__, vmcb);
+        svm_vmcb_dump(__func__, v, vmcb);
         domain_crash(v->domain);
         goto out;
     }
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 39b9e6bf2068..fc3ba7c44815 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -250,16 +250,17 @@ static void svm_dump_sel(const char *name, const struct segment_register *s)
            name, s->sel, s->attr, s->limit, s->base);
 }
 
-void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
+void svm_vmcb_dump(const char *from, struct vcpu *v,
+                   const struct vmcb_struct *vmcb)
 {
-    struct vcpu *curr = current;
+    struct vmcb_struct *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
     /*
      * If we are dumping the VMCB currently in context, some guest state may
      * still be cached in hardware.  Retrieve it.
      */
-    if ( vmcb == curr->arch.hvm.svm.vmcb )
-        svm_sync_vmcb(curr, vmcb_in_sync);
+    if ( v == current )
+        svm_sync_vmcb(v, vmcb_in_sync);
 
     printk("Dumping guest's current state at %s...\n", from);
     printk("Size of VMCB = %zu, paddr = %"PRIpaddr", vaddr = %p\n",
@@ -293,7 +294,8 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
     printk("virtual vmload/vmsave = %d, virt_ext = %#"PRIx64"\n",
            vmcb->virt_ext.fields.vloadsave_enable, vmcb->virt_ext.bytes);
     printk("cpl = %d efer = %#"PRIx64" star = %#"PRIx64" lstar = %#"PRIx64"\n",
-           vmcb_get_cpl(vmcb), vmcb_get_efer(vmcb), vmcb->star, vmcb->lstar);
+           vmcb_get_cpl(vmcb), vmcb_get_efer(vmcb), n1_vmcb->star,
+           n1_vmcb->lstar);
     printk("CR0 = 0x%016"PRIx64" CR2 = 0x%016"PRIx64"\n",
            vmcb_get_cr0(vmcb), vmcb_get_cr2(vmcb));
     printk("CR3 = 0x%016"PRIx64" CR4 = 0x%016"PRIx64"\n",
@@ -305,9 +307,9 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
     printk("DR6 = 0x%016"PRIx64", DR7 = 0x%016"PRIx64"\n",
            vmcb_get_dr6(vmcb), vmcb_get_dr7(vmcb));
     printk("CSTAR = 0x%016"PRIx64" SFMask = 0x%016"PRIx64"\n",
-           vmcb->cstar, vmcb->sfmask);
+           n1_vmcb->cstar, n1_vmcb->sfmask);
     printk("KernGSBase = 0x%016"PRIx64" PAT = 0x%016"PRIx64"\n",
-           vmcb->kerngsbase, vmcb_get_g_pat(vmcb));
+           n1_vmcb->kerngsbase, vmcb_get_g_pat(vmcb));
     printk("SSP = 0x%016"PRIx64" S_CET = 0x%016"PRIx64" ISST = 0x%016"PRIx64"\n",
            vmcb->_ssp, vmcb->_msr_s_cet, vmcb->_msr_isst);
     printk("H_CR3 = 0x%016"PRIx64" CleanBits = %#x\n",
@@ -319,12 +321,12 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
     svm_dump_sel("  DS", &vmcb->ds);
     svm_dump_sel("  SS", &vmcb->ss);
     svm_dump_sel("  ES", &vmcb->es);
-    svm_dump_sel("  FS", &vmcb->fs);
-    svm_dump_sel("  GS", &vmcb->gs);
+    svm_dump_sel("  FS", &n1_vmcb->fs);
+    svm_dump_sel("  GS", &n1_vmcb->gs);
     svm_dump_sel("GDTR", &vmcb->gdtr);
-    svm_dump_sel("LDTR", &vmcb->ldtr);
+    svm_dump_sel("LDTR", &n1_vmcb->ldtr);
     svm_dump_sel("IDTR", &vmcb->idtr);
-    svm_dump_sel("  TR", &vmcb->tr);
+    svm_dump_sel("  TR", &n1_vmcb->tr);
 }
 
 bool svm_vmcb_isvalid(
@@ -423,7 +425,7 @@ static void cf_check vmcb_dump(unsigned char ch)
                 continue;
             }
             printk("\tVCPU %d\n", v->vcpu_id);
-            svm_vmcb_dump("key_handler", v->arch.hvm.svm.vmcb);
+            svm_vmcb_dump("key_handler", v, v->arch.hvm.svm.vmcb);
 
             process_pending_softirqs();
         }
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 28dae325ced0..650465b090cf 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -563,7 +563,8 @@ int  svm_create_vmcb(struct vcpu *v);
 void svm_destroy_vmcb(struct vcpu *v);
 
 void setup_vmcb_dump(void);
-void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb);
+void svm_vmcb_dump(const char *from, struct vcpu *v,
+                   const struct vmcb_struct *vmcb);
 bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
                       const struct vcpu *v, bool verbose);
 
-- 
2.34.1


