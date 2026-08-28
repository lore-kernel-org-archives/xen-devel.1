Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3928BC61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 13:12:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402027.1637458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzwNL-00016F-Va; Fri, 28 Aug 2026 13:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402027.1637458; Fri, 28 Aug 2026 13:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzwNL-000168-RH; Fri, 28 Aug 2026 13:12:07 +0000
Received: by outflank-mailman (input) for mailman id 1402027;
 Fri, 28 Aug 2026 13:12:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wzwNK-0000sl-Bp
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 13:12:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzwNJ-007SEb-Oz
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 15:12:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a918920-e002-0a2a0a5209dd-0a2a450b9d9e-4
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 15:12:05 +0200
Received: from [40.107.209.53]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a91891c-b7e8-0a2a450b0019-286bd1353d50-4
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 15:12:05 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV3PR03MB7586.namprd03.prod.outlook.com (2603:10b6:408:286::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 13:12:00 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 13:12:00 +0000
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
 b=iZETvm/BFKnB7vl0GuLFXOPlc9hBSYYhJnQXuuj6dPd+WBxWwA8alYr55mV5VgsTxasA6GfH1OFDTYxWLwwZR9TSBwlkvdH9YVDDrVzjDRZKiSAQ1hqTkGbtTqKjpp3KESHc3pdY31DmZME7MBttQMtq4skir3FXF9hsnYy6k0hXWdqrk2KdyQhjBC5Re/R0jPGaJSZ63T3tvHUn4shRgCnnQ8dbfC/Lb//fvK3iAfnMIolEwT39Pj7cujH/+iqlIAVC3WneJwAoVJNrX61Ajx9YBkBj7bG2pzKqtN/SDnCMTztx5pv5HeTM9Z0ic1Wa14XmsH4WMHn3myhKmPIt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIOSf/E6k+EC/gSCvgtt7hSK82bz+cU6/Y4zPAZilFI=;
 b=FJ/cJUXDSoPeU2rADEA/MyLFSIjKHIb9AcK+gMVeokLJQde4favFNHXCCFZZyL6ea70CJ05cZYS3PqOvL3OF7GX1PcbUtGpOEnEwuVsXQlYthui6PDWE0btqTgF9hTh0Hden7w6gi7V5oHDRFjefAVCAO/RK0k8bUEx/Q3SNlNx1BLh7+99m+ACTKDORGrLlLLVsgbxONxQMo2ulkfxnrRkjUK9Xa6lvdfsR41QECfAumuZTmaBjwv1A3Z/YSZT2ZJf02Adl8tUhW1dYunuziCSZNq0CuKZzzfKMHcello+3S4fJqvUbV30wPYo1OJg1X9JjtSq3AUSkgL95GTvmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIOSf/E6k+EC/gSCvgtt7hSK82bz+cU6/Y4zPAZilFI=;
 b=DfG6rukU+eFmDlHjWVEH3XT4ojFbkhi2+6RRdXrNwM4neKlFvxCMqsAUP9D/nN6YkatLKKYysM8ZLcOD7gVzgNZ0edUuFWrFIYQfKOn+ly7/NNNQHbtzAiwB+rNIhkjVXAA1JU5qAnS24CKONDfVdud8bYNGJz4Mikbyk7sOLio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v1 2/2] x86/viridian: Implement synthetic timer direct mode
