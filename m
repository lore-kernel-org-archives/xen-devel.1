Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B08C88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 09:13:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416068.1645241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xJw-00089s-TC; Fri, 11 Sep 2026 09:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416068.1645241; Fri, 11 Sep 2026 09:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4xJw-00089l-QM; Fri, 11 Sep 2026 09:13:20 +0000
Received: by outflank-mailman (input) for mailman id 1416068;
 Fri, 11 Sep 2026 09:13:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x4xJv-00088z-Rf
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:13:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4xJv-00AssA-7x
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:13:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa3c62a-bab6-0a2a0a5309dd-0a2a450ba2d8-18
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:13:19 +0200
Received: from [40.93.195.12]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aa3c62d-b7e8-0a2a450b0019-285dc30cfd72-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 11:13:19 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SA0PR03MB5548.namprd03.prod.outlook.com (2603:10b6:806:c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 09:13:16 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:13:16 +0000
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
 b=S9hJJF7rGVqZ9JjUrTGIAeQCaSpL1EZAtzj0IxN8T4o2YDk/TOxXBvbzlciStAfk1AvsYR6YiEKDc/tBBJZ1i37CcYjI4ud+0AzkftWcSc09lekAs44rO3hsUBjhEqgu9uoGji5RqB32d+/scVsS+pXzrHeyh636Xhfuux2eqq265yXTDCoBfgmXofuwyJ/Q3Q6NF0wYmrBpZy21Z1EBI9B1j+U93ccLp/6Jiv9QZ6NT3hZQdZpZjH87tJxzJLHNl6BSgjDrNGDUhiyjd1o+z39RHVfMfSlpdZac71QMQgRIViBartdF/N1jA/syg5lCqiZkNqyDEgTyOXtwS30OsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYKIlUdhkoJoNa0kISGZ4/ZymHnUZqUNnA5Zqk/4p2s=;
 b=gSnlytOKqzoOaLmj/Q/ik2y2VFCw8skCSrdqKRIwbqPMXDO550NTXbOU4YCtZY1dQIvjnW21OQmCWw58T7QuKRCUVmyFGzy881H7+SLTIWnMjEUDwOZqaON4rrDAKKODrJa0U0x4aaWdsah+rdDoKpfG/DHmGXIQXxPoxqQcK/A8rzYU0J5/8gL6kcCr0WtW1MNj/mAMf6tFKbVgWu65xravKX09Uas9Yd4KtGry1OqXXsOfhUgidS5wCs00VnWmz6FTmCIQeM0tGy5r6IdBGwJNQ24+YJWdFAXiz1tXx2p77HXE+4sSh1RdrzjZ1pQmdHbNSMkhGK7l5PviDPyxCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYKIlUdhkoJoNa0kISGZ4/ZymHnUZqUNnA5Zqk/4p2s=;
 b=wW2lFbQFv5JLzSns61xc29i4G3QgAGCtx02IkadLTO5nYvqZ6njat7xpkWPyhx2KwgA17WcFcTCq7f5cdutYD3D2dWcKRjNKgMo5EyuGExY5PAOx4AoNaq4q7iwdFSmc/MqkWKahXUsZ7eivb/Gi7DWPV/f6eneGUijtac0T0+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/3] x86/viridian: Implement synthetic timer direct mode
