Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045D1CCA490
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 16:46:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452426.1667250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHl4U-0005WR-Ig; Fri, 16 Oct 2026 16:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452426.1667250; Fri, 16 Oct 2026 16:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHl4U-0005Ug-CX; Fri, 16 Oct 2026 16:46:18 +0000
Received: by outflank-mailman (input) for mailman id 1452426;
 Fri, 16 Oct 2026 16:46:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xHl4T-0005Ey-58
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:46:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHl4S-003Wv8-ID
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 18:46:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6ad254cb-8faa-0a2a0a5109dd-0a2a4506ca44-14
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:46:15 +0200
Received: from [52.101.61.50]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6ad254d3-195a-0a2a45060019-34653d323dda-6
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:46:15 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SN4PR03MB989476.namprd03.prod.outlook.com (2603:10b6:806:219::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 16:46:12 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0522.016; Fri, 16 Oct 2026
 16:46:12 +0000
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
 b=YNQNZocNUBFzmhYJrFPpeqWZPIpRXTIUiw6FBJkslOrTvI5+zYvEGB1mbubjqHxDTxGvzovX/6QqHIScwQgV18w+jgZXWjlyEItRMmBpA5VaNlItU6v3en1qFIpgDVcR8pcAW7hsQBP0BIa5sER7g8BlgzP/jL/+Symld/jPDdep/MTurVDawOQR2Pjp2xAhSwvkf0bM0UwgxQObJwjh734gr86lrW5RAtVTI8prsIRQU4OpugD8viCV0lPffZM9XUWVe9eOj/GBvQnulYVLodbAq234sB8x0xzcvfR8cm37UPZ4uQZS6ESa5OI89Lk4hzmqmkz62c3CYPMEVV9dKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mavEMVvcnQN/IdyCOyIwkBgy1KJC7/e6Fk3Q8+9/VY=;
 b=hZj8Lgfhrh0QqTgDwu482Y02gCqauvF3e1cZqeMkdSJ5D1IsR81MbuRT4whD4GXSUd0UfX5PhfGOgWrOBP9jpr2KjvyRFjNUcI9g0gL8DfXi1W+SXlNrCxF9er2oGAZSNjaYRXHkFp6fZ1mjIna3WWyN45Fdj5HwBUjfx18ubR6ueOEiRDNw6WkZa5co4YjTRwdi75Cwdu3Qp76PAcfpRkJhAbff8yyWBf6EiDjKQIAeqYLiMCVn4GSuwXiEq8koEUhGqS3ogeSgglotfweRBDW1uU6qoHw4J0f/LPWDmGfvIMrbEtoxmdzPCajX4+mQiYvBy0f/Eg9lEy3jCZEK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mavEMVvcnQN/IdyCOyIwkBgy1KJC7/e6Fk3Q8+9/VY=;
 b=jp1SAczfYJQGEo58bjnMCBVvYJxMFgjNryhZWd7gHCtjONFt6M2caOcota9sk8Yl/H1JuQxp73ES0/sWiM8iK8xxPfGz+ICBPw79wg3dIHqxoXW5QqZk5Adanw4BpavNrfD4fFwgb87vRPNR3+AYz0/VvhGlqousakuTRL7rZLo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v4 3/5] x86: extend do_mmu_update() to support returning the old PTE value
