Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6256C531FC
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 15:05:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371723.1619208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woMtD-0003yU-PA; Mon, 27 Jul 2026 15:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371723.1619208; Mon, 27 Jul 2026 15:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woMtD-0003yL-M5; Mon, 27 Jul 2026 15:05:11 +0000
Received: by outflank-mailman (input) for mailman id 1371723;
 Mon, 27 Jul 2026 15:05:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1woMtC-0003uT-Hn
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 15:05:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woMtB-0007da-UJ
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 17:05:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a6773a4-bab6-0a2a0a5309dd-0a2a450ce3a8-10
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:05:09 +0200
Received: from [40.93.196.34]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a6773a4-f479-0a2a450c0019-285dc422c431-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:05:09 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SN7PR03MB7120.namprd03.prod.outlook.com (2603:10b6:806:350::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 15:05:07 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:05:06 +0000
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
 b=OIBat6jkRD+tnlX2AS6BP6Ij/dSAGdwfzQFa8MkKu3mFPx0lQ/nfHKEFL24tMQIQfYNvhTOMVIhUHisWTxOHNOnAefmR2m5gMsBJIfUe+2p1F1xrPHrB1lESnReexeH7s8W5cTn+GnawJ39P5KSFp7E3H98dayE2Ui/Pt4HYygblbYsqFwYU+hUgIn8xF/2fsSBMmQrWYNCxqq5/I99Yl2XoaFwXKIZwPoLaHM/oEzEZPkgMNi4Fy/1ge8Kxd7gdwp048rqXEHwoysOVAwlVRydFcF9aDpc0oymI+TFD4Ed+hmvpVBWuAR1vXjkWVn9wh4TdvjFEZRce0kprprRNpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaSZ+4Bh6/Qv4PdxxpQxW+d/eMMp06pD/qD0eGNft/o=;
 b=ucJuljTARHb9Oz5Ea7A+u5G+wXOR7epVSRJB9ZhoHMtibelq9CDJstoVHomSnpu78pkjgPvCgkW2GGId1mUlhlIrJWTVZPW2ZYvflixFVRGb+4Oio/omfVbJWCQUA5sWjLfu6saQ/bGhLcdtQHD8eC/oHLGz3nufuxRvo8yk9c5FkY4aVkXOFmP8fcPLuFEvkNYtZO2YpnmUGXGTurbT2X4mPhY+kA0I0PWGzxhOismK4PSqc4rKHQrZRiG71pEQHcKUyUMFiYPlPJXrxmLvCTFkapdvNJ1pRhRuMQaLdjg1SMaka1vCtUX8LwmleWQNOyi7xkmBaPp3e7ugPkSSrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaSZ+4Bh6/Qv4PdxxpQxW+d/eMMp06pD/qD0eGNft/o=;
 b=Km6Bo/WLvPMleGOHGgB55YgCzP/KX6U2Gjv0b8j5UulCnZNc7nQdVNk/GqBJOGXMkQeizPXQGVQPR2avNzPe0Rl8Zaeqkvqa9DeDRGiEhMmt/Gf6Wmz7PhbfnaRaWjYQ9FffaH5nGIbtSJPchDPc7WbPjflYPB4f5/bKQLULeLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 2/4] x86: extend mod_l1_entry() to optionally return the old PTE value
