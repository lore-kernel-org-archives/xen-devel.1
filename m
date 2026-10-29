Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B288606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 06:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=xBeTXUzs
Received: from list by lists.xenproject.org with outflank-mailman.1464193.1674932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJcQ-0005B9-Bi; Thu, 29 Oct 2026 06:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464193.1674932; Thu, 29 Oct 2026 06:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMJcQ-0005B2-91; Thu, 29 Oct 2026 06:28:10 +0000
Received: by outflank-mailman (input) for mailman id 1464193;
 Thu, 29 Oct 2026 06:28:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xMJcP-00058r-61
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 06:28:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMJcO-009nQA-JA
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 07:28:08 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e772-e002-0a2a0a5209dd-0a2a45098852-6
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:28:08 +0100
Received: from [52.101.57.9]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae2e777-be1a-0a2a45090019-346539099b10-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:28:08 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by CH5PR03MB7814.namprd03.prod.outlook.com
 (2603:10b6:610:213::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 06:28:05 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 06:28:05 +0000
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
 b=E0dQoTcor2TTOmUNpIca37xUvUXBkAG6kzMcIGJjX5fpoAG++TvtwFOIzIAfHWU5HE1FmftpwfMaaB70JcVZADdeiiERdgZpyvk2oeGBterGB6YfDrsyGIdQDlrTvcLB2yK6FgnU/Y/1kdPjuvIMTP+HhiBN6uWnCCFTwmdHzBbkeEiymuPcVMTQh1KHrve+wzIXOKWtQ75HX5NKieTxBXtoo/ICXlYZzawomh9vyeVbEMT5NSoluh0EDINWan/7BlOFWjNhjE9WwCkgddb1Ao7sCMJ7LufLbwrYoyTxlsvfHMq5vHLBj42ifcqRiqLPrP8xnf6OkZAz/62aDgQDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRYuKRMvwLZ55Mb3+BJf5qlLfaVtGKo4c1WB061e+e4=;
 b=h9Z7MSPaCGFJCgAeWRszLSLcJe2iAVP2kaXYe4o8967sxcgUuXqaU/jhpB5ccWNNcEpdTX3yjfVdF2QCc2wCbtS4wkO+oaKXqh266kvUpVeKbDEUKXNgaZnRtvbSuLHp3GkYHlEX/elUGy8jGE+ZFrTESavBw7UjtbVB1oz704y/eT+KXHw6nfMa3rL8EgC1Brj/jWc3HnovQBI99tihu8lxvsG/hZUaOUQ+m9J5gigZJO3Eh0n1TCVIHe76KCjRpkuAkPdtk7JXVBSb7F9Q8L8ewwUoF6maQUtc+Q7/LChXkBjGpLhBq1pgDKPpQNVy01QTdcpNhu0NSgIC0hzkQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRYuKRMvwLZ55Mb3+BJf5qlLfaVtGKo4c1WB061e+e4=;
 b=xBeTXUzsJrpSjjvSb1CDFzrQfqAmmOIUI2RpNZo9J44cMDI2mzmBNoc0M8pouWMYtvpJmiCV5gGvUsX1jNgiy0yD/GguCyghEjAqUlF0n+GtyXEenv+q9Te8jLH6dCK+xIaiZYq7qMrM1AGEplzZGvWwF+NTXl83cwlebf3zQDk=
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
Subject: [PATCH v2 4/7] x86/nestedvmx: Load L2's EFER on VM entry and restore L1's on VM exit
Date: Thu, 29 Oct 2026 14:26:56 +0800
Message-Id: <dd7f2da45a7a53042b9bd7bea62ef05b7347d793.1793254779.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793254779.git.chunjie.zhu@citrix.com>
References: <cover.1793254779.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0086.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:c9::16)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|CH5PR03MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 410c71ba-77bb-45cd-c273-08df3585ca13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|260925021911599003|260925022911599003|260925021311599003|11063799006|56012099006|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Y7I2CdZI0bvQnf8Xb2SMhyM+Jm7/E2UctzVRKiZhcYZftnEkoeX1IZU3/oC0L1nF0nl60euBoAC0ULSIDx6hSJL9RNkTEM0TVNlrqZWrISpHdcNdfEDj/sXUUCytILL6beSwYV6LkpNUlpcB3+95Njg5ehXDx/YBsoIpNkH8BbhxafNulb+qMkfBKgTL3Kvx9/1NCizfTYTUzx5UfsjC+S0OR4vPXtR70W8y1tWXyIcDmcBxZCbFWKkPdXgLIi9525xj7D+ls0Bi7ba8J1GFA59UBTFdrQ1H3jMkclZiKy7mrEB+V9TdeW6N8u1dw709WAG5Hwd0UaZ8oLPOFw2KVKfEqioQXw9toVJNi1frayAOZTyyZl42GasLnDBuhZlp5UCtNuOBSAtjOcwofcoaSywgP1Cf7kFFJU7QSWKhkIZ8BVIAJ4iRzp7PyxljM21UWPPSBGpBr54kPl7pRqLl5J0k10hkwYyBGlc+ObUdGVJkpK33W4oiVzpCIbwXgN9HFm0dPXjI39PWv3aTHBG+eoUzt3TRn3c119BQJqhaKZZjtgpoVT/N3aemL5ia7fxEMvWwefzSnvh6l4Wvc9cJ3O6+jFafU4ZS3CSP0snry20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zyZTXeMELMeTOu3GiSyhYp23cuvTEUgOgJmMIqkS6mO/hHIDpYdF57oLOiwK?=
 =?us-ascii?Q?ibphafd3wuhGCCYFNLY1kbYslVfTUvU5d82MXLczx7p7sZTQ6FYEgP1YCrIX?=
 =?us-ascii?Q?7yNfLiQzAxRcwvQO9hJ9oPvb0s5BbxH6t+eFDA5svmighPu6ZK5iXwQkKpm6?=
 =?us-ascii?Q?X+j45sMgLeTcyKi2TrvCwIkgmZ5kW4EEhSehm1ogFg7uN1274f0Z0GkBv1vL?=
 =?us-ascii?Q?WY0b3S7bC4dt8FQfJQxIZri2NLQF0TgxMLwJUpxYLb1fz5OTsEupqfo9Fmrs?=
 =?us-ascii?Q?LN8sFXOoj72hC4lwFKi4+ra+Mc4w4KM7jCW9Fcj/b44qAVShnlIDWRuRtuCj?=
 =?us-ascii?Q?6jcTYiJwbfojt/CC7VmqhFX9Sw1QHSUKIOfgaCWQ0UJZW9+aWz5ATWprlmWE?=
 =?us-ascii?Q?cSCcr7eM6XfnKhw9W9Bx9nCwWjw3MIYrL2oJKpBt4xJVw5aBgWYkUUwjucLD?=
 =?us-ascii?Q?GV/gm63uvAHSPyJ5Nh0Oua0j6vBm4GmXQO7i+3bo86o/nievpp4JXLyiXAFl?=
 =?us-ascii?Q?FYzUmMBwujAoCYLH9nsC6+tl6OV7qwajOd+6WKop10EKiKfLbhU3d4YuvT44?=
 =?us-ascii?Q?92GuaZ8LbRLWDbjeD0xInYKGEaWXI+Z6fwdRUeeuDpFb0aA5LtNtaY/4kDbQ?=
 =?us-ascii?Q?NylEkEsndorITZqQC3pB6FFmTXHE/lhfAcm8wQ4lpk8L6wnf7NAqfgg3oKBx?=
 =?us-ascii?Q?2dA1Bjq3NOVpAT/wP0oSnfhx/k0SukE0aRJctM1n7ifjl8wA9dNp+1OpTEV3?=
 =?us-ascii?Q?wqGNsQjVKCOm2REeMorBIl+W+5B1TsdTO54B6BdfP8RluJbzoJfP7+tLmUr3?=
 =?us-ascii?Q?pIroz5VLsOv9fNhyPWUO7FZeJqrh/u4DqNgxTYtJ0ZmD0NgLjGw34J84A70E?=
 =?us-ascii?Q?H1Wg+8eUcqIPTreGqdrbB8L5gye/swORazbGCqHVU7e/CBbZM2RZ1y6/H+kJ?=
 =?us-ascii?Q?H3RCtmzRI/yVJxe2yAqUQeUY0VsfhlNguDWBzL1wi0KI06nbvX/LdiuN1rpR?=
 =?us-ascii?Q?tmAIkAFhMgOBXKjtvmGHWwbCpUSySgSgap+1d89z3b5EQNoCXYo5wSqqRk8R?=
 =?us-ascii?Q?jrLJFLZnTCmmXEVggcVFbpTwUXqNmNelbK1sz1KJe1MLf5jBMcprHAJn5Whq?=
 =?us-ascii?Q?vYb2gLiRKFaa/cz1RcYy0nm+eJKHsWSX3RADwyc7ygyh/1DtyWV1jWOZIcln?=
 =?us-ascii?Q?iYDNwAd/pf8nHjJVjyWs265WhxOqD1dvFvuOR0Et/NZ5+uKVTHxFNRGUWPgp?=
 =?us-ascii?Q?y7+Hfw19smJB2dZcsRUhYahS+JfMZFFIFS2Q9EWNjq67nw3uuPBycy5ezINo?=
 =?us-ascii?Q?0rDkgV9muoeDFcaGuM78MGXnf0Z6DknkGkUKe/adWcSO77a+PrPt9Ou0ShVT?=
 =?us-ascii?Q?glrlFI/S3pGPHulEV+Tv0b3nDxt7TTt8EApsma11kjydI0NoMT6BKOfIRJvh?=
 =?us-ascii?Q?qCc4Cuk5CUtL5b2G84hBfdoBY9xNeL1drx1r+c9eldT0/iVRqA7GZl83wxAv?=
 =?us-ascii?Q?/72Bs2+JxZp3tz3PpXvNznUMGDGiLJQqPVZ927h4XM6pak2pUsPBdnY7jcRx?=
 =?us-ascii?Q?xa0uCXjjsjPiuyJ9cu7jZpNwKo5u/R9EdT+skfvnv+w9IahGrZWiAbzqq5yv?=
 =?us-ascii?Q?wWcXh1+1VqQ7g5dG0v5C+ZjDAFg4+jBzRpDgjwNMCvW6pz2lP8e0Pw8QmQBv?=
 =?us-ascii?Q?3QsnVzC9Wcwi66CdNY9WON7SpqXrBhW2IFqaeSrXTy1Xj0MnnFZxe6Fln3fo?=
 =?us-ascii?Q?mXRIg5GDKw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410c71ba-77bb-45cd-c273-08df3585ca13
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 06:28:05.0662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSP5d+fj6yvKJLQfAB57BioP+SV8Mi8W/jX4mGuj+7U0uHSiIiGWluIx/NZd5qdccKUUh/pTiRpoILg3lfaLIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7814
X-purgate-ID: tlsNG-bad1c0/1793255288-FD26A034-EDBCD327/0/0
X-purgate-type: clean
X-purgate-size: 4060
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

