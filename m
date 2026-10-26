Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17535606A321
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 07:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ZHSZAWqM
Received: from list by lists.xenproject.org with outflank-mailman.1460822.1671687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEzT-0006Z5-CL; Mon, 26 Oct 2026 07:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460822.1671687; Mon, 26 Oct 2026 07:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEzT-0006Yy-9e; Mon, 26 Oct 2026 07:19:31 +0000
Received: by outflank-mailman (input) for mailman id 1460822;
 Mon, 26 Oct 2026 07:19:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xLEzS-0006Y9-0P
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 07:19:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLEzR-004Ztt-DR
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 08:19:29 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefef9-e002-0a2a0a5209dd-0a2a4502be40-42
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:19:29 +0100
Received: from [40.93.198.49]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefeff-6ca4-0a2a45020019-285dc6318dca-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:19:29 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by CH3PR03MB724106.namprd03.prod.outlook.com
 (2603:10b6:610:346::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:19:25 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 07:19:25 +0000
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
 b=iwOmmIggGRj9QmIINJVD9X2dDMhwiJbYEcX1PXoqvmdU6n5nG6S5zXA9aKgwd0nUQUhG/G65/YQCMZQ8afAYINTGMzGgEgbwjrZWtuAzxGAk1LvGZsUEnPtF9dE3LeNON4E2ukl7rFAP4FHUIf7pC723EXLlCBrDAAbAl1VECEsUK3UZRX0+O4ezRqagcFhskgt0urRkcYnDpHLfN4haZIRD0EK9inqt+6ZiKIsH4jyYXW+5a9jnQuqeQNkkelCBQPTq7EQEammdsDFBOV0cPiphnk8YzfLkAOXSw6Yq/dh/XZPTCDiBT/UOsx8AnBGmTIz+5X+g3xoq+2UdEG2dfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNNSJ5mfb8V73tXKnW51NLcrpjhWgm5pA8gz9jyDcdY=;
 b=y474i8bFeRjdKOTAChgMpVHAgg73rjyUv1DDSpNtLekxPuOHEk8SeGMX9/yd0NeQ9LThd1CccYZS3poNBXerbVt6hchrfXlt75ZrLSbo1PNIoxgul4akg4Br1+6K9uzoFXvI2zUq1/V9eFLYritEZNat6NwVSXBLxW+aSs18dN2zArUMhac5PlLHCP8G0UUVWZ2N8C1V97oY7feW2mWlIFD3l69+H39hvmMMdlmV0dVzGbSM12UYB+kkq5wDsfkwJxibQzWwApqg8w/BvetNxxemAFt359ZP8D22SkqhcB/pB6yNAsmkYEkvzahgR+8m1s9JjtZC4pfw3lRzIy5Okg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNNSJ5mfb8V73tXKnW51NLcrpjhWgm5pA8gz9jyDcdY=;
 b=ZHSZAWqMuO86UiokWfiNVvg/hyqxxZI0WK0DGHXELDP4uNqTi71ADQAiG185WWAvQ8RUntjDVefNl8Nai9zoE54n33mMH9WVgiLUaS/X0DW75efj8EeBPmTTqvh0YYvP9ZgMLWbDO/C3KfHKMEKKqLzhqkh0mTVVp2R/TyjVF5I=
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
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH V1 8/8] x86/vmx: Fix nested VPID handling
Date: Mon, 26 Oct 2026 15:17:54 +0800
Message-Id: <f9fa7e9b9fa9ec2f68ac363ce80bed53a2d13195.1792997742.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792997742.git.chunjie.zhu@citrix.com>
References: <cover.1792997742.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0106.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:cf::17)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|CH3PR03MB724106:EE_
X-MS-Office365-Filtering-Correlation-Id: 83102bdd-77aa-41be-aa37-08df333176b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|5023799004|56012099006|261009223027099003|261022105027099003|261021123027099003|261021121427099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	KPTSjEMgBsmGSvJQRAZG4lgBw69tul0EB5waIIhrwdrRE/zwyVGvJ/loV7Iweo1TgZ2Jey/Tu8GDcAhqR13n53ttxUWdK7e3YGH/a3hqcJrro4yfodQfefShL43bpXARvZJOqAjBRF2MTsa056rS4pQ/KYzbQdtPMOSj++PU1ZJE3MiHcRw5Yey3VdKfjwEJ+vfFgCLB4tBV0DQDhFJ/IGzrHjwiuOu1R/wbjNXf1VgMZmTuFFjnIJD6r2IARdKLv5q3fHUQgUP29dMuHp3aAnKJd063jWkG369y6Fl3qNAM+VRc3fEn2YcdsFGjPGDDyFFmTNOIYB0bQTGmSBSxNLlR6w++dIm1gXSwOULob0nlMWDA+b+LTS8QUtAEvanMY8VqJyVTahuoyzGU8gHSNN3HylPddXlCOmXcVKbgdJJfe0GA3lHB0Imb1jYYDhPsO+jlZoFIvGaHqHir/HE3KCWRbY1U+aKUzz1cAmT6WZLEpVDUni9u+B/qgMA/rIikI6ImKt3Nge/DIkVmdnNCzXjD4xztVj5QXSGa6JUhYC7m109W1+NjN6rkKSc67lVzvZMTV5FjNfo/5BV/wp4DXYLhMbIL+2406NY/eYqn2irar/EPOk7a12pm7MdfaGh22rO0M+Jpdhfncz86+NeAZuLEEMRBtRDErXGhXVsc8PA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(5023799004)(56012099006)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MaBVi6+xg9UGqkIareT2lOHBWJNrF4DPzJBkvJ2fuF3ZrMIudn+uNLe4EPHl?=
 =?us-ascii?Q?qHqGU+Ui2LWc8ODOXsS/WOQCylMM6oMqbV3XN63V3UlaVtZEpNEvcjI3TDvY?=
 =?us-ascii?Q?uEB9iktIk2telKYExO36VdwnnrFSrPiKKR8Dba04KIqeW/YjDcYx0p6zNgpr?=
 =?us-ascii?Q?Wi5mBSohjkRwCD5aQY4nCo/KAgxVImtnfLtI8kGiaCTs28h4YBbuMT7+Tdc2?=
 =?us-ascii?Q?1Upz8Vlnr/qtNlmpnatX9kNCfgNjFXWqRbmkbZrycmy4AGPipBZHHrU47Rps?=
 =?us-ascii?Q?K6TTa6eEFvzApl9LwHsY8x8lGwO/RFZOmU+K+n/rDS6v4XuWHtVHWmxwwlNS?=
 =?us-ascii?Q?vhccPxNZCQd7ScVGmloYPxNE6C0aw3sWWRFvT8cnPUxaY6Qou/hTM9Gok4RQ?=
 =?us-ascii?Q?OObkzqG6ZDfp/tzEFar8qiOQJOL9OigfPUQl+AQ3OkrhlUKqwn2JsWKMStIR?=
 =?us-ascii?Q?LZgk1q4b7wnuDkK+Gy4QdzGsZ/G0toKihwpMUVtXxgowHcxXi9InOlLRpuJf?=
 =?us-ascii?Q?8QWF2sId802gmO7PnMG5GF0nTWK/xAD0VqwnOd/GYzjZk57dB1kwK6uFIK+A?=
 =?us-ascii?Q?Jp5UbBOORWU8IzsDxWuOcFeNySadJn78+xbsoeaa1/aVkV+/ewftRJkReEgk?=
 =?us-ascii?Q?D00vxKFdWcDafLqrsu1Q3YqF1zcCk+fyWKTbBhl57sxyB33Xyeb1+V/qN3GY?=
 =?us-ascii?Q?RpQwGjkik2rp641fTzYY0CLs4ZFG24Njof6CszwBC1ztgHTeuFXv3u3DL1Aj?=
 =?us-ascii?Q?drqrIBjGBS9IIlr1zQn4uJGMoDTK2N1Pz1Abe1v81oKSYELGGAFIY8ytrgTQ?=
 =?us-ascii?Q?A+Vxz243h/XE0sHEEMe7qKAXCwAygULsbVmHbv7+EPksZFyWMXcmbF0FVtAN?=
 =?us-ascii?Q?hYqqw7QmIUIq1PSdpQrgubFGjgfpTyDtfDuijsP1LII6zuC5uW9QKTbjeKwS?=
 =?us-ascii?Q?WfPzX5xTsuIjNXCctDmkkT408s3KHggdZaMkeMaYG8nk/YYEUfwV0Sy5ENzW?=
 =?us-ascii?Q?s4D8TZm/SGcJb51IdRlWYY892YNSJFnHzh2rRtU0ab+SHeZ9Z9JjqF+46Kar?=
 =?us-ascii?Q?dH8oV8M2RBQUVjspCrATi+n9zOKGGuFmsybOQmeKeEme/N9gXF1w3vVFyGHv?=
 =?us-ascii?Q?QGNWTe5VCKbVto0PCXhFGwNejbzJlSiL/p+1wxYr6xmK8ZG4OkXeXhJTS8xq?=
 =?us-ascii?Q?yI/Vg1h7DXs/7pqLt9egAMwAZoasOatNbVx09TZ6dfHvaNftHdAANEmKY8zd?=
 =?us-ascii?Q?og1eVPrwZPE9D1ZZzb62jBVEBx38A6nifEVu+4FHnTJBHbBpx/TcHbMoIy5f?=
 =?us-ascii?Q?GxAfghdvegpMy5Ajdb43LtKhaduhwRm7afCdpYC9igvCp5DRN4Kq58qXZNAV?=
 =?us-ascii?Q?RpWN7ts1jNZI/I25t7Hq4j8xuscz4hD7RTmQQOwEoZCw7LfMY6B96bepgspf?=
 =?us-ascii?Q?Yflk6kVetONFb69acVFHTp5AalZn03X97bN+R04tnnuuE1nqce4ZGqfVnejv?=
 =?us-ascii?Q?3fc6bXOxiTuqn9QPIzBgfHDjqLmN/HeiRFy3/FbCJEK3JvgGfRlpEk1Kltl4?=
 =?us-ascii?Q?9KLP273A/NO7ORzsKV6daP5mBTXVriI85BO289NyuB/pmVBaJpLTOj7AT1nB?=
 =?us-ascii?Q?cWfwHiO5lqCzRgvpKtJ0e9ZNlmEooH9JgC08bACbF41tr3jG6HylewkK05Xs?=
 =?us-ascii?Q?Z7TWMyLXjB5tDSTP6Uq7HKRFxlyvA6ZTMMUWe8opCZTpgZ2MxUPhHnlDxbeZ?=
 =?us-ascii?Q?7BO3DWNWRA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83102bdd-77aa-41be-aa37-08df333176b8
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 07:19:25.2724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9pQj/coxG9vwP/cSjvIBqg4PiEBK1CIIsFpq2f66IR6d+Wb8697vsZaTct7nVVGoRwq6Gu6/ZUNPukYY2zWtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB724106
X-purgate-ID: tlsNG-720697/1792999169-F3EBB2AC-D7A5B996/0/0
X-purgate-type: clean
X-purgate-size: 4229
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Some nested VPID problems:

