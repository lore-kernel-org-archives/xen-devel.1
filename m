Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9092C88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:13:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416070.1645249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xK4-0008Vi-6r; Fri, 11 Sep 2026 09:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416070.1645249; Fri, 11 Sep 2026 09:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xK4-0008Vb-3T; Fri, 11 Sep 2026 09:13:28 +0000
Received: by outflank-mailman (input) for mailman id 1416070;
 Fri, 11 Sep 2026 09:13:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x4xK2-0008Sx-KD
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:13:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xK2-008eKE-0d
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:13:26 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa3c628-8faa-0a2a0a5109dd-0a2a4501c7c8-44
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:13:26 +0200
Received: from [52.101.193.13]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa3c634-5984-0a2a45010019-3465c10daf7b-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:13:25 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA0PR03MB5548.namprd03.prod.outlook.com (2603:10b6:806:c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 09:13:23 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:13:23 +0000
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
 b=gqdm9P1wzkv1DtYZ6Kk0OZTv7rKWdaSBsyos6Y29JQyqKuTKtDKGx5QTsBzvGPNpZ8qPwI17CoTM28Zq/YUCksBOjpptaVbwfp//5CQFId6Suit6bHr0/UjHhkUTyGMkUAntzieKg6NU6iLELmdn+bAMWctjihZwG6nMH5WKU1PWCZYZzCoW+NIH6F2wi8u2WkZSJ/OFG8b6qSoAxpAWNkhcWErUTIx5VnFn5qFmKwW9XNV2mcLXoyFTcHVpkvS534ETdkkeGhGmuBrunh/EvGVFOI3dqwXdy/HvzvSIXPwsYSTVwxeLIGKoGCOK/jouPsVpEWzcaksJuJB3wShAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEiaB5ZRgIvBm1/l1Np+Vw8BCS5ijucJq0EQQr6Ip8s=;
 b=rOKcfTFXKyA1oyF5G15hczL6cAI6NYw4JrEZ/vjAUDCsxRkD6pDcJSrv5f/OieeCuxkrrNiZqddkdzR/oub6UupQljwdVWfFgsrY5v7anHLb4z2ZHFukXL/8baMx38JXOvhf5vWyk1hTp2POGaIca6Yt+MdDv04edTtDWtDNFJBaQ/w/WSD/k4g8uBiDI2hPBFFWAclgic0yMVbeOSaDhjpNsw0rdWAL7AK15jT35j27++3k3o3BTJ0w+O01dXVdqouiGY6MqCksz9IEqG72lau6hxjs6QQDIqiLSC+MfI3V2oc+GZhAL40D2FyY/xoiCNPcJz8H0pxlx5wD+cYWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEiaB5ZRgIvBm1/l1Np+Vw8BCS5ijucJq0EQQr6Ip8s=;
 b=gJizNfonE+FJACvaz9ZM78GqQ6rDhaFl6C8hr9HRtrEsYQpBvRcx8iu/ZlM7CJRNml/YRM1xJiaFyrM3HAPoIdp0ZgXMk4UhPQKDU2adB/BlqF1GZ7nqowOJEKPG8r5Epp/xEIoaHiMxpvdqoBtkNdx2aHgRRjEDloiQVYWp9cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 3/3] tools/libxl: Add support for Viridian stimer direct mode
