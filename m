Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250C7606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=D3pkM4iw
Received: from list by lists.xenproject.org with outflank-mailman.1480966.1684752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhhS-0004Nl-O9; Tue, 10 Nov 2026 08:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480966.1684752; Tue, 10 Nov 2026 08:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQhhS-0004Ne-L6; Tue, 10 Nov 2026 08:59:30 +0000
Received: by outflank-mailman (input) for mailman id 1480966;
 Tue, 10 Nov 2026 08:59:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xQhhR-0004NC-TD
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:59:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQhhR-00HJZq-9R
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:59:29 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af2dce5-8faa-0a2a0a5109dd-0a2a450bd88c-38
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:59:29 +0100
Received: from [40.93.196.8]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af2dcef-b7e8-0a2a450b0019-285dc40882ab-4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 09:59:28 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by DS7PR03MB8291.namprd03.prod.outlook.com
 (2603:10b6:8:265::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 08:57:56 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 08:57:56 +0000
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
 b=ROzbzsyNzh9rw/G6Pd/KqMj8Fq0cMXnPSdUqqnKryXrPMG43s0pW95/wzxPKXqxf4edbyUszX45LVGKvwNEVUSJnVV5orveZMqLzlfcxm/1/jFOPrG2GD5wIXVOZhSF0FVntCTDBLcf18mhHu+ijovQOQJnRkFiwMA12Pbq/rqSy74Y/5MLoqSEc8MsicbR5oMYC4vwHYaBGovp3rqC1L6Dg/uMLQTneMD4Vpo9uFIlO39dzds9e9RxBD7hwJwPsXID/A1sYF82o//U1TWlx/jwmXGcsTkCKU8LWdqD4LOz9AxWdJVQII7kddtavfPtJdw311PNO3uZyPENe3LP+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfUO6uo9/FlzIi+AFHsv5JbDOAUMT+NCWb3yMO14F68=;
 b=hkXP0L62Wg8uIIgm2OxfMygycbMeI3fTBoUFcaOvZ/U15cfoqHlRLMANdEjn8mzJuZyUZRayO9JJ1CAycsn9TwFrv5fgPfe5XgD65m7Ew6Vnf4EpFJpjMvnnBYzdhiJGzPlcptY77sgs583Jr964U3oOPnzYG3HtSrVkKzxpulrKVfYO4j7cKXOuhmnwpYF8XxTbtz13GCUOjNDm7GX8/2ShG3nathoZAaRi12tRN4CYp2u2FhWcdVEDBi9MjT/BBVORpeaQW6f99WRNGoXRZidNV6yEOFsyvcteGSBlUyhbdw7S3EEV74MV26fGBj/x53AcupBJcBpK3iuNvowLoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfUO6uo9/FlzIi+AFHsv5JbDOAUMT+NCWb3yMO14F68=;
 b=D3pkM4iwuHD0bSkkUYOtmduQKSBIC9J57ObRkwutkABEvUZoBx2ED8q4RdsOZpPoPsq0B9AQ0bHYoOCUaI2580uD0T1U10f/dKMYx/+uSlSOZE3rKTaCPgllUteLuekxnBDUd6cCuQfi276BYhtC4XWa1Pu0fmMAJ0CmWMFziUM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: ross.lagerwall@citrix.com
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/2] x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears V_INTR_MASKING
Date: Tue, 10 Nov 2026 16:57:21 +0800
Message-Id: <20261110085721.419366-3-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016100058.268266-1-chunjie.zhu@citrix.com>
References: <20261016100058.268266-1-chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0091.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:c8::17)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|DS7PR03MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e09e544-526c-421d-27a7-08df3f08b656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|10067099003|11063799006|261009223027099003|261026121527099003|261102123227099003|261021123027099003|56012099006|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	HJ6MMdrwHXwqQVNlmgM+TCyHl4vKBiGOzSoxmQcKnokt5bji9I78dBUBjdMERY4En3oJkFUkeIepdsLdj5wmhrYEWcJsoJ858zIuiLcX6QxDsh38Y1WVhqxdNYG99Jn3+6rysMZCxV4DCAOu8vLsi3kzl9d7UIhFnPtEk/cetQRfQ9/yYquBtZBUQWEgKSHCGDzqPE8xcoK+h4ANsppk18Rrr1FRteQZQZLFzxAF6I3dCllyDuK4omljHwwh05fk0EvsTTWZrVQOgF63/vah8/v7R94M52Ik2eCMz5PY3skRQOvxPHvAPLz6Fvs39sKwodEIOdJtr2cPPXJnHSGKGLhbLx5/PqmObw0LJ4BtQivo3r1hMZI6cmcPWF64OxNweiuvYxrtUCJI8RUsqt2+qsovsokqbsMkN/72ROf29doiIOwFfbQqnG8+e1Nr+U4mtEz45YTu8FZlB4QE5BAMUXR5hugrSXyFXmqp+C9mgkEzabWNZ/culq/xEbKeQPskW+0Oq6Rjz2CojNr7j1ACjgngUrKS+6TOdgZWi/IlpIdMG7OHLoXIuUoZ6h/BE3NSUlKxOFP/RWWNDMJAJ21tq3MKvRzJcND1178CUfmPzT3sJVzTV4fqzeL3ehQ/qA6fMF2drMm/5hckZCZrlwUqwMIUIC4J9zMKlqFukdd3uj4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(261009223027099003)(261026121527099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ecx4O/aeUS3wyyjKbZUxv3wKP3NSjCOduIkf6c3K+Ns5vXOWf/bxFmVFSZfd?=
 =?us-ascii?Q?RlYMyV3pHYu9E16icSgOv/QxQQTqOGs0l2oey87PeVQrtMyapG4zeLGWHlBn?=
 =?us-ascii?Q?aLlUDy9zlyBL/ZXytPa4MMcJ6rJpLoV9SVX4vkanO+5g6VjN9iF8uItc8Xhi?=
 =?us-ascii?Q?UED3Mar3URT+bCnjioa4QheHP7wJYHNkqQ4JeCSaAAkPcpr+Ub5BXbFL5Dp7?=
 =?us-ascii?Q?3wfP81Vkiui2DwSQniyz3xF8mYCYBYajEOjDzsKXhYD+zK6ihGOj1TMAzebG?=
 =?us-ascii?Q?3xoM0bPybyd4EN4DccJ9LId5EDldrCuyCN7dpoUpdOFV6re2PdtbAK8oil/B?=
 =?us-ascii?Q?tMmqj3WM9AMNS30OSxhnlriQlufvyqGNHtk24g/4sapDiP9qn6uFlEZIDFEL?=
 =?us-ascii?Q?Vn5IYCrRW8BiZddu+1qZbO2JJ6obthufrmbpPUsdXjiSx9kvQE6dR7roAsec?=
 =?us-ascii?Q?dSGWfNKnEb/CQnJlDH4wu/oS3dY8ITSqGk23VLNf433djvEkrzxoHUGprrs4?=
 =?us-ascii?Q?b33dIKW0GFkM05vVaqx1k5THGbUBDKKZ4IBM1OYvD/s24mIPG+7xNB/SvTu/?=
 =?us-ascii?Q?prCCghu6DjjqTCZXcNqLby4YhWT3uevh0IsVBqmskz8pIUFlay1CPC7OUuWI?=
 =?us-ascii?Q?K/pnmOgWzVG5OiRGx5rwBqa0ohjD0nywCnu9cYitCzB/n39y0g2uiWB0ZwgG?=
 =?us-ascii?Q?QsdzXKclotjH8UChjAKDuv+MKHQDWWhKsAj+CKfewfMvmaBszvvk8DGCU+g4?=
 =?us-ascii?Q?FKkM6TeSa4V7Qfg7oJbuvlDWZ4DVolHyH0SuZw2quel+dA6yOIYzQ46G1WoE?=
 =?us-ascii?Q?LVA4tQhRNJBkrI9pKneSGtFFEl7u9Kmrg2wv5NVt5RutcnGtJlATSwCvJ2j2?=
 =?us-ascii?Q?QzhV92az/3UtAXHbJ8QENT3ZSGAmRl7G50fmhKVjzhjYmnCH9M5o3nu1GUsS?=
 =?us-ascii?Q?6pgohL5jkFS9g8c0Onl70k19GU6mjnE8uGtOBKbLaFrnqfOTBlVo0xBJW420?=
 =?us-ascii?Q?tWG69T8hDaYqwv3/5dkuF8CVoFvughm0oBl/58Z3YIsmX8uz0xt2WOi1VLMs?=
 =?us-ascii?Q?hHRgkEuOK/k1YBDMpsGcut2N8osJWZ2ZO/Wlcha6s1SOArKQUWFaVVmREpZv?=
 =?us-ascii?Q?qPyTo0mhyn0bcVmvGFYTSDiCjUleJikpOpsspDs3pSiCdpEkRv2QZkq45f+e?=
 =?us-ascii?Q?Ptewi2CfjL5pnLVRFlUHjOCnfsk81ovgcicMlDvz0n7353ma+slcLVAo4liW?=
 =?us-ascii?Q?mJzs+HH0IN7K6wXNQA+1l9A6PI8ScBZ95WJpNfxO7COA9SAMY6NOOr68X9CQ?=
 =?us-ascii?Q?svKVa/khH9NzCo1WSB7ePtOkxopYnZ665UZjIdShs5IE+QXw36ptKz2EQJJl?=
 =?us-ascii?Q?4gvURCnQUpM2p1wJBUhQc51R7N8K/FcdnnbWorjhtHqgh5TO2ShFNeGm3Sg6?=
 =?us-ascii?Q?Prldtq1ltAfvvGZIdDdKdi++dCnQyUbNcuGOgsGX7aFyrJKI/8BH/z3jUxTh?=
 =?us-ascii?Q?zfjItvLbtNpR6rXiaa7zScbri3fQg2hSZwLy+xjjGG4YIRXxG0yVrVSaVlBI?=
 =?us-ascii?Q?p1WFcuzGNYTm8bvXI3ufkJfdWRMDFc/R7oqkmoMUW20QCZOdLwl123EdlD/a?=
 =?us-ascii?Q?OgXFNUSa5qjhmtYAkpU9euR0MR2POSRh0dboI8SrzPdQ1KqYAPSU8pmciDfl?=
 =?us-ascii?Q?A/VI3a08R4wPtmr+H5xflsN2kcny2kGWeMJmNNAudDZFCDEcuZwZ9LXqnRAr?=
 =?us-ascii?Q?XW0mbvgvpg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e09e544-526c-421d-27a7-08df3f08b656
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:57:56.5373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46TVx9N1s+SNlgMW90EItKzbpwxwo7JCWskV2mJ4ZZ6QJstqP8XfvHvP3mANXtwXtmf8RmPJpRtxJyaC6k8iDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8291
X-purgate-ID: tlsNG-42698a/1794301169-186CA9EA-CF70E274/0/0
X-purgate-type: clean
X-purgate-size: 1978
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

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
v2:
 * Move the check into nsvm_intr_blocked(), as suggested by Ross.

 xen/arch/x86/hvm/svm/nestedsvm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a93681e9bbcd..e3b2d20ffce2 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1222,8 +1222,16 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
     {
         struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
 
-        if ( svm->ns_hostflags.fields.vintrmask &&
-             !svm->ns_hostflags.fields.rflagsif )
+        /*
+         * With V_INTR_MASKING, L1's EFLAGS.IF masks physical interrupts.
+         * Without it, L2's EFLAGS.IF does (APM vol.2 rev 3.44 "Physical
+         * Interrupt Masking in EFLAGS"); L0 always runs L2 with
+         * V_INTR_MASKING set, so the interrupt would otherwise exit to L0
+         * and be forwarded to L1 even with L2's IF clear.
+         */
+        if ( svm->ns_hostflags.fields.vintrmask
+             ? !svm->ns_hostflags.fields.rflagsif
+             : !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
             return hvm_intblk_rflags_ie;
 
         /* when l1 guest passes its devices through to the l2 guest
-- 
2.34.1


