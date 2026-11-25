Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34C2606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 18:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Mxl7Msim
Received: from list by lists.xenproject.org with outflank-mailman.1502752.1698711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWI5j-0003RX-Ja; Wed, 25 Nov 2026 18:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502752.1698711; Wed, 25 Nov 2026 18:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWI5j-0003RM-Fn; Wed, 25 Nov 2026 18:51:39 +0000
Received: by outflank-mailman (input) for mailman id 1502752;
 Wed, 25 Nov 2026 18:51:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWI5i-0003Qq-89
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 18:51:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWI5h-005Dcy-Ke
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 19:51:37 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6b072e2f-2eae-0a2a0a5409dd-0a2a4509e546-18
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 19:51:37 +0100
Received: from [40.107.209.71]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6b072e37-be1a-0a2a45090019-286bd147a86b-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 19:51:37 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by BY5PR03MB4920.namprd03.prod.outlook.com (2603:10b6:a03:1f0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 18:51:34 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 18:51:33 +0000
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
 b=Jfk+jbM9z5ARrgwXD0GIxJBAaqDXDbH5xzgxyHr/V8NKPsvdmAQceVo7vEJzkTxG9C7TZ12zD+32Vx7NeYSLcZDZs/BHg/4uhb9/ccFWSj4CVLb5/RANK9Lq33rQPpMyo2fvpsGCXZHJh3jndC2U6d1RgEmBZsxkC9KIOXXbjkNKKgoVSZzhdJRCOraNtbs6l1Ooye9JFn0i7YxHt95iMS27CkmDoUSkFb540+pGjFkXGDBkdWYHooUdRaNT7xDHiMqBS99Z+RlgARm+xm9SllwN4X/yyHcmY8Wy6JkcycTD75y7ugBVQHPCRGUrdREIHOeFii65nczSL9M1sFbZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctAoO4e/P7jx60kdZ1Z7o+Hs7VYkh9YjrnSmF/KOWcc=;
 b=T90rWLeGP6rJIGlxE8B5EyI4qlzRoWCqB4dbrKX21bbOfacO+KTvMggSilPqSY/ga8YXJwvvhWnpYpVYbVptYKyid5shliBzGoKb7V90Z6bf90rFsqJ0Cqugj+pA53QcSDHlCHhBmWMjd2xTJ/wFx3yUgGtLLetadHhUATc9hjtZAdJoGULykF0MdaPXgMJ761Mod0pqenJ9n3Gis4tHlKZsRSAnmt+EoYpq/MOS1SPtyRQ8HJij+8u7pMWi8/w3BVB1XmrFsYyrUh1cP4VO69ks1Y+/u9W7xOBAa7ddeQom+y/LHu/t3Rbo5fr6uK3uZda+EPg+CaxGUVIhYJwDEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctAoO4e/P7jx60kdZ1Z7o+Hs7VYkh9YjrnSmF/KOWcc=;
 b=Mxl7MsimIfeaAtOxfVSfngx7hLxLm28ABpui7/xhXzgzH9Kyp5NV6YMFDHd/Nh0c9Yq/51y1qCJPvMAGL0YU7ibWchEGZFEAHms9/aoqcIfPojuSwgQgvJlJGA1WYV5qT4TDjczNm/ZaBrR+cKg0z6ZPnMI7e0mQ2pfUGzXev/c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v6 1/4] x86: extend mod_l*_entry() to optionally return the old PTE value
