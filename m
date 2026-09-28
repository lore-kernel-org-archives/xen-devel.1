Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461FACA5FA5
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 14:03:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436049.1654836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBx2-0003k4-N4; Mon, 28 Sep 2026 14:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436049.1654836; Mon, 28 Sep 2026 14:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBx2-0003jv-KB; Mon, 28 Sep 2026 14:03:28 +0000
Received: by outflank-mailman (input) for mailman id 1436049;
 Mon, 28 Sep 2026 14:03:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xBBx0-0003VP-Pp
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 14:03:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBBx0-00Ak4S-6Y
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:03:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba73ac-2eae-0a2a0a5409dd-0a2a4502a670-14
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:03:26 +0200
Received: from [52.101.43.15]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba73a8-6ca4-0a2a45020019-34652b0f35d3-4
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:03:25 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MN2PR03MB4990.namprd03.prod.outlook.com (2603:10b6:208:1a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:03:20 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:03:20 +0000
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
 b=fUVtpE5wyQkSf9O2C3FFIgKckFydf32qnkynOc7cH8Zy8KTw9K/7Wwjqq6SiXd2SrwUmmBW+6QWgCQX8S7DMdub847hOrEP1939L+SgF/SnKaORopf68azH15v+KbFvyZ8YcAY+lgHa7tmXlLMxGtpU4xyFHZ7JA+x+5ei7V4mDdGzpJC8J+hxSy/mDsiAruNh1Kgkv0YSK/BqSBZbrdh3fF0cqUGsraSPE7s9KgkYkGp3XXYL8U53s1I86615AMNdgu62bOWqIcbly26lZHQT3GSDuy2QFDAQ7xOZg616iKjGiBUcYdB8/yWfaweyvY7LW15HvnZFXXvWHOI+Gsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lR2PGO20TNGu+ytEd+wZkt7MmkPldKuW9/26ChFgjc=;
 b=EiLk+4TF+ac9DWAi3I8+a6xDiy7L6AwZT/wWar6bMcDlT8FIRx4PMnm+TCyLN2ejtZP/UgB2yuOq5UfXBL+UAjtLtgUTvt7+tfW5p2obqKwE+J98COqMyhIlIIoUJh1AVGnyfY6mAWlCMMPIuvZPNPtI9ga6f/98v7xzJPX0aivF32c8LCNvL8q/UyfnYjLMPQQX51tIkT7n49Q+1YI1GYv4ty29cED8oD1246BAnHwgmKb0TzeeYgjo9iyq6y1XJJnVWKtN3aLBDClbxggsL9yrBQf/hvD5Tdzwi4/xq+pO951g7QomZRUmMuEqQEO/dCc6v7jUnmtm8NnZ2Cqmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lR2PGO20TNGu+ytEd+wZkt7MmkPldKuW9/26ChFgjc=;
 b=FCmKdGGkXB8qLUFSSvBhlYGJPJqY/eHmV0NkkVHgkA3IEF6ym1hX/ZfBEloE1wn8sGY+rmg+PHYyhGSVY8HCfaXxIHD2JD1Pv2tiIcCt0MLNsmFfPejouxpEwCAGPFIqKol6/bIS5Y90RHc1xQfEIuae8vpPZP/pofQhdEVSKoU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 4/5] x86/svm: Use C99 types in VMCB struct
