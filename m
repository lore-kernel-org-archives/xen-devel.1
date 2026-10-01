Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8A1CA5FD4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 17:46:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438581.1657307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKrN-00053O-R7; Thu, 01 Oct 2026 17:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438581.1657307; Thu, 01 Oct 2026 17:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKrN-00052Z-K3; Thu, 01 Oct 2026 17:46:21 +0000
Received: by outflank-mailman (input) for mailman id 1438581;
 Thu, 01 Oct 2026 17:46:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xCKrM-0004tN-Md
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 17:46:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCKrM-009PVE-3L
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 19:46:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9c4d-8faa-0a2a0a5109dd-0a2a4508d8ea-44
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:46:19 +0200
Received: from [52.101.56.34]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9c68-f659-0a2a45080019-34653822a43d-5
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:46:19 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV3PR03MB7658.namprd03.prod.outlook.com (2603:10b6:408:28d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 17:45:56 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 17:45:56 +0000
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
 b=XGHpgIzMzfDZSQzPJnE++QRrzIaLi0BdGN/7DYH8rjVFnVZVSKMrwhQjzbvoID5s50ahPRffp8WWvPNNJ65XY5LBwk9ur/0++oJcX35FIFnITi1g7Id4U3/O5+UpJuhWn0NIK0wzUcubWIV18J9ijMoztg60AiZue24eqQkSClcN+uJvnMCXVfZis7CXTRK9BkjhOpFmhlkuhcQzeqnoyon0bOaYzI8ZOXED6l0A9Et5Sht3jySiSzwUz+q4GxM282uFeAzdJarqAqon+hOMLnPBCQowY4d3wBbXx70gXF0wxLLOcRkQR7uJZUvisG8Be2CPWeTHExcRj2t3xE6RvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ+J3wc2JXd52VnbMqfcY5c0kIzjo5Lek38sZL8Kkbo=;
 b=pfywxmhFDceI9qd7CH2gUdQilTwyipyc6qnT9rzC1iSr0cUUgLUmK4+6930yJEVfdAMVUqH6eqqGQQpVGX+bBfyQn2TPhPsIXrxFEYhtmvTodHTD4tLFJ5Kohrmge33G2Tmebwcn5IQspmNXRGfd1BufuIyQrx7LvPiYCl826pwzNUvoA14ui6isIpShZpj55lRjWVJQSoa7lO7j/DZ4zRvKHjp6xZte2zUJbC3jQqYqY7A4Tf+lgorgJ+nIka0QVLLFr8KgBexwXOsMR4WxgKqF1xh+ZSy95lWRbpmm7xs62jBe7WakY0ooWEDCUejXqmnuVEupsG/YPjzgoDXqwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQ+J3wc2JXd52VnbMqfcY5c0kIzjo5Lek38sZL8Kkbo=;
 b=jkJFFZRd9Yw/yrHPCKK8Bljeiv1uOFQO/4iqkt5RzIEEMMI/aSjV+ke/YBe+sYj/0Vj3PTcUiIEIN3CS0EfNwBCw9mr8xn6swQGr51WAnrOekVQn/3663oGcW8Bo7NJ+26NOmISsZSzySvQcXKX+X+QO2aZXKwoS25iUN4Kya/4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v3 3/6] x86: extend mod_l*_entry() to optionally return the old PTE value