* nept_get_ept_vpid_cap() ORed NVPID_CAP_BITS into the low half of
  IA32_VMX_EPT_VPID_CAP.  The VPID capability bits (INVVPID support
  and types) live in bits 32 and up, so the low-half write advertised
  unrelated EPT capabilities to L1 and never the intended INVVPID ones.
  Shift them into place.

* virtual_vmentry() only tracked the L2 VPID when L1 enabled VPID.
  When L1 does not use VPID, all of L2's linear mappings are tagged
  with VPID 0 and must be invalidated on every virtual VM entry, so
  flush the n2asid in that case as well.

* vmx_vmenter_helper() jumped over the whole ASID/EPT invalidation
  block when the CPU lacks VPID, which also skipped the EPT
  invalidation that has nothing to do with VPID.  Skip only the VPID
  part.

* Require VPID hardware support for nested virt.  Without VPID, every
  virtual VM entry/exit flushes the whole TLB, which makes nested VMX
  too slow to be useful.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c       |  4 ++--
 xen/arch/x86/hvm/vmx/vvmx.c      | 11 ++++++-----
 xen/arch/x86/mm/hap/nested_ept.c |  2 +-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ed4ff56e7797..8b06a462602d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4943,7 +4943,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
         vmx_pi_do_resume(curr);
 
     if ( !cpu_has_vmx_vpid )
