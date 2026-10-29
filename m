Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F4A606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 06:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=gOS6Blij
Received: from list by lists.xenproject.org with outflank-mailman.1464182.1674924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJcE-0004Yb-53; Thu, 29 Oct 2026 06:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464182.1674924; Thu, 29 Oct 2026 06:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJcE-0004YS-0u; Thu, 29 Oct 2026 06:27:58 +0000
Received: by outflank-mailman (input) for mailman id 1464182;
 Thu, 29 Oct 2026 06:27:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xMJcC-0004Wz-HW
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 06:27:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMJcB-009nLu-Uc
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 07:27:55 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e751-8faa-0a2a0a5109dd-0a2a4503cc7a-32
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:27:55 +0100
Received: from [40.93.194.50]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e76a-fae8-0a2a45030019-285dc23245fa-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:27:55 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by MW4PR03MB6649.namprd03.prod.outlook.com
 (2603:10b6:303:12c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 06:27:52 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 06:27:52 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDS9yzGxnBbN9BW3+6SHO6jQ0cNRO8GTujX0WQ5CJDVwaMOhht9WXBUdi+YnGJo7whcn/X/Zcm7I986gZwIGLaYPVagiQfYciiQ2sNNdC90nrvFI1RGZkWuv3LyKy4/ml/E9S43JgWTxR+SdZm9AE0ijHU2m1yK5NdiNCC4BjPAdkJ7G+889uCQHLfSkn5YAAfAn35af0uHGvEhbyqVTBuizQriSBwz6orcYCCj8JY6byZhNPd7ZK550vvdMmJ23fiCoRsr76ANibLSR8lG+aKF/B3t6/4i9ArqhoZvPwWSaYnJMmqIEqwKywTrLQ8/MVTwGPw2bCxcGDPJvuA9RTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vohssKWS8nBCWyXP0FGzesDtuD315htMSMAVliHIuRc=;
 b=GHgqOjXJ9aelKl1Qze6CERP5GPb9HUhS7WZttviEpSKUao4s/cHXNXr6yaSXs+xG6bSTxDc9Oh8judNNeXpc2ENsinShrvPTb5thMWS4YkqyNXjVigxs2ZLysjFPzAWIYkSeoj5KfkraYMJdiZ7RnVD6x/EHWRUax1z/Vl8k7dlhJ5ZrGl8UEwO72mnV2ZPfLH1mGWWvK2fPr9m6sWlN83o8WkcgdqURrMxI5nNb0aLZ9p/6lvsAjaC+TWqS8m1OmEyscMSRI/WyV/31fQFvtL1zUFgxYsIkG0p2+SOLs1UpYDNpvXikTFpRH6qxw/wjp774IdJXNZD8Y1fuGiu/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vohssKWS8nBCWyXP0FGzesDtuD315htMSMAVliHIuRc=;
 b=gOS6Blij+Sb3PVZ/yKn7OZXmyCcd1AA6qq1EHpfFMhHpAjJcn7MYmzHeC3dnJWb4VwQ+2l1By1d3QFCBp4royxXDlTCzY08l80UHLfRTVej9BjMNrkZf82JZ32CGnRgxGtdx7YQkjUBhGLK4hhA79S4TNLDTi1llG6B4RVhSSyo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger@xenproject.org,
	sstabellini@kernel.org,
	dpsmith@apertussolutions.com,
	Stephen.Cheng@citrix.com,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v2 3/7] x86/nestedvmx: Reflect EPT holes hit during L2 emulation
