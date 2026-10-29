Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F011606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=RH7ubsD1
Received: from list by lists.xenproject.org with outflank-mailman.1464202.1674941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJcf-0005jy-Mo; Thu, 29 Oct 2026 06:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464202.1674941; Thu, 29 Oct 2026 06:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJcf-0005jr-Jm; Thu, 29 Oct 2026 06:28:25 +0000
Received: by outflank-mailman (input) for mailman id 1464202;
 Thu, 29 Oct 2026 06:28:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xMJcd-0005iC-QQ
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 06:28:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMJcd-008G5z-7B
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 07:28:23 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e775-bab6-0a2a0a5309dd-0a2a4508eb08-40
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:28:23 +0100
Received: from [52.101.53.57]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e786-f659-0a2a45080019-346535393019-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:28:23 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by CH5PR03MB7814.namprd03.prod.outlook.com
 (2603:10b6:610:213::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 06:28:20 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 06:28:20 +0000
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
 b=YJbVM5U7s6yKgYfKwsuUBKxLCwo3kOuXfOE0yyIyt2NwR5SWEHntrCfhhaukbMsleyw70XbR87dSEzEvCyksOrDvCzDwuyIveOmsse5EdTEtEU3Nva5ha6Kwysl7OhE0kZqAns1dpgAIfUbSAc014AGau5prt7geoKL68xvIa+v10OHfgibVlnftNZjFiaaA5yvdEiB4ad7u4y5Fj2d5gHZtQrrKm159zxUsl/vW4v61bJNrsnrkwRLHVBLIXEYqj7xbf4lN74cPjVQkJTM7lxNuJ7g4x1/iK/Gxd6ueTJmwwa3gU9x7pWpnHyRbvkM98ArmHH6RJbF5PQ77T/uNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fayPtOf3yWaQhO5MvhVZiM7bufGtKK/IQBTh7y6MYE=;
 b=Jfrjitl2HAWmmXAfXn7dw9916CW1+I4T41QdpI7YlNBMuadTYxcr8YQzcIHp5xBSzlo65grPepKMunCWczSlI7ovc1YoXkcCMKfh9TnpxYRnzee8xwzVYjRE5t8B5R8tvw8Bz2BNSxoIewY8w8VSVA5MkXDVIyy1pIXJ/3vCJOpB3sInbhNzCgXesmU73grJvkHucS0sDTn36DwQoL08IBe3YItZ3E8Kv15XE5mvlwwApdT6r8e8Z6JQLFrr5o5WM1yxhhVJEI9tqPcNbeQHryPgWIU/mrWQKRPVw4DESCihForwrT+ArAIKwspGWh/ViB6Xmvb5nPzq++nsZRHieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fayPtOf3yWaQhO5MvhVZiM7bufGtKK/IQBTh7y6MYE=;
 b=RH7ubsD1ND8MkQ/+s1sOc2AD9I7Rl2TZCGhdLx/i3W0hPDLova8HTK5dx5DrlBvnJ7D4dT0ES/OjLq1figT01k3lLM0LDCw+K94+ilkCYw9fUDzpe36QmUl3F/Nqks99Af9RFFVBGuT7tBaFKoPQ5NVaQW0ztuVd7TgI1IZWI1s=
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
Subject: [PATCH v2 5/7] x86/p2m: invalidate EPT caches after flushing a nested p2m
Date: Thu, 29 Oct 2026 14:26:57 +0800
Message-Id: <dd3d1b759658f8f084d4e0e694fc25c70904420d.1793254779.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793254779.git.chunjie.zhu@citrix.com>
References: <cover.1793254779.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0106.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:cf::17)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|CH5PR03MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: a315f208-aaf0-46a5-b1fd-08df3585d34f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	653/ZMybAoxF/biXcnrLRvPyzKP1gfp3n8oE9GWWazsMze+gzPHYW7kH9vp0yfgZ6gf4nzWjE4x6Wh4n5nsDQgtvNxHCceTDm++hBfIJO7I/eQlsq5FWQqgGigQcx9OP0OtK9L5Jrs5XTCZlP08cHgx5sdXjp+0KPojdH0TT2Rv85PLsMqmFD4P7TZyZyZltKpnEqjxP1vKyuIPnFvNgu2gQ15CZcRl3mCncZFVr0SQ5UXDTZOcDLtBdyLlUv0XSMOfQWfTg4Y+rejzC/fXeL7JbiawCEFdI3Lu5KANUD0QVZTDJJx7AroP8nj3b+tCGqa5LAvtI8kncQvXNWRy6C4pfWE+GKNTUetWIGTxUXvjeOdm1bVkAu4+P8XblNcEE7NM7NaCu8+djq0uD5effvXkgw/ENyI5WJ69mnaEwZUAU4wDQ2m7Ie4N7vJ0D3XH878qpIDbUueAXxJAfpJIRU6eeNGXPjZIzaj4sFxw+tHoWu98PPILvz/KFziajOIDoH5toRcoHi0nslRyHFgT8PDtPOaY70MImXYr+N9dlTthumP3qn6MzzoGMi3DqfTu+WexZ1exP4RCCwTH6h7F75CtJP4rqY2YVmY5gxlM+4mZkA+MuYSkwlqilXOzcINA0rMahXWACw/B9BGKp7J0MVNthxHLBmDyU2Z9nXS5F00w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?98yrsUVmAwUJACJ2ipezvrl5s1PxmJHB60u14uGyWwxcy5GKt9QDFtOuAtsm?=
 =?us-ascii?Q?ICDIo2fM540KnGqnvtSiwKL0nv6jcpkEcjPwhzo+uVohCC013bJ+B2PyRwHZ?=
 =?us-ascii?Q?Y8hXUAQU9sC5+Y+pO2eo+XT5ChGxW/RanpIClm+OxRVs4UMdiLymyNrxoUpH?=
 =?us-ascii?Q?ay7q6ibBH6Dcgb+7cQETyUqMOgEJAS8hmm6beJgsWMN8g6SLE1gTC+67Sr7U?=
 =?us-ascii?Q?tEOKs9TC0zSFh5O1H4P3Ugw5Alt4QNmMm9cpshGx8QXELDFamKC7OK6nF3Gd?=
 =?us-ascii?Q?uVGCIKzi/Fof/0rAMVJSB8SeYgZ1Qt4GrdkZSzRYL4Bv0L1q9e+JcfGtiNcN?=
 =?us-ascii?Q?oUFE9WYhCK05rCJnjH44gDrTWBXMLk15aFCasNsp3XSgEuSYTjbkDm/kYT4z?=
 =?us-ascii?Q?+jfI5DpBHLCqvgMH+ecO2/OE/njOLOa8u9kbF+8X0qwrMqcxS2AHBYGZGaNS?=
 =?us-ascii?Q?TJcMolWb9cw7NXT/bunhtLxaV1rnyS5Mvewqdzn0+E9iNRygPv+vTydzncSc?=
 =?us-ascii?Q?sm9hrDRug0bYzbSU7TVASqabq9PL58pI8wTQHMoRStKYm2bathupVhYnGtTD?=
 =?us-ascii?Q?/sJDEFh6ngp3uHCMJxk7JnIXwae2cFOha4qULTo/dbYj9m5yJyk66Q3XkCDO?=
 =?us-ascii?Q?vVh0GUutLQCihQHF37UwTzBeeVAVFfLXbMr0r2Y1nrUyfEEAi0M71txyR0rY?=
 =?us-ascii?Q?12Wp2QGjje1oiI5Ih0ffiIGdgqy9lc+Q70uwi37tbkp5OI/rU41AVZPNaYCF?=
 =?us-ascii?Q?QGDAlbizrjgEeX/2qdlhm9VTETrx2TYhoTjMKtk1Xy8MgZM7zuSz3MLn+xj7?=
 =?us-ascii?Q?8rH8j6XJYNk6k6vhJp/bfMqDXGRP/lNGkPOgvvRdVCM1TcVIMF2Uz5CwuRES?=
 =?us-ascii?Q?5U5mQrulids1BFhEJxqugHmLNN9Sq24x6WZb6Gn64DcbJAY7ziOUQdZqBV1G?=
 =?us-ascii?Q?q1FIAsv7u8oYnPqEGaos92L0FDC/Rm2L7ipX17p+ikCwV2n0MAIxuLFBYl9c?=
 =?us-ascii?Q?uhXic/KSvaZ8celdMmc7n1DX6gqapaVvbg64ReM5mNTPLo3roljrC6c3N4RP?=
 =?us-ascii?Q?pluLI1H3b1K3UkeVBJKxIXDH+Djr1ErhXbBIsyHaVW8Rsthqi/+dgSnF5PWD?=
 =?us-ascii?Q?/rlR9lJE3ohZhr753Yw9ya0iKojORIqiu+IvpPmrwR7fTWZYVA85nfipB9zF?=
 =?us-ascii?Q?Xe6mwfWjM3kpmr3liQZrwAPTSCaUVp3LE2lSk/HYxweASMTkZn9SKsHNOQv+?=
 =?us-ascii?Q?JxhdNW9Qls8aKFXDJC4LYWBHpNbJLK992gxk4nKW1DMcBQfSXlVFpXV2OJHR?=
 =?us-ascii?Q?OuKczS20S0oHHM0kQxJasxGOFvYAuUIIlydqSL/R0HDosZe1qczG/Z0RnWpn?=
 =?us-ascii?Q?7uDuTB+pbYQp+6OMiYr7bxcMUYgUbzNJuIivAwG4i6cQl3nF4R4I8ma8zMgK?=
 =?us-ascii?Q?zugfnH0Q4se/03h/1r7zZkmopC/IdKMyOJzZywnqO3tCfSM8XPDfGZGt9BtQ?=
 =?us-ascii?Q?UMoOtU8PGK+2VtCyc+SUez0Ib8hLD1E8x6g1EvKq2GApXin4BgX+iIsdOmoD?=
 =?us-ascii?Q?Ub/RvnuSeWS7dd73aa4FgHnQKx6r/BYJ04jTWpmqgutzhofgmyBzd2a1Xya4?=
 =?us-ascii?Q?Hix2rrPkSrFN6FZweB7H8XPbFKEiJs+ppk+44aFhhuVwMFLb8ilO1+A7qb/Q?=
 =?us-ascii?Q?k9S+oqZKxkdmyRO0qMfqFMAjyqnhkV1uoL/4LsAaarKnOWNtFAlEoSyX1EdT?=
 =?us-ascii?Q?KqJPF4fKew=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a315f208-aaf0-46a5-b1fd-08df3585d34f
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 06:28:20.4619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hKH4anRK/y9duVHAIW0q+h6sHi4ShBUCrTE9rQWTqzLtwhRsmIQa1wwmOsapdaYCQ92iEAnYYS2IdUTPZis0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7814
X-purgate-ID: tlsNG-c1860d/1793255303-CD94A87B-C789FDB7/0/0
X-purgate-type: clean
X-purgate-size: 2390
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
index 7660ea48fc64..77e3d9b57574 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1425,6 +1425,17 @@ p2m_flush_table_locked(struct p2m_domain *p2m)
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


