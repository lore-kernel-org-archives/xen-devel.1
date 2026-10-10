Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C68CA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:16:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444997.1661525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU7c-0004nj-VJ; Sat, 10 Oct 2026 10:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444997.1661525; Sat, 10 Oct 2026 10:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU7c-0004na-Rq; Sat, 10 Oct 2026 10:16:08 +0000
Received: by outflank-mailman (input) for mailman id 1444997;
 Sat, 10 Oct 2026 10:16:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU7c-0004mx-5h
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:16:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU7b-009G7U-Iw
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:16:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca105b-8faa-0a2a0a5109dd-0a2a450a9d7e-16
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:16:07 +0200
Received: from [40.107.209.56]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca1065-f2d2-0a2a450a0019-286bd1382122-4
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:16:07 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by DS7PR03MB5591.namprd03.prod.outlook.com (2603:10b6:5:2ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 10:16:04 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:16:04 +0000
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
 b=lXCFZ4wDXhLROFtv0ggOJl69FWcHz7LZgBb3Ke6pe2MxY9MYrRtzWJzxwNYkXw2xi6E0QU98/Ln2/8hkow+qnCLpH+919sF8V6y58CAaDvCYZ7BGsCR/AnXVVSDH6eQ9w5XcC2Fo4ndW6X2+8KNFrGfxLro43ztsyuICom0PRKfTrXEOaLtT4yybA6UToVis1kODJYMztMCWkxV0U4+OGJIFmxi4R6k5/EfdIywTkgMiJ3KZGF3XGQ3LqSPc6TDixarcAjaeoSBgXw51sdIvLILb/x0QDaEjlKLx+QnrWcgAxXvPI5tA51hE0BGjUV+as07qdeSD2BHwGDJm2wFeqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQkfC444jHQee7yDdB7yiyHt3FUp358FjQN7aeCVTlY=;
 b=E670TWZhNOchtbzqfJbyOdodch5FOB1tZjEAQXn5IZAelC+jZPg75V3bvdXvWdeB8GbpJLYFOEMxrHCL2kTcZuR//cFpF8CHQ+YMSFOEs0geJGXu86xTg7r2NU87ySAMDjELh/xxc8lyE3oHfyy3D2iZkH1zLnG4QT0hPH5u7eZE50AedXKfDtCUnQ9qtoUe+DHPTdIOfMZFZ1JA77pTGp/pdHohCsYC4larBZn//FCkdwrHI7jnJTsim6E/PrwkIKJ4DzSwADXO34JIK44lktfTBg2JHKS6fX2L5qhXvboHM6jBvYZN9F45W8qj7BbDBZXQYiV45W2BpzRc9ugsKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQkfC444jHQee7yDdB7yiyHt3FUp358FjQN7aeCVTlY=;
 b=Qh6UZe7UIB23Wc/1l8wKWA+XcA1/AIyh7vfMuJzN97AZ/2L1PqNdSAtcC5uqCO38Og7qqGGb7SmrnWEshdpEkMhwGog2/WJjPxEoSwwCmhd6UbNnIPHiOICPfI6q4JUKfeLtqSFiFu+uQ1kNr/5zA1D9QslZJpS76EOHW0y23e8=
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
Subject: [PATCH v2 10/13] x86/nSVM: Don't clear TLB_CONTROL on #VMEXIT
Date: Sat, 10 Oct 2026 18:13:23 +0800
Message-Id: <cb52b4cc4e9dc637b3e201862d3f179101a968eb.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To MN2PR03MB5328.namprd03.prod.outlook.com
 (2603:10b6:208:1e2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|DS7PR03MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 0671a6a9-ff91-4088-621b-08df26b77ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|11063799006|22082099003|18002099003|10067099003|3023799007|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	UykM0D6Ey5YoeL1qqmUR0xznefrefMD/ZW8NknELRbr3g9D7HhtKJuY6YEVDIWdzjWpM1L4a/AEkStfPhrl1Vaoy7AYSBBk9Y36TQKb9GynajQXARMp7XBWoePu+3TTPGcK2CvrMQgF/xL69cECKNGoSWuqxuzBzwSomtfP/JV80vCMCivG97r6E1gcTCw37XGj3j8iPZPkIkLoezPwvvgPIZOyAyKcQkl7MS7KfixMAcJPx4Rn0vc/RG7sxf+ERqyy6GCvnlWM20dbh7CIPUuYIzqGEcU8S7BZeZtJBnHFG5VZMR1RERFyOg/MAgyIRmF7eC7Qn5OOpne/f4gXl+nsFh7wJ/NjRYJZPsvgneIGRXrA3/4xgi/GmlBQ5+Xa/sc7n9jsMMhUNndwxe1RsiHRxApO7AoTbvbc5six7xqrfI/kDFaF625dktrr57jAfcCm7exRqMMqlpPBqlFyq7HioglGUUhsYETmbvoPbe605v77OAvWfbhqBciW6T5ZtvTv2HwcswJWXKAFBf0tdjAAdA/uMmBh/AwFx7/49bpLdKeoAl/BoZD+9/kRMEdglW0Qvis3+BZwZ7wJxjoRrkQ7BizSh5pFB2Ui1oyD1aGrGmbHBlUoo33XjZubtr7jqpQ059y3bAbDNoH7f7NRJr5yWZDDJDMfn34Ga8+mlzaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(3023799007)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S9ZUWTIVJSGdWu1aaCXYqSJUvb764ksDMBQsbT9wd3SFKamo8m846Z1jnCO+?=
 =?us-ascii?Q?2tQIWBkECPnbi7d1UqVOLBaw1Vwh2Ihel3RPqFELCSgbU6oSs+ZmYnYXrTQB?=
 =?us-ascii?Q?B68AM/vYi+g1USE1MXYAVobJfFy4Mx0cnZCdS1YOomsV31pWCYniaKkzDEus?=
 =?us-ascii?Q?lMA5Vt+TFedJqDdLnqZoslWIUepYb9OUXhLPKmsOg75unUlmp8Gnv3JHbWCc?=
 =?us-ascii?Q?H4Da9CLZkRCvPjVRaD5DPVaFzfBgPf2isfRIhBVeJcpQhsDrTIzrUG2tqtnB?=
 =?us-ascii?Q?mOwWTOr/ydhdMtg+LpXD6j0WC0bTbQkyVGArXXUMrmx2qM2mFkaQooWQzqDd?=
 =?us-ascii?Q?yPIA21QgWH7Ru1NoXvpJOkYOormk4wiuEc3WJv2jT7C9KSdhru+Sx962J3lA?=
 =?us-ascii?Q?IE4BThHUmXSh+LvtBV7MX6144jF8Yuxbdf7UTd2ZvrACt0jBnZZx6FijYF6F?=
 =?us-ascii?Q?g97K/fp1FIEJruqNUQclOj0hstvHCm26bQLfxxYf59ccAE7kGLdWwQoAeozw?=
 =?us-ascii?Q?csLO2O+2nJZs41VxpQKyPaw/gtTBCnZbMzKKywcOI0C9C5fmgQQjiP/wA/xC?=
 =?us-ascii?Q?8X0uPBnggpHAyCUJ3BSpwyhJqQdSeB8gNagYvf9kWmuRnZxSyYMR8W3nMd2L?=
 =?us-ascii?Q?WwS63l1ttBRWv6b5CJbNo156cCGPgUKhw9IyUAIrGvTmv9ZzTbcQQK+X5A27?=
 =?us-ascii?Q?lKsZiYNybjz8+RMzvn7B6Yfk6lVnBIhMo4eSAXQgML1L7oB8rEueheXtnfpb?=
 =?us-ascii?Q?Zn7G12z5viMUoMndsHLiSQVRunQmPET3ndtp1dJ1t82fvytH0vewHe68vOEN?=
 =?us-ascii?Q?DAxRGagCFb7rdUQm3DVhY1VIHFYtlUDkQdnHMW9eZFcIuR9IhMld4nn2jIzH?=
 =?us-ascii?Q?iy78bvWiGDGC0Ss0w2FBszKzdWo79KAgywZDSPxgTtBTS77bDIeZ+eJMT4hw?=
 =?us-ascii?Q?E1VGSdM57kEsU+58ZgzajSet7gdyo8+We2PPKqWJjEJ/XUUrZw+h5OEfI06D?=
 =?us-ascii?Q?VDBI2G9wcbl2nO8Z75l+HTGmmVxAKlufHP7hSJ5d/ZbuZhFH1QOkAca7lXdM?=
 =?us-ascii?Q?r8JVOJmOBk5e6hERqYkSNogYHOkBdCGvpHJPVZQsUZqjumMEKAv6ZXZ6IDyW?=
 =?us-ascii?Q?spmd1v1TCIUwkk965pgdQk7ErFZ9aG/ukn5EkTTHwVBS2SuPU/jZenvIg7XY?=
 =?us-ascii?Q?FDh/EMeHKiXlzOd3B0iZqc8jUwaC0+DtF3f2YpkXpf6mj6mS5JTO4gQH6Sjv?=
 =?us-ascii?Q?CTx5mfL515giXxz25RGEb1FUOPChHL41pwoUtXpCoqBMZ2xHeTH2UqWjC8Oe?=
 =?us-ascii?Q?2Ml4GzXdBd7M0ojTtrh+v67qJzpLeZldpVx0OOPX/VfErAxdLK2nrvABGxXt?=
 =?us-ascii?Q?shIuEr/RSzPkJ+VcSwAWCxrZJRG9aDO6smptP4qnR5CoceFeotf+8J3/zTUD?=
 =?us-ascii?Q?ZiN7UD0KMQOkzcKLOFzqZvRqZDWhZQW8tzQUdojE4/WpssZyVykPo+I+dYvm?=
 =?us-ascii?Q?mR6yYdEmQLReTqK+zJPpgAcrxua0AzaaR5acCCanxX/rUlwPHYaE1nOMYJzs?=
 =?us-ascii?Q?GXjnTl/N4Tj3giOUswE15BYay0O23qVZVLwHB2P8eXU0DepeogNrwn+riotq?=
 =?us-ascii?Q?Pi9oLdAXWErutRe6CLSbNcvA+cx6R/BUh7PM7cqiatCpnJl8K8HA9dnnhJZI?=
 =?us-ascii?Q?E0ZDm+wnNrkAsKD4aEKRJlgiXyLNtxCWpR4I/pY03/RAlV5KaAJgmfBofQr/?=
 =?us-ascii?Q?bew/CUSqpA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0671a6a9-ff91-4088-621b-08df26b77ddd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB5328.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:16:04.5252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qoSO0qHSo38xpQ1wgX373/RhOVOGHf3Ctqhfqvcd15bF5qcPz/Nb5Xz0DSbB6qWBW/W56LrRC2oSTJSTCmp/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-purgate-ID: tlsNG-4011c0/1791627367-53CD3CFC-20E4EBA0/0/0
X-purgate-type: clean
X-purgate-size: 1163

From: Lin Liu <lin.liu01@citrix.com>

nsvm_vmcb_prepare4vmexit() zeroes TLB_CONTROL in the L1-provided VMCB.
That VMCB is mapped writable, so the store lands in L1's memory and L1
sees a field it wrote come back as 0.

APM vol 2 rev 3.45 15.16.1 (p.550): "The VMRUN instruction reads, but
does not change, the value of the TLB_CONTROL field."

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lin Liu <lin.liu01@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index e1cb10e1de11..3b0afb828c91 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -992,9 +992,6 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     /* ASID */
     /* vmcb_set_asid(ns_vmcb, vmcb_get_asid(n2vmcb)); */
 
-    /* TLB control */
-    ns_vmcb->tlb_control = 0;
-
     /* Virtual Interrupts */
     ns_vmcb->_vintr = n2vmcb->_vintr;
     if ( !svm->ns_hostflags.fields.vintrmask )
-- 
2.34.1