Date: Thu, 29 Oct 2026 14:26:55 +0800
Message-Id: <0176e3f6811762093c0d6e680bc1057c77d681b9.1793254779.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793254779.git.chunjie.zhu@citrix.com>
References: <cover.1793254779.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|MW4PR03MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 067dae9e-3cc5-447f-b886-08df3585c2bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261028144727099003|11063799006|56012099006|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261022075727099003|261021123027099003|261021121427099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	k/4/5l0rlN54911zRkoqzL8jPEZZBDoHXK2DRt8xNQUtYwxGGrTyyMa+sN8LCB43fa1cRTJ2azF5nTmMjxMlFOJP/pefWhEQzF0vGNMv/uNKb9fsm7mnpel9tv+om8h3586NIzpdSnC8qXqIdMZHTsnY8dMWuIsMpKXBGcImVyFkj3C9NYafrNw6YQiB9M2vXj2V7+ZOakRE+3rkqI7wzYx3QoZg011bbM8ILbrMU+32J9y2vlIr0FuIa5PiGWV99eHzvw5YiVU7mE5zVcbMCgclABFyfiXi80+LIG7HiG1wIkqn3cdY0oO8SeBgrcw/gynKLMeyRTjCaK6XVRgXAdT751c+9iWaRaDtwxCX/KifY6eVbalK/Q+gk6Ni63VjL8pwIx0uuZG9QStUKpUvp498++O8n4rNuHncMPhm0zZBWdJk9MyyB3REh7ZTJdUDATTEoYIjy0KDV3eLqfptGKTBG4hmltp3dtAEp/KR31Pj8UT0fEp5xvg0TqI2unQKgDcqIDlWFNp4PVKHI9G24fBG49h/wvdQJO5dGuNF2Ng4Qymgv7q0i8A1MxK3RWLgVe/hGjdJdcJsyXYZQkdGn4ec82lcMmY3tMx92SeQNyaLzADA4PFyivTFYabEae8m882ee3MvwTPg/JmXyU2bRBzeUM4bEKgnbYJjAg/opG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261028144727099003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DvcyVatANR5lTs57Q+Ls0PyXKxku6WEegWEZn/+YGA3JbySN9wklXJUnPUdZ?=
 =?us-ascii?Q?f8doqreGjriQTSFbvQj/GknTJkux44QAZdfTz/iu8/eRJK7lmolWG94rTd7f?=
 =?us-ascii?Q?zAX1EEJ0DIG/oZcFjqWLgBO0UIc6YHXw2MP4/dB/V6fbHX1xjm2PS2Ml6jo9?=
 =?us-ascii?Q?I7FzRlMEuKW/skmhDFBKBxw+feG7JomtQ59sqFDzkcWZZuxdNkz5Ruqev//6?=
 =?us-ascii?Q?GcHmdoCytlPrTCODqyrORM7a75VoNVy+ltfeLywYY3IhP4WtY0yehhly3h/Z?=
 =?us-ascii?Q?pfI4itCKwG61/YgGrcpYBR4IPsgpiri8ARheq+Cc2dYrqovhWpjaFzXZ3V1d?=
 =?us-ascii?Q?r49oMrv6qtjwRKq0o04lQcGxz6aL9hdpEF2Ss5cq+55eNzi7a3lQzUMgahqq?=
 =?us-ascii?Q?A1Zd/XRyxecj3mkPdIOnz6mBzqixf5qL+fE4BzvKy1Mg0dljPRnFM/l2tepU?=
 =?us-ascii?Q?x96jsotyUmb41P+DZuISaTuuhl2OaQuBANJi7ysEJTItkbZ1dPF6OfsKpwIU?=
 =?us-ascii?Q?QZba44R8IwbATgKKsHoR4xC6l9zfFRz0OKOAMaAYMxY5btfczTqQUFJ7FB7p?=
 =?us-ascii?Q?C/lGXZ0BXBJ2T38mis+4R0+WMgNWKH1WeSdly1ljqVp7fu5EfTzMEjapdpEv?=
 =?us-ascii?Q?2Oq3ShkAtekSypG1RkUF0a5wKWGcojcxQxzC4IsfA/zkE3e7nFuPU7stHwAO?=
 =?us-ascii?Q?lNITsOwaayumlux9DGUkOih1gzVsl1YrO3nK8cOudVIBbpKjeqVrIF6DnLdD?=
 =?us-ascii?Q?NQ1mImOwcRBWMvtBN5+zre+ZQqcyfyX0CiFWxa4lrJcx3d/A+3KWMpXw4Jb9?=
 =?us-ascii?Q?anEpplGCSSuMGWWPRNKK0vFYyFy4tRNhHt9iVEgNsCXGacBbVJYw4K38mjVA?=
 =?us-ascii?Q?rUe07yW1hNQ25+Ry6Glcu9YVbp+yTHQNKx67f4oZimNWA7e8hSBC+DB/jVvF?=
 =?us-ascii?Q?w/6ele4urK5uU1afkbP3qukvDcjjmVLelaeq4FOPGEJG1U4aimQOfOZIq+dv?=
 =?us-ascii?Q?g3x4PP1+VNmBhJuoIemx75uLx6Y6X8ydNX2/7gM9VGpIumLpqbobc90PXSCD?=
 =?us-ascii?Q?w1qSD8D7Py/gaq37esf9K+lMcbQ1IklVlZ1YbXJWzmOTQY+NYFjTVjo28d90?=
 =?us-ascii?Q?UKb5S3s/+O+vjVdWBF26WWEha72nzjR2KkQAge+f3URu5KwuZpzHj8pAbvM+?=
 =?us-ascii?Q?JxiGeY7Gl7gJgZ+9y1S4OQXqxDKVFAOq+BGVDhsogfBEZRKsDHk7wCEjiQNV?=
 =?us-ascii?Q?IhG/fijQ5HmYfm0u2j6NckznmzEtTm4hGK+u25smAyv8Dz5vTIPzhJfJR6rr?=
 =?us-ascii?Q?p1kXRNWiESBBp755pCPqjD9plWrWUlbSsazyb1asxTzIkjL1kgcALTgA1wWJ?=
 =?us-ascii?Q?X9P/KxheWOYFWlWGexH1rsmVBKbhMo44ktjKoH/8BqwkBi8MpuC4EPgoQVHa?=
 =?us-ascii?Q?c2YVPlQK33cCSApcHQPR2ani0mEMm1mLqGsQm1eNH09KmpKYlVMKc6Zpt/g1?=
 =?us-ascii?Q?21woegj9FEN91MgZqE+QsxyvOQKVZfoVcUktmdBaFg48RLPmn0pbUjFFOjnV?=
 =?us-ascii?Q?8ygIgzuo09ZlI+MXMyh6MmaSDb0G6owli39+vpC1MvpJT3Tpbxf+75SFA+oO?=
 =?us-ascii?Q?YEODPAbzcunJ5xY9q3My6DB8NqTqfhlTFHSVXeBuoV9nHFzQm461eGQSzPN9?=
 =?us-ascii?Q?rI41r4mSkpeefYSp2ZIgUkSOPHz69T860xCaEIxwvkw7eB6i0wHjQUeUzQ09?=
 =?us-ascii?Q?ISP6qb707A=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067dae9e-3cc5-447f-b886-08df3585c2bb
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 06:27:52.4390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRhaBCDByGweEyWhYO62BGVoxebqgNlr98K6De6NTfBlRHrFCH/Lcckqr6tmS+K2z/4R+uL8Nc3ixl5q4XWXnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6649
X-purgate-ID: tlsNG-33051d/1793255275-77AF14E9-72DDD78A/0/0
X-purgate-type: clean
X-purgate-size: 5819
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

