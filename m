Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949F4CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 16:46:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452425.1667243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHl4U-0005Ql-4E; Fri, 16 Oct 2026 16:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452425.1667243; Fri, 16 Oct 2026 16:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHl4U-0005Qc-0p; Fri, 16 Oct 2026 16:46:18 +0000
Received: by outflank-mailman (input) for mailman id 1452425;
 Fri, 16 Oct 2026 16:46:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xHl4R-000512-Oq
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:46:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHl4R-003Wv8-5U
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 18:46:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6ad254cb-8faa-0a2a0a5109dd-0a2a4506ca44-12
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:46:15 +0200
Received: from [52.101.61.50]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6ad254d3-195a-0a2a45060019-34653d323dda-5
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:46:14 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SN4PR03MB989476.namprd03.prod.outlook.com (2603:10b6:806:219::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 16:46:05 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0522.016; Fri, 16 Oct 2026
 16:46:05 +0000
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
 b=Kbq0hyYdMiu1S7JMCXKYft3JYLuUmr1Fv0rDoCFWmaYrvU5fY56NDsuSi2aoOfTauFNbqb+o85qcMdstJe/UWvJ6APCdQdN+FAshVpsW3GG3QBRijDq+jeciz49QqJa1Gdh4LDCd0UY80qdu3LX/M9v9IIpQvIU4snCzDNL4bwWqUzZjAZvGtf+esHkIAWimzLDdrNc5/KeIgkwDuuIbNryJwV8JhIktdstf3QHD0dii/kg8cMwfed6xBV6CY/d9fXrjhtXZlhYoYBwN+7JIpZvRt9rM138XpkNup2JwLQusN+tjjYpaENjGwpTvwGtth+GNcOy+KlvGEXAozk8GfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrJ9orQ89zsDoJwp96G3PNFcc/ZeuhXyKMJiiCFDl3c=;
 b=sLW6Ozom1StIrJuL4n+2OzYNqrYrEsTSadI4y5AY7Lxjxqhm9gSLDXQYgf9rNc/KuIBRm4jEBbtJILsrJ6KMrx3850XbxOtQmF4MefNPNgGBioWN8BYTnYJxSLoW/X+aSINqUuTCb25tVBaNtmUcOteRz3CTU+wHh6wi2wXCjeuCoSyyiXOKEBJEREHl9XzlD+sNLS3B/frNp9KjLkBydu4xua83Z/IMeJDbAM5VdsLmFXrgVWBLNc5KnycOpsFQy0xQKVR30NH/CUzidikiXiazydlwhvW0w1dlk9KOSdn7rI0J9SSJ1YnNITxuzP8KhBWBY6H5ELXncUqWHm7aFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrJ9orQ89zsDoJwp96G3PNFcc/ZeuhXyKMJiiCFDl3c=;
 b=p0W9VEqbK69Z5m8n6u+hrrlF61gD7wLNJwAejDzOhKODlwljhC4PcHpfdWRuHsHf4piBf7jqFxAByD2BrYsH64MjGgERvAWW+k9Fl50SVBZJMgPouWER/A00slhmvF0NixRHd6JTD/82BRxZBRFNFC8oXPh3oN1LfL1eCgA8dEs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v4 2/5] x86: extend mod_l*_entry() to optionally return the old PTE value
