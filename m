Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E4F606A31E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 03:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=WYhBFiaK
Received: from list by lists.xenproject.org with outflank-mailman.1504437.1699778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWmz6-00080H-1o; Fri, 27 Nov 2026 03:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504437.1699778; Fri, 27 Nov 2026 03:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWmz5-00080A-Uy; Fri, 27 Nov 2026 03:50:51 +0000
Received: by outflank-mailman (input) for mailman id 1504437;
 Fri, 27 Nov 2026 03:50:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xWmz5-0007zI-5F
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 03:50:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWmz4-00D0Xd-Hm
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 04:50:50 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6b08fdcb-bab6-0a2a0a5309dd-0a2a45039ab8-30
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 04:50:50 +0100
Received: from [52.101.85.20]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6b08fe18-fae8-0a2a45030019-34655514832f-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 04:50:50 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by BN8PR03MB5089.namprd03.prod.outlook.com
 (2603:10b6:408:7d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Fri, 27 Nov
 2026 03:50:46 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0639.011; Fri, 27 Nov 2026
 03:50:46 +0000
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
 b=R2mTVSFx+ksiZpynuL1XdRMGUxswWR7bo9ERSaCfeByOs1VqVxfXtEBG3IwsDJJdT2y9mXsQA692FLfuj7RWEJeqSSXP2fqDEC74qvtUX7MnYc41frg0HXdt7lMiZr+FRFgFKYyY6QgAsi+z3WVt/WGjqHpyJwevH9D0N/WoiNHaU4a9S0BojqNqiefwIOBywthpDgPsCAvRa2002boNb/xBnHiZilBLJ1j6nyJfDuPEVRW3m2pJgEUb8FQtgJiLqDlmqj2qlp+/9oJg9uiC4QhnFQ612OPr/adzaeJ5xi5NovP68bS5bh+7AjqcPjEyEdBUHxrYlXRCUxpM9L3XCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/WbUQZAbDDicdPQE0kH2ARjTx0M+ZDVHr3waq35m+w=;
 b=Nde7/Axz2sdWg741NOziyvJhC8+MTrV0/zQVTiokVDO0T/zjjUiUhCVpLO1rv3YkEHaE+n/qSYSl6Xzdl3mdMiD1pKT70Qjd73AqPHRgBeVRoUDG8lLwYcZ1cj4uK8zaF75HMcwD5krlhGkX34kHHPdimTSrsVbBBWxi1kwhidDp+tuNqL54QtiKyQWZnod5qQJk01p5MWsDXmS0oJpYCyAcWBQtITBXTUfZ0H2aAN/QkPNY3H1Cpfm9ZqiQxWi/5/YwgDnSTnOR69MR9x+AuHTrMRhMVDe+NnKe3r6FlCCpqQtzZeR+nw/LCZUkcSu+QyVo7otuDNeyWj3RpZFtDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/WbUQZAbDDicdPQE0kH2ARjTx0M+ZDVHr3waq35m+w=;
 b=WYhBFiaK3xpN7w9tudk/9A2G+SSfm/2hVRLK2Ctqz70WRl9JkGFzp5xmAEZn9hEwqyexVGjxQw7x8azQ7ZYD06HyZOn6/4dW8TPq0D7dg43HrF8Qj/safzfLPnwNJf9JTPkYIaU8YFYZecfZ2smwY+N/LuCFskBvalP3KYWCIfk=
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
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: [PATCH v4 2/2] x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears V_INTR_MASKING
Date: Fri, 27 Nov 2026 11:49:46 +0800
Message-Id: <20261127034946.1130719-3-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127034946.1130719-1-chunjie.zhu@citrix.com>
References: <20261127034946.1130719-1-chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JNAP275CA0045.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::22)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|BN8PR03MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a9785b-e778-4ead-e3e3-08df4c399e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|11063799006|261026121527099003|261028144727099003|261021123027099003|261102123227099003|261026140227099003|261009223027099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	gC2Jm8pLJzNXqxfvLYXmD3kxN3V1tYmgR+8zdkwSOMgdq8BMYM93XT5fxT/6KQD0tWpMVeNu27dvemiqZW9TtnfOASNlBE31+Sylcg+N0UwJwU3C+qDx7hNQFkZCzDJbiVyhpw9OoLu2P1N2FpkIYxUenJGHKUNM/T8XWvQ9izD8ubwBZS47a3WXerECEGS3NTfpYz0XyyFa7j/UzEGacQ+PfTlyQC9s/7en7MN9joL5uss+j0lpFFOAdy/mIVaYr6FkQMyZTad8WslS7w5iz13UxqVCrfTk5yfzJKuzxnoXsudayVhjGG3woux7cmm2Fpv3+KLodRbEwyqF1gveJPdyLzNUDJ/FL5uzUlQpo5+RTZSPoZDUBj7IZZwWq+4xs3vG8GZwxq7Dez1YPWKxYxwuIFpGcQdGNJGPn73it787q2kflCEyb1JXFjZLejr+lrsduawLFY1PKLL3A3s9eIeowSQMkmmScTziZklGlgPF0RCL9uEaBlq/sA3Ef9EmC7QJo539O+ofv0Eo/2RQ66ZMT/P7R96A+gRheHiIyZucVMfzoOQM9Kb+z5fJsvyLV+XiakHxeHKJfkEI3kM0loABHnwsld8qLkw1/IqzWAeApm0H2ywPrqAhKIxNMiCXsszx/QQrvMj3xCIpUUgbHWvYA1dNkR5cQWjR4UeE/uY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(261026121527099003)(261028144727099003)(261021123027099003)(261102123227099003)(261026140227099003)(261009223027099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u4nX9lEBYDrnTP4pWQ7Ah8vbpzkQcyPhRIOm9NyXpp32NN2sFejWpocjg1xQ?=
 =?us-ascii?Q?6UfhxNNhSKzLfYb5mJHRsiWRNtGna20kdJga28wDr9IoMACpOSTCyqFYmc5m?=
 =?us-ascii?Q?SbDfXhn9IphsIb0Bfp7R0UtNUVyArhiHXdXNLDCZu/iWKbwSeh6BJ18KWfDI?=
 =?us-ascii?Q?XbqXHA7IJgUWooJCb4FqIYhul4G4IxBafYFcPB3y0j1IeOczIdV6r6ywZqXW?=
 =?us-ascii?Q?v5XCbXFzWkgEK3mc08Bon7QMtW4W16PTnSmGZu/GDD0hYYbIKBhIVphP7tnX?=
 =?us-ascii?Q?NBO+xAMsYYJYNcCHV8W8X0SKP2Oo9CnNeGMKMElrbVjpU01OK8QeQOaDdmzE?=
 =?us-ascii?Q?iCo5yaH3dma8ABgFT7mI0kX3Bx5U7sC4Ho4JQCAg1T2aX7yPeyJj/zWVKP3S?=
 =?us-ascii?Q?kA+rJS9Zsb+6iQe8HaKxzJ2E0bxBbL0BJtjqOmP+VnWIBl/KFL60R89eE1CN?=
 =?us-ascii?Q?pIFK8FImZKU0+7V/hoXRYkRm8aRFMFcru0QxaOX9NkOzlwA1rhwIi/FOVBuI?=
 =?us-ascii?Q?iKQH/0NyFGkMnz1LnFlF+CTWeQKnYi89dz1Wk+KcVQtcUp3WOlkl1QAy652h?=
 =?us-ascii?Q?wmcZR8ZiA8CkL/EJ2ze1HiTMSOKNpYys6egLA2gWEq89ghHkSczYSEL+NUlo?=
 =?us-ascii?Q?Cx3+8W2ggZLcRd2tm4vRlIei6GFxaaIfdGe18PAhUT0hYVCr0C7ohXwCQyZ0?=
 =?us-ascii?Q?/sUWjU7gSJBelhzxxTYJnMsh+reDe4MnbLWW1//roKvXiQyg2HYhpSBL7iOT?=
 =?us-ascii?Q?fRKU/j1N84vhtaP5rz03vuevcF7NDIbd4Ocdl3wLjrhQ/+dKVuaKtG+By45u?=
 =?us-ascii?Q?nYqBeHiXMO5kwddRxi/ROUnKbrwS87QA0B7/VwarBoDZk+V+R6/QD1ZySL78?=
 =?us-ascii?Q?MVYdwe76LgvzNtkv/Q2qmeOi9jeQDFMg31jSFGi6oi/w4n3+dtVVXk5aTgGJ?=
 =?us-ascii?Q?4lZ+mLGIKO6n+AdKN0s4cRv0cG7j8b5bhbLnm+St/U/CwV5OG7RM2qsFUvEN?=
 =?us-ascii?Q?enQlpS2b2AxcTkZM4B3uNBenkF4FVndY39kcCuP5I3qmksFe2Wekt2XoAiwP?=
 =?us-ascii?Q?6xwncOH+MV4Wv+rk6yzwG/Sfc509lwDO9ErQXM6opOlHddIKBHYQ/xgDns3z?=
 =?us-ascii?Q?ErumSw5JOKrzULTwSEOIvK2zC8IESA9vsA2BcWm3bGINBXqfs/LpkZKDm4md?=
 =?us-ascii?Q?exJjnUxkigqgQC7SOLBQ9EDzWT4RGh+4zF1Ua3XqgIUiGt8c9O4xsRmcw0Pc?=
 =?us-ascii?Q?w9rvk3F0QcsRJ89c1WqCCDHkab4CMR+t2VonotOBLB4nn/7eHWwA4hNkQ8dZ?=
 =?us-ascii?Q?QWAldHGz2VdK/eFiX6YEsnXuFarPUMYgJEeGtfBUZMYVT5RGFIqygG0ML1Iq?=
 =?us-ascii?Q?KmrnNEFenxzy+S7Pqu4Q8+uEUYUYaM3k1sMTrEf9dA6jczo8qzED9q7vcQhT?=
 =?us-ascii?Q?XxPyDFlToeNlDQVldRFs/+D07MYpiTE5dGE3f5l2sJwIRk9U4u7KOWBcz3Ph?=
 =?us-ascii?Q?GDjPv2KWow3tMiSDuGoyIBgcTJ6ijX2AP5D7gau7fpvv6rbPAyPTW+H3UIKE?=
 =?us-ascii?Q?05bEaJ5DQ6QROIBFRfyN4TxIz4diozBZd7uS3FIRlmjbIpctlMnyYJvARFuo?=
 =?us-ascii?Q?4UglxO7VPNrZzvtGqfU1lJ8HTf/bCez8vVu4G7+RDD3NVP+WjkeIcKj1pBak?=
 =?us-ascii?Q?oTQoDyFjFDoHj5nCKfbg940VVZ8HHxPU4RRgZqdfyoyKNZz2SNM1S5aKXkIF?=
 =?us-ascii?Q?fKPH/d9Jwg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a9785b-e778-4ead-e3e3-08df4c399e2d
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 03:50:46.3982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnE0llnyKvAEiU6PCqqP2oN+5IqGFho6CfcMJarOs/8sVZu4y4lfciLGaXRDuFlsy0IgIgSZo3RuOjKmsH4Tgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5089
X-purgate-ID: tlsNG-33051d/1795751450-766FB4E9-5C9B582B/0/0
X-purgate-type: clean
X-purgate-size: 2329
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

L0 always runs L2 with V_INTR_MASKING set, so a physical interrupt exits to
L0 regardless of L2's EFLAGS.IF.  nsvm_intr_blocked() only blocks when L1
requested V_INTR_MASKING=1 and L1's IF was clear.  With V_INTR_MASKING=0
and L2's IF clear, nestedsvm_vcpu_interrupt() would still inject
VMEXIT(INTR) into L1.

Per the APM (vol.2 rev 3.44 "Physical Interrupt Masking in EFLAGS"), with
V_INTR_MASKING=0 L2's IF masks physical interrupts, and a masked interrupt
must stay pending.  Return NSVM_INTR_MASKED for external interrupts in
that case.

Fixes: 3a1ef3c33fa7 ("Implement SVM specific interrupt handling")
Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
v3->v4: add Fixes: tag(s), collect Reviewed-by (Ross)
 xen/arch/x86/hvm/svm/nestedsvm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index f366d9b92be3..c75fb8efbac9 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1146,6 +1146,7 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
 
+    ASSERT(v == current);
     ASSERT(nestedhvm_enabled(v->domain));
 
     if ( !nestedsvm_gif_isset(v) )
@@ -1155,7 +1156,16 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
     {
         struct vmcb *n2vmcb = nv->nv_n2vmcx;
 
-        if ( svm->ns_hostflags.vintrmask && !svm->ns_hostflags.rflagsif )
+        /*
+         * With V_INTR_MASKING, L1's EFLAGS.IF masks physical interrupts.
+         * Without it, L2's EFLAGS.IF does (APM vol.2 rev 3.44 "Physical
+         * Interrupt Masking in EFLAGS"); L0 always runs L2 with
+         * V_INTR_MASKING set, so the interrupt would otherwise exit to L0
+         * and be forwarded to L1 even with L2's IF clear.
+         */
+        if ( svm->ns_hostflags.vintrmask
+             ? !svm->ns_hostflags.rflagsif
+             : !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
             return hvm_intblk_rflags_ie;
 
         /* when l1 guest passes its devices through to the l2 guest
-- 
2.34.1


