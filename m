Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B61DC61DD6
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 14:15:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408562.1641065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Uhh-0002At-Fu; Fri, 04 Sep 2026 14:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408562.1641065; Fri, 04 Sep 2026 14:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Uhh-0002Ak-Cv; Fri, 04 Sep 2026 14:15:41 +0000
Received: by outflank-mailman (input) for mailman id 1408562;
 Fri, 04 Sep 2026 14:15:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x2Uhg-0002A2-MB
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:15:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Uhf-007o1s-IL
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 16:15:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9ad26f-8faa-0a2a0a5109dd-0a2a4502a8ce-36
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:15:39 +0200
Received: from [40.93.198.8]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a9ad289-6ca4-0a2a45020019-285dc6083325-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:15:39 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MW5PR03MB6957.namprd03.prod.outlook.com (2603:10b6:303:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:15:36 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 14:15:36 +0000
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
 b=EHP6iTHLSpa/GUYjC8ITUSgVZVEaBFcEWHjtqCh+oLluXuZ30sBxcyDA+UR17d9wZ9lQJziTNxMKOddo7lPcHYn33QcPGpWb+xp39u4PheYKlNsD5u1rFous72L0I5sw40iG8eq3Q1bVICJHY4vcJm8eV3P6l83PQP6rGQObxliOxS1pT/Z8UCuEkaS4hNfQ6GjcZr2MFZduqX1aZuJSZiuM/7GignXmSaslHhAtf4c0zUD9m4wOfzmx/t/OEDlk2pJNny1dncpGb/k6cyGIvaDiPtR1PS0x8OJMc8JcWfvkSUEA9TSctsxcwnCv9cAG/fmmMYDgI9z6U9YnruqGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpE4bVBGUwH9EvsjPyq1mD2BzEXMSLIFuK5hnOBmzlQ=;
 b=L4UpoAMrtQFstWtHJlUyZ0L5hmcCjZ/yguXEa7Do8+mEY+GJUyBBvl2NsWY6+AFxe0UfstjoCsEuU9ItXswK+vE3mc6O5OayEvBzfi9YgnxA+CTe1rttGJBqwSzE85MfZtrKxlU2xTk3rFwBZX2C84TrtqsagB4prAkrUmuzB+BeFO6wBUTRU5K6hyOaymZ/tD3d4h8jq0azu+6gi2yGWV/Nel8/vu0AqRsv6oRGIdDMV9jtnOkArTohLjK3UW28f8jWKkxOhLkG9FCfD36MbSPlPnq9gxKxrDRvzRcCEDGLhCTfdJ5Kp8dWmezD752pKXyeOCEuxkQh/f5TXkYT3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpE4bVBGUwH9EvsjPyq1mD2BzEXMSLIFuK5hnOBmzlQ=;
 b=rOCzQkeF+1vFsAKBFjdoiG94Ez8CMDKpLPb+9ncD26OBkiilnHdATvgTV+67yEC6k7PV+kykmXtFN3CpSkpfeKrsQuNC/qp2N8FkTBe1JikKo5dDwZlhUPGd6ET/jYi0raoL9C4BJyHzTbeq3/aX1J/cSEvbi0RQxcmCPX5dMbU=
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
Subject: [PATCH v2 2/3] x86/viridian: Implement synthetic timer direct mode
Date: Fri,  4 Sep 2026 15:15:15 +0100
Message-ID: <20260904141516.367862-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904141516.367862-1-ross.lagerwall@citrix.com>
References: <20260904141516.367862-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0264.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MW5PR03MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e50b48f-50d6-4e26-1945-08df0a8efd3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	m7L83IGCFDBdciGKZuhbUMb/N9RJn2LkqD+exi7m9DcQS3GqvTugc96+E+ecP9QOajz8hpF+VBTWHQIMcMSxvVO3FDJWWxTEezBpteNa5WLubN8dhJ/1KbajeWki5W2sHqkU0C1Icei+WJ9TvLrfm9jLCsvQeKmPxEr7KZ/U3F+zFHhTq8wRW5xwovIySq0z4NShamgva9AznZYzP6EUDVJ6InWtSUIaXXYMWA0YO0h1w7RTPzlpI19D3BTcZ9IFgUuc01jgUCPeqHjb3XAN4c/OXNaDfQAxWAZUzRYmNm/VeBN054UhQYF5MIR44ltU8oV/pXKc1/WAVCTxgFhqkhqwxIP6adz5LBbUrcongSpbpiD8APK1Dw1kPUnutp9+kktSz6oCSsdNMD3DpFjdEWaDtzEOFtnJVVqUOK1Wd57onc3UAxziJ9xUMZiw7d+rhXGShICFHR+7VGrELUgg6Z6tJlL19pbYM73Z5xTgsui0ck8/tk3Ljq2qMROqbsjCxaZfsN2t667UggcP3ZwSYALwzuYRt/krfwBoOM72gqYvdkkbq5PlRHqf4y2PBkJIebv/gpiFBavfzDCRBVPt5ciapW9e7B7yFvrmetdmI6Ard9dU7tu/C5Vf53cL3F/5Bii7FfUTJ283fTsLc7rrJPgmbzCHT/JuXpRCw8AV1Xg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qMIHD4By5LdO63PXG8lUMvIISTvmSqmv1hVNASblns+Ci+Cmdekh0mORl6a6?=
 =?us-ascii?Q?MUrZMlBapyUhR2NoNzVElVWur+d9TqQZYCcDF9/OF9aCXVc37whPwnHPMZXq?=
 =?us-ascii?Q?dn6XDNY1pexmvRKX92gwPPWMioaUL7jXVzBEFOuORb95fcvqG084UFgZ0cO/?=
 =?us-ascii?Q?TLMH7AUhzJufUnxrXKoECW/HiCvAWiJPvAiD/J9skVXZJs/4pV/aijzkRpzn?=
 =?us-ascii?Q?Ljzor0SU2ZoUlZsF5rK5WQTQDiGpQ0aD1pi9R3ErF1tiDnijLHWdz96618qw?=
 =?us-ascii?Q?RXqtq6LPxiydeifp4w1NIvs8r8k1qweyFvHudNkgPv5MgYVuRARIxcalOutp?=
 =?us-ascii?Q?/9Z32V39Yp5Bi0AdjxoyPB/pNqqHuKl+tkHD3wtzRL7zcTO5DLG6+GVsRfAp?=
 =?us-ascii?Q?zXknUzv8jsiUwAC0Pt1iUzBxyUPqNKOjd7MvzglJofW/N+QTSVUorbdnQd+/?=
 =?us-ascii?Q?yqqeR1NWQ0BiWRWJnMhbf/HBA3f+piR+fxkqeFrXBthzCU/vAcOz+3Ya5zCe?=
 =?us-ascii?Q?lVWWIU+CD0vQim36K+DwtoIVpKjfT5fcaZ8mlL9XoB1trGOdOD1+jrkVbepl?=
 =?us-ascii?Q?mYuInNYg6UI0shPRl3lly0kLYrUh6BBPxdGpn5nTa1iV9Wd4kV2dtJCvyFTd?=
 =?us-ascii?Q?Bre/w6LyeX2hSJowZG7VDYJFEa6bc/Vec4qT832jQxOEsm+Lp7dglGUWDpRG?=
 =?us-ascii?Q?h1O/hWLw3t0cR49LifTcpNYFcoetGfBm/Zr0hxFvq8q3vUtFqHyVCSkxVQCl?=
 =?us-ascii?Q?KsPX15auBxTlWC3Se5Ql5nCXOnxpaQevu91hTSgJ3PXN27KSaHsY5t3bbLie?=
 =?us-ascii?Q?XEdyO3PwYiSHUxEDSJ4uTYWu4/mvFPJyQNzRCpPZdoMsl4QN6J4ggTw7ndJX?=
 =?us-ascii?Q?KkqXCrCqimPWVvAzSyaWRrhKG1eRGbTNWGH1TeNhFa6Gd5PSLg7ciwytuW+x?=
 =?us-ascii?Q?9v+jY6Yv7ea++dfY9VWgnUowDS38NPfXGQxStZFMliERusJHvxzhNN7NgfLp?=
 =?us-ascii?Q?6yGqYmP5yia6Lvkpl/oa27zCjMppHF1UMv5YfC06G4P57KjL+vHButryLq2/?=
 =?us-ascii?Q?lvkLjX6h43KgPN6RVGlqfn8II0FOep7sNUW6OtnPd52up6fT5U66knaWsOm4?=
 =?us-ascii?Q?KJYzW3cwnAbd/vWrSUxqge8H8TxVepGJuJL4QYK7zqZ2e/RQWa5lEvTN0L1q?=
 =?us-ascii?Q?8kIwHIu070m8lKhzsPTtslNkQ0bXFJFWXf9sKqnLJOEZ+O4wEtA1seqNLoAl?=
 =?us-ascii?Q?gUiHgtQ9m637uH2C4PgGC/Ok976O6Vv1qGhxtx5mpxz61RlRg4ENGVbSbAwr?=
 =?us-ascii?Q?b+xjw/2sm3t9KUWzLZzfQUXUq53fd5oITYhz5CiN0fNqysGgAQoM0Y7o3scz?=
 =?us-ascii?Q?Wy5eQHC6WMe5m1lkqWGZ7herjbRtIYbVUyQCvZPLKlVGrjyFhWbxbwoBz6jU?=
 =?us-ascii?Q?k39zgyx4FwhUnc3qQKYRmrzscL+NvMaUHAIGJ4M4kUrrVohVXJAG7Aj7IvjC?=
 =?us-ascii?Q?cpAyYoz0PmBtPneb4+k6f0ImLXFKWsdTCCKhfpPeojLumUQTGjysf7A3vMz0?=
 =?us-ascii?Q?0FG94BjN/k2dYmX59T3h7qx+fq2Pt/MrFocOTKZqHBy916ktAFLz6TYmR6v/?=
 =?us-ascii?Q?hvWKTBVLecyzYWTaff9SJwcKYbTb+/FCsNzktn78TpGi3aRG3INuUgFt9Xxc?=
 =?us-ascii?Q?YNfBHi2Tdi7epb07ZnNOjQvvGpTIb8XLKI6KVIxvfp8C2J1g/Ulxhc9xtJrR?=
 =?us-ascii?Q?z+oyDGqRAK/ze9UTsYHKW6RXbS7k69M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e50b48f-50d6-4e26-1945-08df0a8efd3d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:15:36.0961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovSZuJWg+JJX0/U9OrMQuOS24Wc4cWh+nqVkH+JcFOrBbUAKarustAGU+6PX6o8notXIzH8cTCoPsYuJHiN5X6HAD5uHvEmHH8x9F+cs0T4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6957
X-purgate-ID: tlsNG-720697/1788531339-F3CBA2AC-7EF75AB7/0/0
X-purgate-type: clean
X-purgate-size: 6017

In direct mode, the timer asserts an interrupt on expiration rather than
using a SynIC message. It is useful to implement this since Windows 11's
Hyper-V can only use synthetic timers in direct mode.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v2:

* Handle migration from older Xen by introducing a new Viridian flag.
* Added more sanity checks during MSR write and vCPU context load.

 xen/arch/x86/hvm/viridian/time.c     | 46 ++++++++++++++++++++++++----
 xen/arch/x86/hvm/viridian/viridian.c |  3 ++
 xen/include/public/hvm/params.h      |  7 ++++-
 3 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/time.c b/xen/arch/x86/hvm/viridian/time.c
index 082528dc9416..4c8352612b19 100644
--- a/xen/arch/x86/hvm/viridian/time.c
+++ b/xen/arch/x86/hvm/viridian/time.c
@@ -223,6 +223,14 @@ static void start_stimer(struct viridian_stimer *vs)
     set_timer(&vs->timer, timeout + NOW());
 }
 
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
@@ -242,9 +250,11 @@ static void poll_stimer(struct vcpu *v, unsigned int stimerx)
     if ( !test_bit(stimerx, &vv->stimer_pending) )
         return;
 
