Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEDB606A31F
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 07:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=aBtMg1Nm
Received: from list by lists.xenproject.org with outflank-mailman.1460787.1671643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEyQ-00040X-28; Mon, 26 Oct 2026 07:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460787.1671643; Mon, 26 Oct 2026 07:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEyP-00040L-Uo; Mon, 26 Oct 2026 07:18:25 +0000
Received: by outflank-mailman (input) for mailman id 1460787;
 Mon, 26 Oct 2026 07:18:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xLEyO-0003yO-PM
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 07:18:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLEyO-00FYxb-6K
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 08:18:24 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefebc-e002-0a2a0a5209dd-0a2a4502d00a-12
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:18:24 +0100
Received: from [52.101.43.53]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefebe-6ca4-0a2a45020019-34652b35a76c-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:18:23 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by DS0PR03MB989640.namprd03.prod.outlook.com
 (2603:10b6:8:42d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:18:20 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 07:18:20 +0000
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
 b=WuHMNDm5VMzhCRxFnceL8RVGBbzdWssoqJ1W+/vI6BxYTfbnI16EO0W7+ainvBToOlRYXY6++t1TvnLBFLZUV2aa215BdTQ+5d9wZjWV43mM7uAHFUYb98+g5rRcOIwkuSBzQ4E9rlkqcs0lvxJ29AZqmw/v5keuSqIW8CZltilw+TxxjH9XfXT0J03s0p2iWKNgPF/kCPOY5BRl4oVJYI6CjaYgj4hwWDXQDXkRmJRommviWpxh8+mxaIk38yPW0Y6AURTa2ohJqOFcsXtlFTqPVwU8GYkNMUqdjBUqNlU5F/aHeWdCTYNZ5aDl1fP3SbGkKZzrLPvtBBfHrCoTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIpvwqXiW4c9cb/0X0lfQu2ZpnfZOAOIuulOf744hT4=;
 b=xoL+3sPtGTubXWhHy+PsJytlTQ9HUMM5hROSzGpywhyQFhPrEoQ9Gwh71kMaBC9/xDx+pQFFot7Fh/8FG1hE4/WBSXyWqzNeZsk1jrLtg7TOr9v8zaGXPvp7NJuLume+PkgGvGYSFciemxYNvNvwymBaJExY68lj6u8VrEFl84Nb2glYsZIw+OBI0nkFCjYA4oQkX1jYV1vtBGWRHNHY7p0g9nvSfJs8CMYIGqtZIvVysDa296EsqcpQnLyLjDdcqyAblnKRzUHIkIH0TWDSDR2PE//XQ6AcAL4ZZC6xaH8Lu1xhlshM8CPUpQfARc+anVgJTsHHxhm/VBbIXL6T7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIpvwqXiW4c9cb/0X0lfQu2ZpnfZOAOIuulOf744hT4=;
 b=aBtMg1NmYZ+VbaBXpbUaK14rUhhiJ+V6Dxr4WZbd2vAvSkbxKlvVeHznL7+NTYW8M2phoNppH2j0TWU0hO3McjS0WScCTV3zHU0/ge9RxsbJaJxOhV0vV5dl/wT/FkY893qPf9a9BVt2exxIaUW0cJaa64LrjRmbljSs4baoR3I=
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
Subject: [PATCH V1 2/8] x86/nestedvmx: Implement nhvm_hap_walk_L1_p2m2
Date: Mon, 26 Oct 2026 15:17:48 +0800
Message-Id: <aa37a7931dfe62cf81c0ee3ed3b9cdfe3d5abb28.1792997742.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792997742.git.chunjie.zhu@citrix.com>
References: <cover.1792997742.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR03CA0002.apcprd03.prod.outlook.com
 (2603:1096:4:297::9) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|DS0PR03MB989640:EE_
X-MS-Office365-Filtering-Correlation-Id: 72eacd58-1b4b-48aa-befd-08df33315037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|261009223027099003|261021135927099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	IMmS1zqpvXCL6jeaM4Fykn/HW215Uon9JJ4cE/vqk75IKPbagGkk3VY/5IVyJbXtBaWLvDLOQgzuPACKVQ3m1TmjeeXb+EcJ4AoPr8oBZrJOs3tLyf+hFYG1yCDxUSBVO25nsVANmLMr3GTJLclHxuMM6M6OK47B0ff3DtEmmBLcwGPKCBD0gAen8NdjzF9XkBcKTp8K4GP1XacfaoBgJZ/jPvYcJUMxWsi+Sve9A09lsBBRNjUqOyj0rBuw0+5zj+GmIj1Mi/BPVzENZeMgcAyLO4/tZVsTg/pFRjpoKA3M4dAGmxXU9S9mKR87egaAgBJ0gtUvkipqL7UMlZtxr9joMnNgkiC0tdCsF22PynlD9FYibnyncvfciPnRMH47qGOCInGaQdsMfUKflt0dlFsibBjDx5HrUxux//HReupr3SncZ0Z/04SmkB0ppfOgLJCTRqsAIH0gb/t9W3thB39ltF86Aep0eZdJBvuIa7l/g2UpOWQEvBYKoyfIanO1pCcNgtYyB0S7hXQCnDpqtWPnV4dJSoYT8QZRzo2TWWT23+JZiEyJBmBELh0ncR8oQNByoyhMpB3FioKwWNWemAOH2BSQ9LDLOJaoHz7h0EhwBHptjgWtMWGh133uEq09AuQfaJFAZbu5JVVEguPQVSfFZ1a/KQJp1ElGmmZSteg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261021135927099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rwZzSgFPeG/+02WFwZV8LXE9Ism3A0GqAglV9rOoh8WimAUf8xgFQ5acJ0bF?=
 =?us-ascii?Q?qwrHNvDHVasPQ1HQt9TkFpjK/Uf4Yc5UirGn+atppujxajiATxku9k2QyUo7?=
 =?us-ascii?Q?axaTHua3ruk0p72Rr2uphrKD1hF7iLlxYu3KnQTYqf9U/0DtFAW2jTGoCUd4?=
 =?us-ascii?Q?ZhUaUl3rnHLh5INnt20TPCEw8EQnzkouWq1yWPqhvSY/2Eg6pR8p8UHcYwu5?=
 =?us-ascii?Q?lVWGLahsI3o+8qgeDOv4wVjkkfV5ZGMqyvm7/UOS6Gkcb0ph/VOxPAXNPgLH?=
 =?us-ascii?Q?LuzOLnyz+TF4ZiJ/nnhkGIOleoFIdUNyaba2HTF4C+YSFt2YOy3OhUoIzR6V?=
 =?us-ascii?Q?SrpadXTWmZ6S403fJHL8ezSxwcabUuAAuxGWO8Cong+xsv8l3JrixNPryxwm?=
 =?us-ascii?Q?N3ekz+YO2p+8JMQlCJG6cqYaHHC2CuOKlTmmGB5vYESBitI+hD7xyb+spFPR?=
 =?us-ascii?Q?X/R7Graln0Zhe2kodvFQVLvTJU4yoMk4sDN/hP6pfEBzgKrFfyV7QTk7Q5A3?=
 =?us-ascii?Q?zf8NaMqM5TI5dCmGNfcxOBRCS90MeQ6jWC/6OwMDQPYRiEa9+pjLeXh9/ZUD?=
 =?us-ascii?Q?Sj4IfTLf2QzEcfiYW/0vZoC90pJ+O9z8xmSKGDavDxjz0E4hZRHvdzkYSaFc?=
 =?us-ascii?Q?3GjcqdosAty0h4Iqdcs9Yjl+gXS6BY9pSKe5tpMLKDGpyjIi4sIDSnPxDBLo?=
 =?us-ascii?Q?QB3/Y6CfJtVQKtVgnBP4MYbD1TONOQ6xAalnqiAZHs3Ox2YQisdKGCuChdwv?=
 =?us-ascii?Q?Igo8xxyJ02+j60UXG/Hbna+lrALiWnJ2Qu9qAfgnz0rmGFn8HN5ygajq0LGk?=
 =?us-ascii?Q?YIGq+8wUr1SIBwvSXp3ttSSIS/pr2oglVYQAQLPPxxw3rtTCHALmpjST4bVV?=
 =?us-ascii?Q?Sq8V8uCCFKiCRwULpB7sVeqHlN4kRj02D1Hz1mO8Xl34ZQjF8hqT49ii5jJh?=
 =?us-ascii?Q?1Rj9y2kX2F3LwquBkj21XvZMHm1XdmgIchJ+WuAqZtBZIYn1s/ZgDngUzIHO?=
 =?us-ascii?Q?o1CYwfVu0TYkTNd1nL6S8omGP4NueQT8lpK+293bJIOqQfj7oeJzY7oFRXSz?=
 =?us-ascii?Q?MEHsBgcygUv+mqQLOVyj8w4WA7m/KeZNkak2voW+r56GZlQFpxk49RcPSt3t?=
 =?us-ascii?Q?L70APQOGppq33DG3uLa8AIjxZs3iC8GPZQyIslYvV0xLK+D9MkPtn2L6iTaJ?=
 =?us-ascii?Q?oQ6dDgAwfhX+5mg/quEax4EBzAY3P7UbAW0KMtvNrOzq9fIm4MgSTxikK0cO?=
 =?us-ascii?Q?06tmJc3Vpl8Is9BL/yaGwXylgbaOArIBb6mkNk3Jd/rXqHH2oAAphMgi7ckU?=
 =?us-ascii?Q?A78ZLQddhc2AaEBOLbNWjjHVEt+cERi7rhD3phBE6bQTXC20yLnZg1Wvrctz?=
 =?us-ascii?Q?t8EEd7XJBrTD0ONfRpN9mMsZ5uh9FD2g8D2jp2D5T0LGwCWQctvYCKSj+pSZ?=
 =?us-ascii?Q?SardVjKpET2dhKz5HiWSFi3WVvU3dar8WZwWHOxqmGHitEYA6g1/IepyJ7qO?=
 =?us-ascii?Q?ca7BZjG/s+6c36hmnpWJ7fIbUFUIKVtAsePWct11w8jCDgl5G+PIbrqP0z21?=
 =?us-ascii?Q?FS7JZc3JWJ0AP/tNv4jlMc1Shlp2EYDmWsg2PbBmX/bgnfcCCbrNeJQx3QRj?=
 =?us-ascii?Q?ER1KkEBqa88oM78uvdiAnptQCwqBSwjkqkh0b2l8ji5i2yMET8l6mVSmAR98?=
 =?us-ascii?Q?YEGgO2ziIpl6TlrVR8mHvciqRCdYLizvRj6MTH5cR9KxLS7tWbUVHQzRnhlt?=
 =?us-ascii?Q?t9FbOE6p7g=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72eacd58-1b4b-48aa-befd-08df33315037
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 07:18:20.3278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NM0fBY+OfaFgpbhhsXThDdv6eegvl11uEDR28VHlk3EgNM36kh0M7CIIGMs0+XknQQcOKi7Mcs1FejQODiJ8AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989640
X-purgate-ID: tlsNG-720697/1792999103-F3EBB2AC-C4237FCF/0/0
X-purgate-type: clean
X-purgate-size: 6545
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

p2m_get_page_from_gfn() on a nested p2m calls
nestedhvm_hap_nested_page_fault2(), which walks L1's paging structures via
hvm_funcs.nhvm_hap_walk_L1_p2m2.  Only SVM provides this hook.  On VMX it
is NULL, so the alternative_call() ends up as a #UD in L0 and the host
panics.

It is reachable from an L2 guest.  An EPT violation on MMIO makes L0
emulate the access, and the emulator walks L2's pagetables through the
nested p2m.

    nhvm_hap_walk_L1_p2m2
    nestedhvm_hap_nested_page_fault2
    p2m_get_page_from_gfn
    hap_p2m_ga_to_gfn_4_levels
    paging_gva_to_gfn
    hvmemul_map_linear_addr
    hvmemul_write
    hvm_hap_nested_page_fault

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c              |  1 +
 xen/arch/x86/hvm/vmx/vvmx.c             | 39 ++++++++++++++++++++++++-
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h |  7 ++++-
 xen/arch/x86/mm/hap/nested_ept.c        | 10 +++----
 4 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 3c7374a9ff42..ed4ff56e7797 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2892,6 +2892,7 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
     .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+    .nhvm_hap_walk_L1_p2m2 = nvmx_hap_walk_L1_p2m2,
 #ifdef CONFIG_VM_EVENT
     .enable_msr_interception = vmx_enable_msr_interception,
 #endif
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 29e48387a110..8d6e0c66f38e 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2355,7 +2355,8 @@ int cf_check nvmx_hap_walk_L1_p2m(
     vmx_vmcs_enter(v);
 
     __vmread(EXIT_QUALIFICATION, &exit_qual);
-    rc = nept_translate_l2ga(v, L2_gpa, page_order, rwx_rights, &gfn, p2m_acc,
+    rc = nept_translate_l2ga(v->domain, nhvm_vcpu_p2m_base(v), L2_gpa,
+                             page_order, rwx_rights, &gfn, p2m_acc,
                              &exit_qual, &exit_reason);
     switch ( rc )
     {
@@ -2383,6 +2384,42 @@ int cf_check nvmx_hap_walk_L1_p2m(
     return rc;
 }
 
+/*
+ * As nvmx_hap_walk_L1_p2m(), for a walk of a specific nested p2m that is not
+ * tied to a VM exit (e.g. L0 emulation reading L2's pagetables).  There is
+ * no EPT violation to reflect to L1, so only the result is reported.
+ */
+int cf_check nvmx_hap_walk_L1_p2m2(
+    struct p2m_domain *nested_p2m, paddr_t L2_gpa, paddr_t *L1_gpa,
+    unsigned int *page_order, uint8_t *p2m_acc, struct npfec npfec)
+{
+    unsigned long gfn;
+    uint64_t exit_qual = 0;
+    uint32_t exit_reason;
+    uint32_t rwx_rights =
+        (npfec.insn_fetch << 2) | (npfec.write_access << 1) | npfec.read_access;
+
+    switch ( nept_translate_l2ga(nested_p2m->domain, nested_p2m->np2m_base,
+                                 L2_gpa, page_order, rwx_rights, &gfn,
+                                 p2m_acc, &exit_qual, &exit_reason) )
+    {
+    case EPT_TRANSLATE_SUCCEED:
+        *L1_gpa = (gfn << PAGE_SHIFT) + (L2_gpa & ~PAGE_MASK);
+        return NESTEDHVM_PAGEFAULT_DONE;
+
+    case EPT_TRANSLATE_VIOLATION:
+    case EPT_TRANSLATE_MISCONFIG:
+        return NESTEDHVM_PAGEFAULT_INJECT;
+
+    case EPT_TRANSLATE_RETRY:
+        return NESTEDHVM_PAGEFAULT_RETRY;
+
+    default:
+        gdprintk(XENLOG_ERR, "GUEST EPT translation error!\n");
+        BUG();
+    }
+}
+
 void nvmx_idtv_handling(void)
 {
     struct vcpu *v = current;
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index da10d3fa9617..2e0ac5798d5d 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -89,9 +89,14 @@ bool cf_check nvmx_ept_enabled(struct vcpu *v);
 #define EPT_TRANSLATE_MISCONFIG     2
 #define EPT_TRANSLATE_RETRY         3
 
+struct p2m_domain;
+
 int cf_check nvmx_hap_walk_L1_p2m(
     struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
     uint8_t *p2m_acc, struct npfec npfec);
+int cf_check nvmx_hap_walk_L1_p2m2(
+    struct p2m_domain *nested_p2m, paddr_t L2_gpa, paddr_t *L1_gpa,
+    unsigned int *page_order, uint8_t *p2m_acc, struct npfec npfec);
 
 /*
  * Virtual VMCS layout
@@ -193,7 +198,7 @@ void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr);
 
 uint64_t nept_get_ept_vpid_cap(void);
 
-int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
+int nept_translate_l2ga(struct domain *d, uint64_t eptp_base, paddr_t l2ga,
                         unsigned int *page_order, uint32_t rwx_acc,
                         unsigned long *l1gfn, uint8_t *p2m_acc,
                         uint64_t *exit_qual, uint32_t *exit_reason);
diff --git a/xen/arch/x86/mm/hap/nested_ept.c b/xen/arch/x86/mm/hap/nested_ept.c
index e116d8254824..f8563156b6d0 100644
--- a/xen/arch/x86/mm/hap/nested_ept.c
+++ b/xen/arch/x86/mm/hap/nested_ept.c
@@ -136,13 +136,13 @@ static int ept_lvl_table_offset(unsigned long gpa, int lvl)
 }
 
 static uint32_t
-nept_walk_tables(struct vcpu *v, unsigned long l2ga, ept_walk_t *gw)
+nept_walk_tables(struct domain *d, uint64_t eptp_base, unsigned long l2ga,
+                 ept_walk_t *gw)
 {
     int lvl;
     uint32_t rc = 0, ret = 0, gflags;
-    struct domain *d = v->domain;
     struct p2m_domain *p2m = d->arch.p2m;
-    gfn_t base_gfn = _gfn(nhvm_vcpu_p2m_base(v) >> PAGE_SHIFT);
+    gfn_t base_gfn = _gfn(eptp_base >> PAGE_SHIFT);
     mfn_t lxmfn;
     ept_entry_t *lxp = NULL;
 
@@ -209,7 +209,7 @@ out:
 
 /* Translate a L2 guest address to L1 gpa via L1 EPT paging structure */
 
-int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
+int nept_translate_l2ga(struct domain *d, uint64_t eptp_base, paddr_t l2ga,
                         unsigned int *page_order, uint32_t rwx_acc,
                         unsigned long *l1gfn, uint8_t *p2m_acc,
                         uint64_t *exit_qual, uint32_t *exit_reason)
@@ -220,7 +220,7 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
 
     *l1gfn = gfn_x(INVALID_GFN);
 
-    rc = nept_walk_tables(v, l2ga, &gw);
+    rc = nept_walk_tables(d, eptp_base, l2ga, &gw);
     switch ( rc )
     {
     case EPT_TRANSLATE_SUCCEED:
-- 
2.34.1