Date: Mon, 27 Jul 2026 16:06:13 +0100
Message-ID: <20260727150615.1373200-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260727150615.1373200-1-kevin.lampis@citrix.com>
References: <20260727150615.1373200-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0322.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::21) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SN7PR03MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 8555dcac-cdd5-49fc-4d42-08deebf071db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	GfNxjlXr7UUWS7Flvp2uuG4qBPejGw5t2SI5Uw9Kw398FjGQ0P2r1XR104oL8rVi4ACXvcotOF8R2+cIR7kwN/n1bF3VBFlcpjg/kcsrw3vkuiY+hlDlrEFUnfxLbgizSXmKb2BeCJwinq7ttSHYMAqZfMSl2Eylg7LFI6IZqV4bvZUrOenk1C2l1B/F5/91KVH5pzOgShxTSMLyDcX3NY+S2CgFzydX52nyNN0okYECoVlNVLxNHcuaFBzzNKqvWxLaXh1XQHRWRZG1yD9dZrmULLklLHyNhLd3s/S/G1a8jGx4ijnr/QroQ5CMpOGsxuQJuDEw9gaUGan386DH9xxytUr+9AIjBA8HkmmCbOY4TMautjRGL2sNpGcYquv/sCxuY79ivEM9vYcZRClUYmWExhLHlzPjxAiOm15EnFUu0QvF9c/9q6/mAJ0aShkTJNkM16jEDYJ6hAVINBEG+4wXrxmplPDuRbDAkHy4FN35XgyLX3VcK97BwbGtCqRxd6Ma47aQF8tR8l4rgoDt2qoEYYzgh86n9QzQgDlwQgSYnXIJ4xwSzn/nrHWQKKMyIOfStk4JHRq/3vLcHfO+N7boIyO18oJqVfy6vx/1EKomOrrljKVvRABoUx8fN4SFkG+4nvfp54iO/zRI+ktP3R7UeSP0Eov+wnPKH3BEH+U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PQ6dgHjP47WlggWCt5wAr6Jklk00g045J1rdnSfgOgr4zbn8XeQ7ig+4RIvw?=
 =?us-ascii?Q?YLbHoI4b+RxGTf4P1xHUe60XgZr7Enn5mJP/OYt5bSzst0bCEIALOec6LFP2?=
 =?us-ascii?Q?1K6ewr+jsVa+LaqITqZ/1MPuv5QumI4wmvWcK/NEtTofmqFW6n1yroAmMxqW?=
 =?us-ascii?Q?TOn715aXMXAn3WtL7d7v4i65eId7k9SfJfBp71ED0W2eRIdRiejWEndHVe5M?=
 =?us-ascii?Q?EctR93crsMgL4wa1trc3tDi1NPYfheEffBPP+zkV1IHyzauuXzcD2FkNAVK2?=
 =?us-ascii?Q?Gp8oZI9et19B4Bh/aN/SiGIBiX9/RpPZxJ5FWSD4WdKy50nm9eAGuMsPrpnP?=
 =?us-ascii?Q?yULLPM0AYxEl4Y8yuSKPSA7fCllk0XfYEdNU+gL+HM+c8AGJT0HKxeHpV9R2?=
 =?us-ascii?Q?2VHEU3NL89fvjEhnbkuYLQcbQg3QxzW9YxgxcdI8o+gfSwnFdzNuPXvXyrmf?=
 =?us-ascii?Q?2umxyeTsrxWWLv4w9dXYkyCZQhkmqlMclYKDxUMaqO4rkCTEbF47pe1RJ8KV?=
 =?us-ascii?Q?tS9Sjb5n++E0Ojna2/z6XzBc5QwduFdxQ49HeDpmAKPzTZN6HmS7R211FFM9?=
 =?us-ascii?Q?unqjUe9oOCeSRIHUEBoI0ZKHYcpVI+33KV+HP4bHo04WRKceIWNsxm1u0HJl?=
 =?us-ascii?Q?xPhf/nMTCLA39gILb87QsZLGhmThHkvf2DOkS2cGSQJ4VbXgrGQgMw3Gqrm3?=
 =?us-ascii?Q?EqI4KueAB0XY3+HdfuTxGXxDK9uF9cS6zjO0MiEN9aaYOUrAaa11QoYEoZms?=
 =?us-ascii?Q?xr5TiPcIbFpG4Ms1H2r9t+xkFEPwvkscxTrZlO5iBF6LsdfD1FEyauN7ySwl?=
 =?us-ascii?Q?/83itqAtyB9WSwWArL5N/iNEwp8EGfl96h0kpWmL0PRptsjScWYd5+S+6G9I?=
 =?us-ascii?Q?fjwq9is85HUqVi7+k7JbrtlLDfTV8Fq0MsTa5xebNaPgCicEu94nq2W6xM1H?=
 =?us-ascii?Q?tEA/sspBqsqEMRD0TiRiwy9HSQOEZkeWbTpjZZctOs8dC/79J+WihxhZ5HSD?=
 =?us-ascii?Q?a170qosiWzllZuqe/H6imLayK6NTLwXfXuz9WwP2NYdnboBEVxty5YRDJIK1?=
 =?us-ascii?Q?5dw297+xHbC2Zf9U4ORd693+XPMiPDlHAapa/0zz2G9l/m2d2+YD1K5KjasU?=
 =?us-ascii?Q?VFVEQ5/o/wzDsUIWUfr6vzuqVb+3GhqKbD19kmv8YhVA/PpkbndHOrK151Nb?=
 =?us-ascii?Q?pu2Iv1YGsAbQYxaLXxmneIY7B8lXsDZIAjKMMpqovg7eGl3FGxIAidkLIw7b?=
 =?us-ascii?Q?5h9Pa4fMoCRKdc4L13VMHkgwfbuX6d75UX9k6Gtvh9zEqmw3ccIxjkb4rU/i?=
 =?us-ascii?Q?MKv40yUnMjtWt80UF/o5K4rkQHJf+p1BAoIJbuZ76bI0qW37BTg4rv3PwrPS?=
 =?us-ascii?Q?Kr4tw1/DUrUZHiBQVTWiiHcKLTIYg4zUndtMxgz3QaBWFIUJZIKaGLx5iOI2?=
 =?us-ascii?Q?rfJ7SuRcW41rITnb1Z3Er6NgfGqcTTNelnaAtA4qvzBogu1eYSq0Hdom9vw2?=
 =?us-ascii?Q?QLUF7X0uYgG6Bk5VG/l5KcXrvYK+Zt1RIJrXBmDMuqGC45ICjTpx1QSVuXa0?=
 =?us-ascii?Q?ShkSqCruYtAWcheGI/l5qJ1FoV6+MHrOgRL/Lcdrwhpv2eVETWSxosZ8RRmP?=
 =?us-ascii?Q?+vEqhQD/gini20XM/39hTK1VGRfa2jH+np3BoLd0Ia9YKEROGkSFlF5/c9pW?=
 =?us-ascii?Q?EQMIx+ioobz312j1H7mIr6UM2wLgk+/IdLS4fIXxKINjlGagXd+phVGdRInF?=
 =?us-ascii?Q?lSwwppG9QA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8555dcac-cdd5-49fc-4d42-08deebf071db
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:05:06.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IBSUzGntDQKMTrgIWXgGdZLFtPc/hcPmCsQdai0BVWJF3diy6WxjC76K7nL6+womCK/kQsrjnveZ0rbYrMVgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7120
X-purgate-ID: tlsNG-d25034/1785164709-51737A5B-FE524C5F/0/0
X-purgate-type: clean
X-purgate-size: 3512

