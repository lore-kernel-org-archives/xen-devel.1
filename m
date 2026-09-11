Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89574C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:23:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416749.1645683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51E2-0002Xn-LU; Fri, 11 Sep 2026 13:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416749.1645683; Fri, 11 Sep 2026 13:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51E2-0002Xg-Ik; Fri, 11 Sep 2026 13:23:30 +0000
Received: by outflank-mailman (input) for mailman id 1416749;
 Fri, 11 Sep 2026 13:23:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x51E0-0002XY-E6
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:23:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51Dz-009M9i-R8
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:23:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa400cd-e002-0a2a0a5209dd-0a2a4504b2fc-6
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:23:27 +0200
Received: from [40.107.209.9]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa400ce-b57f-0a2a45040019-286bd10907b9-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:23:27 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA0PR03MB5513.namprd03.prod.outlook.com (2603:10b6:806:b8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:23:23 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:23:23 +0000
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
 b=gRsuClBO+rrbilnQS4UEstFjUbrQD27EZznddMzExoPXMLv7mSHBiyrUA0a8X+JOzAQ4qRxeDdqAiUu9SHxwycV7aQ08PTmSFXAUwkqFs1CV1bnH1ah1mfn/HjEk5XIe6uZFVUvpxOX7J80FgfiespCVkHZQZsvyn6GVYnbG31sLPy4TkN1oXuTVkZEwq8NDO+U8AnQ9NiMBcHP6UFebdePzkaBgmDq0aJcYEzK7YffkH1j+efdZArwSrABQC/M7HGYR9OXzgYXLCeAImuJyE4B+bwKD4ATK/xlhePsjBbSVWRU0MNFz2JUlMiiKdJG8xv36z/GqS5OHCBgBAkjHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV7+0WrE2NS0uGcFnawu17UelPzi7v9pfguRD7Ezzts=;
 b=Zuvq1trrGlsbgqIhRfdZOgFjb8mrlMUpWR4fQ4I7OczeLGTJpD/PPNXuXflgJzcVEwo37VjP9F+PJSJE/o8tplR9/dWpJD+RjOY9Qe/S4HVNeH7bV720ALiEX/HZFZ65RosoIBxzoIb4elemoabDHDtCXFoo39bzjg0oFJXHulaJxLanCJ9I7vq7p/8FPeRYkRPH2fpM3gAcT+O7wKbQaYVSWdU3M+pwluUbOBl50iaK1Mg+0m7z8Xm+Uj3umUNHhg5eawH24XrnRIk8lv5nztsdPOoYodAjwwxtdiRx4gfsjGY+wEtW+qUYfs+BcSrGIlW6zin/XR6dnNDOLyXs1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV7+0WrE2NS0uGcFnawu17UelPzi7v9pfguRD7Ezzts=;
 b=WzKoqIYy0JetSDqGk0hV58hLVH+5b0dFZtLVYDcARQVpCo1NBxeZOuwQ4EcQ8/ygFp7wLRwhp2ZrXZK4dMvJGNgJAdPf+ttiLj67h7nyHmjhlEH+SYUCZwmolM06RigU1Vl6g5Go7h3C8ZRgpdKE+ILIAF1NgHNNHdYwij7EOHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2] nestedsvm: Fix multi-byte IO port intercept check
