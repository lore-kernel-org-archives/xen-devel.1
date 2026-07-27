Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5625CC531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 15:05:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371722.1619199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woMtB-0003k4-IL; Mon, 27 Jul 2026 15:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371722.1619199; Mon, 27 Jul 2026 15:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woMtB-0003jx-FB; Mon, 27 Jul 2026 15:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1371722;
 Mon, 27 Jul 2026 15:05:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1woMtA-0003j5-2r
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 15:05:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woMt9-0007da-4M
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 17:05:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a677391-bab6-0a2a0a5309dd-0a2a450c9d60-36
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:05:07 +0200
Received: from [52.101.43.51]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a6773a1-f479-0a2a450c0019-34652b331083-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:05:06 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SN7PR03MB7120.namprd03.prod.outlook.com (2603:10b6:806:350::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 15:05:01 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:05:01 +0000
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
 b=s4tjOl0fuwL4QXfG77SGdFqTyJvcudTtQb6zd+gTLM+fCUBRx+Y83oMeQXundQkVFkBu/CUUO5LKCE9/IHj2h/1CPEklRVmK4eqjmEbSqkceUp3yXY8tYMzv8hpe3EvEu0QMiKSp/Xr3c0LwNMcXGxApuhoBMFEd+2eoF8W5VfV4KIMf591LQ10EI39qC5IjPdPik+nq3VT4+oV274YFOrl8ihTJG9TUrGNEsP7Sc3cjIh9W3u4Jl+ESiBgHDWoCQ58MHta/n9qIU72oIgNdqizByhkKLzDOaSmF9rR/nZn8gWsxCYRBZm7C4dzLFkbOEHMs/grNg1bwQH2oXZ09pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNm1nuNO+XAb5R8ex77Fpi902ddh3pTIX6BDJO1AGYQ=;
 b=x+qgBUvGiKrpjtKDtImvr7f6hccMBj8Es45OtKhIS5cUbCPAcAyz4L0ZqlH+FmxZmGfzoqIUi1jTW3vFSKfOnXs9w/gRNhuk/j0GO1ryBhegB/HcYbn2HYgrZYS0hRXp1Uq3UjRDssxBXGHGNOOVFEJKVwC8FoA6grE/wH6HVnx0awVhOzHYi2ymsT04iJdYaSs0/E73CSnk+RklVa9wSJP8YdYAYrzvq1iyxq07YpZUo1Z7s41NkhmR1qoReNNMa8d6lZerynGZ/H1Vc9b30kLMMm4FRVp8h0g5Z2QlQkhIxuY9RPVRYQyl0ly+UPkJu66TcTxJQ1geaK5d/P4G4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNm1nuNO+XAb5R8ex77Fpi902ddh3pTIX6BDJO1AGYQ=;
 b=q+XS17bOWzPD5Vcd6eNsj/ql8NfCRbwtmU8/tvNnh7XzJBxTkIaYuVOSqdsxCMZZhVqLznZi9noG+nMrdUoi3OLcDohNAotETFUBRQayrHTml+w0WMQUrqrkKYQ4im3bF7LGvcu2WD6VKoOGYTKli4cJWpUV9aFVHTCDVYQhEHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 1/4] x86: extend update_intpte() to support atomic get-and-update
