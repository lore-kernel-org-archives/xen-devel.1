Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542FC606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 03:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=NOHlKlTV
Received: from list by lists.xenproject.org with outflank-mailman.1504434.1699769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWmyu-0007ey-PY; Fri, 27 Nov 2026 03:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504434.1699769; Fri, 27 Nov 2026 03:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWmyu-0007ep-Mp; Fri, 27 Nov 2026 03:50:40 +0000
Received: by outflank-mailman (input) for mailman id 1504434;
 Fri, 27 Nov 2026 03:50:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xWmys-0007eI-I4
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 03:50:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWmyr-009tfL-Um
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 04:50:37 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6b08fdc2-2eae-0a2a0a5409dd-0a2a4509e328-40
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 04:50:37 +0100
Received: from [52.101.52.66]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6b08fe0c-be1a-0a2a45090019-34653442a0a2-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 04:50:37 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by CO1PR03MB5874.namprd03.prod.outlook.com
 (2603:10b6:303:9c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 03:50:35 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 03:50:35 +0000
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
 b=GG1i8veSkmpI4+IVKx1UqPrmq2yeM/TDxV0XPp/2gMXfBTQ5Zm4Cs18Cs/sm6AHNPnz6moWCQ1nWDPw5fn5omZsB7JDKrNr6QC9VkLF6W7zLbCmmVQYMVLTskWotsJsIC5RumPaA9+J1ymiA8Ijs/azS1Pkw8rsmVog6xHKAK3cErJWhznFNH+UVWN7FDIjuCYpSfOTaU5f/N23m/+HblMlfX2Auz5JVxmLBjaLteVewSrnKYntSOayDzkztBhGKPGfrUALbrSiLnEpNYyR7azrzMAqSQxP18O8KSDQSVbrnEz8z9//yQUzH81Q6HuhvyRRcex1Qj5xVxjpTuc7W9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXvF+A+vfX3qYzv7uLDbQ32Gwf2NbjF3rfU+vrmV5aM=;
 b=cG6LRoM6nHZ8flcZy657CIfR7ArRzwcPIQLofqkMY41bLHKuYGi4YnXy9m36y6qy/2Zi9XCoX/yGe8luU0QFf6Aij1fUGvw3Rtk8/iBpglD/Hl82mzUVZFckyEV+zAwzAXQ+pfbnxq9Q8g11O42C6SL4/U43MY08U2hOwAiovjNYlTWD8c3rMs1K5lSc7kYhPUAQoAMJRoRNOfBOHokNGwHAIpC1OTfK+M0smLOVP/DOjtF6HfWBmNQa0B37EkDP3Jpgjj6D5doBEZWG0ZrafsSRnDfefTSZ5RNq5t8jIxYobht/J1ZQwYwnG4TuGF+1ir8+Ey42b/f7+rt1DfTa8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXvF+A+vfX3qYzv7uLDbQ32Gwf2NbjF3rfU+vrmV5aM=;
 b=NOHlKlTVFz3HWVQDoMsfXclLs1ysurCnSNws0mP+WuOJP8N+wrouzUvkSYvgTGmcW3ST2QqcPdXKg2IeJUWM1r7TgYvQgzqupQPoI9iXqTWZNRKGKvxBt7oNQwrSgyM7qeQlpYJpzfzO+MPhRAF39qOFhn4XUCNZyjP+cQ8cPuc=
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
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v4 1/2] x86/hvm: don't let EFLAGS.IF block NMI/#MC due to nested state
Date: Fri, 27 Nov 2026 11:49:45 +0800
Message-Id: <20261127034946.1130719-2-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127034946.1130719-1-chunjie.zhu@citrix.com>
References: <20261127034946.1130719-1-chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:c8::14) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|CO1PR03MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a5b89d-6e80-4184-00cb-08df4c39979c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|5023799004|261009223027099003|18002099003|22082099003|10067099003|56012099006|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261102123227099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	kVTAB/m9ILAY0sFw/j2toeXQGGLcFkzeObqEqGVBqxyfOeCf0LJadsR6YlSS7Ej9a7RnR9X5jN3ON6vQtMLxkVM0RfQSvkEAlxycUuc4SMOA7Db5y8sfv8stAO6MT0hit7QLfI1jW+jj8NB9JJSOzf38ljtRQCg/yMTFz7dap64N1tZe5bH8OUTcr/Et9BQaEvkrVDZqcVK+AxSCM6gcG13gnz0auP8IcgAHvhsGrO9C0C3AP1CwZM3VjuNJnSTGfXN/yZQKAOTnRhkXRS3/PDSy4E8yZPM3pMLQFuLnYJYTOXRA5GdrvxpWo5PhNUHZcKrmZqy8kPMkfu7kr5gD6BCnyP1rI2hF4GcbydcX6SHmypQhtYHGQ5gfuoe38bxu+Dn4KV1p117NrjPiqswAU796w7UmAEJYTV2snjXGBs9hPVqgktna2bJ2HvRsrCLvs5FuqJ68g76YnyBSYRMTnKXqRvHCSaEtlh0Gzr401CSxB4BKWKiG1HHEBV379mBDBFE0cbCyAVZMsAwXelPwM3i7hKSNJqKFqcuHR1Db6Rs/Z2DzEdHhJAYuSx6vqN7XPSkw5UAcnxPkiKLs/mZwq8/bNa1CSrX54YUCgVepg1HNxP9qwrc+7pMvdRMym1hvF5Rmun91bQbGEFRvIBMAdbdZ83kQ7dc9f408lO7fPiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(5023799004)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261102123227099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ew20Vt9GX/PBm0tJGFGXcvGC4Yh1vDn+6jLPZ8qFaHZ5XuhOYyv+M+jFpLtu?=
 =?us-ascii?Q?iBqEyFziLaxkeiSjxCTiQP8Z2gBIV7tU99CJ3nlbhsL4JUhFttXyDeavGOaG?=
 =?us-ascii?Q?RAA+t4Jx4vx4E5UTxW2w8oLi3mOGtrIeylOJ0KaRs/J4PwfZ9T0RJeFJFgG2?=
 =?us-ascii?Q?+pCgnCIgw45jYo48R/+52wQ05L/RS7r0JS3JCn+c2RIhyjCCiZB6kIvDx1QT?=
 =?us-ascii?Q?M2479f31wuaoRPg9tKmb4n0ypAICG8OpCbxe4ulMmJTAQA6KMaEI1bcHfI7/?=
 =?us-ascii?Q?pkGn4sABzH0DlLCRTP2R2Hb/V6tVaBjoDSFhNW7srO48x+pR8u7Vo1U77T7d?=
 =?us-ascii?Q?RTse2uKtH0J37hDef3tTL+tcLBdwwyidsMLaBMn9Um5pNd9Wkahx1Jya09Vo?=
 =?us-ascii?Q?gnTbBgJ3vRLG1xw2fDXP59fs8KhcwT35Htm95fYMtav3dQ+ci0EMDc60UjB8?=
 =?us-ascii?Q?wACYeuG1C4PMxoljGEWY68sYAWziXMDN78kDTGe8SRw6AnBujnvTMnCY1SOJ?=
 =?us-ascii?Q?Bq08LG3QTUaUtxHw41pZ0V+cSfTzPHT1YHLzPrReAbrd0TE0UjkU8h/ESEG+?=
 =?us-ascii?Q?wmYV3eYUY4rE1gxIy2uB7DrkT5kjlrorhVPmFZDAd4Zjlkf3KRPXtzvtU3Oc?=
 =?us-ascii?Q?wPP2CDcbc3sjiBuu3HlCTZpo4GuPfcGkTW4zewNbeQxCoijqLXUZJvNTdzWm?=
 =?us-ascii?Q?ikxh9IhTaurpxMbptYqzUuCoZHKERhEMnsZvkStsCYia++/KFn5DZddRIbKO?=
 =?us-ascii?Q?rwR6O3Xcy1iNPV/o9pgMPqqHPSqI0FyWyxXtPzbETbvfyyxo/u+2FaPwaY+V?=
 =?us-ascii?Q?lBwvyNrXZgLJNuSgqhzft7adZmJuUtyIo5gE3V8Qa2/aEMY6/KmSNCZJrLm4?=
 =?us-ascii?Q?n1BzhFZi7WyClFxJT4Hdm66VnvDSF1Vl5a3qXhBkur/AhhZ+UjnhCg75AiU3?=
 =?us-ascii?Q?lONDBZZF1VZr6g6of8FP3K70fUpwmLTOvylo+g0+WHyuqk0XDczGkAIRvAtE?=
 =?us-ascii?Q?weK+MYVM03y2aF/ZiGmjpN8UZjHD2olYredlla0ho+iG+NdYPf3XXatpaYqs?=
 =?us-ascii?Q?uCyBhXW92DlR8qcLglm470C5+EQEunczuPEvW5ETGor44wGaC/ZB2oSHHsp7?=
 =?us-ascii?Q?jZlfmZX3xmXXfgX7N/tbph3Xcwuy3KWMIPA9lxbgaXv6lKpaAs9EMbwqfFQy?=
 =?us-ascii?Q?VZrRmSV2aIk2wxTBZBfunml//SLOeLpT5ENWl+zmJamjwJC/0yrfCrQ0iKF5?=
 =?us-ascii?Q?g3nPPHiXt1evTkvXwJgbWcB5CJW/EilQ3GCzmPqu7gNJ/j4Tu3xn41HLrbjD?=
 =?us-ascii?Q?p4mLqsWO8vx6aLs7epqysL3dvxaxFJ4HpSH9FT0oKawU7bmAoqnLyQ8fOH4o?=
 =?us-ascii?Q?SV/blm+q8T16V/UuTAB3D9QB3ha2ECASL3SHaz3iBot36DjSEC01h2Suu5A5?=
 =?us-ascii?Q?9MtbMuTy4NLN0hbLgcOu52NuqivjnUkW7hBN/aEZtIkFfiVumBSBILpQK1kf?=
 =?us-ascii?Q?reJ/VIcx17/450EXjHPieGOt6NWs/YmzeyeiGQW2xQJuVle5gHXNEvXauzIl?=
 =?us-ascii?Q?c4ga64hO1M2nPlGeTUkVdhH8bYhVzBhbuyaHoegLQnNeSgBaTKaRa/+lAIVa?=
 =?us-ascii?Q?kI2U5jfQYUm9lXcXK/PJFNHB4cEnarH32Zjg8HIkorYBqC5qhhbkbQAhysNx?=
 =?us-ascii?Q?iwULKsrcE0wleHlT+tQhGIz8zs2NtdBqz8pyzx0A9vHjBUxZ4R0vyWLfXTJz?=
 =?us-ascii?Q?l0/DuY+KXA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a5b89d-6e80-4184-00cb-08df4c39979c
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 03:50:35.1554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwlDpcDh97wC+mvtP7X0lp7O/4pT9CR8qi1WuA5jJ/E4VRNRbqZ3XIAxTs/ABRjHOGqwiIjK/rG6vtjP337hAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5874
X-purgate-ID: tlsNG-bad1c0/1795751437-BCECE034-5F4E03B3/0/0
X-purgate-type: clean
X-purgate-size: 4628
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

