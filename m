Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC51CA5FD4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 17:46:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438583.1657326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKrP-0005ar-GV; Thu, 01 Oct 2026 17:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438583.1657326; Thu, 01 Oct 2026 17:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCKrP-0005a0-AN; Thu, 01 Oct 2026 17:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1438583;
 Thu, 01 Oct 2026 17:46:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xCKrN-00052k-QP
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 17:46:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCKrN-009PVE-6q
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 19:46:21 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9c4d-8faa-0a2a0a5109dd-0a2a4508d8ea-48
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:46:21 +0200
Received: from [52.101.56.34]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6abe9c68-f659-0a2a45080019-34653822a43d-7
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 19:46:20 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV3PR03MB7658.namprd03.prod.outlook.com (2603:10b6:408:28d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 17:46:11 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 17:46:11 +0000
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
 b=pNANjimBmCqjVR2ymmRZtHfOIIrU7lWU4TKr9LwkMffbfWymlh5QCY85j4xwdiWltiFgyA2uAlwHn34461xc042ue/KE8FF9FzjcaW0Ea7TuCcBvjJQdeEJYt+MZgYTIAJY3l1SGVGlKyTxfSqTB4JjjI0Sb3yfe0fquVXxkRmQCf4zsAiObqhUspIX3CPX9/l9EZGQHx0lugXji1Jo3zej02KO8xwpUD0DCtRx9tFX2/355SpGa/5AWZ4fEx0ienw4ts5fkwdtpuLHp9nUFw3iJankxg+/fnLN6tVNdjgbQjaLA6f1Y2ibZpXJS7r9frHD3z4ud/rekPwaeNaUJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nikBxQbmFT/YhbgKKDRdnJ8hkPNwNqLqVDmA4JG0VDY=;
 b=uE0qOL4EYNEKl+2fcAF2rfJPNTt6WiP/NS+ySjIZhW3h5afy05rEk5rVrzxtI34kCeKd1TBOtV5dJHv55S1VA5hxeNsECl51d2+bQJp3JwGOF321Bu5jn6efSD4Ic5OlWLZQboH2WbczybXWfBkWhtXWNdMfOPzE3qT/Z1E084IET1d8i1dT0aVIO626i0Cx/xEVYCHbUoFK8WNVbdQPXAPM9EFtqiYUvK7OYB9B4ef/wV1QiPy8YgEi3Fkp/cULAtM0875aScOeAnBNi9U1b0cpQjVRqJkv+/HtIvTOFCuDoQIJtwMTwImlsRiuey241Ci7pboXhr0ggtPxkK/8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nikBxQbmFT/YhbgKKDRdnJ8hkPNwNqLqVDmA4JG0VDY=;
 b=q6dBWKBmGOgaFmPb/5SG1ocTN6Lp/HAB8IlfupwadHWY//jx8S+eI++DvT/Icrz8Vjczx5r4ruMlByOxnbbqiKOYLMamPe8SFlcfKVryc5XVrWmaAnvmaWIvdrH6qQMDgiNpcNeUZH/AFiHuJzNKLaNewBZ+SgAQ4/eVfqBuLPs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>,
	jgross@suse.com
Subject: [PATCH Linux v3 6/6] xen: Add new Xen pv-op pte_get_and_clear.
Date: Thu,  1 Oct 2026 18:47:49 +0100
Message-ID: <20261001174749.2275245-7-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261001174749.2275245-1-kevin.lampis@citrix.com>
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0163.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::6) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV3PR03MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a63f44e-03c6-4b51-f8e0-08df1fe3e1ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	044Kf+VW+GD9VNBsLwU29tz6oR9PKXQSt5oPd6wYhWEIn4QDDiqSJaUbzEUhw9Ze1PSzkpcKTvs+gdS/GGT59bW/mO6glg61ihfOTNJKhlmd5fSLNdk3VhnnVxLLEduIusm4uzpQ8IpY+b1dSxaxzhcvT3ORlQLH+s0thO+Fs2J4jSaXSSsMYY14AHrQSWvhH7Tw+CucOX5fOwx/8pisCdlQHPxH5gny5etA+xKdQF9Kmda+EZkSyMPlGIYDLnbKhr9QLFwbdedgPzVZC8kSrqrW/9PakZ7/6Vlv6i5YESsyfbeamMCuQhoAIzXnJ0re73V4c1KqfnmFayyZX/dmOeeErj6e8QELjLmMv6oOfz+PJ/1hU+7sjm7AzHCHGofpixQFeU/z3ptIk6wBEFpSvhX+tQj4JFs+QKZBLwlb81XGSfohui7h6a40aPIt0ydilfrk8vtDjsfXYzeOf/CT70WQoztd41KtvQjeruBqbAkXxikEM1T4SPG0aaw0bIOxzb8/KV8fEqweEajvr0xHXfQw3mpFVDrsDZHDVTl4Y8I/FvhI29LDSWaFicuYreynWUjgkb7GTMd49mT0lQX1uwkDy7A2oBcfTZbABDJe0a0psaFdV5dY4yCDKjiY6z15bNqWZGKXANQ2HBoJn8Hi6byzEvGycUc9KZ+6HZA8FAM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bBKgxkVrQqrItj/TywxRE2DB4sw/ztjUmioH5QDEo+yZRuDRqSOIORpEdS+/?=
 =?us-ascii?Q?2MN2LxmzEOMBsAeE9Qbxze37DCwbMkUVbvyhrJNfHn48/aYMuvpDE7+INsiU?=
 =?us-ascii?Q?aC7cd7+Gs4VMopW3NLHI1xE/3LaidSjZHM5iTwVL+D2MRFzc9tBU5uTATJNA?=
 =?us-ascii?Q?1G8ERnDyR+Dfpzye4TqgkohvXFYomJCzD+KsjqZV1Dqp0EgxpTbS5dZhkAjS?=
 =?us-ascii?Q?3NVKJxPYbLSlSwuyaOmQCW8LlnpgDPxZza+10Ztwkp/z51J8PbJ3LUnFb8d7?=
 =?us-ascii?Q?AKa7suEuNSNxlSthypDYioQQrFbRmimVNTnPlP/IuN+uk85ZBJMcbyzpwIq5?=
 =?us-ascii?Q?cbkl0dOqVOZA4uKfm9w/q5TJDIxTk4aSa9G/+NLII1RI1JdW32I6DIcq0yLR?=
 =?us-ascii?Q?a50TP7jLzh/89X+MZSL1RWDL17tWBny6PGyNEtj59KKs/rieff8iia0Udcbi?=
 =?us-ascii?Q?fTm3dxzUi/4PLr52M+6W4EjUCSEHcBsZJ7oj1PU7qoJl4A2vaGUMSbrC4UDi?=
 =?us-ascii?Q?9RyT0Ewa+iNYw4o0GRBLvX4gwideWY0I99Bqz24Ao5fS0tVRXidKkF1jDvwA?=
 =?us-ascii?Q?Q71L6PFJ3VfPA92vgi0RvWpPRGX57kSQVHwDUBix1eAUWtler4S9hRpxKzjY?=
 =?us-ascii?Q?px3cStumWiprgS6fAHJPAB/lT04JFW6OungLHKrUlFhHzyrGTZNn05hXoV7F?=
 =?us-ascii?Q?9czuHivKJZi97fS4OsggUYT0uPqPTVAPqqdTDiNsI/3LZ9gsOZMlSFlgymRx?=
 =?us-ascii?Q?7gOneoatwisOCPYXQvLxFjkq9lM0ZVz6KPeZoIDZnrTzfJLhhR6YAhslQFVw?=
 =?us-ascii?Q?8xCSzCmBnr9o/fF/3McDQ57ypQIqERZER0Upcpir2U5XtzbLJoU2mwHMBt0I?=
 =?us-ascii?Q?tJf9WIiVDildR2IJXnup8JY738yTNKAdGrtnNx5Xv9MBiOHW8ECdiQGMvRtv?=
 =?us-ascii?Q?b5ExfpuzEZup3TkC04n33TZoI4CAzIlPZsTo6ogWNCx9CWcPgQZKuoO2BZwd?=
 =?us-ascii?Q?HlyJO3Snkz3dbDsuqLPS7fAFZeeD1T5bMiboMAuTgVA4/gAhWl8qMvMknr2N?=
 =?us-ascii?Q?vi92QJ/mqDL/DP+aEV3sXSm/wOZ9txbnEgjX4qSm83K7+zzYBcWf5crVjqiF?=
 =?us-ascii?Q?pSnYHz7H/Kr0sVtpA9d1mBMlmc6DxZGCa+WWmLfdJ3ZB1tHH0fy5cIN1UhVy?=
 =?us-ascii?Q?jfGKnoPx4WltxTbKd7kv3uRgmGenglikn/DgFJadYGqWH6UuBNiy6IRv8pJS?=
 =?us-ascii?Q?aWfmVGdnxQeY8SpIyPVK7hbjyxy9c5tKTgp1DGIonDJwhiWBaOIAt9u7P4Ky?=
 =?us-ascii?Q?4oMswnABNxIo7FkLqS7b/5NZwP1Wg+5vNwfSdoQ8bKn5lQpfAeyTpw2ww5mD?=
 =?us-ascii?Q?LR9yxIcFY2MtvjhCtsnDTiae6aJyNRAE6KWsBkq86gn101qlZ20zGrft4T7k?=
 =?us-ascii?Q?4Tq/OMKi2+SkI0t3+391/V1r0Dno05glXIjdDzsXir9Qc63x2KJyAz1hvzNm?=
 =?us-ascii?Q?+prr++JG5GzEArPYKzF89rUOdHJmItfTFK7nwJIBp+UKNEIOD4OmGoukM9dA?=
 =?us-ascii?Q?bSxo4gb4NH3YYXdWk6Gt7pXg8OgcZVmP+SR62rVcEDEyeCA27Q096Qv+o/k5?=
 =?us-ascii?Q?QFBRI7M2ZO2zhL1I4L2sA0uXB0tvPKI8fN2wFBz713IgzIrFPFCEfC5B5Pui?=
 =?us-ascii?Q?R78ZaUKDnvhbVdaFLBa8q+YacrDrZQVLcq1r5ONW4pWRWgCjAvFbdDj5Hw07?=
 =?us-ascii?Q?+0Ps9/VuhQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a63f44e-03c6-4b51-f8e0-08df1fe3e1ba
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 17:46:11.5824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8jMIeS9VDPLN2mw5Puy9p25TsP2+khe0VFFdsO8RRxY8pE+ah2B8ev2XUkL5a/l7AYI5yYsbaBarfaMnIbRlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7658
X-purgate-ID: tlsNG-c1860d/1790876781-CF55C87B-D124DC65/0/0
X-purgate-type: clean
X-purgate-size: 5495

If Xen supports XENFEAT_mmu_pt_update_swap then for performance reasons
call mmu_update with the new MMU_PT_UPDATE_SWAP flag instead of
native_ptep_get_and_clear().

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
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


