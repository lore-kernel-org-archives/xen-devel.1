Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E42C624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 14:16:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408566.1641075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Uhv-0002f9-Ra; Fri, 04 Sep 2026 14:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408566.1641075; Fri, 04 Sep 2026 14:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Uhv-0002f1-N2; Fri, 04 Sep 2026 14:15:55 +0000
Received: by outflank-mailman (input) for mailman id 1408566;
 Fri, 04 Sep 2026 14:15:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x2Uhu-0002bb-MT
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:15:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Uhu-00H9Wx-39
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 16:15:54 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9ad299-2eae-0a2a0a5409dd-0a2a450aba1e-2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:15:53 +0200
Received: from [52.101.62.35]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9ad28e-f2d2-0a2a450a0019-34653e23f6ab-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:15:43 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MW5PR03MB6957.namprd03.prod.outlook.com (2603:10b6:303:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:15:39 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 14:15:39 +0000
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
 b=N4MibUNStijVAbBl3lEuyqWbio0M2eadhCXsILbfy3VYdItVWB9fba8pDJW3rUiPmmEs8SyXzANMJ+3DLkIxKPHAUoKkbSYxiVlN9EUrk5u9n7RNOzbf9pM8xji7b7Fb+mU9tP6vJuwbA7R507QzBRZ77qA1Dn9YUYeZZmmDjp+Q/Ag8bxAa7yOtOgiNjvi8UPXDZEpI+XKbJVXjxQTFtAOUVxxyQorajGCjY4331xmFYwBbuw4QTDNkk1iznELbGvX40uGqpWn5XlulpzwYM92gi7BjoeOma6ZSRPi0R79oj23Hv+tkLapf6TijaM85/yRHFwBrS2JGa5BXksNhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GciZW9ECljd9rNpwA8gaFSi7EI+SgMi2NmfDY0Gfoqg=;
 b=DScnDJa407pDB0vR8dHRrVrPmmjuasx5btNEZMlpPOsi+MIF+NWldv1Vhnb1HVpoUhxX02i2xXa71S6/vwfKhOfabES+GH0DRY3B+7WukRQmpRpTXH3J5kO7We86R6ya3lN22l/fNZpuw+ZOFYdh9jZwh7MQHZIE2zxt9TeEkGB+kDzaJPqHqH/nbVxHu/jU6TaVYWHVdsdfdYsViw4/fYAn6ozVohqDFJEAZJOXiEQ2K5KfiG9PSJs1V33d5mmGVy1wRsgYZzmhhWLppt11V5OVDC1jN7igy9FZ/71JSJW+04ZSBtxPzMhQau/Qly66pBUYTc/GjFFHCKLN4ApmAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GciZW9ECljd9rNpwA8gaFSi7EI+SgMi2NmfDY0Gfoqg=;
 b=rTpKYcjfodEl3YU0RQPCd5nD4tMQRs41JlXkWxTikULsjto3m0iXcRFd0+2zjI4P1Df3IwH/1uC0dPwSxskrdPzr58LZ7ddOgBBG0w9dMeoqDE9/nNU0+3fQLdHReFYMJyNUaC19fH/deec0H5cUtwZPQDc/C6799jmmHSuGVO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 3/3] tools/libxl: Add support for Viridian stimer direct mode
