Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DF5C79FBB
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 20:29:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415359.1644804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lOm-0000H0-TC; Thu, 10 Sep 2026 20:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415359.1644804; Thu, 10 Sep 2026 20:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lOm-0000Gt-Pj; Thu, 10 Sep 2026 20:29:32 +0000
Received: by outflank-mailman (input) for mailman id 1415359;
 Thu, 10 Sep 2026 20:29:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x4lOl-0000GO-5F
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:29:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4lOk-001ixY-IG
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 22:29:30 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa312e5-e002-0a2a0a5209dd-0a2a4505c826-30
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:30 +0200
Received: from [40.93.198.47]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31328-4cb1-0a2a45050019-285dc62fd1a8-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:30 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV5PR03MB8433.namprd03.prod.outlook.com (2603:10b6:408:361::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:29:26 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:29:26 +0000
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
 b=NW2YyJnJAMsu+9Qo+Ne5yJ7S7JTABKaffF98Ht/hMFGyoayWWRBgcpof+0uNe8hF3Z9c9lED8WJJhWkyOmmEXqDusrWNusef6RiAX47xYHcU/pKsslcJabXHIJEciaxMXmJlQkEuQ+woUvPQaWIOKCmaJ+WUpTrMTA3hdNQKb3/JybSXQlCxz+meBlR7ohIW3I02c+JYT/zfWYUPmrScdA8+8Hm+B06w4Jt3v8X5169Zdcp0NcNV1CQ4Mr0y7RxQtB3Vk/w83RO/e7anZjE2R/1j6MNqBM7aWZwuSMdp1eNclJIEUNRCzybPDMQYBoG9WDPO4t+JJC7sRXgbFfoDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PZCPy/IYhqH9L3yDZWNxwVLgkKWTeL1+WTsiJoODCQ=;
 b=FqY4B6b++/Ncxrkd2NwK19gehOYD8AFTGllyGu/JSK9bu9oN7pGtZiszBAqEuNTmGBB+Ol8UzsCkzWooK9cuDFjvSeVfu1FYPf8Y02epNqzMz+zKf19Df07O24L1gemoMchsizIAndWqRQNodym1SnrIje6A+oxGspRgxqz8R8SjZE5LdiszZFuDEBi8ge5DCXH33ZDiT9m5JOke0kEOQ9WHlar0PL27lcRhNWFstT2JiyA5ZcHvBIBQOMlpMyq/or+BRmdPdozI6B3zHm+kfmYKx3N/uwn+e64hJB0gGhxJspNfETzl27nZtjYkaSJGOyXgbDys7Idi4evIKGhkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PZCPy/IYhqH9L3yDZWNxwVLgkKWTeL1+WTsiJoODCQ=;
 b=hnNhDFjzqk/xHw1UvF1FiEq+6e2OfQLCERYN7O+9m4n+azo9CKRAICuo3WSpgkFI6DT/ftEGbD2oTxrh+c9L+mfFWz3oq/mLhE5FUDPdu+4SVXPGZ22jR+KEomKOynfLJl95E4nv6id9k+SEWGFviF+Dk+us3u5y7hyCihGWegk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 1/7] x86: make UPDATE_ENTRY() allow for multiple operation flags
