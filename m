Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3C606C559
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=M1/wbdn3
Received: from list by lists.xenproject.org with outflank-mailman.1488054.1690324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtkB-0008I8-Lb; Fri, 13 Nov 2026 16:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488054.1690324; Fri, 13 Nov 2026 16:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtkB-0008I1-IH; Fri, 13 Nov 2026 16:03:15 +0000
Received: by outflank-mailman (input) for mailman id 1488054;
 Fri, 13 Nov 2026 16:03:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xRtkA-0008Hv-9l
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:03:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtk9-00Gs6a-EI
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 17:03:13 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af734ae-e002-0a2a0a5209dd-0a2a4509c748-38
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 17:03:13 +0100
Received: from [52.101.201.60]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af734ab-be1a-0a2a45090019-3465c93c725b-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 17:02:55 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BN8PR03MB5012.namprd03.prod.outlook.com (2603:10b6:408:dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 16:02:47 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 16:02:47 +0000
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
 b=w8BLuHOOrZXkeO1QXIFR7PfPvuH2QawlhPq1+K/QnDfl/BFReN6k/yQZrawwT+IufSbbbCbiXnTz08abahGrP5pkKZfUqUDPnY+hr6Qt1oQKCP1pUXgd7/7JOoJgs7pm9Q3fURlWsQzIov4JY+cfjSn8PQ92nldy2ldpvNjezHK64jVhjIqVbF9EvjckRAyp4TB7z1BU0SeoiAohCjwkjX+z+le2Sy5Y8zMhwG96DtkYD6XTQllzU1qemauYvuBO/k/rcMZ8rHIc9boGzcf8057SohZfvjyZ2SOWBh9ht37dm55i7fchYA37bJfZ08QZmX42D4ydgVJjs8pfwbu4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WEGX3dxr11L8I+8jU/dkpXhCeQM7QLbWd2A7YuVelY=;
 b=Zv5tSXX2zGBm2RUbCz81B11Pk3f0hSk/PHq+S9DPnMurodn8ESr6JRp+3l2ZckbmYJocgJKzObH4anZpbFNxCJzvcLanVtupSSXawDtXl4hgRrOopvlCuSXS4JBV3biT/c1hAEL2OgLadorptEAJi5MRynp0a01YfAheqfaGPKtd3yyIV5Vjn36XjBgCEK8Oo1EgIViDel3G8WdOwVEyS14BxFPTUhsybYwTngNRYkt3EBvBR9cTn+4+LOtoJ6wXuKYnzIX+r+4TsAnX4L93T2t6ndNRqMzJlOuSOEaa0FIDS2oZI3OFOuhLHXV/lVj1vCZvxdm1VI1kPvkxhuoO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WEGX3dxr11L8I+8jU/dkpXhCeQM7QLbWd2A7YuVelY=;
 b=M1/wbdn34Y03VZOYy6SFHqCiA+hEg3OMRmtGyEtKk2BI56VmfoMF5ga0V3p/9L8zzMVLWxUCJf295zUO6IsMOezkXcMyKSg7tGVBf62Kh+3Btoq0Cv9AtspaBeKA8wXBm7LQFA2wJVRvz9hTQv8uctIxoncvs6nRjLQwr2hn80M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] nestedsvm: Ignore attempts to clear EFER.SVME from L2