Date: Fri, 11 Sep 2026 10:12:44 +0100
Message-ID: <20260911091244.1165516-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911091244.1165516-1-ross.lagerwall@citrix.com>
References: <20260911091244.1165516-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0421.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::12) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA0PR03MB5548:EE_
X-MS-Office365-Filtering-Correlation-Id: 517c9659-8162-43bc-91ec-08df0fe4ede4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6aJQioBvbO0Mf8e0EyK66hEPHm+KMLqanIxRzZ4T0W9vWRnyuhXbTx9sLziM5mIijcA3aQMRbOUuZrdoUZpAPUUgCK/MGjgsM8mkzw2rScbGwvFgxYJqo6oUBuRxcV1m0Gg7Y/vIkeGF0XLmoT3c5GCd+9HjGSQnSFgzH0VFkkYCiJzrT+lIbH61a20nJ4ey0ycp7VMIs3UQosxjD9DXCxWmkhY7Nb/XFOLEAI1LU0YybRZRv2PU2ipjKY2Ri0/03NYKf/JGCNwAX3LvEAgQG4rfRGPMjMsEA5gvdgd+Djz+DS3GgCueRUkwVIDp/DvMlF7LaOY+GyZ5NkvM6t3FP+Sm9l5NtIag7XwjSSpQIuJchGHYY05F8lhjSZ+nFZvYHlqaebveRvtInZWameHXfdIc/WiwmzL8CzVFbbpZKXdLLaPMqufxuA1FqyyfRw9/rq4vKDwoicrP7mIXKhdOjDXm/pK2a0t1h0rQXIGDEI9C/AIJBjAZ08vUx6lT/TjY81+sF/Z0yXnUfjO67bktCfnVxLbt9/8A1Oi8qWdbUmZxiKhOYItWw4IqeweTCoLbZWFfInFnVbbcf5GxHgVMBJ/dM1icBFytQEmYgC+rX1vUvYzCjKOfVkFtNGhI1AQMk7wVKGk7he7IFgnFaQIRq2xikT7DcAJm7ctouXpH+fs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K32RK+2PmpFC9Pv8zgqgVF1eSfRDF0Kq12NgLajHXr4a6xW5xx+5512O+wZQ?=
 =?us-ascii?Q?Sm5fFueekNLIKP3XbJXblez4UxRKoqK0/Mopmn8nb5E19qRF81ngusc9vySl?=
 =?us-ascii?Q?SGMaFgR70ty2yJhXgj5F/4kQzONxmwh+RheMwuDdWbO2FA/8OVk9wj3upfv+?=
 =?us-ascii?Q?IEsRgo9mK3oI95y0frjWxk79Ba9Zdeu1u9GWfj2HPpsQVD2mUTwaMP7ZnU2g?=
 =?us-ascii?Q?HYOO/a/29nZ+65RZKErnSenlmwghn/FgtQfyKFZqRhQHTU8nNOaO/tnJWzgw?=
 =?us-ascii?Q?2BXJNOWhdfZTNckSUQEKsu3RlEd05BUYPgjm4WmKmVDMkXArMUVJS9AFnXeH?=
 =?us-ascii?Q?XQb9O0ktdbsEnHA7P5p6TdiChV/roU+Fbop5CANKTKlUwiotSBwTZuawG/dG?=
 =?us-ascii?Q?zMxAkRi6jmKyOoAGI80kk9nLDt45h5ACcVEC+3gtHLDm9Jwe1wSmwug/9nDW?=
 =?us-ascii?Q?qPzCjTS8ZnU1no+VeC+vqi7w7XjS4nwn8QAk9WNefbdEinhEYjrHXdkvu+TL?=
 =?us-ascii?Q?wEEESmNlGlZ3n9euB3cWhFxSywGBO51RUao4dmIjSTIj9F/SZS0ylR3FbrpL?=
 =?us-ascii?Q?qa53Cnby8ua2/S27jEHnc47UQHyp4XQHXEt/vSIl5HdxRIxqTsSYK8mVTUMc?=
 =?us-ascii?Q?xOGS7WFtK9aU6NnJEVfqtGhS4OU1Q2ijEWzE3RglPdtNmPf2W5MTk9U2dUhF?=
 =?us-ascii?Q?sI453GHojZGSRsMOIncin+vBs4rFIGoIycvhE0MUuV7HCoMafgwRWxsq2wYq?=
 =?us-ascii?Q?Cs4JhNsi+NYsCt0AuEqsGR4X2CKU/rDYdusnMNYVTJuyADqyUdRAmjxINtKC?=
 =?us-ascii?Q?89TsxtUVt+bvOE15aOIkOI3hc0INO6PcRGxGVLa/v1M9no9qU9kUuq58B93W?=
 =?us-ascii?Q?g9iDDl6J8QH5oPKfYiPVVyleXJqulA4KaMO9lXx8Lt+akSn1g5vfK1EkjNvQ?=
 =?us-ascii?Q?2OC9ug1/JZGYUWwk4CPfLOQTc7CKWA9hRT7h31fO3qPn/1ZsKas4KmC5RQff?=
 =?us-ascii?Q?mN2C+/LIrsp28QQ99ZCNGr2UffQSEZ3sN6Jgz8XNQLndaBdrXG27x1c/vYD4?=
 =?us-ascii?Q?/AVF5XbM8DvZsJS/uUIhl99drXTpToro9oLd7ZDtsjMhXyoSGRB42QTCh/xC?=
 =?us-ascii?Q?ZILSYSz72YAI1xwdt4SOxNtN59VYs+DKkgYyT1gSnAC6QrYegTZOuYa9Ekgi?=
 =?us-ascii?Q?lULHQ5vBhEHwvfUsjVjE4L/8DEfqREUiA1VZPhB7wzRzBs9FdQckraaVGLX3?=
 =?us-ascii?Q?WluYGCc0I7PXVTmkxhLGn2FOXrQQ1FNU0Jn9FMdr8mdwhwSJv4Epiq55asi2?=
 =?us-ascii?Q?lyKv5s4jQkulDdpUHT/G7sk5OibAh3JdpFzY5Xx3/sZnsEeAhPfA3QR5mEXm?=
 =?us-ascii?Q?iHLI5Nir8UtGJRh35eMd0XAZFji6n9z9+aacr1awmvf/l78pU93cRzVVvXH+?=
 =?us-ascii?Q?VeX0xSwkep38NMpEMLecskk8fFRd0EnJ1G5PXBwQG+5fLPpYcmyYSIAm/YdC?=
 =?us-ascii?Q?upymSUaujHkyOFcXcx2l7aUsby9Le2fkfRySWKBetP+vmE5VrRYqOAW7UTSE?=
 =?us-ascii?Q?IFyiaxXPbhdTNJLQQVQWSILkD2k1kLSXYvI4dYF5dwyE328gNS924R88ONPV?=
 =?us-ascii?Q?QvP+KtKgbCug9qq0F5y+RlYxU09jAjkt7lQxZguS6JinFXTpYizKhmQTze4h?=
 =?us-ascii?Q?Ka9/lJcu4+lqkrWFQynIvTxAPBJanqkvw/ZBHpPzRhvgp6u40l1/uf0Yx2l1?=
 =?us-ascii?Q?riF7JZj2HzEuHVoe5Ow8bL90ZhBvNss=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517c9659-8162-43bc-91ec-08df0fe4ede4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:13:23.2831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wc4/uyzeVu9owGBVPyscqOVLJg2Tg7CqePmh8ebwHy357vUJMejXt6ZrXJ7pFLNVqIGqoN3UnsAEN21N6xsL4VX6oefL6JLGvujw2mkSwdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5548
X-purgate-ID: tlsNG-d62444/1789118005-BEC61757-1BEB8274/0/0
X-purgate-type: clean
X-purgate-size: 2760

Add support to libxl for using the stimer enlightenments in direct mode.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v3: Fix typo in docs

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
2.53.0


