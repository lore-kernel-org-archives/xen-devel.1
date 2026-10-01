Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0F0CA5FD4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 17:46:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438578.1657286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKrC-0004eX-Nt; Thu, 01 Oct 2026 17:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438578.1657286; Thu, 01 Oct 2026 17:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKrC-0004eQ-L6; Thu, 01 Oct 2026 17:46:10 +0000
Received: by outflank-mailman (input) for mailman id 1438578;
 Thu, 01 Oct 2026 17:46:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xCKrB-0004eK-IQ
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 17:46:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCKrA-002g9X-VQ
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 19:46:08 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9c33-2eae-0a2a0a5409dd-0a2a4507ddcc-34
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:46:08 +0200
Received: from [40.107.200.26]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9c5d-b4ea-0a2a45070019-286bc81a16b3-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:46:08 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV8PR03MB7518.namprd03.prod.outlook.com (2603:10b6:408:190::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 17:46:02 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 17:46:01 +0000
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
 b=MH+CSoYzPrJyCfvoCgbuT0z1KY38FDEP9Cq3/BwZZR1XPVHSBp9EUuEjR33eYWGzVa1JHahL4SNSqdCSx2fnN9kwfDyrixYGXIy3WfziZceUaNZUjNd3+bI3kN7LOrQOExe8pwDih76PjHxz7aAOMMiFREIybynw3SBJ2rAVdObLnOjNl9JeForvlPOUsj3YRDYWnbph9N6WhAqASv+XMoPq7dZotgxaCEBbN20ICgdYIN6IobFD9ElCpJ3WiYheUUyUyGVUOuMHb/1urXWZD8PIbwNgviqdx6EbjxycJcqOp/JX0tuG+dBN0DSPAKFR0cNxt+r+0b4d8WcMjG8Rzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yukoTJTvfx2/TW/Z+5HPZvKVMIqRm9iNuXR7qMg8Uk=;
 b=Zz5lxKZIHVIC0Zfo9eIn9kAAXY8xDgQ3omLk0dsDHjHEOXRLxe9PpLDHp8TfA+aoYnHCYjgeD6lJYcuPZwBjwfzBXnm32FzZq967MXH22DsmZdlLQlscOgN1QTOBREaypTikt6TTEn53zz3LNaaAPhswwWfTWG3FvkHvYBE41x56VeRUX7/ith+NPxVB2nZ1eDTRvnW+QekVX6KFwRq1x9AVtW6xxIv+2UUW0sZczXeyKIgN+k0NGTiTGQtzzzuX7mSfdLfYbo6AJ0QRoge2XO6sNRYPmsebMiGXFsL7npiRsqIHhm06YFGZ7WSSaydeLYWeE+Lmlw9iad862fjIwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yukoTJTvfx2/TW/Z+5HPZvKVMIqRm9iNuXR7qMg8Uk=;
 b=E7y4n8//Sg1viuAHHWhjNywv8d/0KJq7OBTHvU2X6RbEBhKC1G5EdvgyKlv02dMr/ha4NEVPqQFh4ThnDPLk4+VCerKBxIuNP/7txFbLY1Wyx6M+PwxXHd1iv3s9oZYT1ySSTe4ram48vx5uXfSDBB7AbKBaIWgj5vNX0d0BUl0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v3 4/6] x86: extend do_mmu_update() to support returning the old PTE value
Date: Thu,  1 Oct 2026 18:47:47 +0100
Message-ID: <20261001174749.2275245-5-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261001174749.2275245-1-kevin.lampis@citrix.com>
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0095.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::10) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV8PR03MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b8dcb9-ec96-49c3-d835-08df1fe3dbbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	c8Bj9LZOdXwBUWI+lE3BDQBJBz3pURh/KBXjgvhGXA5jSWNERVMD3iN5VPRXJ9oaputSfp86tHXquNPoV8bX/+0b2NQ+8Xklse1guqhE0ACDbHZTL3buhiXC5NB9rRjOwVKDV10yu68VoWidXCSRug4NiWWC2LiR4lT43Evdjrj1NLdoEJWJ5CwAuunHhCG94v159Rb6doLpGyCNzTugdGUAUffuEKvLp0L1lUzAGfnGAOyCqeyhWN/5a7OJvzK5pQmLNdpge9GAz3arHopxBKYED/IanFQHxlQiRidokSsL/0VaCd8Fk8debnjeRCnJ6JHd1S5htvUNTsiN82Lyyt71QQjc07NoNOSED0ydAI+sF+xGpUPqhLoU8fr+4J/3vdCDueoqwfZDPJ5ufNp1yOTi4qMG+nqhC4pFCz4Vd3Fpy1Wa9BCJWMs03x8wxbnHC3cLXe9cT83cCWb4Mff54pdxJZf/epgBWmOpie+lvugbQlHlrlLlXgq0WfkFRjLm3r6N57rMkl16YuOfTBHZnDdYS1wu4HUIxiKK/nKlyIA81XQ7RmLP/5Lxkr67EVcdNZOWJdWNfE/a11MGCtzhxZ2yFcFpJ2RA23A8+qyKk1++3dkkODyCWkioBgCsXEHRgveEf2mLPsccEqRr0lMKS3O3SIclCWwu1QBgrRN8dE4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qp60arT+AZfbvrt/f/AZhqaJTEXFC5QEdzlZqkc4Y3yy+4+AWh7zwjCIoAMf?=
 =?us-ascii?Q?3+UYbAVQDyYjxYBpS0a3KBBnISROc4C9KOkldjHClr/afXxtk0gJaAU0MuxH?=
 =?us-ascii?Q?pC7IeDeeFUk/0XSBy6owMsnVntL/KoM1EnzrxSQlB7MrZln2W827EWvImxoq?=
 =?us-ascii?Q?AE5uBcm6ojuuQLIpFA1WsxGxd1lubRQQ2PSARtA+LocpcMVoMsgzuX/44pFm?=
 =?us-ascii?Q?YzlsaakVEXsW7HvStZ+oXIAXCyOrD1r2Lmy7BvEY+XGCl+iJOxmG/J5FWH7V?=
 =?us-ascii?Q?hD/KItaLJdQSQG3gXHvpHzik66t4+XK+EVieGvKJFt9QNsaCaAn0XF4bgYB+?=
 =?us-ascii?Q?eX/THTBueO7TQhtOr18V2gQTRsqv6QncLET8JDvzHzaX5+S1O5Iumu393mNe?=
 =?us-ascii?Q?U/7Et9bhfPH/TtGek8+58qQWSu/CR5dYfMY7eSSTqvLOvzbzzpKjDDeqRwBR?=
 =?us-ascii?Q?7l9MCieDS2c2JSNtgih4tCiytl7XYQLEcITNH7dFgWNjH/89zR/tasGRrgHK?=
 =?us-ascii?Q?9aceRdmlVlf6X+vWdY6qvdB8vyqUJ3MqRvWT0uoZVMX+K4W9JSEjjLxqhe+n?=
 =?us-ascii?Q?60Nfhi0aylUgmfrP8WUH78o9y1XWSpw2E1p0HRJKE4c0METzCER5hJnvHjKU?=
 =?us-ascii?Q?hUhjw7nLQaAGh8GRl86eilbh2L3dgKon8PHmNNdE87/kwIezyTEhEAFQ+/Ni?=
 =?us-ascii?Q?Qh2arc7afUMFGgtfO+0DhhBwDeqVHt8P9cmRAGF0Y3jErRb7l2uPlR4RGodQ?=
 =?us-ascii?Q?6IsEUZwElCNv60ipv1GXplXLs6Dj7rSI3KUBd1bIlRa3xKNfmPPzGljcgNBg?=
 =?us-ascii?Q?mQIQS6zuNVPcQTfy8lmXyEqAXPD3KH/v+rgV9ivUu0OveVbOaDTKcOPVR3D+?=
 =?us-ascii?Q?cUgg+pRllUkNxoiMiPHmgcTuNAPT7j6CEbu+7/zk29Vun6OWkfzlGDstnmMf?=
 =?us-ascii?Q?XsIiBvL5kXgZ1U6sboczOPvBV4hMvxv//u/eOEbahkoM3vUiaRyEy9PvVen+?=
 =?us-ascii?Q?ZsInHBIL++t6l0I8DJvrXgcF+nfSmdWngo/zFZew+wMbwt+9XBa/Ll+fuQH2?=
 =?us-ascii?Q?4gbt7ahzlPk7cMAx+kUOJ+u0YUwYIkph2ACnbiNNV/Xhek84lFtI7L70VBC6?=
 =?us-ascii?Q?W2GcVSBxfLV3csvGxzx/NDw2/bwqscJ+u+C6b2J2wS4v9Drumpjn+dy1JKRN?=
 =?us-ascii?Q?/QyOCZl5kX1Rg2O4SPONVOK1kJUW06Laph1KIilkCesqrYJYv8omxIAjOZ8r?=
 =?us-ascii?Q?cFKgr1GU/6DBAriAuzpgYe9jWRUzx3GUf8geN1/XuUHrGgtEzqLmUmB60Qbq?=
 =?us-ascii?Q?xubv1Fr1tHzj3yX41KsJN/XXwJOG0af2JmtrmhF+C7oqPPQiGi3l4KccruUY?=
 =?us-ascii?Q?91khTpzb6rTd8bZAlLdsdpxAlkgIaz968v38zEZzDfrm2uoWMVuNNI48WBmO?=
 =?us-ascii?Q?NV+MgiBX1XWfqd2cViKB9esWtpitQI+zovI1OWMhBmHtmRho0mgcToMaUr3/?=
 =?us-ascii?Q?8ODwNyBVEV7SFonUueA8GYSPifI9CbixBip93sk1/tvxxZORuzCRPbWPrajL?=
 =?us-ascii?Q?p5CHDjrDk/EQ+OhvH5xG5iLhLrYiWvs0X9eLiJzOSqNR+lg5u8ji2fn2ebAY?=
 =?us-ascii?Q?v7SvQEq3sJRLf8QmeuCRI0pOVrGaP4cWbLWHKHUZQQxR9KP8fXIHjDhxeabA?=
 =?us-ascii?Q?G4Cit2OKDguuQt3oZr1DKxZn+CBM6ghxK67sXuRqAehBEy6xt/a19FrP+EVO?=
 =?us-ascii?Q?EHGEG4F54w=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b8dcb9-ec96-49c3-d835-08df1fe3dbbd
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 17:46:01.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TJGUp97vsCUyybuOUwxvF1fpbC3QIgMPtMWVPruvgE4Dq0GcPP6nHIfjFvqRVlo93j6VGlD1iZqbqMjFPG/Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7518
X-purgate-ID: tlsNG-ef75cf/1790876768-A4AC8AE4-64939F3E/0/0
X-purgate-type: clean
X-purgate-size: 7883

