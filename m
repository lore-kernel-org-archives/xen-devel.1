Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D172CA5FD6
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 17:46:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438579.1657296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKrN-0004tc-0p; Thu, 01 Oct 2026 17:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438579.1657296; Thu, 01 Oct 2026 17:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKrM-0004tV-SQ; Thu, 01 Oct 2026 17:46:20 +0000
Received: by outflank-mailman (input) for mailman id 1438579;
 Thu, 01 Oct 2026 17:46:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xCKrL-0004sS-7Y
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 17:46:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCKrK-009PVE-Kc
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 19:46:18 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9c4d-8faa-0a2a0a5109dd-0a2a4508d8ea-38
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:46:18 +0200
Received: from [52.101.56.34]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9c68-f659-0a2a45080019-34653822a43d-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:46:18 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV3PR03MB7658.namprd03.prod.outlook.com (2603:10b6:408:28d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 17:45:46 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 17:45:46 +0000
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
 b=q8by02G+UCdBylnn+ydknUyzzkgW+FK3e26F5jeg2iXyIvqv5goncWog5RsVHamkXBGidH11mYvCt57kwKF2QUc2rnXO3VWGNcaTGbnom/EXTba1hLjF+Tet5mmew+SeWI8INXR2neBMa8bqgzkMOGL7yEax5G/8LZmsogBDQNzS7of2iGCSEMrwSPNAj/0uBy2VvdztKe1jjDKpAE9HieIZVvcd7slvpB2g6P1oLtNI0k476Pssw7CC3+0y5c20RrtjLZyPL+8NmVE1pEbfasnvz1tFxhpx3DpILfs97flvSBpHAtoWA1eQsz9JA3N7K8J42M39wCjdpH7Kkl81fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6J5mtRqMkkYJgCnuFbTlfm0vxzMbd7IsBhqGcPmZ0U=;
 b=rNGAx8nVzkfpVbC7Fv2fr5oeYdG6RSpYzWcvzygiZb/0ZmbbONRngn89DbkhwZ31vRnKv3JljuJ2x1WvuLJmKi6cYGoqyQV73vqRTOI0F6eXMrxlssTMQuUJlENGJdV7fEl9oZFUtJtjJWzoaGk6Lncc3QeNrxB+YrBCDbfyAdGL3DohfsgNQkJ9f8X2+8zS6KMKXTaxyWL5BXtdSTYDoST3oyJnRtuVqpDsgViZPAOKgGUP8LJmfFOl6ez+icmegyEsWO6Cp4XvlEM3E5Sn5DsUeS1XvT2LSvgjSBKcKRk28514iI10GZaZ9+hfbpsNMxXk8a9EUufN7uJdJD3ACw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6J5mtRqMkkYJgCnuFbTlfm0vxzMbd7IsBhqGcPmZ0U=;
 b=x5s3zieBZq3UwMuym8X4oG746w+cJHpQUd9XZgjWeBWONZ7zcGYMUrPUWqjs4VPa6w0Gue4bvrqWJrXkIIg2jlSegA9Wy04XqMJKWrFMY5QYY65JrYu5ESELx0ieYCK3SFw29UiMSmwOrHObKvGf8fF7qeVKbRzEUH+XcjE4oRI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v3 1/6] x86: Remove return value from UPDATE_ENTRY