Date: Wed, 25 Nov 2026 18:51:17 +0000
Message-ID: <20261125185120.1766552-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261125185120.1766552-1-kevin.lampis@citrix.com>
References: <20261125185120.1766552-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0512.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::18) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|BY5PR03MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: 73bfe000-1a39-4494-cf13-08df4b252038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261026140227099003|10067099003|261009223027099003|261102123227099003|11063799006|56012099006|261021121427099003|261021123027099003|261026121527099003|261028144727099003|261022105027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	EejZkB2e6ImN+Rq34lxdAsqxB8o9MZvpVDMv3MUOxzcu13x7oyZETP5Pa5EJHk5rl72BC0JIY6i0M2MacP3vkoppesy+kI/t/Z7ZU4XLQIiToXUnWfYgNaN89girUIzt5vpXumCbZc2FVVTS+b/pO/aa/fwzZwT7J6gdNfoH2PL1ha5+3hAe/uWu4b4D0DTv+s1yFFygpJNkaV8B3nitWluYKVPApG0TzVRQ88zIklLb1a/6CtBXYFl3z+DyvHQGO26h4e5w9MpiE2ib0dJSlZp3IcafIfxm1FRT4mMRPqvJq7hdIb8CJK3byCp8SGAhKeyHmn1dIK286KjWtmqJS6vV9a+wNewmS0Bu0eEQo+5WU4lGcpyRZVe60Hj46MrPPfOx2m0r1fFdFNyI4DPgX75xyUdD0RQE5u6QI/RqaTTrfplOvzLUx2773K6nB9VA+GJUdDQOZ/sKJdF6UHtmJYVutUEI59CZv0YCl6KpkO5G9ZtzCrhsJ+4x3skJAZqAf7J3xdSZMMnhC70NTvt1/tRLkfAhlSKC9v2DIofXS9D7lfyEfQhPgUCFpiZhHxpjqhCZNmK5i+chs2upCU+StW9tkNL4i0KqRNmMxVvM/W+ncnI1guPzJiPpYiAggwkDvs0RbEQLoOXn582PA9QNiiBdbvNgnV15tQw3DxLP9QU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261026140227099003)(10067099003)(261009223027099003)(261102123227099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261026121527099003)(261028144727099003)(261022105027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?50mEmHh9MFAr8qMhDSiY5OnqKQ94dfgBqbKgxnoBjtIXY11E6E8Z8NXAfMGH?=
 =?us-ascii?Q?y53CPj1gerhqlDEd3FPeNpWkAHC9WABEyFZglz42qbIpC1TAZeqwotcNodPi?=
 =?us-ascii?Q?fMuDdZqd4hgsMPuRVMKKehc6yog2vZLOhjlorzhxpVMbx44ZvDMo40XM0uQK?=
 =?us-ascii?Q?loomBgbW7RdU1s5iR4XFw8uEU7cINwNtK4H/5Urkh+ErKgsrNOIkBFS6VczU?=
 =?us-ascii?Q?oEXEL5IRVVCUT6JHV69S8bY8AbVDScT64uhuQ6ax1y8CWSbZeyK8QPfgo00+?=
 =?us-ascii?Q?k/TIViHCM58b0o/JXDq1hJgF/FWHtpZcy3NYl7OlVfefTRksqHPcqYtp0Rsc?=
 =?us-ascii?Q?EV2hueujdpEi3AkswcL9t8FAwZS5xiXySRaWBkAOwmNvJ3K43/pOrhg2Rphv?=
 =?us-ascii?Q?9lklzLgnsvWB/ZqxR/OwGwhoEuHuwctSKI2ua0WE6BcKXwUlM7VRkCfDvCDw?=
 =?us-ascii?Q?uLicuWBuV3BXVCcf5nhg+ktAyAxXJTPOs1WeS+NfwinAzjRLfH0GT+AM+VPM?=
 =?us-ascii?Q?MfjuhRGAQqXCOaAuEOb5jDNLUhQC1X8b4S7Av8Vmfbmv26w9GxN0BAqWMEbq?=
 =?us-ascii?Q?C0t+kqQd14LXtvfwtJTHzfqUL3Az8lcaqjow10jt2FJRuK+XDfFmaCXjXOAL?=
 =?us-ascii?Q?At3YHcXSy2jQbYkH9bqZqUnIbOpcJ0Dg7DFjAbqD7aW7mnfr3mInqfB75Uy2?=
 =?us-ascii?Q?/Sf/fMwLKLfS60obcbrkwXJU8hV5BWRScL6Kfr91k0DHgTfqc1Uw0XaL7n0P?=
 =?us-ascii?Q?xNt7NCZZcEVIV0OcowkNS871DBYZlgsof4GCfgQT1Ts8o1fwUJ+asji89LZU?=
 =?us-ascii?Q?WbpdiWI7yohAPmLPOFJdgfoNt3eFs2XakTbryqFFXpS7jcXoahCJHc+k6G7y?=
 =?us-ascii?Q?hCD7P1JGnuL4AXTvMkVWkxhT4YIxhTDHcG0d2cEa7v/L9QHBl29/561OUVzX?=
 =?us-ascii?Q?mbHXJEtn0Nbf4jcDJmT5IZiZBmrNrcWBc2z4WwptW13s9CBAR6CRXEQcETai?=
 =?us-ascii?Q?GJR7PJSKyhpNXVleX9gSyusZTZBA3Ob8fTaQIrGOkdMyN8YoYj6eITRwTdiP?=
 =?us-ascii?Q?G9TfCOgSdXeyKQ4pJS80u2fXKeNCBly+5Ow9XHRZ8xYyA1hFOteXJIc+9Nfi?=
 =?us-ascii?Q?/NXOyWRBPd6PoT6KHS5LXZTGTydbJjCrIR3o+mS+EC+pEmp9KwVBoZXm/4pH?=
 =?us-ascii?Q?ngmyizsmZ/sI7L7Umx+mH+rHTFq3KjaYs04KrLcGlLTkx3Lca6H4VPfQt5bo?=
 =?us-ascii?Q?D3TMY/uMkVII0kfP9XHjldoxmeneiEIgxTzf4JliXbSC4lPpP26xeG+gLM2L?=
 =?us-ascii?Q?InivV8Ohpy0KAi70/FJ7T/G5zNvu40QPxbH32cvOdPhXPkM2Uej1yuYOJZ8t?=
 =?us-ascii?Q?tgE3xUezZqSX2LCo1I5cfokZNQ4zThQy3K/lZMkPeUWYazvQtMC6uzk/7QC0?=
 =?us-ascii?Q?UHkNYUOJLXGPED59OEPSqLYCjCB8uryJyTuo5/0KjF8AgvvN1lSB6zDlFcuR?=
 =?us-ascii?Q?xuzW2LbFDpb8gtMF9TYeDkk8bA8f6i2An8mAvmGh6MuSfafPvJGKV8Nyh9h0?=
 =?us-ascii?Q?TtjIQw2trgf4bBB9yBaY+mzzbx/EfqVGXw9wC0FaYK8KKnHz3RNKUw4NFjwW?=
 =?us-ascii?Q?IECRg5LXqQgySxno7lr1l/vDxxByBzzBJsKqReyCfZFDA0EPf01eJ68xgeow?=
 =?us-ascii?Q?PeAWWQgjHqiFXhbKSbpQFc9YDhJYKND/J4BJFbqCD43B37HlsdhF55VgNmos?=
 =?us-ascii?Q?AroBuhFzaQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bfe000-1a39-4494-cf13-08df4b252038
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:51:33.7554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUoj/eZbZpeNqVdV9n+KGZmC/ivnVww/u5ijo5YFIDBft+GdAurdg3ecMl0E7bKMAJWivd11Dr2TTpewanosWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4920
X-purgate-ID: tlsNG-bad1c0/1795632697-BF6D2034-D8E6337A/10/78276251493
X-purgate-type: spam
X-purgate-size: 11090
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Calling mod_l*_entry() with a valid ol*e_out pointer will do atomic
CMPXCHG to set the new pte value and return the old pte value through
the ol*e_out pointer. If the ol*e_out pointer is NULL then old behavior
is preserved.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v6:
- Write of the output value moved into UPDATE_ENTRY().
- Use count_args() to keep call semantics the same for non-SWAP users
- The temporary `out_` variable is not strictly necessary for upstream
  but we have something in our patchqueue that falls foul of
  -Werror=address without it.

Changes in v5:
- Refactoring the mod_l*_entry() functions was split out
  into a patch before this one

Changes in v4:
- Refactor how UPDATE_ENTRY is used
- Update commit message to specify CMPXCHG instead of xchg

Changes in v3:
- Add swap to mod_l{2,3,4}_entry()

Changes in v2:
- UPDATE_ENTRY now returns the old pte value instead of using an out
  pointer
---
 xen/arch/x86/mm.c    | 45 ++++++++++++++++++++++++++------------------
 xen/arch/x86/pv/mm.h | 28 ++++++++++++++++++++++-----
 2 files changed, 50 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index dee06828b3bc..7ee71e5cc61d 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2197,7 +2197,8 @@ static void l3t_unlock(struct page_info *page)
 /* Update the L1 entry at pl1e to new value nl1e. */
 static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
                         mfn_t gl1mfn, unsigned int update_flags,
-                        struct vcpu *pt_vcpu, struct domain *pg_dom)
+                        struct vcpu *pt_vcpu, struct domain *pg_dom,
+                        l1_pgentry_t *ol1e_out)
 {
     l1_pgentry_t ol1e = l1e_read(pl1e);
     struct domain *pt_dom = pt_vcpu->domain;
@@ -2258,7 +2259,8 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags,
+                         ol1e_out);
             if ( page )
                 put_page(page);
             return 0;