nvmx_update_entry_control() strips VM_ENTRY_LOAD_GUEST_EFER from the vmcs02
entry controls, and virtual_vmentry() only derives EFER.LMA/LME from
VM_ENTRY_IA32E_MODE.  As a result:

 * While L2 runs, hardware EFER is L0's own value (LME set), and since
   vmx_update_guest_efer() clears the RDMSR intercept when guest_efer matches
   the value it believes is loaded, L2's RDMSR of EFER is passed through and
   returns LME=1 even though L2 never set it.

 * L0's v->arch.hvm.guest_efer has LME cleared for a non-64bit L2, so L2 never
   sets LME in L0's view

L2 Linux AP trampolines read EFER and skip the WRMSR if LME is already set.
L0 therefore never sees LME, and when L2 enables CR0.PG it is treated as
legacy PAE paging.  PDPTEs are loaded from what is really a PML4, and VM
entry fails:

  vmentry failure (reason 0x80000021): Invalid guest state (2)
  PDPTE0 = 0x0000000023604063  EFER(VMCS) = 0

which crashes the L1 domain ("Unhandled nested vmexit: reason 2147483681").

Fix this by:

 * Forcing VM_ENTRY_LOAD_GUEST_EFER in vmcs02 (when the CPU supports it), so
   hardware EFER, and hence passthrough RDMSR, matches guest_efer.

 * In virtual_vmentry(), taking guest_efer from vmcs12 GUEST_EFER when L1 set
   VM_ENTRY_LOAD_GUEST_EFER, preserving LME for an unpaged L2, with LMA still
   following IA32E_MODE.  Then push it to hardware with
   hvm_update_guest_efer().

 * In virtual_vmexit(), restoring guest_efer from vmcs01 GUEST_EFER so that
   L2's SCE/NXE/LME bits don't leak into L1.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