Date: Thu,  1 Oct 2026 18:47:46 +0100
Message-ID: <20261001174749.2275245-4-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261001174749.2275245-1-kevin.lampis@citrix.com>
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0394.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::21) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV3PR03MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 42232dd2-dacb-4723-7d1c-08df1fe3d8e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	+ipdoYBCVO54ysnyVuFUzzc4f3h4k6JhZAD2ys/8STdplHwIWeuavrRVFjVBCzA9rmGNX8IC+pK2lk41wMHBTyFljcFHfhhRgbcz3iGaqDu0qn5sshh5dWBScLtZerxh1FK2ZcdztyvYEpfi7FbIm3bP8i1qJn1bS14a7/dlEM+WGZF5H8fBGhBU9GN7vnpmaQ+9rGWQx3TyhbkhN1m4o7y75EKp6OwiuXmTTLCJB/csc/bLjhm7+yLEvBovONj//5qNEHI24HO00kSAVaokGxxOFohIngC/8y5tBXRiznBa+NkV3OwWpzvkKBF3F1llydol0SGo+BPMCbKR4bfxPK45fbVrRsBrxWBL9Jgx5JiQKKtF9ainGdMN5m1qTfWlzlz3PXAfTG0nEtg0U/+3TtsnCCo5Q6cNTuM/KFNPW+8dO803xNuEOt/4dwdHhzzfDFr7LMZKtugLs02TnJOslCEmdyiPM6ruePQIMPDxMLYiGTgKTUDKGLvnY5ZLE0c3JEpR7132DGYWxkjcpGPyhwXIz6vqcv77aSTk/126F92wV743oH2gH2Qb82BjtArDIxDabUvEdfi8Z61IdPBwo5F26ilfZ7XUkRHHwSkgnnt2cXA8fP2eyt+x+XjmkrBv/4fF9WyI4GAomUxl1yjv4181W8h7/1iy7MwXmx1zI6I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iuvux4zOZAkMGpWGR9v/5EN8zDSDrzbTkShmi4kJyOAZcMCeQGZdsv8ptNeU?=
 =?us-ascii?Q?PkELX/pjWxA82YCr8vHVHxe2f2O2yxLlSO8VoQTWrVzkJAKOmKAouMdW+ISb?=
 =?us-ascii?Q?zEfLrUEFq+tcTDqMXRLURwuNwxxzP1JC4QoGpm62l3TNI1LCFTY2dKlrWPs+?=
 =?us-ascii?Q?nS6Er/IvGvXF+aQMaVec8/dD8cl9DI3AfaUtRFl5Oe4HJMQxw3cisxM4Ln4L?=
 =?us-ascii?Q?ylpoyiDPrMKWap5maZJtmAIVruhkg7yaebFoc1gnF/ap2Vr88tC89SVIGA6L?=
 =?us-ascii?Q?JzBNjdTNlVQoLh7lL7/nj7V3UsIQhommp9SXPak66iP70PC0TGAHn9C38wLH?=
 =?us-ascii?Q?h8x5V0OfcLdGXHxwd4ZtcIHaCgtz+p5nSSLBVJQmIEFWgsbVsyEId2A96d0l?=
 =?us-ascii?Q?ge+Gof6gEKu3B6ey2QERYCu2Iuelv26Rk3VAtJ1jG/5i5Oa58vguS7uvefGF?=
 =?us-ascii?Q?GTNcwtJR+hVMt1FUIY7+g67bej4m5IlytYqMhkzlJo5iLVTrw9n6wgqtBD1L?=
 =?us-ascii?Q?dOxl0Q7z/JMa+H07ey7UEbvLGkkZY730I5YafBvcSSwUhV2r+GG27T4JyYOG?=
 =?us-ascii?Q?7zaIX7nim/nbT6/IhGKokb8G/CaeyI8SspM8D/mEKk08ifRM/ZQCDs0FO0Em?=
 =?us-ascii?Q?5nu5hSvYQbTuL3Wt4FrFyxzXzHoOQ5fK6fbSz53v+rcXDfto/AAeNZjpCR9Q?=
 =?us-ascii?Q?u00/D45sbTu1rTJ/lPONbtN+tLpi2atYAQsHDMFME5hYnM4IQbx5i6UyDHZ7?=
 =?us-ascii?Q?w1lr/mVgPBLyd26nefnidiEYxPz+LGVhkByK7ilxzww2PDxLh8XjmmLMuGUa?=
 =?us-ascii?Q?uO7FCuvX00jvecFFlF5EjA4vMs2yjlaqLUTHWnEPr/ewtMRDZ73KEJeRWN/m?=
 =?us-ascii?Q?3fLtxS6t30RvwgmzKAXhhYBFOGWmvqnuuZg2gl7CQRtoex6EQZ41B3VPtEhL?=
 =?us-ascii?Q?vQhEYo/cGBXg7hjm2XQyp5kVhmmpZ6zVtkQGK53voPs9ncfNcPg10aDtwUXQ?=
 =?us-ascii?Q?QbaTe3F0Zuh8LPDLT/asJm1upALpMV65IbvR9Eyfehe0Omd83wTvsCMAuFxF?=
 =?us-ascii?Q?g7dVoLNzX9h+aeSMfJSNzgVSr8cNGvUed909tsssS22ua6FmYzhXKZQNPfyb?=
 =?us-ascii?Q?t6AOdOmQZLbGD5Us9AoOqiYPDmSlzhAjssEhKVx4S2nDPoEv2jsSVIwyHsBv?=
 =?us-ascii?Q?IjpFJOJWfknUICMrrJjwcL07CaCW4O2l5quAPKPQ3ZKmU/7tkpBxHKCTbh2Y?=
 =?us-ascii?Q?263LL3XpEny7YKUrhcHYI+LdljkPNq+PMt8fpn8lotBxr6eP1DzIsbX20Ys2?=
 =?us-ascii?Q?cx4EzbR33+hGE5IVsa8cn7TOVMpyuZE7KH//tC2vvVB6o7N0YddI2Vd4UmXq?=
 =?us-ascii?Q?IW0q805+BuzlI2KXFNLeB0Nqn7AD1L6Kd/g9+3FuBOxtAaJUzwenmX0yycHl?=
 =?us-ascii?Q?kcrBPScqi8hg1xgvbq3fzUl3bZHzRwnzVz71S5uiVcP777xn3JEhkY72pGJ2?=
 =?us-ascii?Q?e4a9mf+DqzgTjXOAziLOgs+H0p2xdaywyGdwiKSsRwvU0p7BHzGzGFi7Z6ZH?=
 =?us-ascii?Q?me3aPCww90mC9A8O3aw/mLOI2STWdOgfWuZATUa9ng49y8+SZpSxxen3K+v9?=
 =?us-ascii?Q?ZGrbeHCdbawbuNbnuzceb4E+2JdzU0jOjtWJjtyRdi8gt/fpHaJ47tR/wfI0?=
 =?us-ascii?Q?jCHWUwufEsY4MqdE3voF3XZX0Jt/N8wGOsQ/0+wVB97z5ozbYjvkd4oezY2I?=
 =?us-ascii?Q?I7xZLzPsTQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42232dd2-dacb-4723-7d1c-08df1fe3d8e7
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 17:45:56.7997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMJDKPX9BA3iDYyoJjWkSzWns5y2DWtJ0eqPzfPiwr2EOS2DMMNidZRfcAxPLcDyTlIkJPNINO5IZDMVWDAnoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7658
X-purgate-ID: tlsNG-c1860d/1790876779-D634587B-209EA177/0/0
X-purgate-type: clean
X-purgate-size: 11242