Date: Mon, 28 Sep 2026 15:02:47 +0100
Message-ID: <20260928140248.1543013-5-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::13) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MN2PR03MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3b20c6-23b5-45d7-847c-08df1d6940d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	TDDEmTBKRfku2BjI4tH3OgrwQRzH/5M+1/PDr4mc2WpeymugOQ33DIz7SdBT/pGams3MctEnJZIwHjv+a6hOHukS+ZeFiwstu8Ah4szhRtRnB80SjR7J1jPD2LU1E+HBrhdrP97YaRTuoh0s8HMKYzUcyWu8U7wbrL68xX55ysbzTyJXOMNO/eJcs/0nmLmie1j2LKh55HlU36yEVs222jpEAXZk7Su5dbkSdc06eMQSSncTZogt9Y54jBooszLNMLSBiCz/vmaXMtNdOe4pndLpC2cr/WU4gPsT51jmOkbupjT/GRv9VFXGz537yVSFZ5JbN+d9+AXMDdMjCeR0AfXJht5egoEJL13MHw+eX/6CDTv4ktj26Z9feOTi2WVAJOfdQbEi8vKchqNqQGG5XUow/hyxfkMhpNckUnmTiXdng9FvQ3brwQHcJa4iedDYOZOUuQI98EvkaFNnSzf0y8U+kDrMS/PAgCAyYpscnO1Cgda60e4OW1jguqFQeXGGLj0ADgH8Y2rKamGNF86vzlW0Z5GGByIXog5zK6F34NovvE2POa6O/UHhyT/VRLw35XK8M1SyGAQ5+RgSmOyBKSfcSuD5HkFeSfctMxvZKh2x6lHs3Kj58pAOqAWjHm2IytkKINV7Uk4RP7moQY3ebvbYdiUr59NRIph2nO+LjB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?phFOSQAV+DrAFwjLGDNqd7/tJfA/QzFd9zcmuWgWXG/fNzOXrmcoYPgwvC6j?=
 =?us-ascii?Q?n/u80Jf7pSVAW0VH6rM6FlJVHzqoXX13K9P+aaftWE6FKGDB30BMjCctbX3u?=
 =?us-ascii?Q?Xqk96skaeoH4AMhIjey8F76a9afXbX5hXqkXre3jahztstOXRSJDxUXKDG9a?=
 =?us-ascii?Q?G6jzO51dWAzir/p2JF8VwGpg/rUgQchCLNe5Qxgot8TOXzTKMkVTO0BJiZiK?=
 =?us-ascii?Q?+EHoGdabW+4u7g8ZGNIiWOm7RJ5h2/aT2vav4d9OSKk7ofPsZVU3CS9VMxuf?=
 =?us-ascii?Q?U2wqa5YAVwH9aGVmXPReOQfW5rMZuXjWAeLUYYYkRrmufOMh0MAlvEGJ8NuG?=
 =?us-ascii?Q?BxlvHBlP8W3CNa9W8XFR3ols7PKtdqTMewlRKkrp2P8Oq0Liwmc4dyEha8PC?=
 =?us-ascii?Q?9SZ4P1rI0Gx/4RTO4Id3penRbO55amAO+3X90blvTXjgH838Krg1dNpiGyy1?=
 =?us-ascii?Q?sBb+PXaKbm93bsJXKsl/zwmJq/jzoo4foy6p+q2OOQJnQRCeeYViED9YrPMG?=
 =?us-ascii?Q?vFQUzaoMnqlds+hUVcEl4X+5Y8nb9EiHiieR7NefoHtZHERNGqXIkld6Nbkk?=
 =?us-ascii?Q?ktqFErnonBoHNU0aIEW6i4aTg+bxVaXnkXWEsOaltDh0xWazBEy0KVbjyCGZ?=
 =?us-ascii?Q?DIyBkhKx2go36ctxNA9PivYZd7BcFrtzyrJwzRWGBIL7VxS0eoTYx4i5ZGOu?=
 =?us-ascii?Q?EuSnGwKDbqEx2rL5SzGBeeyIcY9v9eOu0ZX7+H6pVwC98HtkBzzOnuw3ccpd?=
 =?us-ascii?Q?HkmE1YHoL/QhpFArS7eUG7EBabFmz6SghC5ePJdGN/HZyr5hKw9XBIZJRu6j?=
 =?us-ascii?Q?I+ooZWrhCxTDAUW8zt+2XbOFYvzl7yFnVZwbDz+0gkTczBDeaVuROpUye5oI?=
 =?us-ascii?Q?fpgFf4ys8eiKvfocJNsf9Ndg7sngh4MM+m4GP2Itk5BHvLCvQzv9co+7ECl3?=
 =?us-ascii?Q?4rCPiQ/ZzpuD+BJQs6Qby2SeFeu3n3yzrOO6N0Z5HxvUaV9rMp80hGb5Wf13?=
 =?us-ascii?Q?MKWbcrYp2ZmHLuhJPHRy4MF75bFhEsYX7x5VPlze4yN/Hdww9O2bvxE20taC?=
 =?us-ascii?Q?5qOOQq2Tpy2MtSJSIxU/npQ/R61HLUf8OJal1Z2Uv/wnnkqsBkz6qw4np8df?=
 =?us-ascii?Q?EAQFwWyCZJojmsx8W3FVBZOQ1EHwLtt4XEQnx+E6HUOUTfk0QPp7QF/TYVc2?=
 =?us-ascii?Q?lCteVrOXcJ7xe5tRwXasls6ozTOCih4PN5WjrWSCmvDXmymBaRuMJZxZ0bR2?=
 =?us-ascii?Q?H1XWLoebvXyg5RyEpsiMV3attVIIg1/i/d3qQ2ExZdWb1STP5cBixlt9T+B7?=
 =?us-ascii?Q?EPt9p3ytm1TooS/kAe7EuX5UngXgXiH5cuPRN0Rs2fV2ko8299DvkWSpKCsu?=
 =?us-ascii?Q?uySfBKjMAebhNn4TosyYjPgxZWkkPrmIRTMgzMXFQKaH1dK7AWtBofo/JHqW?=
 =?us-ascii?Q?ntkyIFZPc01eFAxYpS1zVnWmPlgWYNLYCWMKbT25JIpDZOXrqqJZAygqGYbY?=
 =?us-ascii?Q?+/fev8Ti86G8lP9EzkVs4LDlUKGquCP1CvhDkI5SC0uVP14I6fqdCDHfWtbB?=
 =?us-ascii?Q?mMxbEuHAcLwjhrXVqjVAdwnBhJXKlgOZDKilZ6dfl6LfLJWnN8h8gP9bWA32?=
 =?us-ascii?Q?STu32foXmpUd9fMwnET40CaZ1hFKUai1Zq5SvpBLie3ZpPL7Sw9hlPS7W6Fv?=
 =?us-ascii?Q?xJQS7VwMVG2Yhz9Jvg2cIbQSHFPcgs1HojZIl/+3E2scgYO0jYNFHzRXHq2g?=
 =?us-ascii?Q?MjE3Vpi/OUQjaug7Yf28QP+xY2KbFH8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3b20c6-23b5-45d7-847c-08df1d6940d1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:03:20.7236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gdjbol5p1vjoMeGs0SFeIMYKCz9Y+FKOhHNGuzCPCZZl+RXhoo/mj6sv8rOIcpj7SRnDvfsdJ/X35Y8ue9NTr5B2l1InTtbQwwLH5Zj7tDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4990
