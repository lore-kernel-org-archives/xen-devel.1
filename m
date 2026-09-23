Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90419C982EA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 09:21:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429930.1652576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JAT-0004wN-91; Wed, 23 Sep 2026 09:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429930.1652576; Wed, 23 Sep 2026 09:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JAT-0004wF-66; Wed, 23 Sep 2026 09:21:33 +0000
Received: by outflank-mailman (input) for mailman id 1429930;
 Wed, 23 Sep 2026 09:21:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1x9JAR-0004sq-MG
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:21:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9JAR-0079J3-36
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:21:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab39a15-2eae-0a2a0a5409dd-0a2a450c828e-32
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:21:31 +0200
Received: from [40.93.195.57]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab39a19-f479-0a2a450c0019-285dc3399e16-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:21:30 +0200
Received: from LV3PR03MB7609.namprd03.prod.outlook.com (2603:10b6:408:283::12)
 by BL4PR03MB8106.namprd03.prod.outlook.com (2603:10b6:208:591::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 09:21:28 +0000
Received: from LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c]) by LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 09:21:28 +0000
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
 b=Uv/kP8+5dKvRiUe0mtYsU6E5nv3BHkRBS14/SEmSl+O4KN9aR9oJg4moTlDa8SMUSUbTRLsH55u8mHm6gznYnXUhF5+A2+wZLKegFzH2/1BTvr5RQ8pVFERd+3lLV06HltrLBVQVPoSRSL6qndVlQ5ADCSuVXy/X+1zB57L1TDXNqmhjCfSDTiWvMpu53/KPFk1nTXORtFC1L8SeRCwq9So0ISDXMOPhntA95QcIanYWlEugWhIe9NBhaSH1cF3ojswq1Ab4+/9VkBdOsIgRaiUiCqdMZj9kzJQOQhNBeCJA5POfBhKrwScZXZRPMepoTWUNCp42ZXw5l/PeBprpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IU4BHlwvEUQATEKce1EuKskCgG/uibOwmDxKxzfdCE=;
 b=c1VydIVejzKK4rMGX9qxg0YJ5goLqJs5hZwDXwJn6Oo2O/NaOclQDsnSCJdnkeDXvd+2iFsO9zCPmNicLHJblUT0mCs1Z3WjATsskYCgVVXor/+Dnqlou5COJTEMLRMc9VjtTWmpVgJhsFSd03ESP55Ec72wkD7pPGMYT6DNoaAMU8j3bXpJOh7M+Jb3Q4yac2Eq7bMURHxr6LT1meiJhaoL3FUUo+3VqByBeKxwRiC+Y/0sh97uicTs3ClZJh5fPHops8xLvFaKvCnIFGUZO8W1EYPShJ+l+SltcHtVA0qO7zjmewAfg3B7wz1V4TBQht1JHjFlwLCH5Jc29pSndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IU4BHlwvEUQATEKce1EuKskCgG/uibOwmDxKxzfdCE=;
 b=xRsUJZHawXpRYw62TPZWHniM4nf5IVhoR4VU2ZjVHStXSJ6okWUL817mi4miyv3Oz7myQG52w/7oJu/+jXX4ThXFZCAn3XnemB7FCRPQGOcgY48ByPIjyPiV0Nwgwh6x4PaA3pWHidpkv912X9aej3jvkyiw53qTjdNm2WRGzYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: =?UTF-8?q?=5BPATCH=C2=A0v1=203/5=5D=20x86/nestedsvm=3A=20update=20vmexit=20without=20pending=20or=20deferred=20flag?=
