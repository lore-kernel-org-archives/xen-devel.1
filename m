Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB14606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=FSV40pt7
Received: from list by lists.xenproject.org with outflank-mailman.1485382.1688633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRc2-0007Ix-Bm; Thu, 12 Nov 2026 10:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485382.1688633; Thu, 12 Nov 2026 10:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRc2-0007Ip-8R; Thu, 12 Nov 2026 10:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1485382;
 Thu, 12 Nov 2026 10:00:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xRRc0-0006hF-5r
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:00:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRRbz-00Gm3C-Ab
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:00:55 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e55-8faa-0a2a0a5109dd-0a2a4505b1cc-12
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:55 +0100
Received: from [52.101.193.11]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e51-4cb1-0a2a45050019-3465c10b4789-7
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:54 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS0PR03MB989595.namprd03.prod.outlook.com (2603:10b6:8:432::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 10:00:22 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0592.012; Thu, 12 Nov 2026
 10:00:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRH45O3+Tm86vj/AutVdwTuJFqY1rCWWROmpNTneaVukgB4cuEaMP4T4nBDzNw10VQyq+G+T5oMBL9qe4KkbsvioCdMCk2DZ0zxi6ZoX6+tJRoqiZwxTARoatz1xQAAXxXPWoBjcsreW2jNpiRLKKzZIl6L1tPHGBJl3ZGAFzIkiZoDEqX29O736xxW0GMqoaceEUJWKtMrPKK5Y1hBTgyWuVra9ZG7Sha0CNGJz7o42EFZDlL0I3Lo9fusX9lD7vVVw/SCeZ8O3zFJ+h1GC28ARGMxl2mARAIW3tmxydvSUtoHOMFGkNqddfe/mAus4mjPYe2Bid2QiY7wFq16fjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1AQA4t6vMrBwdpJvNjYpirZUbgYm4+HlO7lBcKfTbQ=;
 b=fCAXWch8asCnnYZVLVzQpbnXKAiCI+24AyKWczjm2b7WhSQUySBxdZwMMzayKbyq5jp3K3i+Icu4JI50gEtQA5sdYkPyGXPCG9rWzEF2zGZqy4nPqxSQPdjAXiwuzHvVsGMtc2pJRvdvUFV1IBwBRWav6UF0bkitB0EPEB83UQcEGFKKFaaJpR5SyhomVxY78gtg0Y83FYLAuMYFOO9CNcwALWUkJ4KYg0LbRDrqaYi+cIyvTy15Td2bRicH5RvVOkeWD3z65N+wM17jtqRdaZMkUQuwqnyu3qlT95DOmF6EHJLY4VbLOAHomudPTw7ZwreQadeUaK2e21UHrZROJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1AQA4t6vMrBwdpJvNjYpirZUbgYm4+HlO7lBcKfTbQ=;
 b=FSV40pt75++zfbCsmm9NJw4sB2bdB9Tt7je4OK1Be5CMrXabUtkQVoMPGkSjn4m9mEBk3fmq2dKJ5TlpDkz0FbiDEwW9IpNtOVptzo+kjkLUcwVS4R6Dno9am59ZuHXP04GO7s1YZSnI/ijuurBh/QLuZ6Akoy5Ok8Ol+cfppBk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v5 2/6] x86: rearrange how mod_l*_entry() functions call UPDATE_ENTRY