@@ -2284,7 +2286,7 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
     else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
         return -ERESTART;
 
-    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+    UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags, ol1e_out);
 
     put_page_from_l1e(ol1e, pt_dom);
     return 0;
@@ -2296,7 +2298,8 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
                         l2_pgentry_t nl2e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l2_pgentry_t *ol2e_out)
 {
     l2_pgentry_t ol2e;
     struct domain *d = vcpu->domain;
@@ -2328,7 +2331,8 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l2e_has_changed(ol2e, nl2e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+            UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags,
+                         ol2e_out);
             return 0;
         }
 
@@ -2340,7 +2344,7 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
     else if ( pv_l1tf_check_l2e(d, nl2e) )
         return -ERESTART;
 
-    UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+    UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags, ol2e_out);
 
     put_page_from_l2e(ol2e, mfn, PTF_defer);
 
@@ -2352,7 +2356,8 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
                         l3_pgentry_t nl3e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l3_pgentry_t *ol3e_out)
 {
     l3_pgentry_t ol3e;
     struct domain *d = vcpu->domain;
@@ -2382,7 +2387,8 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l3e_has_changed(ol3e, nl3e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+            UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags,
+                         ol3e_out);
             return 0;
         }
 
@@ -2394,7 +2400,7 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
     else if ( pv_l1tf_check_l3e(d, nl3e) )
         return -ERESTART;
 