Date: Fri, 11 Sep 2026 14:23:15 +0100
Message-ID: <20260911132315.1209497-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU7P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::10) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA0PR03MB5513:EE_
X-MS-Office365-Filtering-Correlation-Id: 940fbbdf-3953-441b-3f3f-08df1007db0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YHf1XGjEIJRV+hRVSdQzR0PSE53cXNrrcbejR8eK6Hqy5cVvrA/977G+LcGmduXFvuXa8HsytUEaGeS3udsTBc04/VHeMKb3+rCQVCXg2MH1CbYT99T/dSUwJrTebuk1us0UGrWMDkQbwoXj2m07K0h/2x17icnqDwmZ6hmsdxTv2FRS9yRHSGekCOz+75Ylc9gXeU4QMzfFa8aEau8oZl1GaaPWh6hD75+yRhqd2np+kLggYyYU+w8IUAfNRZmW6WBqV5+PZgZ4zOLuR/NFeJK6Dl284IyiPJpnHjmdSKxU3IHCCmZU23x6mhbb4qh0ojelPOIJRAfRYmwPPG34R5IC6Vu9HrDqk780MPi6uGRmzdCYk9UodU/5vnxKDpk6aEFAy/6EyStp31/D/mBhFVNcEtj9tGzoE3xiN5kLQGjyED2E9sFL6Yw3dWmYS04cbAYIjMzlaX0KZNJb66hzoiDAv8Gqb8QBriScRiZVAquKt5fBxTKdEHmOHvCwIp5TWtiinvGpupES4xWV4G04N/oOpCUwwxJhE9HAWUsVT+YKOK37FhAqzHQXwsj0jX+l+KqQrixFbld0kpWGnj6X1P71K9fepd8t2EODUDL8zPj5CgB+Mk8FI2t9G1NwR4w8d1ZxjpSEQSDGdaSfAY5nhsNeIMvdCprRBPDteGmlGPY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hONsnFt43i2ddC9ZbRhcBjRMtcgUdSkQENgx/4u13nat7tJ7ZBvP0e6GVBk8?=
 =?us-ascii?Q?KHfIqsEogSOH7Sd3S+a4hU/gNpglSCziE/IXnQ00eqSkcGVertx+omMhEIsY?=
 =?us-ascii?Q?2QuouyKqUyg+3GD+jLU9k3HN/WTAkKAyPwtQFbp/5V82Fy04XBkcESUg7Y8o?=
 =?us-ascii?Q?BdK15X3cUgSNM0VyF5qaTe0fHWwT7vFa0hQS5+CBV49VITzsTr4lOQikdyHl?=
 =?us-ascii?Q?f3L7X8jUu1QM/3qQv7+LjM3mTWLjka7BUR7PZ8VaLEGxzYuVOmDoHeZY8lnh?=
 =?us-ascii?Q?rIlrh7KrfEAg1lUFBMVUlUVAvzo/VCJ55xqCYouEp8YN8JoJTwH5RHuD6g/F?=
 =?us-ascii?Q?9I26Ndvfxa7POt8cBBtfKtykqq0NzlaMtnBOeI0P+QahQAAAlzvAJzjIRO0R?=
 =?us-ascii?Q?fSzkEbMKRYBe9cZXwLDeo4ANf13vOYQdslPDKu40QIaqEngoIDbGLsVePq+p?=
 =?us-ascii?Q?W/c2o8A3K3GGpPQFl286C3ymwG0f/6mxpFcOWv7Le4c8rRhCbN2S+h37Xjd2?=
 =?us-ascii?Q?XLv5caZNmpJxJSrq1Rrwo6/YF2A58Bbu9J9WlMvfuKyu6hLWfi2IqFOUjsQF?=
 =?us-ascii?Q?Plj3ZkdSoBGl5Z/X7mvmQra8K56v4UkrjZJ3tY38ZMZxywEVvfIrAZEwP3Pg?=
 =?us-ascii?Q?0C3Ske03zK/Nd0EeK02bdddxkESvr16qtMRuIStCZCAp23EZkRFO6UE8eHuB?=
 =?us-ascii?Q?y8XitMdlEzwRRewN7YfZj0A1cxqRXF2hZ8cAfL+5nzTREua9NJRLN0FZyzJ1?=
 =?us-ascii?Q?DNVMuTtFRntupuOvRBUkKLuQpY2mAJ1UnVRobbBjOsv80zNikmf0FcOqynYC?=
 =?us-ascii?Q?5bTiNcaPWj8wCCMu+z2eZyOASsmesDnjZo4D9tOUnCC+Oh5mjASZXai6zIVQ?=
 =?us-ascii?Q?1LKwLSHzFdK1pvM4KILAKc+BkRiH1TeM6W+1KrOYx2D4yCR9xqOhT7WZXxlY?=
 =?us-ascii?Q?sRc96+jaP70TQ3khSowXrgghzlo5tId6l0yCb5kQm6DJfEBnYN40GxVGvwNf?=
 =?us-ascii?Q?FWT80pQsTh/yxZvARiBjuj9NK0iMzIf/qwbrDce/2AxUSY/QHuy/qfvhUFsz?=
 =?us-ascii?Q?pDpS59ZSnV+aukgOpeYvyOWzi+n6L/Gmi9QxtLEnq0aEMsPmb071WbvqxU2y?=
 =?us-ascii?Q?2uW9P5qXaUdgxkzwRS5C3lSiu6yrGvvsyAih4FY4Rvhsgsdr1zOeHUa4vqNX?=
 =?us-ascii?Q?VrzwlK4fQ2X5/DysywZm2Ab7RDxGY2WL7m0Hh+kgN+GnN4wKGwuQCBMoDsYD?=
 =?us-ascii?Q?tSd8lusIpzdjqA70L0snogwXR+qMVl4mtqTcymbfz+rR9+vSh29tAKjASyr5?=
 =?us-ascii?Q?7wdAWoba8wooVdj3iChEAwtjaJrvlrULUH8JuMpQ154ntA+wd2ySrWSwf6Rv?=
 =?us-ascii?Q?tM6IC/HT7lv18ke6BHxKX9voF85Tz8Re34UoRFWts6bGmuKJ/PudcZwm7n/b?=
 =?us-ascii?Q?ACikgmv6gJwWpisoKj3x82sj7rS4jOyX+NIesiedIx5ic5Cs0SjV4XNZFxsL?=
 =?us-ascii?Q?TtQwnRcgrcGJBBfq1a/s87XfT6BaowhRombnbBHdOxA2w5PEE6Cuc9+Sh6CM?=
 =?us-ascii?Q?dLptUG61Ab1rLmd+YSoZDnh4QJ0EdHhOF8wCXcoCkwcaNxe+XVrKgb1OWXO/?=
 =?us-ascii?Q?mYlrAwbn8qLL7ctA/rowmQWnfAOp6ad1mBXrYMTH8caLVg+EtyfNNKfl7D2n?=
 =?us-ascii?Q?fdq77pf0Orx0jc7yYg5ONZ0+M1gkIVAGbieVFu20+KAdLKz1IlbpfpSXWn1B?=
 =?us-ascii?Q?Y2+yxMQxAlgUNDACddQeEBMdvV0D8Ac=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 940fbbdf-3953-441b-3f3f-08df1007db0e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:23:23.6700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFiw8dEXtokndzBguqDl0mku1rAqclXezU3z1vsbBHSAv7/AjoFSN6CElgpiI++0LXJz8yhNzeHovTm7MBBUd5saSOlWpQR1Fb7XSt8qXis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5513
