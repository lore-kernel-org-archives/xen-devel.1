Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3435C9833F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 14:03:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436046.1654819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBwv-0003ED-Ba; Mon, 28 Sep 2026 14:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436046.1654819; Mon, 28 Sep 2026 14:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBwv-0003E6-6E; Mon, 28 Sep 2026 14:03:21 +0000
Received: by outflank-mailman (input) for mailman id 1436046;
 Mon, 28 Sep 2026 14:03:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBBwu-0003DZ-CD
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 14:03:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBBwt-007ypM-PF
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:03:19 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba73a4-bab6-0a2a0a5309dd-0a2a450189e6-12
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:03:19 +0200
Received: from [52.101.43.36]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba73a3-5984-0a2a45010019-34652b2498ec-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:03:19 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MN2PR03MB4990.namprd03.prod.outlook.com (2603:10b6:208:1a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:03:14 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:03:14 +0000
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
 b=WRNYHLpYdqyWrTtWC/zJef3KyuQIcNv50Hw9Fztnr6xx/Fj/suWxXjEEua6Orj7r3G+au3CzzD4csNNmraioS6hSNCNiEiI9tmNm7/FU+9+SPu0Pqyahk5fEfRCwE0YDkimLDLOjRvpjGvUX8zwx14ICZa9wmGHRs+gN0mkOEgwuzwTIT1tkXn8ac1hNqUYgpOcxCFQj+6uADyRgRXDc1S9MYrJ6npV93zNuDgj+TesASbbJTwRV1lPmxWIOWCWQthmOveVv2OutYvD7EAPt4ATOnymzVdxe/195q23IMa9hW1dYKIkCg3xMPdO/zCsswHKyQ2zSkXM4+6aO1gj04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGmO/Q7mAEXd+CCzlAR6aW3KhpJR2R6xc8PbgASbyAA=;
 b=eRqrfWYl6bEdY33BJi+V29bSIuqn87OpXPzzV3n6/wL5nCREiIIpFaWdaY904ISW9Wi46lRTKzCjq/xultQQJyeeS4WcZyq1yCBn/xII/od6jr2SHXzP1O0edA1MNj0NxoLudgbWWg6Z/SdSb/72CVOXDQjANT4T62dpv9KVvjTP80dDeBN4BOva2j5tIg+227bg4XJCdDqmm0e3pdngZH+kHXMDrY08g80tepVbS4X6lR9CL87RAtiBcZp/a++gRpJqX44arWxc39Na5XVP1zOo+npWkwSJgu2TgQd2JpT2tTPLBfdjyCN+p29XI5OMYqynw1+Vyru5iGKiOvhYVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGmO/Q7mAEXd+CCzlAR6aW3KhpJR2R6xc8PbgASbyAA=;
 b=PIBT+/yTu6cdbIs0P8Lp0S+lCcIqJ5KD1LxrXWqHmIbJMimc1Y/Pt/it+jthbQwmEdepyGdS4TvOfiEeGroXRap6qObDx2iH+PK8EayFd5Sjl4lXQki6QGmvN0iShQ8cEaytNlgjM4O30XVRtPvGbRljk9DM4rKcOGUGYyzkUf8=
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
Subject: [PATCH 2/5] x86/svm: Remove ioio_info_t type
Date: Mon, 28 Sep 2026 15:02:45 +0100
Message-ID: <20260928140248.1543013-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::12) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MN2PR03MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a2b512-6504-45fa-df63-08df1d693ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	an32yKNYofvXbe/uxnpWRBGY9iihmjrLEqIv2GtojULC/RIjI76tJdIZFqOeJ0hPzvGOJhbUurolDGHR6f7Rx9K3mvH1bJHxMb83AHcnoiVcMOXDFYy9avQNoEoBrk9mWMWEnLKS7xMTXU9kWopKHaRLYK7cYSas0z2mkKqKVY5wh0Fduuqu3EFO7doXi+lo2kuwaiKrhwh7xVccOnz7L51PpLUmRk/CW823ndH4V0KWX47PuLyXwVxm6voJimqiZr3X8WZ/p/RFSvl0gKfnr/i2Hop/zfS//dWG6M33olDsPBD7QgBoT7HMN1sqEwSgdxA8eWmmLx2LqW3oQeiUIheLZ4Ngoody9vOniQ9ah587H1caSWPEnSLH6XUg2uCiPhfTCFepimjkNkBdThW7JVawtJ3ltt4gecEA8JcYLSVGO1tk7koPdLPBR4xHP9+6r8N7uV2Udyycr3+McwfBKRUtq9zZMmMzP80A04nuh4Ldiqr1RPQqHm8UC6Ff5bO1RTgq3JKEJ1kEbzDaKmEGJYdUG/VB5oigndrKqS8bjNO8GwQOGGNIcObrA4rhXGMl3R7CZNkXbYi189naRwhJ/SU+d1SRc7xs5j/unSKSjZbiH/WPLnux5PnMAx0BdNUJAyVI7NkXzqFm5YQNdfgtDaSFysDaYYK2uujwTCVhXCY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TeytoIkZhjmWnTM7tkqs8mKnt5UIiHq3xf0of8Qw7nlFwGaJyIBYzZ+D8ony?=
 =?us-ascii?Q?uDzX673eB7niua9FL7+hV51Bu4byJLkVEI56+eZkivQ319hDCGNCxL9lNEHD?=
 =?us-ascii?Q?5+i3u+WAmTU3kx4PTQ8eUxzhtElw35JIEK9ZaZvsFPsf3YbVCuwbT/c7Mz2K?=
 =?us-ascii?Q?6UgMCdA/TsRtjLHeqYBqxb8CkRhr0QYdPRFkK/h0D3uYYx5wmAYNA71DLf+l?=
 =?us-ascii?Q?BThA8hUnzpqzt3WyRBG59EIiuFjFacPSzB9OMttqaQ+KfkoyXseK9uNVH0sX?=
 =?us-ascii?Q?rX18D7+vTPc63qRcTqbRvQJXk7B8RQdAY6GdgzA6Nw/xl9QqiibOAh1+w4JH?=
 =?us-ascii?Q?q3NRwFg1Z46G8MB3nc3tuKkHdfDsPAG7nfAKF6isc2p+XmeJpuY7DKQPLmw8?=
 =?us-ascii?Q?JRoNdGYxNMmro2PcldNUy0XHq6IdtXdF8vxAaiY6ZZ0tzHeOrDhNlfotHvxB?=
 =?us-ascii?Q?mqBLVJKlFp3rgc4vdAGHO5iMQKkAoggxai73x2yTM6NbxWvziq8fz0VgQLbR?=
 =?us-ascii?Q?u91NoAD4vq7Bly3/ICKziF++1hSFQOlkHQ4454i5ZPterlub6qkxk37+yfBT?=
 =?us-ascii?Q?ZuwM0Kfq7lSNjMV/IIfXUDvk70OKWtidpHlopcfETyxJofStQS7DQFutLB6N?=
 =?us-ascii?Q?1GPtePhPSyNmLnDUHiq+tcXRylFAxwQ7Er2qkUsNqVpeTYwEySIIF1lDRUR9?=
 =?us-ascii?Q?JbKZTugv8z0Qn57tKQAiE4yLRk2mywXlZYcplYT6Y5sWGfP+BL6DWQ5T1qOj?=
 =?us-ascii?Q?xhtg6tB9utd0M1k+3BT9t/BqadJCyFam1los+iOdk5BICDXNb3ycwqTSfrUw?=
 =?us-ascii?Q?jbzCnx7DQt9TRUo2IHrhVmjiKc8isa82rFI4b0n9NPCRpstfScCy9sW6hVlW?=
 =?us-ascii?Q?Un7NtDH7l5eRPNEqXLjGz5q09R8M6K6nSW6Sy7tIQgQK0e8KHfgADD8v773G?=
 =?us-ascii?Q?qdXBUT3xi553V8j9pVl4M4yD449J2e6a17eyVmqwBRQUB9xKqJjGJmCCjRJS?=
 =?us-ascii?Q?vHzBS3U2vxe3S1MNdLiuq3CCrubCHUOx3vjd4lm3LmY3ajb80aFvkAgk+Ouh?=
 =?us-ascii?Q?sd9YvvqLGMMbU6IO6StxsJfEnq1GGT84cCvG3QaUb807CNU6Y3bX306WgbGm?=
 =?us-ascii?Q?0STxWGXsvV9Dmoo1c765Jyjx+UxZ5tgzi2tYBmEsYrA+JhvqivuHsyGnRbDi?=
 =?us-ascii?Q?qXgRSObT4biyTWZsnvnnhgbwkSBQrMaeT/qTejxq1y2oRY1Zi2CMp06vOglX?=
 =?us-ascii?Q?gSoK3ixTL/kQPRuk0lVH8bQrWQUZBXfXixrKkuAmNAiSBLypEgds058LpzuC?=
 =?us-ascii?Q?gEz1Gb6XHKu3xnmsv/jY2trlhRCuiV//RC6BVh36QMP24JAD8duXDpf5UWQe?=
 =?us-ascii?Q?8TH73KgJrY2OdPcC+N5OPeE6VA1XLI38YR9cccgw4TbDgV1sUoAIKFSWuigW?=
 =?us-ascii?Q?57iflgpHj/3xYiEGZUH7QGW4MSiZZ6rkUZRhiCMZ5plDuPdQLVQNURf8sk1F?=
 =?us-ascii?Q?Zppx53ixQr8bMpzsEfKrF4s9+j4JJJeKoJpCFgu+daQ+kT7gVjeXpPvT5qle?=
 =?us-ascii?Q?eWRK/4tK86amGMKxiZKR1qzOQZepk5P+dX1/sSY4fDlnjEL5TxEOfKZr1XO8?=
 =?us-ascii?Q?MxW7ROo6HZHyuiMVBqtW3vWCBNPEJqT+gERpgaEKjGlsoaBVTiW+XsFl3zVx?=
 =?us-ascii?Q?o9dIqHsYout2ZmVTqGHsA3GAZKVXVE3lX+PCeQhdgPRb6RY1E9quZimQxX8J?=
 =?us-ascii?Q?bmSFG2nhj60QmmSFH+BExygihTQH52s=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a2b512-6504-45fa-df63-08df1d693ce9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:03:14.1310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STnk7vzs68caPHhVvEcnudXEwnOeAwBzdoqPXgsRPMkTXSbvTPCJB95tJ/Q+cgO6pcnJCaujVRg/gJVrtjCBg/RF9ppbtc2KOlH/CLOYW24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4990