A new sub-op MMU_PT_UPDATE_SWAP when used will do an atomic swap to set
the new value and return the old PTE value through the req.val field.

- The old PTE value is passed back to the guest through the req.val field

If MMU_PT_UPDATE_SWAP is not set then the old behavior is preserved
  do_mmu_update -> mod_l*_entry -> UPDATE_ENTRY -> paging_write_guest_entry

The new MMU_PT_UPDATE_SWAP call chain looks like this
  do_mmu_update -> mod_l*_entry -> UPDATE_ENTRY -> paging_cmpxchg_guest_entry

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v3:
- Do swap for l2, l3, l4
- Allow all values not just 0

Changes in v2:
- Add a sub-op to mmu_update instead of new hypercall
- Rename to "swap" instead of "clear", although only `0` is accepted
- Remove spurious curly brace from `case PGT_l1_page_table:`
- Restructure `case PGT_l1_page_table:` to avoid diff churn
- Add missing `MMU_PT_UPDATE_SWAP` check for the second
  `PGT_writable_page` block
---
 xen/arch/x86/mm.c        | 80 ++++++++++++++++++++++++++++++++++++----
 xen/include/public/xen.h |  1 +
 2 files changed, 74 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 535a62139cad..a2d05d6c7113 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4111,6 +4111,7 @@ long do_mmu_update(
         case MMU_NORMAL_PT_UPDATE:
         case MMU_PT_UPDATE_PRESERVE_AD:
         case MMU_PT_UPDATE_NO_TRANSLATE:
+        case MMU_PT_UPDATE_SWAP:
         {
             p2m_type_t p2mt;
 
@@ -4172,10 +4173,27 @@ long do_mmu_update(
                      update_flags = PTE_UPDATE_PRESERVE_AD;
                 else if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
                      update_flags = PTE_UPDATE_NO_TRANSLATE;
+                else if ( cmd == MMU_PT_UPDATE_SWAP )
+                     update_flags = PTE_UPDATE_SWAP;
 
                 switch ( page->u.inuse.type_info & PGT_type_mask )
                 {
                 case PGT_l1_page_table:
+                    if ( cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        l1_pgentry_t ol1e;
+                        rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
+                                          update_flags, v, pg_owner, &ol1e);
+
+                        if ( !rc )
+                        {
+                            req.val = ol1e.l1;
+                            if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
+                                rc = -EFAULT;
+                        }
+                        break;
+                    }
+
                     rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
                                       update_flags, v, pg_owner, NULL);
                     break;
@@ -4183,8 +4201,22 @@ long do_mmu_update(
                 case PGT_l2_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
-                    rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
-                                      update_flags, v, NULL);
+                    if ( cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        l2_pgentry_t ol2e;
+                        rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
+                                          update_flags, v, &ol2e);
+
+                        if ( !rc )
+                        {
+                            req.val = ol2e.l2;
+                            if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
+                                rc = -EFAULT;
+                        }
+                    }
+                    else
+                        rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
+                                          update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4192,8 +4224,22 @@ long do_mmu_update(
                 case PGT_l3_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
-                    rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
-                                      update_flags, v, NULL);
+                    if ( cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        l3_pgentry_t ol3e;
+                        rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
+                                          update_flags, v, &ol3e);
+
+                        if ( !rc )
+                        {
+                            req.val = ol3e.l3;
+                            if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
+                                rc = -EFAULT;
+                        }
+                    }
+                    else
+                        rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
+                                          update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
@@ -4201,8 +4247,22 @@ long do_mmu_update(
                 case PGT_l4_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
-                    rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
-                                      update_flags, v, NULL);
+                    if ( cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        l4_pgentry_t ol4e;
+                        rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
+                                          update_flags, v, &ol4e);
+
+                        if ( !rc )
+                        {
+                            req.val = ol4e.l4;
+                            if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
+                                rc = -EFAULT;
+                        }
+                    }
+                    else
+                        rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
+                                          update_flags, v, NULL);
                     if ( !rc )
                         flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
