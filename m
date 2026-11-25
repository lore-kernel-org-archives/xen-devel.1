Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94D8606A321
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 18:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=F2QHmAn0
Received: from list by lists.xenproject.org with outflank-mailman.1502755.1698720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWI5o-0003gv-VZ; Wed, 25 Nov 2026 18:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502755.1698720; Wed, 25 Nov 2026 18:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWI5o-0003go-SF; Wed, 25 Nov 2026 18:51:44 +0000
Received: by outflank-mailman (input) for mailman id 1502755;
 Wed, 25 Nov 2026 18:51:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xWI5m-0003fo-Uq
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 18:51:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWI5m-007zhd-BF
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 19:51:42 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6b072e39-e002-0a2a0a5209dd-0a2a4506eaae-6
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 19:51:42 +0100
Received: from [52.101.56.55]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6b072e3c-195a-0a2a45060019-34653837caa1-4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 19:51:42 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by BY5PR03MB4920.namprd03.prod.outlook.com (2603:10b6:a03:1f0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 18:51:39 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 18:51:39 +0000
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
 b=vVGJn+R0FHpq8fYrKB/6UdGexruFhOODz66kmR7D+/zZu6oGL03QUQOEE2Prk+H77sYOg1eeYIjfXjXBQ349bP7Sc4Lxmd2tJH61kE65nOOnmn3OPwx5CUQV4Wm/juVRWB5SprHCzvpVgfGQdbl3u8FSjrZmOt2T3OFNskzVc4QRkB8wEDbCL5e6MfUGvlfmsDGQA3GI3OXZfegF6d8wL9jsNW3wJD7YXnYjVnhIZMbzxHuHvi161WOqVRZhskenkFu0El6bG61cTPJtDPGlFlmWagniQpzFev5MDpVYo3KBXBXMpPJWxu+gixThrlJC8ETr8i+KZVrUNNW5LJuuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEqnhU0V7eIjvvWbwGpgYUwZ0S2ukNZigkKhxiABApE=;
 b=AiMzGbm0rjPwc3+IlAhtwrBsVbH3gV2HhmPEC61gxEAQQX5L/aTgVKauJEY//E0ahexeqL2D+nzydW/rDVbkaOWDzwZGiMUxBgx0/mZc6w/Gk0g3Pt0oofG9XEi4nUZmixoSrWGjyWxjndXbKWZgopYt//rU3e3iJfBalbLCyCh5FqJqnnk/WdJMMKq9F9RtclywdpqoDeT3bYCHfbLiRvWzRBPNXZc+61fTa1yTQNthH/0eosLOUTnNjrpCpB+ygirX6Rqg+9BLl353QsAe1Py4/4orxsnEX7zEwVbcTcImsDxOWArEPMIPHiEwChGKn1bzD8sVjNNrAd/y4dn/ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEqnhU0V7eIjvvWbwGpgYUwZ0S2ukNZigkKhxiABApE=;
 b=F2QHmAn0ARPqijgMc2v/VuHx73z8TVyeqDycExEWWzhemm0W8fAbawcfRD7wJBPy3nTYnDZHXingeBf33QpeWhM9E/HEd1qnLkwBqcQFFzNPCuGzBw4yZ8vsdZSNL2FyMkvTkmLh5X8aA2idczcaWUs/8UaClcq0Q1x/nUUW26U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v6 2/4] x86: extend do_mmu_update() to support returning the old PTE value