Date: Thu,  1 Oct 2026 18:47:44 +0100
Message-ID: <20261001174749.2275245-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261001174749.2275245-1-kevin.lampis@citrix.com>
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::8) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV3PR03MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: a9372c10-5c13-4cee-e5d4-08df1fe3d2ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	7m2xm3kjFwBVdSh5aHc8e+Z295PbqMKJ6lCYSSnVDCKkjVtcKLJZffFClJXb+rv4ClpEXga94449ykQHPG4UoouadIwlq3Vj4Go2Dd3G70scqzSq3elVv1g8exVJGUuIMG8fNDs37D52BRq7eW+rdMcpYOH30T593/J9umDZmO79w3E8STLYYYDd+xFkETyCTs6XTO3GKFUp66y0zwoiqah0+S1//sPIQaxH6XhxVx8/YGuw4HyD7MriYVoKSRHRFDNKxL9VIfYgFb8A7eKies0B/Nuc4j84SvkiI/9uAvYTEHmQ4GThGiBu+K3f9HcCGPgxivizntIOE615HnMHNKmjVcBFYC073+U5DMH54+qmk14tvoImVliCTtNV6GakM4x3o0N+i69C4C3AxT2vafFN1Ml3IcYRpChd0ke4fJkX7Z5CR+3gacLebTi9maRMKGvrzDBe03uBgeYe0pI+uIjaqeD8vdkexZ65ON3tP83AYt59a/bGHTgsaGAGd2+CR/PH7AQhNhUu7Bas6Yp+L01vO33TgjBHy911KrxLsv9gWf3mc2soNay8S0yJT4pFdupolvyiy8EgSEOJTWu6eHhWdcEWLTOU/D1UJ1/1vpIRX/jJz6KLQSi8cf7Yf6pUyhV+B1PRTt7USH4wMxqqyYac1XEfbU256rLZjBT9V3w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OKFsOJIS6ry7+pwPWpnNhElPA6IGl6zy0lnn9mHwQPiLC6RxLyul/1QolwLg?=
 =?us-ascii?Q?xOiwD7bbjkpy2LovLWe1zqCMuDhZqRQwvEN0Dnn9y8u/rkryhTuZHxqVKVfA?=
 =?us-ascii?Q?wDwONJflWnnQsWqTzJI2654WpYbafgFTm7t4IjZdr/Q60+cRTLHnu4/z1tY/?=
 =?us-ascii?Q?t7Om2U7Sk3mHuydwDn14k/f9PvZwpU2QqSs1yLfqnmD0COGc5w9hzHhSuuMN?=
 =?us-ascii?Q?ywOfUE2ymQhyAiB+ditxRgMzOywU8FKhWyRcf0qDf5W97oeZJwg6ebiSmj5L?=
 =?us-ascii?Q?UmGlE2cPoglo2GNlZkLUZNXF4TjRno88KE3NPt3eTzb4dfeEvNx15VHICj9T?=
 =?us-ascii?Q?zbuABWbQI1QjGrkP1ZRpxURkjHzd4A3T4ak3eNl1OUVnX3+v32zcj7Yucbr1?=
 =?us-ascii?Q?zA6dDzfbbtAAhpoG4xaxvLBB3FX80OiuSWFqEWBwoLw8AcOsZG7AZ51w2Gq8?=
 =?us-ascii?Q?yfNJAWC4xE00KTQK54lTmfm/T8URaKOsj3Ma/g7fkHCNe3OrnjxSBbUhNfnO?=
 =?us-ascii?Q?RBe6xFeoSl0v02WUMctr5miYFpk91e6Jb3Oczzwt02OWAWA7OLw9b0YCcB9J?=
 =?us-ascii?Q?L+hUCv6imwyBumMOunqVqtJCYUQkVYDgC5I5CuEs4xp684gZ1APcDJeF5slL?=
 =?us-ascii?Q?i1p00IWJACs4pEpiIfvH4GUAjpluq+/A1/rjqrEaRJFnb+aw5pBDdIPed594?=
 =?us-ascii?Q?B+tl8//d1xaWKkjSnVD4vhsONSGl2Te/BD21XrcZEX618ahhbnErGmeF73e1?=
 =?us-ascii?Q?yWrME0uk37Xe4Is5sAnSNOEdX+Vd7LlQLFr2+/EQ0k92sts5QlaXtKZBN4aO?=
 =?us-ascii?Q?tykrNytW5ZdBKn+IkCFysC9VGc/0v6JiWtPfepZ5ZAAY4+tIXCBOr6zqu7jC?=
 =?us-ascii?Q?uLmlH3vpSs7E0Dmh8CmxqjIQVtNgYwIxjLBS4Ax3SyP1Ch4ziVCt5sNaVkKD?=
 =?us-ascii?Q?9+4+4zpi2979bWqLXyHsskaFMubbi1uGbI8QemwHdgBPhnmU45r9qdfzz47Y?=
 =?us-ascii?Q?tyVRaJcIQX/ix3QRU8JHhv35LuSyPnbGGrsE7p0qjDVMngl/O6HnVHnBgbZk?=
 =?us-ascii?Q?jEj1y9mFKfe1kzFSIkDUhVZFgSlDrsH0vZKNqqpJbivaq2teThNBq/759HhS?=
 =?us-ascii?Q?02U9QNzLNgBSec7ydQnVWexv57GPnYs+TOar/OgqbjzVYrUsfWh0Qa2iVYQZ?=
 =?us-ascii?Q?ni2OpsfVnHrtyWRmWZ2CtbvRFWHGMZgC98PuNSKWkOpKXcAfwlEQL1xrgEb6?=
 =?us-ascii?Q?dSLkhL7Vs2zZtG9XuJ7IPFsncAxQSU2JpIZoPw5gVMcxTWBxV2teB7ulVmif?=
 =?us-ascii?Q?P1gAWmkx46eR1iOkp2xg1JYkSnci4gjiXFQ8VH0t9C5mQ451avUhbHhHBHRH?=
 =?us-ascii?Q?G/VUzb6eyKcqPuVtu6h6PZEGNrOj85T5yjRfUWqgPI6wBfFLxh7SyRGscKd8?=
 =?us-ascii?Q?Egm/r6pCXqTy8xcykstPTGM6ZObFMbAbBJlRyQwfSHB/PwT6j4TOJuUV+N+m?=
 =?us-ascii?Q?nGNw5ofMBVeyqJJ7iaa2QWcq3BDO+AoF0hLmhCfskxIZx+JukAHR97jg3Xu/?=
 =?us-ascii?Q?9lDw0JiWrGzz7LFqgtO302b/bWgxb7C1fq+/dA7ntcLQRka8q2wciq7rsECq?=
 =?us-ascii?Q?mdgH7+pDYzJObePSf2TsGamwcSnNzQJSf9ynnj038KDf+q45DyaFQQGP5/5Q?=
 =?us-ascii?Q?MmOQNLODYPbh/U13HcBRfzqudAFD3gJ4iTUpUJDW1Zm6dOhwN0xaew2mdepA?=
 =?us-ascii?Q?roBsQOk2iw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9372c10-5c13-4cee-e5d4-08df1fe3d2ee
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 17:45:46.8252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXWfbcaGOuJApmsuCkEo6X/eld0BzPnIUTzKQguaI9va7WurVtwfXCuEls2sAomRBYNCsImP0ZeMrt9BlT5iZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7658
X-purgate-ID: tlsNG-c1860d/1790876778-D6D4087B-5CE6C553/0/0
X-purgate-type: clean
X-purgate-size: 10413