Date: Wed, 23 Sep 2026 17:20:43 +0800
Message-Id: <3fd01cae3399dd425731c0c2f62b5fdb68071e36.1790146987.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790146987.git.chunjie.zhu@citrix.com>
References: <cover.1790146987.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU0P306CA0027.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:16::7) To LV3PR03MB7609.namprd03.prod.outlook.com
 (2603:10b6:408:283::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR03MB7609:EE_|BL4PR03MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 29dd6e7d-73b1-49e4-2ad0-08df19540bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	GHkDco+qx9cw4b5kl+ueiE/BgAoDI3RfvCkVyrQOmBO4dK9cQ6ASgKZNSdCH6UxN5Ah24z+voBlTprprpu+5riQ8Y9TFsYQBfB+BVAvfXQo5wfIPYAUb2Ly0ZBNWGyVuHsfbeNJ3oYhRVJhqhZ8eGuJQrs+ylJr+bdXeJLsi2GYCF0kQYLtxBQ8Y4nuwo/7M4fPBpRtHCimnohAlTOsNatYlxrZazihC9G338e86OrDKxOSZK+pVXNYmq5obYp04b7Q5NyhERUsGDXSwQqLzNbmbRZS9qKWhhNRLSBHSXUAylYTIB7gEQXzij5BCIj4SnPxC7DmLLJpm0abrHqm9P2SJe8lr9DcBb0mC91/kmLQMAkmHeGwI669oLoSeKIfrWOxCuGF/QdWPLjW/fzwC2m78KlohvuiIds56IudoS9lbIeesGdA5bS6vOlPdwvCe5jo0t66fYmAWBCxowew5NLV7mS4lDnb4iKCwtaqLyqUoChxq8j8KGRcoGWwHrYKE/+qY46mbI4mT5wT0/PHebY/Hye2cjzIYP0palkHJbjpeT8R2q++mVBBnm+99RbnjVC1ZO1qpmaAUtItpx4U/QLr25yuUorUkGHl+2duRNMsYzursb35omr7UPj94SHm+rPNZFLO+Q8ht8kByy3URpps1gIgqMqFnxltrlw4p83s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7609.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cldFUk0vQkEwYUdER0FsYlZSdHhvVE1JbXdScjkwUlQvWDliS0crVHlsVjlr?=
 =?utf-8?B?QldiT0VyRnQ0RHpkQUxGWW9oemswem9MT2xObGFRZUJsSEIzZzVERGQyZlli?=
 =?utf-8?B?NlZrYXV2QzVwV0RJQ3NUMWJnd1V0MW10K1NDMmg2SGh6QjFrQXdkSGpZTlNh?=
 =?utf-8?B?S2dYWi96ODZQTHdJWUJRSEE1YjdEdG9FWmx3emlOb0tjQmRYOHVNQitzc2ky?=
 =?utf-8?B?ZWpjM05zUDI4K0U1cHdUVHdHS3d4c2x4UVdTYXQvcVVBT05jWFAxdmtGUVNI?=
 =?utf-8?B?YzJrWDB4b203ZnFRNFdody8rTExONmNvL3MzNDRLaXpYclg5dFhtYzJpRC9H?=
 =?utf-8?B?WldDZ2hIQ3E3d3lhdFp1cW9SMkVnN1c5RUJIa1c1VktVbDE1QVhwSm8vQU9S?=
 =?utf-8?B?c1hvdzNucmtmYS82cWdlYTdOd2xNTGZIVmRDNHQ0MTBQYVUyK213SDVteGRZ?=
 =?utf-8?B?c3VEOTYxdVV1TnFnYk4rWXcvWjdLSzliVzcwZU1oUC82bExVVG03K1ZFNGhI?=
 =?utf-8?B?TzNvdDRtUldpNTBvS1N1VWZFMy92eHp1RDVFbXorMVgyUUNuK2YzWjZDdy9i?=
 =?utf-8?B?eWZyTDRWU3JVUldydENQWk1aTkJRVmYrdUNFVkd4Zm1SSHZVZzVPSktyWDJI?=
 =?utf-8?B?UkI3SFNhQ3duVG81WDhwSWlVUWdYaVpEZ0M4OEQ2eVczb2Vpd3lpMjRPZlNJ?=
 =?utf-8?B?TVFtUUtUdnlxNSt4cVc3NVBGNXAwd21mZXkrazVMQnVwbk5vSGhvZHZINnpK?=
 =?utf-8?B?eG1ZREFvVkR0aXN0VWtyc0pHUnJwSXhkSmhZRDBucHV4RmhHWnlKMVZFTk1J?=
 =?utf-8?B?TTdrazB6Lyt1VmlnMjAybzdPSkpaMnB5VTJzcDU4L095Z00zL3lKWExuNEsy?=
 =?utf-8?B?R0FENTlDOEhZei9hV2h1TVIxeEZFQTNJenFEZWw4ekUyUzlRSTBVK04zc2xV?=
 =?utf-8?B?M0NOblNPSmZWVFF0eUhCSG4rbC9CV2FPNDlWV1BPdUEyck9TdDZkUUtvRnJY?=
 =?utf-8?B?ZVpJYUVneHV3NEN2Z0J4alVYeVptc0NMM3doeHhGL2RkNEtMcGJJTHdZSTBy?=
 =?utf-8?B?cjFidTdFbjgvR3F5K0xETE1lTjRBSzlhVXdXYWd4VHBia3RKc3pBcVZoQU8w?=
 =?utf-8?B?ZFluSGM2UE9mVDNHaE5Va3VDSnd6VmRvTHdkY1dodXNpWE9jRDJ2ZjkvYjQr?=
 =?utf-8?B?M2RNdlJkR0VGLytyek8zVVpvUzRySTV3Qys2S1kvNEpHeGRoVXMyMEh3UTVQ?=
 =?utf-8?B?WC9mcC8zcy8wUW1Nbmt2NEo0ZWYrVDNPaDZNMy9DR1huSWxVVk95cEhMallt?=
 =?utf-8?B?UUFzUWFPdlBKK3lrVTZ3Q00rZlM4d1hvZG9NTW15dzhPdTRHRkF3Nk9VTUFz?=
 =?utf-8?B?TXFwaEIzVjd2N0gwd1cwb1NPNFowT3YzVGM1WkZaa1BDMDhzdkhoeThVTlNo?=
 =?utf-8?B?b2grQXovdi94NGV3NXRwcEU5NlpzZlVaaFRoU1oyZSsyWUp6bVc2R0dpZ0Vq?=
 =?utf-8?B?MjdnQ2gyVG1ETmFWKzFyYTlvQnI3V3JiUWQyTkUzcDBRd2VpUGNrUHdkeFRt?=
 =?utf-8?B?eWtJM1FLUHFUZmRtVmFsWVpXWXJPanR2NzRaTE9YVElLNGJnNlc2WlpIT0w5?=
 =?utf-8?B?eWsyTmNzWWxBT21SNGl4RjhYczdVZTY2Y0ducC9jOUk1R2lMdmd5T04yNzBH?=
 =?utf-8?B?TU9qVWUyaTF2MXlIMEZYQ2JQTXhFT3BFWkxnSU9SZXcrVGsvZzhFa3hQV1F1?=
 =?utf-8?B?N0tGS21IU3VWbVZTeFhjNGtpNjhlQWZSTC80M1djcHE0dVJ6NTl4a3NwZWN1?=
 =?utf-8?B?bjJYd2svRnIvOUZ2ekhCbitSMTIzRXp1RGQ3cmJ1RVZ1cG9ZeHB4bGRNNFZM?=
 =?utf-8?B?bjZFY3lLZGdXcGhZaU80ak1DK1FvVEZJWGZ0VFlyV1QyVTFEaFVaWm5QRzV1?=
 =?utf-8?B?dHVzcjViUTJDcXlpbUtTNzNVTmxVRXRoZ0FTU2tZWXRnQldIUkMzNUxLZDdU?=
 =?utf-8?B?aWdxMGtpTTFkejc1Si9IYzIrR3ZNdzk4NHNiMzB3a0hnS1hSY1BYQlE4Qi96?=
 =?utf-8?B?eGJLeWJ4RDB2MzhIVTdzNFhGNEZDZGxsWGpiKzhIb2hBSTRORUNxN1kxMVcw?=
 =?utf-8?B?eHRydG5memx6ZlhvdG1jUGtWdFoxOWRDSFd2TVcyY2prOVBYMmlXY0lORXhJ?=
 =?utf-8?B?U1IxLzNvVTRtZ1VKL0xONnJuaXF3VFE4TFQ1VXUxcDdkQVN5VWNZaWY5dGkv?=
 =?utf-8?B?YnliQS90VVlEcmhrdTRnNk8xSzNuSmNaSlpFT01PekxmRGxRekhtbFNEaFBE?=
 =?utf-8?B?a0Z5b2JScTIzRk9ueUtwRUh3cUJ2REJFZWdZUU5EYmhDbHNic2g2UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29dd6e7d-73b1-49e4-2ad0-08df19540bfe
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7609.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:21:28.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuaFT9smi/msam5Eq3kj+bg540+XlIPPD1THl+sOkvnoFCjRPzEbKPALmUbPzDnxG+eqN0lveabevuBDxOMuBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8106
X-purgate-ID: tlsNG-d25034/1790155291-50D3CA5B-FAA83AA1/0/0
X-purgate-type: clean
X-purgate-size: 14296

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/hvm/svm/intr.c              |   4 +-
 xen/arch/x86/hvm/svm/nestedhvm.h         |   5 +-
 xen/arch/x86/hvm/svm/nestedsvm.c         | 168 ++++++++---------------
 xen/arch/x86/hvm/svm/svm.c               |  10 +-
 xen/arch/x86/include/asm/hvm/svm-types.h |   7 -
 5 files changed, 72 insertions(+), 122 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 7f6cafb6db78..f9b59a0d6a46 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -55,7 +55,7 @@ static void svm_inject_nmi(struct vcpu *v)
         vmcb, general1_intercepts | GENERAL1_INTERCEPT_IRET);
 }
 
