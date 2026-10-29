Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5426F606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 06:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=W1KRBrXl
Received: from list by lists.xenproject.org with outflank-mailman.1464177.1674903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJbx-0003mc-H8; Thu, 29 Oct 2026 06:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464177.1674903; Thu, 29 Oct 2026 06:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJbx-0003mV-BL; Thu, 29 Oct 2026 06:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1464177;
 Thu, 29 Oct 2026 06:27:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xMJbv-0003k3-Td
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 06:27:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMJbv-00FxUc-AO
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 07:27:39 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e74f-e002-0a2a0a5209dd-0a2a4509d038-20
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:27:39 +0100
Received: from [52.101.61.43]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e759-be1a-0a2a45090019-34653d2b5e9b-4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:27:39 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by MW4PR03MB6649.namprd03.prod.outlook.com
 (2603:10b6:303:12c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 06:27:29 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 06:27:29 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWPmbfvrbp5HJ6UKx2/NMHTrQhC2eIp3Tm3zHSEBcsu25gZEiACKEEjyc5XWU/yKsvRtwxD5gKVYpkTWQfD6oUMVEfEt0yeI4xqVFhSIbrHXvt2sq1/hGhUzAgQRcmmES105BV55ayg92Bqu2tTQU8fEwgKXRZ9Q/P1cZpyaIDjA3hAkzbUSCTgvTX8DWfH53gPzJTz7O6CCBauQfZxSyPt5691zw+/Su/DRHuABBLqmgog1h567I1q1IKlnCrM3Yb2/492axZ5MTie+cjfu3+alwTts1zTAGvTBiY2lIUn91OshYWraLrLJdCdTOogWZquMJEJ5RWSnsUKlbbm6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOROdr3Lsj2WWcWL/9pNfOId1Ctpk0JV6ASZ1lvZtqo=;
 b=qX1noF26Jse3mc/P0gHKci+c4bglt8wghckM0hfyHkYpHY2Wjce+zQBRLsVGvQAfTaiqPqtP/Upawp7teaRjPHFOIilNKpPmE2Qn4X6qhp+gFZpJaUzMKa3RaougTw1SMWxVUkdbONWYWAnIurpQJXvIDvDoKo9I4hUBnneDpQ2tWuo8gShrK8SSwN7jlPaOiMKFjlfXbpiFXjWWFiB0mEvXbt4s4Pjc+oFudwwlisSQ+JYu8FvOl0fM9nakB9HW9WYzQKdi867SxAH/xbxYEWxAw143yFwdcrvD6NlgNzCR/1KD7jtPCwc7GAuFWppvi02smPCaV9+WfB6BFnycYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOROdr3Lsj2WWcWL/9pNfOId1Ctpk0JV6ASZ1lvZtqo=;
 b=W1KRBrXltXN63jXhh9NC19Vge3T1+5jKYuJqz8vEpgY01x96yxEbFMDZ3TCoV9lxZC291VbZW0t6BwRzjWjWTPCWpgxb7rfaQAMIj9Q01BVxuVeMYIAstqx11kAIuloFFamWCaWSFJ5d+7yus4G+6BDtGFu42KsCA+wfusgJ6+M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger@xenproject.org,
	sstabellini@kernel.org,
	dpsmith@apertussolutions.com,
	Stephen.Cheng@citrix.com,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v2 1/7] x86/nestedvmx: Preserve hardware access bits in reflected EPT violations
