Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17AA606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 07:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=nRf72hr3
Received: from list by lists.xenproject.org with outflank-mailman.1460792.1671652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEyd-0004Ss-91; Mon, 26 Oct 2026 07:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460792.1671652; Mon, 26 Oct 2026 07:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEyd-0004Sl-6C; Mon, 26 Oct 2026 07:18:39 +0000
Received: by outflank-mailman (input) for mailman id 1460792;
 Mon, 26 Oct 2026 07:18:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xLEyb-0004Rq-RQ
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 07:18:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLEyb-00FZ2s-87
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 08:18:37 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefec2-e002-0a2a0a5209dd-0a2a4508b668-10
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:18:37 +0100
Received: from [52.101.46.66]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefecb-f659-0a2a45080019-34652e425fda-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:18:36 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by BL4PR03MB8107.namprd03.prod.outlook.com
 (2603:10b6:208:590::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:18:33 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 07:18:33 +0000
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
 b=g3sh2B1qY6dVYDdvuUQN1Al4Szhw5h3seRh1CuYBbeOlq04/dy2Pd7QAWwmXX91BRX6ZVu2QypIuCXUcuG4ame3D4KWPqFIMJRPSUMDAqLc2ouPHdX5VhxM6ayZDDY7mRpxkMJHYlVM7vrX8CVtavPs7laB4s1/GOkE/qAnRTa5LumHxcfi/uEHx52980VWseuLV8sOy7ZLbd8GWpHWPHtSedfOYMqimPqAUJqFnq+lfhPAjYIbylsoTTyyLmgOytWsSFsnQrDpUfeY1rzuzwOyr366mMsxItYWqigfNlsULb7MBUFTtZ9+2d8kza9qt/sw4w6I2Xl54I//8sMRVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZDuCpDYvdU7mV/NT2kdqpjM+lsi+Sd9ryo9lHvaES8=;
 b=bHHvg0GuxuOkX6wA1uBx4WVvoHxf0aPiwkU/Wv5gC0YrLuGeywnsNQ17vnU7PQKKeD/jaMAs4TUZUNHVVb78B0DfekdT51EWlMor7g/78dB7UHuQ5rtIy2S+Lg5DhwXf1PVEkN3dVjkVqt0ryRxcNVmkoGjPPgA/ZXbSjXqldeBDy0Ya4Iq77Srea6a6NifRZBvIjm4y4LJaXRCyvDJ6rBsdOIxuPzvj8lHqch72/QD0fCifxi9+d7xqw2S4yofReiWq1AoMaaBmzXwLa/IN0ENJctANNGcqIsyV1sJ6vzNDYYY4kIplHtPq2CB/gZqvDyV4LYo6oYU/N+DNZZuGcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZDuCpDYvdU7mV/NT2kdqpjM+lsi+Sd9ryo9lHvaES8=;
 b=nRf72hr3Z0WRue/iEBux5T6Xd/TATaFXAsVntPGuXCPmh/+5bsvBCVfQxDcYbXHKyADmQwHyH3rt6MrHUy6PEHjbrn/HCvYV4fXiuUY50p31+caFT4OwkkX5HXWFaJVOhmC5h9csUffzra1QB9iqQikrR2OMtdBurB+5wwGhCOM=
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
Subject: [PATCH V1 3/8] x86/nestedvmx: Emulate L2 accesses to L1's LAPIC page
Date: Mon, 26 Oct 2026 15:17:49 +0800
Message-Id: <5056987209476136839c156c97f8862aa585a6eb.1792997742.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792997742.git.chunjie.zhu@citrix.com>
References: <cover.1792997742.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0157.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:cd::14)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|BL4PR03MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ba7e9c-3c66-4f29-806c-08df33315790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|261009223027099003|261021121427099003|261022075727099003|261022105027099003|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	efaOh62da9jvXRLw/+SdgsduXOMICyMu72CFYqcFZ7+dQB0RKmUHZAIlpmzhK68y01LPVNY59w4yN5YT8l61pO4XtnxXxVlAtn6FDXQF3+zme1C+nU+WZ9+D03T8pIML1kgnIqmX7t+HMxgbGyDlrpYyuNC6s4BjJ6p33Gsf3rsw9Fzlg/LnjGXRpOemsg+15WpFV1bLjJFh1MaYxDi7TGfZYcaZvMTvKreMsPfAgV3V/g0q0os/dSetqlvNAIFglvodTssUNmjUSUe8L2ZpjCaUr586jufMPZJzvovJK2jvdXxYm0RGpMZOeOqH7aCfuRgA1x4xXewvHDrcIspu00fpLfkHMy6HH9uhxta8iRtOdr5zye0T+M0R/XWstWJ+8ZZixf2AspOKS/ExKBPGCX+vX9AdNZWViyVidh+hwTyc+UJIzx3A0WYmmKp96yb5AkBmrWgrJk3Hx+stylJVKnyaKIlI61cu3DKZRSPJMU9+hTiojyBSFFgTMwAOynDYIpK+J3L3IgSEuZZ9YgpeRZebL+3Cz5rO67DwaFHs4lN7d2gQXEI2yJLbaTOsRi1FEshguiFlMzvmkfpDKiUXCHbLHg12i/iEcYYiIDys7KY12xYksDuNvhYOIxHRN3r/5usmP/WcxbJPcVA3TWs3Te43MaL+Bq02ExXx/xWj3oU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(261009223027099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x6mzLwvtPT1HXRGow6jbPH3e+CarreXC/lGaO3E2LbnLpMgD6//qgXP/Jn/G?=
 =?us-ascii?Q?Tq8Qn4AYI9NCvXikrxk/kka4cW/WlgHEU18d2dbZ1OA2NMGoLopdc5wZlmKK?=
 =?us-ascii?Q?qWAWum8G+Y+A4SmPWbLhUgzF1rqyms5KdT95pWIEyG4Wwf/GTvS/LFkXu0ko?=
 =?us-ascii?Q?b4Mc3HKDjEiCmr4vHha1WXvx+lKKh5bL8ornlsRc2dyM3qBYVIfucxKS+1qr?=
 =?us-ascii?Q?boIOL3hj2HsePqXs8Vc+hmHP720xiqZIMXASUMwg3m6ou8NdkQKZc2ILdF6W?=
 =?us-ascii?Q?T7WuLU94H0hauotf21Ds6+yPbGsn22qEjVc8pF4u9A1rz/JfFU41vN3dw6JE?=
 =?us-ascii?Q?JiIURk5zuSX9CUX40XHE5ZLzlKoSw3opfUcsuDGijt6SZsCs2sDnoQpgnwUJ?=
 =?us-ascii?Q?NZ+8LkYmAnpt0dH+eFmM5kEqOt0k2Z5iscexr8HdnKJHexDEcPt3I7gLV19I?=
 =?us-ascii?Q?bXr7NE5u7jy1Tn6POYR0DIbytXVZgd08eU020s1dvT9CoP1JBVHLlmpsSYCV?=
 =?us-ascii?Q?CYIsdn2ZxB7uPRp2mz9HhlLXMjXkePvEnoGL7gFD0Y+GtwuxZQF7ETQkK9Rw?=
 =?us-ascii?Q?NPzE96xuwJBzxvWWrNHSONKghhmhSvVh/rewBtJyim2KqrtB6bHobYeLHyJv?=
 =?us-ascii?Q?JPJZZFpZJTklZ4KUYKDK2jV0z/XkLbKxtYKQEt6fxNPoTuuueyoCZNLthjBR?=
 =?us-ascii?Q?LVRlZmljaGpQ4pqjSWMI0lxBLLfgLMu00BO5Lfou5y91bHc/maE5BoXnPk+S?=
 =?us-ascii?Q?aAtVkJSB3j36tihm9Hmu85lc6Nn1KBeZFZA+Vi9sEsKd31KmPXSNLGc0SYpV?=
 =?us-ascii?Q?Duef62E2lopDsCwcy/b/4atCVC9cWNXRZL1Ps0vvROKaUZRoQnCmNaSr2f2i?=
 =?us-ascii?Q?sV/ZuL992djAfci3dy+yOo5kbxTuOUa/pnuvRIFVcJcAU2fIYcmoZDjkeb/2?=
 =?us-ascii?Q?ZkoKARz1kGWQcZDKIXmv1FuSc+iXVn30RsID+0bwbIwo5OWhxbZq8t5w4ula?=
 =?us-ascii?Q?L/O276HSwuvCXR/G1KScm2MDZ+ZIGZbH5aN55qVUxpsxZkjZWsHQVFTUbBNz?=
 =?us-ascii?Q?Ciat019P2IvO/B6FcY1Q+LEynDLCXXG5UvHUWGIBZ2wROzmbXmB++r2tz6iw?=
 =?us-ascii?Q?BMcqWwwgvlhaKDeShRBDQ8/HIoNChokci6jSk0w/+ehzUaY7PdPi93ol0+co?=
 =?us-ascii?Q?a3vSQ8ZqbLorJEnuHjdp9ZyJY7SmqQa4obsDZ/3kvomxFlDn9tAIwJAR/CAn?=
 =?us-ascii?Q?+7sP6yA6Jm5eBw3lohmO4qzyZi21bTdC1s0npYrbGFvidgp4FRgKwno08cp2?=
 =?us-ascii?Q?MyYDpoTF3F1YsHllPmUApQ0fYrnE05aAgXFKyO9qJyWN2iSK7HHY8baK83/+?=
 =?us-ascii?Q?xYpppfbvhwZ8bQysxZbE3JtzZee7kyzYECJrpx6dzTIEy1/y65x7utkMOh+t?=
 =?us-ascii?Q?yul1Zkkt/YFat8xYWfBSHfm2o18mw+eBiALuoebiKGTGI95xReZxi/MiqxJT?=
 =?us-ascii?Q?LtnTWrmjOEnhz+4dRvSxuYiAVOjyh0YFBef339fq3GCe7Y6cv/YBin658UwK?=
 =?us-ascii?Q?VAerBypPSss7ffjhdXYMEPX39aJ4tGmyF6vvoPCk1hLXXy/C2NTGQyC6DxDi?=
 =?us-ascii?Q?LEWmbb2v6pB9e4lsjPw20ASyWEjQwc97goaHS3tJd/N+FUFmWKgz3jPeUgUz?=
 =?us-ascii?Q?0H1uUozue47W7oSQdZsxDEbUD7kd2zB2JWxmuD6gGsrazQVhlOFQ/QEGsDRa?=
 =?us-ascii?Q?4j1OS4gNjg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ba7e9c-3c66-4f29-806c-08df33315790
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 07:18:32.9509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTBQaFqv0b3iMsYr1MxSBcCpHiSaEOb7wTgD4eB78EXpGb/k4yayN5Z5zzOBFpqI+fBaIxDozCdtgbMQVF5qHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8107
X-purgate-ID: tlsNG-c1860d/1792999117-D654487B-0134DAFD/0/0
X-purgate-type: clean
X-purgate-size: 1474
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Return NESTEDHVM_PAGEFAULT_MMIO when the L0 p2m entry is the APIC-access
page, so that the access faults and is emulated against L1's vLAPIC.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/mm/hap/nested_hap.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index 42d588f08821..72706cebaedf 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -17,6 +17,7 @@
 #include <asm/hap.h>
 
 #include <asm/hvm/nestedhvm.h>
+#include <asm/hvm/vmx/vmcs.h>
 
 #include "private.h"
 
@@ -115,6 +116,17 @@ static int nestedhap_walk_L0_p2m(
     mfn = get_gfn_type_access(p2m, L1_gpa >> PAGE_SHIFT, p2mt, p2ma,
                               0, page_order);
 
+    /*
+     * With APIC-access virtualisation, Xen backs the LAPIC page of L1 with a
+     * dummy page.  L2 must not touch it directly: the access is to L1's
+     * emulated LAPIC, so let the caller emulate it.
+     */
+    rc = NESTEDHVM_PAGEFAULT_MMIO;
+    if ( *p2mt == p2m_mmio_direct && cpu_has_vmx &&
+         !mfn_eq(p2m->domain->arch.hvm.vmx.apic_access_mfn, _mfn(0)) &&
+         mfn_eq(mfn, p2m->domain->arch.hvm.vmx.apic_access_mfn) )
+        goto out;
+
     rc = NESTEDHVM_PAGEFAULT_DIRECT_MMIO;
     if ( *p2mt == p2m_mmio_direct )
         goto direct_mmio_out;
-- 
2.34.1