nhvm_interrupt_blocked() reports why an interrupt is blocked, but both
callers, nestedsvm_vcpu_interrupt() and hvm_interrupt_blocked(), treat any
reason as blocking every event source.  EFLAGS.IF (hvm_intblk_rflags_ie)
doesn't mask NMI or #MC, so NMI/#MC get held pending needlessly, e.g. when
L1 sets V_INTR_MASKING and L1's IF is clear.

Have nhvm_interrupt_blocked() take the intack and report no block for
NMI/#MC when the reason is hvm_intblk_rflags_ie.

nvmx_intr_blocked() used hvm_intblk_rflags_ie for vmexit/vmentry in
progress and a valid VM_ENTRY_INTR_INFO.  Those block every event source
and have nothing to do with RFLAGS.IF, so report hvm_intblk_arch instead.
This doesn't change behaviour as all callers only compare against
hvm_intblk_none and hvm_intblk_tpr.

Fixes: 3a1ef3c33fa7 ("Implement SVM specific interrupt handling")
Fixes: 479d4619fd5b ("Nested VMX: interrupt/exception handling for n2 guest")
Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
v3->v4: add Fixes: tag(s), collect Reviewed-by (Ross)
 xen/arch/x86/hvm/hvm.c             |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c   |  2 +-
 xen/arch/x86/hvm/vmx/intr.c        |  8 ++++----
 xen/arch/x86/include/asm/hvm/hvm.h | 12 ++++++++++--
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4334ff678d34..95247e772d09 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3897,7 +3897,7 @@ enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack)
     if ( nestedhvm_enabled(v->domain) ) {
         enum hvm_intblk intr;
 
-        intr = nhvm_interrupt_blocked(v);
+        intr = nhvm_interrupt_blocked(v, intack);
         if ( intr != hvm_intblk_none )
             return intr;
     }
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 0c1fa583d583..f366d9b92be3 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1410,7 +1410,7 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
     uint64_t exitinfo2 = 0;
     ASSERT(nestedhvm_vcpu_in_guestmode(v));
 
