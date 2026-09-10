Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C5BC88E41
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 20:29:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415362.1644827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lOz-0000xw-Rp; Thu, 10 Sep 2026 20:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415362.1644827; Thu, 10 Sep 2026 20:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lOz-0000wr-Ng; Thu, 10 Sep 2026 20:29:45 +0000
Received: by outflank-mailman (input) for mailman id 1415362;
 Thu, 10 Sep 2026 20:29:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x4lOy-0000pt-BC
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:29:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4lOx-001ixY-NR
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 22:29:43 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31318-e002-0a2a0a5209dd-0a2a45048eee-40
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:43 +0200
Received: from [52.101.43.50]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31334-b57f-0a2a45040019-34652b32efb2-5
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:43 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV5PR03MB8433.namprd03.prod.outlook.com (2603:10b6:408:361::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:29:41 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:29:41 +0000
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
 b=ceBxpU+qmzyTFxqWrmw0ZDlcv2YfwyKl9jAtshhLOf7UJfrDd1WF72FJ04tbpoO8Ld9sXC9YVwOv/c/swmyrjAMwlqmhbg9F+J/d6Wg3lz8khxvgl/Wd0+X1JWAB5vTfaRI9VCs9Mp902Q4xFS0u78zJv/B7sbS8s8EnRAmX6t7On3KEicF77uR1JheFDu9JTS8A4GubSM7Ekqc+JP0ercgZEjCK/2SSpRikvdrVDF6RNuPTuoPQTKnUSMOJj1DNJfj+IZhJ/o4AEBdY4af+ljuNI3ZDu1H0bPNyWLRrWL1uvnl1vbsDgLfdYfN0N0+pgZczxDZ/wq5zLt1jvYc58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRMOrcUBuKZGWJ4fSy5SoqfBgF/O6euKv4pLdi6oABw=;
 b=Ql0IQeIclGCrEsV2RPNJbYTjXT1g43iFNLssc3QqGGzjilwqaTyJlm0JfY2A3D7lnYKtQz42ISa6l5jbGaeeHY+1U3DJ6clDW8AxqhFUfUppWUNvuZ/YrNabZGLM8qKefLvHawzOIPWCqLCVtDFo3cYeIwoLLMtfTCpj2f7fkU1QZKheSUmin783t2swSR7U5imftFEsFVyWUXdMTdi4l/RNhVUSKYpGE5gUsrS+mDKk+DRbRoATrppl/xPrXgxlRIaIOIKSENYNtj+RiTl5FcOxLQ3TMdNu0LWQn62Nf0DmQivBN7iEinZ2J20Uz64TWluYWU9kf0nzBHwLJVMkMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRMOrcUBuKZGWJ4fSy5SoqfBgF/O6euKv4pLdi6oABw=;
 b=PBoEr2rEnbvZZdQakJqTTDXUnJCQuaUyq4RFdEzBCH7Q/6n+bzp0Jz22phlU1TylR3VC7FCwvSZFzP62LUnczYPikj1JOXgAfKN4Ke8vopeCNBmCW37gFUCfxVpAMYRDisMD1+tirk8jRAhGW8Zoh9DUGnTvA1ba27EjqGdgyqQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 4/7] x86: extend mod_l1_entry() to optionally return the old PTE value