Date: Thu, 12 Nov 2026 10:00:01 +0000
Message-ID: <20261112100005.324440-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261112100005.324440-1-kevin.lampis@citrix.com>
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::20) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DS0PR03MB989595:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d53f50-8cb8-4a4c-e284-08df40a3c405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261026121527099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	s2pYPLvvfPHSqVzfTdDjNLRI/vp8DIfXx+fuESpIa64z63b9weE6G9HZNCg918w4z/8UvSksbVJ52mb12bpRCl6CshM0sxVAK74DGE3U7g1Xu3BtrA789mvHa8D/jfoJ6A/SClwx190v3exOdGYYH4ID+9csrPl5+zCfZ8BkmHU7P/HqK8ArYeMkkxTOtZJKnOmG4OzXLR/ENrQFGGv/lV77uXvvxdjWvwcV64p4LYR8uIcQRuohrcXq5a6rIovnrb3DCRUaqBeMtIc02SQJMywRg0w9pGeSIMlBhILB8fxH66X5Ti3YzqL42rMS/7/+ck5Va1N+cwBPr4Z1+zRh1pAPk4YFtNrKKqxM9Nh14nXIzSwJy3SBV6ukBEYO2N4Z4Igc1b2VWxQGDGeM79USarHGvQDTcriJJT9B8WZ8t3BnJz/btvVut7dN8JD59fE4r/PHoLGp17fQKsKmVc46CeoWaDEpzYwf7XoJuuD5yYYHktPcuQX/6VelYPmJD9JmJv2Fq7e6eZ86MQ4ng//MFQJ4zNUvPEo31lAiF4eXUw323jbqdi41YcDFQG61cwBg5HyztEM/BIjshKMAmbIpWPsvP4MHKTDwnojBKW88GAruV+N5XWxOkFj/lzjYq0u2Pnt5SuiSLjTfIEWPVxRRtsBzeNoFCEF1hfmfDHxLaWw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?57cKkV6eVIUKRBryaLY69zFQ5J55JQv/oKlAnN3xLgJMCqkPR2abwlV71DZX?=
 =?us-ascii?Q?RH4ohS9TFBuG1ATQIzO8KW4tgocM++0EFhew9zhe0c3oKVjWpbtp7dVuaugt?=
 =?us-ascii?Q?D+I76Y0fxzb7Oe0NO2QImH4TsLquCIT/qEopPx/oGuVWSCQL1l7aK9IpO4FQ?=
 =?us-ascii?Q?OSeFBSvMFSry0cjobZ7ZKPm4h2ebrnDWN9EKwPGYPwo2wb+40feIRK1n/TQ7?=
 =?us-ascii?Q?1RbIECWTjZcQ4dmoTnEs6xDusnzN9yCeyFnpZ/1KYBVeyE0ZSJhhl/GAQwiK?=
 =?us-ascii?Q?jP4npkHHsAEfPTWMq9qqZ1LIV93SxflHXVkx2EYl84SS9s+O0exsYZ1lxse2?=
 =?us-ascii?Q?Q8WNG0EZxgzMy7VQbzY2ah4K49GQO7BhMAWKh6emHmmXGLKQQ4j58mxCUVUX?=
 =?us-ascii?Q?B33ZyyiT4ZyWvV1vWLV0pEDRuVaqPkpIi+IUvTEm//69jgdI/pDwq/52KMK/?=
 =?us-ascii?Q?SzmN2QI+MgfQ5yULN6j5JmSa0bYy79LSN8lxLdsg3OqISNK4EpXMP5ZW/W9Q?=
 =?us-ascii?Q?fg8IrQH+cdgL3AfIGfM51vxNjlnRLES7SaDRP/pBc/evHjr4wNy3dKWhRCuR?=
 =?us-ascii?Q?fnBrdRpUjyBsWhLBx8HBfzB6l3y627MjIV7+0J+Il+uKWrJJ7cLebpeQgLDX?=
 =?us-ascii?Q?oWd21Isntr3c5lpTxzxUqBUmoxXcCZLvTxy06vtJai7rJDQi9HwPVseCoLkP?=
 =?us-ascii?Q?9MKKTZgi/5bvZlAwwku1anqRmm0SPiqrLQL9GHY+0jENTFNrNwe/mM6bfsfT?=
 =?us-ascii?Q?ldxos2AA5jpaGY7VgqBWa3cO8T19iMk3vAUWj65Bd7FQ3odXBVTIWvTnX6j9?=
 =?us-ascii?Q?JhkWTmjYEIyOca8Ox/phjSiG2d+ynlYDQICJqI0mPhT6nKojjLY6Fo288ZCZ?=
 =?us-ascii?Q?BFkeMwOWTT5GnGcrLoDFJvdOBSIzu6ZsGjCIU2bGOUEXVPcUVVZZh+4YN15l?=
 =?us-ascii?Q?/vlGNIuVWwIG2O//9V45IKdUyodvxUS/8+EhiP828DYXMADAWwZC9YcKcS2s?=
 =?us-ascii?Q?IbyRNz+P1mqLK6eCb6p0epa2CbFSmy7aH5T607awNxiBdLQowrleweJmpwZk?=
 =?us-ascii?Q?Q4GaaF26UnFAMGFlReYrjAHNcsBk9PeOvR0dyzBkLrxdrogHb10adNOFQUz+?=
 =?us-ascii?Q?1JHoAzOn4KPir4+2IbhknjcA1scqrOzRkBvMqFXhKaVlIoF57kX4/bj8Lju3?=
 =?us-ascii?Q?2uNqmTmCJ/AqSw3tDzbGrCZ+OgEh9QsGVA0ihbR+KxTjkzmIqmE9aYMpC1iZ?=
 =?us-ascii?Q?6DVCkBY0v1bEWK8IfYUVYMo2JClZugWfw8eWpEsBEy+RquwVNUcZEbvVO1Dg?=
 =?us-ascii?Q?DifOPARvUnV5jq9hNcZzOtRfubOBEHo55mLJ5nb7cG/rPSlZolNL0c+dzB/2?=
 =?us-ascii?Q?TgShCE0DrCOm+fjguH6iwN9uPTQk3AcbezCUXlUqjDLMUquGpIZLDF737kkN?=
 =?us-ascii?Q?VE+VSEmPSZow7Oj/nL6F/eYp98sHPltNTZFhFKqCfTgW6I6rwyb5omOeEN2C?=
 =?us-ascii?Q?0LmJd9SjHdEMaJURNL6t3b+3FyX90HoVx2yUyNQ1HQfUtxSiRT2wJ2G390/1?=
 =?us-ascii?Q?LLT6hhwausziQQ/Jgzz17RkVUY03HdZuscrKTvigzFDtAxy1DvR2HnqAh3db?=
 =?us-ascii?Q?LwYHSJuj8RFV29Q/hk3aqFk66eUV3vT7i3spHUfEW2k1fRyjmighr3ueqxKe?=
 =?us-ascii?Q?qVAJ7CYsVlnHX7QvF1yPIAFAC1nLY8crZs8x2iGHwgRkpld6PwY5n3AAvPjU?=
 =?us-ascii?Q?sOQ1Wxt1jw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d53f50-8cb8-4a4c-e284-08df40a3c405
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:00:22.3186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMRXxUkuV0nUMJkJ0uiXoayQnaKJr8s3cnQk4fb55wOTgPER6MAvvKl9H8Xh77GBsTThrDNvQ1rIl0IWTGWgIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989595
X-purgate-ID: tlsNG-c201ff/1794477655-245122A1-7037ACE0/0/0
X-purgate-type: clean
X-purgate-size: 5184
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