Date: Fri, 16 Oct 2026 17:48:12 +0100
Message-ID: <20261016164815.3109065-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261016164815.3109065-1-kevin.lampis@citrix.com>
References: <20261016164815.3109065-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0586.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::7) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SN4PR03MB989476:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b26946-4531-4df1-2d36-08df2ba4f8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 k6CjCL9VqK6w2ZlEVSdL5sWZi5dqZOD5zNhZRlbQMEKMGOwABAL2VyURk4W0q+Fil+JjESkAcu7wuzfY+Hh+Ol00cqfwnBsAdkj+494F+LaPqEZ5vw+3dJpE2At4WhUrXeD5FZNlQXSe6Nsoa54AOFLpyeOTiRU1Os3FJCNPslSxPMcz3EmElJt3rDPav5L7j8r27+L71Fgh9fBB+iP0rI71YluypWun0xh22u58TeX/z1LJm8evzFCnEovGZ78StJP7jSrsUNXTa8cT0QREXSu+ZFiJ6BPpjh8fuhoimMocZTw6rEY+PIBOY3M+xWN8xzcJwRFv7goY2MXhHPJeSf1wReTmETJHfNRzIBALWKxHqS2Omkg3WXRT75Tdo2HgeeVLVDDf0uf4A8OQnXAAN8UP43jkz7cjsjBLgpbPWb9XNXA9256s2sdbdALye+SynsP4R460CnTJmYvXONQVQIVDdmvPJQybw9noEml4V8ZwBAZcl+9bccSIebj1OXYRIh6mCADONAISLsxjZhYY6widh9fQUJlJV86WV8ZXXzD3fYEgJuuY6S43I6tQzDR1ccIBdhyLhSLjCcvrEN/Rl/LPynfBllniEXt+YVKZCS5q5zTIeFsToo+DRh2hdtP7hMvwUTcVpayzX7CyFLYw6WpTbF4z9u5LiQ/nwyPI3EE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?6TsCPS0Sp5bwqQXGxGOqmHaQg+TATD0cpMi6XMQT1ahLlWsVAAmCuwkBbEmn?=
 =?us-ascii?Q?HDL+eBeyTTwtnPsST7SR/ctLZm6CL+oRaVhHi68pVE26cAtgwfPhmbQcmYiy?=
 =?us-ascii?Q?iJxqvZFbeS84G+cklj+0CvMPAILTbyhzv92uM1d69kUB8/i06c4djjA7FMak?=
 =?us-ascii?Q?J0Bg2MelWKm0Ec1iM08uw09+K4VD0O6e2dTKBt9O/gxYIk4cPfP0iXJrqgnb?=
 =?us-ascii?Q?w38OtRGfq3RNb1Nq7CmE9KlMtBP6m+GqQRK2dZA4FkDzTWoEgPUNdiRk8+ri?=
 =?us-ascii?Q?ugQGldObB1ktLZ8DdpX7hjuNiA09xkiJPZ11ii4vcwH4dcm3gzdAbqN36ZYo?=
 =?us-ascii?Q?xrpFiy+mARkHCIyRlOAEyc33PcLEAlgjbRKOKHT6m2mznfU8jF8MJzOXn1H6?=
 =?us-ascii?Q?wpVYHN3isGXPPKhBA+Lztd7yauoSezeRQkPGxLCd34CBri//MawAlLItYU0I?=
 =?us-ascii?Q?FPll6wgJ3zD0gXsNM70721KaITETAoZpx76MtEKZLjALE6t4/W5KWj0jQ7dP?=
 =?us-ascii?Q?x9fS7EY7+NhkDW763ai1HekQjo6GFYAm95ke/88FxuRo/v8258FbWPd4O8+H?=
 =?us-ascii?Q?0IA4GLOx04Dx4vIiZVcEBVdr2lxVKw3HqhobSlbQ/qbS4GwEvM5ygthvnAqI?=
 =?us-ascii?Q?zXdoogu6oYIU57X0e93acc9ozVAQMUsjNCXSsE+xCw8pPsFfCDQ1vn4mvZn7?=
 =?us-ascii?Q?K/Y47GEg4om/7zAdtgXVSL3atKQEarehHLkql5gKedS5nULGQGeM/yi+WZVI?=
 =?us-ascii?Q?9WUhJgUayeY32JA5LoqEXNvUpWGWPxig6iOj4jkL6qUkFajp2GPow6S+C3jJ?=
 =?us-ascii?Q?IVBQmImMvc7Vp0u3qsmd1jIZYfqi/J2wdscGqNU6OQnjUl13z7eUegePGIJe?=
 =?us-ascii?Q?YDcBnzVE8pmE/3XlLQjALnCW1XwLSsKT2jY9uy9AVL9NEKr/sKfFFnV5jbUe?=
 =?us-ascii?Q?pEah3A/EZM5tpN7+4kdrRT9ALjcY++Z82OBoXL6D64K/iYClJ9A2jrwzTiM/?=
 =?us-ascii?Q?bR8iNfkhQkhb5ze/mfOueUmVifoTGAU5vz0l4CwlqACL5iqUPQZJiFfzKAnd?=
 =?us-ascii?Q?Ep0K740POiSxLj4wfWskw/WP9SA6MNNJe3ePybz2ZZxUvOf0F5+f4BEc1t0v?=
 =?us-ascii?Q?YPObpVURb7ZgbDMc7CNAYF70eRUjqu3/s7e1tR2D0LgiZAPNYV+mu795bIH9?=
 =?us-ascii?Q?C5mIVr0nF9aWd1cU4lRwpfvhXEni0TFHsFHKftp2kNFoWVW/k6XO2F/lCyuL?=
 =?us-ascii?Q?6JuKxg6w2kyKd1z2p1q8bira5pH4iDFMaos5hkTgL8JMYrLG/JdWUuK8vQ1A?=
 =?us-ascii?Q?b3rs/ma1HapSdNesy7jk9iSK90xp44f/gHevUwIG3iXiwYbOdfzpRWgZs/v/?=
 =?us-ascii?Q?lyn9Cwo/cEEoq8ssCQCudubOiXSlT5PI28MgmcVE3no3E8jhchDNq3wYBwSA?=
 =?us-ascii?Q?Ke0I1fcxML9equtoVbdi7Ot8ii92Tf6MYO08lMspL9Dk31iouGcl69xGiIlx?=
 =?us-ascii?Q?W+j0a4t1kb64/vBQuRryaP0/8jJRBCM/oUHMqwLTD0Z+HtD6hfm++CGSLeY0?=
 =?us-ascii?Q?V+Zf/6b1kcHBi6MSFZ+aWm8fIhc91G/HNiByoizfHewjHnvRPO8qheQy6OL+?=
 =?us-ascii?Q?TQhGjd4/m0wQfe2sY27ikt0vd/3SC0CHbciNpggNdzPKp/tRlbPJC/yHTGzh?=
 =?us-ascii?Q?breTMGEKtM79a+g3ch2P1IkU5K0fFRVfc0HpS/WV4QooPqvljiW9UBLqfv/H?=
 =?us-ascii?Q?R83fhQxpoQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b26946-4531-4df1-2d36-08df2ba4f8af
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:46:05.7435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZcp4ImYW30Fwc/I7rRSwL4x8ZyGNytgcmCkUEuRzoyR8UOQm0KQLuabjfuoKXEzr4U5Rv6Ez0FytbiNDjhcmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB989476
X-purgate-ID: tlsNG-16d1c6/1792169175-F74C977B-F3376E54/0/0
X-purgate-type: clean
X-purgate-size: 10844