Date: Fri, 16 Oct 2026 17:48:13 +0100
Message-ID: <20261016164815.3109065-4-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261016164815.3109065-1-kevin.lampis@citrix.com>
References: <20261016164815.3109065-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0430.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::21) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SN4PR03MB989476:EE_
X-MS-Office365-Filtering-Correlation-Id: c65a21fd-69d5-4c6e-588e-08df2ba4fcca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pIKiSgPFJX/KMFhV/znkzKLN2hnQ7/mM3vMR1lx9K2XHdrBkREE9SSgzKHf0vsV45M6uwuuHWPHAKMtC/mpmT8lK0mUmx0mnJIk5FdA30c1tQ+GiO1gcJQJuFOiBhy7POD+AqAfjK4RxqiVP0MNDFP2WdplIQS+/0gNJPc12B6Y/9z+FZshh2AN8d3k+mCOqvMLYY03jGV4KOz6UYWkJQRZxTmpzKX1Je7kGE6OT7ZQ13yAGgL/kHedmYF+TlEUzG3n5yZjiIeyYN9GlB6WkVmJ9Ac//68m57oY5NfVTKZWv4MauBfpRB9YjZED54LEPGAbtimVz4ANICqpStRWcsR4hRo8QjIcCV/qyi8wf1RplfmuhjFVRQbJrOg94LEYcyf5QSRVFO7h2XNTgzb4APC0nI9sYB7arlSpUL/Kl522ojcxLrgVDxFgLyHpYbKbr7e4cQCjNnjtDm0tTiMcZ74AE63r/ihz9P/b6vKWOQRXoOkH/R/Ut7rS1NqLqvV/FrGnyo/7XmnbNPTiTFBIUDRl75TESgwxuh1NCOSz4isDU62b7CldrJ8SRRdKLQPK2WcvOLH2hykqCgjwkiLXTsIVbxS6IkhhMwNalrI0QaHK+IJ1FhaaLoFRv5M/sgN6s1TpSwuqGDjjUueKX6JIhGTw9d4+FAe3t75/Abnmi7TM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9ZKoNtvZXFggjBulfD/e1Z/wf7Yu/b17P9x2JEV8FKge88wdcHi6T2i7GtHp?=
 =?us-ascii?Q?ij8yJPfOd0n47pRqhKrfKtbhkwaoRNaKBOFK5XmPcR4b6DNdD6n9guWZUhi5?=
 =?us-ascii?Q?30DRKw5vu23gyU8DXi2TJLGe9rxnaK7qzzU9w40S4PQ5EfMyDRWHlfQewMpw?=
 =?us-ascii?Q?UFDnL3y/3zRyfEMJkFA5kA6ESm0gsO/KvPwBUaB/Ub3WQdJdfIdHjYFXCMKn?=
 =?us-ascii?Q?SZ0H4Ppi0G4Of1A/fx9gFli6M2AeN+QyO3MH5rCL9ZO1hF0u4M4P7FDc7oEY?=
 =?us-ascii?Q?1vabVz5jOv4i7pFzUGkp69kpJeOR7beLMlmup3SYlxKf+ITJ8sMoCw97hWll?=
 =?us-ascii?Q?l5Q6u4CGGRuQFoi33DP/KmpJk9/9jfJ7pq3hXe1gigfpuzJi2+5gc/u2PUoa?=
 =?us-ascii?Q?fQlAVwvig3OybOvXDe30eLsOs8vctcK8Qmaw3vrFJY/fDSOT7GSNZEoYRmCL?=
 =?us-ascii?Q?F3wMBed1XCh96zRqatZIB1JtIqdamJan+o1FS2U3+sZTIgTLtCvWWPni7KFu?=
 =?us-ascii?Q?DqQbPtLlatbkqFWGzk1V6WuF1mW5Z47h+IGhZ1jl1ixQJiTnzyFES1SZnYPc?=
 =?us-ascii?Q?0DQsjAIw0HBx8pDcROOEjXODrdz0vUHtqIvlrGHfgi4ONB68glYZ5uBGzsUC?=
 =?us-ascii?Q?mn0rijmbPfQowSULVblgh4a7NWDVe+R0vff7CfsztqiPYfNgbHg2lzB/GxIm?=
 =?us-ascii?Q?iMimtVWvGN3xTdBf22coAu1shi9xhu34gr7Xi4+ovZ5Vq+NZuDIBMsAfVR47?=
 =?us-ascii?Q?nVUeSY4G5bl48rATsdxH6TuH8xpH5YBRxNOBIU8FMJP5UjKsQ17ci3vK+N9n?=
 =?us-ascii?Q?4RwY/8i3IMwYAdBCbAKWm4y7kB3JLYCdWiy+vbMmy1Z6GD6s0XypMIeIHb+G?=
 =?us-ascii?Q?1IsCwwIf5ggcl/IkZCUd0dIUspcLI2jm9xSsYEsFRNZKwFxi4TG/jNrtsw+r?=
 =?us-ascii?Q?ezpVFh7kgAXXIHmcy1BA/hAL0yNyziBXkCE1SEBewLsN+mXFPUFsm5KlRn5y?=
 =?us-ascii?Q?NAtH4/Lr5rf8TEZzklmRbDQuSzGpagyBEkxf6cv5pgfrX2AuyhtQCowmxuQB?=
 =?us-ascii?Q?/8Ff1wcerlRce6qc9h61Wqn/YjfS2ksBPi+/RYmGXtIAeMUcn3c7SVb0QrGF?=
 =?us-ascii?Q?bZ35k80FbTxZ112BTVijQjSVaz8RvsHL06OmVU4W/jLZPVnp1PE+cex7heoO?=
 =?us-ascii?Q?B96rjOqHvUEvFSC9A54ibNXOf8xzOWhpYKQaM5sWNNWc45k8dvBm9ia9cLX+?=
 =?us-ascii?Q?0wdlJpM8bNssXt89mssNVAdr4MmTzmRFElGYJDceuBLRNRIgNOdjmfiX5h4l?=
 =?us-ascii?Q?vq2KaKrFaHv/OycTDgzDl4Qp+/s0AEy8veDMYUZ9STgrXx7LPguhb66rNrGr?=
 =?us-ascii?Q?r+NnlTd8m79IPapedKFHFZIn9JmnRHzI2gIUL5lRukZCAZL8wLCbjUVwXjsz?=
 =?us-ascii?Q?b9JBQv6Eu2D5ven0n26DoEDR0N7XMw/snpBKBoyIT8B64cny542XsVvxyEyh?=
 =?us-ascii?Q?3SSAXhzXVCVLXHCwJkMN9UWWT70vVP7ntF7usM1/XJzBny6ZnnKqdIokPYxZ?=
 =?us-ascii?Q?GPdE4Z9sAGSR67HBjw3HBE9fTCHMoTcobprHZ+BaQhY7ncGmYvPVWClwcRGz?=
 =?us-ascii?Q?yKJmvOsim5D1yEX62YSDqxS2hptLOATrM3r4C63+vZNDYfJTCv6uVGXxpa5X?=
 =?us-ascii?Q?Ji4LKNml73YXdtRICiNh+nhpuENu7YphAohCfXrVbkLcDluARmE68ljbhdMB?=
 =?us-ascii?Q?QZGSgagvfA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65a21fd-69d5-4c6e-588e-08df2ba4fcca
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:46:12.6393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nl8mrlAF4WQEIASUXOUX0y64utX2eNRyIeE7MLFTLnbJnGY3Tvs+OOl2jqJUG44pRJ3J0SkwlE566Qo9ey2Tnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB989476
X-purgate-ID: tlsNG-16d1c6/1792169175-1FACA77B-A78B3D26/0/0
X-purgate-type: clean
X-purgate-size: 6707