UPDATE_ENTRY/update_intpte always returns true since 1bc30c076a7f
"x86/mm: {paging, sh}_{cmpxchg, write}_guest_entry() cannot fault"

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v3:
- None

Changes in v2:
- New patch
---
 xen/arch/x86/mm.c               | 74 +++++++++------------------------
 xen/arch/x86/pv/grant_table.c   | 53 +++++++++++------------
 xen/arch/x86/pv/mm.h            |  6 +--
 xen/arch/x86/pv/ro-page-fault.c |  3 +-
 4 files changed, 46 insertions(+), 90 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b1bbecc7d7f7..1ddb8b71469a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2215,11 +2215,10 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
         {
-            rc = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
-                              update_flags);
+            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
             if ( page )
                 put_page(page);
-            return rc ? 0 : -EBUSY;
+            return 0;
         }
 
         switch ( rc = get_page_from_l1e(nl1e, pt_dom, pg_dom) )
@@ -2239,20 +2238,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         if ( page )
             put_page(page);
 
-        if ( unlikely(!UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
-                                    update_flags)) )
-        {
-            ol1e = nl1e;
-            rc = -EBUSY;
-        }
+        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
         return -ERESTART;
-    else if ( unlikely(!UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
-                                     update_flags)) )
-    {
-        return -EBUSY;
-    }
+    else
+        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
 
     put_page_from_l1e(ol1e, pt_dom);
     return rc;