Calling mod_l*_entry() with a valid ol*e_out pointer will do atomic
CMPXCHG to set the new pte value and return the old pte value through
the ol*e_out pointer. If the ol*e_out pointer is NULL then old behavior
is preserved.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v4:
- Refactor how UPDATE_ENTRY is used
- Update commit message to specify CMPXCHG instead of xchg

Changes in v3:
- Add swap to mod_l{2,3,4}_entry()

Changes in v2:
- UPDATE_ENTRY now returns the old pte value instead of using an out
  pointer
---
 xen/arch/x86/mm.c | 106 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 84 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e42cd33c0d09..609c8595a487 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2193,7 +2193,8 @@ static void l3t_unlock(struct page_info *page)
 /* Update the L1 entry at pl1e to new value nl1e. */
 static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
                         mfn_t gl1mfn, unsigned int update_flags,
-                        struct vcpu *pt_vcpu, struct domain *pg_dom)
+                        struct vcpu *pt_vcpu, struct domain *pg_dom,
+                        l1_pgentry_t *ol1e_out)
 {
     l1_pgentry_t ol1e = l1e_read(pl1e);
     struct domain *pt_dom = pt_vcpu->domain;
@@ -2254,7 +2255,11 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+            intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
+                                        update_flags);
+            if ( ol1e_out )
+                *ol1e_out = l1e_from_intpte(old);
+
             if ( page )
                 put_page(page);
             return 0;
@@ -2277,14 +2282,25 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
         if ( page )
             put_page(page);
 
-        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+        {
+            intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
+                                        update_flags);
+            if ( ol1e_out )
+                *ol1e_out = l1e_from_intpte(old);
+        }
     }
     else if ( pv_l1tf_check_l1e(pt_dom, nl1e) )
         return -ERESTART;
     else
-        UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu, update_flags);
+    {
+        intpte_t old = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
+                                    update_flags);
+        if ( ol1e_out )
+            *ol1e_out = l1e_from_intpte(old);
+    }
 
     put_page_from_l1e(ol1e, pt_dom);
+
     return rc;
 }
 