Calling mod_l*_entry() with a valid ol*e_out pointer will do an atomic
xchg to set the new pte value and return the old pte value through the
ol*e_out pointer. If the ol*e_out pointer is NULL then old behavior is
preserved.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v3:
- Add swap to mod_l{2,3,4}_entry()

Changes in v2:
- UPDATE_ENTRY now returns the old pte value instead of using an out
  pointer
---
 xen/arch/x86/mm.c | 107 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 1ddb8b71469a..535a62139cad 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2154,7 +2154,8 @@ static void l3t_unlock(struct page_info *page)
 /* Update the L1 entry at pl1e to new value nl1e. */
 static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
                         mfn_t gl1mfn, unsigned int update_flags,
-                        struct vcpu *pt_vcpu, struct domain *pg_dom)
+                        struct vcpu *pt_vcpu, struct domain *pg_dom,
+                        l1_pgentry_t *ol1e_out)
 {
     l1_pgentry_t ol1e = l1e_read(pl1e);
     struct domain *pt_dom = pt_vcpu->domain;
@@ -2215,7 +2216,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+            if ( ol1e_out )
+                *ol1e_out = UPDATE_ENTRY_SWAP(l1, pl1e, ol1e, nl1e, gl1mfn,
+                                              pt_vcpu, update_flags);
+            else
+                UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+
             if ( page )
                 put_page(page);
             return 0;
@@ -2238,14 +2244,25 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         if ( page )
             put_page(page);
 
-        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+        if ( ol1e_out )
+            *ol1e_out = UPDATE_ENTRY_SWAP(l1, pl1e, ol1e, nl1e, gl1mfn,
+                                          pt_vcpu, update_flags);
+        else
+            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
         return -ERESTART;
     else
-        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+    {
+        if ( ol1e_out )
+            *ol1e_out = UPDATE_ENTRY_SWAP(l1, pl1e, ol1e, nl1e, gl1mfn,
+                                          pt_vcpu, update_flags);
+        else
+            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+    }
 
     put_page_from_l1e(ol1e, pt_dom);
+
     return rc;
 }
 