Date: Wed, 25 Nov 2026 18:51:18 +0000
Message-ID: <20261125185120.1766552-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261125185120.1766552-1-kevin.lampis@citrix.com>
References: <20261125185120.1766552-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::14) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|BY5PR03MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b87c21-bfad-4ffa-6f83-08df4b252383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261026140227099003|10067099003|261009223027099003|261102123227099003|11063799006|56012099006|261022075727099003|261021121427099003|261021123027099003|261026135527099003|261021135927099003|261026121527099003|261022115727099003|261022113327099003|261028144727099003|261021130227099003|261022105027099003|261021133027099003|261026130827099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2nEvx0AE39XJuZqb5hqs/ouecJKKskNI2+y4r+X3RfX+QutVNt9F0nn26vZSQYrLbpBymjkQ9SW270VWwmY92J+04HaLJv17fMgfA+N/M8Squ+fQJQ347T3MmQBtpR8FP86NOb32O4n83IoQ8/11Z6Vcy66D3kmlLifYZXZ3jTQ3xHmnjWqGFt1dlKtdxPChX7UUsl3YCp2f1sH3zneFkGX2taJLGVqUV9kTPwSytTbsiaXroJ5a86ogKVsRkFO6zQI5wm9rfihW8WvkQGf/La9z3q9pa/oDQ5L941OTXHicyYH82PDRHIJ4atfTcs9OqJAJeeX4icqoHlwyhH+rRyhSZba1x1guGY34PmAY2oTT9FTri0lH0nqq7/SJnkYyc1qc40ybCDzFuiD38KgK91Ir+1AHfsdvpns2x3fKO0kmlpjcvb473vL1wUsey9wzlrRA2GCZIuIKaiWyMpv9SzbiWHZiKCXdZNMipVXEVXFORBTx2Bd3I/OXxIa1YAmbeLIT3jfMRREWgOsqP5PZ0IxFn/2HBJpeQ75EoTv68zq6UtKHt5aSKbk7kVDx3xYljU43yOTHmxFHUcBPiv6Ssy8XoUzppR9GOq7ZKC+shYB3hAm1Htlkj4ogA4z7JyFakt4v5BKIThMj0ggGFn2JixBvtcJ6FSLyxjIsWYAQGfg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261026140227099003)(10067099003)(261009223027099003)(261102123227099003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261021123027099003)(261026135527099003)(261021135927099003)(261026121527099003)(261022115727099003)(261022113327099003)(261028144727099003)(261021130227099003)(261022105027099003)(261021133027099003)(261026130827099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nc9zhxQ6JYptVCHUQoCt8xE2lmEvR858QczQNbrd4mrO408tEW3NtAiHw+gK?=
 =?us-ascii?Q?UupzgQUsdIkdHf9iFq8o6Zu8wIeC6Ptb0ca3Wj7QfCNOXdYP0NcbP8XEOQG3?=
 =?us-ascii?Q?8baUdZsOTU6zqXya8bvsU6xl9yJTMJgueQZpDPzEszx7RxWQJiFEpSpadFvr?=
 =?us-ascii?Q?7QLPY9R7JVVdNiSCDTI5skJaNV6uk9acTXs8OmFONIrIVrwOw5oZDuwROu+5?=
 =?us-ascii?Q?orjqUnI9LzWbNsLdT3xTIxwEBKwSmH21aR+1F+kXG1kvYMrPjtunM5me3ubQ?=
 =?us-ascii?Q?SeujudtlN730d0vKAEYt4w+Yy1VdvhICJGaPDOQGo9k8k9xRlcJz44I7SJor?=
 =?us-ascii?Q?e2uOqLXsTf9O6NyIxhqDB2UF2jfF73GEQMu+4X7E3aqeREGyoQLb2VxyMm/A?=
 =?us-ascii?Q?ipXNFRvlttpE5JbKzg5XAzv8o5XA7JszFc77xCwiMUbtgByba7DUKMsdtfVG?=
 =?us-ascii?Q?R8iBZlsLp3smmx67qhS9iJcspEQKF9JyiwLTli9Nvik7Ihl8D3P9A42yWADQ?=
 =?us-ascii?Q?aGT8Iu1+4KUXSOVcRbpU62s231795pSr83ChSYWNl0koIXo/SVl24xFmjnDg?=
 =?us-ascii?Q?bNZs0ou4eoWhpZarOaMaiHgeE/MCxQ2lwtrAdOD3hiInxeHLojPDEoc7jTH5?=
 =?us-ascii?Q?76d0fj1zKe3Gf8Du1OlGZV3Gh67PepesVjAYQjgqEMMInluCPKqk1zDCTjvz?=
 =?us-ascii?Q?6EDoJoC7DP1xm6UG2KCt9Aa2JTAZ1BzYgVonGp2/N0YY+PP0o7BX0EPE8QZU?=
 =?us-ascii?Q?+qiJrBSDZSHKtRjv4XaUiVfPWLIef1tPc3mS+wBzED7QxmI4UFqO9on4AX7R?=
 =?us-ascii?Q?9Ca+KmM00j1S25jAwXBBIj2xL+OP2unxuEv97RDsFmrcQ/E2JfxQlY5tnIL7?=
 =?us-ascii?Q?4koPxv4w27NmZ/MhUrHZrnnWTTcVympZOzky7rVGpUxanXzd0X24p8wH6mIV?=
 =?us-ascii?Q?OoBya64cjSX5xNPwrw9Iz7MRfnkwctaHeoEubD0/bbeEMnBWJg/a1bPs3Dam?=
 =?us-ascii?Q?TRfn4bfJCNMzkxLVWsjKInppakRic4gjLtthpZ+ChPg8epfjwFyHhNIZVkF0?=
 =?us-ascii?Q?hEgPrPryluYjUloUeog/YWb2TvXAbqtvK9cPNbdhMT7kLClrtm+4sJP45yOK?=
 =?us-ascii?Q?EUryN/fdIVPD6iOwoMocuMjqyFari4pqYopKE2NPSvNMDE9G5qq4kipEcy5R?=
 =?us-ascii?Q?s6RDpSICPl7BQvRM2x2fqWlLQVbvs5Rd65W/gUAw4Ayo19c2MhXWkh7pyFpg?=
 =?us-ascii?Q?xDeBguT0Ga5wS1r2BkydMNkwqv8NHHwieTrTvJ3Fv30EpAXZrAun9uN39lYg?=
 =?us-ascii?Q?XNiZuC0Roj+/3IQsgYQvdXdAS5S/ZGLVSykXVx5i6/x4fzT8VC3hLSoK8M/U?=
 =?us-ascii?Q?fph25KWPH4uBD5oSIJVlPmFEAmdqZvdFUm+qmVQbliVULTjAJakmDeRuLX4e?=
 =?us-ascii?Q?/QJjTUJCZcKcHooKm3L77JkRzjh2WU1/ggiSTyTT0Os8SsXdEBzriQir/dW2?=
 =?us-ascii?Q?JSctYikVdEhLjkEyijpkqKkQ9poAOewYEXBV0eg+n6bi8Q4m/F/u3DcBijke?=
 =?us-ascii?Q?hs/znuzOV9g3dOO5XnKD4fFgo7OL9Pza9MLHemx5byo5hGPOHvKiRiXX5+JV?=
 =?us-ascii?Q?7o1krmpieIekVzptG2u43PYtprTCP7OK9JiFOXkvU7Ew+gx4EcelsBUpAWyv?=
 =?us-ascii?Q?HOp0IL32Qt+qkgQH/lrfuMdBXZ4z+LVM9Tu+kVfyqc0+GtXQVSHT8AZ24RSZ?=
 =?us-ascii?Q?QFXQImIwnw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b87c21-bfad-4ffa-6f83-08df4b252383
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:51:39.3462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiL7VqdgZyxmNawOLdX8R9OryqtlUv8AdscjL21SchD9MZe5PQg55yB/T/+SywocYhT3JthGDPq0LmjoOZ/vUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4920
X-purgate-ID: tlsNG-16d1c6/1795632702-F74C977B-B9B6DA8A/0/0
X-purgate-type: clean
X-purgate-size: 8645
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A new sub-op MMU_PT_UPDATE_SWAP when used will do an atomic swap to set
the new value and return the old PTE value through the req.val field.

- The old PTE value is passed back to the guest through the req.val field

If MMU_PT_UPDATE_SWAP is not set then the old behavior is preserved
  do_mmu_update -> mod_l*_entry -> UPDATE_ENTRY -> paging_write_guest_entry

The new MMU_PT_UPDATE_SWAP call chain looks like this
  do_mmu_update -> mod_l*_entry -> UPDATE_ENTRY -> paging_cmpxchg_guest_entry

New feature flag XENFEAT_mmu_pt_update_swap.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v6:
- Use l1e_get_intpte instead of accessing fields directly
- copy_field_to_guest once at the end of the switch
  This removes duplication but keeps type safetly
- I didn't go all the way with passing &req.val through as uint64_t
  I hope this is an acceptable compromise between type safety and
  de-duplication.
- Blank lines between declarations and statements

Changes in v5:
- Add braces to the case statements
- Move copy_to_guest to the end so it doesn't interfere
  with things like flush_linear_pt
- Use copy_field_to_guest instead of copy_to_guest
- Use the raw form of __copy_field_to_guest because
  bounds have already been checked
- Folded x86: New feature flag XENFEAT_mmu_pt_update_swap patch
  into this one

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
 xen/arch/x86/mm.c             | 58 +++++++++++++++++++++++++++++------
 xen/common/kernel.c           |  1 +
 xen/include/public/features.h |  3 ++
 xen/include/public/xen.h      |  1 +
 4 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 7ee71e5cc61d..f6af6e531475 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4105,6 +4105,7 @@ long do_mmu_update(
         case MMU_NORMAL_PT_UPDATE:
         case MMU_PT_UPDATE_PRESERVE_AD:
         case MMU_PT_UPDATE_NO_TRANSLATE:
+        case MMU_PT_UPDATE_SWAP:
         {
             p2m_type_t p2mt;
 
@@ -4161,42 +4162,66 @@ long do_mmu_update(
             if ( page_lock(page) )
             {
                 unsigned int update_flags = 0;
+                intpte_t old_pte = 0;
 
                 if ( cmd == MMU_PT_UPDATE_PRESERVE_AD )
                      update_flags = PTE_UPDATE_PRESERVE_AD;
                 else if ( cmd == MMU_PT_UPDATE_NO_TRANSLATE )
                      update_flags = PTE_UPDATE_NO_TRANSLATE;
+                else if ( cmd == MMU_PT_UPDATE_SWAP )
+                     update_flags = PTE_UPDATE_SWAP;
 
                 switch ( page->u.inuse.type_info & PGT_type_mask )
                 {
                 case PGT_l1_page_table:
+                {
+                    l1_pgentry_t ol1e = {};
+
                     rc = mod_l1_entry(va, l1e_from_intpte(req.val), mfn,
-                                      update_flags, v, pg_owner, NULL);
+                                      update_flags, v, pg_owner, &ol1e);
+                    old_pte = l1e_get_intpte(ol1e);
                     break;
-
+                }
                 case PGT_l2_page_table:
+                {
+                    l2_pgentry_t ol2e = {};
+
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+
                     rc = mod_l2_entry(va, l2e_from_intpte(req.val), mfn,
-                                      update_flags, v, NULL);
+                                      update_flags, v, &ol2e);
+
                     if ( !rc )
                         flush_linear_pt = true;
+                    old_pte = l2e_get_intpte(ol2e);
                     break;
-
+                }
                 case PGT_l3_page_table:
+                {
+                    l3_pgentry_t ol3e = {};
+
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+
                     rc = mod_l3_entry(va, l3e_from_intpte(req.val), mfn,
-                                      update_flags, v, NULL);
+                                      update_flags, v, &ol3e);
+
                     if ( !rc )
                         flush_linear_pt = true;
+                    old_pte = l3e_get_intpte(ol3e);
                     break;
-
+                }
                 case PGT_l4_page_table:
+                {
+                    l4_pgentry_t ol4e = {};
+
                     if ( unlikely(pg_owner != pt_owner) )
                         break;
+
                     rc = mod_l4_entry(va, l4e_from_intpte(req.val), mfn,
-                                      update_flags, v, NULL);
+                                      update_flags, v, &ol4e);
+
                     if ( !rc )
                         flush_linear_pt = true;
                     if ( !rc && pt_owner->arch.pv.xpti )
@@ -4221,19 +4246,34 @@ long do_mmu_update(
                                      mfn) + local_in_use) )
                             flush_root_pt_others = true;
                     }
