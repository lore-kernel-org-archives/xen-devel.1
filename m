Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44DACA5FA2
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 14:03:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436050.1654845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBx4-0003z1-3f; Mon, 28 Sep 2026 14:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436050.1654845; Mon, 28 Sep 2026 14:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBBx3-0003yp-WD; Mon, 28 Sep 2026 14:03:30 +0000
Received: by outflank-mailman (input) for mailman id 1436050;
 Mon, 28 Sep 2026 14:03:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xBBx1-0003Yh-RN
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 14:03:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBBx1-00Ak4S-7v
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:03:27 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba73ac-2eae-0a2a0a5409dd-0a2a4502a670-22
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:03:27 +0200
Received: from [52.101.43.15]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba73a8-6ca4-0a2a45020019-34652b0f35d3-5
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:03:26 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by MN2PR03MB4990.namprd03.prod.outlook.com (2603:10b6:208:1a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:03:25 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:03:24 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfc2OJ3c+ARAowpApO4EIaXK9kBs9OQZyd1z9STN3CKKYjdbVW7V8nMkUpYjCbHpUd2ivY5UhbEWzSlhXuA+PUXIJaHj97NjO8kLL/1CUVYgTfHIPf3p6F0bUca/ubn4etGfwn9b4ERcM9Jf+hk1yybHRiur9xmYToKJQopEtq3tgeD7w/3mCCa2BqTElP/NNzGYOWzCtMflZ9nWM3VmTzVCn0hTVUY45fd21tXKGZdh15eCxUzq0M4d5/QKIQvZzWi2TOHZL6uQBKHS2V2fb/EJJr50XOHPFrUPnQyjs6fJOWt3eV+8RU3D51gHWspnk/FwRGDZVlrq112Sr3CNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMJzt6L6bcJSEggHxrbpuzZCx1VItw2tCO771R6djyQ=;
 b=rRKYkyKNY6rPbppV7ZwQHnGMStuR0OO1bXljDPURcVp/4V/VeAcLGJUkc46kz7sBDHhlzypaep/NDUBHZGSpV2bPG09/0O+EU0u4WJMhatjKLRwBtXJDFvN1OP8+V3Yz9ESdmF8RhCarDLFV31m0Jh5oKcAq5lxz5pfe+ICx6OYG6/r3c1ZHj7cmT28/WLUcJnQ9GRQIcxQmdtlXfDwwpl6mfLSsAjXunCIjnR/uaPYG+Z/nQz1FSozeF7RyLReQ+TVjfrl/bg3Ook7Avpia5Q8VeckmvZLBaZj3Y2OPGbisG33NZQIUg9fsRbqMv6xuj+m2ZjyVQfgmPRZXmFURHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMJzt6L6bcJSEggHxrbpuzZCx1VItw2tCO771R6djyQ=;
 b=rOo1dSH/1K+rZ2qXuSXcWgKXbKReTpbtN7PJrA8NFz4tpxA0+/gjvCEHCcIK6t5eXPm428jQkzrBF5KRjmzXXqKXsgHHyhdGDG2eJoj0RFHeq7tQOXNi7Zo5hIksWp7CYVwdPOyVMQicb6ZkY9nzBAUO35pbfUm44q08kb78vUQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 5/5] x86/svm: Cleanup ns_hostflags type