Date: Fri,  4 Sep 2026 15:15:16 +0100
Message-ID: <20260904141516.367862-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904141516.367862-1-ross.lagerwall@citrix.com>
References: <20260904141516.367862-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0267.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::7) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MW5PR03MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d69cbc8-9a61-4394-ad48-08df0a8eff13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	I6suOUyqFOknWpI3ZlKXQoMp3ZcVewiVLvSW/7goqnIwbwSraP8s2+JR0sI1YFOpzvb0nuKcUIkzfzG6+bkvPo/lmphmKKeQtzOTNCqLBK+VuCtlyMe+Wn7Hw4IoqjxacP+BMLBsH/U0kUcsnvx1SKOrAmvX3qWSnyJUCT+jTaUuvRrrF5SHASPhIkpQz7I5mN0gt2oNlJ0InqbknbRj/+m1/Jt5brq6MfF2y2QU12eSi1qt62nRI+5wRLsiKnbCcjU2RjN8wfZYa2/gxA+hnq1+ivUnA5vBukBuF7iPvRLkxjUjaZZV1lcl3gcCOpOPt/0UZQkE8Nb5HOIajRB7C+DF1tmL1z+pdckQcJdAhUin/h+6UAzOMAauCbCQg5SmPozvGsW1NVH4aSpZyaTt8p6+W2RC/rQqJ5C9XCfuuqxw37JSdLJ9UicdHWEhW36/t38w4zZ8kGHlZOAWPRX9eSV+S7oGxSl069bngiwbURZZM6Q3kEpr4vLknFS5OQY9HTcljtgVAQNexAyQ0aQSf9cTATgCulsEVSWoZvV4QEMvEPn3KLdJhSf6o5iCT89QvcYuliM7xtA8Qg4gzaLEVJ1AGuhmocrZ6K+PFJppfu3jLoqaS6n5OW6TCSp02KhkwWwdvpC/Kj/FfovM/21i3MspQDIazkkkQLfNcCmuZRg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sY4ZbLdxQX8y5zbqxrX+9gWg2qK3l2UNxkzrEwtn6keUSMpHJeNA7mHwsEjf?=
 =?us-ascii?Q?fBi5Rpdr5FUi4WMkBxxeN2tsUk2VtFKzkz6UOuRRlyO/QgkseoJC7EQIwZh2?=
 =?us-ascii?Q?XlfzX/+K+HM7AWczy8XC7StYYlYXcpYTMATCJJ3CELeb1HddFOBUgZFu/Cs1?=
 =?us-ascii?Q?Cg11mq4C2V1HUg+jOeVjo65dZpiQ/tJ9eJAE3ex4rHPiB7kTvSO7Hi/xru2I?=
 =?us-ascii?Q?cn1edphUXKS/6NuGB3V5d1ETmpL57QaTn2purqQ2xBeMpEz5YEh4oE5y97QX?=
 =?us-ascii?Q?SQh01wxnseIaKszgipV1G8TAX8q9gquRkxwRGCr38hP4L/wIzour1ZX17PGH?=
 =?us-ascii?Q?AEeZba5PQ4QrsobHNpN3q7mt26mblaunOhwLlq0lYVNNzunRZD91G4rqEs0R?=
 =?us-ascii?Q?OvLxIq3l1M47f9LqPH4l5lbIGLpGTDExdG54pqOaF/HdrUPqo5AOQ7qNBvr1?=
 =?us-ascii?Q?VT9fSeiaigWWZQCvkQ3XeUIBd5wEUG0snztm2cu3RZ2e3mwOe0VIXjype/AF?=
 =?us-ascii?Q?X0S0FYwMEqolMDIP6bRHg+5p4EseJ5qqlJfJI9/SCIpz5wg6qiyLXqOyNagA?=
 =?us-ascii?Q?uNzrRmHcStgN8tflM82m/q1s6FSf1imPtZ4o7eMBvBgETjN5LCJK4cdo+FfE?=
 =?us-ascii?Q?MCiEVEHTSAc3OMQz1liLLk5/KC9s1w+4O2XAK6/4ixsDiLhtzQCmWa53Wfy6?=
 =?us-ascii?Q?N+I7+gJGbXhueJdSF0fVPiJmmxu8Wpu4e0vLRVXkVPN/q7JSgzT4e0FwkyWd?=
 =?us-ascii?Q?YJJoHBbNN0EgacGtdxlLkWkrV7kx4WlaospdnLhAgooMyBF0NwcnOn2FNOa+?=
 =?us-ascii?Q?orqWQlckyu0C4fH4w/szEI8FkNdb9u8981n6q0DKKT+E6cYnWZjPDnTkznao?=
 =?us-ascii?Q?bXkPSthttGvEwKQ5TK8vXn5Ux3ghgQLMJU6ldLtuytek7reyHFmPYHy2eUDq?=
 =?us-ascii?Q?5gfGM4XpUVNQMPij1BN0R5qm6dCRf2GxID1DwTcHl6yoxhf8rWjbdCwF2PAt?=
 =?us-ascii?Q?3nSQ1gw/asvskr8ojqm77P8Jev22qm8zCypa9E7KaHVrn+Dxt0o11SGbMN+R?=
 =?us-ascii?Q?TupbeYBU57sg2GJ8lfgGPATzDBDXD0UoDygFes9yv0eFj2yrnOYhW34CsQXM?=
 =?us-ascii?Q?j7fyoh5WGfvMUMggamt9Eb7Px2YdfZUg+Q6/6fBgdpPhVT6tWaQt79+GkLv0?=
 =?us-ascii?Q?sNSWaFTLHR1RIqpAsOUwh83zJduCrk8yFebbSV3ykHrhwuAxigvrHg3QQZ01?=
 =?us-ascii?Q?3sRLrXXBDmDNfeu+sPKM2T/fAK6l+bUelEEXh2AE59MdszRxKlMIrxhFh3bM?=
 =?us-ascii?Q?DdZvj6EgjGzf6j5igqhKPv8gVv/RDYzvi/R75e7ZnxeM/+7Ps5XwGrB//fh8?=
 =?us-ascii?Q?todO1y3IiTfGIIstcmcTSUZ7bNmhZy1D1qQG1hGplGfWJadnKEgoEwaSqdNt?=
 =?us-ascii?Q?Ib9l8lVL6UAFKjrTZrac73+pIdpJNFsp4hrI5m4GrrC9qtjF1O7xkoBV6BzN?=
 =?us-ascii?Q?F3C1P80jujJZDNow6RLytVS5T6IXj09M32rhazYdSyBs1kX62ELFnlmjOEXP?=
 =?us-ascii?Q?o85FgQmUXiiLtI8AGDWV5M9qWqFEIqCqvzFbz0UXdrhdzXuVYXH7F+E/epDQ?=
 =?us-ascii?Q?4SF1sHm0Qm/X9lORsGeQ/zQqolAlabgrOIOp6uFJZed9SgNkbbyRvKN33V1i?=
 =?us-ascii?Q?VHeQWcQOxDilL86O24R7hBufVTKXUFjz/CtNKZZFGKQT3Wnp2XDFMSzd/WWS?=
 =?us-ascii?Q?UvVrzhar46C63a41mhkKdIRPHqqDyQA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d69cbc8-9a61-4394-ad48-08df0a8eff13
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:15:39.1659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnX0NFx4INzq+0W5qC7bVJhHN1u41UBzmY8kttV7SVTqpMS/REkJohNxexk0Tvt5iEYoYcXqje9FuEE7nQ7wORy2hErncyAJWyeV9vIY0b4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6957
X-purgate-ID: tlsNG-4011c0/1788531346-58FC6CFC-D793F6DE/0/0
X-purgate-type: clean
X-purgate-size: 2779

