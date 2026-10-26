Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423D3606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 07:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=JD2+claw
Received: from list by lists.xenproject.org with outflank-mailman.1460811.1671669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEz2-0005dj-TQ; Mon, 26 Oct 2026 07:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460811.1671669; Mon, 26 Oct 2026 07:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEz2-0005dX-QR; Mon, 26 Oct 2026 07:19:04 +0000
Received: by outflank-mailman (input) for mailman id 1460811;
 Mon, 26 Oct 2026 07:19:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xLEz1-0005c9-I2
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 07:19:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLEz0-003MoA-V8
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 08:19:02 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefeca-e002-0a2a0a5209dd-0a2a4507cc14-48
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:19:02 +0100
Received: from [40.93.194.7]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefee5-b4ea-0a2a45070019-285dc20798f2-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:19:02 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by LV3PR03MB7586.namprd03.prod.outlook.com
 (2603:10b6:408:286::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Mon, 26 Oct
 2026 07:18:59 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 07:18:59 +0000
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
 b=A8Bnc+2Gk4aQreutl8m8oIcOUiHcId4Y2w9jxQ8/aMLN7218DWDieXqkLZA0dUuucmNvrfvS3jvEd77LoS/cPvmTV994LBwDv5EQjzTE65OYoyBPHm1bgUC1FJxy30j2e3AL7ty+mfLMWdFgTsxmgcpA+5hmQH1n655YRS9SIsgHC1FcEo3Lrvj4BuThR53IalSMm3sA2NRMfpH5+FVTT7+etDIbAs/kSYQoFWwFrOQbsX2BuVF8uokIfQF0H0644cC6c1NwDf1JrtQetkZsuo0wdp+eobQ0pdeIdfCCGGjmNmFlJGnCeuO8WoQF1sY2HHVteHhyb7PWkXEad1oUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Rjw15GNe9uAxxOV8gF02IelZ4k42KeUNkkvV94GvCw=;
 b=ZLH3Fz1BAuVuubniLB5GyDMm9P/Y1TtBVgGdQpr9j9i3/k+Ng2sbU46zq7H5rdYZOFnix4bOAWtGaJNXcJlCOV3j/HDwXcTm+V7HkOSwM99gb/Ff3HoGdllGMuxYQP7c1PiqgaCZq5PFC5JOVrhk7SWmPS9JKmO04o7F31Y4TyyDOjoEtGquVMolA0tgaYUQzAqJnntF7AH46zoKi7wkaaga7bRRUMo+oMXCYa8tjXJ8SL6aMNpJOHDSakQsP+S1UhHkxzGZ2LUxQF5E83cg+nOXxhHYhnK3Uy5W4U82zuAZ6lRQgcUVzbu7NNT9LC9G6THFLgG2eNhb4aLsCeZTZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Rjw15GNe9uAxxOV8gF02IelZ4k42KeUNkkvV94GvCw=;
 b=JD2+clawBQswBrKlqhGgZJTRmssYPDCDsBdMXB/NYJbCy+zMtsRpJKHlxXve7kU3oYNFAehgpqv/NKI2c7aq8oJyLvOdyEc1tikzcDcOLNtfD2up6jfR1JGXqJ8dYHSl0OATtU00rdroYm56eYvNmnA2/HhIj6Q8qOL3wrSIEHA=
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
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH V1 6/8] x86/p2m: invalidate EPT caches after flushing a nested p2m
Date: Mon, 26 Oct 2026 15:17:52 +0800
Message-Id: <cc9d3e2e87f027312b565b75847ec5d727adc3c8.1792997742.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792997742.git.chunjie.zhu@citrix.com>
References: <cover.1792997742.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0091.apcprd01.prod.exchangelabs.com
 (2603:1096:990:58::11) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|LV3PR03MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b47141a-728f-4f34-9d36-08df33316730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|6133799003|56012099006|10067099003|11063799006|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	NIna8I5h6J8WX0+oyZwoVhUaNurl3pgkv6qHRBKWE+MlU2klVv8p5JfSsYdLp9kMK7udrfrVMg/04cnQBUnZ7JVL7s+OwK3dJHhk/PTknQeCGxnVdsUhNOZCr21eWosNEkhmZoOqS90oowZ3gtnBrfH405qwdDJlIvFEHlBfgN1CAjRdUVfhVeUtZ3KWJniBYLIChqVB4O+peJohR7y0n67JgfDc6iF8EuBlh5iHJ9eksOIhxhd3xgeKROFzRi+7QzbvJX1ZeSKEuUbkU02Iwk1M/d0SUpGRxVzJqZbSKvn5ilAaVMlLfRlzpxMHQaCTlOyq95FLQFd8boRyMmwIbX9ElzlFVJuOukfjZPvLsGWEXndC4/IvgA7VKxYAkWX1ylaFycWf0kJGMM6Wl6bwJgWpFmD9hc/LB4wvyYMjwTvbl1moSFHmNBX+0H8PrAAL/736whzTuFMSpGyfposSnmHKpGl1sqA7znKTHCScrDGLj8Y6/f75i9nFPFQHAOomMGeK+tYH1b/2Xl2XwehvW8d8HO4dISrRBhZ3hCGCpVvCdlFSh1Qb/FCyFdpqTNOMo1OjJtOoWo96mQG481akC32wq/49sQI0b2fGoED6+4volHVsbS3JtcsXe91hmpGTdzXdzCGmgOldms+tkmWfdKzENefRhVq2jdNCieRcLKk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(10067099003)(11063799006)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OIVvLlu9/06B5z6i4d6nxakGrWm/7tUI3x+CA4ZObd/dlhTHnyQYPhgr5ZDf?=
 =?us-ascii?Q?soTNHuSsQVgtyW6IXIjkxoNhs9qqVrTgejQWKuRIFJ3XZlOlThtwLYa7h/M0?=
 =?us-ascii?Q?SctzBz2zHUaMg1X8WiQQfkiq2mHouTwKf+waNlNxcu/6ytkfaMVNlCCPCquQ?=
 =?us-ascii?Q?D/TmwIPG9MU0JpwG6vPCQNdRGMrzkjNNDVj4NlDgxDLafuDaHUmTrV1JSgRa?=
 =?us-ascii?Q?lhsUJVk64qx/qr9fjkyioWVtNp0C5JMYuvUfaBDng+alKSua5WP4j80pY929?=
 =?us-ascii?Q?JKvqW57kFR7kHOpXR3AlxWwG/B5AzkIO1kwhvuiJwboLUORTlLKeB+mI6Ph1?=
 =?us-ascii?Q?4NDdGNN1qyvuj6hFUwVVLQLjy3JDU/zYjoVOREpNthZp4u5t3bVPQHEBr2xm?=
 =?us-ascii?Q?YoTMahk27Gz9Adu/AqrwSt70x167Q7ciL4ZH43GaNjmL14GLMxJ+Z6hARi7d?=
 =?us-ascii?Q?yZ6QqGXPxdEO6Dqj4OOwxdmnnOXvAAXyMtJYGySJQ6qsb7HAjCZV4FFZDOTI?=
 =?us-ascii?Q?fcE9eMqoMcDGVQc3xUPuDtnw5sNA7g+qLSS2xJput+eSS7TgsjtsXB8oAFGn?=
 =?us-ascii?Q?h+xOyeoTX/qz585855+BE+Mg5gylO1dQOM7b8IZ3xm4R3LwB3Z19GudNAdWT?=
 =?us-ascii?Q?lCrpu2exG2tJo4HhJYa4vm06uFG0WcdoX9B1LKEhafRSXTFzCNvjlFkStn6R?=
 =?us-ascii?Q?j9TYzbQ4auLrcQQjPfbsjRQsJCydFyk1RmAmihbklsUt3u/p5ABzdGGVMVSN?=
 =?us-ascii?Q?wLqze30BVjRSBjjUlDxd5Pd4Tw/CiJXds/WSDsjP6kUGgEnMCEM1nAaivyP+?=
 =?us-ascii?Q?0OPyFVB6qDjLW1M45tR3sCHCR1bJqx40mjixSMx3qPNZ2681bCiYJl76Q/gg?=
 =?us-ascii?Q?FE53Tff3qIBEYVQDfZWPy37DUSiuQ52wXf2atGt8Yjebfgi0K5BF0Hmj5VDA?=
 =?us-ascii?Q?tmkECZOKzruKWtfBagHfTXzo+vLoclv+1RqVYmoDFVv/vWAEJjRtwUIHCCyU?=
 =?us-ascii?Q?mbGkeH2WomSn67kb09YsqRMnZ5KNYGKzBMa7e4OP+wLyEFO2YHRdDAns4YE/?=
 =?us-ascii?Q?BEAYHcYgVhb0ExeEKnoaTWbHtqNW0aDf5Us5G3Unbm3IYxDy6EcM8mAh1FE3?=
 =?us-ascii?Q?P1WsIHwr0lR9aVgg5KiPGhOnSI+x+Gm9ANmQVyhFFz6nNJSVJTqZnViEwNu6?=
 =?us-ascii?Q?g+4dlIzhCOLLSmHoQY58+z8GrpinkMjmDXtBtTpLyX3NxW9RFAEdM++CFgEq?=
 =?us-ascii?Q?2DrcQm74vWTlUctT8SLPstxGA/7EBBJjwJ+nJyAUIUdvakb1faQJ67C+hT3L?=
 =?us-ascii?Q?ClxQ+nOHwrINII7xjOZ2/dRSWIGLq8Dn3xr/JXgSa4gSC1048DKL8MhjHT2I?=
 =?us-ascii?Q?viA8eq/12yK5hNeXNvi8YGjV7da5h0vYyV7AjMq/hWQBHF2h0QRMhG0GtFK3?=
 =?us-ascii?Q?DCxUjUdSgpLeilHSqn5vuv8tmqVglKmypAdl/5xUGF8pdUnBE1xBCGD0AePp?=
 =?us-ascii?Q?OC+Es+ImUk8dfrTue8N5xay1XbNyzrrdnOMdIbcMnOedPflduGjGyqAVB6mq?=
 =?us-ascii?Q?XQ9qcoXYQ1zbDlM5fcuZ/hm3y5Bw+KfYZSEQe+Y/187nLMn4mRj3+7JAsmxW?=
 =?us-ascii?Q?jg8JnAJclPzbgRZEzJc5TPiYGCihoIpU7WssUdhbBE7nRKt7QzW+nnjGDKfM?=
 =?us-ascii?Q?oVTEXrQozVM3C7gU83HnYParSxk30BKeotWhIEZ26z3SzhUet5t/PkBnb6aR?=
 =?us-ascii?Q?ADQx/kCdsA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b47141a-728f-4f34-9d36-08df33316730
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 07:18:59.0294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0KX0fN6UBz1/L+1W8tJRZJyH4zywJtxraktVkL399foRz1kqctDrhfD62Vqc0DY+dvFmlf59nk+KwUviYpa3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7586
X-purgate-ID: tlsNG-ef75cf/1792999142-346CAAE4-1FBE3EB4/0/0
X-purgate-type: clean
X-purgate-size: 2390
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