bloat-o-meter:
Function                                     old     new   delta
mod_l1_entry                                1186    1113     -73
do_mmu_update                               5546    5392    -154

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

---
Changes in v5:
- New patch
---
 xen/arch/x86/mm.c | 45 +++++++++++++++++++--------------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e42cd33c0d09..dc0e0d451c02 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2197,12 +2197,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
 {
     l1_pgentry_t ol1e = l1e_read(pl1e);
     struct domain *pt_dom = pt_vcpu->domain;
-    int rc = 0;
 
     ASSERT(!paging_mode_refcounts(pt_dom));
 
     if ( l1e_get_flags(nl1e) & _PAGE_PRESENT )
     {
+        int rc;
         struct page_info *page = NULL;
         uint32_t disallow = l1_disallow_mask(pt_dom);
 
@@ -2276,16 +2276,14 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         }
         if ( page )
             put_page(page);
-
-        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
         return -ERESTART;
-    else
-        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+
+    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
 
     put_page_from_l1e(ol1e, pt_dom);
-    return rc;
+    return 0;
 }
 
 
@@ -2300,7 +2298,6 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
     struct domain *d = vcpu->domain;
     struct page_info *l2pg = mfn_to_page(mfn);
     unsigned long type = l2pg->u.inuse.type_info;