Date: Thu, 10 Sep 2026 21:31:07 +0100
Message-ID: <20260910203113.462943-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260910203113.462943-1-kevin.lampis@citrix.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0595.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::12) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV5PR03MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5e4a74-0c4a-406e-c20c-08df0f7a34f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sImLlXhak9nGVI67t0uBRoxsAVITuqH7Bz4CrhGhTmS+Uy+uwY+I+OG9emmHTMZ4g26uGCTpuaNaWbfgptFR35wyE9p8c8PUUDo7R/43SCRyhIdD3rnfxhIZ0KmwaI/4bCCeOB5I82CT4OiWQprKWQjY/ZiDsn5YoOFzWz2WIBvevJ/9DDwRdBklMzS71ybLPfgNjVscCm1tMjqKaZxpv5bQRz5kcQFRPDe8+WWLA6uC+uMNA1x3YRjZadkZJq1kZc1Ya+Nhs2T99xUr4qzB3IZ42C57n5+8f+1LbfZZK8//bdHzx0G0Xn00mj65UDsfAeLtcY/ga8PIvyhoBL4KEcSXJYd+416qpGWEr1rXwGKgGoGOGjaFbF0s8MWWjxF14VmZIvPNQViSkklZPQrS060md+JbbtWfjSImqTS48DqD2aYZj3VAj6d19Qgh2yKfGa/h/39n9oVgc2WnVo+ANOlDyBpPcGyWlr9GTI6o+QRFjmSalJG8RiDVQAOMjq4RHZsnCE7YbI9k/dbThNdKTNTvcZEQo3hkUtlpWPRNLQ5h8Yb7umy7R7KoqJXnVXNvnJ1NmoNJEQP3WBLERRKccsd+Rh3ztM1EOI0EA35FMsmU1G6M3cZWd4KbrdV/Fw5EfiAr78+1vNjfMmwYTSS4ihcZH7UcL1cxvWZJSEFCVIQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MOQyfGzHkrd3uvj7X4vgoGV3os1EgQD+rkXu9Sv7XC+tdT38kcNdJeo49paw?=
 =?us-ascii?Q?9a6WCaPQIuwwegTtKFGPwFXxN00+asLDe6gYOx9h7a+iz248Rc6Kb4Qdm4Ua?=
 =?us-ascii?Q?bFvROkj6ify4flm+y/Q8SRiYYBtnihxRwyXrOsb5T8yOHmsaoOasOCQVXf6a?=
 =?us-ascii?Q?UJMQwBeaE+jxcdkBMnXJ5VmtZdA1oMOCCrJlPaP7jLDEz6iNm5ybKkmBF39l?=
 =?us-ascii?Q?vqs9CKf/sLrNkFrtO2tOSmGab1O8+jgjHz/ojeJklBqiKkt40/QI1tl7/G8a?=
 =?us-ascii?Q?MmRYFVprRLSoespKJjhnOZ/v1maR/ywIdU0RPqWgUzgyTyT5klj+QeRVNSZH?=
 =?us-ascii?Q?o0SRNkFS7B8roo+Wk3QW7NERPcwQOV+mfmqHWwp9WKlhTtYN4uqbKWaNiU6t?=
 =?us-ascii?Q?rtklGm+w8AxiXRHSokaKhyv3MwMy8ZZNYwCwywXol37lN5cgs1iTC70uN3JH?=
 =?us-ascii?Q?R25N+AeHHHX7yH73EQI689YH9WQS/59EWwYaL89FVsUeAYr2MzEAVatOzJ+J?=
 =?us-ascii?Q?0UDYTy90DZ9sz0vI+n0EeO8Shoqofg48nexXUiuIQ1g0fdFQToSRNHhpNS0P?=
 =?us-ascii?Q?//nwjugKMGnyyhjnLpD42NrK3cvb9QcwYax4nwaWjoTbbyoJTirOx9oyjkWv?=
 =?us-ascii?Q?BariF+grdyCV79PhS8JIcDjg2wCVkR4M2IfnmZCIvw/lik8F9v76Q9XuDoG5?=
 =?us-ascii?Q?SemwF3IgHkjNVsLXW7OCVLJ8qzZlgv0WngCqLsXzgnEGq8RfLjSDc7+wS0Bz?=
 =?us-ascii?Q?awcBFDPNY0GAmgq2y+/aZPIoumGjMdm3TB4AqZIsBLDc9Dn+nOBica3RX5ob?=
 =?us-ascii?Q?FCfmxCKInn6OPGmNy9rt9hlYJao+LSOe7EmmgqXFEKIA8ehyz4CfRO0+VYh4?=
 =?us-ascii?Q?rwRBomiP4KkmKh0X91rHoA8SC09P5XGyASXZr1vHQyJNqaGX6k3+meUBI/n6?=
 =?us-ascii?Q?VPfl7+/UrxtStmETuM9Py+6+nEg6ZsEDDVhKuZvRSEypBzjH21os9SpxAXN7?=
 =?us-ascii?Q?5brmH79xnzx4rwQ50s97ShQd4YV+DtIYhiDfr51t+eB4jaTrA42zeFZ8gf8r?=
 =?us-ascii?Q?e0hRSb28npNmbSQfsDrfKO0GDQWKX7H2RyA4cEZrVMGcAp1v25gjd4oL0yCe?=
 =?us-ascii?Q?WTmbWDKBHpbPS9/GGC5jmWdMeQSPQVJPheooTH9Nid3+Fj9RUfD7o1U1Dpbs?=
 =?us-ascii?Q?FS3b/6xy/6Wdo1TWWvv4teiCABYMdsyKvjGMLQl2Yiqcr/a6ppOd6X40jpcx?=
 =?us-ascii?Q?y/apZ9dNpBo9WuXOqIXKESi7JNT1K++YNpoHBOwcVhZO8p/wztvknW0XEjuS?=
 =?us-ascii?Q?kOMDpT+YpZY+gnklXEe/73Za9wMjh+qjk4iA7Mc28iJY7IYLLnXH9ETRuHns?=
 =?us-ascii?Q?4tODfE8o2oAt+eGhqR670pf1SJlVOyNIQVIb2N+u4OvsEbSvvNNLzmEDWXnB?=
 =?us-ascii?Q?oLngcQwyKEuK/kjsrJhSGfgpncuSkUS8s5x7Ow+abl3Ke5g8SVtCKHU/wvpY?=
 =?us-ascii?Q?LxBGc116O4nF/MvxkQ/3vc8vrbuVLiNIs+HIzcXEuyEIjFXaK49Y4omSLvGy?=
 =?us-ascii?Q?NumsIDlRE1c55uA2+axQgTWWPNXd9TyZ8Aj3znS7lR8ae2EPkgYgVdbAnJTX?=
 =?us-ascii?Q?KAG68+3+0LgAGPNtTqrbqGSYJwJ+p0+ZN/K3KGirWrR85CzGZzqstshhNSnD?=
 =?us-ascii?Q?Vfl3pq2LY6VlHy2sEnBPLw8wyUHim+ehiKRF/VqnX34V8YUXwood8wQe+rmu?=
 =?us-ascii?Q?wl5RTJNxxA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5e4a74-0c4a-406e-c20c-08df0f7a34f7
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:29:25.9990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvOUmrrjsuqCsblJAi2D1rkzsjK0wGlwB9mGEFUBUVB+5d21uONtoJrqa9hSaT0KgnmlGIUJYBYle6n7m5UB1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8433
X-purgate-ID: tlsNG-c201ff/1789072170-722AB2A1-80FD522E/0/0
X-purgate-type: clean
X-purgate-size: 11395

