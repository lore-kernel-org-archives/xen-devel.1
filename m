Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F894CA9EC0
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 10:14:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444973.1661463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU6A-0001ch-Ts; Sat, 10 Oct 2026 10:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444973.1661463; Sat, 10 Oct 2026 10:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFU6A-0001cX-PE; Sat, 10 Oct 2026 10:14:38 +0000
Received: by outflank-mailman (input) for mailman id 1444973;
 Sat, 10 Oct 2026 10:14:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFU68-0001aZ-S4
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 10:14:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFU68-00GnTa-93
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 12:14:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca0fc7-bab6-0a2a0a5309dd-0a2a45058f6c-30
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:14:36 +0200
Received: from [52.101.193.67]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6aca100a-4cb1-0a2a45050019-3465c143b498-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 12:14:36 +0200
Received: from MN2PR03MB5328.namprd03.prod.outlook.com (2603:10b6:208:1e2::7)
 by CO1PR03MB7916.namprd03.prod.outlook.com (2603:10b6:303:276::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sat, 10 Oct
 2026 10:14:33 +0000
Received: from MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154]) by MN2PR03MB5328.namprd03.prod.outlook.com
 ([fe80::2d54:a272:35fa:b154%3]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 10:14:33 +0000
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
 b=S/Er0rPP9no5e+uTD6maQQTDeKTlWR0HfVONH0rO537qKF41pc7LmCkK1WEk8RVqkt9dDb1kyz4uY5j/QVdYhtatHYkXs17o0yCy2mhQZm5LU7aKZONtIOdR9HfQ8jdCqgQhWcys1n13Ov0SfFeACGTzSztmn4086FehO7jXW72DCqmZH4w4PARW+DJDcViDHdH/GzJiKHEbPyxJ8kKkRF0mHyPnZ8WX+JRsf0f2nLmsopnZPUdhU9k60q8bwPCXjftdhY+OPX/in2iLEIFE/v582DdMPCbWrRcM8nklM6xWXOi3fN/3TUCskb25F0/qyKW+kuM6wBn/iAzLipMI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fplgRATSf0U0Gi24zkdk5u+MJxVZj8K0K0i9XI/ZazA=;
 b=knB9zZcwRJW2zyW76DiCdGGxyzsLPmoIbNp1To83UQLXJsk/FyeK9Fj4kkWK434bin45NCCC0KplKhLxo9M++bcHk+ogGPGZfRw9EYpEo1+vOkeVz/hx7yRl96rh3inZecJZovTQdPRx0BBZMLlNBjsMBUYrLoAa6VnUXG68lj/ctbtXpAY8ODoLQydiy8dcTW7MnkgVIhFwFbdrQxWnOKXMj0OQKuff808nIs7N7LzIk3Z2+Hx9GgOBgUVcLBybU1c/UQ/TjEI2Qz1lvtDfeKvUzYnw7/BGhUDTmRzpw5viRwyCpJnJuZO5DLbXJvZ92B8c7RHV6mO7q5LCLnd4mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fplgRATSf0U0Gi24zkdk5u+MJxVZj8K0K0i9XI/ZazA=;
 b=Dl/pAnVoc2W/sPLwiqNkFdiGhNu8euhXLDcsl6xMGeqr3vbdtwLY9DwJhtyrFORiNviXSglnc/6LriKZgfMAs1JIZIugZ9DrwTj+Oqrc/MWpwP1XCWatc2jeGYDsjuhBQdiz74dRxVkJNo6kzDfEeBqNP23z7ZEF5QP3Jycq3io=
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
Subject: [PATCH v2 03/13] nestedsvm: Use the correct VMCB for vGIF
Date: Sat, 10 Oct 2026 18:13:16 +0800
Message-Id: <9c8767613e21f19071e3d7be7edfdaa33bc883cf.1791625578.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791625578.git.chunjie.zhu@citrix.com>
References: <21b02d5c-4e21-43fb-b371-201a125bfdbb@citrix.com> <cover.1791625578.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU2P306CA0076.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3a::6) To CH2PR03MB5320.namprd03.prod.outlook.com
 (2603:10b6:610:9a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB5328:EE_|CO1PR03MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 14660939-74a3-4192-5778-08df26b747a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|18002099003|22082099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Wg1QO3zXv4OmU47+vQ4/MowQNIeH3FsqcZ2Gb55CP9Edfvt0LKgI6KT2jfaJSCfMpFHdb5tP1pDbnskx9GI0rQNpzhCtZlj3/JELnyULPrnq+QR03QK35nXFFLXnF/HZNz5vU3E//mBI/qjhuPZh1DSZ1IeHPpNPzklMRAh5UtTX86v+PtnhMWIv/A8IK3PbmkppMY9pha3tqMoBr3Lgz+g5NywHWxwZSQud+r5vWWv7n7gcgU33BCNJZZpVFdlFrDkFfdcRiE246hzqlqkRGmieZsTLL3iT8o/htWRpGO6YRLGUilw/HwuFHsS2oreMzCbDBTHt5DUDK9CDVV32UzB+ho+OIMrXc5zfHNMNgmcN5RoixINBw1cK01dUL/YfhDRfHCisxH9YD+A+TLww3jW32H8WIiLBRzNLkuyV1/O+phgseGgKxDrRkvmMdDATaVpitdoihNrqne9/wS74ULodBfKBGH+DwpBD+9Ufde1hzYsyRrMetM7IOLNZhFI3Ezmjzkf851G7UMFtdBQCg2Hq7kj8+AykDlybP5kZFDoPQM0zPPskSn2k6FrWljdlJXLtsDVtPsYEV2gX+M6wGFP7fcw2racLQ5qveU76Y8pveBXCc9enzLaBkqzXeGW4A2ng5zw4teBpnSR4mLxTD+T6fiD89zb8wlMS+QBCTgs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5328.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PQtv4Np9NdvtCqrO4idsu7qyj1DJNgS61Ux8fQ9mDTOtSl5FIDNBGHc11zX+?=
 =?us-ascii?Q?AjqptbC0mjJgMHY6Q2gg9nvy5u4pPpt/OE0F7rMl1mOZbEm4cyx9U5sx+uD8?=
 =?us-ascii?Q?wz0yGICxEEF2zGGZWtyecTd25+/v+RyonpznZamkKOEx60vSuqOcqITgiPic?=
 =?us-ascii?Q?S0fJnNtq6iDmCgdOUvQe3cy3YcGwMEDMvmT/hKGqGrcqhzCKg2IRUHuERpaQ?=
 =?us-ascii?Q?WP6MdtoZe9SNdWbshLT1zyQnf0BZ4OT//GDlGwxGCwFQRJqAICv39jBOa+nf?=
 =?us-ascii?Q?bq94R57wjxDV9jO/LgQNUT0n7VrPMWAfihi0ppLSHhsr6TFiCTwb/Tl3M81a?=
 =?us-ascii?Q?K5HivGboC3MdOxZ0ViRDzjSoe31c6cyfIceb/7D00MUiQgmepXhZRL6J7I+w?=
 =?us-ascii?Q?Q8XGwTa5DZuvysZSaCq6x0QU7jVN2Xli0j44qSDN+uSk9AWVVZgkS3hD66pz?=
 =?us-ascii?Q?zFs5a4scuTB9q6P2SinmIUjcQVZT/s+3d8WyIWdo2VP+BTdFCLHkhw/COWCd?=
 =?us-ascii?Q?WQymq/8p8OvJW6EgrdgNLhQ8Ybm28k+TtaZM6ehBBZryY/BahIF6OkamxDQV?=
 =?us-ascii?Q?Hus7uX0togckt+6+5VD3oknJrs2TGbhKJppfg40+ZVyNB/QqjLOhG+BwmHoF?=
 =?us-ascii?Q?ztUCCECrHtBKfqAK/n6k57syT6WG4r11OGM0+woX1mWeFsuADFup7no4B17E?=
 =?us-ascii?Q?qEDyk4dfwmQ6Xv5CWze2cSGS9zBP9dRoKNheM8IukH4go0XVyyMjWTAq7CqE?=
 =?us-ascii?Q?FBjtRUB4HZbqjUqymew/wb9X0ZDc4koiY/gPRw1mhTNVucCmoYR/vfQZySkR?=
 =?us-ascii?Q?SNCVSPSNxEEYx2y4ytF6uJXR/Vg0to9BieDSOSN8J+EXleINw1xrB2+bUiHl?=
 =?us-ascii?Q?1aSmvlPg+myB1WcwZ94mix+FdIRz6rcoWMmhy9QaPdgT9U5ERYY7FBj61Y9S?=
 =?us-ascii?Q?LfR3OuBN61NSnJUDgR+QNfyBTLX0S32DhQzgU7MwviStOIbKdPB5xw0oV0RK?=
 =?us-ascii?Q?BPYw2pbXCS+sXfxKbJYXXia58hHa7qAmoz7qAJZkVvY25ISd/urY72tem3xR?=
 =?us-ascii?Q?9jQZNKup4h6Nnkz3MFlw5mfiQJTA1aweGtVKrS5PkBuYafj4KbKjjLZxxcbY?=
 =?us-ascii?Q?emO6HtG2WUasgn3OeIzOgYxfoGbm9QhgBpyLKk0nNyTGp2vem8t1O5sCrd0s?=
 =?us-ascii?Q?GExuz3nC5FkraFPQyeB4MBX+HhJLxarvqHpDT4wGI5O5mfEIKD+BVm8mWBQG?=
 =?us-ascii?Q?A7jvbCmQL8i569ZGwQ6C9bk+kM0YPf7+sYCU9I2jMOsJyopI9+GDH7yzpoOb?=
 =?us-ascii?Q?MpalPHLjXZvNOoeo/I/Y062rOFaV6Xw3ScJZ73OOgckgvocpClmA0+MUhFLP?=
 =?us-ascii?Q?a7HkzfrO6qrBj7EzFOtM5r2c6/9zkZk6i95tjudZ/e8yjf9PvERLplB8SVuy?=
 =?us-ascii?Q?LM78D+4yYFBQvDetH3JeXhBXSbH+jQNLFpsPLEtq53+Sv1lUT3+jzU0Fa2mn?=
 =?us-ascii?Q?oifJgDmSXK44iJNCyFPXpcs+UMtjPe9Xdb1Xewss1a9RSrBcdIGRuaPtpIF4?=
 =?us-ascii?Q?4Z/iSij0lKf3k4lnBcx+YPrvx6B0OtnOCZYQGSame2jt8H9YO6rWkdwi9ptq?=
 =?us-ascii?Q?EFjXBZXlUcVzrZ1iUF0zGkz5ERCmNFvA+ivlOBhmRmMH0YN9dyJze9Qfdo38?=
 =?us-ascii?Q?xl67hgGyIooyqE9z7OnIzxVtrD0w6u5/+yUq8n0SR5yG7VKyR1MfdjTrJMMe?=
 =?us-ascii?Q?znCzJABZig=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14660939-74a3-4192-5778-08df26b747a5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:14:33.6413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bOlAa7p8ixUkDHesjePpyfPLYrHPsP/vg6O3dkCRzdfRFLzcHXIYsCl3E9bZQNZ9jrskmpJdFdw59Vdxp6jDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7916
X-purgate-ID: tlsNG-c201ff/1791627276-F5AAF2A1-5B948285/0/0
X-purgate-type: clean
X-purgate-size: 1960

From: Ross Lagerwall <ross.lagerwall@citrix.com>

In some cases, Xen uses the current VMCB to check/change the state of
vGIF but the current VMCB might be VMCB(0-2). Adjust the cases to use
VMCB(1) instead.

L0 may use vGIF to speed up L1 but whether L2 uses vGIF is the L1
hypervisor's choice and L0 should never need to check/change it.

Fixes: 4cd0fad64590 ("x86/svm: Add virtual GIF support")
Fixes: 05bb1116b8c1 ("x86/svm: update VGIF support")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 2e3b70345b68..8943d61e2b25 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1215,10 +1215,11 @@ nestedsvm_vmexit_defer(struct vcpu *v,
     uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct nestedvcpu *nv = &vcpu_nestedhvm(v);
+    struct vmcb_struct *n1vmcb = nv->nv_n1vmcx;
 
-    if ( vmcb->_vintr.fields.vgif_enable )
-        vmcb->_vintr.fields.vgif = 0;
+    if ( n1vmcb->_vintr.fields.vgif_enable )
+        n1vmcb->_vintr.fields.vgif = 0;
     else
         svm->ns_gif = 0;
 
@@ -1482,11 +1483,12 @@ bool
 nestedsvm_gif_isset(struct vcpu *v)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct nestedvcpu *nv = &vcpu_nestedhvm(v);
+    struct vmcb_struct *n1vmcb = nv->nv_n1vmcx;
 
     /* get the vmcb gif value if using vgif */
-    if ( vmcb->_vintr.fields.vgif_enable )
-        return vmcb->_vintr.fields.vgif;
+    if ( n1vmcb->_vintr.fields.vgif_enable )
+        return n1vmcb->_vintr.fields.vgif;
     else
         return svm->ns_gif;
 }
-- 
2.34.1


