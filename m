Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03812C88E41
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 20:30:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415367.1644839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lP6-0001WS-3a; Thu, 10 Sep 2026 20:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415367.1644839; Thu, 10 Sep 2026 20:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lP6-0001WL-0a; Thu, 10 Sep 2026 20:29:52 +0000
Received: by outflank-mailman (input) for mailman id 1415367;
 Thu, 10 Sep 2026 20:29:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x4lP4-0001Pg-9L
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:29:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4lP3-009Pyo-MW
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 22:29:49 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31323-8faa-0a2a0a5109dd-0a2a4503c878-20
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:49 +0200
Received: from [52.101.201.11]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa3133c-fae8-0a2a45030019-3465c90b4ef2-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:49 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV5PR03MB8433.namprd03.prod.outlook.com (2603:10b6:408:361::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:29:46 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:29:46 +0000
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
 b=ZGcAE1nabQSJCg4idVFZUBIqfvhOVsBKkt0mw2dbi2VGzFpLVrgjY8IN04qL2nMNpYBEBYM1zk6QCRu+ALO0/lNa/HGoBCyAkDOhLTg2KqW7qPum+CjyP6mQn/lNIn7tKpY0E9zcXi0Mjxx3xhEWyMZcGpkPZAD6LVsZZsluJYm8pA6oc2aVT+fDZfQeFXgutvQue78qObY54QDT7RQmVE94AywxxwU4urtUB5OKgU5hPvDattT8iA9fCRplnWHOUZi/wJPguVFV0t9jLN9NiPDBUalfBvGk4tvKFcoWHY0kY1ZZDz4vZCwd4cKFYBcX3OOrvpYOFdv2WH1tMriZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeS3HADGVZC3svsA8mdXVt6dTdJRoxy4Cwr2pNlCGck=;
 b=o0KJ6fyFiK48aM+1qxqdJq1lEQeWHgRpRa7iIyn27owuQDyM+DWZuVe6m09Y3x1EYdFtvSkjvIrX8+QnlSWulIEn3ETnJ3ohn8uPfEirorCFiemYGgSAGNjr7KpbnNtRtlaaBvPoC3wgZG7Tyb4dB1NTSD+AL1+yyS2V2yE5QMdqEMbFCI/5G9tm2Ti9Z2LtkHYlY6/oMbzEOrCErU69tmK/n+7gM3iNkchlf0ZAfvQLitVpTPpoV69JtEg9T1eKl90E9M5eg7NbitJWdT8Z6C1LfCkBMA7/h6q0yW+rAtA4NLAm3W4MTfTpJ9kPCi3zWmvWYLC7aWA47DrAAY7k9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeS3HADGVZC3svsA8mdXVt6dTdJRoxy4Cwr2pNlCGck=;
 b=jb2z7wj0uVY1/kjVNoTMBdpCi9eUD/r/x9xGxLHYcBxlojivxh1Lj9IZAFCE7uaDcF9ub1Ls9AAe0Hf2G2UC3QhwHN4h2zm+QNzEJ9cZrrb8e9ySax1lolElCCOdoul2utxgzg0ZwnMEzeydICEn2RKK1GutxdVxt+1dK1s/9Cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v2 5/7] x86: extend do_mmu_update() to support returning the old PTE value