@@ -2294,7 +2310,8 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
                         l2_pgentry_t nl2e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l2_pgentry_t *ol2e_out)
 {
     l2_pgentry_t ol2e;
     struct domain *d = vcpu->domain;
@@ -2325,19 +2342,33 @@ static int mod_l2_entry(l2_pgentry_t *pl2e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l2e_has_changed(ol2e, nl2e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+            intpte_t old = UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu,
+                                        update_flags);
+            if ( ol2e_out )
+                *ol2e_out = l2e_from_intpte(old);
+
             return 0;
         }
 
         if ( unlikely((rc = get_page_from_l2e(nl2e, mfn, d, 0)) < 0) )
             return rc;
 
-        UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+        {
+            intpte_t old = UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu,
+                                        update_flags);
+            if ( ol2e_out )
+                *ol2e_out = l2e_from_intpte(old);
+        }
     }
     else if ( pv_l1tf_check_l2e(d, nl2e) )
         return -ERESTART;
     else
-        UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, update_flags);
+    {
+        intpte_t old = UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu,
+                                    update_flags);
+        if ( ol2e_out )
+            *ol2e_out = l2e_from_intpte(old);
+    }
 
     put_page_from_l2e(ol2e, mfn, PTF_defer);
 
@@ -2349,7 +2380,8 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
                         l3_pgentry_t nl3e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l3_pgentry_t *ol3e_out)
 {
     l3_pgentry_t ol3e;
     struct domain *d = vcpu->domain;
@@ -2378,7 +2410,11 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l3e_has_changed(ol3e, nl3e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+            intpte_t old = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu,
+                                        update_flags);
+            if ( ol3e_out )
+                *ol3e_out = l3e_from_intpte(old);
+
             return 0;
         }
 
@@ -2387,12 +2423,22 @@ static int mod_l3_entry(l3_pgentry_t *pl3e,
             return rc;
         rc = 0;
 
-        UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+        {
+            intpte_t old = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu,
+                                        update_flags);
+            if ( ol3e_out )
+                *ol3e_out = l3e_from_intpte(old);
+        }
     }
     else if ( pv_l1tf_check_l3e(d, nl3e) )
         return -ERESTART;
     else
-        UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, update_flags);
+    {
+        intpte_t old = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu,
+                                    update_flags);
+        if ( ol3e_out )
+            *ol3e_out = l3e_from_intpte(old);
+    }
 
     put_page_from_l3e(ol3e, mfn, PTF_defer);
     return rc;
@@ -2403,7 +2449,8 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
                         l4_pgentry_t nl4e,
                         mfn_t mfn,
                         unsigned int update_flags,
-                        struct vcpu *vcpu)
+                        struct vcpu *vcpu,
+                        l4_pgentry_t *ol4e_out)
 {
     struct domain *d = vcpu->domain;
     l4_pgentry_t ol4e;
@@ -2432,7 +2479,11 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
         /* Fast path for sufficiently-similar mappings. */
         if ( !l4e_has_changed(ol4e, nl4e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
-            UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+            intpte_t old = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
+                                        update_flags);
+            if ( ol4e_out )
+                *ol4e_out = l4e_from_intpte(old);
+
             return 0;
         }
 
@@ -2441,12 +2492,22 @@ static int mod_l4_entry(l4_pgentry_t *pl4e,
             return rc;
         rc = 0;
 
-        UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+        {
+            intpte_t old = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
+                                        update_flags);
+            if ( ol4e_out )
+                *ol4e_out = l4e_from_intpte(old);
+        }
     }
     else if ( pv_l1tf_check_l4e(d, nl4e) )
         return -ERESTART;
     else
-        UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, update_flags);
+    {
+        intpte_t old = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
+                                    update_flags);
+        if ( ol4e_out )
+            *ol4e_out = l4e_from_intpte(old);
+    }
 
     put_page_from_l4e(ol4e, mfn, PTF_defer);
     return rc;
@@ -3318,7 +3379,7 @@ int new_guest_cr3(mfn_t mfn)
                           l4e_from_mfn(mfn,
                                        (_PAGE_PRESENT | _PAGE_RW |
                                         _PAGE_USER | _PAGE_ACCESSED)),
-                          gt_mfn, 0, curr);
+                          gt_mfn, 0, curr, NULL);
         unmap_domain_page(pl4e);
         switch ( rc )
         {
@@ -4156,14 +4217,14 @@ long do_mmu_update(
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
@@ -4172,7 +4233,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4181,7 +4242,7 @@ long do_mmu_update(
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
-                                      update_flags, v);
+                                      update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
@@ -4521,7 +4582,8 @@ static int __do_update_va_mapping(
         goto out;
     }
 
-    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner);
+    rc = mod_l1_entry(pl1e, val, gl1mfn, MMU_NORMAL_PT_UPDATE, v, pg_owner,
+                      NULL);
 
     page_unlock(gl1pg);
     put_page(gl1pg);
-- 
2.52.0