X-purgate-ID: tlsNG-720697/1790604206-303C42AC-B2E41040/0/0
X-purgate-type: clean
X-purgate-size: 7135

No functional change intended.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/vmcb.h | 128 ++++++++++++++++++------------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 34308f3b19f2..cf80c706bce4 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -387,24 +387,24 @@ typedef union
 
 struct vmcb_struct {
     /* Control area */
-    u32 _cr_intercepts;         /* offset 0x00 - cleanbit 0 */
-    u32 _dr_intercepts;         /* offset 0x04 - cleanbit 0 */
-    u32 _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
-    u32 _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
-    u32 _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
-    u32 _general3_intercepts;   /* offset 0x14 - cleanbit 0 */
-    u32 res01[9];
-    u16 _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
-    u16 _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
-    u64 _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
-    u64 _msrpm_base_pa;         /* offset 0x48 - cleanbit 1 */
-    u64 _tsc_offset;            /* offset 0x50 - cleanbit 0 */
-    u32 _asid;                  /* offset 0x58 - cleanbit 2 */
-    u8  tlb_control;            /* offset 0x5C - TLB_CTRL_* */
-    u8  res07[3];
+    uint32_t _cr_intercepts;         /* offset 0x00 - cleanbit 0 */
+    uint32_t _dr_intercepts;         /* offset 0x04 - cleanbit 0 */
+    uint32_t _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
+    uint32_t _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
+    uint32_t _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
+    uint32_t _general3_intercepts;   /* offset 0x14 - cleanbit 0 */
+    uint32_t res01[9];
+    uint16_t _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
+    uint16_t _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
+    uint64_t _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
+    uint64_t _msrpm_base_pa;         /* offset 0x48 - cleanbit 1 */
+    uint64_t _tsc_offset;            /* offset 0x50 - cleanbit 0 */
+    uint32_t _asid;                  /* offset 0x58 - cleanbit 2 */
+    uint8_t  tlb_control;            /* offset 0x5C - TLB_CTRL_* */
+    uint8_t  res07[3];
     vintr_t _vintr;             /* offset 0x60 - cleanbit 3 */
     intstat_t int_stat;         /* offset 0x68 */
-    u64 exitcode;               /* offset 0x70 */
+    uint64_t exitcode;               /* offset 0x70 */
     union {
         struct {
             uint64_t exitinfo1; /* offset 0x78 */
@@ -468,19 +468,19 @@ struct vmcb_struct {
         };
         uint64_t _np_ctrl;
     };
-    u64 res08[2];
+    uint64_t res08[2];
     intinfo_t event_inj;        /* offset 0xA8 */
-    u64 _h_cr3;                 /* offset 0xB0 - cleanbit 4 */
+    uint64_t _h_cr3;            /* offset 0xB0 - cleanbit 4 */
     virt_ext_t virt_ext;        /* offset 0xB8 */
     vmcbcleanbits_t cleanbits;  /* offset 0xC0 */
-    u32 res09;                  /* offset 0xC4 */
-    u64 nextrip;                /* offset 0xC8 */
-    u8  guest_ins_len;          /* offset 0xD0 */
-    u8  guest_ins[15];          /* offset 0xD1 */
-    u64 res10a[8];              /* offset 0xE0 */
-    u16 bus_lock_count;         /* offset 0x120 */
-    u16 res10b[3];              /* offset 0x122 */
-    u64 res10c[91];             /* offset 0x128 pad to save area */
+    uint32_t res09;             /* offset 0xC4 */
+    uint64_t nextrip;           /* offset 0xC8 */
+    uint8_t  guest_ins_len;     /* offset 0xD0 */
+    uint8_t  guest_ins[15];     /* offset 0xD1 */
+    uint64_t res10a[8];         /* offset 0xE0 */
+    uint16_t bus_lock_count;    /* offset 0x120 */
+    uint16_t res10b[3];         /* offset 0x122 */
+    uint64_t res10c[91];        /* offset 0x128 pad to save area */
 
     /* State Save area */
     union {
@@ -498,44 +498,44 @@ struct vmcb_struct {
     struct segment_register ldtr;
     struct segment_register idtr; /* cleanbit 7 */
     struct segment_register tr;
-    u64 res10[5];
-    u8 res11[3];
-    u8 _cpl;                    /* cleanbit 8 */
-    u32 res12;
-    u64 _efer;                  /* offset 0x400 + 0xD0 - cleanbit 5 */
-    u64 res13[14];
-    u64 _cr4;                   /* offset 0x400 + 0x148 - cleanbit 5 */
-    u64 _cr3;                   /* cleanbit 5 */
-    u64 _cr0;                   /* cleanbit 5 */
-    u64 _dr7;                   /* cleanbit 6 */
-    u64 _dr6;                   /* cleanbit 6 */
-    u64 rflags;
-    u64 rip;
-    u64 res14[11];
-    u64 rsp;
-    u64 _msr_s_cet;             /* offset 0x400 + 0x1E0 - cleanbit 12 */
-    u64 _ssp;                   /* offset 0x400 + 0x1E8   | */
-    u64 _msr_isst;              /* offset 0x400 + 0x1F0   v */
-    u64 rax;
-    u64 star;
-    u64 lstar;
-    u64 cstar;
-    u64 sfmask;
-    u64 kerngsbase;
-    u64 sysenter_cs;
-    u64 sysenter_esp;
-    u64 sysenter_eip;
-    u64 _cr2;                   /* cleanbit 9 */
-    u64 res16[4];
-    u64 _g_pat;                 /* cleanbit 4 */
-    u64 _debugctlmsr;           /* cleanbit 10 */
-    u64 _lastbranchfromip;      /* cleanbit 10 */
-    u64 _lastbranchtoip;        /* cleanbit 10 */
-    u64 _lastintfromip;         /* cleanbit 10 */
-    u64 _lastinttoip;           /* cleanbit 10 */
-    u64 res17[9];
-    u64 spec_ctrl;
-    u64 res18[291];
+    uint64_t res10[5];
+    uint8_t res11[3];
+    uint8_t _cpl;               /* cleanbit 8 */
+    uint32_t res12;
+    uint64_t _efer;             /* offset 0x400 + 0xD0 - cleanbit 5 */
+    uint64_t res13[14];
+    uint64_t _cr4;              /* offset 0x400 + 0x148 - cleanbit 5 */
+    uint64_t _cr3;              /* cleanbit 5 */
+    uint64_t _cr0;              /* cleanbit 5 */
+    uint64_t _dr7;              /* cleanbit 6 */
+    uint64_t _dr6;              /* cleanbit 6 */
+    uint64_t rflags;
+    uint64_t rip;
+    uint64_t res14[11];
+    uint64_t rsp;
+    uint64_t _msr_s_cet;        /* offset 0x400 + 0x1E0 - cleanbit 12 */
+    uint64_t _ssp;              /* offset 0x400 + 0x1E8   | */
+    uint64_t _msr_isst;         /* offset 0x400 + 0x1F0   v */
+    uint64_t rax;
+    uint64_t star;
+    uint64_t lstar;
+    uint64_t cstar;
+    uint64_t sfmask;
+    uint64_t kerngsbase;
+    uint64_t sysenter_cs;
+    uint64_t sysenter_esp;
+    uint64_t sysenter_eip;
+    uint64_t _cr2;              /* cleanbit 9 */
+    uint64_t res16[4];
+    uint64_t _g_pat;            /* cleanbit 4 */
+    uint64_t _debugctlmsr;      /* cleanbit 10 */
+    uint64_t _lastbranchfromip; /* cleanbit 10 */
+    uint64_t _lastbranchtoip;   /* cleanbit 10 */
+    uint64_t _lastintfromip;    /* cleanbit 10 */
+    uint64_t _lastinttoip;      /* cleanbit 10 */
+    uint64_t res17[9];
+    uint64_t spec_ctrl;
+    uint64_t res18[291];
 };
 
 struct vmcb_struct *alloc_vmcb(void);
-- 
2.55.0