-static void svm_inject_intr(struct vcpu *v, int vector)
+void svm_inject_intr(struct vcpu *v, int vector)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     intinfo_t event;
@@ -69,7 +69,7 @@ static void svm_inject_intr(struct vcpu *v, int vector)
     vmcb->event_inj = event;
 }
 
-static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
+void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     uint32_t general1_intercepts = vmcb_get_general1_intercepts(vmcb);
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index e22ef259c171..5876a948f39a 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -27,7 +27,8 @@
     (!!((v)->arch.hvm.guest_efer & EFER_SVME))
 
 int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
-void nestedsvm_vmexit_defer(struct vcpu *v,
+enum nestedhvm_vmexits
+nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
     uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2);
 enum nestedhvm_vmexits
 nestedsvm_vmexit_n2n1(struct vcpu *v, struct cpu_user_regs *regs);
@@ -65,6 +66,8 @@ int cf_check nsvm_hap_walk_L1_p2m(
 #define NSVM_INTR_MASKED         0
 
 int nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack);
+void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack);
+void svm_inject_intr(struct vcpu *v, int vector);
 
 #endif /* __X86_HVM_SVM_NESTEDHVM_PRIV_H__ */
 
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index edb3f444756d..9e5e804a5b00 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -152,8 +152,6 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     svm->ns_vmcb_hostcr3 = 0;
     svm->ns_asid = 0;
     svm->ns_hostflags.bytes = 0;