X-purgate-ID: tlsNG-d62444/1790604199-1F86F757-B0D13334/10/62225246915
X-purgate-type: spam
X-purgate-size: 2264

This type duplicates what is already in the VMCB struct. Remove it and
have the only user access the VMCB directly.

No functional change intended.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 10 ++++------
 xen/arch/x86/hvm/svm/vmcb.h      | 17 -----------------
 2 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 65556136852b..13a2144fdba4 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -823,18 +823,16 @@ nsvm_vmcb_guest_intercepts_msr(unsigned long *msr_bitmap,
 }
 
 static int
-nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, uint64_t exitinfo1)
+nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, struct vmcb_struct *vmcb)
 {
     unsigned long gfn = iopm_pa >> PAGE_SHIFT;
     unsigned long *io_bitmap;
-    ioio_info_t ioinfo;
     uint16_t port;
     unsigned int size;
     bool intercepted;
 
-    ioinfo.bytes = exitinfo1;
-    port = ioinfo.fields.port;
-    size = ioinfo.fields.sz32 ? 4 : ioinfo.fields.sz16 ? 2 : 1;
+    port = vmcb->ei.io.port;
+    size = vmcb->ei.io.bytes;
 
     switch ( port )
     {
@@ -945,7 +943,7 @@ nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
             break;
         ns_vmcb = nv->nv_vvmcx;
         vmexits = nsvm_vmcb_guest_intercepts_ioio(ns_vmcb->_iopm_base_pa,
-            ns_vmcb->exitinfo1);
+            ns_vmcb);
         if ( vmexits == NESTEDHVM_VMEXIT_HOST )
             return 0;
         break;
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 869d965ba398..2fc10caec136 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -351,23 +351,6 @@ typedef union
     uint64_t raw;
 } vintr_t;
 
-typedef union
-{
-    u64 bytes;
-    struct
-    {
-        u64 type: 1;
-        u64 rsv0: 1;
-        u64 str:  1;
-        u64 rep:  1;
-        u64 sz8:  1;
-        u64 sz16: 1;
-        u64 sz32: 1;
-        u64 rsv1: 9;
-        u64 port: 16;
-    } fields;
-} ioio_info_t;
-
 typedef union
 {
     u64 bytes;
-- 
2.55.0