Calling mod_l1_entry() with a valid ol1e_out pointer will do an atomic xchg to
set the new pte value and return the old pte value through the ol1e_out
pointer. If the ol1e_out pointer is NULL then old behavior is preserved.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
 xen/arch/x86/mm.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index bb4ba0afe2d4..500549c8e036 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2151,7 +2151,8 @@ static void l3t_unlock(struct page_info *page)
 /* Update the L1 entry at pl1e to new value nl1e. */
 static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
                         mfn_t gl1mfn, unsigned int cmd,
-                        struct vcpu *pt_vcpu, struct domain *pg_dom)
+                        struct vcpu *pt_vcpu, struct domain *pg_dom,
+                        l1_pgentry_t *ol1e_out)
 {
     bool preserve_ad = (cmd == MMU_PT_UPDATE_PRESERVE_AD);
     l1_pgentry_t ol1e = l1e_read(pl1e);
@@ -2213,8 +2214,8 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
         {
-            rc = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
-                              preserve_ad);
+            rc = update_intpte(&pl1e->l1, &ol1e.l1, nl1e.l1, gl1mfn, pt_vcpu,
+                               preserve_ad, !!ol1e_out);
             if ( page )
                 put_page(page);
             return rc ? 0 : -EBUSY;
@@ -2237,8 +2238,8 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         if ( page )
             put_page(page);
 
-        if ( unlikely(!UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
-                                    preserve_ad)) )
+        if ( unlikely(!update_intpte(&pl1e->l1, &ol1e.l1, nl1e.l1, gl1mfn,
+                                     pt_vcpu, preserve_ad, !!ol1e_out)) )
         {
             ol1e = nl1e;
             rc = -EBUSY;
@@ -2246,13 +2247,17 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
     }
     else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
         return -ERESTART;
-    else if ( unlikely(!UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
-                                     preserve_ad)) )
+    else if ( unlikely(!update_intpte(&pl1e->l1, &ol1e.l1, nl1e.l1, gl1mfn,
+                                      pt_vcpu, preserve_ad, !!ol1e_out)) )
     {
         return -EBUSY;
     }
 
     put_page_from_l1e(ol1e, pt_dom);
+
+    if ( !rc && ol1e_out )
+        *ol1e_out = ol1e;
+
     return rc;
 }
 
@@ -4140,7 +4145,7 @@ long do_mmu_update(
                 {
                 case PGT_l1_page_table:
                     rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
-                                      cmd, v, pg_owner);
+                                      cmd, v, pg_owner, NULL);
                     break;
 
                 case PGT_l2_page_table:
@@ -4505,7 +4510,8 @@ static int __do_update_va_mapping(
         goto out;
     }
 
-    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner);
+    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner,
+                      NULL);
 
     page_unlock(gl1pg);
     put_page(gl1pg);
-- 
2.52.0