A new sub-op MMU_PT_UPDATE_SWAP when used will do an atomic swap to set
the new value and return the old PTE value through the req.val field.

- The old PTE value is passed back to the guest through the req.val field

If MMU_PT_UPDATE_SWAP is not set then the old behavior is preserved
  do_mmu_update -> mod_l*_entry -> UPDATE_ENTRY -> paging_write_guest_entry

The new MMU_PT_UPDATE_SWAP call chain looks like this
  do_mmu_update -> mod_l*_entry -> UPDATE_ENTRY -> paging_cmpxchg_guest_entry

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v4:
- Refactor how mod_l*_entry() is used
  Checking `if (!rc)` multiple times in a row is inelegant but reduces
  the diff size. Let me know if that's not the right tradeoff here.

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
 xen/arch/x86/mm.c        | 60 ++++++++++++++++++++++++++++++++++++----
 xen/include/public/xen.h |  1 +
 2 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 609c8595a487..ab09e0703da4 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4151,6 +4151,7 @@ long do_mmu_update(
         case MMU_NORMAL_PT_UPDATE:
         case MMU_PT_UPDATE_PRESERVE_AD:
         case MMU_PT_UPDATE_NO_TRANSLATE:
+        case MMU_PT_UPDATE_SWAP:
         {
             p2m_type_t p2mt;
 
@@ -4212,37 +4213,80 @@ long do_mmu_update(
                      update_flags = PTE_UPDATE_PRESERVE_AD;
                 else if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
                      update_flags = PTE_UPDATE_NO_TRANSLATE;
+                else if ( cmd == MMU_PT_UPDATE_SWAP )
+                     update_flags = PTE_UPDATE_SWAP;
 
                 switch ( page->u.inuse.type_info & PGT_type_mask )
                 {
                 case PGT_l1_page_table:
+                    l1_pgentry_t ol1e = {};
                     rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
-                                      update_flags, v, pg_owner, NULL);
+                                      update_flags, v, pg_owner, &ol1e);
+
+                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        req.val = ol1e.l1;
+                        if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
+                            rc = -EFAULT;
+                    }
                     break;
 
                 case PGT_l2_page_table:
+                    l2_pgentry_t ol2e = {};
+
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
-                                      update_flags, v, NULL);
+                                      update_flags, v, &ol2e);
+
+                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        req.val = ol2e.l2;
+                        if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
+                            rc = -EFAULT;
+                    }
+
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
 
                 case PGT_l3_page_table:
+                    l3_pgentry_t ol3e = {};
+
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
-                                      update_flags, v, NULL);
+                                      update_flags, v, &ol3e);
+
+                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        req.val = ol3e.l3;
+                        if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
+                            rc = -EFAULT;
+                    }
+
                     if ( !rc )
                         flush_linear_pt = true;
                     break;
 
                 case PGT_l4_page_table:
+                    l4_pgentry_t ol4e = {};
+
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
-                                      update_flags, v, NULL);
+                                      update_flags, v, &ol4e);
+
+                    if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
+                    {
+                        req.val = ol4e.l4;
+                        if ( unlikely(copy_to_guest(ureqs, &req, 1)) )
+                            rc = -EFAULT;
+                    }
+
                     if ( !rc )
                         flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
@@ -4270,6 +4314,11 @@ long do_mmu_update(
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
@@ -4279,7 +4328,8 @@ long do_mmu_update(
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