From: Jan Beulich <jbeulich@suse.com>

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>
---
Changes in v2:
- New patch
---
 xen/arch/x86/mm.c    | 48 ++++++++++++++++++++++++--------------------
 xen/arch/x86/pv/mm.h | 13 +++++++-----
 2 files changed, 34 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b158742408f9..5f778557b1e6 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2149,10 +2149,9 @@ static void l3t_unlock(struct page_info *page)
 
 /* Update the L1 entry at pl1e to new value nl1e. */
 static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
-                        mfn_t gl1mfn, unsigned int cmd,
+                        mfn_t gl1mfn, unsigned int update_flags,
                         struct vcpu *pt_vcpu, struct domain *pg_dom)
 {
-    bool preserve_ad = (cmd == MMU_PT_UPDATE_PRESERVE_AD);
     l1_pgentry_t ol1e = l1e_read(pl1e);
     struct domain *pt_dom = pt_vcpu->domain;
     int rc = 0;
@@ -2172,7 +2171,7 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         }
 
         /* Translate foreign guest address. */
-        if ( cmd != MMU_PT_UPDATE_NO_TRANSLATE &&
+        if ( !(update_flags & PTE_UPDATE_NO_TRANSLATE) &&
              paging_mode_translate(pg_dom) )
         {
             p2m_type_t p2mt;
@@ -2213,7 +2212,7 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
         {
             rc = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
-                              preserve_ad);
+                              update_flags);
             if ( page )
                 put_page(page);
             return rc ? 0 : -EBUSY;
@@ -2237,7 +2236,7 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
             put_page(page);
 
         if ( unlikely(!UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
-                                    preserve_ad)) )
+                                    update_flags)) )
         {
             ol1e = nl1e;
             rc = -EBUSY;
@@ -2246,7 +2245,7 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
     else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
         return -ERESTART;
     else if ( unlikely(!UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
-                                     preserve_ad)) )
+                                     update_flags)) )
     {
         return -EBUSY;
     }
