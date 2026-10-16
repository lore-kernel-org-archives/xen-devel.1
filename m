Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A690CC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 16:46:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452431.1667270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHl4l-0006PV-22; Fri, 16 Oct 2026 16:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452431.1667270; Fri, 16 Oct 2026 16:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHl4k-0006Op-Ux; Fri, 16 Oct 2026 16:46:34 +0000
Received: by outflank-mailman (input) for mailman id 1452431;
 Fri, 16 Oct 2026 16:46:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xHl4j-00069n-PX
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:46:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHl4i-00994g-Vs
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 18:46:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6ad254cb-2eae-0a2a0a5409dd-0a2a4502a668-36
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:46:32 +0200
Received: from [52.101.61.1]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6ad254e6-6ca4-0a2a45020019-34653d019999-4
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:46:32 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SN4PR03MB989476.namprd03.prod.outlook.com (2603:10b6:806:219::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 16:46:27 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0522.016; Fri, 16 Oct 2026
 16:46:27 +0000
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
 b=tTHSpKd4ZELmeDnuLlLLsA6bI3gAbEfLZ8b4hl55Sbaue1AX/OyikiLqczF6OJHGhW4Cl8KJPovorHizJjF1efZLGYwd1LAquNn0cleEcWNQu0uxofQtz0d4ksWaP1n6lRnXmuCsnjiAS+2eOO63QpLNfRrifV9AikpgkMfR0QyTRpTV1NbGgPJHkH6z+cr9v+Aaq9nkw9Awe5o+YmbdOttC2HPDa/FL3sw1QBZVzBVx7NJzBzueapORTLyil8jFlEttqaMPEFhyFBCUJlOJyyFkt97yCsEpxFATMC49D4L5ObxWvkuyYyNjxbdgi8G66V4Yy/lVA2OVllDPkxUypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzJSH5d1PozqUsLrg++wK8/emMiRnK9WBI0v3qfVBns=;
 b=czb9d+gaCI8q0A6rwAvhayRubnnj4NtWVLyD8YqCQ7yCALriHZWoUIXDeuP4cLqkthwUeLyqGHF3DQhi62eYIYhZe3UijY0+LVDGgffWzA84oy31qQ4iqXdV/ixKVL/qON+0y9uKix7kAUMZqoqDIuanW5ewsoEG1EdBSf0NHeK4rDusz6SjFekwjkAPPUu5PfFxuRewTSEdrgjd5oVKy7Fa2FusK+0v1HFQLV2BaU5/fBEwJOSNQMKKGcPtHj9Y3HAiqinvaZ0t3TRV9P9QqvI3vAWFLaG6iPi9G5+nlHUcEFmbSlB6NGAVolp7Os+uZLcs0bjmNwoU2JvSC1O+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzJSH5d1PozqUsLrg++wK8/emMiRnK9WBI0v3qfVBns=;
 b=jM68RFw2WJ8WQJnOn7iEfdAlxqMIJU/l9RxXn+HWVD8cFp5geikaKEu8qahpm9ybUCvSFu6PLm4FO6cKV92DUPX7udrUtr6U3Mx0R8ByUodhiu4g7f65gnrLFZACnMBuCnnA7oiQBUs1gHmi58wVoocSGEtrNnHD3mJkK7/R8E4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>,
	jgross@suse.com
Subject: [PATCH Linux v4 5/5] xen: Add new Xen pv-op pte_get_and_clear
Date: Fri, 16 Oct 2026 17:48:15 +0100
Message-ID: <20261016164815.3109065-6-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261016164815.3109065-1-kevin.lampis@citrix.com>
References: <20261016164815.3109065-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::23) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SN4PR03MB989476:EE_
X-MS-Office365-Filtering-Correlation-Id: 063f5804-c64d-43f8-3a5e-08df2ba5058f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2YYDyTPdRdnujixve6mIkwXPBqmevpu4lflKxhELVIxXRCEMIdnXdnouB+q4Dv6yyhYHIAb5rjx2DLPB+bJiuCEeUGiSjNoMcFggquUCrdNoDJgY8cubUAD8E5nO5T2PXw0EWPMmSR3vGQbx1BDZm2jr/T+feYyK6jrCYicxWz1tZdrzWjSAE7JhIJje43GILkmr9WxWTM+YxT9Y8/TLRtEFAhA0KBFkIOCSxHJe0cWVbqikUMp1DLhAUGwrmLfWJga3L1fFLdBgsVL0byNsbtelRnPBZsQU28iZuiVEhpzl/+8Ad99lLZwzvhOcnH0uXFpcxKs1nDaYlBeZX4/OclCY2Fyn/3yw0G8fMHqxJtqiAXN0OUWJ8wy0HiYBCaZDdUZg3KwiROCuJa9jKhwSAc3piX7L8x3CywSlgUOIx4HKyUjskWcsh5qrsr0u1FIV7Z3OKT+FOFt9LCmssXQUCj7xagIoaVMptmNYKhQE31SaWigj+peSMvHu77rJvktRVrw12VY6N+6YsJrrYYp51hSm6QRwQWdZqEXNdA5fAvNGdeeUdcAgW6hpGk/kif2l3hphWZRRgXIwnjhZSQv0CyZfjERhbDbDya9PLiudzIIrPz5pusv0y4sdyGSzOTJk97mxXUpHkmqKqgZ/sviBHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u9qYSckP1SKjLstBDd7rj8X3mBgdEYVnfDKokHKmgKefPqAnOEMCsZfmWPBK?=
 =?us-ascii?Q?A+0q6VDCunVAEi7NRnyPxxljNjZzTCanpD4f/WdOyz+wX1dbel5GshxuGb8Z?=
 =?us-ascii?Q?SbsmLgnPusTFICO2PKsuMwSk9iBayungR6BLWrHGBO4eDGNRyjTv0ZAFm8On?=
 =?us-ascii?Q?fQZKK3/N9XSgcrlgWezEkOcAStTMs1YUTYewbN9c17a4h/4coJQy6mIyNgj1?=
 =?us-ascii?Q?5k0XYzgyInYQhN7+6dMpgwpwbHzmGg3xDHcOKcSnealPyH6lV+L77xO/lAaJ?=
 =?us-ascii?Q?fFx2Mbs8CSn2IVxAF6LiW69j4v0ZOsVERYZUsvntoHSkIYIVEvOhpgSc7euq?=
 =?us-ascii?Q?/Arjq+Z3pSpJ+3k3GuV/gmSBdHUNQexZXgd/N5Sm3ou5V8KWT6QKmnriQ7OZ?=
 =?us-ascii?Q?IMOnyKPF/0mUlunqFOQWIjjTcq6oze+9GJFviTbR/fxCAaxp3LfgWEppFfT/?=
 =?us-ascii?Q?rsojlPKPyfqOf40TkluExn63vll+Op5AJUt+3mWYd83nLY7ddX7iVG4m8jh9?=
 =?us-ascii?Q?iilx/CIMDqChN7wEmV2m6SJp14Tt+FlvzoMwxKOOormtjcSL5ktOxplHNYDA?=
 =?us-ascii?Q?mO/8vAdF2Bsk13tO/ORW6QLZtnQH/UVLNqktAxa2gQI7UGP79CccZLzilg69?=
 =?us-ascii?Q?KGZt00uekL2x0ESYJmL3XHCNyVNy2Hmxk8ZBJfKtcd1mysFr8PJaThYyNioQ?=
 =?us-ascii?Q?ushZOOeMO1DAgHbM6yd+qX2xHKJIWWd6AT84Qfbm/bgE3FgLzN97rW35XpVw?=
 =?us-ascii?Q?jczDt4crqOskFQD9G4x6x4G5eenC5x9+OUgIQ2EJJk5kCjcZbb5G4uncZbcA?=
 =?us-ascii?Q?l/U2+7ARH84FU6tf/ErDxgBf5GU5OM2JXiYYS9K4ERnzFz/UHA9Dy749VXy0?=
 =?us-ascii?Q?ZkUkYmHvUGihhi14PrcVV10Xf11C7OumViVK0d2MJzWJuUK5LL9Zf4Bp5LYM?=
 =?us-ascii?Q?EeXN+klVHmithNEn3/KFwASAIKCtjJNz2eEkki2S1AYZMsFRkyANlvoDjOf6?=
 =?us-ascii?Q?3T7y3gSzZNbtnDKMysaPTlDH5FTTRAP8y6Ml5J5zJVZxOshmv+za8AoJ8wgH?=
 =?us-ascii?Q?Y+No5NDtLPD20ueLfGBUfZSW+K8JItLtXtTZQESbDd1AUvU11j/F7E+OksOK?=
 =?us-ascii?Q?xtBCjRTk/dpOCAl5/ufPKNZO49ovek6gblv7YnzHW1Rqd9BMrcM+crgIwv84?=
 =?us-ascii?Q?GmavgyuIq6V/M15Cfmi79tvqcgVAeyMY+JlzucblWypvfE1ktYNjpmPjOaEd?=
 =?us-ascii?Q?bP1raOlunOPTWIDrCnAIYTqQE1QnOi/v5WVK1eQI83RrQnkZV9Q36yRS0DMB?=
 =?us-ascii?Q?0RQ+AyZAtzkW6t9Lg+qyY27xZ0NXzIXBxyUU3Ue6D0Ght1i4gxbeOw2rVErF?=
 =?us-ascii?Q?65bNeYgEe0+ienioOjh4ddtOcJjY3sRHMJyxOsipZzTuaj2ADRH3qYUYSHDJ?=
 =?us-ascii?Q?j9BwC9M8ehZT75yuotKGjaYhBE9yscklEsBRK/FogDhnM/O6aO/fk94qTCIi?=
 =?us-ascii?Q?BB4NcGD2XDtZ/1VmtrCrbOtWp7n4jVv8GXdOPKMVtREwRHRVutDByeJrk3fZ?=
 =?us-ascii?Q?mOjybuD0qvCzfXiqQecStkHlE47hRLPSB9pzsbg6FXgDvtu5C2wpTtGfxtlT?=
 =?us-ascii?Q?rxAnw9+VDeE1ZIZ8/1gbt8qJoZgpVuB+AA0c38E8BraM1P6q/Vaew6/zKo92?=
 =?us-ascii?Q?5MUV0mvxMVAlBSsi57tyHheRSq/IiYVyRmD2kzF6LD31okBgWRVfSXCtB0/v?=
 =?us-ascii?Q?9YlNfcgBfA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063f5804-c64d-43f8-3a5e-08df2ba5058f
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:46:27.3521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ic3y8ib3x4VjCCYRtMMKca3QGl7YReFkTMCooITUQmrMf9qOpOCo8HelDMaSyVKtpHHEh2t4Td6kUH/vKtp7dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB989476
X-purgate-ID: tlsNG-720697/1792169192-F0AA52AC-91CB55E0/0/0
X-purgate-type: clean
X-purgate-size: 5548