@@ -4230,6 +4290,11 @@ long do_mmu_update(
                     break;
 
                 case PGT_writable_page:
+                    if ( unlikely(cmd == MMU_PT_UPDATE_SWAP) )
+                    {
+                        rc = -EINVAL;
+                        break;
+                    }
                     perfc_incr(writable_mmu_updates);
                     paging_write_guest_entry(v, va, req.val, mfn);
                     rc = 0;
@@ -4239,7 +4304,8 @@ long do_mmu_update(
                 if ( rc == -EINTR )
                     rc = -ERESTART;
             }
-            else if ( get_page_type(page, PGT_writable_page) )
+            else if ( likely(cmd != MMU_PT_UPDATE_SWAP) &&
+                      get_page_type(page, PGT_writable_page) )
             {
                 perfc_incr(writable_mmu_updates);
                 paging_write_guest_entry(v, va, req.val, mfn);
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 2149b8dd3808..2c403ca47ed6 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -349,6 +349,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define MMU_PT_UPDATE_PRESERVE_AD  2 /* atomically: *ptr = val | (*ptr&(A|D)) */
 #define MMU_PT_UPDATE_NO_TRANSLATE 3 /* checked '*ptr = val'. ptr is MA.      */
                                      /* val never translated.                 */
+#define MMU_PT_UPDATE_SWAP         4 /* Update and return the old value. */
 
 /*
  * MMU EXTENDED OPERATIONS
-- 
2.52.0