@@ -2260,7 +2259,7 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
 static int mod_l2_entry(l2_pgentry_t *pl2e,
                         l2_pgentry_t nl2e,
                         mfn_t mfn,
-                        int preserve_ad,
+                        unsigned int update_flags,
                         struct vcpu *vcpu)
 {
     l2_pgentry_t ol2e;
@@ -2292,7 +2291,7 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l2e_has_changed(ol2e, nl2e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            if ( UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, preserve_ad) )
+            if ( UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags) )
                 return 0;
             return -EBUSY;
         }
@@ -2301,7 +2300,7 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
             return rc;
 
         if ( unlikely(!UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu,
-                                    preserve_ad)) )
+                                    update_flags)) )
         {
             ol2e = nl2e;
             rc = -EBUSY;
@@ -2310,7 +2309,7 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
     else if ( pv_l1tf_check_l2e(d, nl2e) )
         return -ERESTART;
     else if ( unlikely(!UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu,
-                                     preserve_ad)) )
+                                     update_flags)) )
     {
         return -EBUSY;
     }
@@ -2324,7 +2323,7 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
 static int mod_l3_entry(l3_pgentry_t *pl3e,
                         l3_pgentry_t nl3e,
                         mfn_t mfn,
-                        int preserve_ad,
+                        unsigned int update_flags,
                         struct vcpu *vcpu)
 {
     l3_pgentry_t ol3e;
@@ -2354,7 +2353,7 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l3e_has_changed(ol3e, nl3e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            rc = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, preserve_ad);
+            rc = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
             return rc ? 0 : -EFAULT;
         }
 
@@ -2364,7 +2363,7 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
         rc = 0;
 
         if ( unlikely(!UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu,
-                                    preserve_ad)) )
+                                    update_flags)) )
         {
             ol3e = nl3e;
             rc = -EFAULT;
@@ -2373,7 +2372,7 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
     else if ( pv_l1tf_check_l3e(d, nl3e) )
         return -ERESTART;
     else if ( unlikely(!UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu,
-                                     preserve_ad)) )
+                                     update_flags)) )
     {
         return -EFAULT;
     }
@@ -2386,7 +2385,7 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
 static int mod_l4_entry(l4_pgentry_t *pl4e,
                         l4_pgentry_t nl4e,
                         mfn_t mfn,
-                        int preserve_ad,
+                        unsigned int update_flags,
                         struct vcpu *vcpu)
 {
     struct domain *d = vcpu->domain;
@@ -2416,7 +2415,7 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l4e_has_changed(ol4e, nl4e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            rc = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, preserve_ad);
+            rc = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
             return rc ? 0 : -EFAULT;
         }
 