Date: Thu, 10 Sep 2026 21:31:10 +0100
Message-ID: <20260910203113.462943-5-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260910203113.462943-1-kevin.lampis@citrix.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0079.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::12) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV5PR03MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6e19c0-dafe-4112-6f52-08df0f7a3e21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iNRfAir0NI7rQSNTW6zVsZHzr/SbY0vSPnsrpR4Vna4M6ZTfqw9vZKrrBaCU4rNrwmPixdHH50UFmHSy3QRRptsH4JvoyGyESP5JRjRypT0kCuztFQ5nZYJHWovVhsKupUI6VaXzYDpGqkNjJ73+tRC+lev8UvLT/FA3VqQtxauIuSJPXmMYTQW9SImPKSNG8guiyG+9NDqkDO0BpGq+nRCAui8l9xgUOfpXfGbyIci0nuvQHYuBB/45ODlEelkXf0esqrGXdOG1ix+QoCXOFIwHxjiYPBXEGhxQyvmctIYZHnCgx7sm1gCSdV+2sB9aaNnYAjtmggflveZGlw5VbAnuF/dvqA/TTJBoVsLCVo9vbzyd1cizc66Dom2CPtMLeysYcTStAH5iYsqCtL1pPrM/IwFuDjUGIWlSTC2PmJfFGKvSXvIVTqsMIgBY3JajBlsiTRysqFiexITLqYO90bwZmei7AH1WIAOjd3NYzWSSi0WhDuIPMP49kKN1samDgWiZjd38bAgHyLRk6jCEXdcchB4WQZreNuKY7vPmzkz70UjYdWNHSk4EC5Q3NouM1JQgY1ASmaPmoYXVCAYpr47jhfhy+NKRXyJr6cL6xtmoskZjKguqDVSOd5E5rdOGpkW3RcaSt1G84OoYZ1edacH8PTbxHoWQh+yWQiZklOc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2O+S/Vun0/xXYZrOyVIrXO/FX0MUEhnM9kviWv+9LXfOGj042yxr5IBsO9Bo?=
 =?us-ascii?Q?DSNMFVo1WG8tlYQwkKP+pq7DIjMCn4P6nHUfjWujbD61BGfQklXFuvguXLws?=
 =?us-ascii?Q?r38ZDI+1GyK0fD/cQ8hQE+mh+4cuy0iBpY2yP8Ong1HABB/Jkisojj1eRknP?=
 =?us-ascii?Q?nuyaHt5pujcEpTdhlAl9HekWMoiU+imPN99qyz/WPOJ6OqeTP/O7nMr22BGd?=
 =?us-ascii?Q?3BfP6HthMRSC9OCr52yW0UV2whp/QLTzo0gMUh3Ven/0w9EZU2CY4UOfY0eC?=
 =?us-ascii?Q?dj1oTSzo2bXc3lmOdtrXDNrRiE35j09pJzi4U6WPygnPQhGL28+ilOYx+rfZ?=
 =?us-ascii?Q?Z2ZibjVCV4KgRffojPo5XuF7vPGYLdzQtm1wdbqMQLYGZu4p4Lm2+aZMYAw8?=
 =?us-ascii?Q?sdMCaOcF04PqpLWftYJ4AgLtHENIjjLybzorRGWX6+L/U1NTwSJoYoF30/4r?=
 =?us-ascii?Q?vQwQzr75FIrqWx43JchiJ0E18pVddJi6ULhVX0SoueON6338rE+0lRRZE5oY?=
 =?us-ascii?Q?bhG8YgwToB5pzK2anweMGRi6YeKxvmIydxwusj4jLmf2iah3g6lRAcfDi+iH?=
 =?us-ascii?Q?JWUczo/77OzuVQ94MmVPYiO/cNw3JoShPeG5pLXY1BUfITax/45PK1AgwLHn?=
 =?us-ascii?Q?/Z3zXwwxh32cBHp+2uHJXN8eXj227JYmNYn13RTDjrX7thXK7k5FJ1jGXbit?=
 =?us-ascii?Q?ZboBn209yqp2COcwDbF9FmLiOwv/bLr+rQeLHGEnuqNijSJKt+TR3cIU6B9U?=
 =?us-ascii?Q?+ShaBg4jwVvFInaU3clcaCp3Fc22rM/3jq81ww382Y4VV/l82FFgrRFDotLG?=
 =?us-ascii?Q?NPBrUxFW8lfSTM+Q1c/X0J/6Kk6kHIS1rHDysIrVDcX5teoAevYc/xZOZJ0z?=
 =?us-ascii?Q?VbclOXj1KLiMqj7p2b4OSdpPimCJdTh+sX03BLXMBwJj6DS+N/xoZQiNVyDG?=
 =?us-ascii?Q?R/Vzw8LcQMrigvHi2ItRgxnrGYCj6myK8MH41SVE+YHXYdgu4FLRT1erilIP?=
 =?us-ascii?Q?i3ygXd5ynG/sSRM/+wSq6Z/uVOYFHKg/T+0MvbxILLI8gnxMc3rZ6b8dN6Vj?=
 =?us-ascii?Q?yQj3kbukDQVFLRalxhlOhN+wAbZ1d/QUheyNF4T3JgNjW3obpZfXlL4QO4q1?=
 =?us-ascii?Q?NdzVMA83cQB+G5dD+u1t/4z5KQQ46IuQUat5GQfAJDkYtQDzaqnZPdS1lxwa?=
 =?us-ascii?Q?C8KCDsc4Oqk4LrPGU3LqY0dFwJuyL+ml8tkVe9K3QPUxbvMU6a+ItbJ5u9Mh?=
 =?us-ascii?Q?BajyOF52+oUorqR7Qmm7tR/FHVU3y5o87lM4j9JeMAlv32u5dBosKZQjxT9P?=
 =?us-ascii?Q?EqEmUN1QOWtyfYgDxIaDnwT+xyTpOpf8bmazQuXyOuG26lnu//Taj1vRYyQA?=
 =?us-ascii?Q?bnZmN7SKWMrW+8n9S/plHGuujAqKgcuAQWbHsw3NasJhTeHRJcgUzfCV7YLF?=
 =?us-ascii?Q?0DnpXKLceDIfsnd6ajNs1HWTCib9V/bBMxHqmMAixAZbCprOYEY3s1496LTp?=
 =?us-ascii?Q?GJR9EBVWcCgvIn73f+l9pS0SOH+BU5WXjtAL0A3llMqr2+7/BRedNxEW+VZ5?=
 =?us-ascii?Q?Fc4Rzt6blYZGuDm1nkzXOqeZE7es+LrnF9wjOeSUCaOAKRniEAMyTxF2LQ9n?=
 =?us-ascii?Q?YPCrrFSodvhU8/+dGbAn8kIPVudeN2jxUOkIRgxvkRlygt58iA2Ly56Pmkwi?=
 =?us-ascii?Q?0LjYw9gGsRRWY+KbB3IVFwTJua0uQ8dKrITjuaykHQ6BGm5wSFZjfwSUSk+C?=
 =?us-ascii?Q?WWGxpM8XaA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6e19c0-dafe-4112-6f52-08df0f7a3e21
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:29:41.3453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJMNS9WapxuYo9knz0E3pfYs67jtqwt25oRq35mvfzXJcCbF6qvDwd60RSxbgbb4wmNiHYunfj5DJCl762C1HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8433
X-purgate-ID: tlsNG-ebf023/1789072183-C1CD7B50-DC8DEC67/0/0
X-purgate-type: clean
X-purgate-size: 3287

