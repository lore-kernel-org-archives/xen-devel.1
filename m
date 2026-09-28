Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C776BCA5FA2
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 14:03:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436045.1654808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBwr-00030R-Up; Mon, 28 Sep 2026 14:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436045.1654808; Mon, 28 Sep 2026 14:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBwr-00030K-S7; Mon, 28 Sep 2026 14:03:17 +0000
Received: by outflank-mailman (input) for mailman id 1436045;
 Mon, 28 Sep 2026 14:03:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xBBwq-0002zw-7w
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 14:03:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBBwp-007ymD-9l
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:03:15 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba7398-bab6-0a2a0a5309dd-0a2a450bd218-42
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:03:15 +0200
Received: from [40.107.209.58]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba739f-b7e8-0a2a450b0019-286bd13a8fd5-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:03:13 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BN8PR03MB5137.namprd03.prod.outlook.com (2603:10b6:408:d8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:03:10 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:03:10 +0000
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
 b=J6Zv8thdujbPZxt52d2u/rIyjXxXEUE9T1GibPar+sMR/AqshtFweuKShVWjRNp+T5D9WDg8jVN697hdrj4i6w6yoipZsdArYCZg9PLGDjAF2Y70kGXK3v8xfyarI2DZi6GZNCmrokG1Rc5ci3139UKbW+a6KdQdmnkYi5dY1KWZykUOhCbtSZp6mLYKWZYZD4LQUA4fe1Kpl0qErm3ocdz/YYYQkPzZ0j5QV4cGqawDbOIXf1zvNzp2X3ghQ3zL9YhjRK80nHMfQyruP+AMVts8oMHJ93K05IIP/Q8yqGJXXtNw1FDJEULqc7mnPmeeuD25bxI9rJsp3HXufG2AGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qTizuk1gzC5fdnXGMO16arr/pQ2aZmERraj6XVXQjw=;
 b=IDPz7TdfZPaT9fM3rllLxfKFVwjbqq/FmR7L0u1NMv76hWjFKVFgLUwS6jHy50cbxMV7xcPGhi7CJ93Fj0ZPuJQdbt6lTP13jEKxKCBO23g4J3iAzl4PDPs2Ms/plxTyyJymq01uiX3p/WzFBUc5Pjxnxod/DCmNQgPXalkIrJ19HMRCiicRPE8Ge8KFJxzmtIrUjJMyA10sS9uVmtohdaKVinhJrQef7f/qYJ/q+jPhEJLLF79lqdpUwmQjGom0oDzhQ5RC1CWVDEryaGuIQwMDy4wvajoGp0YRwQDtkD5MDcnA6k3ew+7gaQAWwx6mn+wM+Y/l1KYk4QmwhqlaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qTizuk1gzC5fdnXGMO16arr/pQ2aZmERraj6XVXQjw=;
 b=psZCL9cYRjPiG7x50osTdJfaRV/pE/7DQYwcFKN6MZId7ADTsvdU8EqOW5F9ILea/E1LxXI6NbhPrqF5F9/1rzXPMcw6l0OB0hmj6sF25lmerqeSTyV25rS4qun65Hohe/hCurt3FPXVS7uYWJcGLAaH6k0LE0/jilCfo9vAt4U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 1/5] x86/svm: Cleanup vintr_t type
