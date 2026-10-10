Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47863CA6017
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:15:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444979.1661480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU6a-0002Rp-HZ; Sat, 10 Oct 2026 10:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444979.1661480; Sat, 10 Oct 2026 10:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU6a-0002Re-E1; Sat, 10 Oct 2026 10:15:04 +0000
Received: by outflank-mailman (input) for mailman id 1444979;
 Sat, 10 Oct 2026 10:15:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU6Z-0002R2-Ok
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:15:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU6Z-000Nv5-5f
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:15:03 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca101f-2eae-0a2a0a5409dd-0a2a45059e2c-6
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:15:03 +0200
Received: from [52.101.56.19]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca1025-4cb1-0a2a45050019-346538139170-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:15:02 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by CO1PR03MB7916.namprd03.prod.outlook.com (2603:10b6:303:276::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sat, 10 Oct
 2026 10:14:59 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:14:59 +0000
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
 b=YBtZu5u9peWF/SJp77kuhJ7eaLrvcNkyj9Xm/bcRMcuLAnrUHCSKKJ0YqIk+U+BJoGsD7JuBRbMV8YuLLX6oJ4FQTysLe1bRtQBeaQ5Zvi5EbS+ASmhXOUMTsounolOoFodMQQKb5aKAjglzV25p9ULKXbTnkVyPHl0qwyxRkr1e02IjoZKW6hZRSXRAMUefbaUFYpl7MHA7XvrMGDL1dsDuDV0KiRKpX2dJ0sGy1ciDnPyAE87kLFpMXkDJ5tLxogn8nV8IMbIK/IjdKQ7N+ad2mbdeI5hy9jwcGXb0xrCy4soydis3h0j9Wf8RRd8hVPCY6PJB8cq2HxNplno7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWE20jPhPc/AOUVQe2SDwtuiBVTKCXXIz1GSqI7YLy4=;
 b=wAhLc4FRytIDa8v7o4oRzz9YGnUIENhPg77kWX4AOc6miQQCnp+z4g8sf3q4FO+APkhHy06Xn2uQAtrz0R+hh6nyEre4CoJsgN9gY3NeAkZHf/9Yy/YGD55uR1wZuJ8mlBJSph4GtaoQsSxlgHyAPkdyYTqx9jA3ZcAECq0R0TSMqEG97F0kJ4G/m8pBaVKnp8W6uBu/c8nTlF0UAWMusUOtf2XEArRGy6vzRAt/UlG6CX29nD2w+2vV+EpdXiASX5VrqreJQ8ZXNW0Mu6WmMVjgIXEMgatCY11N9OJBXHy2xuE1JNESUyg9S5dU6WQnhSegV6RVDXzVFjtqVbs1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWE20jPhPc/AOUVQe2SDwtuiBVTKCXXIz1GSqI7YLy4=;
 b=CwUWqfqw3yo+t5jQYWYRjv4sGK/AoZLSAbngai7dv32D0Gw+Ao1F5txzzq17jykz+HYL1AqC2Ggs1APdVAIqtseSNRt3ecX9BdqIWQ5sCKC+achGFyejIPbV343popcMJDOUmOOqGzTkz8BRlX8CI7w4wKtSyO4jgZo/lTfd8IU=
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
Subject: [PATCH v2 05/13] tools/libxl: Add support for Viridian stimer direct mode
Date: Sat, 10 Oct 2026 18:13:18 +0800
Message-Id: <6e26064971c8c4a4a5edbceae0b536e60fdb02fe.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To CH2PR03MB5320.namprd03.prod.outlook.com (2603:10b6:610:9a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|CO1PR03MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 1331e807-fd5d-4d06-ad31-08df26b75711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|18002099003|22082099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	hzBgj1iQ4Bl1Y7Z5TXkIpb0it2kmU6vD4MDKPZX5/L1APGgkO9Lbp8v7jM6hcAH8HFKqHs38PPK1bu2JIkMZuXLQZQ7ikYpZ3MurERO1C4aDA0d5GxVjxrLwm/w09Jb0caIh6SbAOKD8GxEpsoZ52I/zlsP6pR3TFQ6DqnU6EQvVr6lw7LPQIdjjEgj5D4tVLMBMUfJ3yq5KcegnoIx7MmuPxpWKk1XMGSwRQqT2JfU8e1ja9bVq1mnwDSnp2XAkSOb2cRWhHnxtX6B7SkmBLRJ//8PWdn3nIzuY9KzVKpYO5ieoABW39vpAozg6whSZEEDf/RdYyPxrV2X5bQy0Bl7WU3uIgLLrQnP/JNBXrfauzXoAS/79f5MDGudQwUJnkl/Rvddv6+ZSPCOZDItcvA8DsS8Jzj72hH6y4M23bsgjzty5Fv4BHjoYuz4Hmn3yztz7bIJzus5K6tZp8YiUAP0MOcb6LYvgqrQOB4qb1TrDTtjn8U3LzyNUNG+JeX4HSXOk59Leg2xsoOwgXw/pjIe0qYTKJib0bfjkQF/Oe7LOAhluaSB4I5/+eJtzfkOfCWQ3vVHCTgb1c5chRaPXyhNRWeZG8hWDx5duGJJPhnBo8aPj/QCzOO3nDPXyfu/yOSIh9yxaiqpXrSqX5MNP88t7u2X6/axsxBv9ABk84ng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AkQiHMpqxPkK2vR2EAZ7viNvdc/oYCDansvmYOz1OzRuIQPSY7q2kJ925JKl?=
 =?us-ascii?Q?TUKHCR8hKe0mIggYJacqEN0sPhR+3gtdlu7wwNAy4m+bd+3Wudq62IWEcZu4?=
 =?us-ascii?Q?q/ReaKzDGIM0CgfCIdA/6/kUkp2YjGFB33kEXZaDOoHWcSdTFHS/l/8cSfio?=
 =?us-ascii?Q?qx+KRoZVWp8BsI1bgWWQ8jnz5uS6601n1nXF81h7PPjPRUs5sekUEeBiEnN9?=
 =?us-ascii?Q?Mjled7R1S9DFPW13WkG329SLAJJiaCZ7Jkvf90maWYtQQlyNbm5T/eWOCv2n?=
 =?us-ascii?Q?oP5G5s29MIM+1DXSz3AgG6BTRecMjEUlfDFN6ixPrBKRD0cjFHImc/fsIDTi?=
 =?us-ascii?Q?h4eP0iO3rrCZFHciJSvFMvlOTg8cd2vueqOZDkwyStL7qTvj/35LF3cfRXrU?=
 =?us-ascii?Q?SSP1C0NDPdlwePwf7ZBgn0OUxaU/X/Ji0SQlPLo6ZqieBHZJtDZexuA4TY7z?=
 =?us-ascii?Q?7UMIMak5G3kIWzBftSO5T3XjuyxIsA20XZaFpr/e8LvRoZ0ZyvyzS7eo7H8r?=
 =?us-ascii?Q?JlDdS7nkXDZDN48CidGzzbTulFL0YrVSajWfera6l07HyBOXPgdfwqUEWcv/?=
 =?us-ascii?Q?/Eo9O2UWcAUQmc28yD6xg9XVxDjFYP2LRVPcKWvHhqwiJhcoYvzIc+wcbN8D?=
 =?us-ascii?Q?kEUOTDNiaJxYF2JN6vL4JbkxL+wrHyiFcDYYMbOZByZm8Bduer/vi05T/ae+?=
 =?us-ascii?Q?LyYcLJuLdXeZIVcCbbv1RnWfWINTCmA+V/NUzZ5oK6DABXAy2rF/ulhwW9Hp?=
 =?us-ascii?Q?QKAbsj/sJr8qdv8EBtHRJwm5qMgz9Nixt4kj35ZubnzP6RnOQYPpYhOEzGu/?=
 =?us-ascii?Q?j5oeL+xT7XOWLf9V9WNwKTe1yAdsZ73EUpi25j1dWJFoAPNnL4l7OuMPAMsU?=
 =?us-ascii?Q?q4VLwFiR3CKYKU3dfbcX4sdZGRFT9g//gJYfNMZS7GnMxLOdmDiwxR1NeWMr?=
 =?us-ascii?Q?lYkTJ0CHynvoifwqkYuWiFlhqqArgBp9wHWwHxIvfsPOXDfWJ0sThJ2CXukl?=
 =?us-ascii?Q?sT8BFzRsJfyU1DMPav+lEZQldJqxjU1Ner3nb/eIvybUfBZ6gfISabhQaUVD?=
 =?us-ascii?Q?3PElER0CRIESd7mKu0gGyz2bdCrkXg3Ga2ZaH9Lt56jJUDGBdHuVa8Oyrarh?=
 =?us-ascii?Q?EzW4Absfef0x+tWYuRdIkALcC9qy2WONxWmKTLT7U9xjU8psLwOXbKjxV2rR?=
 =?us-ascii?Q?d22KWQHdd+O6buThuWNvY3v4uX2OX6ukeVCyOgdth2V02i9vGv0BRRpHIyMy?=
 =?us-ascii?Q?MrOL+61EnLSkwE3RpaqyVN5coRl1xz9aDc2L1wpjFPrLHpIU4VKEFpsSa/SE?=
 =?us-ascii?Q?n7cN3o3GIb8nXJlbobzNihCiXeT7PzBryVnkaGl+HRRAaRd0F5ErsRsv0Mic?=
 =?us-ascii?Q?idOhmKtlBTVB9ZUs+ZGxfBGx7SBtTDlW5o+IUQY7eaMPM5IsERby497ocOJ1?=
 =?us-ascii?Q?t5OpHmL+eA0t9u4dKauZj8mOhM+tp4MbXZ6XUeHa2UWm7GJWiVPPg+IN60mi?=
 =?us-ascii?Q?Rlify3FeFQlgp+aO3eAnxJpYyibL9V+oHxVVw0JrKLjSkUlGjMjmOalaCi/e?=
 =?us-ascii?Q?4pQQjoGn+nWGcltcdMJ252QQgQbJ4f/l418ZDqxZMOuC5IMOGue0P2IsOhlZ?=
 =?us-ascii?Q?vDNIsvgeZtcWA2aPBF6OAJpuaVDVeUEvWjakhkwAJZHg5jQxWufEwUbLr/L/?=
 =?us-ascii?Q?s/4fcgVIKWxTkPfz2YB7sPHG00xyTVZxSEPp5jCkdbkfugKpJiYgkq/XyipI?=
 =?us-ascii?Q?CapiwHjV5w=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1331e807-fd5d-4d06-ad31-08df26b75711
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:14:59.5726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9k1E8bCXsM2PLxR6vFMSU7JNE07T+GAyrYKa42UNuQ2iaOPNd8aq/qbT3s43EgPBsKha6kfgXN6hsM7RjVNXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7916
X-purgate-ID: tlsNG-c201ff/1791627303-6BEB92A1-05CFADAB/0/0
X-purgate-type: clean
X-purgate-size: 2783

From: Ross Lagerwall <ross.lagerwall@citrix.com>

Add support to libxl for using the stimer enlightenments in direct mode.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 docs/man/xl.cfg.5.pod.in         | 5 +++++
 tools/include/libxl.h            | 6 ++++++
 tools/libs/light/libxl_types.idl | 1 +
 tools/libs/light/libxl_x86.c     | 5 +++++
 4 files changed, 17 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index d34951edb98d..30c401588fef 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2496,6 +2496,11 @@ ticks and hence enabling this group will ensure that ticks will be
 consistent with use of an enlightened time source (B<time_ref_count> or
 B<reference_tsc>).
 
+=item B<stimer_direct>
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
2.34.1