X-purgate-ID: tlsNG-ebf023/1789133007-514D3B50-0344B527/0/0
X-purgate-type: clean
X-purgate-size: 2125

For multi-byte IO port accesses, the APM says that SVM should intercept
if any of the corresponding permission bits are set. However, the code
has this backwards and only intercepts if all the permission bits are
set. Fix this and at the same time, make things safer by handling
mapping failures as intercepted. Also rename the 'enabled' variable to
make it clearer what it does.

This affects Hyper-V since it does not generally set all the permission
bits of the multi-byte ports it allows its root partition to access.
This results in an L2 root partition that cannot do PCI config space
accesses and therefore cannot access its NVMe disk to continue booting.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v2:

* Intercept if mapping fails
* Rename "enabled" variable

 xen/arch/x86/hvm/svm/nestedsvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 5adb1bd72c4d..8885916399b4 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -830,7 +830,7 @@ nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, uint64_t exitinfo1)
     ioio_info_t ioinfo;
     uint16_t port;
     unsigned int size;
-    bool enabled;
+    bool intercepted;
 
     ioinfo.bytes = exitinfo1;
     port = ioinfo.fields.port;
@@ -851,8 +851,8 @@ nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, uint64_t exitinfo1)
 
     for ( io_bitmap = hvm_map_guest_frame_ro(gfn, 0); ; )
     {
-        enabled = io_bitmap && test_bit(port, io_bitmap);
-        if ( !enabled || !--size )
+        intercepted = !io_bitmap || test_bit(port, io_bitmap);
+        if ( intercepted || !--size )
             break;
         if ( unlikely(++port == 8 * PAGE_SIZE) )
         {
@@ -863,7 +863,7 @@ nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, uint64_t exitinfo1)
     }
     hvm_unmap_guest_frame(io_bitmap, 0);
 
-    if ( !enabled )
+    if ( !intercepted )
         return NESTEDHVM_VMEXIT_HOST;
 
     return NESTEDHVM_VMEXIT_INJECT;
-- 
2.53.0