Date: Fri, 11 Sep 2026 10:12:43 +0100
Message-ID: <20260911091244.1165516-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911091244.1165516-1-ross.lagerwall@citrix.com>
References: <20260911091244.1165516-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0284.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::22) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SA0PR03MB5548:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d33197b-9631-4823-359e-08df0fe4ea16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BiPyTTITRFDepBqf/ARiPHDOfPg5WTuNDtrwyTAP8lxw6Et5tz53nLhsagHfGs+CuqfsPwE0hIe510ThhovwesOOY0DHEnlun1IZuRmcaJIB9N51DABM8ecuFUQw2cITLcFj1xsz3nZ3NtGZfoPqtV2tAyg3v8ysBCi3g/G0bZc9JJ1j1ABGMzYJmBmoFxMWCHSHVaVe/xIwEiZgN00E5h+9+1Suv1qRFx5MRzziQ+xRSKlUP5u0v3foMpPvQIpbn5Zc5PR1fsFxB8vNnSwio9CtwslyUugXW2g8AFJRdBJWAB5SBPJY8ozAt+od/OxGaIw3CCHCU9HI2ZhGadfQVhtq+CE2kJWV8dpiXkJwJr6uw7dW4D+q7yy91UZbGc53H7U2w35md0Yy5FTeeUFW8F7pDK3YUj+104IV3zbt+RfMYeLP52x2bkrPiD9hrPgeMqEfxHzK95A/Mdaooyvy1H/nA/nDbq//MQh8o/0xhAFhjYEm8Lea1GrhM+gC0/oW+BFrx66i0hM6s5uE2ycO4k4B02SAVaQfJAxBM9yzFCE0agf2zq39KOySvN9TkmeUBFZ4YIKO/2iaiGbsnKzc2Y6L8ANT2wKGzmIz6OsKU7DTxGz+dfQabFMA4IPxvxYw3ygW3/ZIeeYbqp8oEdIz0gSl0KEdjLGTGxG6bbDsZnE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hc1RMrP9UHzqUAHp05fnUhOS2clpRPOOmleKmBSwkW0U2DGzOOynkWUg3Nml?=
 =?us-ascii?Q?IzazbaSq0E5C0UbzSu0qQhX2Xpwz3KssxK3CgaEHr5EKnyTiwXhTnTFqHO/y?=
 =?us-ascii?Q?NQhY0OhVtsWwDF5cEd5ozpzWyx71TYVyhoHs7a2PGift8096WwMnamqEBST5?=
 =?us-ascii?Q?MfMprcedZN3JvaKMw7vxJvQFmtQ1MWg7BVKNk6ktl/+uPUPt94UikwC/84Eb?=
 =?us-ascii?Q?913GA1IvQzM0FxqNmdNTk/Rh1GRWuZgIDQgsCExxOs/Qfp7hpPJ9mJrbdPlk?=
 =?us-ascii?Q?lreRrz2W3loABDpwnl7k/RyOMwxdiVfJkl1NlupEQJngUNOlsPoy7ovr1yEq?=
 =?us-ascii?Q?KNJwssmREJSCmZKfV3K3oQYXpfyDQc+Y7Mq6vyu+7ny6u74k0pPasl1fldtm?=
 =?us-ascii?Q?VlFM/e2yBeFnJ6X65rfzcExp80dTlOBS1EtW3nKAbFRAACez+xFf2MExpXx6?=
 =?us-ascii?Q?T/4pG1DDZWIpdNFqiAdf5EJVkXL4s5AZ6Ug5omsRxYYRcMbFX3a5rtc6iceT?=
 =?us-ascii?Q?oqJ6evHwzs3lDwTWkPAHIASkur5lVYQMtoXTBo5iWNsJGx1OM1fqhZ39z8IQ?=
 =?us-ascii?Q?Mo/mcv2NrZS2wcFSrF1QWOxciGiT7mWZQIqJ2iujjnK53859FWTwvJFKOTsC?=
 =?us-ascii?Q?0WXQaT/vgUmrhaS7G/ZCTFRZuyeTAi/T7TJoWw2z/Olb8ajK72gzw/qceLGA?=
 =?us-ascii?Q?N5G2nWBQxTU+r7TU8NQxfEPYQIGtsTHXthEhh8r0DP3BWIYEgPcxAiqw+qU3?=
 =?us-ascii?Q?RpiwoPK0k/zcLlSw2fF/dnDmzjv0DTJCf3gl7rSB/KSzOa4Whzuz8Ig36MtS?=
 =?us-ascii?Q?QBD4lvoJ91ynOxHSpTWbAgDLIQv9ZTs6eSJf6Ord6yLFXrVwdQq0fYTa9dS5?=
 =?us-ascii?Q?JXQFxmqmhH0dqbnH9a/Z1yrdO4Xcixek0Fy7HcCc7aJhd1ipVpsKXGNCkwZF?=
 =?us-ascii?Q?PsyVsapEwrVgLAK1LHV81qMDgUVF6KX5xFFLcVkkLEUvFjrhCAvHktgyK16O?=
 =?us-ascii?Q?T8nD5oJZGn32ExuNJcO+0VeQrltVqnxYfB1jHbjmMmfNVVOF8ufaUJad+pj+?=
 =?us-ascii?Q?DNrxIC6uUdDKH+ZFjz3ntLZI9Ksbc4NQVnkkXUiXPWfZdgHZFfGLRE8/QAJg?=
 =?us-ascii?Q?7yNFmC21AFFs804Hf9KZR/7AFMLIogyR/lsuUkat2s2XlgOt6d9bsrXZ7Q/t?=
 =?us-ascii?Q?1VBJfFuprxDe/L5Zg85EQeZIJyzI1oMAsrDaF2oAsL4svUejhmeaGd/1R4Qe?=
 =?us-ascii?Q?eh1/BUixYNzmX4y7PJ+NJ0hjpJ+oftgDTAG4kvzFwi4BBy4IyAP15WUBiJYL?=
 =?us-ascii?Q?kRREmd+qHkxuqafNpPQEsYr7lRmiGgiY4wgWRWfYglXAc3Ar61qF38R/VS2m?=
 =?us-ascii?Q?cSQ7aWN/aVOsuDVO4Wrx65hBLCO1Ftl9dguPqaJhjYQ5xwoYJZLKUcmit7Dj?=
 =?us-ascii?Q?OuIa8yBKncVnb9DKCvYenUXJ7zTglz4mjFI3xzV5UCXdl2j8W4eGzEz2qy44?=
 =?us-ascii?Q?5eZ50+elT80BKIfbyhfo0+fBZ9oH9m2BibNK6qt6u5HcwyZ1wSyp4u1w6MeU?=
 =?us-ascii?Q?pEl1lTz3mTGXjalJ5EKxFQXUXhi+/dqg31ewI9VRCxdvRzyMNJSdn5ld2mpf?=
 =?us-ascii?Q?M6bZY3XEFQCdKZh04tN4mhXCKZGRObbWb3AIviDGbEk8uLQYk1kZNQ15W4XT?=
 =?us-ascii?Q?9CxGfFSnJ3NSRYkbKro3fpUdskxvmgflc3soU/gcLrkeZbPYx/jM4+hXXj8I?=
 =?us-ascii?Q?j2PbEdbLiJksSQdnGq+eKf7Q73uTBh0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d33197b-9631-4823-359e-08df0fe4ea16
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:13:16.5681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nONw5+Ls/F9MF1j6SdZSJej5ozcT5ujkUWA99qaQ/C/+t3zTtwPGSFOs+MCPQEi6qwmw1FKCKp5QlMyPec/o+1mn1WyrJ7pnhwMHqZxex4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5548
X-purgate-ID: tlsNG-42698a/1789117999-1ACDF9EA-E379AD41/0/0
X-purgate-type: clean
X-purgate-size: 6181