Date: Mon, 28 Sep 2026 15:02:44 +0100
Message-ID: <20260928140248.1543013-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BN8PR03MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c8f2b9e-977b-455f-d3fd-08df1d693ad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	9UhgDPROazuQ+wtuAesr1ZWpWOoLBEX/TxrINy9MWkykNJPmxoCsAbkHQSnPcz+3hljbJvYBC3Ru5HFw1vb29BPp/bWLey9ZJlRuGU+LoxquQN9T/3gOkbMogORocs91WwlCBxkhGPbQ+lwRzSl8W2GzNopFDlTdAg5oKeph1egHGjIWmsMgNmm/rvMAimrru6oACeiADl0481PMJ50BrmtxS5QRhR+ZlUJmyc0mFfi++Z3LCAzI6V00Df8D/3vp/zFBHE2DjXekYlHpL6dYAwbvlVyo07oY8XZs7nIxDQ3htYgo/IEg1wxp+9EpMOx1N+GN60jUVEyBeU0LvHK7VC9jkwvAlHjOJCL8Nlxsx7gpxnZbcqmERC8vhXEdImRaur40RT7lhfZBjKblc0fWFXDv/KBgZLYpCPTBYMNRV/Sh3e/16StleCgxkgBml9iXFgT5p7EgkuJagdo7Jwi4twO6axfWuNhOPOkSo/kKs0ZoR2ZsPYXR8qYU0iH0lM+rwOSMni1+b0fQGFKjcVJh5kdTTkBLdTDq6g5iPGg2D6+qHu6ATlsSntJRFY8DjsZgB7mjQtMOJiP5CEjWxm5r625azePKDgFU9UcsWS4Pctv2m+bfHi+TGwA1wvZSOnSb3qk4mV8Fi4O2XEiLN+hbewETjjpRXw/fROJmrjo2PIc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yc3tTRV1n11Kga8JwI2v59CJWaogDiTEP42atVwwijpKnKxn9SQ9Sn3BC1XQ?=
 =?us-ascii?Q?3znbDj0OXoHbvp3wUvyN7/6JODXYu0wYHBNMNnPXiOsb2JEpIBJ+kuBb0Sw7?=
 =?us-ascii?Q?pDCXNjxiIa12TaRwMG0L7ADWyVl4xbtVtFfGNwbS6zWZrQN2qwwjwyxQRFd0?=
 =?us-ascii?Q?MX5RkFD9U+sS1hKBrAemZyqGqueu8JJz/g9YOxiYmDlWSsOrK50petcbmbeL?=
 =?us-ascii?Q?ONUyUnQVCsYINB1yT6wPABc853N6UNM6YTuMSz1DPd1bXN+JYDheEuNV5hUA?=
 =?us-ascii?Q?Iz2TAJH2VN1CDkdVC5B4JEU+0vBzIvxRabBwashbAeQMJkU/gofAGYzk5NrU?=
 =?us-ascii?Q?Te8nC7aaM4mrokuqwe3ZuHxsUDDRwl+XbTnPMKC/DezUS+w6KRqlUNRhiGG5?=
 =?us-ascii?Q?ZKTtgVlAu7dmjJgoYk0L6/czyYegmsln90KM9Mt1S7nU1qQbz4ecE4cFnThf?=
 =?us-ascii?Q?ViANFzFyC4J+uHUNU2SmdGEeQQXKGeIRz5fte0p6fPSeKAvUnRnhQYT+nCn7?=
 =?us-ascii?Q?tuJHDaT2Nrd7SuitVcnHp1M3QtwklfMhpKEO2K4+82v+MGsHct+mVfMpI8ss?=
 =?us-ascii?Q?k9JtVT5fQCMCLDvSnV4jUH3l+eoOc4P3jlnNYGq2t9FW6IH9AtfKchUH9JC+?=
 =?us-ascii?Q?NPueemxQEXf6B0QnRavIHoJGa7nApnHJNsG5hJ650EcF/zL7eDBriGX1QLx5?=
 =?us-ascii?Q?1GU5m0NH5ue6QuPmrLZhooKQCMUO9OnpbuizVVnBpijn4WMfj8XPY3DU1Iqi?=
 =?us-ascii?Q?o4e/pYLlI6uysaD1uzUvniDEfbID2tz7T92dH5pqPI0lg2P08F8X8oiBu3Nf?=
 =?us-ascii?Q?zRg/7PcBHmaGRHdsZcQRRusd0TDcda+7Fb2VL1Jt8C+Y9YSNW9FuSwf5nohP?=
 =?us-ascii?Q?VvAuTDT/X5zYojHYU4W6SZBorXe52LSyJQsvBiOgwKJ1Wcrw0oKYoXtVjT+m?=
 =?us-ascii?Q?8VWkZCCEEqd4bX54h7Y4v0JJtXuf+4cVjGEozJmfPfWi0JfjP3kKWEudry1F?=
 =?us-ascii?Q?5NWs5zdvjnY5/ipJjHV226iv3bwyKqjG79YTon05DXgGbmweizH4CP/LQekV?=
 =?us-ascii?Q?ZS1SA1FMc8xIM0p/XbnTtaAt2JakZW3s401Y6n0fAUlupc17WstpTu/OwAx+?=
 =?us-ascii?Q?BoK2uamHOm6C+b4dvSyvC++Iy2IJ3DuGRWfG7VnsJBa92c4A9qCJHralXGqt?=
 =?us-ascii?Q?KUjxBiyX6L03Q2Vg02rl0wjmmQPFwcpMHySjsJmxZMqPFgu6XohZCiBN5Uaj?=
 =?us-ascii?Q?+2RTYd0vaOMELBGEzoUDW/DXgHd1ZxvODg1EhbI4czvI8V3A1PB3SDz56/Hc?=
 =?us-ascii?Q?5aYfM+OO7zpCipp9EYnPFAN1+hQtVBjmsjRml9/8MGK16bPTbo5b6at7fNXr?=
 =?us-ascii?Q?tg7mE6dOhNyL1QlQbMBhaWSSubFzOewg4Qi4kbd2TEFNy95j6/AT8Nf3Ppy4?=
 =?us-ascii?Q?YVqCTghdJnY1oHDK0nNpiEeNTV/R9xH2KhdycTaxfk0MVsxM3zNbyMF36tRW?=
 =?us-ascii?Q?pjzWQvIR5vpW57EaltPDuCeoWdrFUflm9U1Z1idQbpTrL610KDzJ0P0tyYmX?=
 =?us-ascii?Q?C7H3TRpkN0aYKpe6A0Oktbklh7Bkbvek30qEIlLh5GNAZkjniB/0OGpfohUY?=
 =?us-ascii?Q?7RgfLR38Tn6Be923P+frvfzrYhEpO5DmPCrhgosszOlrEMbtXnRtWCeSP71h?=
 =?us-ascii?Q?anYLFT0mNdYlrGaYM9vXse+2yUfoF9DftIhekYAOGkvp8D9tHKNRCVnjhw51?=
 =?us-ascii?Q?IQN+qTWBkgB113f/eusiWvo2sPQQ6tQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8f2b9e-977b-455f-d3fd-08df1d693ad5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:03:10.6808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27PAvdSynfq0Aub0Jox4LL6VRBmRmugVF83J6yCzEcoa5Mcuy/+SoLeVUCF5CDRqrnZ/9CEuwC4ULxs+KY8Y+3/OrNGwqwDR2w0Cd+fvdgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5137