-    UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+    UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags, ol3e_out);
 
     put_page_from_l3e(ol3e, mfn, PTF_defer);
     return 0;
@@ -2405,7 +2411,8 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
                         l4_pgentry_t nl4e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l4_pgentry_t *ol4e_out)
 {
     struct domain *d = vcpu->domain;
     l4_pgentry_t ol4e;
@@ -2435,7 +2442,8 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l4e_has_changed(ol4e, nl4e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+            UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags,
+                         ol4e_out);
             return 0;
         }
 
@@ -2447,7 +2455,7 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
     else if ( pv_l1tf_check_l4e(d, nl4e) )
         return -ERESTART;
 
-    UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+    UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags, ol4e_out);
 
     put_page_from_l4e(ol4e, mfn, PTF_defer);
     return 0;
@@ -3325,7 +3333,7 @@ int new_guest_cr3(mfn_t mfn)
                           l4e_from_mfn(mfn,
                                        (_PAGE_PRESENT | _PAGE_RW |
                                         _PAGE_USER | _PAGE_ACCESSED)),
-                          gt_mfn, 0, curr);
+                          gt_mfn, 0, curr, NULL);
         unmap_domain_page(pl4e);
         switch ( rc )
         {
@@ -4163,14 +4171,14 @@ long do_mmu_update(
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
@@ -4179,7 +4187,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4188,7 +4196,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
@@ -4528,7 +4536,8 @@ static int __do_update_va_mapping(
         goto out;
     }
 
-    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner);
+    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner,
+                      NULL);
 
     page_unlock(gl1pg);
     put_page(gl1pg);
diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
index 8ee776509c8b..eb099ac9dc33 100644
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -2,6 +2,7 @@
 #define __PV_MM_H__
 
 #include <asm/shadow.h>
+#include <xen/macros.h>
 
 l1_pgentry_t *map_guest_l1e(unsigned long linear, mfn_t *gl1mfn);
 
@@ -105,14 +106,31 @@ static inline intpte_t update_intpte(intpte_t *p, intpte_t old, intpte_t new,
     return old;
 }
 
+#define UPDATE_ENTRY0(_t ,_p ,_o ,_n ,_m ,_v , fl)                  \
+    (void)update_intpte(&_t ## e_get_intpte(*(_p)),                 \
+                                  _t ## e_get_intpte(_o),           \
+                                  _t ## e_get_intpte(_n),           \
+                                  _m, _v, fl);
+
+#define UPDATE_ENTRY1(_t ,_p ,_o ,_n ,_m ,_v , fl, out) do {        \
+    intpte_t old_ = update_intpte(&_t ## e_get_intpte(*(_p)),       \
+                                  _t ## e_get_intpte(_o),           \
+                                  _t ## e_get_intpte(_n),           \
+                                  _m, _v, fl);                      \
+    typeof(out) out_ = (out);                                       \
+    if ( out_ )                                                     \
+        *out_ = _t ## e_from_intpte(old_);                          \
+} while ( false )
+
+#define UPDATE_ENTRY__(nr)  UPDATE_ENTRY ## nr
+#define UPDATE_ENTRY_(nr)  UPDATE_ENTRY__(nr)
+
 /*
  * Macro that wraps the appropriate type-changes around update_intpte().
- * Arguments are: type, ptr, old, new, mfn, vcpu
+ * Arguments are: type, ptr, old, new, mfn, vcpu, flags, [out]
  */
-#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v , fl)                   \
-    update_intpte(&_t ## e_get_intpte(*(_p)),                       \
-                  _t ## e_get_intpte(_o), _t ## e_get_intpte(_n),   \
-                  _m, _v, fl)
+#define UPDATE_ENTRY(_t ,_p ,_o ,_n ,_m ,_v, fl, out...) \
+    UPDATE_ENTRY_(count_args(out))(_t ,_p ,_o ,_n ,_m ,_v , fl, ## out)
 
 static always_inline l1_pgentry_t adjust_guest_l1e(l1_pgentry_t l1e,
                                                    const struct domain *d)
-- 
2.52.0


