Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67019CA6017
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:14:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444965.1661453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU5r-00014N-Jo; Sat, 10 Oct 2026 10:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444965.1661453; Sat, 10 Oct 2026 10:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU5r-000149-Gb; Sat, 10 Oct 2026 10:14:19 +0000
Received: by outflank-mailman (input) for mailman id 1444965;
 Sat, 10 Oct 2026 10:14:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU5q-00012I-6O
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:14:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU5p-000Nv5-Jg
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:14:17 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca0f8a-2eae-0a2a0a5409dd-0a2a450b898a-38
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:14:17 +0200
Received: from [40.93.198.56]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca0ff8-b7e8-0a2a450b0019-285dc63864df-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:14:17 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by CO1PR03MB7916.namprd03.prod.outlook.com (2603:10b6:303:276::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sat, 10 Oct
 2026 10:14:14 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:14:14 +0000
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
 b=Ux/prACwtzzi3TK/ndwiSAuMQgMteOV8p5IEPNwkdUE9B9P+JcpWD7gl+s8cQb4+CBNgy8UPMVtTF29ll4JOQcG++FpXQWi4f9lERL88cV6F/n3xOIum9fhf1O0CQdru05TrCcmHn/ag3BaRL2WrNGwXvVQK3AnrcSuCEwPyVy+Jb6HmwLwF6J4PYxOgpy2CINnXfqoCdl2B1bzSyA8nDajfZN6cRnMW7HljoEszJXOQmpeIEbqyqQN4NQZezW4l70RfqOBq0vxH1rXJGfCUsTDlqDINjNdUkwqZpHQesrMdTtx3prufZf5TtCjzIAHV/YDjioz48DoNgMdCdDk8wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMc5XsDxFnIKWsB/TD9NiKgookFxuMjyFAx2AsysM4M=;
 b=lmtRM/Wmvj3dFaTYKfq2dOfe510VhJl+sG1Pgjhr8eYfGqjyqkgdkdNlg6E16WtntwCz0IKuzt75cDW+Me7qPMw61axLhOalLofQn4Cgn+HwSgZ1Hi2OmCAnnsNmM8n6hs4dY6ubon2rph6G4M5SWvkocHWPaInMy3/bEX/xJwISbSYxcnaPaoJCGUum64AAjbn0+rkWQaySfD2lURJkdmYV7LTIC0uehYGVNgVsybM9VOvcDDH26DEz6BeZlE4guerXC+9g1O+P5rYLUeNGjQEDOzT44n/vkXVcSz9RmsXhA8qnK8OPwBimhDnBmxTT13AlGiaWnvgy6Rek3KeL2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMc5XsDxFnIKWsB/TD9NiKgookFxuMjyFAx2AsysM4M=;
 b=XlYSSG0jDv17mE9206Cvv9vD/Ib+pcY3GWaTtlORqoQzdbnLB7kqhcYdlPvIRcHX8w4rY1AnflkkfCyEt/aLEeHEHHOoqJOeLycWgtmXQtQjys2kBRW5+chdj7mm+Mk5skQyq0U2MOi3bSBqiYgBc16tgHZ8bY0SqHHefYgkwQk=
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
Subject: [PATCH v2 02/13] nestedsvm: Adjust L2's DR intercept when adjusting L1
Date: Sat, 10 Oct 2026 18:13:15 +0800
Message-Id: <9b6e4ec9a5fd34db2071adcf8e73b0c50a1528aa.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU2P306CA0066.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:39::17) To CH2PR03MB5320.namprd03.prod.outlook.com
 (2603:10b6:610:9a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|CO1PR03MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: f1396176-9819-4df3-d5f8-08df26b73c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|18002099003|22082099003|3023799007|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	GH91WZ5JQdquz6lpzwc+2txRSWkxHEriGEN0BdAIVIolMdNFePmZ3n1isbliY9fpxURCF17mScvlI4gVciHUYn/rkGgjULJChFhrFyNpAl3eZxgnXEdumFEaviWQzoAIiyycQrbw7LT+FTPhkSEbHumPKqya+/RH+ggjKVMsKdVr6S4dziAtZIKwoCmvNxUcITRJ1N2w9HiZJUqB6HvsbAeiu4nVpcz6HbMBPpjoLyf382sI5p/Lk30Ylh92zsFdfVC7r8Sezb+eQNUP3jNOGjkJ5ksyhEKn0a3ztIUgEzXhunCP2DgHx1q1yagH4hTbQ19m6yDbjueqyXjV3alAC8MvVnL2167W9MFfk07U70SrD1U0JEQRloGQosj7MAAH1JFhICb1JVABHq8VGdo5Q4pu0XR9LfxgJCyvokFj1HVvCa1IJN8C321QI8wnPBpIIyUy0jR9CUJQU+6DwaK7+LV2SYf5qehPuQcbhFi2xgkkXvknC5vdP1kKR4LC07ZKTSqaSik4jQmlNAi/GZA3q1bFl2FfoPOVINDf5J7HN4aT42BpRaTvSo7sAvZogQmMJ2FgLNEa2eVOs7WQe/OsvKpkV4Xrclpfol0Tr4N578HC2BaFZCbKGWUX5iKYOOFxjDaw9S0l2RGZm/ozxti/hTVFvd8yHLJaXzDbeTqN30w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tRwI49dL7JFgmE9/KSF1w5j5vmNYR2ENe1979uS7is4/VUkYH27j3LeOyA5F?=
 =?us-ascii?Q?gCT3+lLkAVMzFpQ5c3WbsvZ9XiOIbLwjYzwqpFWb+8CKvUSeWHVs7BvtlcU3?=
 =?us-ascii?Q?78n3SJ7V5KG+i8WGY3j/p/3K3nMNnP7DyadG3+D5HkxkvzD8kd5SpmoKHEUC?=
 =?us-ascii?Q?2z6BmFq8/dUJITZ3Q0Llg+8BIEkOoQ9ShJglqxE7SV5sWpZ4A8nSBoHYmW3I?=
 =?us-ascii?Q?t/C7daZkgvO86JnWVM8k+M7DrQcsCAxYA196aiXK8+kWhh0xE0MAr7FLN3Yu?=
 =?us-ascii?Q?glqstKoVFMDsSJ9SDb6UvKBgWgj6HF1ne5OZB+EoSNCIQJ2sKc9nOgbggz8V?=
 =?us-ascii?Q?cckyPWN3tKID8jykyeHwIz2uDnW15UE4E7ZHOq/636kODFf3wqGnXwELsp6g?=
 =?us-ascii?Q?4dwJ/n5ldtnNyEbBejiiLRNVBzQqvbKdoSXTot3O5vz9uV/mG5Cgb2Uu7wEk?=
 =?us-ascii?Q?uMg1iacaUgH9C3rEaliV/Ia2D33R6jBRE+6Y7ZORP5Ze5UamaqesF9R1Z10C?=
 =?us-ascii?Q?wr2kV9C0Yp0NH0dsIatHDrPjbRfSZebSgjNZYU0rwRPZL0ydW2YoytZLW0xf?=
 =?us-ascii?Q?M6FEHoHUG+kKZ7CvOcyl63dR4HhBW0fjIddRq5lQljck9mXfl+ifcP2ZhT9M?=
 =?us-ascii?Q?xxYSi7nxGMraIbv337ZXUIjAsKAyh5desVf1vFIkYrRA9zUclSWPM/vdPt47?=
 =?us-ascii?Q?lYt4bDSAlIvuxJOMaA2AkQr9AyrlAPNyUOht6UwW+PrbccceU0LruUN28URI?=
 =?us-ascii?Q?2YvluVGdLb4dxepL3mzZ9Fywxm5CjqTJG4H9yw3ZY6/JXLW5Y+9JMb8OkSjG?=
 =?us-ascii?Q?PfeKTIXZOQZnJDe7W7hCIEd9iB8ujSpfMfYMJ9huph61/LPp9iyPhmBK6y+8?=
 =?us-ascii?Q?nFAKq/QX56P16siGtRJ3iuUzN0FXGvypO/xbm2VRRbMhDI6UMux86q1CZJWU?=
 =?us-ascii?Q?pMVgTysyVGHVFtfqrUY4xlJm2uIfE/v0wIIdp8UoJ5juwh/6DG+oLrxrVmU7?=
 =?us-ascii?Q?c0a5P/guF4qICU6ThnrviIGoXjFX6CSKjvPmjYnAJNmjzradSJf/sAXssT6M?=
 =?us-ascii?Q?FycTdNfKElhelcTLX2HtHZMG/QyZMwbxfg7qIdGYRdr/hIxB6P6xYFaDMLqj?=
 =?us-ascii?Q?MZD3YDhREmJ0RSO2hIapPq3gA9TDazzBjkVrqjE8pZx76VtWuYMpjXXjViOo?=
 =?us-ascii?Q?uKzx3TF2P9bIwwd7Fp9SGehiFslOzhBqh4HDP8X4o5cXMLGSmF5/trOGVUvx?=
 =?us-ascii?Q?5n6K+FiB2NaDiQiqEVVqJ1fuJQid0NlDFkWr4Bt1RfH4MtfZNffWzl402OVJ?=
 =?us-ascii?Q?+OVY2fFwPasBnUPcIoG6T+fvqeqnRqqvB9CbM3vcEvvdv0RyYOe4SmCw4pQU?=
 =?us-ascii?Q?66/2CpM5Ekq6ZIygT/G82CIQeFj/PvolAxRLuTLIE7rkuYRYdtNWPnCJyav6?=
 =?us-ascii?Q?CUnsmZCyMlD/scU03yx0KS0jo9h/08i4f2wx4vMx2oXzv1j6yAOcZ6h7tB/W?=
 =?us-ascii?Q?yzHYebYKMEiBx/Wbv+qIKlbtDgSnMZ6BRHJmyrsidQ7DaVOK1bUnkW8GC8hO?=
 =?us-ascii?Q?rCtu/XlCpmGaBPLqvLZkU/k3fIp4nj7lzYTvqJvJ6ULuKM04R7oCxiJnUGYj?=
 =?us-ascii?Q?dEgKYnUGuieGCfHKyG2d7nzRtrIkrxwJrnpl+Vuy+JfGRRzcD1t0pZHGcE+C?=
 =?us-ascii?Q?avH8RHdd0UHiWX75M6NIKOIKJqTc56n8cM5TKoPkdScN+5DYDouj1acZv9Wv?=
 =?us-ascii?Q?OEdyBla81A=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1396176-9819-4df3-d5f8-08df26b73c3a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:14:14.6668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Pm8YVuX3w41VADQHFCU1PbtTqQGD5BgJepTxNbTYfqDbdTAE8EJZ+vM1iDOe+eF1AMMCp5z3y7Kya4n8/99UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7916
X-purgate-ID: tlsNG-42698a/1791627257-19AC09EA-7ADC527B/0/0
X-purgate-type: clean
X-purgate-size: 1209

From: Ross Lagerwall <ross.lagerwall@citrix.com>

If L2 accesses a debug register (like reading DR7) without L1 intercepting
it, it locks up the vCPU. L0 intercepts VMEXIT_DR7_READ, which disables
the intercept for L1 and then restarts L2 which re-executes the
instruction and then this repeats indefinitely.

Disable the intercept for the current VMCB if in guest mode to reflect
what would happen if the VMCB were recreated via
nsvm_vmcb_prepare4vmrun().

Fixes: a59a7be91b61 ("nestedsvm: fix DRn handling")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 71e48351f22c..8f97f6c31716 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1657,6 +1657,8 @@ static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
 
     TRACE(TRC_HVM_DR_WRITE);
     __restore_debug_registers(vmcb, v);
+    if ( nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v) )
+        vmcb_set_dr_intercepts(v->arch.hvm.svm.vmcb, 0);
 }
 
 static int cf_check svm_msr_read_intercept(
-- 
2.34.1