X-purgate-ID: tlsNG-42698a/1790604195-192CC9EA-82CC9F14/0/0
X-purgate-type: clean
X-purgate-size: 11962

Rearrange the union to drop the .fields infix, rename bytes to the more
common raw, adjust types where appropriate, and simplify some names.
Adjust the users accordingly.

No functional change intended.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/intr.c      | 16 +++++++--------
 xen/arch/x86/hvm/svm/nestedsvm.c | 32 ++++++++++++++---------------
 xen/arch/x86/hvm/svm/svm.c       | 18 ++++++++--------
 xen/arch/x86/hvm/svm/vmcb.c      |  6 +++---
 xen/arch/x86/hvm/svm/vmcb.h      | 35 ++++++++++++++++----------------
 5 files changed, 52 insertions(+), 55 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 4b0debfa9a2e..883fde873e73 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -33,9 +33,9 @@ static void svm_inject_nmi(struct vcpu *v)
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
     intinfo_t event;
 
-    if ( vmcb->_vintr.fields.vnmi_enable )
+    if ( vmcb->_vintr.vnmi_en )
     {
-        vmcb->_vintr.fields.vnmi_pending = true;
+        vmcb->_vintr.vnmi_pending = true;
         return;
     }
 
@@ -90,7 +90,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
              */
             ASSERT(gvmcb != NULL);
             intr = vmcb_get_vintr(gvmcb);