Date: Fri, 28 Aug 2026 14:11:42 +0100
Message-ID: <20260828131142.3986110-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
References: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::9) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV3PR03MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9bcad0-4a30-4f0e-4f3e-08df0505f1eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	riVnkfaehZ6s1HWbWgQFdHZQ3wu9MxpjY7g5zggsnH1Z+tPWbUPTde56KlDWr8QIaT/vknSf5VBPcjo5WRuqYLJJ9eRlvDSINlcVHx17kjocr+Dn/EFuMQSCYETJ1r3uoVMUQg63es/gXzBy63ZDH/JObTSKceIZ7Dmraz7NK05Eh1lUL+fkjUB056ScCKmmahzMEAz5FkD4wUNMnp0SOuhHRshC4M97EsKKxzhLVUKzA1xteFK9SmMxDFq8BHN7c6q5CMmxnJ0OgqRtGORhVcMHuPgo3Jm3HO9K5BWkw6T36+a9UqNyzsRaAl55xtcIEMDdNbKEvtFyHz8EuT5ujCJC5aibPB/1pNelMNSMNdMY55iLF1MeHxWBiX4VxAdbL8waFQpiyYueOAnrn+OBVk+qXI5Orz4AqMRm6vUYBhykDqIvxKylaAODKZpR5k5HgQBFbQcCr1w72BNEcDFTKF7yciL48D3hTrO++cc3zfQdL9EniZUgRh3RiE2IiSZU7dxaPbQJflyqjEVMwVOumCZd2P4yC+Pbllr3Rby9FXtM7WqRjIjQlhz2rvOa0ME7Enai0F2NDpAzjL+VQGSnd4TF3EyMVy9/CKYnWGhEKuOY4KEpxFzW5JjAuNJF88nr3+0Ft8l0kVVoAsJnPKbX0YGTjwvI6lh1ZLIvjxxk1DM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cNXhiw5AlqOkv/lI8+aQq4KI+fh9KW3/JeaPhgP9EOBFUOrc+Kevocj0s3Uv?=
 =?us-ascii?Q?kJo6Mdeqkx9GZMb5UuWJGZBF6AQQpqYpumzO++XDLs1Y7T7lOtGDsVkz9dwZ?=
 =?us-ascii?Q?lAP3iPGMq/mck+uVmfJ4OfE3BK7Q6UsJlKub3T4jCPfa8qF3dqcXEgp9rk9Y?=
 =?us-ascii?Q?qBN7tzKPm24sDLmcyc0Aj2SlZT5u9ZlOPDkHDAbUdpwZWkT7esxxC1CMsePS?=
 =?us-ascii?Q?QSFWvZP49GWRY4sep9JAiLuyB7JmcgsQQlWUzmrnBsHYkxoZdlDYRJ2HhV/W?=
 =?us-ascii?Q?2roFKFCChuv9TYZVeIa5oSobfImGGEPbZ7ulJY2jSTAMczVw3Ip+gHOh9NyP?=
 =?us-ascii?Q?aanBzyeSxh5KM8joHVGlUOK5VLikbByURu+ZPaMPKqn597QWPuh2JdaqSk2I?=
 =?us-ascii?Q?2y+0d9vbaLL+DrFlR6amLLgk3e6Gcl/ueJugp6+eofxgnjy1NzzdFmLb93QN?=
 =?us-ascii?Q?rVponLgbdvqtBCGkJUBrG1K9g4kKXQ/AxXHfcatT9RI1K8rnuZ0P51b6kIDt?=
 =?us-ascii?Q?PUD72RlbN+7YlqRnIqWzjWRffFTkz+10a/1llK62hy68ZLzNffgqIdYGuKvs?=
 =?us-ascii?Q?UitD50ETXq4TQ/kA8TP4l15PjF3TGOLsrfvgLMg9BWX3MCnaTtPQ5wncpn04?=
 =?us-ascii?Q?QMpo5VaxxpVBilG1+3mNZlIm9NwO6TbuD9MqNI4HNEfg2AuXaA2AjgVRX/Do?=
 =?us-ascii?Q?iNBIcBJLvSOlP0k/FIJ75ZXfqCinFtnpQ3Gjc+rV4tloSB/8ke02Sq3dHO2h?=
 =?us-ascii?Q?AwthzvmISiG9uti3mIXLuMl7YP71DB2xfpLHN/Mr8hAfcyvJYu8IZ5u8unfs?=
 =?us-ascii?Q?9L5EwmsdVcl39quYdHxsHhYHFMkz31IQJKKhZymbW/VP038GYs0gygWPl2tF?=
 =?us-ascii?Q?I2QMrk/6CF8H8g7rPcEEqybGHj2kE7TRw3b++d/QRGqa3k9+2pOOEUqVVYT4?=
 =?us-ascii?Q?7qy/HMAgTVjYeR/ZgjQpqvxVXBe2buRG5UdnWcVC8kbt3gVnxYxkHE1TDrnX?=
 =?us-ascii?Q?PHrq2nVDFERmOoqR1PiQ4b9HX1F/vq5T0E3FZV93FRV1bjTXa1RafDhSFXyg?=
 =?us-ascii?Q?cUx87O70rY79vA9EKlT8gibzgKkuN1hWe64fGcyEf/+pTw7cqURuGCIZaPwj?=
 =?us-ascii?Q?Jz3YJArVu3AdsS2MxB+T4X+Kufme1mskzedrzLc/6kAAPnVFWTG+pPUx3xwy?=
 =?us-ascii?Q?9cY1qIG2Yc/+QcPGNzcojuyt8lCml9Pj2/SeYXk7ue5nwHKJO6nkiOfdwmRP?=
 =?us-ascii?Q?6zIr73fxdqhO2usT8TUO9iGFzzTqJgHCJCR8Qkg2Q9dZCKt8bcEfbvum+6PG?=
 =?us-ascii?Q?dWJVsmYjrm4t/u5USJF+pOUIxMWScpOYv27XaIAj7ZYWdeBo4PBDlVmL4vI4?=
 =?us-ascii?Q?hvqjSIz3kd4BE9MiWSkniWwgQQpZo0rH7Ulg6WrN/r4qg2d2y+QJboJJcmnw?=
 =?us-ascii?Q?AncCN8sPO6UYrxmTYS+1D6xZAadvN5HVtu23efHCgFeJ4+VAfXcJkHsnOVVU?=
 =?us-ascii?Q?wkqVBwIwOSNPs/tZh/yx3TrvqoEZzGBpKGMXyQB67t6fWgw46DrV7ru6XopF?=
 =?us-ascii?Q?pVXbngvn/Z4SYWsVR09CmmpA/D3h7x92wPPzTgQnFFzBQSarGQag5rmJhGMQ?=
 =?us-ascii?Q?+wg46aw2wMSwhhNGsvj+flXU2daACPacSPAeIkPMTJPRSboTEm1kGoiUDChf?=
 =?us-ascii?Q?OPW6THt2yxFKTkgoJ6H0zF7uicUmKsVOLPROiVOngt/ISkULxJjkiWahYv3S?=
 =?us-ascii?Q?YUW7J7oulPBC0gMj9+lwC59DA4eefHY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9bcad0-4a30-4f0e-4f3e-08df0505f1eb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:12:00.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqQ3IZQyT0mmvl8Rwo1vQe/Iwl3cYgjZUvA/lEChDgk1xfCjhWKlTp+9aOxCdS7AKKU6uNeRY5Ib8aJNFDbX9xLcNc9opPPqRaLDp334k3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7586
