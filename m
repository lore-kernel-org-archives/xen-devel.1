Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D82606A321
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=KTNSY+DP
Received: from list by lists.xenproject.org with outflank-mailman.1485383.1688638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRc2-0007Lj-NB; Thu, 12 Nov 2026 10:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485383.1688638; Thu, 12 Nov 2026 10:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRc2-0007LT-H4; Thu, 12 Nov 2026 10:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1485383;
 Thu, 12 Nov 2026 10:00:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xRRc0-0006z0-P0
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:00:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRRc0-00Gm3C-4k
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:00:56 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e55-8faa-0a2a0a5109dd-0a2a4505b1cc-18
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:56 +0100
Received: from [52.101.193.11]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6af58e51-4cb1-0a2a45050019-3465c10b4789-8
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 11:00:55 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DS0PR03MB989595.namprd03.prod.outlook.com (2603:10b6:8:432::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 10:00:38 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0592.012; Thu, 12 Nov 2026
 10:00:38 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/1z2eNcJAwIGhGm5tiP8ZJ4ARD8LBMkACOMBtO240tZIo1dwEuV5XrgzmenKjcXLafOo6bTpiIV2D0PNnupR3dL2GIlMN8J7jeuk9wvB7dRcOZabdckT3w5MeZlkQOaXVN3lIfqBWabOFt8H93Lmvd3MwGOglotbb4Ygy6BqKdZYs9y38VPSK5bQ3NNloPQFah56fJpXT/uxD5qZWSf3R5Va1HU1HAhXZvp4jK2cHUECR+aP6kZCYLvd88JkalqHsr9LljSeFDsRkE9zpwvGVdx7WP/QeBzLAow3JKcU9/94yLlfwxfJjya0Ie5pTBu4jx0NizB7HEJrSOop59QPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JX8zdqrQzqqCOBaCwkEhimFb6xeOlZzfmVGw1Zk6Hjo=;
 b=fALUFyIjvWEMFoAXeSwFx//WJQBeCTQgNgKSRudet3WCfhAwTHboTJ5vRb28o1nAxYMfe/9paHQ0xtLwQ17GWwupPMDuNHbC8mopWgEXJYmjQ65+Izmjrd/0Ai3GTwDJCtw8D4XG9m8DpwOjIM3J7+4k9fofNG3cD979VOn0nHUB13CB6vJ+e3Y6rYGInCIk2I5IcfaLgQ5/5daUXmNiN5T7N94sOBDC+ktiX18+NiCoE6MW3VaSgyCyIy8gagntZgro7IeHlCmS27JwNonE7Fv1acbmwZxyOP1lcUiQVd/2hAyBHYhLbZNypOYgCZw4phnoOHAGcBYWaUBrtLp56A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX8zdqrQzqqCOBaCwkEhimFb6xeOlZzfmVGw1Zk6Hjo=;
 b=KTNSY+DPzP7jmpv9xXbi/xjzq/1BI1JoTx+927EwV4e+G0WvkXk+fU9vckDCAwLadLyzbFFfxn70U+T9+gYAf7qnw441FyY+zWJv0wZ2dpYIIOyLHdiNgyDm1917/0jFsDPtKWl9sz+HCVFJ4K0pDJc8jACLvGh63j60t2b51Cs=
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
Subject: [PATCH Linux v5 5/6] xen: Add new Xen pv-op pte_get_and_clear
Date: Thu, 12 Nov 2026 10:00:04 +0000
Message-ID: <20261112100005.324440-6-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261112100005.324440-1-kevin.lampis@citrix.com>
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::8) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DS0PR03MB989595:EE_
X-MS-Office365-Filtering-Correlation-Id: 78cf0b0d-b02a-4fb7-28b7-08df40a3cdcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261026121527099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Gn/SpKDofePLaDPSyjP62owV4H18fiwo/5pN3E+3kAoLJuKwyVI7DBMJoTE/im05GRi0UeOrzqrvRdiov7vfSHKHW7F6//R59JX5hzZ3LYjB8AcpUf22siXJHPFgmpzW6sMszkfcXfP5JQjmNRsz8SjJvyvvCFiZ2mudrdCzj9A5+hfxMTXGxmPbfB2xHnHDLv3ORWKDY/KW9acscn0Oc3h8qFSmXYS3I/4EDneRISdJQk4gKjYDO/LVyZ+K3xd8jkkMfTC8l+fr8qT5pArEv4ffH4lS8oxFAsBwsrxK9qtODi0Y8jMQG3+IPPu8A3c9RPRwH+S2Y0tETV6Ddk6eb0eQkNByfeIBeDF2ZP4qrD6DvXEk4jAcEtgZD9FmUPb/F+zDPDyrKQVaPM1IxxjqdbQc9lz4CvSFULb1axp12Dja4ar5xZT72ZH6V0V1kndmbb9GpCkRvwdPofgDkhJTjPBBEaXULsYxPgcykGMbSfEmrtK0NL/4jyq4wg+gyrGEKeiUVcfX+h8ewGQYaBhIHPCvaCEAw2qE5kMBNoD83u50rB+jvrIRyti9O5BZhQ7dLo2zUCxonq5YkMGy2ugzdzm6pVXmepTUnzR/gRUmhXtzkvFBeqRfxd7qjxuhP+5+UJxel/ndSRcCxguB5DNEOw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?no0s1TNg3MOvCTrlroveKcz3BtnZblMIKfjDQr+RnZLO1vxZucEczoHLsEEI?=
 =?us-ascii?Q?Pjrcvm1FJPOOeoNcbvZ9hRrcjsG/l5Jr5Owz4+7wXybjvQDZgiSxj6m0cmgD?=
 =?us-ascii?Q?mnwkkREe+G3qfGIM4tV/U6EVDTKs7MJXmtZA2zTNnsxhblMjNKzA8JHe13tl?=
 =?us-ascii?Q?tv+12yJVjvRr4J3j7ABlpr5aXtzEGOnzBi5swYELW+sL2fh1Q2mC9j69KHZ7?=
 =?us-ascii?Q?n1uxQ3p1LV4YpixOGaMU1LZFAQpZNSWfXP6Py0g39/tf1a6xP916N6rSq0m0?=
 =?us-ascii?Q?CHN9UamxSiLi0aRZWM4oh1KCTo+bA44UlhDG1bVfwNNRn9c00h5mJrIwjvvf?=
 =?us-ascii?Q?yrYHCjW/hJIckIIqEUYQuWDayD4CZQDxtkMFdAdsSlZWn8hzPXI17wiRuwqc?=
 =?us-ascii?Q?ISJBQ1glkuez6Qd9j4UYpqbTNZx581ZESFJrfJuajC7rVin67Qc/L2TvzMvC?=
 =?us-ascii?Q?BOo9ZcAtoAEl1mSRHAxw6dKEUqZ1N1kWIFxZl58eu0Uqoj5EKNb0O5WGoieM?=
 =?us-ascii?Q?7g4EDc2GThbEPEGWIwe8P91PixbHwnYXjd6zQFpvPfRCe0hfGn1e0vA0QJey?=
 =?us-ascii?Q?rxCpaSJAIJHyKQ7KikIYr1bGhasuZRYukiprEbOdpvwBjqZHoXwtI6zpIDh1?=
 =?us-ascii?Q?ut2V072kh7ky0hdHX8ifTt6v4ouOxS69GJBjJI4ods5mfdz1uLCm0hSNLVNK?=
 =?us-ascii?Q?85IfghIpLoPnAJE4MQW+kGMYvwvGKM2yt/40xwXQL5YaFLXrbhIbr66m4r0O?=
 =?us-ascii?Q?KTHzGO8xUnw8GsNBBADsZT4Og0RAiq3EwHJ6VB0JppdL7FDQLqKIO8qc98Fa?=
 =?us-ascii?Q?KNSb8TMCJGSu9WLtQ+3SRDJAuCYoqzNW7cVxInqM9MBtBVCZxttTRbjE+cao?=
 =?us-ascii?Q?clBtEgTVvNP8RLdzzMiPXMohA8Q4NH0TMoi+gzfr28BtOHetQH20kPMUajEI?=
 =?us-ascii?Q?HzeR3qmr4Q3XrNfkbsuAxwQ/TknciQSfhbiCW4DML1gYIClYf/wnpBJJwMJh?=
 =?us-ascii?Q?wUbhYB2dKftWmHbRN64eYguD9O8vqtTmbWe/s0oW2zlKNDfgz/HOacBwxmmz?=
 =?us-ascii?Q?zrUbI+2Ytp07TvmRlfwv/STHmiOUhcX5MrS95VcuIm9Xdv0bmCcsgbOcu+qo?=
 =?us-ascii?Q?6TwnpMvrNarOI3H8Fj9N9FOzn6g8fsrbJy9ez6m2JVUtLsowoBn28vH38eF8?=
 =?us-ascii?Q?tL547gR6NYnNx7Lnp7DErSORR7COHFVilq12QbWDJlTe4nBMYpOniMft0CVN?=
 =?us-ascii?Q?F+V1ermvgrPfqv22t4brcRKwk4ntGxl1K2zCC/jW8OWl4CG8G8q8ovGIPhLG?=
 =?us-ascii?Q?FF+RXa0FQS6XItve68BZsDN9vYMECXbmdPwovsskapp/AArKWcWlNX3cI3Un?=
 =?us-ascii?Q?KzUjcCijJozROCZgYvNMWmUa6etXBayOjNwAsWALjhZG/awGj6SkuaKVmvlw?=
 =?us-ascii?Q?13cd9k+TNIQ1CryMhPOqxDM3+r4dIxeHRW1ZOx+dSuclucZiTdKKFyukWp/o?=
 =?us-ascii?Q?tWIt3dv47zDT64CDTJO95ziImMDzt273HFgUySm6+iNa+bWgtC9ZsOqrFsRt?=
 =?us-ascii?Q?wD29xHfoVyf+0QaECu9cyACYfI4afaY3S+k+aFLfxD7vx37YdExHhNvaeua8?=
 =?us-ascii?Q?gg+cVLAv6xvrjhCFvDctPsDi/63ebn4rNVvnBxZ+6LoK9KbDyOI9jc8+RHSa?=
 =?us-ascii?Q?uIJGgX5khe4cm0WJG66ZCZqKsa3Lv2e4Z1mr5QDJuGzWFECZFpfWeUAXU8vL?=
 =?us-ascii?Q?JXur5pc2Qw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78cf0b0d-b02a-4fb7-28b7-08df40a3cdcc
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:00:38.7129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VuKTZ8/Wb+oUZSPrrRmUQiE6LlWei9jSopAgWN3twYpsfthNji0aztnvMnqu6pq5Bj9QaFR0273EvOVsXILUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989595
X-purgate-ID: tlsNG-c201ff/1794477656-732B32A1-E9E67B2A/0/0
X-purgate-type: clean
X-purgate-size: 5594
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If Xen supports XENFEAT_mmu_pt_update_swap, use the new
MMU_PT_UPDATE_SWAP instead of native_ptep_get_and_clear(). This avoids
the pagetable write trapping for emulation.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
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


