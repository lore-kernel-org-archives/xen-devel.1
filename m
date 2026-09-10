Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5C8C79FBB
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 20:29:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415360.1644813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lOt-0000YI-6k; Thu, 10 Sep 2026 20:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415360.1644813; Thu, 10 Sep 2026 20:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lOt-0000Y6-3w; Thu, 10 Sep 2026 20:29:39 +0000
Received: by outflank-mailman (input) for mailman id 1415360;
 Thu, 10 Sep 2026 20:29:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x4lOr-0000Vt-3x
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:29:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4lOq-006SS3-0s
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 22:29:36 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa312e3-2eae-0a2a0a5409dd-0a2a450cabdc-38
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:36 +0200
Received: from [52.101.193.0]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa3132e-f479-0a2a450c0019-3465c10060e3-4
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:35 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH7PR03MB7463.namprd03.prod.outlook.com (2603:10b6:510:2e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:29:31 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:29:31 +0000
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
 b=DPJYtAV14UALF92Xgi0gJSNVL3ZziYwb04t85AVH1PG8mcOGWohLqWF/pagWr7Z0PjEdabd2e/xmChsr83WILuY188Rvttjzisz/mF9j7zP8vUYaM8RVP8G4DHzt9gW+o4LAnddFFcuTTrhuNrddBVkilR8Hvm8KRYBr8pTvyiAvC8cCTJH+rhnTATrRtUCiCKFwftHYBVB/JKyMQ/FOC5fhCpSExrCBVoPng0JNLI7FLaJ0Q7ngXN0eqFDhnCTwtYrKCfEVgmMdlKD6OGHpJmtG3oDcLJccRFsW/o2x7AOyG7F2xtJsOmxf528l757JjeafKFkSKT/VS0K8C//KRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZTj/1vocxaUbG8pca89bpaode5EiKcz4pQy300Ltjo=;
 b=pkMG+QO+1pdshCPOAnFm1JJ0RD7EdhMMwwS8Y3gotCMYNr5bAK0k6VkSFB/Wwh5aOi4e2LFlwK92A7z0/JwNW6tp31uKSGtMjHMrqGJTriFw2LqjqKWBJpho0InpoxESipuU6caJlH7QRIzxKNftFJtv/Fw2JXzaa1Mh//ew+znefMiIGikEYJ/YbIafzeT1715ftmkLj0mSPgpK2v14IJNVP+HwQDcVpz9puHmDan6hqMmHimEyhLHR2jVIiGpS8meUEH6GshHCDNqcYKu89cfjQO8Kgvv07yZzKNsJ3pX7Zc3IxMPEcMUQ9vZPl1bRZ6ypcdyLfvDEF1Xvlfst6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZTj/1vocxaUbG8pca89bpaode5EiKcz4pQy300Ltjo=;
 b=YqobQ7ZqWoqCCc/71PBr4kHN6JW3iYpg8APUE6iICeRyd2qY3PRBorjIqvCws6gzbsH1V4bS08HLUYKBldoN/6RivYINmUvG/ST+lKCaIaX28Nv6PoYuqmrODheWIhOukJh8m9HiMbFEaRs1MA/Nd/jRIs3iIl9ykaf/+NQ5GpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 2/7] x86: Remove return value from UPDATE_ENTRY