+                    old_pte = l4e_get_intpte(ol4e);
                     break;
-
+                }
                 case PGT_writable_page:
+                    if ( unlikely(cmd == MMU_PT_UPDATE_SWAP) )
+                    {
+                        rc = -EINVAL;
+                        break;
+                    }
                     perfc_incr(writable_mmu_updates);
                     paging_write_guest_entry(v, va, req.val, mfn);
                     rc = 0;
                     break;
                 }
                 page_unlock(page);
+
+                if ( !rc && cmd == MMU_PT_UPDATE_SWAP )
+                {
+                    req.val = old_pte;
+                    if ( unlikely(copy_field_to_guest(ureqs, &req, val)) )
+                        rc = -EFAULT;
+                }
+
                 if ( rc == -EINTR )
                     rc = -ERESTART;
             }
-            else if ( get_page_type(page, PGT_writable_page) )
+            else if ( likely(cmd != MMU_PT_UPDATE_SWAP) &&
+                      get_page_type(page, PGT_writable_page) )
             {
                 perfc_incr(writable_mmu_updates);
                 paging_write_guest_entry(v, va, req.val, mfn);
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 499023fae6fd..dc3cd9c3321b 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -690,6 +690,7 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             if ( is_pv_domain(d) )
             {
                 fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
+                             (1U << XENFEAT_mmu_pt_update_swap) |
                              (1U << XENFEAT_highmem_assist) |
                              (1U << XENFEAT_gnttab_map_avail_bits);
                 if ( IS_ENABLED(CONFIG_PV32) && VM_ASSIST(d, pae_extended_cr3) )
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 880193094713..227f1e408e41 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -128,6 +128,9 @@
  */
 #define XENFEAT_dm_msix_all_writes        20
 
+/* x86: Does this Xen host support the MMU_PT_UPDATE_SWAP hypercall? */
+#define XENFEAT_mmu_pt_update_swap        21
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
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