Date: Thu, 29 Oct 2026 14:26:53 +0800
Message-Id: <6673ab0eec0f71d6b90e93e70d1c1ed265982de5.1793254779.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793254779.git.chunjie.zhu@citrix.com>
References: <cover.1793254779.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0238.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::17) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|MW4PR03MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eef35d0-2f9a-4e9b-7519-08df3585b498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261028144727099003|11063799006|56012099006|261022105027099003|261009223027099003|261026140227099003|261021123027099003|261021121427099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	sCE9860uG3yRP0epw38zuuFGq15h/6ybEMeumK12J9VYsXGawoSGaSRFEjsu7c0kc38V3zQJMh/re2nwuQsz2NTOS6kKpnCGlyQFmIRV1uISV3hjGkM/nb9BSxN0hRM1YVZAIE3o/MrAVVz5xmf1W5OzEFXI4qlfnSh5NJ9oxcfzRVVLQhY/tSfPVkgzqG8NUTeRguGqOLfNzWn0VdgHleZOUmQYnx9qU/HNTHfL4qYE5k4XlrDLDPug6/arLG7kT+Dmemh9gzrx0PqqX9TzQBF4cnDvC/uPZ9eDBNkShmx/b1S5m8Yol6jvTLNodVTuTEtPyQ3ySe3nWnXDczaPC+yCBAHcM/gBWqSPT0W+rejBDxwfx68AheiaZm8OP4XDI8X8jcW5QRyajFGketImFE5DnrO0ppeGTzFeFdw9K+rFEgRwqeTWD1Bq4j/bHtiXoxGYTyuzWk0axy0m872E8qn3OdXASevQxQEnM/XKk+n62VIOPkoDWdkyjlrPYTk069qFKSNL1Jt4u5cy73oWXd0TnT0mLHi5sDPyq+roIpa1fXLz16FR4zmXaSFkP1X2IqTRpn4P9ivewQtQ7mqNAbIaAEPb3eJR06UKZXWF5Zn0qhEoHIG9x53zmvCXQsl/ZBwlGUrledBRJJAZIUYmgymkMkvDkwmC3z4QldOBMFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261028144727099003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261026140227099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bE1pSlfMa9eXNcIWInXBqcJD8wr804O4OSDTXN29roFyro1Uj9pC7ZZg5xCV?=
 =?us-ascii?Q?z1DWgxL9eBe0rSD0EQhXTZDzv6yumbBl8Y6gFoZZYBFRvn79QwyLW9y23kjp?=
 =?us-ascii?Q?pdr3jCeNujJ1BOLWSBKODtnGASQb8HKY2LhFGRh8fAY+h20OTyK/5lY/wPWZ?=
 =?us-ascii?Q?dLR2RaJPaD0BJutccvLiCRR1Gj6PkFFhDk4kxv3SA4SDKZRggxdEPWPBS90j?=
 =?us-ascii?Q?ChecG+ZR7FnZHhA/T5Rl8bYmqZtOQt3gugU7QcyVhFz8GHVbjN7VxEGCo9+f?=
 =?us-ascii?Q?TXZhsYIklRbj1RSStSMTvIeVyMvZn/++kYAa5emczkh0eGWKmHokbX4zJUTr?=
 =?us-ascii?Q?n+uguwhaS4I2H1yHnDJ5c55UjVMT/B2ANSJDyva3AIW/yfdK1bac5/0rxJsM?=
 =?us-ascii?Q?2piSD7+cMEMvWYgrMsPLhk0+7XVJugPJEcjqODvrryfzCLvfv3PU8FRmAcJq?=
 =?us-ascii?Q?guo5Vk15MtXTf8K2fHsm8NKs33v/GzZRYHQSzuFnDqxRg9igHTZWHsFDB7p+?=
 =?us-ascii?Q?zEJQLQl6Tdh4TmEKVMbUbUvvh+0+DpPBgNZtUgwLaIWZhLUmJvmMaYIVWasQ?=
 =?us-ascii?Q?d7oztdNGsaTWQV6dzAaXH2DdyPz71dIGka81yiU7GJwrlqI0W6o7F77sn5Sk?=
 =?us-ascii?Q?o830wOHQ6qSfr55BMgEwRV4gh1sH1j16nUFES4C4j8rs9QgN53+sS7j/W+OQ?=
 =?us-ascii?Q?t/gp7dGnaoYg1NxhVCKQebaCeCwngQxlLHa8l3xe+ls7x+DERzQ7ZddfRWkC?=
 =?us-ascii?Q?LoxdpEjAoBmtY32rW5kVCWLCmqpPRvcVQXcSQyxk0rktBJEnTpg3PYA0YrHu?=
 =?us-ascii?Q?fqpGElRuzJSDh/tXAHLyXez32jw33YN6qWmYgrS0JHgsZF5nOAqM/JFK5e5Q?=
 =?us-ascii?Q?Ee01Zt8Z3ZIMdnfWYGafdeJqSyug1VKmMxhUERWtXgNF84REkLtY4qiZ/TgH?=
 =?us-ascii?Q?EhgjszHldNQC0gTKxyvdGGeGpA9Ww11IolFBxn/l4C6YfC+cVzQmGBgzKjzq?=
 =?us-ascii?Q?+rfO0S8eoXkXgOCCUwouonWxGlmRgjSoLheUanyIcM1QFrYLG83CgHC/4h8A?=
 =?us-ascii?Q?e7DDeKL9KYGRGFJC2S4nQZ8actUcwyrpL6P1Yjh+Nu3AgKBEiwwxrLVUx0VX?=
 =?us-ascii?Q?m2V6UfN4/WcfCthjrSMj71XdANc2NjJFZkNm27uVoss3LIoWauNUvCAvdTad?=
 =?us-ascii?Q?CGsf7QIgH/w2zUM0meHQtEVYYOtARatQUHnuxer/EkuXGXV7ZT5ScZO2ZHX0?=
 =?us-ascii?Q?xwjwgIpJ3sYiCNLUFLAiBOwn+ABzcamF85dMsfMyDqVq3ybosVGzdQ/zNX+k?=
 =?us-ascii?Q?+H8YACrzdax0N1s3ffwXxhzkJnjUr0iYb4ugVk/wL1ArisQ/ptxwyDE/A3q3?=
 =?us-ascii?Q?epL7KsqcxdOJCHLsrOtuRIZHeV6Jb8KoS7n3lJ7xM1Ux+WlUWj9QHJHbxM7I?=
 =?us-ascii?Q?R8Qrva8weBvjFRMLxGtOGFFoNHQZAn2o02yEcpW/Wn9a4OhFE3F+7eSRUgZA?=
 =?us-ascii?Q?CqiXcVbI3eDOtZfoZUDLr8FZTuixGH10t3OfMM7Z2BppaHBZXfEeUBB9NKH/?=
 =?us-ascii?Q?3ywFUJz1AUE7mplZHf4LpsJhfv7pJ6qgdvk3hebBtCDgHWPAlZYK70wH8HSd?=
 =?us-ascii?Q?N3g5UOSv2qOVPbNWgySurJ5I7E8NbhPqOQzfeYCtp2hC3EHeTt9xPmzDjkrp?=
 =?us-ascii?Q?62iGAydv3oX/7CkyPjODC3NKjfr4DEFo+e7dgLImtG1g0b+A/3VjZxBzcitK?=
 =?us-ascii?Q?jDwG/KKXpQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eef35d0-2f9a-4e9b-7519-08df3585b498
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 06:27:28.9674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrjH7+trNqDh8CEQTfWBuDDhtpa8vRg+0qUq2N5rWdrMkMAQGQF3ZxOugO+lkd4I4Vp609WiwGM+FH3DrpAR5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6649
X-purgate-ID: tlsNG-bad1c0/1793255259-BC2F4034-634B8D2A/0/0
X-purgate-type: clean
X-purgate-size: 1909
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