If Xen supports XENFEAT_mmu_pt_update_swap, use the new
MMU_PT_UPDATE_SWAP instead of native_ptep_get_and_clear(). This avoids
the pagetable write trapping for emulation.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v4:
- Reword the commit message

Changes in v3:
- Add spacing to xen_pte_get_and_clear
- BUG_ON if hypercall fails
- Remove extra blank line
- Add documentation for MMU_PT_UPDATE_SWAP

Changes in v2:
- New patch
---
 arch/x86/include/asm/paravirt.h       |  5 +++++
 arch/x86/include/asm/paravirt_types.h |  1 +
 arch/x86/include/asm/pgtable.h        |  3 ++-
 arch/x86/kernel/paravirt.c            |  1 +
 arch/x86/xen/mmu_pv.c                 | 17 +++++++++++++++++
 include/xen/interface/features.h      |  2 ++
 include/xen/interface/xen.h           |  1 +
 7 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 0591aa38fd85..0a3a286c46f0 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -373,6 +373,11 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 	PVOP_VCALL2(pv_ops, mmu.set_pmd, pmdp, native_pmd_val(pmd));
 }
 
+static inline pte_t pte_get_and_clear(pte_t *ptep)
+{
+	return (pte_t){PVOP_CALL1(pte_t, mmu.pte_get_and_clear, ptep)};
+}
+
 static inline pmd_t __pmd(pmdval_t val)
 {
 	return (pmd_t) { PVOP_ALT_CALLEE1(pmdval_t, pv_ops, mmu.make_pmd, val,
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index b4c4a23e77a1..1bd4c19450b5 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -135,6 +135,7 @@ struct pv_mmu_ops {
 	/* Pagetable manipulation functions */
 	void (*set_pte)(pte_t *ptep, pte_t pteval);
 	void (*set_pmd)(pmd_t *pmdp, pmd_t pmdval);
+	pte_t (*pte_get_and_clear)(pte_t *ptep);
 
 	pte_t (*ptep_modify_prot_start)(struct vm_area_struct *vma, unsigned long addr,
 					pte_t *ptep);
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index ac295ca6c92f..c2a7035b4848 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -58,6 +58,7 @@ extern pmdval_t early_pmd_flags;
 #include <asm/paravirt.h>
 #else  /* !CONFIG_PARAVIRT_XXL */
 #define set_pte(ptep, pte)		native_set_pte(ptep, pte)
+#define pte_get_and_clear(ptep)	native_ptep_get_and_clear(ptep)
 
 #define set_pte_atomic(ptep, pte)					\
 	native_set_pte_atomic(ptep, pte)
@@ -1243,7 +1244,7 @@ bool ptep_clear_flush_young(struct vm_area_struct *vma,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
-	pte_t pte = native_ptep_get_and_clear(ptep);
+	pte_t pte = pte_get_and_clear(ptep);
 	page_table_check_pte_clear(mm, addr, pte);
 	return pte;
 }
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 00b59d774389..58ecd12b10ee 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -178,6 +178,7 @@ struct paravirt_patch_template pv_ops = {
 
 	.mmu.set_pte		= native_set_pte,
 	.mmu.set_pmd		= native_set_pmd,
+	.mmu.pte_get_and_clear	= native_ptep_get_and_clear,
 
 	.mmu.ptep_modify_prot_start	= __ptep_modify_prot_start,
 	.mmu.ptep_modify_prot_commit	= __ptep_modify_prot_commit,
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 820af6f0aa57..a1e79672a408 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -359,6 +359,18 @@ static void xen_set_pte(pte_t *ptep, pte_t pteval)
 	__xen_set_pte(ptep, pteval);
 }
 
+static pte_t xen_pte_get_and_clear(pte_t *ptep)
+{
+	struct mmu_update u = {
+		.ptr = virt_to_machine(ptep).maddr | MMU_PT_UPDATE_SWAP,
+		.val = pte_val_ma(native_make_pte(0))
+	};
+
+	BUG_ON(HYPERVISOR_mmu_update(&u, 1, NULL, DOMID_SELF) != 0);
+
+	return native_make_pte(u.val);
+}
+
 static pte_t xen_ptep_modify_prot_start(struct vm_area_struct *vma,
 					unsigned long addr, pte_t *ptep)
 {
@@ -2165,6 +2177,11 @@ static void __init xen_post_allocator_init(void)
 	pv_ops.mmu.set_pud = xen_set_pud;
 	pv_ops.mmu.set_p4d = xen_set_p4d;
 
+	if (xen_feature(XENFEAT_mmu_pt_update_swap))
+		pv_ops.mmu.pte_get_and_clear = xen_pte_get_and_clear;
+	else
+		pv_ops.mmu.pte_get_and_clear = native_ptep_get_and_clear;
+
 	/* This will work as long as patching hasn't happened yet
 	   (which it hasn't) */
 	pv_ops.mmu.alloc_pte = xen_alloc_pte;
diff --git a/include/xen/interface/features.h b/include/xen/interface/features.h
index 53f760378e39..b346d58c0a41 100644
--- a/include/xen/interface/features.h
+++ b/include/xen/interface/features.h
@@ -97,6 +97,8 @@
 #define XENFEAT_not_direct_mapped         16
 #define XENFEAT_direct_mapped             17
 
+#define XENFEAT_mmu_pt_update_swap        21
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
diff --git a/include/xen/interface/xen.h b/include/xen/interface/xen.h
index 40c9793e9880..64c120d8a100 100644
--- a/include/xen/interface/xen.h
+++ b/include/xen/interface/xen.h
@@ -252,6 +252,7 @@
 #define MMU_MACHPHYS_UPDATE        1 /* ptr = MA of frame to modify entry for */
 #define MMU_PT_UPDATE_PRESERVE_AD  2 /* atomically: *ptr = val | (*ptr&(A|D)) */
 #define MMU_PT_UPDATE_NO_TRANSLATE 3 /* checked '*ptr = val'. ptr is MA.      */
+#define MMU_PT_UPDATE_SWAP         4 /* Update and return the old value. */
 
 /*
  * MMU EXTENDED OPERATIONS
-- 
2.52.0