When L0 emulates an L2 instruction, e.g. a `movs` from MMIO, it
translates the other operand with paging_gva_to_gfn().  For an n2 vCPU
this walks L2's pagetables and then L1's EPT.  If L1's EPT has no
mapping for the resulting L2 GPA, the walk returns
NESTEDHVM_PAGEFAULT_INJECT and paging_gva_to_gfn() returns INVALID_GFN.
The emulator then injects #PF into L2, although L2's own pagetables map
the address.  L2 is blamed for a fault that is L1's to handle.

Reflect the hole to L1 as an EPT violation instead:

 * paging_gva_to_gfn() calls nvmx_reflect_emul_ept_violation() on
   INJECT.  If the current L2 exit is an EPT violation, it records the
   missing GPA and sets nv_vmexit_pending.
 * sync_vvmcs_ro() reports that GPA to L1 as the guest-physical address
   of the violation, together with the exit qualification computed by
   the L1 EPT walk.
 * hvm_inject_event() drops events for L2 while a virtual vmexit to L1
   is pending, so the emulator's #PF does not stay in vmcs02.

L1 can then fix its EPT and resume L2, which re-executes the
instruction.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
Assisted-by: Claude:claude-sonnet-5
---
 xen/arch/x86/hvm/hvm.c                  |  6 +++++
 xen/arch/x86/hvm/vmx/vvmx.c             | 30 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h |  4 ++++
 xen/arch/x86/mm/p2m.c                   |  8 ++++++-
 4 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ef9c7cd05777..b38f8dd68733 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1801,6 +1801,12 @@ void hvm_inject_event(const struct x86_event *event)
         }
     }
 