Add support to libxl for using the stimer enlightenments in direct mode.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

New in v2, since the new Viridian flag was added.

 docs/man/xl.cfg.5.pod.in         | 5 +++++
 tools/include/libxl.h            | 6 ++++++
 tools/libs/light/libxl_types.idl | 1 +
 tools/libs/light/libxl_x86.c     | 5 +++++
 4 files changed, 17 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index d34951edb98d..784e926c9990 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2496,6 +2496,11 @@ ticks and hence enabling this group will ensure that ticks will be
 consistent with use of an enlightened time source (B<time_ref_count> or
 B<reference_tsc>).
 
+=item B<stimer>
+
+This set is the same as the B<stimer> set but additionally supports
+using synthetic timers in direct mode.
+
 =item B<hcall_ipi>
 
 This set incorporates use of a hypercall for interprocessor interrupts.
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 7c098edab663..5475530a5002 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -381,6 +381,12 @@
  */
 #define LIBXL_HAVE_VIRIDIAN_HCALL_IPI 1
 
+/*
+ * LIBXL_HAVE_VIRIDIAN_STIMER_DIRECT indicates that the 'stimer_direct' value
+ * is present in the viridian enlightenment enumeration.
+ */
+#define LIBXL_HAVE_VIRIDIAN_STIMER_DIRECT 1
+
 /*
  * LIBXL_HAVE_BUILDINFO_HVM_ACPI_LAPTOP_SLATE indicates that
  * libxl_domain_build_info has the u.hvm.acpi_laptop_slate field.
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index a7893460f013..95075f04fe45 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -260,6 +260,7 @@ libxl_viridian_enlightenment = Enumeration("viridian_enlightenment", [
     (10, "ex_processor_masks"),
     (11, "no_vp_limit"),
     (12, "cpu_hotplug"),
+    (13, "stimer_direct"),
     ])
 
 libxl_hdtype = Enumeration("hdtype", [
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 60d4e8661c93..9e8b48372d63 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -389,6 +389,11 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
     if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CPU_HOTPLUG))
         mask |= HVMPV_cpu_hotplug;
 
+    if (libxl_bitmap_test(&enlightenments,
+                          LIBXL_VIRIDIAN_ENLIGHTENMENT_STIMER_DIRECT))
+        mask |= HVMPV_time_ref_count | HVMPV_synic | HVMPV_stimer |
+                HVMPV_stimer_direct;
+
     if (mask != 0 &&
         xc_hvm_param_set(CTX->xch,
                          domid,
-- 
2.53.0