Date: Thu, 10 Sep 2026 21:31:08 +0100
Message-ID: <20260910203113.462943-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260910203113.462943-1-kevin.lampis@citrix.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0171.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::14) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH7PR03MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: f04066a6-3645-49fa-29e4-08df0f7a3829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	OFyBa64dycf5FSiO7xUUZVTwwUgVGVh1n+JcGwixq3jkBws03zkGFZ/q0UHK4VICtfqCDfKcRDFxtXhJFtnwPfTaYZRWvkmQ9GoNJhiHvg0cjtTVH6ochQjIVeg/cTZo9N2QOoD+B+5de+dKITGeIfh1t2E0f2EG1ZnSNtZl2J6kylRGc8qoRmFFtoEp957Zn4zLfmIUy6RvBqTUndD+Db9k1c4Pdxo6KcwbRkGQ7kaoU03WvIFXjKu+eVZP+Cu9kQYjldMmcOk5IAOFBVAhbPIsKqC7acsqaAR/mnGLBS9VwKl0mm0GdoU3GLOjz5oaBxt5vJi7jcxtnNF4CEHO3xJO7zXvy/UyfUqGFr9aom42M+KGlLwUfcK1ahj4WFSQSblny4uwSrq3T6m3szCk8XFeXAH5Q/htos/zNg9sYIvqiRrbQz82HamlFIqkzhCBHv9qRo5EamCMpe5+pMIhUeFHwpMX4Ghe/V4B6T+uYGu1ksbBvDt6S+dKgc2eULBeiLN12v0VSTu8baOeoQA1k67tsPD3N+71yMfx4Sy9QEOhfcLVIPWISuu+aZVPvXICeCJzGYadXvD8CefAzHqJRAoWOIN5k6aMkckQvYLzkOTopL3CkbOVEIgJPzbUv3APHuH2BbZxb0JTIhbzq+f3Icuw8Ei7INH3Vw07Rj70ZVo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tow1kS9J+6YSZPvctbuV6qXCJkNxTniXDz4OxQANgjeIpJpWjrzk+7CqNDrQ?=
 =?us-ascii?Q?Sy/jMFTsV9XF9OwZO4Cvyp0Y3YrlHbAWXadJA4c+HDTBYUC26PWCP1BsszAF?=
 =?us-ascii?Q?9ovDgP6/70QnqTPyXFycKu/43EytGjunbQubOXuNNaph4MP2IR6fpJkX2eHZ?=
 =?us-ascii?Q?6h2Wg2jaVWGvNpi2LW5WXSHb54RaETHsOCQ5EJLJJ5T7a2Tr2oXfFitJmwlU?=
 =?us-ascii?Q?6nOenrjRLlPkY9ktQabInneUqRH0vWpJKbBSmD4CUXAlx7Lw9Qi089mmNg0M?=
 =?us-ascii?Q?GSBQckD6TdwSAF8HgCOBHDQoZUnc/XJ31zAsp3926ip1CKp5Vk2pcXEzkk1G?=
 =?us-ascii?Q?sBQL1Ja1Z+oWgUIxmlVjZuv78zjJaL2CVT47smfDY0umNsEb4ZvWfn4GRiHT?=
 =?us-ascii?Q?Zl2Ky/ICn8xWBHqwtFbS6KT8/f8CCATEXLd/bAtxFyh+LcKkduUyjRHO2ahv?=
 =?us-ascii?Q?a25xSmbIqeHxhVhkZgk4wB1WVcccCiZkMlHzrUHcTsvo8bfXFkbq7wevh0Kv?=
 =?us-ascii?Q?XDHWXcDeTv7aPu8ynnCu0iHPh6/AgQdGMpTh6sJ6A3Z4tvSgdbkgRcRQg3kk?=
 =?us-ascii?Q?BAK1gSzfxqYRBrfvzQ9yckw7pvIBkCZCrQ/TI3wabnFf6/sDnqg6sP9Jyvd8?=
 =?us-ascii?Q?TNnxsx0PD0QRHKIV0sFWhPYqqZ3v36xyVYbgN/Ud0TILiW+bxtuQkqn0GmZW?=
 =?us-ascii?Q?ArC2atl0v8LlwFtc+BvNDSosfieRrP+q9+nAWdH5yP7hd9CMTsug4ymS4AUU?=
 =?us-ascii?Q?HbknjmsH+Spf+DYF+AnhWT3fzubixJOdk97JRvqZXSA4eMtcGWtH9RECw9Lf?=
 =?us-ascii?Q?FyzP2Lt21x8osX4+9WnXlWHXubv7atrMqqTVnNOc9TBh7hrhC3gmPq0zStZs?=
 =?us-ascii?Q?Z1d8H/1cX4jbQiEVk1xFELuoRMuWpTqoblbEqte5aDt52y9YrQELtW68B+Ex?=
 =?us-ascii?Q?dmzdRq21cxhLikTv5oQJNiuZKjJGC/5OhIvpAmpXFKTV3dUHc5ic/E+lWrCQ?=
 =?us-ascii?Q?jcV1Go6NPa5b+n0hFBcuTX+piHLfQKCCc2U1NfnUUCHiolknLe4lCJ6KYFOe?=
 =?us-ascii?Q?Rirtr0NT0OJDYkhaiBYWOcqF23kD8xp3UTqkUKrOKNtRsGoUW6V+ki9OMc9Y?=
 =?us-ascii?Q?Rk7he1LC5IhqZD4jU7xDYkOg3Ncjapt70JPZ2m/J/7Pi5WNSUDapaSz5j/Ap?=
 =?us-ascii?Q?Owp9I4PElYNVbej3gcYLnj+GyZ4CA8yOk8RhZk72OsO9Js/xpckQ4Ud0CzSp?=
 =?us-ascii?Q?06LOZXEj9xhlM99Mgps/sdoyLMacYn54jsL52uQVHtwdJq0paqBOOPSnMRVg?=
 =?us-ascii?Q?FTVysdKNyGTGmdlbLQCLL/DXuwWa8k5oEi8TVy0doFLHxXftLYNKYDCbX6s2?=
 =?us-ascii?Q?n1HCFrWZs4ZQT9eXXfMPVbmU0J3kQ5RqFNHkqOTxHt7KzBwZM8ZR48lx+aYD?=
 =?us-ascii?Q?pxBu6PpSRRzR9JRMaTm2A2Ywn+zpcShiDk8kQD3hiYM2qlmPyiOYr5N8S/oH?=
 =?us-ascii?Q?hoIGMdgfdzxRSeoQuIppAKLhGO8+85X0XU9k2ML9SWjMJQiaicSiH3Zyk+Qp?=
 =?us-ascii?Q?3zoW5/VsglWhj0ycXoNC80MYm5pKl6N/JpOr+fc+yYr/lXH1Qid71CkVuAXZ?=
 =?us-ascii?Q?mZQPKhMOuIhS3li9Vr2xXeGWOBOvuA7/5/P2Nt88p8ZdJIVCvmpQLm5k+kzT?=
 =?us-ascii?Q?vaYB8b86xLyElLgsFPfEH32IW4mT/CvW0lluv8Q7N8b16mF4T1E3og1FA/cz?=
 =?us-ascii?Q?VHlwwYvtrQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04066a6-3645-49fa-29e4-08df0f7a3829
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:29:31.3313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YahzVvmvDQgscT6UzPRHV49JJfoQJSjtOW5+pMVZmbQGC0SacPrbkWeD32CNMMiXq15CWx26Oi4kR5nuspwnQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7463
X-purgate-ID: tlsNG-d25034/1789072175-774D7A5B-9D31EFF3/0/0
X-purgate-type: clean
X-purgate-size: 10387