@@ -2295,28 +2286,19 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l2e_has_changed(ol2e, nl2e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            if ( UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags) )
-                return 0;
-            return -EBUSY;
+            UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+            return 0;
         }
 
         if ( unlikely((rc = get_page_from_l2e(nl2e, mfn, d, 0)) < 0) )
             return rc;
 
-        if ( unlikely(!UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu,
-                                    update_flags)) )
-        {
-            ol2e = nl2e;
-            rc = -EBUSY;
-        }
+        UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l2e(d, nl2e) )
         return -ERESTART;
-    else if ( unlikely(!UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu,
-                                     update_flags)) )
-    {
-        return -EBUSY;
-    }
+    else
+        UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
 
     put_page_from_l2e(ol2e, mfn, PTF_defer);
 
@@ -2357,8 +2339,8 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l3e_has_changed(ol3e, nl3e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            rc = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
-            return rc ? 0 : -EFAULT;
+            UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+            return 0;
         }
 
         rc = get_page_from_l3e(nl3e, mfn, d, 0);
@@ -2366,20 +2348,12 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
             return rc;
         rc = 0;
 
-        if ( unlikely(!UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu,
-                                    update_flags)) )
-        {
-            ol3e = nl3e;
-            rc = -EFAULT;
-        }
+        UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l3e(d, nl3e) )
         return -ERESTART;
-    else if ( unlikely(!UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu,
-                                     update_flags)) )
-    {
-        return -EFAULT;
-    }
+    else
+        UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
 
     put_page_from_l3e(ol3e, mfn, PTF_defer);
     return rc;
@@ -2419,8 +2393,8 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l4e_has_changed(ol4e, nl4e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            rc = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
-            return rc ? 0 : -EFAULT;
+            UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+            return 0;
         }
 
         rc = get_page_from_l4e(nl4e, mfn, d, 0);
@@ -2428,20 +2402,12 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
             return rc;
         rc = 0;
 
-        if ( unlikely(!UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
-                                    update_flags)) )
-        {
-            ol4e = nl4e;
-            rc = -EFAULT;
-        }
+        UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l4e(d, nl4e) )
         return -ERESTART;
-    else if ( unlikely(!UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
-                                     update_flags)) )
-    {
-        return -EFAULT;
-    }
+    else
+        UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
 
     put_page_from_l4e(ol4e, mfn, PTF_defer);
     return rc;
diff --git a/xen/arch/x86/pv/grant_table.c b/xen/arch/x86/pv/grant_table.c
index 1df68440a24a..38767826f5d8 100644
--- a/xen/arch/x86/pv/grant_table.c
+++ b/xen/arch/x86/pv/grant_table.c
@@ -98,18 +98,16 @@ int create_grant_pv_mapping(uint64_t addr, mfn_t frame,
         goto out_unlock;
 
     ol1e = *pl1e;
-    if ( UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, curr, 0) )
-    {
-        /*
-         * We always create mappings in this path.  However, our caller,
-         * map_grant_ref(), only passes potentially non-zero cache_flags for
-         * MMIO frames, so this path doesn't create non-coherent mappings of
-         * RAM frames and there's no need to calculate PGT_non_coherent.
-         */
-        ASSERT(!cache_flags || is_iomem_page(frame));
-
-        rc = GNTST_okay;
-    }
+    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, curr, 0);
+    /*
+     * We always create mappings in this path.  However, our caller,
+     * map_grant_ref(), only passes potentially non-zero cache_flags for
+     * MMIO frames, so this path doesn't create non-coherent mappings of
+     * RAM frames and there's no need to calculate PGT_non_coherent.
+     */
+    ASSERT(!cache_flags || is_iomem_page(frame));
+
+    rc = GNTST_okay;
 
  out_unlock:
     page_unlock(page);