Date: Mon, 27 Jul 2026 16:06:12 +0100
Message-ID: <20260727150615.1373200-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260727150615.1373200-1-kevin.lampis@citrix.com>
References: <20260727150615.1373200-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0481.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::6) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SN7PR03MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2671ac-a520-4252-20dc-08deebf06e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	6oZknuTh5TKI6CbdPirRfYI6v0CIWCnWOo8QaEFPRe42qwZ0bun1Vsuj17GXT2Q5ghKwK+6LkgFk3BIv3irciHxH9p7OZxk8foloR+BHnGIVpA+cjYD8EoXAS1hwKcFynjuHxCJZR7VSDVbFH65FEMfe7wID/1hrmb6WznPQai9uJS0tfh9m0nZ3tUp89Ti5Uwo+6yu7geNeZVXmVpTGT1f+5d2ee8OoOTbmElUV8ONUDXvDwq9GK0BXF5XP402Phq0++/Yih3d7koS1inmFPtyGdVtbepLAXm/lfVTvGqAEBOoevpB0xnuQPnBbz8JN6bLioR/L224Q9lhj3ynjh94B8+2GSQg/SaxJrrIQVpopR1ZvYoCAHMMH9eN4ZNya4KdJMA1PEcdRH0kWtMXfn9tAnlmv1ZmAY0YrXipWzqst/9O2IkiBhpi7NN29A7UYbyISDmpCPzSPoIB84Z3/azmZSMpkgmOy+1WwQiOlyaq9L07a94fhVzclM5wFU1RHrZ9WEnL6pUsXYCZVbi0wvI5Wc/hT+OP9WiytcKTQht70F89XpmlypUty3GC4S+/aN/XlJzqvAEeaehCgRPgSOuVI0OC4VDvvelJDnBou5aQ/1UbwL1DqFDzOVWJ6T78jSuOIZbDeHrxl+sa0atIhvmb3k/IKQlWlPQ8bq9yQwd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1mhC0CWHNREoYNL6jQUog1KOFKZyLMst2CXEy5AKQgptIMwvmqdMUVwGoVlI?=
 =?us-ascii?Q?0krvs7zCnWVgkUYYyAB1Xkheb/xBHfZXTHrrKB2UqpdEFlo6nj8HW4PR+pqs?=
 =?us-ascii?Q?VbYFKooQwEl2y8VXe0M7o5et12erN7bCetLp4AbSkN8z+HGBN11mlPSdZ8NX?=
 =?us-ascii?Q?SGCfs4ES1d4I7owF9Sk3ziwtdh33TVEK5oeA2e5lnZvgjMMFTwI1md3+XEcb?=
 =?us-ascii?Q?79cPI9u+GoW1nSigGB8Ny6A0g7pXZiMU7hTHrWxuJjvSxm2D7QOrpJMvdZ2o?=
 =?us-ascii?Q?9R+KnkkEB5R3JNbW01DeNUdvGbMAVWD/xXjMBBIo1x9c4AiI+GcLPpCX7nZH?=
 =?us-ascii?Q?qe5IO6YBeHcMAuwxXGIpyxzbCtJS03zT+626SyhjhJE/2iQdIJ3R4rdKK7FR?=
 =?us-ascii?Q?AWAlehWLNKWvu5kpKUa4v9rlfoKiN0/Tw6tLh1Lm0Sk0T01s4Ap159C8BFLX?=
 =?us-ascii?Q?pv8CVIaOKI5QM482MHJrC+27v0ISawiMTNnrZ8VnfIBkh+kO0MjvlfySt0cz?=
 =?us-ascii?Q?c1bTZ8Rp+3AeSv+B1ORC5FK9rkuZrXJ6vIQjWx6Lha6mvTNjXEOBmucn4cPV?=
 =?us-ascii?Q?CPRSbHIwFddnggauASUA1Uqq9D3zor9E+lt3YlvX/CaFz9MeFU8rgSoh3hcz?=
 =?us-ascii?Q?cdYkbzRyGUJPBhAg5CL0gk2tW88+YRI7Gm7uQ6YBxjIhlKY/2c2Cm5qAWyMB?=
 =?us-ascii?Q?PQkBRiKIS7D4H1/M8Pul8o306KLTaqmd4fElgwCG7m8twU+m9eltsbn5+eSB?=
 =?us-ascii?Q?P/Jc3RywNrNTWWTPpIYWdnrfQx8xeWXdDcV/TTvrQPR2sEAOxpXueU+tx+sI?=
 =?us-ascii?Q?PEOdLcUmoG4Lgy/rzLK7OlOPhTBAC/CaUXuAxaED/juUZa8M6oioITzjWbv+?=
 =?us-ascii?Q?q4nreZKAlik1U6WgDMCpWs6oiQxx4ruruT9/xzEBip27tpwfnX1TQ202t9iq?=
 =?us-ascii?Q?e2eHF3HD0NgHQpTXl9DvA6NUAyvY9fYz7rYYWNugn5ImTEP7ZG/dQ1eOUVel?=
 =?us-ascii?Q?ZtpwDsVZBUnQm0MwTSjPipdUQxrpohBe0GXOMKObpT5RTvzFaEv/tSKpACcD?=
 =?us-ascii?Q?Cg3U9TdzpkFHzy7y0ba4orDwgtFPjrlZeHS0usKaFXZFX2E429sDgd4mZpgZ?=
 =?us-ascii?Q?mzLFZJLSoz0l9JWbEtts7eRXymzP2xT5yBJW0lwXzX+yFRnh5GPGBL46FiMK?=
 =?us-ascii?Q?EOQyrt4w7F/xEor96mly/HwWOqIHsSf1c/htof61Q/Pf6RpKj31mhBuO5a6W?=
 =?us-ascii?Q?Jv3DQRPraMU7Hv35/GUcJmSX6SpaGpB88Yo8xfwp2FcVsNrkBdFcdnhhStMn?=
 =?us-ascii?Q?DlR37dtCArT5zT5E2uBZ9AkgwMl/SmH5hcNEGDQvrULQm2DXV34WYZQZ3cwi?=
 =?us-ascii?Q?MXkpa1vv8pIE0YRAn6RxKENpE5HFGeZaNmIzRP4e7MZCgZoM9l99niWdLi4S?=
 =?us-ascii?Q?3KxUpU/BH8B2h97krCbkD3jLdv1gtoPp+nCGaCvb8xhyWxqALM3qtsuN9pmd?=
 =?us-ascii?Q?oHPiIlxkGMdxgd4Yvglyz7LlAzGZO26dL2aFy/6jfsTmWUnhq0ne2XLBCDho?=
 =?us-ascii?Q?8HlcXdmq7GFClY7yBYb/1BnUYgKaq3JLsKWXAwN/gDji9FRjGqGPaA5yD5I1?=
 =?us-ascii?Q?PaUhZk6xArFrMVlOCLDu7tZZKet7pAzk8F/44ZSHR81XZyMGEpAz3eDXS/hW?=
 =?us-ascii?Q?50q5OTqJ8QLllHArLZsks1wRde8TIi+BVoRPv+kkSnlxFQ6hJthCyPeD90Aq?=
 =?us-ascii?Q?zXKRdwaBew=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2671ac-a520-4252-20dc-08deebf06e45
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:05:00.9987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOIBwg46vDqDvJbzYSxEjFAGo6W4SPaRHrEBa3BWSB4j/+cnOHJ5ImAi47q+6vpicklOYewXmNTxAwaiSkxoCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7120
X-purgate-ID: tlsNG-d25034/1785164707-02ADCA5B-1556DC4B/0/0
X-purgate-type: clean
X-purgate-size: 3101