-    svm->ns_vmexit.exitinfo1 = 0;
-    svm->ns_vmexit.exitinfo2 = 0;
 
     svm->ns_iomap = NULL;
 
@@ -712,14 +710,10 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     int ret;
     unsigned int inst_len;
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-    struct nestedsvm *svm = &vcpu_nestedsvm(v);
 
     inst_len = svm_get_insn_len(v, INSTR_VMRUN);
     if ( inst_len == 0 )
-    {
-        svm->ns_vmexit.exitcode = VMEXIT_SHUTDOWN;
         return -1;
-    }
 
     nv->nv_vmswitch_in_progress = 1;
     ASSERT(nv->nv_vvmcx != NULL);
@@ -738,15 +732,10 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         break;
     case NSVM_ERROR_VVMCB:
         gdprintk(XENLOG_ERR, "inject VMEXIT(INVALID)\n");
-        svm->ns_vmexit.exitcode = VMEXIT_INVALID;
         return -1;
     case NSVM_ERROR_VMENTRY:
     default:
-        gdprintk(XENLOG_ERR,
-            "nsvm_vcpu_vmentry failed, injecting #UD\n");
-        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
-        /* Must happen after hvm_inject_hw_exception or it doesn't work right. */
-        nv->nv_vmswitch_in_progress = 0;
+        gdprintk(XENLOG_ERR, "nsvm_vcpu_vmentry failed\n");
         return 1;
     }
 