Date: Fri, 13 Nov 2026 16:02:42 +0000
Message-ID: <20261113160242.695800-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36c::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BN8PR03MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e87d4db-985e-4065-47d4-08df419f8f99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|261021123027099003|261028144727099003|261009223027099003|261026140227099003|261021121427099003|261026121527099003|261102123227099003|261022105027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zj8wMOAmyv3Zy1BqKydLNx7s7J5GoXpQNXhbzmoJwGRBi2GWEU/ZXqomnMaKEv4SkbAXkDGp6I+TS6CJc751wE40jr6gzRpkxU9t1tKuHyyoDv4ekMYApPsuDtbqUWG3nX1l3xM5kw2f5A8qq8EGdnYiWZayv7YZct0UQLb70nJNiNHMeHfiEafUfdfM9nZZpW4KIRBeE/ZXr40fcsTvJk8UgtQsEYu171Y736lDaGc3GNcq+76P4CyI+B4uFvEYG/W7jzAPN+VdDmeybkFMc/8pCF0l9KexirQTzWdAyMbBFhTy+Bnk0tOMJXOaaont4UxQc++mrRi8mHRZd/gGCTOSIBCHUuIuvov1FBXgGW34PGjzKcAV31YRP+8R/EhDYIHTfqjciGO8HKIW5GGXSK9JCt93sUeeJoYm0zkmStsAdVM0UOaCknAcQwYVQN7MJNOCsaNDjhbA6BZW05nY+VnKNOQ1dZpbdq1PrQWKHt+7jSlhogcBJ7dPOYbAk2iubdbD6gG1rDX2s1qUFnnEU4UTTVgxOav1QXmw5Fo3YcWPuoDEvxxczJwyS6cggWdkmhBL5xbIhsTlMtiJH4JPm5vfvcyRiTDMxlHjrkAzhxUzRkBu/LtbYhKWmQbodl7NAHVldY+7LMQOezaw0IZBGfiBOOYtHDJzL03Si9khDjg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261028144727099003)(261009223027099003)(261026140227099003)(261021121427099003)(261026121527099003)(261102123227099003)(261022105027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9AlwC79FqldMvXEZqINIzYfKtvCQv5YKULBDlfXdApILk6ygNj5Dj/+CC85q?=
 =?us-ascii?Q?+ht3wCX2DUI049KKDyolS/WQ65Cj2zj253v/QsSXgKvNrZk12OH5HVjUD3Id?=
 =?us-ascii?Q?YgwYo5bJjFbPPCDMg2QlZc9jDXNlZPXtlDDS3N1aoHKC2wAoDJCF43f/Z/kR?=
 =?us-ascii?Q?cEDcQLNhpDkRLl2KBPz55+3K1s4J3JmZCuN7JUVXPD6Rk98YOo5H3Hn0sqkA?=
 =?us-ascii?Q?FhcPNsti+4OOYzZWhWuyWbEfh1Qpp0N+gU8G61qtjADOxM6DcfK8PWBvKJFn?=
 =?us-ascii?Q?pqWsOk6XPwQY17XpdtkR+Qdfo4C+7fQyur6nZN4WW5ItWmuvnBEwzF7ukFzH?=
 =?us-ascii?Q?MLYMCpUOOL9+0ea1deKnCQ37UyGXU8MwJG03wp91DYVd0kIzTL3iKaFDucS+?=
 =?us-ascii?Q?X5a9l7Gpy4HehaRMeIg5IvzZORjYBtpw4RWiTsxOCJmBuThSOaTQgoC6eRcn?=
 =?us-ascii?Q?MdbbPAXSymfARh9XoL8TE7yBTV5yWpjtT/Bv3jJMaVr3gc2elq12mm00elup?=
 =?us-ascii?Q?pdoN1mJGQwnTjoYed++msKPTh7b3Y7VYucmuT6maIm5W/nA3d/eh8wQ+fVO8?=
 =?us-ascii?Q?py9XsLiW8aUKCxNbSlU9atsr+k9F80acV7nSAiHcAjIQFI1QuGIe6UG9oZNi?=
 =?us-ascii?Q?5mwFLryHFnic8RS0XZhwvJ9/wS9bQQOisVjaIoRxaTY79fBVY0staK6sBuMc?=
 =?us-ascii?Q?oqB7nyXPU8W6zwUSX4MW/a6fIkxDFfgJoU3mPJGhXIQLmgWmIztWU8TK6ABP?=
 =?us-ascii?Q?Yj3m6urUZP2ruoUKXVC29ELUcQa+DP14Qqe/ZfNDOtZv9fBZs0OOj/N1sgDT?=
 =?us-ascii?Q?WSnz/9Y3Z4ZBpQ+I/4NeskMnpB8qQAI9BgVARcsDuTiHLiakLMsEtYswKuZF?=
 =?us-ascii?Q?RJGxwUCdP8wARG78KUTGxD44Zm3yo9L8019lRvfjtUp1DIQdvd1cwBeg9Rcw?=
 =?us-ascii?Q?8ZH1tc5QPnZ8imGc7uWKcTzByHxcJZBb+lIO2TVtQcn87kI1u4Z4QnAdCbIl?=
 =?us-ascii?Q?bh2WVhnR02gyXpfqAFIyJfuyD+Xbbz5FAvT5fJIgH06weisPYAnu2TpipcK1?=
 =?us-ascii?Q?KWdshpkBmWwMRiS2ICCT0Vvw9v6ybxf1a5NC+BQWt44MU3zqkkR06rTEurO1?=
 =?us-ascii?Q?N7U7HvzruCWxbKbP6fO+Dl2jCJAJMaepH5cukc28Bo15rzEJZgVVf5kh7B1o?=
 =?us-ascii?Q?MR+1C0MlTbuucMKUytuWuGirNKxKUJnEwZS8l9D7pMxkUYuCdbGmIcCJeggy?=
 =?us-ascii?Q?VF+fQ7SGZM/4nZEqorTev8fwW57nHgfo8DGYIJzMRWon7HxIXax53456CJSg?=
 =?us-ascii?Q?yv3g5VhIsiY0clVUlclj1re7cDNbb1C0NWyeVVJwRWugUqTXlLhhkOVHZZka?=
 =?us-ascii?Q?ZI6rXNEkQl8LcvZz1j7nmcrO1JXGcubFFBKgYfdjs7idmtmS5g1o55cGAA2W?=
 =?us-ascii?Q?QZxj7gLSRoBuMBLsdVkbWGEB3J5Vjxp7hMHPovALswqgzQ49NgzI0UZl7e8a?=
 =?us-ascii?Q?A6cVqYTjm6HH5FSsYKWiLSVj8b3K3DV8ZPeQvWncSnGau5sg0q5MqEq2C6Gf?=
 =?us-ascii?Q?tGtedtfkLYftysEekgsY/K9Au8J7x0iHZ4Fu64IktAJewX2KJw1l2Sx+6axi?=
 =?us-ascii?Q?QEuy8V0ML2gfQQYIwJ3GpUtbWm4D/jfgP1wT84/MqSAzhd7LMXkr9vdeE4D0?=
 =?us-ascii?Q?MRMkLtrzRpv7Mylm2LPYN1gR59bH6E8RBaYnbAFPUUPLmzsNk3yJbX774J+1?=
 =?us-ascii?Q?+BI3EG8USEX+R40WceVUm930iCVrKHg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e87d4db-985e-4065-47d4-08df419f8f99
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:02:47.5614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5LCPbfexRrIxp+rQVwgv5kbb7iOmCb/haCjYHo/tZBa3N/7E/RYOxCGcjl39NR7Gsnv4K+NYRaxRQv1W1jHz1sGcoJ8z6ahXiK92mB5K18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5012
X-purgate-ID: tlsNG-bad1c0/1794585792-BF0DD034-E4D8A742/0/0
X-purgate-type: clean
X-purgate-size: 1640
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The APM leaves it undefined what happens when the VMM doesn't intercept
writes to EFER and EFER.SVME is cleared. The current implementation in
Xen resets the nested state without doing a VMEXIT which is unexpected
and may potentially hit a BUG or assertion failure.

Therefore, implement the same behaviour as the APM documents for SEV-ES
guests; ignore the attempt to clear it.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

Another option here could be to fail VMRUN if L1 does not intercept
writes to EFER. However, this wouldn't match the behaviour of real
processors and may cause incomplete toy hypervisors to unexpectedly
fail.

 xen/arch/x86/hvm/hvm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 71da15c0a4ed..f4155f523598 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2156,9 +2156,15 @@ int hvm_set_efer(uint64_t value)
        ((value & EFER_SVME) == 0 ) &&
        ((value ^ v->arch.hvm.guest_efer) & EFER_SVME) )
     {
-        /* Cleared EFER.SVME: Flush all nestedp2m tables */
-        p2m_flush_nestedp2m(v->domain);
-        nestedhvm_vcpu_reset(v);
+        if ( nestedhvm_vcpu_in_guestmode(v) )
+            /* Ignore attempts to clear EFER.SVME from L2 */
+            value |= EFER_SVME;
+        else
+        {
+            /* Cleared EFER.SVME: Flush all nestedp2m tables */
+            p2m_flush_nestedp2m(v->domain);
+            nestedhvm_vcpu_reset(v);
+        }
     }
 
     value |= v->arch.hvm.guest_efer & EFER_LMA;
-- 
2.56.0


