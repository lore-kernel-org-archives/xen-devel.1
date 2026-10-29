Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B80606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 06:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=stGnrw1Y
Received: from list by lists.xenproject.org with outflank-mailman.1464178.1674914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJc2-0004AY-R1; Thu, 29 Oct 2026 06:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464178.1674914; Thu, 29 Oct 2026 06:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJc2-0004AR-OK; Thu, 29 Oct 2026 06:27:46 +0000
Received: by outflank-mailman (input) for mailman id 1464178;
 Thu, 29 Oct 2026 06:27:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xMJc1-00049v-Mb
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 06:27:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMJc1-00CK4H-3E
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 07:27:45 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e756-bab6-0a2a0a5309dd-0a2a4505be68-4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:27:45 +0100
Received: from [40.93.198.59]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e75f-4cb1-0a2a45050019-285dc63baafa-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:27:44 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by MW4PR03MB6649.namprd03.prod.outlook.com
 (2603:10b6:303:12c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 06:27:42 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 06:27:41 +0000
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
 b=DjrkIWFPJln5XVPiCYuu2AMfsU3+ZGOIU65pLH2gGcHMWd98b1GNLZLnUbneT4X8MZB9FcCsTq7Pl8J5u2nMMojATU5DAiPNaAXdorLGZEhEAOhIWOjZd54oax8j2y3dvB2BLRQSUC94R3JsuZtVXcioCmgdZ60wRqz71v5imNZg9wt/HUXxFTq4oUtfJLUIWiJf5drF/OgrCLCratYpHPYUPudDgRK0ATtgyJyJxYhm0SUVryhhBx9DBVvxan6Ehu5/1vqmDibiqaTrzme44oOfbGcR4o9dARpDP86P8D7+fkZMmWKL7TJbWEilE8+nrZMit/TNgzLY/6me2eI3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSeSBRBijBRwv/dIGJiPCgHb/dZpfbcL2+Rqa+yYO28=;
 b=cNFlFe2hJ3Nrm/C4O4hqSAHP+vra1/lEn8pgmwS1QdzhhulPr3fROwtwFzZiKJIlYiSXDf/b45RJTfv9YMI90xFxKqr4qLcr0qQN1igGIvyoqNJRPyUU+nD6Ipaxxi7+qgeU+1/yYRFaz7+Yj2dryRCPVZVmRqeecYldIkzEv+wBpxT8VHtsBCIcuqPkPFs+Kp4QcLp4pG2yo0APGaWuPzM3nP+stblFPjh61b3uSBogBYrgJoDaymdDqALHMClMpFVLqdFD0bWVzTFvSNETa1LpDjjIdsl03IiDG5mgIEoaMUKP2jJcXerMbK3ZMpCQoxakR9ABnl4sdvk8CMERkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSeSBRBijBRwv/dIGJiPCgHb/dZpfbcL2+Rqa+yYO28=;
 b=stGnrw1Yw4UeQYBQEdhEUQwj9iQ0pJtR1tVru+CVrPMPBf/MoXCUs9wNpLEj6abBddzS6u38FBhgKTnEd43tBOu+GoSIumSb66VCKktVZIeWE2TBFt7TRBtcP9vnWNcc1o88pDqUnb7mCgDvdzK5LR8g1iu7d9oMYIXmzenNUC0=
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
Subject: [PATCH v2 2/7] x86/nestedvmx: Emulate L2 accesses to L1's LAPIC page
Date: Thu, 29 Oct 2026 14:26:54 +0800
Message-Id: <4daa9052fc7d5ebd8d050965c99eda78f8f5b1dc.1793254779.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793254779.git.chunjie.zhu@citrix.com>
References: <cover.1793254779.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0075.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:c9::15)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|MW4PR03MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 3039b11d-2aa2-4213-286d-08df3585bc44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261028144727099003|11063799006|56012099006|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261022075727099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YePXTuz6sbutqQf2R9T6uWC8Y78vwdtoYZ1fw0frAwcWW2KU0sDrB1Q8nKa2i7f+U3zkLyxQkFuDUvsQj74yQbHbk4RSyp3skeRnOAZki6opj0F80AI7WPI50MWXRpNsryrRqY/j4pah2z7cxjO5Hc/xx6AF0IxhDroV7xEZpBu1bfsC8hMGfrFNi/TK6QGpq9jyznh9/lfALc2csBwCoxaent1bMf4vKeG7CBDSg2xSwzs+hkhcuKRUsPmvbbJ4/p6WV6L3sX0669cXxF2DVutHs0aTRJhtmdiUufk2H9KdfNi4xtpsNqwHso8ARQizZZdVBsqdJON/MiAkP3jIU+iG3nAO5ncybcWjG5RqyM1zhmlIpwWXPOj/4k3hfGlmKKNyg41VPy1ASR924wNmc5QLMRV328aCw5aEoZ9pfdLj9ez4qlBUCUgnTIY4Gx1/ZJYRrlWBGQPT4OpX8J5UhtkPPgyvhs8PHCNTZM598zEjMgCxitZXpQTV+K4qwPrqUfh0PSzi4V/NHQgMvVALaSoXKD+5Ou/4xGzi4oL+vIF1hnvSgYCJq27bK+C4KL0sZuinZPKN7bWvTy5jsRXusQETgC49zNMB8sgY6e4Zs+tdyRGijt+9U5RG1a7n4A4iiAdSI3/zyiixCZbPZr9tiapEIZv7aIf4Svv6IVNpUXc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261028144727099003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261021121427099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C/FfgnQDicZFw002MjejKBXOv4rQECbPd/QPAYK/xQlq6bFv4dr1rmrEqBLs?=
 =?us-ascii?Q?+EfXHmwW28wqtyDmntJiAdC+11iiCsoNFi1z05qdsi0iYk6TBN9NxfFXmD8x?=
 =?us-ascii?Q?Plj0rTh30M34vq8HxjLGhmp1qol/jeod+DVpjnJwmCQo+fXHc5zhg8eAZSWg?=
 =?us-ascii?Q?2nh4SIngryzFJTz4eMDhN6xlth7w+/S26Xf5P2v0OtaVqc6Hp9bzygMMZhKl?=
 =?us-ascii?Q?n3x2Ta9sQyATk69bu4/On/0qPiYw6U5fT875700TopxQPb/I23y97DW2ATma?=
 =?us-ascii?Q?JQitMFr2LfvEgz+ENcRpcY4atoQCBJUAJDEA4ifvvpoim/bFstXyx8BMXAQH?=
 =?us-ascii?Q?RxDNWUd1VnZUVZBB9eh1w/y7p0kOBZKFIKdmiTBJPmTJGjHMGYZQwHMOpPu5?=
 =?us-ascii?Q?OCZOQMzs3luagWW3E6T0oTTLhVNMzQDCPW5Avd9iTmqsOay9KP5qkoAwA3kD?=
 =?us-ascii?Q?ELJb2rZljMcbsY9WSBXPjfNs41vY7e2biZFF4td7luRj//E/Oa5gi6VHzdtO?=
 =?us-ascii?Q?gv69AIY9D+frp0SENYloTgvwIQvgkTMwZZIIvrp6xt9gGxKwAEIqhSYamEAB?=
 =?us-ascii?Q?XZSa/Wk4sklazupqYjXUjn3nzR9nMhvSqtBWQcrIWPV1hwzDSZi6+zAoNZ4l?=
 =?us-ascii?Q?mB79DvGrzswPR+l2ncrHlXJAMcXHsd9pRdjBi83S3iOxYqJJxuUiIZ8Ns2sC?=
 =?us-ascii?Q?jbqtIWfe2WpjdocL7l7KCpQb+vcb1fh2vzByYLSIly130VQKjhSaxpdPM0dr?=
 =?us-ascii?Q?Z3GjSqk0GY0BT7Xty8tO09GwfelED1c+gNxvzN0asUTgVx16MHXO4OekcUH/?=
 =?us-ascii?Q?DcUC6UnSEVwWho4HAa0JQYsNv9ubhqN3E2y7U3ZSTk5p6w8WFdsZoctchVDA?=
 =?us-ascii?Q?uSgCEi/fAhR578cjcsdMwww/qEfSc6dUeKHcfRKHxZGaEkSIfMrO54T041ov?=
 =?us-ascii?Q?jPAvMR6HSlSLkCmnf38eO730L6IVAzzTD0D0ptn8t2w+HQVohD6SS4Lv8YxO?=
 =?us-ascii?Q?bcpGWmBOiCCdfi/vKvkVvS70R6R2NZUFGh7DJDFr/lLjyT2QwA0agolA3IHO?=
 =?us-ascii?Q?BmgvmHyDIqhDcK+lab/gm+11sHEjTuw04pcrgYb/tkeXfLtm77RLKZk1KXGj?=
 =?us-ascii?Q?meTsCKyk2hBzsMnhBL9vpkAAK2IdzgIgD1YloGSvQjUqpzJNg7AToexBy5n9?=
 =?us-ascii?Q?w0VNIyeGEaJdoIprLSl8JHunyeEzQP9O2Azbmj7YPsbTcb+WpK2wHN53B3w5?=
 =?us-ascii?Q?mDfU6Kahj7iQ8JxE6i85qg27OnhyVSx6BXQkuiKp2ZU73KIXKPH1U5PNwjoI?=
 =?us-ascii?Q?qtXpePOmDM+grVgxeOukYm0NAKM+lVrp1cDGWJZPa2MyCi71hHP6fEER7RvK?=
 =?us-ascii?Q?4i/HpxiNQySxv7U5ttpweFRG1nhCB08CEfSuSgtxvQmrwmXGSNak/UcXjnGd?=
 =?us-ascii?Q?QzYoRLcuhcq+JHdtV+sOojLyH/5Co4aGhgPVZ3EvWAzYwCZNnSSrPdiZSZyz?=
 =?us-ascii?Q?YNd1io659AAgHUhIjK6jRoo/o33s9tYjIO0gDCzTVanThGyb9dqcpOs/JYLC?=
 =?us-ascii?Q?FWgYlN+pIxcxS3PLzu9vMjvfOETfcSuatUO3/Q8JE/MNmz4GydTAgzwHDkux?=
 =?us-ascii?Q?h28RzfeO2Dn58dRpiD2gqD7i3AkWzlpPXlFanlZ5F+nZc7OULsUnGmXpao3U?=
 =?us-ascii?Q?j8fn7+zHcLjKU4WQ27SdQc+1qRVRobTaUB3kJ51IvvikGFS+sTqneKWm0/nz?=
 =?us-ascii?Q?Oct+p14v+A=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3039b11d-2aa2-4213-286d-08df3585bc44
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 06:27:41.8945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5A6402Xp9k5kWwiQ19yAcjiC1hQ5ygqjcFCBRcWmsrO4eBR9qibeWcEQb/8ME05Vkg4+h34CJ3QXlv+RjHdbAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6649
X-purgate-ID: tlsNG-c201ff/1793255265-F5EA92A1-0D15A45F/0/0
X-purgate-type: clean
X-purgate-size: 1474
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
index 255fba7e1cac..ceabf31ec0ab 100644
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