@@ -760,47 +749,55 @@ nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 
 static int
 nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
-    uint64_t exitcode)
+    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-    struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct vmcb_struct *ns_vmcb;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
-    if ( vmcb->_vintr.fields.vgif_enable )
+    ASSERT(vmcb->_vintr.fields.vgif_enable);
         vmcb->_vintr.fields.vgif = 0;
-    else
-        svm->ns_gif = 0;
 
     ns_vmcb = nv->nv_vvmcx;
 
-    if ( nv->nv_vmexit_pending )
+    switch ( exitcode )
+    {
+    case VMEXIT_INTR:
     {
-        switch ( exitcode )
+        struct hvm_intack intack = {
+            .source = exitinfo1,
+            .vector = exitinfo2
+        };
+
+        /* See the comment in svm_intr_assist() for why this is necessary */
+        if ( unlikely(vmcb->event_inj.v) ||
+             hvm_interrupt_blocked(v, intack) )
         {
-        case VMEXIT_INTR:
-            if ( unlikely(ns_vmcb->event_inj.v) && nv->nv_vmentry_pending &&
-                 hvm_event_needs_reinjection(ns_vmcb->event_inj.type,
-                                             ns_vmcb->event_inj.vector) )
-                ns_vmcb->exit_int_info = ns_vmcb->event_inj;
-            break;
-        case VMEXIT_EXCEPTION_PF:
-            ns_vmcb->_cr2 = ns_vmcb->ei.exc.cr2;
-            fallthrough;
-        case VMEXIT_NPF:
-            ns_vmcb->exitinfo2 = svm->ns_vmexit.exitinfo2;
-            fallthrough;
-        case VMEXIT_EXCEPTION_NP:
-        case VMEXIT_EXCEPTION_SS:
-        case VMEXIT_EXCEPTION_GP:
-        case VMEXIT_EXCEPTION_15:
-        case VMEXIT_EXCEPTION_MF:
-        case VMEXIT_EXCEPTION_AC:
-            ns_vmcb->exitinfo1 = svm->ns_vmexit.exitinfo1;
-            break;
-        default:
+            svm_enable_intr_window(v, intack);
             break;
         }
+
+        svm_inject_intr(v, intack.vector);
+        pt_intr_post(v, intack);
+        break;
+    }
+
+    case VMEXIT_EXCEPTION_PF:
+        ns_vmcb->_cr2 = exitinfo2;
+        fallthrough;
+    case VMEXIT_NPF:
+        ns_vmcb->exitinfo2 = exitinfo2;
+        fallthrough;
+    case VMEXIT_EXCEPTION_NP:
+    case VMEXIT_EXCEPTION_SS:
+    case VMEXIT_EXCEPTION_GP:
+    case VMEXIT_EXCEPTION_15:
+    case VMEXIT_EXCEPTION_MF:
+    case VMEXIT_EXCEPTION_AC:
+        ns_vmcb->exitinfo1 = exitinfo1;
+        break;
+    default:
+        break;
     }
 
     ns_vmcb->exitcode = exitcode;
