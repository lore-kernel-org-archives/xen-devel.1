Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D43606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 07:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ILptrI0e
Received: from list by lists.xenproject.org with outflank-mailman.1460823.1671697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEzV-0006q4-PU; Mon, 26 Oct 2026 07:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460823.1671697; Mon, 26 Oct 2026 07:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLEzV-0006ps-L3; Mon, 26 Oct 2026 07:19:33 +0000
Received: by outflank-mailman (input) for mailman id 1460823;
 Mon, 26 Oct 2026 07:19:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xLEzU-0006hb-As
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 07:19:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLEzT-00C7G5-GW
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 08:19:31 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adefefe-8faa-0a2a0a5109dd-0a2a4504871e-12
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:19:31 +0100
Received: from [52.101.61.2]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6adeff02-b57f-0a2a45040019-34653d024212-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:19:31 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by DS0PR03MB7727.namprd03.prod.outlook.com
 (2603:10b6:8:1f1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 07:18:50 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 07:18:50 +0000
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
 b=OD6g8Ez03TDz+dSyxr/rb4VsRH7ch4R43ivggtKUUWpdcdTg2ogmqBvlMbON83AnX8xIUqw9elU03tGMZ7htr5fz7zJtl2uYDkgACXltvShPiSyM0/2X1YwGNd2XfU1VKOuWmm7QD5xqhtay6n8JGdX6arxkpl5JM9gcHvGdyq9b4wkChe17nqyCTHMpTt+cL76sf9wigUfa8z4XULYDvx7v3tSlgdUTfMHmsORt2QQnc3Q00Swe9++t7529FhOJjwDd48up46GpGTyZz2pMpGcgI5oqH2l5ogNZFqYUUpjmUDKWvECcePpc/qmIQ9PPS/ezynzvn15hLwZZfzRmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LF25T8OiSrwYhtuxYaa3NNRoM8wSX7qmAHj8AJcAOEM=;
 b=pVb6t+vy77j3+k/CqrurOQc+RlrtgBe/NeYpN0tHYoCosm3KKHFwL7J7AP7/ddUU8SYW2JygFAX4WpqaF0MY1XPkUui2pGAUS/Lm75Rw96h3Q4pwfMurcOpDKgoNQEgXDax52Yf3LZyh8dN0PXibiYXlGHvw2R0hR98womkqQacst9wqdu/Ug0EOwPOmiNPlcyYF0rikWnfxmtVFwFT/nfe0l8qXcqkgUitrkYPHBrAV5lY+K+5hJSCsXvPD3wb9CHr0tjZEZD+On3eJrQOrWdhG9mJ1sZOpPxsRmR5t40u16X6YLhr3T6WCNTzt3WGQ2fu9qhJK7UbiiP+D3+J9yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LF25T8OiSrwYhtuxYaa3NNRoM8wSX7qmAHj8AJcAOEM=;
 b=ILptrI0eJtAOWhc/5xOR2PNPHbSqyUrK7gnpRPVOjyjY9M59Yb7Ajgv2mXKLnM3I4ncd7+hM++oC1QKTS8FtC1E6HaXDVl7SSv4SXj+kRtjrflVunNL4wzxTjOvjgaXbYELqcwIsffQZIRI7OkCOQM7ke7JS1CRr0ueL2NiEPCk=
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
Subject: [PATCH V1 5/8] x86/nestedvmx: Load L2's EFER on VM entry and restore L1's on VM exit
Date: Mon, 26 Oct 2026 15:17:51 +0800
Message-Id: <da0ac0f8005e787190062f7f004c96dee27fdfab.1792997742.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792997742.git.chunjie.zhu@citrix.com>
References: <cover.1792997742.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|DS0PR03MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f2a10f2-6e99-4471-c03d-08df33316225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|260925021311599003|260925021911599003|260925022911599003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	7pD4I8BVlDlZ9nvmyvv0dWML2vhKZE4Lvpe95WyzlzIjZJzFUK/+EUXTaWWPghLEqo6rubb3HDlrjZWFtSiZQ0hatNV4Mh9/8qUso8XCJ140Av/bm6QD+D9dMiEfRk+idHcCyMh4tPjohGOjQkhfiNrKCBO/qB8GCyHiXex21gKUjpBdUI35OnQl1v3uaTXTk+X3DX0sAP17eyBB3XS3+ap9SbTHi/w/pJY7gDrqa25iuVSWqxswhdap4xjXPcOeQ/I1d4YrmYEAhVe/myi52d6u4ki+Rju52pWHRCR9+az/brbQMnVyaO2KQEYXbHPxEg3V24zxwhEw1coSkG0wwr+niGfvlLcmi28jUPbdyK90DSfnnX+SuDtD68WCZTfOTmquBN2islu3FL4BqhJFMwz8+3hWdRTFl+VOq0XzNXAQf1cpaMbbuao3NiCIiabYPD3T/iB0CbnqW44xwlpaicUb24GZTb7MYI0KqlqMlxjr6QqQgrBxI5Zj6EIna1NzPVqOeRK+NF/I1dR5r5MgpcwWrXjv8wt4Q7aiN0Vmu9wDA8AipLndWCErlW/xhGTaG/UHsLvYBqg5uv/7Bi5ZMe7NK2SvXe5MtLUDzPyP6tU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2mSL5NTkAseCI+PMNhoxHRCgR296+JpNsPiEmHN8nfkfSIsubfWBAx3HkcLg?=
 =?us-ascii?Q?nUvc/lg4XVzZaw4uAH61nc7tpOmquwy6d9sbmfl7dy0yad7RSBEfVhiG+Ew3?=
 =?us-ascii?Q?22Etnzts7Ull4IXmrGAnTMZqSJpbv1Dn7YYO/ngFrf8otZVKm3bu11ABRMOw?=
 =?us-ascii?Q?ZGnB2Hs47UXbgdxOhaMAmDXyZReFIdsQ7ftaUpnyyS5+OtwCBxehhAUy67Ms?=
 =?us-ascii?Q?Vff9yEVVre1c/pQxEga+EoBCKS3WELYHAnz17nOhAftpS9dn/C1vyTpDbs2E?=
 =?us-ascii?Q?jElOi1DQMnD3DvvE2ywma8Ex8qK2Lk5xultpqGCvKtELzEGZ2hnLsZuGmydz?=
 =?us-ascii?Q?tY6pLizHEDcQy80dhnFjyRS3eQDDGQpiNQSKAvMnJbE/uZ4isog5QErmthNG?=
 =?us-ascii?Q?tD/FbvCe48vzzKe6/D3Qkl/OInHaGeACjg74GMH0rezDVCH0KUQl7QYp2Ksf?=
 =?us-ascii?Q?TVk5ZCEmcFbsi9XQhMYeBqLAeb83W5AfQ9ZRG5H8mv5XXWdJ8+TqGg00jgrm?=
 =?us-ascii?Q?x2UYBE83MN7rVoc/uwRzVdgeaALy7RvxjAtbQKgGuc4mBNtBKHDVuZvQkV5u?=
 =?us-ascii?Q?Ai2mW7z2VEeVdDtcsy4mD3uteugzMTJCWK80XCSdXDvsWdkYjdYtqR3G5f6N?=
 =?us-ascii?Q?9kz96LRTms/iOKgEFnfx7P3oVhLLmNZ2OLMb1cr0hkJ3QXs7Yr5fdLVXByBb?=
 =?us-ascii?Q?lMAyHvaFF6m7sptSd7cruFJtGaq5ws+/em7F/5ItcU2T5t2rHEVu64FSZIzY?=
 =?us-ascii?Q?FTQAu4s+jjo2zTpwowmKRIbD1Y48e9Fp/G7QYrIvSI263Tt7K9V1TcoZgPmd?=
 =?us-ascii?Q?eTKgsI/CCy2dq0Ie6epldyua4nvHetV1/dLhing+LYfVlQ2AyNbN5dumFEwD?=
 =?us-ascii?Q?28qyjDtpUS+mhgXo3S9GdMLpkgKklIQzT6MW15VSP3PmaVm+NAZyAI+GbdtW?=
 =?us-ascii?Q?PDcdM4Pp032P3MB8TULBDweuLmvS04XM+nJoXlmpXLotgRt7/z/R0NbdTq/n?=
 =?us-ascii?Q?+GgRAcBy28yjeoibc6WaHgtgg2ndwnjiJa/nKAtJt9hkZFPTwNDujiZ/WX2r?=
 =?us-ascii?Q?exROfpXdRciCFacRGTMZFtFtwY2p+Jq4AMNZ0zgBZ6go1B7o1o14DrFeF+kF?=
 =?us-ascii?Q?ORcUkhPMpW7bi0nNAC+HlD31LptjhLXaHRgzKdOOOHvlcIqEYt5XXpvReote?=
 =?us-ascii?Q?O0F7SXVgNuMtFAJgCH2ptMVV4wKzehGOfkSCGGYIdZZV4mBrtzdOYP3BsSH/?=
 =?us-ascii?Q?1tlL2G0OXELT41NAb103ShLkAGSAycUi+EOrrJvPA8BjfgCk9aJwxV24S+J5?=
 =?us-ascii?Q?HulnzixuZgZ7klkyrJZGQXCBvIAAkh0MzewHLFT69KDOdI/mGLrjvF8cQmA9?=
 =?us-ascii?Q?tB6lw3yqGvH/UkZ4eI+tw/uRBI9h/F63EC0RaRE5llhs9pSB7vCR8NCsCJpG?=
 =?us-ascii?Q?8P3e6fqq8CiQumRSm3sogV/BxN8P4AkrwYTqAHpRI9XRWYpaS9c+f9zAXhoV?=
 =?us-ascii?Q?JjSueBUfFkwgZs8Z5HEQCe19+rnWq+NOnUi90Gju2BUudVyuLiu3hg96vEhC?=
 =?us-ascii?Q?Y84GJj9lTe2RygalDDC190CzkcGikN8SYYmEweCp0wQuv3PDqLFjqlDn/0Xp?=
 =?us-ascii?Q?JCLPmwM2RI7GkMlVLjy+HzdMA0e5uhnMrWaJiE7fo3Mksoru5WG2oYsLhlfE?=
 =?us-ascii?Q?Qq2QMODS73TSapV0pRUEYdMibs4+NZwEOI5G/IcUI6eEpnI/H+A+9EA2tuwu?=
 =?us-ascii?Q?OMQmDxxnpQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2a10f2-6e99-4471-c03d-08df33316225
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 07:18:50.4083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNwWA+Til8WBv7SwUrYd0Y/GYjrm3HwW4N89YAOs4adBIahgLritbpK9fpvrdGFjcVctW9km/83AStJuq8utIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7727
X-purgate-ID: tlsNG-ebf023/1792999171-52ECEB50-6CD23DD8/0/0
X-purgate-type: clean
X-purgate-size: 4060
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
index dc8bcbeea033..d1bfc1f23612 100644
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