Assisted-by: Claude:claude-sonnet-5
---
 xen/arch/x86/hvm/vmx/vvmx.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 0ec9eb6be450..e37f59bea7ce 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -695,6 +695,12 @@ static void nvmx_update_entry_control(struct vcpu *v)
     shadow_cntrl &= ~(VM_ENTRY_LOAD_GUEST_PAT
                       | VM_ENTRY_LOAD_GUEST_EFER
                       | VM_ENTRY_LOAD_PERF_GLOBAL_CTRL);
+    /*
+     * Always load L2's EFER from v->arch.hvm.guest_efer, so hardware (and
+     * passthrough RDMSR) agrees with it rather than showing L0's own EFER.
+     */
+    if ( cpu_has_vmx_efer )
+        shadow_cntrl |= VM_ENTRY_LOAD_GUEST_EFER;
     __vmwrite(VM_ENTRY_CONTROLS, shadow_cntrl);
 }
 
@@ -1220,13 +1226,24 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
     lm_l1 = hvm_long_mode_active(v);
     lm_l2 = !!(get_vvmcs(v, VM_ENTRY_CONTROLS) & VM_ENTRY_IA32E_MODE);
 
-    if ( lm_l2 )
-        v->arch.hvm.guest_efer |= EFER_LMA | EFER_LME;
+    if ( get_vvmcs(v, VM_ENTRY_CONTROLS) & VM_ENTRY_LOAD_GUEST_EFER )
+    {
+        /*
+         * L2 may have EFER.LME set while still unpaged (LMA clear), e.g. an
+         * AP trampoline which skips the WRMSR because it reads LME already
+         * set.  Keep it, or enabling paging later is treated as legacy PAE.
+         */
+        v->arch.hvm.guest_efer = get_vvmcs(v, GUEST_EFER) & ~EFER_LMA;
+    }
     else
         v->arch.hvm.guest_efer &= ~(EFER_LMA | EFER_LME);
 
+    if ( lm_l2 )
+        v->arch.hvm.guest_efer |= EFER_LMA | EFER_LME;
+
     load_shadow_control(v);
     load_shadow_guest_state(v);
+    hvm_update_guest_efer(v);
 
     if ( lm_l1 != lm_l2 )
         paging_update_paging_modes(v);
@@ -1452,6 +1469,15 @@ static void virtual_vmexit(struct cpu_user_regs *regs)
     lm_l2 = hvm_long_mode_active(v);
     lm_l1 = !!(get_vvmcs(v, VM_EXIT_CONTROLS) & VM_EXIT_IA32E_MODE);
 
+    /* Don't leak L2's EFER (SCE, NXE, LME) into L1. */
+    if ( cpu_has_vmx_efer )
+    {
+        unsigned long efer;
+
+        __vmread(GUEST_EFER, &efer);
+        v->arch.hvm.guest_efer = efer;
+    }
+
     if ( lm_l1 )
         v->arch.hvm.guest_efer |= EFER_LMA | EFER_LME;
     else
-- 
2.34.1