Date: Thu, 10 Sep 2026 21:31:11 +0100
Message-ID: <20260910203113.462943-6-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260910203113.462943-1-kevin.lampis@citrix.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0655.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::9) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV5PR03MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: f128ecf8-1af3-4b02-0d5f-08df0f7a4127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9rtd7mQ58Mm7HtpktbYPOnO4l1wrB8GdjEZhnD0xRoTMvgYwYxQhofPLVSN3Kqw/mWU1OoVjAipVOXNsgtsEXTZZXAnloVNX9lzL3nrbcyHDiKxtVEMmzNn0PBpTtL7CN6PBLQCvBaMeyD0+cUqak78xD6N2T4BfGzapjqsHjxKq5uKjUIqvDCJPeIXDeH61GmGa3LIaWQwHquQhtvLX7QNlePtXm2Cx1ZDyPxj6U/3rOMzokYHkTo2XnfToPTADZaTg4ISStFfLuuLGM9Ct/A9d32eBhyzvGePtjOd0zkZ3CTCYV1ihuz2k2/vPuNf+Q80ee0ko51Ob6TsvA23N/RsbCTYu2dvqMRi2WTYEoYoBxdrjNzTXKJ0mohsLdpuieThrllx+MvlhsExdpf/96qYB/YDn42R6sPl0yZSJ5hPLa0W1i+X8eXlfX+ywNA7MOKIVd+aYZ5e1gv5/xPBUo0Owbr0ARswXrh1lGmHJ/XjJ4c/GuYhKgARns2OtJXAG9TWc6WdUxb/Z4rFyd032tMoCO2l4Zvn1xwEIElWn/jQlXz85Hg33pDLhWgqr27J8QWi9OwmpHJG3jv/6sNggUt2mZ4CM4egqQXwoeV0cUg067OgKIZdsKsKfn6I2miG3fs6YlZhozq31K2HXFQczwQvczBjaq5fos5pOe8s+nww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FH8xrQVK5qNUHJOxjjbZViifiWaH1ocEo1SMdAOqSfxEXCu91E8l3ELhHoSC?=
 =?us-ascii?Q?S/0D3k6oOqgQOselEfnVkBbcrzK7rtsIZdImRsO/XVn/RT1OioZeGAgyf4VF?=
 =?us-ascii?Q?wt1sA0ka9qZGKjwv4jiUxkchHb5eRdehOe43SafRXvaopcQB+ytgwgLGXYL+?=
 =?us-ascii?Q?vqxKDwShIfQYQaQDWq6Xh201dt/oprojR5TxZPGAJ7XE8gXRHilprUjqgesk?=
 =?us-ascii?Q?WpApRc0WjU8vHNbnT01Lek/ABqkEU484/38IQXolC25UEt4bItXbyFmSeqBO?=
 =?us-ascii?Q?l29FsPdmhfwd9Q66S9jw2Qowo/zE7cJ7ipQmxF+75gtXGCxXx55VolDkr1vI?=
 =?us-ascii?Q?ut52htYZH2Yc+rx/nW/YCfhUZMT5bnfR6F3D1a15ljORah2IlGPWNc6IiUNF?=
 =?us-ascii?Q?PkLO+dS+75EyCAN3MADHZc9gX0VGMhOxVRGI2TJVbe9snDfynXYmLbHF/7Tz?=
 =?us-ascii?Q?ugxM3bemZlsLJTnOkac9XdBzVSKYInuFAzrIgjj6FpxrhxNAc53V7udOl2xw?=
 =?us-ascii?Q?fav50RuhKSztYdt5HdibPxTrvEsyFb2QaMd3DfhsoBeeOUh2xdAuEjX0kCdg?=
 =?us-ascii?Q?Gn5GYhq9ZaVc66iPOgthXLhdmMZmfDwvkVcS6RdUP5HW/sIARDlYjlS5Xu8X?=
 =?us-ascii?Q?J6vriapIDpX0se9UWuJksA5RsFYxRqm/NWy+aQiKrF7VQ92G8DafgsaQAsBK?=
 =?us-ascii?Q?1E0kwl2w5WoA3IvYVExnmiVoMx94SWWJ6kRp4MsyuYE3osYw65XpKO49BiLZ?=
 =?us-ascii?Q?5hQpPecMSJqEi0UsCN76NiMDqWFXEelHzMRKN63lkSfL4deqYZB5F5MJX20a?=
 =?us-ascii?Q?oX78gPu/gbViajrgvYCxv5QxCO+3Rbqz9PALHLCGjDHTx6mhxEJ3kZ5kjNUZ?=
 =?us-ascii?Q?qm9Qf6KE4Vv5FQNjtpbd6zL1qbd9asqnoDJQK4jR1zv3bS1GBZDjdXyq3t6Z?=
 =?us-ascii?Q?nux/DD/Nwvt822zCmy6TRr4/ARF3qNYDSJjpj6zvszcuKE+cpq1m1ix1pvMK?=
 =?us-ascii?Q?gdFuebhpKtOnDQwJv7kBlFjg9tSP6eJo7z3uszRJhKPOg6nzOnKKbD8aprrW?=
 =?us-ascii?Q?SHd6OGjRdZNkNJoj24dw+DUgLEd8+GTAzDgTNJb68Hk1xER5di2GhTHGJfDJ?=
 =?us-ascii?Q?mgbrHpGyez7vVKkg4CyYy9QbIuMBXBykYi5lsjYzX2J2FiUwg3IV+1D6zsav?=
 =?us-ascii?Q?ncox5MyadWrIEvgdGHyfLHBAa4An8tOkSq6u+OIzSkHjCv9LxSfU+j/2MijZ?=
 =?us-ascii?Q?SBYIT6KuK1tJv4o+MbVK+9floEaxbRsUneqJBVJjtdivUp+iDkbkavfv5gyY?=
 =?us-ascii?Q?LsGX6TlQ6bHVrZjjQBbXVRvF7QdGxV3v920biWAnCQ5W1FuWG3uyQX1M+UCp?=
 =?us-ascii?Q?c/qv2VdLMJTwj5h9E0MIYqiz+mkOkpgbNxNshpGXXl2/sjVmt4mlPo3PHa0l?=
 =?us-ascii?Q?4M5XM8UdCqpyXTw6EgtOhvPUG9VaK9e2TH1nHu8HCEPuTZXd4efaEKijHR6o?=
 =?us-ascii?Q?wMAxeZoCEG47wOOAfG+HvP+bfmjl/KCeSPEVBxmoxTkEx65imGxt+LsNUzts?=
 =?us-ascii?Q?Qbg+EYQfVAwFHJw1pftt/1hfciVezv79gEf2vsgGjQhN5ORC0CVCXpqrefAj?=
 =?us-ascii?Q?DUsBXgghPFSP6V8dAkyr5iGedFllKUokX8imylo+7Rdr2em2a2gtEqZ71ARI?=
 =?us-ascii?Q?/LQXlBsDp1lYlM6Z9G3ldOXp4pja7xdfbjiGi6lgMKeArWbKBxLCnEW1qdKN?=
 =?us-ascii?Q?IT5qnadxaw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f128ecf8-1af3-4b02-0d5f-08df0f7a4127
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:29:46.4242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igLld+7+vgiDunaj5Xte6bHEce/qNZUJKH3ZJEAkChH0VIRbaNzVIsR7hJwmXpGOdD7u2a+oFCAPFsyxQW4Jgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8433
X-purgate-ID: tlsNG-33051d/1789072189-758824E9-068030D2/0/0
X-purgate-type: clean
X-purgate-size: 6168