@@ -165,10 +163,9 @@ static bool steal_linear_address(unsigned long linear, l1_pgentry_t *out)
         goto out_unlock;
 
     ol1e = *pl1e;
-    okay = UPDATE_ENTRY(l1, pl1e, ol1e, l1e_empty(), gl1mfn, curr, 0);
-
-    if ( okay )
-        *out = ol1e;
+    UPDATE_ENTRY(l1, pl1e, ol1e, l1e_empty(), gl1mfn, curr, 0);
+    *out = ol1e;
+    okay = true;
 
  out_unlock:
     page_unlock(page);
@@ -293,19 +290,17 @@ int replace_grant_pv_mapping(uint64_t addr, mfn_t frame,
                  "PTE flags %x for %"PRIx64" don't match grant (%x)\n",
                  l1e_get_flags(ol1e), addr, grant_pte_flags);
 
-    if ( UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, curr, 0) )
-    {
-        /*
-         * Generally, replace_grant_pv_mapping() is used to destroy mappings
-         * (n1le = l1e_empty()), but it can be a present mapping on the
-         * GNTABOP_unmap_and_replace path.
-         *
-         * In such cases, the PTE is fully transplanted from its old location
-         * via steal_linear_addr(), so we need not perform PGT_non_coherent
-         * checking here.
-         */
-        rc = GNTST_okay;
-    }
+    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, curr, 0);
+    /*
+     * Generally, replace_grant_pv_mapping() is used to destroy mappings
+     * (n1le = l1e_empty()), but it can be a present mapping on the
+     * GNTABOP_unmap_and_replace path.
+     *
+     * In such cases, the PTE is fully transplanted from its old location
+     * via steal_linear_addr(), so we need not perform PGT_non_coherent
+     * checking here.
+     */
+    rc = GNTST_okay;
 
  out_unlock:
     page_unlock(page);
diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
index 3aac0f3309a4..bfee0feb7b21 100644
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -67,13 +67,10 @@ static inline intpte_t paging_cmpxchg_guest_entry(
 
 /*
  * How to write an entry to the guest pagetables.
- * Returns false for failure (pointer not valid), true for success.
  */
-static inline bool update_intpte(intpte_t *p, intpte_t old, intpte_t new,
+static inline void update_intpte(intpte_t *p, intpte_t old, intpte_t new,
                                  mfn_t mfn, struct vcpu *v, unsigned int flags)
 {
-    bool rv = true;
-
 #ifndef PTE_UPDATE_WITH_CMPXCHG
     if ( !(flags & PTE_UPDATE_PRESERVE_AD) )
         paging_write_guest_entry(v, p, new, mfn);
@@ -98,7 +95,6 @@ static inline bool update_intpte(intpte_t *p, intpte_t old, intpte_t new,
             old = t;
         }
     }
-    return rv;
 }
 
 /*
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index 34349e9437eb..f6baf371926b 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -200,8 +200,7 @@ static int ptwr_emulated_update(unsigned long addr, intpte_t *p_old,
     else
     {
         ol1e = *pl1e;
-        if ( !UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, mfn, v, 0) )
-            BUG();
+        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, mfn, v, 0);
     }
 
     trace_ptwr_emulation(addr, nl1e);
-- 
2.52.0