-            if ( intr.fields.irq )
+            if ( intr.irq )
                 return;
         }
     }
@@ -119,10 +119,10 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
         return;
 
     intr = vmcb_get_vintr(vmcb);
-    intr.fields.irq     = 1;
-    intr.fields.vector  = 0;
-    intr.fields.prio    = intack.vector >> 4;
-    intr.fields.ign_tpr = (intack.source != hvm_intsrc_lapic);
+    intr.irq     = 1;
+    intr.vector  = 0;
+    intr.prio    = intack.vector >> 4;
+    intr.ign_tpr = (intack.source != hvm_intsrc_lapic);
     vmcb_set_vintr(vmcb, intr);
     vmcb_set_general1_intercepts(
         vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
@@ -158,7 +158,7 @@ void asmlinkage svm_intr_assist(void)
          * has vGIF, and vGIF is always activated when appropriate.
          */
         if ( intblk == hvm_intblk_nmi_iret &&
-             vmcb->_vintr.fields.vnmi_enable )
+             vmcb->_vintr.vnmi_en )
             intblk = hvm_intblk_none;
 
         if ( intblk == hvm_intblk_svm_gif )
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 81579370b8bf..65556136852b 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -442,7 +442,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     if ( !clean.tpr )
     {
         n2vmcb->_vintr = ns_vmcb->_vintr;
-        n2vmcb->_vintr.fields.intr_masking = 1;
+        n2vmcb->_vintr.intr_masking = 1;
     }
 
     /* Interrupt state */
@@ -652,7 +652,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     svm->ns_hap_enabled = vmcb_get_np(ns_vmcb);
 
     /* Remember the V_INTR_MASK in hostflags */
-    svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.fields.intr_masking;
+    svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.intr_masking;
 
     /* Save l1 guest state (= host state) */
     ret = nsvm_vcpu_hostsave(v, inst_len);
@@ -738,8 +738,8 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
     struct vmcb_struct *ns_vmcb;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
-    if ( vmcb->_vintr.fields.vgif_enable )
-        vmcb->_vintr.fields.vgif = 0;
+    if ( vmcb->_vintr.vgif_en )
+        vmcb->_vintr.vgif = 0;
     else
         svm->ns_gif = 0;
 
@@ -997,7 +997,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     /* Virtual Interrupts */
     ns_vmcb->_vintr = n2vmcb->_vintr;
     if ( !svm->ns_hostflags.fields.vintrmask )
-        ns_vmcb->_vintr.fields.intr_masking = 0;
+        ns_vmcb->_vintr.intr_masking = 0;
 
     /* Interrupt state */
     ns_vmcb->int_stat = n2vmcb->int_stat;
@@ -1217,8 +1217,8 @@ nestedsvm_vmexit_defer(struct vcpu *v,
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
-    if ( vmcb->_vintr.fields.vgif_enable )
-        vmcb->_vintr.fields.vgif = 0;
+    if ( vmcb->_vintr.vgif_en )
+        vmcb->_vintr.vgif = 0;
     else
         svm->ns_gif = 0;
 
@@ -1485,8 +1485,8 @@ nestedsvm_gif_isset(struct vcpu *v)
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
     /* get the vmcb gif value if using vgif */
-    if ( vmcb->_vintr.fields.vgif_enable )
-        return vmcb->_vintr.fields.vgif;
+    if ( vmcb->_vintr.vgif_en )
+        return vmcb->_vintr.vgif;
     else
         return svm->ns_gif;
 }