p2m_flush_table_locked() keeps the np2m root page, so the EP4TA is
unchanged, clears it, and returns the remaining page-table pages to the
paging pool. The only invalidation it triggers is
nestedhvm_vmcx_flushtlb(), whose IPI handler does hvm_asid_flush_core()
and drops the cached nv_p2m.

That only flushes VPID/ASID-tagged translations. EPT paging-structure
caches and guest-physical mappings are tagged by EP4TA and survive.
After the flush they can still point at the freed np2m pages.

vmx_vmenter_helper() issues INVEPT only if the CPU is set in
hostp2m->ept.invalidate. ept_sync_domain_prepare() sets that mask only
when an already-present host p2m entry changes. Nested flushes (L1
INVEPT, np2m LRU recycle, p2m_flush()) never set it. Filling non-present
np2m entries afterwards doesn't set it either.

Once those freed pages are reused, or scrubbed (0xc2 pattern on debug
builds), L2 walks through stale cached pointers and can fetch or read
garbage. In practice this showed up as L2 guests executing 0xc2c2c2c2.

Mark every CPU in the host p2m's ept.invalidate mask at the end of
p2m_flush_table_locked(), so each CPU does an INVEPT on its next VM
entry. The cost is paid only when a flush actually happens.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/mm/p2m.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index ae13d36fdab7..fbaa69d4f43f 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1446,6 +1446,17 @@ p2m_flush_table_locked(struct p2m_domain *p2m)
             d->arch.paging.free_page(d, pg);
     }
     page_list_add(top, &p2m->pages);
+
+    /*
+     * The root page is kept (so the EP4TA is unchanged) and the other tables
+     * are freed for reuse, but INVVPID/ASID flushes don't cover the EPT
+     * paging-structure caches or guest-physical mappings, which are tagged by
+     * EP4TA.  Without an INVEPT, a walk can follow a cached pointer into a
+     * freed (possibly reused or scrubbed) table.  vmx_vmenter_helper() does
+     * the INVEPT on every pCPU's next VM entry.
+     */
+    if ( cpu_has_vmx && nestedhvm_enabled(d) )
+        cpumask_setall(p2m_get_hostp2m(d)->ept.invalidate);
 }
 
 /* Reset this p2m table to be empty */
-- 
2.34.1