The update_intpte() function now accepts a new use_cmpxchg flag and if set
returns the old pte value through the new *old pointer.

No functional change for existing callers.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
 xen/arch/x86/pv/mm.h | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
index 4564cab9fc0f..8c42cf3b3f4d 100644
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -66,13 +66,14 @@ static inline intpte_t paging_cmpxchg_guest_entry(
  * How to write an entry to the guest pagetables.
  * Returns false for failure (pointer not valid), true for success.
  */
-static inline bool update_intpte(intpte_t *p, intpte_t old, intpte_t new,
-                                 mfn_t mfn, struct vcpu *v, bool preserve_ad)
+static inline bool update_intpte(intpte_t *p, intpte_t *old, intpte_t new,
+                                 mfn_t mfn, struct vcpu *v, bool preserve_ad,
+                                 bool use_cmpxchg)
 {
     bool rv = true;
 
 #ifndef PTE_UPDATE_WITH_CMPXCHG
-    if ( !preserve_ad )
+    if ( !preserve_ad && !use_cmpxchg )
         paging_write_guest_entry(v, p, new, mfn);
     else
 #endif
@@ -82,30 +83,36 @@ static inline bool update_intpte(intpte_t *p, intpte_t old, intpte_t new,
             intpte_t _new = new, t;
 
             if ( preserve_ad )
-                _new |= old & (_PAGE_ACCESSED | _PAGE_DIRTY);
+                _new |= *old & (_PAGE_ACCESSED | _PAGE_DIRTY);
 
-            t = paging_cmpxchg_guest_entry(v, p, old, _new, mfn);
+            t = paging_cmpxchg_guest_entry(v, p, *old, _new, mfn);
 
-            if ( t == old )
+            if ( t == *old )
                 break;
 
             /* Allowed to change in Accessed/Dirty flags only. */
-            BUG_ON((t ^ old) & ~(intpte_t)(_PAGE_ACCESSED|_PAGE_DIRTY));
+            BUG_ON((t ^ *old) & ~(intpte_t)(_PAGE_ACCESSED|_PAGE_DIRTY));
 
-            old = t;
+            *old = t;
         }
     }
     return rv;
 }
 
+static inline bool _update_intpte(intpte_t *p, intpte_t old, intpte_t new,
+                                  mfn_t mfn, struct vcpu *v, bool preserve_ad)
+{
+    return update_intpte(p, &old, new, mfn, v, preserve_ad, false);
+}
+
 /*
  * Macro that wraps the appropriate type-changes around update_intpte().
  * Arguments are: type, ptr, old, new, mfn, vcpu
  */
 #define UPDATE_ENTRY(_t,_p,_o,_n,_m,_v,_ad)                         \
-    update_intpte(&_t ## e_get_intpte(*(_p)),                       \
-                  _t ## e_get_intpte(_o), _t ## e_get_intpte(_n),   \
-                  (_m), (_v), (_ad))
+    _update_intpte(&_t ## e_get_intpte(*(_p)),                      \
+                   _t ## e_get_intpte(_o), _t ## e_get_intpte(_n),  \
+                   (_m), (_v), (_ad))
 
 static always_inline l1_pgentry_t adjust_guest_l1e(l1_pgentry_t l1e,
                                                    const struct domain *d)
-- 
2.52.0