A new sub-op MMU_PT_UPDATE_SWAP when used will do an atomic swap to set
the new value and return the old PTE value through the req.val field.

- The new PTE value in req.val must be 0, at the moment this is intended
  for clearing only.

- Only l1 PTEs are supported because they are the most frequent and have the
  biggest performance impact.

- The old PTE value is passed back to the guest through the req.val field

If MMU_PT_UPDATE_SWAP is not set then the old behavior is preserved
  do_mmu_update -> mod_l1_entry -> UPDATE_ENTRY -> paging_write_guest_entry

The new MMU_PT_UPDATE_SWAP call chain looks like this
  do_mmu_update -> mod_l1_entry -> UPDATE_ENTRY -> paging_cmpxchg_guest_entry

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Add a sub-op to mmu_update instead of new hypercall
- Rename to "swap" instead of "clear", although only `0` is accepted
- Remove spurious curly brace from `case PGT_l1_page_table:`
- Restructure `case PGT_l1_page_table:` to avoid diff churn
- Add missing `MMU_PT_UPDATE_SWAP` check for the second
  `PGT_writable_page` block

(Jan) I decided not to remove the `rc = -EINVAL` lines. Even though `rc`
already has this value I think it's more readable like this. Let me know
if I misunderstood the issue.
---
 xen/arch/x86/mm.c        | 48 +++++++++++++++++++++++++++++++++++++++-
 xen/include/public/xen.h |  1 +
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 59ad5ce16486..b498a8460935 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4055,6 +4055,7 @@ long do_mmu_update(
         case MMU_NORMAL_PT_UPDATE:
         case MMU_PT_UPDATE_PRESERVE_AD:
         case MMU_PT_UPDATE_NO_TRANSLATE:
+        case MMU_PT_UPDATE_SWAP:
         {
             p2m_type_t p2mt;
 
@@ -4118,6 +4119,30 @@ long do_mmu_update(
                 switch ( page->u.inuse.type_info & PGT_type_mask )
                 {
                 case PGT_l1_page_table:
+                    if ( cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        l1_pgentry_t ol1e;
+
+                        if ( unlikely(req.val != 0) )
+                        {
+                            rc = -EINVAL;
+                            break;
+                        }
+
+                        update_flags |= PTE_UPDATE_SWAP;
+
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
@@ -4125,6 +4150,11 @@ long do_mmu_update(
                 case PGT_l2_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+                    if ( unlikely(cmd == MMU_PT_UPDATE_SWAP) )
+                    {
+                        rc = -EINVAL;
+                        break;
+                    }
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
                                       update_flags, v);
                     if ( !rc )
@@ -4134,6 +4164,11 @@ long do_mmu_update(
                 case PGT_l3_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+                    if ( unlikely(cmd == MMU_PT_UPDATE_SWAP) )
+                    {
+                        rc = -EINVAL;
+                        break;
+                    }
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
                                       update_flags, v);
                     if ( !rc )
@@ -4143,6 +4178,11 @@ long do_mmu_update(
                 case PGT_l4_page_table:
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+                    if ( unlikely(cmd == MMU_PT_UPDATE_SWAP) )
+                    {
+                        rc = -EINVAL;
+                        break;
+                    }
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
                                       update_flags, v);
                     if ( !rc )
@@ -4172,6 +4212,11 @@ long do_mmu_update(
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
@@ -4181,7 +4226,8 @@ long do_mmu_update(
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
index 2149b8dd3808..559190688a1e 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -349,6 +349,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define MMU_PT_UPDATE_PRESERVE_AD  2 /* atomically: *ptr = val | (*ptr&(A|D)) */
 #define MMU_PT_UPDATE_NO_TRANSLATE 3 /* checked '*ptr = val'. ptr is MA.      */
                                      /* val never translated.                 */
+#define MMU_PT_UPDATE_SWAP         4
 
 /*
  * MMU EXTENDED OPERATIONS
-- 
2.52.0


