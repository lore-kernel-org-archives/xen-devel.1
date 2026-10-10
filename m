Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A24BCA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:16:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445006.1661543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU7z-0005jt-FZ; Sat, 10 Oct 2026 10:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445006.1661543; Sat, 10 Oct 2026 10:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU7z-0005jj-Az; Sat, 10 Oct 2026 10:16:31 +0000
Received: by outflank-mailman (input) for mailman id 1445006;
 Sat, 10 Oct 2026 10:16:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU7y-0005ha-4N
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:16:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU7x-00A73P-HT
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:16:29 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca1066-bab6-0a2a0a5309dd-0a2a4509df26-12
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:16:29 +0200
Received: from [40.107.200.27]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca107c-be1a-0a2a45090019-286bc81b868f-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:16:29 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by DS7PR03MB5591.namprd03.prod.outlook.com (2603:10b6:5:2ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 10:16:26 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:16:26 +0000
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
 b=xpEVIvRfiu0uGcPK88LXRRLhLy1v0rjwgF16OUrO5VHaH42j2fPaKD+8mJ1YQF7It/YXkeT3k9S5gjKTBH+MErfvSOn3DOqoXDgqBldakSfw1kzPt2jhP23rX8KZ/8zPRsUSgGZvwc/ofbEACfZ0wSLCJJv6PQuiEZ16871BaVzJNUG9ul40KxHc9v4ZOJaGfM0GKO/JUuQTrs4YlZ/nyujPdLxnrT5kbYb6dIQpY7yMf7YnqPYFi34wpxzaUbha92P9I9rjju79wbGZE3UBfd6+Kuhs0yvAN6izca2Tl/GZSOjG3aJmiBuFY5G5okzG3Rwkyoy/qdLBOppeWchx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84G7VyoSq6ahE+el+e03faUCiDHk31YLBplLXYBqCOI=;
 b=Jcd5vmhW4e8BzO6SyCRTU9mvdiKXvjptai2SFuosC0H2RgdTNwn/vKqiWF4YW8eDzTUXTR31BdLJvuU/u51ocbxJ3t+L93nYiPJiSCihUnfYtdTOxMByR7JHI4D5j9x3+vkjpeGXi53DVbFKrRbY1n96h1sHGx+x7oi361vhriD6G57bCDpPXi+7bK0nWvJnDBxMHfDjuEOdwgmGF3gjmY4VjLDGtmdiyFl58/GgGbsrpp1S6DNmGvrvQrgEgCsIzHY/piSP4VVEGPJ+3p439AMVU25EruOfDEB56U8DpITEY2pGO/F9oPwNr0VX3CZOXWdmVoD4Qw+4uxg3JEbYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84G7VyoSq6ahE+el+e03faUCiDHk31YLBplLXYBqCOI=;
 b=t6EU9Spm6lYKDgRkobOEJ5u5tn43EsHTEavrJ3qpMXr83502D/B0nWiYAWgt7lEVwBc3+ePD4gPPrI5chWlCMchZCd3C3gBo5TE0oOYZVdQnRtuArwUXXK89RCYDl2UPz7TKQjjGE94svvy3hrpT1IUIMT591TjeGEsmUu8cxTQ=
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
Subject: [PATCH v2 12/13] x86/nestedsvm: remove nv_vmentry_pending
Date: Sat, 10 Oct 2026 18:13:25 +0800
Message-Id: <c2702630e43055d0bf45b400d69114ef3b4d7cc9.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU2P306CA0074.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3a::14) To MN2PR03MB5328.namprd03.prod.outlook.com
 (2603:10b6:208:1e2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|DS7PR03MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a91fac-e4d6-4152-0e84-08df26b78b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	2iElmtdqJOAGpoks50hl6mlSWKKAc7+1NAEQatSGq5/iowt5+EaGcucFEOuGu0rTa0eAqzmRq9OVfgrP8kw+f8IYCT4kcqru/lLF9wlYHGrtTN7qkH6I325P3iBkigKy0TD7GoCQrx2gRaaGv8vQ+HZaVkt2BmJfn3++kuDhddlaQZd9sr9MHLUCqoZGIfQJwyHIFS9wbJSe9V3DApRbLSh+OYLDvnHhugJUxeUpikMvYYqo5XYcvYl84i4UXbWjVZx+yUyQjNRFgzq5zCbciXVAgxhRe+uykcKMQ4Zi2dWroy3Ad/v+QJ0vBKjhRBODpfqXZTXHar4gZKji/ZdYFmw+/CSpCfUfuiwjF29J1sPfdkXJLRFWvYnOxEpDrwGfKoDX2CYpyCeNCvIPBFFymUoRPsYl03VmWGq7cF9kcrK0CCmdMNsm5Y7Vzeho7CK9UimPDCWL38n/s/DqyEBKcf2aKjKOHnealE/VTukqYYK/G8xC4RFLf+qrSykpFIeukkfdFf8clWBNszebg+3rxx0ji7ehO3Ja3b6MkRYMPrzBeATQuEUODDxBrVAiMsXdGbbGKeUIIwT26k/+j0iEjV0ElEEp8Ph/Z/psQ99R7z6I+YDNQEA0BdrkcvzfQBfIe5lZI7TDHkPvA/PiuQ6mhjgT/UljzqWSmQ1J6Fc/07Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IJfnkZk2/KOs4ApXr1veOoCSsJ0x1FWyLqKRxL2qGBcjIcUHsVCvWDW488lQ?=
 =?us-ascii?Q?jI1dHW4+nO24zzbcP+Uc+lMxKu30FCUl16uqfwUklxJKjTb81AQGu5rWTLC9?=
 =?us-ascii?Q?3Cez9NsdlUnmfiBLp0f7BxL90CzYlmnLOCUI3LOd1HmWUPh3neD9fw8ST6QO?=
 =?us-ascii?Q?CG0NxM1HW6GJyIhVpy/P1w7f0QmTpkxIXcMUnumNb3Yw631fC/Kn/lyE1kFf?=
 =?us-ascii?Q?9SyYVioLYdsEkf5vLCDuzrgSCBVzS3iUcZ7R5VlyfsXpRZqBEPiYfZxM7EG0?=
 =?us-ascii?Q?StpFTV/qARiDMlzduIawTBmczZ2ODycoS54NWP5Kbd7B/RJJkNInEhQbo9Cv?=
 =?us-ascii?Q?4h5uTFt7uA06UzMpBpC6lW02qoxZYeDXbgjsDmimG+oNLF2ZgiIkquDJtLYp?=
 =?us-ascii?Q?WdUiAVmy4XWaQnPP4aSs/q8TCMZ0ujPRrtbTKVBjQHN0Kg5pzMJFCE1VV/C5?=
 =?us-ascii?Q?AOu4wMUW0YRJSUvV+2qMYQz8cAr7jBDVmFzScZXoUo5DaYjXAQAlZ1kNrCR0?=
 =?us-ascii?Q?CgjtpJdwGL0OFjFES7iDXQoRcthNziWpRBGH+Oly4ObubSQJHsFW22dAIzDT?=
 =?us-ascii?Q?3nyI2LAnr0Yn0f4OPLDzJ+SIN23ybYfjyZ2Ms0UpC1C5wxbUeAx4LndungAR?=
 =?us-ascii?Q?7z0HTjqxPKNQs84eacP5EhTJMVDyGN9jLJoaiAHU1UcznVlILu7ubt6X8S2/?=
 =?us-ascii?Q?TN2+egkGcLL5HyxaNNDbitpIHhi+6I2eJLS2XOwUjncyiYbg1cnUm/fQ4ztC?=
 =?us-ascii?Q?wX/dw/8WAhQElqR4VL5lKxxfIbtqh3RcZD7fos2aK3PQQtjUVhL5/IWe1TD0?=
 =?us-ascii?Q?UulnQvDxQudqy4jQ3t0TPkaz1CUJOey8rgnESkPro6mSaJ0O7P4b2dHjRZSm?=
 =?us-ascii?Q?suj4K+pXIKDcOjzjUkKyu+MaeMjoNkLjAx8kDRs6IsCsgy91grmK/iTMeXXy?=
 =?us-ascii?Q?bdmNAshCbnI3IUcBUewc8jUKl1ecnvkoHIZGGpEruIkmkj19d03wdBds+hyc?=
 =?us-ascii?Q?N/Xs6CXa91v2X0lchtXsFi7vnNZtZlU7cc7sP5tOy/be+e4d8AowFSSdLsxo?=
 =?us-ascii?Q?m0mfyLuCcmH0SBvu/WnfLTlscz6vwocKp5NUiwXkUxj1FsxfkpbHTfW5oyjq?=
 =?us-ascii?Q?sL08zdioPfCHgX1foXx6EOpFpG3m9T4rbJIRhg4ytKjF3t+BdIrCPGiweK4i?=
 =?us-ascii?Q?X/TTwgPSB316F7+PSfZn8ThCko7OskAMAzYFI0BoQVixn7SKXnNz6iAnJHWw?=
 =?us-ascii?Q?8zIYnsyzgH+W0lKPtTGR4JV8ZxAClLL8o/3SbjLamKqKZqII/kOBPWkRXvyo?=
 =?us-ascii?Q?GWJGyRM3ftdOKuwW5q3cw5ky6xyVRqYi6pQ2PNA5qFfqAntAyfySZ1y2RIYc?=
 =?us-ascii?Q?n5SOWJjuYHwR0ZCSNnkaqNrHUtvuZdI/Gy9Juj4q3FkA4UD6tBMydxA/3p+T?=
 =?us-ascii?Q?EqPr7QD2q5NUN86NFof6KBsiFeWghUHr/PozVztEjeeUHtoLWWPtkJszEXor?=
 =?us-ascii?Q?NJKTQ4CpbtKBifqConhvtWAEzSN/3kGkp8cMk2WpUsdMx7/X0EOKIm/EU/O9?=
 =?us-ascii?Q?kqhRWseRUn5k9jUXKHpP31WOGsCdSPDTuZ8R7tR5az2CuI30cwWaPbb4SB3I?=
 =?us-ascii?Q?Lu1zJeh2sLY2qDZkVCbW8huXELLVdSEOEisXfAaDZEAcKdyWvBi/UaBpgs1v?=
 =?us-ascii?Q?0VaMwaEiBPPD+pkI7uQpBkPF2dJJ2fcU8xL6Z1la/1ycaknNYtnPURWhj2Ah?=
 =?us-ascii?Q?6f9CaXPtLQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a91fac-e4d6-4152-0e84-08df26b78b09
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB5328.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:16:26.7089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaEHV5OvFoM9TZ374/IYUsF65g/7iTqTfy7dj/VkVFRH+EPWsbD9XCin4eHbzqbUuJgbaFmtIq21pfTkJaapOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-purgate-ID: tlsNG-bad1c0/1791627389-39AC0034-C970A118/0/0
X-purgate-type: clean
X-purgate-size: 2570

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
Changes in v2:
 - No functional change, rebased only.

 xen/arch/x86/hvm/svm/intr.c      | 18 ------------------
 xen/arch/x86/hvm/svm/nestedsvm.c | 23 -----------------------
 2 files changed, 41 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 4b0debfa9a2e..7f6cafb6db78 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -77,24 +77,6 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
 
     ASSERT(intack.source != hvm_intsrc_none);
 
-    if ( nestedhvm_enabled(v->domain) )
-    {
-        struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-
-        if ( nv->nv_vmentry_pending )
-        {
-            struct vmcb_struct *gvmcb = nv->nv_vvmcx;
-
-            /* check if l1 guest injects interrupt into l2 guest via vintr.
-             * return here or l2 guest looses interrupts, otherwise.
-             */
-            ASSERT(gvmcb != NULL);
-            intr = vmcb_get_vintr(gvmcb);
-            if ( intr.fields.irq )
-                return;
-        }
-    }
-
     TRACE(TRC_HVM_INTR_WINDOW, intack.vector, intack.source,
           vmcb->event_inj.v ? vmcb->event_inj.vector : -1);
 
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 09a2187ac7e0..da5cd4848bb6 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1407,31 +1407,8 @@ void asmlinkage nsvm_vcpu_switch(void)
     vmexit:
         nestedsvm_vcpu_vmexit(v, regs, svm->ns_vmexit.exitcode);
         nv->nv_vmexit_pending = 0;
-        nv->nv_vmentry_pending = 0;
         return;
     }
-
-    if ( nv->nv_vmentry_pending )
-    {
-        int ret;
-        ASSERT(!nv->nv_vmexit_pending);
-        ret = nsvm_vcpu_vmrun(v, regs);
-        if ( ret )
-            goto vmexit;
-
-        ASSERT(nestedhvm_vcpu_in_guestmode(v));
-        nv->nv_vmentry_pending = 0;
-    }
-
-    if ( nestedhvm_vcpu_in_guestmode(v) && nestedhvm_paging_mode_hap(v) )
-    {
-        /* In case left the l2 guest due to a physical interrupt (e.g. IPI)
-         * that is not for the l1 guest then we continue running the l2 guest
-         * but check if the nestedp2m is still valid.
-         */
-        if ( nv->nv_p2m == NULL )
-            nestedsvm_vmcb_set_nestedp2m(v, nv->nv_vvmcx, nv->nv_n2vmcx);
-    }
 }
 
 /* Interrupts, Virtual GIF */
-- 
2.34.1