Date: Mon, 28 Sep 2026 15:02:48 +0100
Message-ID: <20260928140248.1543013-6-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::19) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|MN2PR03MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 140e1309-68e4-4fe9-4564-08df1d694358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	FulitPI0Jw3g7GRWgUytITQch7iHRmVwAbcrlYwBERqH7S6HhgLqPdLZ2t5lcfqkTuP9MFRQl+54lONkhdQKqEQPoHDyo/NRCoBB0Q2bYWepLzRfp49gFTZD0K9hWcFuKik85CWrmAhLa2eqO59dOsXMfyDsa0ZBw1FUnoGJcuZWK8zOAkWCYxWZMHdvJSwFIYQ/kMOSFoCchYFhZrWXvQGdBgXFUXAExMb9tmRUjT94/LZppQNWmcOSDqDSlI4Lc/+IsLTCD/tIFVSiI5shCVplqe4pyvepq/3HtBrPjyPTOHfxyymLDAjUQU0PEfXYMrEhGD9RTY1eqTZc8RhCIqB20a0qYE/+mrTbUz56s86H5Fzvr2Rqh8rESvrqXE9Hm2AvA+YdRMaEM4iZV4uLCQ255ICq4EG5pBG2z6T+63/LTtXYVOsmWNCaPEPiqkU+9ehqsuIs+XUT0uXw2S08huZNwt1a0gh9QfGG5eYidb1lmG5W8l0tdzf5PnJuVb4Zx9KpsVsh/JjGC79hiVdB6hdKo7mijTdaxry3SI94zCygOMtLXlS+C4gwgaEhS/XUxG7Ja3AAGYcgL7G7Pmrz7uucrTjXJBkXPsmf1aKmZ2RsEiC34qGuLOQqL0BafObcICG7S6pwPBskBTp+2Bl9ApHVc1m6rVBKLMmBs5SVDvo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yT6+cpfYH5Ll6NlDeuV2sUiuhpURk3A56PxC79SNgLLS5M8wryzRS7GxljVb?=
 =?us-ascii?Q?ekJ+2wzdaiIWd8jEU6Ev8T09RP70rUEC7Zjwn9GQBpzQvlLtjh3kDwjUMj84?=
 =?us-ascii?Q?QbQLznreIi5mvxC0csJbEQ1Ag/DBKb996S0LVbqe1COBljF4qZiQaURmSzkk?=
 =?us-ascii?Q?ViHLa8Ca0/98EQB5scKwRzceay8Ak4uaW0/CRGkdLtplj61iZnM9XhiBzdCM?=
 =?us-ascii?Q?Fx9YfP6AnYFLiKIq8CwpVGhANwwUGiP2e8s/7qQaxvgO6CacWTWhj+qZCcU0?=
 =?us-ascii?Q?vjpD2gKyg79eGKsq1APhCjjykLSVVS5JsFFYEMPEiDoL1JPc5hTBJmO7vv5N?=
 =?us-ascii?Q?+FhJt4cgvZ4ct6O63HOVart2xk3poOJ7908WUDkDovgaentk6NL5XxXo0fTf?=
 =?us-ascii?Q?EmrRUPJD5ctPymXikVZM0dpUJjGBnOQ9hp8v+9Umt9lPbeg6ndGquhdS618m?=
 =?us-ascii?Q?K5082ik3RZvaaL/DLxR8ZckNG9nwIJ7+sun2hPcTShXyhqlzPjaKDY3DBYP7?=
 =?us-ascii?Q?wKJS8BnJ393aGWDYsE33YGk2LabCZ9I2tMmlOvnveG4MFu9QjcS5EQ2ZhrDb?=
 =?us-ascii?Q?0F/gpFxudiHPOI5ienK1PstensZ9m2Elv91ATRGBknCc50xiNTqQfa14k7V9?=
 =?us-ascii?Q?66nqiAUNO3duuKLZ20Uqs06gYbL18nvQk3PZ5A1pRW0eQuhrTn2kptkC5m/Q?=
 =?us-ascii?Q?4UZoKw9mne3IiZoYVQmcG/FNvf5g7Zt51oYPcki0RodxE0sNI2Qqwy/OjIdW?=
 =?us-ascii?Q?+KHWPr8mv/Ec3WyXQ9NWTS0huV7Je2mH4/QftAznnb0Pvi4VKx4mdDZDVwnL?=
 =?us-ascii?Q?xoSgn5tTiPbet3sADXcAPAOiwIA1yzIvNM9WEZxFD0kDGEx0YQFEqSijSRY/?=
 =?us-ascii?Q?NInju4KSn47mHSDWdVt4zDJ+FMOrOgOyFW9gTmg251TKVGBs/y52SRUIs/2G?=
 =?us-ascii?Q?MujtD8LH43qdlsVH2MfSEQLOeRP64CTdF1oSCaj75IND143BV6muCd+15K+O?=
 =?us-ascii?Q?4mHN4WbMq92mdr22C7s+l2LHKkR6HAAwMZvUZgYFDdvs3Lzt0el3X8pE6k+p?=
 =?us-ascii?Q?c2LyEz9ywT2x1/O6AIWQdng6Rw9vaPWDtkzCbqyur8tClGQJ8dzSSg3FOMuQ?=
 =?us-ascii?Q?OJYXHwIU67H5jdPSbPzL2R+DyWcnt67/ScNY/bUc5AVslEKgvdpkmEfsrbA8?=
 =?us-ascii?Q?GwoOcIgSNFfy4pE2kTyVC75sK1quDzaXgbtP2H8Wru7VLf+HmtDcYinmH0Gl?=
 =?us-ascii?Q?BEdnVATW6GvYuhFwQDyQ1brhu8Wt1cfyTD4iVq/FE+cZi7iC/WkmKqtsFQQT?=
 =?us-ascii?Q?Htjjx0tNYvMubPiB5jyDQDeaeLMCZkH/IORa3gJagnJ4443UKhbqF77YN0bq?=
 =?us-ascii?Q?YVOUPaDuKlHIeWBdr2nFFnjm/y7DZNq0pMuQ67+8ON/h5S5VL1xb6xipKw3G?=
 =?us-ascii?Q?bDSegw34GNRR/N1ZZfkjAzJ6tGOIf+wX0Ek0EEZWSsM4ufawiQNaMvoaNKDk?=
 =?us-ascii?Q?kGRVRD088U//KsGBor8hMHKTbfjxTRRisW6QKDIeh5N7V5l7Awaksx84jfXi?=
 =?us-ascii?Q?GbMKtnlG2EGjydS1IdgGipe3cF6V1T9cnddZqNu6dYkyaWGXD1QP9aYnjgMC?=
 =?us-ascii?Q?MORI/N+rtV+veIs4er6TpfcueJSpUCw0bgTNoiYI5C7Mts5/BAZnfo96PeCu?=
 =?us-ascii?Q?EQTzpsaAgOSWkddc6P9CgYFpFg0RMxbe5YRUdbqjfuPoG0WnwzvreVxTMrIA?=
 =?us-ascii?Q?5Dvr1F8rJ7EDiqQyg09A+kXELc+7xp4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140e1309-68e4-4fe9-4564-08df1d694358
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:03:24.9180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IDySgvMZxllyqX79yWY8kzWCJST82p+eQ9h7dTiu37aMAIEZzeLwQQmm+EzcCbELRNQR+3k0iV8SJJxUGFPLX9p6uvvUhdxkDJYW1IIh/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4990
X-purgate-ID: tlsNG-720697/1790604207-F06A72AC-4152460F/0/0
X-purgate-type: clean
X-purgate-size: 3125