@@ -1533,7 +1533,7 @@ void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v)
 
     /* After a CLGI no interrupts should come */
     intr = vmcb_get_vintr(vmcb);
-    intr.fields.irq = 0;
+    intr.irq = 0;
     general1_intercepts &= ~GENERAL1_INTERCEPT_VINTR;
     vmcb_set_vintr(vmcb, intr);
     vmcb_set_general1_intercepts(vmcb, general1_intercepts);
@@ -1569,12 +1569,12 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
             vmcb_set_general2_intercepts(vmcb, general2_intercepts);
         }
 
-        if ( !vmcb->_vintr.fields.vgif_enable &&
+        if ( !vmcb->_vintr.vgif_en &&
              cpu_has_svm_vgif )
         {
             vintr = vmcb_get_vintr(vmcb);
-            vintr.fields.vgif = svm->ns_gif;
-            vintr.fields.vgif_enable = 1;
+            vintr.vgif = svm->ns_gif;
+            vintr.vgif_en = 1;
             vmcb_set_vintr(vmcb, vintr);
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
             general2_intercepts &= ~(GENERAL2_INTERCEPT_STGI |
@@ -1593,11 +1593,11 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
             vmcb_set_general2_intercepts(vmcb, general2_intercepts);
         }
 
-        if ( vmcb->_vintr.fields.vgif_enable )
+        if ( vmcb->_vintr.vgif_en )
         {
             vintr = vmcb_get_vintr(vmcb);
-            svm->ns_gif = vintr.fields.vgif;
-            vintr.fields.vgif_enable = 0;
+            svm->ns_gif = vintr.vgif;
+            vintr.vgif_en = 0;
             vmcb_set_vintr(vmcb, vintr);
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
             general2_intercepts |= (GENERAL2_INTERCEPT_STGI |
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 71e48351f22c..05e25764f4b3 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -498,8 +498,8 @@ static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
     if ( vmcb->int_stat.intr_shadow )
         intr_shadow |= HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI;
 
-    if ( vmcb->_vintr.fields.vnmi_enable
-         ? vmcb->_vintr.fields.vnmi_blocking
+    if ( vmcb->_vintr.vnmi_en
+         ? vmcb->_vintr.vnmi_blocking
          : (vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET) )
         intr_shadow |= HVM_INTR_SHADOW_NMI;
 
@@ -515,8 +515,8 @@ static void cf_check svm_set_interrupt_shadow(
     vmcb->int_stat.intr_shadow =
         !!(intr_shadow & (HVM_INTR_SHADOW_MOV_SS|HVM_INTR_SHADOW_STI));
 
-    if ( vmcb->_vintr.fields.vnmi_enable )
-        vmcb->_vintr.fields.vnmi_blocking = block_nmi;
+    if ( vmcb->_vintr.vnmi_en )
+        vmcb->_vintr.vnmi_blocking = block_nmi;
     else
     {
         uint32_t gen1 = vmcb_get_general1_intercepts(vmcb);
@@ -961,8 +961,7 @@ static void noreturn cf_check svm_do_resume(void)
 
         /* Reflect the vlapic's TPR in the hardware vtpr */
         intr = vmcb_get_vintr(vmcb);
-        intr.fields.tpr =
-            (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
+        intr.tpr = (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
         vmcb_set_vintr(vmcb, intr);
     }
 
@@ -2538,7 +2537,7 @@ void asmlinkage svm_vmexit_handler(void)
     {
         intr = vmcb_get_vintr(vmcb);
         vlapic_set_reg(vlapic, APIC_TASKPRI,
-                   ((intr.fields.tpr & 0x0F) << 4) |
+                   ((intr.tpr & 0x0F) << 4) |
                    (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0x0F));
     }
 
@@ -2772,7 +2771,7 @@ void asmlinkage svm_vmexit_handler(void)
         u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
         intr = vmcb_get_vintr(vmcb);
 
-        intr.fields.irq = 0;
+        intr.irq = 0;
         general1_intercepts &= ~GENERAL1_INTERCEPT_VINTR;
 
         vmcb_set_vintr(vmcb, intr);
@@ -3063,8 +3062,7 @@ void asmlinkage svm_vmexit_handler(void)
 
     /* The exit may have updated the TPR: reflect this in the hardware vtpr */
     intr = vmcb_get_vintr(vmcb);
-    intr.fields.tpr =
-        (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
+    intr.tpr = (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
     vmcb_set_vintr(vmcb, intr);
 }
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index a6f09672a7c5..753f5d295064 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -105,7 +105,7 @@ static int construct_vmcb(struct vcpu *v)
     vmcb->_iopm_base_pa = __pa(v->domain->arch.hvm.io_bitmap);
 
     /* Virtualise EFLAGS.IF and LAPIC TPR (CR8). */
-    vmcb->_vintr.fields.intr_masking = 1;
+    vmcb->_vintr.intr_masking = 1;
 
     /* Don't need to intercept RDTSC if CPU supports TSC rate scaling */
     if ( v->domain->arch.vtsc && !cpu_has_tsc_ratio )
@@ -192,7 +192,7 @@ static int construct_vmcb(struct vcpu *v)
     if ( default_xen_spec_ctrl == SPEC_CTRL_STIBP )
         v->arch.msrs->spec_ctrl.raw = SPEC_CTRL_STIBP;
 
-    vmcb->_vintr.fields.vnmi_enable = cpu_has_svm_vnmi;
+    vmcb->_vintr.vnmi_en = cpu_has_svm_vnmi;
 
     return 0;
 }
@@ -275,7 +275,7 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
            vmcb_get_iopm_base_pa(vmcb), vmcb_get_msrpm_base_pa(vmcb),
            vmcb_get_tsc_offset(vmcb));
     printk("tlb_control = %#x vintr = %#"PRIx64" int_stat = %#"PRIx64"\n",
-           vmcb->tlb_control, vmcb_get_vintr(vmcb).bytes,
+           vmcb->tlb_control, vmcb_get_vintr(vmcb).raw,
            vmcb->int_stat.raw);
     printk("event_inj %016"PRIx64", valid? %d, ec? %d, type %u, vector %#x\n",
            vmcb->event_inj.raw, vmcb->event_inj.v,
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 3760f71a8625..869d965ba398 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -330,26 +330,25 @@ typedef union {
 
 typedef union
 {
-    u64 bytes;
     struct
     {
-        u64 tpr:          8;
-        u64 irq:          1;
-        u64 vgif:         1;
-        u64 :             1;
-        u64 vnmi_pending: 1;
-        u64 vnmi_blocking:1;
-        u64 :             3;
-        u64 prio:         4;
-        u64 ign_tpr:      1;
-        u64 rsvd1:        3;
-        u64 intr_masking: 1;
-        u64 vgif_enable:  1;
-        u64 vnmi_enable:  1;
-        u64 :             5;
-        u64 vector:       8;
-        u64 rsvd3:       24;
-    } fields;
+        uint8_t tpr;
+        bool irq:1;
+        bool vgif:1;
+        bool :1;
+        bool vnmi_pending:1;
+        bool vnmi_blocking:1;
+        uint8_t :3;
+        uint8_t prio:4;
+        bool ign_tpr:1;
+        uint8_t rsvd1:3;
+        bool intr_masking:1;
+        bool vgif_en:1;
+        bool vnmi_en:1;
+        uint8_t :5;
+        uint8_t vector;
+    };
+    uint64_t raw;
 } vintr_t;
 
 typedef union
-- 
2.55.0