+    /* L2 is about to exit to L1; an event for L2 would only be lost. */
+    if ( nestedhvm_enabled(curr->domain) &&
+         nestedhvm_vcpu_in_guestmode(curr) &&
+         vcpu_nestedhvm(curr).nv_vmexit_pending )
+        return;
+
     alternative_vcall(hvm_funcs.inject_event, event);
 }
 
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 29e48387a110..0ec9eb6be450 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1290,7 +1290,12 @@ static void sync_vvmcs_ro(struct vcpu *v)
     {
         set_vvmcs(v, EXIT_QUALIFICATION, nvmx->ept.exit_qual);
         set_vvmcs(v, VM_EXIT_REASON, nvmx->ept.exit_reason);
+
+        if ( nvmx->ept.gpa_valid )
+            set_vvmcs(v, GUEST_PHYSICAL_ADDRESS, nvmx->ept.gpa);
     }
+
+    nvmx->ept.gpa_valid = false;
 }
 
 static void load_vvmcs_host_state(struct vcpu *v)
@@ -2422,6 +2427,31 @@ void nvmx_idtv_handling(void)
    }
 }
 
+/*
+ * L0 is emulating an L2 instruction triggered by an EPT violation, and L1's
+ * EPT has a hole for another address the instruction accesses.  Report that
+ * hole to L1 as the EPT violation, instead of blaming L2 with a #PF.  Called
+ * after nvmx_hap_walk_L1_p2m() returned NESTEDHVM_PAGEFAULT_INJECT.
+ */
+bool nvmx_reflect_emul_ept_violation(struct vcpu *v, paddr_t L2_gpa)
+{
+    struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
+    unsigned long reason;
+
+    if ( v != current || !nestedhvm_vcpu_in_guestmode(v) )
+        return false;
+
+    __vmread(VM_EXIT_REASON, &reason);
+    if ( (uint16_t)reason != EXIT_REASON_EPT_VIOLATION )
+        return false;
+
+    nvmx->ept.gpa = L2_gpa;
+    nvmx->ept.gpa_valid = true;
+    vcpu_nestedhvm(v).nv_vmexit_pending = 1;
+
+    return true;
+}
+
 /*
  * L2 VMExit handling
  *    return 1: Done or skip the normal layer 0 hypervisor process.
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index da10d3fa9617..d5bc0ab40198 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -38,6 +38,9 @@ struct nestedvmx {
         bool     enabled;
         uint32_t exit_reason;
         uint32_t exit_qual;
+        /* Violation raised by L0's emulation, not by the L2 access itself */
+        bool     gpa_valid;
+        paddr_t  gpa;
     } ept;
     uint32_t guest_vpid;
     struct list_head launched_list;
@@ -92,6 +95,7 @@ bool cf_check nvmx_ept_enabled(struct vcpu *v);
 int cf_check nvmx_hap_walk_L1_p2m(
     struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
     uint8_t *p2m_acc, struct npfec npfec);
+bool nvmx_reflect_emul_ept_violation(struct vcpu *v, paddr_t L2_gpa);
 
 /*
  * Virtual VMCS layout
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 52cadd9b25c6..7660ea48fc64 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -25,6 +25,8 @@
 #include <asm/p2m.h>
 #include <asm/mem_sharing.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/hvm/vmx/vmcs.h>
+#include <asm/hvm/vmx/vvmx.h>
 #include <asm/altp2m.h>
 #include <asm/vm_event.h>
 #include <xsm/xsm.h>
@@ -1653,7 +1655,7 @@ unsigned long paging_gva_to_gfn(struct vcpu *v,
             .write_access = *pfec & PFEC_write_access,
             .insn_fetch   = *pfec & PFEC_insn_fetch,
         };
-        int rv;
+        int rv = NESTEDHVM_PAGEFAULT_DONE;
 
         /* translate l2 guest va into l2 guest gfn */
         p2m = p2m_get_nestedp2m(v);
@@ -1667,7 +1669,11 @@ unsigned long paging_gva_to_gfn(struct vcpu *v,
             v, pfn_to_paddr(l2_gfn), &l1_gpa, &l1_page_order, &l1_p2ma, npfec);
 
         if ( rv != NESTEDHVM_PAGEFAULT_DONE )
+        {
+            if ( rv == NESTEDHVM_PAGEFAULT_INJECT && cpu_has_vmx )
+                nvmx_reflect_emul_ept_violation(v, pfn_to_paddr(l2_gfn));
             return gfn_x(INVALID_GFN);
+        }
 
         l1_gfn = paddr_to_pfn(l1_gpa);
 
-- 
2.34.1