@@ -811,10 +808,16 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
 int cf_check nsvm_vcpu_vmexit_event(
     struct vcpu *v, const struct x86_event *event)
 {
+    enum nestedhvm_vmexits ret;
+
     ASSERT(vcpu_nestedhvm(v).nv_vvmcx != NULL);
 
-    nestedsvm_vmexit_defer(v, VMEXIT_EXCEPTION_DE + event->vector,
-                           event->error_code, event->data);
+    ret = nestedsvm_vcpu_vmexit(v, guest_cpu_user_regs(),
+                                VMEXIT_EXCEPTION_DE + event->vector,
+                                event->error_code, event->data);
+    if ( ret == NESTEDHVM_VMEXIT_FATALERROR )
+        domain_crash(v->domain);
+
     return NESTEDHVM_VMEXIT_DONE;
 }
 
@@ -1219,7 +1222,7 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
         if ( v->io.req.state != STATE_IOREQ_NONE )
             return hvm_intblk_shadow;
 
-        if ( !nv->nv_vmexit_pending && n2vmcb->exit_int_info.v )
+        if ( n2vmcb->exit_int_info.v )
         {
             /* Give the l2 guest a chance to finish the delivery of
              * the last injected interrupt or exception before we
@@ -1228,42 +1231,15 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
             return hvm_intblk_shadow;
         }
     }
-
-    if ( nv->nv_vmexit_pending )
-        /* hvm_inject_hw_exception() must have run before.
-         * exceptions have higher priority than interrupts.
-         */
-        return hvm_intblk_rflags_ie;
-
     return hvm_intblk_none;
 }
 
-/* VMEXIT emulation */
-void
-nestedsvm_vmexit_defer(struct vcpu *v,
-    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
-{
-    struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-
-    if ( vmcb->_vintr.fields.vgif_enable )
-        vmcb->_vintr.fields.vgif = 0;
-    else
-        svm->ns_gif = 0;
-
-    svm->ns_vmexit.exitcode = exitcode;
-    svm->ns_vmexit.exitinfo1 = exitinfo1;
-    svm->ns_vmexit.exitinfo2 = exitinfo2;
-    vcpu_nestedhvm(v).nv_vmexit_pending = 1;
-}
-
 enum nestedhvm_vmexits
 nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
     uint64_t exitcode)
 {
     bool is_intercepted;
 
-    ASSERT(vcpu_nestedhvm(v).nv_vmexit_pending == 0);
     is_intercepted = nsvm_vmcb_guest_intercepts_exitcode(v, regs, exitcode);
 
     /* 
@@ -1352,11 +1328,12 @@ nestedsvm_vmexit_n2n1(struct vcpu *v, struct cpu_user_regs *regs)
 /* The exitcode is in native SVM/VMX format. The forced exitcode
  * is in generic format.
  */
-static enum nestedhvm_vmexits
+enum nestedhvm_vmexits
 nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
-    uint64_t exitcode)
+    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
 {
     int rc;
+    enum nestedhvm_vmexits ret = NESTEDHVM_VMEXIT_DONE;
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
 
     nv->nv_vmswitch_in_progress = 1;
@@ -1368,14 +1345,12 @@ nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
      */
     if ( nestedhvm_vcpu_in_guestmode(v) )
     {
-        enum nestedhvm_vmexits ret;
-
         ret = nestedsvm_vmexit_n2n1(v, regs);
         switch ( ret )
         {
         case NESTEDHVM_VMEXIT_FATALERROR:
             gdprintk(XENLOG_ERR, "VMEXIT: fatal error\n");
-            return ret;
+            goto out;
         case NESTEDHVM_VMEXIT_HOST:
             BUG();
 
@@ -1395,46 +1370,18 @@ nestedsvm_vcpu_vmexit(struct vcpu *v, struct cpu_user_regs *regs,
     /* Prepare for running the l1 guest. Make the actual
      * modifications to the virtual VMCB/VMCS.
      */
-    rc = nsvm_vcpu_vmexit_inject(v, regs, exitcode);
+    rc = nsvm_vcpu_vmexit_inject(v, regs, exitcode, exitinfo1, exitinfo2);
 
     /* If l1 guest uses shadow paging, update the paging mode. */
     if ( !nestedhvm_paging_mode_hap(v) )
         paging_update_paging_modes(v);
 
-    nv->nv_vmswitch_in_progress = 0;
-
     if ( rc )
-        return NESTEDHVM_VMEXIT_FATALERROR;
-
-    return NESTEDHVM_VMEXIT_DONE;
-}
-
-/* VCPU switch */
-void asmlinkage nsvm_vcpu_switch(void)
-{
-    struct cpu_user_regs *regs = guest_cpu_user_regs();
-    struct vcpu *v = current;
-    struct nestedvcpu *nv;
-    struct nestedsvm *svm;
-
-    if ( !nestedhvm_enabled(v->domain) )
-        return;
-
-    nv = &vcpu_nestedhvm(v);
-    svm = &vcpu_nestedsvm(v);
-    ASSERT(v->arch.hvm.svm.vmcb != NULL);
-    ASSERT(nv->nv_n1vmcx != NULL);
-    ASSERT(nv->nv_n2vmcx != NULL);
-    ASSERT(nv->nv_n1vmcx_pa != INVALID_PADDR);
-    ASSERT(nv->nv_n2vmcx_pa != INVALID_PADDR);
+        ret = NESTEDHVM_VMEXIT_FATALERROR;
 
-    if ( nv->nv_vmexit_pending )
-    {
-    vmexit:
-        nestedsvm_vcpu_vmexit(v, regs, svm->ns_vmexit.exitcode);
-        nv->nv_vmexit_pending = 0;
-        return;
-    }
+out:
+    nv->nv_vmswitch_in_progress = 0;
+    return ret;
 }
 
 /* Interrupts, Virtual GIF */
@@ -1477,7 +1424,10 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
                                      guest_cpu_user_regs(), exitcode);
     if ( ret )
     {
-        nestedsvm_vmexit_defer(v, exitcode, intack.source, exitinfo2);
+        ret = nestedsvm_vcpu_vmexit(v, guest_cpu_user_regs(), exitcode,
+                                    intack.source, exitinfo2);
+        if ( ret == NESTEDHVM_VMEXIT_FATALERROR )
+            domain_crash(v->domain);
         return NSVM_INTR_FORCEVMEXIT;
     }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index fc447d24d67e..a8d258aa3980 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1619,7 +1619,9 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     case -1:
         ASSERT(nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v));
         /* inject #VMEXIT(NPF) into guest. */
-        nestedsvm_vmexit_defer(v, VMEXIT_NPF, pfec, gpa);
+        if ( nestedsvm_vcpu_vmexit(v, regs, VMEXIT_NPF, pfec, gpa) ==
+             NESTEDHVM_VMEXIT_FATALERROR )
+            domain_crash(v->domain);
         return;
     }
 