UPDATE_ENTRY/update_intpte always returns true since 1bc30c076a7f
"x86/mm: {paging, sh}_{cmpxchg, write}_guest_entry() cannot fault"

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- New patch
---
 xen/arch/x86/mm.c               | 74 +++++++++------------------------
 xen/arch/x86/pv/grant_table.c   | 53 +++++++++++------------
 xen/arch/x86/pv/mm.h            |  6 +--
 xen/arch/x86/pv/ro-page-fault.c |  3 +-
 4 files changed, 46 insertions(+), 90 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5f778557b1e6..dcbc44f57c54 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2211,11 +2211,10 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
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
@@ -2235,20 +2234,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
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
@@ -2291,28 +2282,19 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
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
 
@@ -2353,8 +2335,8 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l3e_has_changed(ol3e, nl3e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            rc = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
-            return rc ? 0 : -EFAULT;
+            UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+            return 0;
         }
 
         rc = get_page_from_l3e(nl3e, mfn, d, 0);
@@ -2362,20 +2344,12 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
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
@@ -2415,8 +2389,8 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l4e_has_changed(ol4e, nl4e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            rc = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
-            return rc ? 0 : -EFAULT;
+            UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+            return 0;
         }
 
         rc = get_page_from_l4e(nl4e, mfn, d, 0);
@@ -2424,20 +2398,12 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
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
index d89306d34fc6..6a2e37d4a4ac 100644
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