-        goto out;
+        goto skip_vpid;
     if ( nestedhvm_vcpu_in_guestmode(curr) )
         p_asid = &vcpu_nestedhvm(curr).nv_n2asid;
     else
@@ -4975,6 +4975,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
     if ( unlikely(need_flush) )
         vpid_sync_all();
 
+ skip_vpid:
     if ( !paging_mode_shadow(curr->domain) )
     {
         struct ept_data *ept = &p2m_get_hostp2m(currd)->ept;
@@ -5017,7 +5018,6 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
                      inv == 1 ? single->eptp          : 0);
     }
 
- out:
     if ( unlikely(curr->arch.hvm.vmx.lbr_flags & LBR_FIXUP_MASK) )
         lbr_fixup();
 
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index d1bfc1f23612..6c2629f20742 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1264,12 +1264,14 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
         __vmwrite(EPT_POINTER, get_host_eptp(v));
 
     /* nested VPID support! */
-    if ( cpu_has_vmx_vpid && nvmx_vpid_enabled(v) )
+    if ( cpu_has_vmx_vpid )
     {
         struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
-        uint32_t new_vpid = get_vvmcs(v, VIRTUAL_PROCESSOR_ID);
+        uint32_t new_vpid = nvmx_vpid_enabled(v) ?
+                            get_vvmcs(v, VIRTUAL_PROCESSOR_ID) : 0;
 
-        if ( nvmx->guest_vpid != new_vpid )
+        /* Without VPID, every virtual VM entry invalidates linear mappings. */
+        if ( !new_vpid || nvmx->guest_vpid != new_vpid )
         {
             hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
             nvmx->guest_vpid = new_vpid;
@@ -2909,9 +2911,8 @@ void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr)
 
 void __init start_nested_vmx(struct hvm_function_table *hvm_function_table)
 {
-    /* TODO: Require hardware support before enabling nested virt */
     hvm_function_table->caps.nested_virt =
-        hvm_function_table->caps.hap;
+        hvm_function_table->caps.hap && cpu_has_vmx_vpid;
 }
 
 /*
diff --git a/xen/arch/x86/mm/hap/nested_ept.c b/xen/arch/x86/mm/hap/nested_ept.c
index f8563156b6d0..18d5de870013 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -101,7 +101,7 @@ uint64_t nept_get_ept_vpid_cap(void)
     if ( !cpu_has_vmx_ept_exec_only_supported )
         caps &= ~VMX_EPT_EXEC_ONLY_SUPPORTED;
     if ( cpu_has_vmx_vpid )
-        caps |= NVPID_CAP_BITS;
+        caps |= (uint64_t)NVPID_CAP_BITS << 32;
 
     return caps;
 }
-- 
2.34.1