@@ -2595,8 +2597,10 @@ void asmlinkage svm_vmexit_handler(void)
             switch ( nsret )
             {
             case NESTEDHVM_VMEXIT_DONE:
-                /* defer VMEXIT injection */
-                nestedsvm_vmexit_defer(v, exit_reason, exitinfo1, exitinfo2);
+                nsret = nestedsvm_vcpu_vmexit(v, regs, exit_reason,
+                                              exitinfo1, exitinfo2);
+                if ( nsret == NESTEDHVM_VMEXIT_FATALERROR )
+                    domain_crash(v->domain);
                 goto out;
             case NESTEDHVM_VMEXIT_FATALERROR:
                 gdprintk(XENLOG_ERR, "unexpected nestedsvm_vmexit() error\n");
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index beab9a3af203..256bf5b91402 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -69,13 +69,6 @@ struct nestedsvm {
     bool ns_gif;
     bool ns_hap_enabled;
 
-    /* Only meaningful when vmexit_pending flag is set */
-    struct {
-        uint64_t exitcode;  /* native exitcode to inject into l1 guest */
-        uint64_t exitinfo1; /* additional information to the exitcode */
-        uint64_t exitinfo2; /* additional information to the exitcode */
-    } ns_vmexit;
-
     union {
         uint32_t bytes;
         struct {
-- 
2.34.1