-    if ( !viridian_synic_deliver_timer_msg(v, vs->config.sintx,
-                                           stimerx, vs->expiration,
-                                           time_ref_count(v->domain)) )
+    if ( vs->config.direct_mode )
+        stimer_deliver_direct(v, vs);
+    else if ( !viridian_synic_deliver_timer_msg(v, vs->config.sintx,
+                                                stimerx, vs->expiration,
+                                                time_ref_count(v->domain)) )
         return;
 
     clear_bit(stimerx, &vv->stimer_pending);
@@ -361,6 +371,7 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
     case HV_X64_MSR_STIMER2_CONFIG:
     case HV_X64_MSR_STIMER3_CONFIG:
     {
+        union hv_stimer_config new;
         unsigned int stimerx = (idx - HV_X64_MSR_STIMER0_CONFIG) / 2;
         struct viridian_stimer *vs =
             &array_access_nospec(vv->stimer, stimerx);
@@ -368,11 +379,18 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
         if ( !(viridian_feature_mask(d) & HVMPV_stimer) )
             return X86EMUL_EXCEPTION;
 
+        new.as_uint64 = val;
+        if ( new.direct_mode &&
+             !(viridian_feature_mask(d) & HVMPV_stimer_direct) )
+            return X86EMUL_EXCEPTION;
+
         stop_stimer(vs);
 
         vs->config.as_uint64 = val;
 
-        if ( !vs->config.sintx || !vs->count )
+        if ( (vs->config.direct_mode &&
+              (vs->config.sintx || vs->config.apic_vector < 0x10)) ||
+             (!vs->config.direct_mode && !vs->config.sintx) || !vs->count )
             vs->config.enable = 0;
 
         if ( vs->config.enable )
@@ -583,8 +601,24 @@ void viridian_time_load_vcpu_ctxt(
 
         vs->config.as_uint64 = ctxt->stimer_config_msr[i];
         vs->count = ctxt->stimer_count_msr[i];
-        if ( !vs->config.sintx || !vs->count )
-            /* Reject enabling with a zero sintx or count fields. */
+
+        if ( vs->config.direct_mode &&
+             !(viridian_feature_mask(v->domain) & HVMPV_stimer_direct) )
+        {
+            /*
+             * Old Xen didn't support direct mode but it could still be enabled
+             * in the MSR. Disable it now to avoid unexpected behaviour.
+             */
+            vs->config.direct_mode = 0;
+        }
+
+        if ( (vs->config.direct_mode &&
+              (vs->config.sintx || vs->config.apic_vector < 0x10)) ||
+             (!vs->config.direct_mode && !vs->config.sintx) || !vs->count )
+            /*
+             * Disable if sanity checking direct mode / sintx / APIC vector
+             * fails, or if the count is zero.
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