-    int rc = 0;
 
     if ( unlikely(!is_guest_l2_slot(d, type, pgentry_ptr_to_slot(pl2e))) )
     {
@@ -2313,6 +2310,8 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
 
     if ( l2e_get_flags(nl2e) & _PAGE_PRESENT )
     {
+        int rc;
+
         if ( unlikely(l2e_get_flags(nl2e) & L2_DISALLOW_MASK) )
         {
             gdprintk(XENLOG_WARNING, "Bad L2 flags %x\n",
@@ -2331,17 +2330,15 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
 
         if ( unlikely((rc = get_page_from_l2e(nl2e, mfn, d, 0)) < 0) )
             return rc;
-
-        UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l2e(d, nl2e) )
         return -ERESTART;
-    else
-        UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+
+    UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
 
     put_page_from_l2e(ol2e, mfn, PTF_defer);
 
-    return rc;
+    return 0;
 }
 
 /* Update the L3 entry at pl3e to new value nl3e. pl3e is within frame mfn. */
@@ -2353,7 +2350,6 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
 {
     l3_pgentry_t ol3e;
     struct domain *d = vcpu->domain;
-    int rc = 0;
 
     /*
      * Disallow updates to final L3 slot. It contains Xen mappings, and it
@@ -2366,6 +2362,8 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
 
     if ( l3e_get_flags(nl3e) & _PAGE_PRESENT )
     {
+        int rc;
+
         if ( unlikely(l3e_get_flags(nl3e) & l3_disallow_mask(d)) )
         {
             gdprintk(XENLOG_WARNING, "Bad L3 flags %x\n",
@@ -2385,17 +2383,14 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
         rc = get_page_from_l3e(nl3e, mfn, d, 0);
         if ( unlikely(rc < 0) )
             return rc;
-        rc = 0;
-
-        UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l3e(d, nl3e) )
         return -ERESTART;
-    else
-        UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+
+    UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
 
     put_page_from_l3e(ol3e, mfn, PTF_defer);
-    return rc;
+    return 0;
 }
 
 /* Update the L4 entry at pl4e to new value nl4e. pl4e is within frame mfn. */
@@ -2407,7 +2402,6 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
 {
     struct domain *d = vcpu->domain;
     l4_pgentry_t ol4e;
-    int rc = 0;
 
     if ( unlikely(!is_guest_l4_slot(d, pgentry_ptr_to_slot(pl4e))) )
     {
@@ -2420,6 +2414,8 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
 
     if ( l4e_get_flags(nl4e) & _PAGE_PRESENT )
     {
+        int rc;
+
         if ( unlikely(l4e_get_flags(nl4e) & L4_DISALLOW_MASK) )
         {
             gdprintk(XENLOG_WARNING, "Bad L4 flags %x\n",
@@ -2439,17 +2435,14 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
         rc = get_page_from_l4e(nl4e, mfn, d, 0);
         if ( unlikely(rc < 0) )
             return rc;
-        rc = 0;
-
-        UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
     }
     else if ( pv_l1tf_check_l4e(d, nl4e) )
         return -ERESTART;
-    else
-        UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+
+    UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
 
     put_page_from_l4e(ol4e, mfn, PTF_defer);
-    return rc;
+    return 0;
 }
 #endif /* CONFIG_PV */
 
-- 
2.52.0


