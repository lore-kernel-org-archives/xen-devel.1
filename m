Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA15CA6004
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 04:05:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444858.1661426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFOKx-0007NK-RJ; Sat, 10 Oct 2026 04:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444858.1661426; Sat, 10 Oct 2026 04:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFOKx-0007NC-NW; Sat, 10 Oct 2026 04:05:31 +0000
Received: by outflank-mailman (input) for mailman id 1444858;
 Sat, 10 Oct 2026 04:05:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xFOKv-0007N4-S6
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 04:05:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFOKv-0068Z3-5O
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 06:05:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ac9b965-e002-0a2a0a5209dd-0a2a4503a36e-10
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 06:05:29 +0200
Received: from [52.101.193.1]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ac9b987-fae8-0a2a45030019-3465c101a39f-4
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 06:05:28 +0200
Received: from BY5PR03MB5315.namprd03.prod.outlook.com (2603:10b6:a03:229::23)
 by SA5PR03MB8428.namprd03.prod.outlook.com (2603:10b6:806:476::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 04:05:26 +0000
Received: from BY5PR03MB5315.namprd03.prod.outlook.com
 ([fe80::f586:75e3:eb6a:9550]) by BY5PR03MB5315.namprd03.prod.outlook.com
 ([fe80::f586:75e3:eb6a:9550%2]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 04:05:25 +0000
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
 b=m7qpeppD6tNuYH9cPFiEnK6NzRP00HEIdWaxZHuhmh14Q1oOxQQFcZYxBlAUyvu88rL3tTmmkFmWd/MqFQiiCM2fDgiyx3IQJpKiyUASlY0KyG0whvigmjJhE3NS9sXIE+n0PCw4C1VbLm95MH+MpLEj3OgP0Mgm2JR62irqN5oQ1zEhrPPiyhOTOUMhx5Apq33oUU5HBGbBplt8wbBH1jW8eHCeeHpDcDvpjtdY8Mg4JdsJdCLmHsMAD2oyW0TYaon/L/Yjv59RLfbWvo2JprFbuS3ixmpm8oD//Dka0D1cRMKCnllCQ5QAsh1xU3rOPilPIgbI9obJDEXxzfvIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqy7CVCB5sQxyVXT2EVuVVOIkP3k3Vbdge2Vuw9ZONA=;
 b=QvZQVnEzAoQJhlghOlErI8wqcWcExlbGlv1L1GgSX3+DOZYR9H8vPRECcfGSrk1MaczNYsyx4ST2gerJ5Pl3utL77elYdMbfy+JfYfy9TKQXRe9WvQLsPiYVb8yJATOA7RVxsg8bT1/ApElUU/j5VjagjxuXGFFvbQuyVP3sCAnm65msLO4MoM77l32mqMQbwFv5z3KUpyHsrUxEPBzDZZkP5otS+uwVhBUeBFb6lqSPEbG/oV9xYwUvt194U65fl0HFGkhy45W7PJUerRm/cf5RQ7hLeBQOsxvUAciQc+oQT+g8pjaA2GOjOYJQAp/AaPNzi/DUBUcIr4vdcLnokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqy7CVCB5sQxyVXT2EVuVVOIkP3k3Vbdge2Vuw9ZONA=;
 b=n7cNnyVezF8pRla8pCIbrg93ubUM9aJ8GX6sBKJDktmRf2WV7EJXEQL8cP3t5wgmuZIghhb3gKOnIXbOWUjHehr5oS53niKTPHRddEpjkK+dgda9CGzGGoX05aF0lYdqyGpXHyv2XFMxmuaeGuppzf+jKi6UWgPVDjB3XJcfYcY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Cc: chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	teddy.astie@vates.tech
Subject: [PATCH v2] x86/svm: Sync nextrip during virtual VMRUN
Date: Sat, 10 Oct 2026 12:05:02 +0800
Message-Id: <20261010040502.96413-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0835710d-f67d-4678-ba39-4597b9c9c7f7@citrix.com>
References: <0835710d-f67d-4678-ba39-4597b9c9c7f7@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR0401CA0022.apcprd04.prod.outlook.com
 (2603:1096:820:e::9) To BY5PR03MB5315.namprd03.prod.outlook.com
 (2603:10b6:a03:229::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR03MB5315:EE_|SA5PR03MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: c416e868-83c2-493d-b238-08df2683b564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|10067099003|6133799003|261009223027099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	g+MCYWehBdo9AvPVCbNnGD6Ty0bk1gilucd8pUk5zzbopUOieDpW8wTKEzoD+jam7uLc+MLqlv7UX549Mmli22mik0x/w6Q3f0Mh5LQta8mT2++ZckGZHBJD7/MQkd+4+zNFLawc2ozLopNstjEhJp2aGGL8mI+yCHVYkV3yFCf3v10oe4aEWp4d8hlWlllwJsEyYpD7a3roANvhCBz4gqZx/hD4s4wnq7UziH3iAzB6znz+kaX8Zc0Rzw5cMBevYOka7SgkJy5sZCida6TAKTN69CH4SloJ32pAWLkjpqbGOQzutEQNdFgXIX2xFURi+bCW08AOe1uf/6f/xZm+8+etEDUhPRzQpUHgsSeTLT+ydnlrLCSWZkUK330LKXjPRZa0cR8Cyhz1+BBWXR037PPDV7VPCLJUZR7mvxtbBcDLzahZZgAZIvD3SsYsgySEVJKV5c1SnAzPnoSTOxHE3m41qnNX/qf8UKMAPbNOtAWP5dp5eBsXQTotc+5vbX0DKFeVOoktpjakwcZxh8JeNdun6XsYhNjfwKssz3CVJWIZF4ZGPqmFB6vHvwej2yJ44CvLdBe+zmnIrNTsIrYrmcj+dTdb/fy9xh1fnkDbzG0LgXr5lOLfBVsKWzipO+tyU77OjuZhFGXXlgLkCgLUivLLmuAJTAO1O+3B+FWJvr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR03MB5315.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(6133799003)(261009223027099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NrjUIt6uUIatFaw8y02KVXbV21jAGSe6VQMC6aDOxk6/AZWcevkMRLoAC5Vr?=
 =?us-ascii?Q?yNaM9ITbfgZfw6cLAIBaJmVNivLfnyaG1i4uPGpILyKxIi3+CyMUFE7aV2TW?=
 =?us-ascii?Q?nKA0AiHAzpmaBMC8lDiEbVyx6Tueiv8mm+FUO1neMKeIbHiCMf+dq+MM85Id?=
 =?us-ascii?Q?ELaN1DE/SN6yqb1K/IvnDtt9hpC1NgEBmEmdM1a+pKvIAAWba8BvxP5cSmjc?=
 =?us-ascii?Q?zu7vxBlbq43KfGiuJJw2e6y0iawgeEOrMWG5pECqOzXqGSc3SdXUeD/FjU7q?=
 =?us-ascii?Q?842ZTumK2l9qoqV7I4v3M5Oh8Oi35GbG79CyFBoqfesi3EuEzicyKLkYhPTa?=
 =?us-ascii?Q?V+k2geNpqdW1M60LWPa0Qt/LdrP3FxabwVITu5fvlZXSPu+b9r31m8XUynjD?=
 =?us-ascii?Q?XwIdSALRqiSII2KOB3K6myZItrcf2WhYMxtUdrqJyEEE/S28270/eiK30G/A?=
 =?us-ascii?Q?xYU5NvM2OeHmskc1hQfeSM++yVQ+BT+XZABQk+KxL4r5JR0BX4G0WiOfHIJs?=
 =?us-ascii?Q?pRTnSp/5dx00ymBb5NTQ+UoX+zW0UWhyAY57TDBQccd3jtiOJpWC5J+XjPLr?=
 =?us-ascii?Q?Y/K9MHsjkQA4S/kr+e5QQeCyb6Xn6IRabKHuUjh2x/wOFROyKjUlLv5uPnL/?=
 =?us-ascii?Q?64q9GoI3DeXNXf6xfbY+5omxXoBi3PBwZQg9u/iaei6ynTcW8duQLl4OQeVR?=
 =?us-ascii?Q?ptBvl5RQPBzs2Fun+Kl5xDJ8cyeoMh5HLRVrRJlDExgnxGUFxM7Y9YQtbk3E?=
 =?us-ascii?Q?PwJsJuuHvcAsynDgO3ldKtoMh09AtMZl36BxenxvkNiQTiCIRwImHDKR/5bY?=
 =?us-ascii?Q?kAGxqzxtSqa+F2+DOGoVFIvdNltnd2vTFtMXxvIQ7Slc/U2nSNMHTJbRkT7V?=
 =?us-ascii?Q?5uMaCKWDmAfAjUcBga6UUSBEpr+E7d8CV4fVpQKoHc1RpTeqjtP0T5/8ZgKz?=
 =?us-ascii?Q?FbrPPxKp81BfBl94U6KvMwb61U97kTFLg8Z7xL4OAVR/c4yhLDfSYxGiLW8O?=
 =?us-ascii?Q?3gqZ+6AdvqSUvDYstJmFYfc3Ba5zHxTs1xIFYItevI/uvOeSXtKzyMMFI+DW?=
 =?us-ascii?Q?SDNnHke6jBhrGbKLsZSjTLdloA4vDwzopplBvSp6xXq2sk7y8O8wM65IIaap?=
 =?us-ascii?Q?R20/+mlWEdCk1oRo994Ptb5axCA8ZGtqsYBNXKrl50JUof6FncHpN055Z8AT?=
 =?us-ascii?Q?zuYPgr5DRMwM6zQu3AQmMbEAW7dxRf4NcLSkbzb9ImK1XodxyGgqP46wgFvF?=
 =?us-ascii?Q?AxzCyo91/e0WleS1GKVJVhj6REyI36JhnuxKGtjZZ30ABQatXUHeIxWqXhaE?=
 =?us-ascii?Q?6bh7EsHdlb5TJGUd/cw3seohpi8B3kF+pbb+4fH1uzAxP88w2cxe/6Jb/Eax?=
 =?us-ascii?Q?+ALiOhHTGJX06dQuPV6aVTezul6VqfMocDnj+CfqG9FsuvNmP3pfemotoa2B?=
 =?us-ascii?Q?/RZbig0ueDWV7Lt0xoCC+omqFJK8mW3QZkoOgiT14x1MQKlBBxyzBCGoqtu2?=
 =?us-ascii?Q?RbkG7hjtWLzanBL/9KQzIHzbBngSsEGeBjTzJRWc5nXaBlExQTWoukx7mPM9?=
 =?us-ascii?Q?PEmNeLgFTDp50156hTwTiUjwokz/dWL3N/fy89ZqxU4bVAlT80oBZL5Ukz5B?=
 =?us-ascii?Q?0gaLG9VRVauSxpxeupYmDgVhEPNKcA9hjIQ3UrFzzzF2q6IA4m5QtPbSGqFU?=
 =?us-ascii?Q?DD4xUpn+SLUx4gNPdqcuOpzl+pryonCBY3QRzZwekfMGJj7Ubbq1E05YD31V?=
 =?us-ascii?Q?6tkmDNkaGw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c416e868-83c2-493d-b238-08df2683b564
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 04:05:25.8867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFyn8/aa7+xrEvHC0/ZgUgw8CyL+wBzZp4I6fgXnt9n2XfnZ7FB7tA2bCntCqC+AIu5kG6q+Ma0oRWl4H4yylQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8428
X-purgate-ID: tlsNG-33051d/1791605129-7488A4E9-1E2ADA3F/0/0
X-purgate-type: clean
X-purgate-size: 2578

From: Chunjie Zhu <chunjie.zhu@citrix.com>

NextRIP is consumed on VMRUN as the return address pushed onto the
stack for injected soft exceptions/interrupts.  nsvm_vmcb_prepare4vmrun()
builds n2vmcb from the virtual VMCB on every entry to the L2 guest, but
never copied this field, leaving n2vmcb->nextrip stale.  Injecting an
event in this state can wedge the L2 vCPU, as the APM does not define
behaviour for a VMRUN with a garbage NextRIP.

Nested virt is only offered on NRIPS-capable hardware, and NRIPS is
required to be advertised to L1 (see start_nested_svm()), so the L1
hypervisor is required to keep NextRIP correct.  Therefore no
conditional logic is needed here; an unconditional sync suffices.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
Changes in v2:
- Retitle from "x86/svm: mandatory update VMCB nextrip for soft
  interrupts" to "x86/svm: Sync nextrip during virtual VMRUN" (Andrew
  Cooper).
- Move the rationale out of the in-code comment and into the commit
  message; keep the code comment short (Jan Beulich).
- Drop the stray non-ASCII whitespace characters from the comment
  (Jan Beulich).
- Drop the speculation about garbage/invalid NextRIP values: nested
  virt is only enabled on NRIPS-capable hardware and NRIPS is
  mandatorily advertised to L1, so the L1 hypervisor is required to
  keep NextRIP valid and no conditional sync is needed (Andrew
  Cooper).
- Cc AMD SVM maintainers/reviewers per submission guidelines (Jan
  Beulich).

 xen/arch/x86/hvm/svm/nestedsvm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index faacfe007832..f2f3f9d14ec6 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -465,7 +465,14 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     n2vmcb->virt_ext.bytes =
         n1vmcb->virt_ext.bytes | ns_vmcb->virt_ext.bytes;
 
-    /* NextRIP - only evaluated on #VMEXIT. */
+    /*
+     * NextRIP is consumed on VMRUN as the return address pushed on the
+     * stack for injected soft exceptions/interrupts. Nested virt is only
+     * available on NRIPS-capable hardware and NRIPS is required to be
+     * advertised to L1 (see start_nested_svm), so the L1 hypervisor is
+     * required to keep this field correct.
+     */
+    n2vmcb->nextrip = ns_vmcb->nextrip;
 
     /*
      * VMCB Save State Area
-- 
2.34.1