X-purgate-ID: tlsNG-42698a/1787922725-194C39EA-6744AD1F/0/0
X-purgate-type: clean
X-purgate-size: 3830

In direct mode, the timer asserts an interrupt on expiration rather than
using a SynIC message. It is useful to implement this since Windows 11's
Hyper-V can only use synthetic timers in direct mode.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

Should this use a new Viridian feature bit or is it OK to use the
existing stimer bit?

 xen/arch/x86/hvm/viridian/time.c     | 25 +++++++++++++++++++------
 xen/arch/x86/hvm/viridian/viridian.c |  3 +++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/time.c b/xen/arch/x86/hvm/viridian/time.c
index 082528dc9416..2b0ac3eac963 100644
--- a/xen/arch/x86/hvm/viridian/time.c
+++ b/xen/arch/x86/hvm/viridian/time.c
@@ -223,6 +223,14 @@ static void start_stimer(struct viridian_stimer *vs)
     set_timer(&vs->timer, timeout + NOW());
 }
 
+static void stimer_deliver_direct(struct vcpu *v, struct viridian_stimer *vs)
+{
+    struct vlapic *vlapic = vcpu_vlapic(v);
+
+    if ( vlapic_enabled(vlapic) )
+        vlapic_set_irq(vcpu_vlapic(v), vs->config.apic_vector, 0);
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
@@ -372,7 +382,7 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
 
         vs->config.as_uint64 = val;
 
-        if ( !vs->config.sintx || !vs->count )
+        if ( (!vs->config.direct_mode && !vs->config.sintx) || !vs->count )
             vs->config.enable = 0;
 
         if ( vs->config.enable )
@@ -583,8 +593,11 @@ void viridian_time_load_vcpu_ctxt(
 
         vs->config.as_uint64 = ctxt->stimer_config_msr[i];
         vs->count = ctxt->stimer_count_msr[i];
-        if ( !vs->config.sintx || !vs->count )
-            /* Reject enabling with a zero sintx or count fields. */
+        if ( (!vs->config.direct_mode && !vs->config.sintx) || !vs->count )
+            /*
+             * Reject enabling with a zero sintx (if not using direct mode) or
+             * zero count field.
+             */
             vs->config.enable = 0;
     }
 }
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 90e749ceb581..99192e8d077d 100644
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
+        if ( viridian_feature_mask(d) & HVMPV_stimer )
+            res->d |= CPUID3D_STIMER_DIRECT_MODE;
 
         break;
     }
-- 
2.53.0