In direct mode, the timer asserts an interrupt on expiration rather than
using a SynIC message. It is useful to implement this since Windows 11's
Hyper-V can only use synthetic timers in direct mode.

To avoid changing behaviour in existing guests, add a new Viridian flag,
stimer_direct, to control whether this feature is visible and usable.

At the same time, check that the reserved bits are zero and the APIC
vector is only set when using direct mode since this is enforced by
Hyper-V (although not mentioned in the spec).

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v3:

* For compatibility, keep the existing behaviour when the
  feature flag is not enabled.
* GP fault if reserved bits are set.
* GP fault if APIC vector is set when !direct.

 xen/arch/x86/hvm/viridian/time.c     | 44 ++++++++++++++++++++++++----
 xen/arch/x86/hvm/viridian/viridian.c |  3 ++
 xen/include/public/hvm/params.h      |  7 ++++-
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/time.c b/xen/arch/x86/hvm/viridian/time.c
index 082528dc9416..65654cf96937 100644
--- a/xen/arch/x86/hvm/viridian/time.c
+++ b/xen/arch/x86/hvm/viridian/time.c
@@ -223,6 +223,21 @@ static void start_stimer(struct viridian_stimer *vs)
     set_timer(&vs->timer, timeout + NOW());
 }
 
+static bool stimer_direct_mode(const struct vcpu *v,
+                               const union hv_stimer_config *config)
+{
+    return (viridian_feature_mask(v->domain) & HVMPV_stimer_direct) &&
+           config->direct_mode;
+}
+
+static void stimer_deliver_direct(struct vcpu *v, const struct viridian_stimer *vs)
+{
+    struct vlapic *vlapic = vcpu_vlapic(v);
+
+    if ( vlapic_enabled(vlapic) )
+        vlapic_set_irq(vlapic, vs->config.apic_vector, 0);
+}
+
 static void poll_stimer(struct vcpu *v, unsigned int stimerx)
 {
     struct viridian_vcpu *vv = v->arch.hvm.viridian;
@@ -242,9 +257,11 @@ static void poll_stimer(struct vcpu *v, unsigned int stimerx)
     if ( !test_bit(stimerx, &vv->stimer_pending) )
         return;
 
-    if ( !viridian_synic_deliver_timer_msg(v, vs->config.sintx,
-                                           stimerx, vs->expiration,
-                                           time_ref_count(v->domain)) )
+    if ( stimer_direct_mode(v, &vs->config) )
+        stimer_deliver_direct(v, vs);
+    else if ( !viridian_synic_deliver_timer_msg(v, vs->config.sintx,
+                                                stimerx, vs->expiration,
+                                                time_ref_count(v->domain)) )
         return;
 
     clear_bit(stimerx, &vv->stimer_pending);
@@ -361,6 +378,7 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
     case HV_X64_MSR_STIMER2_CONFIG:
     case HV_X64_MSR_STIMER3_CONFIG:
     {
+        union hv_stimer_config new;
         unsigned int stimerx = (idx - HV_X64_MSR_STIMER0_CONFIG) / 2;
         struct viridian_stimer *vs =
             &array_access_nospec(vv->stimer, stimerx);
@@ -368,11 +386,21 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
         if ( !(viridian_feature_mask(d) & HVMPV_stimer) )
             return X86EMUL_EXCEPTION;
 
+        new.as_uint64 = val;
+
+        if ( new.reserved_z0 || new.reserved_z1 )
+            return X86EMUL_EXCEPTION;
+
+        if ( stimer_direct_mode(v, &new) ?
+             new.apic_vector < 0x10 : new.apic_vector )
+            return X86EMUL_EXCEPTION;
+
         stop_stimer(vs);
 
         vs->config.as_uint64 = val;
 
-        if ( !vs->config.sintx || !vs->count )
+        if ( (!stimer_direct_mode(v, &vs->config) && !vs->config.sintx) ||
+             !vs->count )
             vs->config.enable = 0;
 
         if ( vs->config.enable )
@@ -583,8 +611,12 @@ void viridian_time_load_vcpu_ctxt(
 
         vs->config.as_uint64 = ctxt->stimer_config_msr[i];
         vs->count = ctxt->stimer_count_msr[i];
-        if ( !vs->config.sintx || !vs->count )
-            /* Reject enabling with a zero sintx or count fields. */
+        if ( (!stimer_direct_mode(v, &vs->config) && !vs->config.sintx) ||
+             !vs->count )
+            /*
+             * Reject enabling with a zero sintx (if not using direct mode) or
+             * zero count field.
+             */
             vs->config.enable = 0;
     }
 }
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 90e749ceb581..90be5842b995 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -78,6 +78,7 @@ typedef union _HV_CRASH_CTL_REG_CONTENTS
 #define CPUID3D_CPU_DYNAMIC_PARTITIONING (1 << 3)
 #define CPUID3D_CRASH_MSRS (1 << 10)
 #define CPUID3D_SINT_POLLING (1 << 17)
+#define CPUID3D_STIMER_DIRECT_MODE (1 << 19)
 
 /* Viridian CPUID leaf 4: Implementation Recommendations. */
 #define CPUID4A_HCALL_REMOTE_TLB_FLUSH (1 << 2)
@@ -185,6 +186,8 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
             res->d |= CPUID3D_CRASH_MSRS;
         if ( viridian_feature_mask(d) & HVMPV_synic )
             res->d |= CPUID3D_SINT_POLLING;
+        if ( viridian_feature_mask(d) & HVMPV_stimer_direct )
+            res->d |= CPUID3D_STIMER_DIRECT_MODE;
 
         break;
     }
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index 99c40b4287f1..4db5142970c2 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -159,6 +159,10 @@
 #define _HVMPV_cpu_hotplug 12
 #define HVMPV_cpu_hotplug (1 << _HVMPV_cpu_hotplug)
 
+/* Enable STIMER direct mode */
+#define _HVMPV_stimer_direct 13
+#define HVMPV_stimer_direct (1 << _HVMPV_stimer_direct)
+
 #define HVMPV_feature_mask \
         (HVMPV_base_freq | \
          HVMPV_no_freq | \
@@ -172,7 +176,8 @@
          HVMPV_hcall_ipi | \
          HVMPV_ex_processor_masks | \
          HVMPV_no_vp_limit | \
-         HVMPV_cpu_hotplug)
+         HVMPV_cpu_hotplug | \
+         HVMPV_stimer_direct)
 
 #endif
 
-- 
2.53.0