-    intr = nhvm_interrupt_blocked(v);
+    intr = nhvm_interrupt_blocked(v, intack);
     if ( intr != hvm_intblk_none )
         return NSVM_INTR_MASKED;
 
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index c69caa41aecd..caa2eda8256b 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -142,18 +142,18 @@ enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu *v)
     {
         if ( nvcpu->nv_vmexit_pending ||
              nvcpu->nv_vmswitch_in_progress )
-            r = hvm_intblk_rflags_ie;
+            r = hvm_intblk_arch;
         else
         {
             unsigned long intr_info;
 
             __vmread(VM_ENTRY_INTR_INFO, &intr_info);
             if ( intr_info & INTR_INFO_VALID_MASK )
-                r = hvm_intblk_rflags_ie;
+                r = hvm_intblk_arch;
         }
     }
     else if ( nvcpu->nv_vmentry_pending )
-        r = hvm_intblk_rflags_ie;
+        r = hvm_intblk_arch;
 
     return r;
 }
@@ -167,7 +167,7 @@ static int nvmx_intr_intercept(struct vcpu *v, struct hvm_intack intack)
          hvm_interrupt_blocked(v, intack) == hvm_intblk_tpr )
         return 1;
 
-    if ( nvmx_intr_blocked(v) != hvm_intblk_none )
+    if ( nhvm_interrupt_blocked(v, intack) != hvm_intblk_none )
     {
         vmx_enable_intr_window(v, intack);
         return 1;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index c6eb02c00924..9f844f32571c 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -678,9 +678,17 @@ static inline bool nhvm_vmcx_hap_enabled(struct vcpu *v)
 }
 
 /* interrupt */
-static inline enum hvm_intblk nhvm_interrupt_blocked(struct vcpu *v)
+static inline enum hvm_intblk nhvm_interrupt_blocked(
+    struct vcpu *v, const struct hvm_intack intack)
 {
-    return alternative_call(hvm_funcs.nhvm_intr_blocked, v);
+    enum hvm_intblk intr = alternative_call(hvm_funcs.nhvm_intr_blocked, v);
+
+    /* EFLAGS.IF doesn't mask NMI or #MC. */
+    if ( intr == hvm_intblk_rflags_ie &&
+         (intack.source == hvm_intsrc_nmi || intack.source == hvm_intsrc_mce) )
+        return hvm_intblk_none;
+
+    return intr;
 }
 
 static inline int nhvm_hap_walk_L1_p2m(
-- 
2.34.1