@@ -2426,7 +2425,7 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
         rc = 0;
 
         if ( unlikely(!UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
-                                    preserve_ad)) )
+                                    update_flags)) )
         {
             ol4e = nl4e;
             rc = -EFAULT;
@@ -2435,7 +2434,7 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
     else if ( pv_l1tf_check_l4e(d, nl4e) )
         return -ERESTART;
     else if ( unlikely(!UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
-                                     preserve_ad)) )
+                                     update_flags)) )
     {
         return -EFAULT;
     }
@@ -4135,18 +4134,23 @@ long do_mmu_update(
 
             if ( page_lock(page) )
             {
+                unsigned int update_flags = (cmd == MMU_PT_UPDATE_PRESERVE_AD)
+                                            ? PTE_UPDATE_PRESERVE_AD
+                                            : (cmd == MMU_PT_UPDATE_NO_TRANSLATE)
+                                              ? PTE_UPDATE_NO_TRANSLATE : 0;
+
                 switch ( page->u.inuse.type_info & PGT_type_mask )
                 {
                 case PGT_l1_page_table:
                     rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
-                                      cmd, v, pg_owner);
+                                      update_flags, v, pg_owner);
                     break;
 
                 case PGT_l2_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
-                                      cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                                      update_flags, v);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4155,7 +4159,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
-                                      cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                                      update_flags, v);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4164,7 +4168,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
-                                      cmd == MMU_PT_UPDATE_PRESERVE_AD, v);
+                                      update_flags, v);
                     if ( !rc )
                         flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
index 4564cab9fc0f..3aac0f3309a4 100644
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -62,17 +62,20 @@ static inline intpte_t paging_cmpxchg_guest_entry(
 #undef PTE_UPDATE_WITH_CMPXCHG
 #endif
 
+#define PTE_UPDATE_PRESERVE_AD  (1u << 0)
+#define PTE_UPDATE_NO_TRANSLATE (1u << 1)
+
 /*
  * How to write an entry to the guest pagetables.
  * Returns false for failure (pointer not valid), true for success.
  */
 static inline bool update_intpte(intpte_t *p, intpte_t old, intpte_t new,
-                                 mfn_t mfn, struct vcpu *v, bool preserve_ad)
+                                 mfn_t mfn, struct vcpu *v, unsigned int flags)
 {
     bool rv = true;
 
 #ifndef PTE_UPDATE_WITH_CMPXCHG
-    if ( !preserve_ad )
+    if ( !(flags & PTE_UPDATE_PRESERVE_AD) )
         paging_write_guest_entry(v, p, new, mfn);
     else
 #endif
@@ -81,7 +84,7 @@ static inline bool update_intpte(intpte_t *p, intpte_t old, intpte_t new,
         {
             intpte_t _new = new, t;
 
-            if ( preserve_ad )
+            if ( flags & PTE_UPDATE_PRESERVE_AD )
                 _new |= old & (_PAGE_ACCESSED | _PAGE_DIRTY);
 
             t = paging_cmpxchg_guest_entry(v, p, old, _new, mfn);
@@ -102,10 +105,10 @@ static inline bool update_intpte(intpte_t *p, intpte_t old, intpte_t new,
  * Macro that wraps the appropriate type-changes around update_intpte().
  * Arguments are: type, ptr, old, new, mfn, vcpu
  */
-#define UPDATE_ENTRY(_t,_p,_o,_n,_m,_v,_ad)                         \
+#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl)                   \
     update_intpte(&_t ## e_get_intpte(*(_p)),                       \
                   _t ## e_get_intpte(_o), _t ## e_get_intpte(_n),   \
-                  (_m), (_v), (_ad))
+                  _m, _v, fl)
 
 static always_inline l1_pgentry_t adjust_guest_l1e(l1_pgentry_t l1e,
                                                    const struct domain *d)
-- 
2.52.0