Rearrange the union to drop the .fields infix, rename bytes to the more
common raw, and adjust types where appropriate. Adjust the users
accordingly.

No functional change intended.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c         | 12 ++++++------
 xen/arch/x86/include/asm/hvm/svm-types.h |  9 ++++-----
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 1ef4c5c83f16..47704d8ded80 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -151,7 +151,7 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     svm->ns_vmcb_guestcr3 = 0;
     svm->ns_vmcb_hostcr3 = 0;
     svm->ns_asid = 0;
-    svm->ns_hostflags.bytes = 0;
+    svm->ns_hostflags.raw = 0;
     svm->ns_vmexit.exitinfo1 = 0;
     svm->ns_vmexit.exitinfo2 = 0;
 
@@ -182,7 +182,7 @@ static int nsvm_vcpu_hostsave(struct vcpu *v, unsigned int inst_len)
     n1vmcb->_cr4 = v->arch.hvm.guest_cr[4];
 
     /* Remember the host interrupt flag */
-    svm->ns_hostflags.fields.rflagsif = !!(n1vmcb->rflags & X86_EFLAGS_IF);
+    svm->ns_hostflags.rflagsif = !!(n1vmcb->rflags & X86_EFLAGS_IF);
 
     return 0;
 }
@@ -651,7 +651,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     svm->ns_hap_enabled = vmcb_get_np(ns_vmcb);
 
     /* Remember the V_INTR_MASK in hostflags */
-    svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.intr_masking;
+    svm->ns_hostflags.vintrmask = !!ns_vmcb->_vintr.intr_masking;
 
     /* Save l1 guest state (= host state) */
     ret = nsvm_vcpu_hostsave(v, inst_len);
@@ -993,7 +993,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
 
     /* Virtual Interrupts */
     ns_vmcb->_vintr = n2vmcb->_vintr;
-    if ( !svm->ns_hostflags.fields.vintrmask )
+    if ( !svm->ns_hostflags.vintrmask )
         ns_vmcb->_vintr.intr_masking = 0;
 
     /* Interrupt state */
@@ -1174,8 +1174,8 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v)
     {
         struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
 
-        if ( svm->ns_hostflags.fields.vintrmask &&
-             !svm->ns_hostflags.fields.rflagsif )
+        if ( svm->ns_hostflags.vintrmask &&
+             !svm->ns_hostflags.rflagsif )
             return hvm_intblk_rflags_ie;
 
         /* when l1 guest passes its devices through to the l2 guest
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index beab9a3af203..71427b3c11d1 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -77,12 +77,11 @@ struct nestedsvm {
     } ns_vmexit;
 
     union {
-        uint32_t bytes;
         struct {
-            uint32_t rflagsif:1;
-            uint32_t vintrmask:1;
-            uint32_t reserved:30;
-        } fields;
+            bool rflagsif:1;
+            bool vintrmask:1;
+        };
+        uint32_t raw;
     } ns_hostflags;
 };
 
-- 
2.55.0