@@ -2255,7 +2272,8 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
                         l2_pgentry_t nl2e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l2_pgentry_t *ol2e_out)
 {
     l2_pgentry_t ol2e;
     struct domain *d = vcpu->domain;
@@ -2286,19 +2304,33 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l2e_has_changed(ol2e, nl2e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+            if ( ol2e_out )
+                *ol2e_out = UPDATE_ENTRY_SWAP(l2, pl2e, ol2e, nl2e, mfn,
+                                              vcpu, update_flags);
+            else
+                UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
             return 0;
         }
 
         if ( unlikely((rc = get_page_from_l2e(nl2e, mfn, d, 0)) < 0) )
             return rc;
 
-        UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+        if ( ol2e_out )
+            *ol2e_out = UPDATE_ENTRY_SWAP(l2, pl2e, ol2e, nl2e, mfn,
+                                          vcpu, update_flags);
+        else
+            UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l2e(d, nl2e) )
         return -ERESTART;
     else
-        UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+    {
+        if ( ol2e_out )
+            *ol2e_out = UPDATE_ENTRY_SWAP(l2, pl2e, ol2e, nl2e, mfn,
+                                          vcpu, update_flags);
+        else
+            UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+    }
 
     put_page_from_l2e(ol2e, mfn, PTF_defer);
 
@@ -2310,7 +2342,8 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
                         l3_pgentry_t nl3e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l3_pgentry_t *ol3e_out)
 {
     l3_pgentry_t ol3e;
     struct domain *d = vcpu->domain;
@@ -2339,7 +2372,11 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l3e_has_changed(ol3e, nl3e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+            if ( ol3e_out )
+                *ol3e_out = UPDATE_ENTRY_SWAP(l3, pl3e, ol3e, nl3e, mfn, vcpu,
+                                              update_flags);
+            else
+                UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
             return 0;
         }
 
@@ -2348,12 +2385,22 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
             return rc;
         rc = 0;
 
-        UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+        if ( ol3e_out )
+            *ol3e_out = UPDATE_ENTRY_SWAP(l3, pl3e, ol3e, nl3e, mfn, vcpu,
+                                          update_flags);
+        else
+            UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l3e(d, nl3e) )
         return -ERESTART;
     else
-        UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+    {
+        if ( ol3e_out )
+            *ol3e_out = UPDATE_ENTRY_SWAP(l3, pl3e, ol3e, nl3e, mfn, vcpu,
+                                          update_flags);
+        else
+            UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+    }
 
     put_page_from_l3e(ol3e, mfn, PTF_defer);
     return rc;
@@ -2364,7 +2411,8 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
                         l4_pgentry_t nl4e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l4_pgentry_t *ol4e_out)
 {
     struct domain *d = vcpu->domain;
     l4_pgentry_t ol4e;
@@ -2393,7 +2441,11 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l4e_has_changed(ol4e, nl4e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+            if ( ol4e_out )
+                *ol4e_out = UPDATE_ENTRY_SWAP(l4, pl4e, ol4e, nl4e, mfn, vcpu,
+                                              update_flags);
+            else
+                UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
             return 0;
         }
 
@@ -2402,12 +2454,22 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
             return rc;
         rc = 0;
 
-        UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+        if ( ol4e_out )
+            *ol4e_out = UPDATE_ENTRY_SWAP(l4, pl4e, ol4e, nl4e, mfn, vcpu,
+                                          update_flags);
+        else
+            UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l4e(d, nl4e) )
         return -ERESTART;
     else
-        UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+    {
+        if ( ol4e_out )
+            *ol4e_out = UPDATE_ENTRY_SWAP(l4, pl4e, ol4e, nl4e, mfn, vcpu,
+                                          update_flags);
+        else
+            UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+    }
 
     put_page_from_l4e(ol4e, mfn, PTF_defer);
     return rc;
@@ -3277,7 +3339,7 @@ int new_guest_cr3(mfn_t mfn)
                           l4e_from_mfn(mfn,
                                        (_PAGE_PRESENT | _PAGE_RW |
                                         _PAGE_USER | _PAGE_ACCESSED)),
-                          gt_mfn, 0, curr);
+                          gt_mfn, 0, curr, NULL);
         unmap_domain_page(pl4e);
         switch ( rc )
         {
@@ -4115,14 +4177,14 @@ long do_mmu_update(
                 {
                 case PGT_l1_page_table:
                     rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
-                                      update_flags, v, pg_owner);
+                                      update_flags, v, pg_owner, NULL);
                     break;
 
                 case PGT_l2_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4131,7 +4193,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4140,7 +4202,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
@@ -4480,7 +4542,8 @@ static int __do_update_va_mapping(
         goto out;
     }
 
-    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner);
+    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner,
+                      NULL);
 
     page_unlock(gl1pg);
     put_page(gl1pg);
-- 
2.52.0