nept_translate_l2ga() rebuilds the exit qualification handed to L1 from
rwx_acc, which is derived from the npfec set up by ept_handle_violation().
That function deliberately treats every write violation as a read as well
(read_access = q.read || q.write), because the SDM leaves bit 0 undefined
for read-modify-write accesses.

As a result, a plain write by L2 that violates L1's EPT is reflected to L1
with bits 0 and 1 both set, whereas bare metal reports only bit 1 (data
write).  The widened access bits are an L0 implementation detail for its
own permission checks and should not leak into L1's view.

Keep bits 0-2 of the qualification as reported by hardware, and only
replace the GPA permission bits (3-5) with those from L1's EPT entries.
rwx_acc is still used for the permission check itself.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/mm/hap/nested_ept.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/hap/nested_ept.c b/xen/arch/x86/mm/hap/nested_ept.c
index d88d677825f1..e116d8254824 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -255,7 +255,12 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
         rc = EPT_TRANSLATE_VIOLATION;
     /* Fall through to EPT violation if permission check fails. */
     case EPT_TRANSLATE_VIOLATION:
-        *exit_qual = (*exit_qual & 0xffffffc0) | (rwx_bits << 3) | rwx_acc;
+        /*
+         * Keep the access bits (0-2) as the hardware reported them.  rwx_acc
+         * treats every write as a read too, which is not what L1 would see
+         * on bare metal for a plain write.
+         */
+        *exit_qual = (*exit_qual & 0xffffffc7) | (rwx_bits << 3);
         *exit_reason = EXIT_REASON_EPT_VIOLATION;
         break;
 
-- 
2.34.1