Calling mod_l1_entry() with a valid ol1e_out pointer will do an atomic xchg to
set the new pte value and return the old pte value through the ol1e_out
pointer. If the ol1e_out pointer is NULL then old behavior is preserved.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- UPDATE_ENTRY now returns the old pte value instead of using an out
  pointer
---
 xen/arch/x86/mm.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index dcbc44f57c54..59ad5ce16486 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2150,7 +2150,8 @@ static void l3t_unlock(struct page_info *page)
 /* Update the L1 entry at pl1e to new value nl1e. */
 static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
                         mfn_t gl1mfn, unsigned int update_flags,
-                        struct vcpu *pt_vcpu, struct domain *pg_dom)
+                        struct vcpu *pt_vcpu, struct domain *pg_dom,
+                        l1_pgentry_t *ol1e_out)
 {
     l1_pgentry_t ol1e = l1e_read(pl1e);
     struct domain *pt_dom = pt_vcpu->domain;
@@ -2211,9 +2212,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+            ol1e.l1 = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
+                                   update_flags);
             if ( page )
                 put_page(page);
+            if ( ol1e_out )
+                *ol1e_out = ol1e;
             return 0;
         }
 
@@ -2234,14 +2238,20 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         if ( page )
             put_page(page);
 
-        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+        ol1e.l1 = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
+                               update_flags);
     }
     else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
         return -ERESTART;
     else
-        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+        ol1e.l1 = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
+                               update_flags);
 
     put_page_from_l1e(ol1e, pt_dom);
+
+    if ( !rc && ol1e_out )
+        *ol1e_out = ol1e;
+
     return rc;
 }
 
@@ -4109,7 +4119,7 @@ long do_mmu_update(
                 {
                 case PGT_l1_page_table:
                     rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
-                                      update_flags, v, pg_owner);
+                                      update_flags, v, pg_owner, NULL);
                     break;
 
                 case PGT_l2_page_table:
@@ -4474,7 +4484,8 @@ static int __do_update_va_mapping(
         goto out;
     }
 
-    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner);
+    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner,
+                      NULL);
 
     page_unlock(gl1pg);
     put_page(gl1pg);
-- 
2.52.0


