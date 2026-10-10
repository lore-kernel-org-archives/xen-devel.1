Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F8DCA6017
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:15:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444981.1661489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU6i-0002lo-PM; Sat, 10 Oct 2026 10:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444981.1661489; Sat, 10 Oct 2026 10:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU6i-0002lb-Lt; Sat, 10 Oct 2026 10:15:12 +0000
Received: by outflank-mailman (input) for mailman id 1444981;
 Sat, 10 Oct 2026 10:15:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU6h-0002k5-6C
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:15:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU6g-0044U6-AR
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:15:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca0fff-2eae-0a2a0a5409dd-0a2a450b9390-38
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:15:10 +0200
Received: from [40.93.198.34]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca102c-b7e8-0a2a450b0019-285dc622c7bb-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:15:10 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by CO1PR03MB7916.namprd03.prod.outlook.com (2603:10b6:303:276::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sat, 10 Oct
 2026 10:15:07 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:15:07 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuR5YDqQvSiHUBX4G8NXRQVi3kShcdebYzunSvSTiau9rjl6HfG1Ce4aiL0++MQc6JG71VKWXj7CNvpSySfINJ8u05KY6yVNSEO/nwukvOaYbrANsjaSU45LzY7NnIVoU5sCT2KdSOwt2iVWGBeNWQrrhoakz1gyfaHyylgDWLn0FNh9B/xtjDTzZ8o8Fh66A4RUA6kcCvxl5UO9fVlSG8VT5Q7JVsiP4hJJ3zGK9Hh/zKqOrFSoo0/Rdp4GC5kKOLfEKfRDsy25NuSrRa6I+4X57R5ZxdszatfaZTb5sVweOPlleo52qoG2bkahMEcM5b98gVsHUMoqzLwOCh4zBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwU9gir2MKPzRvplN3rIcyzo64FzHBo/tZ4TRRP+JYc=;
 b=pV1flZ73JCOJcJMKlnYMzN3CAj9RI5uLmweSl+uyL2p8JG3WVrDMA0VIFOJ8QBar9cA7Fi+8hzOF+/sHISUnfhXKdh/CGua8lr5Qpizif0kLraiXvOjvvNBXSD7RkIFRZCd/+/pKf789+886HhRe/6+5ckqV59HLe804swRT4qh7/IGFXK0KJXD15FHMxLLaZmBi4Uf3k7RiNM6h0ZTK/WWWjnu2/zWXBcRExazIkU6TSaZ0U76rzpf9zYwiWJRHG7tEwxtwuYNEearihTdtDdWzGCz3BayZXz/T+hgCn9yB1jdZSPoIXqElCt07NOomaI2KKFEGbNpUDKnV3Eiqlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwU9gir2MKPzRvplN3rIcyzo64FzHBo/tZ4TRRP+JYc=;
 b=kUQZblCdcGV8nn06vr9HlRwPnclYQ01e1Q8KsM9FUXMn0+Xqzc0Z/aRIze3tGFVfZbwYs8xw2CEc10XgJPkn1bLmPFTV0vNTQuPKOxCJDxU3ngWh+D543QPr/61Va1RnSSM5TVUdZVBg78CfRvvYlhXWiF29LWTSn3DJ2mwUVGo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: ross.lagerwall@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	stephen.cheng@citrix.com,
	lin.liu01@citrix.com
Subject: [PATCH v2 06/13] x86/hvm: Clamp Viridian features to known set
Date: Sat, 10 Oct 2026 18:13:19 +0800
Message-Id: <16057af6a0433e8cec576825b784e3316fc2c06a.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To CH2PR03MB5320.namprd03.prod.outlook.com
 (2603:10b6:610:9a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|CO1PR03MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e228a2-8611-4346-72b8-08df26b75bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	CMUsN0zBfheIKHa9W2X0BLtCCWukULZy36POcQvLzmAQnL6PpgFgnlI8P/Mxh0Jm93hztmTLofMWA39ppPvryP+w+YGXHTZrA10xSmjoEqOjyB2wyjwPIPYWXhcejv+ltD9M9MmqaIYM8uYvvOij3idael3aB4Wh8KqgBFCZ1wz7y4TH1XMWRwviJUsQeVHgj97xphK5NYVyfbl89Z5BWKLWtdRKrjaltNLw5iL95osM1f3/V7KGbPRkq2nbu+OtLzIry+F92gTMlnC1anFefC+z2mLbNwwv81yWjxVk8YkCcGqCYev5JyKfEF2223YSSgJrrjhpblLdY6G3vwvBT/yU/8plA/pj1cZMHXGFtZrmy3oO1R/fayGTHFdhEHIxILnv2zH00a3h+PERMlMdE+Z/zbJ+bHIM9kzjftXCbdG8unl2wj9Fjrk3EbyyDHh7kpj7UXlcKR/stEB6kPMZPgkefIhA5Z1tCcUzqqi+1ry3rKL6EQi7U4Bi8nG/avZxwzsGyJ3SVMCMe/vvwXe97E27AWrU3JNwOiFwpmlgbzRyKKT2egmdU1hv9WOZ8UQSXpTZcpntGKxxDBHdi1pL20dlLrk5+i+Zso35nL1gE9aeV4IJjgPXnlz2ZR6G655zyF2NU10LlaVIO9A77O473rOQY4zBrgSpSUyrpw00arA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bXyRe20EhlksgmysfUZ/YsJ5f/hHsHmjM0dAiXlOM+ixMaGIhCVASrqlov1b?=
 =?us-ascii?Q?umUPQdz3GXWN+iXNrmVMI+eOrZJ821yc7Ce18PU90s/offXOSJs7oBeHAKjg?=
 =?us-ascii?Q?IDGyFdipMRyjh3zxSmyRXrYgcY1ZMLZaNJrBBlzsJliLmsrvJD9rXassNu0/?=
 =?us-ascii?Q?LHC4093+Y//W4J4XF2qvgRF3WfUW4hL+w227F5YN2+nmIModtZMzKiLd05jj?=
 =?us-ascii?Q?C0n0JwS7w21KkqOlAkTo4SGBbBaUROPQu8yAMydS14JsFhDtLPDGPufcixl+?=
 =?us-ascii?Q?z+4Th7mpCqsK1SCIq76pChFJLtZ4xObeSxadiyIVOxs3DUjAK2dRnDkNt51e?=
 =?us-ascii?Q?bo+sB6Q44VB49vS4toTkn7tp8baOEy/IQpKjcNNRy9Wq+3l9RVYvepV+8O6h?=
 =?us-ascii?Q?G5g4mQK7B43RJYKLQ5Vq1rlm0FNgLPm3B6IRMJwgG1l8hD0YDgmg4IVG52zP?=
 =?us-ascii?Q?P5gQf6UNWKsyz8zr4jEdkHwduJBe4ppF8iNLWMmWsI+tPpz9LkPARDhilzJI?=
 =?us-ascii?Q?MOuGqeEWsqQv5mJLvSW0g6kMqldvhYe/pbEWqQxvo32+cwL3U7srVRl4VROh?=
 =?us-ascii?Q?VsH6jrftqes3MzfnboZySKMBzFpoNUW9lby4JtzcPscUTBc/1VFGyGFkVgiz?=
 =?us-ascii?Q?VVpssUYRAW8MFnR9KliwA0Afr4AwA+61NYa/btL9SKXw06h41vejGYu50Jiq?=
 =?us-ascii?Q?4VB6iFJ49EGUhWFqABL13JlVwj0GP7a3k6B/rLIGMx3kshDdogKWFEgBvN1Y?=
 =?us-ascii?Q?KAaPh9U+3ZS1tRALYqF0MjySQmlh8d7j+2175v97BM0CpE8wxlr+2MPhTIFh?=
 =?us-ascii?Q?iSkZ6gh4B82SJnPPjpDl19nKyPkgPIT1uJXO99413TxqNCRYybsEGPf//zlB?=
 =?us-ascii?Q?gIczybUISnVgKveJFp9xMSq5gDEESbgZAk3hW7dRL1gVe9fwDZIReqpHzCxm?=
 =?us-ascii?Q?UXn33ABiUniad/86SPzpEY4pJQAcNpnWZzwfQyklJPcIT+i3rKbe7CDXRdD3?=
 =?us-ascii?Q?2WHgolrH5M7RyXGJGa41ECRFqz2fVUGx6kL0FBOKjgXd22QZAqI26zrZnrMh?=
 =?us-ascii?Q?5N/hzQC61wffC32An2Xj87kAv65atcAo9qFzd1Q0Cdi+Cd5KbcXbMAS6eg5N?=
 =?us-ascii?Q?vGOBG7CES2fjyTsIH3QBsdZNUu85Q2/s8SYXdQzu14yofNAZWgzhhzP5b7CN?=
 =?us-ascii?Q?PWi/fjJGKmBP0P8Akd19mKLQADzbsNByTi4snbhMwDWLXgpZk3KBzbcGaYwc?=
 =?us-ascii?Q?8IroW2FHfuKXx3n4Zii660j/qHVp5b2z7e09RAOgCU0gS7s1LmWp0n1WGycw?=
 =?us-ascii?Q?TZiydcSWQ21i1oQbEF4NCljzBmIgzMh6/AEivLdIV5NhtHJ3NpxQosDHhVkk?=
 =?us-ascii?Q?wPcQ5pEPqBit1/rd+ZQvv729gGu/CcsXNNZlF4akGFVvyZi5BIra4i1QT2mq?=
 =?us-ascii?Q?Fb1MwXItrJwws4rdRSktGzrYjZNlQv1aAC04wpzPMEB6cQT9/Xfbdjtu7WZe?=
 =?us-ascii?Q?heUCxw9ZlRaVI+/P4HJUTt2X6SR8QiQXAJXWi4II463REytuzOK1FuWjmERy?=
 =?us-ascii?Q?VknXpW3rmHXAigJgarswVd8Qcv7YOa3bgGVI6auTT4LpX2M2QCfcJQHdic65?=
 =?us-ascii?Q?b4MjTA/yw0SXmxJgMMbPHsWul3GW6yfN4koWS+KlhQ6K6vDmAGloEuqmVV+u?=
 =?us-ascii?Q?KncENnel8+6NHN1gABLM80ubrB3y57rH07N7FnYOx47kuyWhgdt52S4GVdFy?=
 =?us-ascii?Q?0hJ42T205w=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e228a2-8611-4346-72b8-08df26b75bd4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:15:07.5225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MdLtacU2xQT8wTqP/oC3AeZYK3V+fV4N9/STvl1QTsQp78sTPKf2tsFBTaePpdxnLmJHeg2TbpyS2oWmZtKcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7916
X-purgate-ID: tlsNG-42698a/1791627310-A92CC9EA-7AB683FE/0/0
X-purgate-type: clean
X-purgate-size: 1167

From: Ross Lagerwall <ross.lagerwall@citrix.com>

Instead of returning EINVAL on an unknown feature bit, clamp to the
known feature set. This simplifies upgrades since when the hypervisor
and toolstack are updated without an immediate reboot, the toolstack may
set unknown feature bits and the existing behaviour leaves the VM
without any Virdian features enabled.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/hvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ef9c7cd05777..e2c31d87afc9 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4235,8 +4235,10 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
     case HVM_PARAM_VIRIDIAN:
         if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
             rc = -ENODEV;
-        else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
+        else if ( !(value & HVMPV_base_freq) )
             rc = -EINVAL;
+
+        value &= HVMPV_feature_mask;
         break;
     case HVM_PARAM_IDENT_PT:
         /*
-- 
2.34.1


