Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABBAC79FBB
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 20:30:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415376.1644857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lPF-0002SF-Pk; Thu, 10 Sep 2026 20:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415376.1644857; Thu, 10 Sep 2026 20:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4lPF-0002Ri-Mq; Thu, 10 Sep 2026 20:30:01 +0000
Received: by outflank-mailman (input) for mailman id 1415376;
 Thu, 10 Sep 2026 20:30:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x4lPE-0002HX-Hw
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:30:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4lPD-006SZZ-V3
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 22:29:59 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31345-2eae-0a2a0a5409dd-0a2a4505e0be-2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:59 +0200
Received: from [52.101.56.50]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aa31346-4cb1-0a2a45050019-34653832fc39-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 22:29:59 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by LV5PR03MB8433.namprd03.prod.outlook.com (2603:10b6:408:361::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:29:57 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%6]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:29:56 +0000
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
 b=bKC94Srzw1AoPGmqOdeXvkjWysVY6psH/MAZ5w6VE/uk8v71JBwdKupWB82daO67fFp5fzl9G6Rd0isclz78S+8wushKdTnlQs7s21jhL5oQH7pu1CalbAuE1CmEjySr55VOVNWZ5zTrouSgGRFysqHnCZtuk6y7lFwBKMGAmyMplqT2t93/UvpsZV4eUb6U0rMsjWdMTrLoO04M7Av0kLSPBmCcPekTMT8UuRnHi5iPf+x5WaljOtC4Ah/xJlZSPh90GooNfgT1xAKn/IveET4P436TlC1rGQ8Qdr2eEnzJEghG2kskiAR2X6kA4VUACwS8etB2goOfyedG2PfD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6mEgrZ/yEkYJ75Fx6a0pe4gKbItEtZTaCIBuU3TM7Y=;
 b=TZhtRmykXtvn24ouGzR9Z3wc3UJJ4FuQxQhM0cqq2Jqrc301FJofPxccCLEXrOktzVTE4x7+fKyrhocMrvnPxZsIL4HibJ002L69cZr3WPCP5tA3RJq8wnYMkl1npdxvwierZJ01912BSsiSqB4xXsuqggvDF/dy/3UxqNXMcCrVKoEfNC122XbSbP1Ix++vhFrjyTMyndHDb17+l7SRZtfZ+ahlfihVZ+JqrXbet9I29nSbLciiFsegfWC5c6XTFQyWx4ZNQqqeF9PfOodtg95Icv83xfNuWN0uXprQf6ulnjM1v8OcgPhIjLDkL5TQUq6P8pzpTmx65M4s0nNlgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6mEgrZ/yEkYJ75Fx6a0pe4gKbItEtZTaCIBuU3TM7Y=;
 b=K5yEjza8GjlIBEA/SrE9uU96P+xJramz64u/15yO4ZD6bJNGzApqHIXQy50vp2kKLca3nm5zkhH3Gw4BuFggAW3xZ/f9crrWRMjBi9dB13+ryMyZyWByxWY/B2Xn6OvRb4VApNkB7EDlwKScr9mDiF7JvA7X7woUzN8ovCyTrLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	teddy.astie@vates.tech,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH Linux v2 7/7] xen: Add new Xen pv-op pte_get_and_clear.
Date: Thu, 10 Sep 2026 21:31:13 +0100
Message-ID: <20260910203113.462943-8-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260910203113.462943-1-kevin.lampis@citrix.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0167.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::12) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|LV5PR03MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f17a03-2677-4f79-5783-08df0f7a4719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JyYQJywcx6klSWBpazNCp1YVKzzFszsL+sdFYMu7hfG2VREVt3n/5CBSMNLiG2N1ebySm+oklqtBB+3nQuQOo3ZCz7r9m/xlaPd8YHfiXc5sbBbm7KOmPxPfb6N4w+GXYJW4I6EgDF+jLQSBaZKyKzQV3DRcGrAz+MevwBuEZRwk01sajdPX3zjjbNDNiUhZIrdcVYiJu6M9VDhvIXB6wBeeeEOThwQ5fZFNsPQXXY5LM/SQB9ZvqL4CsE5FumLfhwXwawhsqheJZbM3RHtofWGTfKG0ZYqd5bq5YQy6FxydvmI6PyS8opLX6/fOtcuvOnYQpp3DI/G/K3p7w23HYayq02sk34PDBZk1J/z62Qi5svuQKUqJdCQ+VSx1vBYex6ZTirGh9Z6cbYhNuaiOQhNrM99+Hi2/BEZkvCCFMwSN1e12V0eGcNeauO+b1ys7QiIeceZKht2bBjA4jr/ZADyJaCfLclSReo6kfFg4ZcyhzfTp1JsGyscqu1Ai4Odfe8WfZgKV/69d0/k/5XIRxT6oNfkyfZUNFAb3+F6XzcGiq9r8CyuIIFfamRGgF2G70F9PnYZBkJ5SN3MTIo1SDL0ZD3HWQX+k9Xbh2Yoz9Y41D8U2rA5rQEknlAoGGH3FsTgDx6j/Vu3olK4PNaPJZ+eyYEbV5Liw2S8JUeKxiPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QN+w0xPzOQmcy9p3iq80TnBv4xbfJ6JMlhG9x7giPo3ID0oaA4cqpOX5C/lx?=
 =?us-ascii?Q?XdND49GTY98y8wZFMzY1LzxZ1Di60y8hN3XYggqMX7nAOTf10jGGxMGhk3xS?=
 =?us-ascii?Q?NsEW31hxEuyzEjUyNbSyEALvLyT8APKpeqmNoJpOXeSYeuaX4gvJS2xx6ZwW?=
 =?us-ascii?Q?xkRfgko6Pss4MhxFe5wQDS9f8CQZ6CvIxODIXo8zz3V4v281Vg6XPmeF4h+8?=
 =?us-ascii?Q?Fr5MPYaUi2OJFNk/xPrh9Fn+li/UnkH6Fx7IWLfyJgtaei6byf3LoQpZZEdu?=
 =?us-ascii?Q?r7uWeeYF+AkhvfqN8EQJH6jhneMXu07bbCOGa3szo6VMvu2lffv2/jNMNzYQ?=
 =?us-ascii?Q?HkA4zZmQSs+abAkcnD8sZRpZDQb1Vd+StCrY0/dsb3F8abC1fvjCVudEFTl5?=
 =?us-ascii?Q?WOs/fv9st+qWQgy6VfVy4QSwAp0k9ofd2IZ4VlXenO3Nn1vbyYzn0Z+viG78?=
 =?us-ascii?Q?h3PfF6IBDy+yZAzh3rdEMKgy/oq6xYTqnMca+yfC3oIFxYBK44Hn76VVYvJ4?=
 =?us-ascii?Q?Arh1KVoAUv518YcDNu9fxtv90kixjEzmSKM6AUpMPwopyQyGg7oCnSdmizEO?=
 =?us-ascii?Q?TxNO7WxdNtLT06M/pv//7Gh8AJMUFdzvLqsiBgYQUvkQuOGVF1yb6wkv5NYS?=
 =?us-ascii?Q?1nPF96QJcdukNAY0k9/ASoPnZg8Qbx7BT9+WcHcAPl3jghaQLe01fCfH4+z5?=
 =?us-ascii?Q?C4Fq1PNYqK/kgfGafKZH4vy5/IuDRUyXsuxeRshsbWY40QlUgWa2TlHzZlhM?=
 =?us-ascii?Q?TxYvE9UHLHUVmdnPX1DeJ5wBFcpyETcHmFDQiOWfVHrcR/u5LZqV00ar4SL/?=
 =?us-ascii?Q?p8RMItu3+NbRm5YWBZDLSsvLm+3fCyiXS0lG5CimVGtcnGKOLxdUksbT4R55?=
 =?us-ascii?Q?Z7zDFhPs56jHFmkd9OGvfaT3nhk1uQCpcBjxV1Jm1ZEmZdyM/XR0hTllpJlO?=
 =?us-ascii?Q?p8lZiGRT3vymwF9gIb4Mc6Vkcz+If8fKYa/2Wr7CbIq4q2dZdUMtNs1VCUSt?=
 =?us-ascii?Q?n1X8hzl1yzkFQJ9BforAqRUA2aMw8SgkNTKONzjO5IovNGVNPhQyM2PkiwuU?=
 =?us-ascii?Q?TPYUdVhgVhy2GGVsohXsYxkWjDu2akRQXzS0SrYAHTuMOJKk9J8LpnoA+yrs?=
 =?us-ascii?Q?3Ac3avEPBYPfz/z6HGXcj6dLnl9qjTBfRh/IMybF0UF/m2CmnV5fX44talwN?=
 =?us-ascii?Q?g0EqHjLHRS7cuaH+Wvo+ngE1WjhbfNKnMV+I+4cBwbI2t7V04k9WQnJKolnZ?=
 =?us-ascii?Q?F+qT6rMbY3dgIueUAgJ74FVYwqhsBat93TdaGR0ww+XbLv3wRlX1j9auQG5g?=
 =?us-ascii?Q?DU+1MnFFfObWkRUZjbRTw3R7B++cco2HJtVJAvE+PWfhuZYi22Jm5oIJ37ll?=
 =?us-ascii?Q?7e0/cXX+BQrja6JirUJikin+eZHBiwuc1ZdYib2e4qMVgQbKzWdOF2iZqRrD?=
 =?us-ascii?Q?GGIxsI2GgFjRuk6LDefnLckTfroTYkW6ANQIbHXYwFqGfCo7UJCK3F3wGtN4?=
 =?us-ascii?Q?emWbbym2vLJnJU2jFbG9AL1XqoCeHwhPWb9bWgHnHgto+VbXZJwnDpT6Z56o?=
 =?us-ascii?Q?fwC5RKuEQF/s4vng0A2mSt0+sJtAsRMlnCOMWZegSnDsEUwmrW+5a2/pTv5u?=
 =?us-ascii?Q?/DiHgY9pwVSm/1bOu4REPUBr/rZu1NQIjrrMntLfbsOBXlZtqwMFyC1LsDgx?=
 =?us-ascii?Q?vUlJ3rjEyvlAF6hLHS8v9xN3DM654ckHBpfAchozbxr0BZv64sOGWWpM5KC+?=
 =?us-ascii?Q?6J9wMyHRJg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f17a03-2677-4f79-5783-08df0f7a4719
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:29:56.4005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaeDvIkq3oKEf2HJxq5+1hS3uGcvuSnSJfJQPgEwCkJfpbfI3XxGzoAVKv5RnAS1rGy4bSJrOZV2jHlrM1QdiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8433
X-purgate-ID: tlsNG-c201ff/1789072199-F56AD2A1-959B29AF/0/0
X-purgate-type: clean
X-purgate-size: 5273

If Xen supports XENFEAT_mmu_pt_update_swap then for performance reasons
call mmu_update with the new MMU_PT_UPDATE_SWAP flag instead of
native_ptep_get_and_clear().

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- New patch
---
 arch/x86/include/asm/paravirt.h       |  5 +++++
 arch/x86/include/asm/paravirt_types.h |  1 +
 arch/x86/include/asm/pgtable.h        |  3 ++-
 arch/x86/kernel/paravirt.c            |  1 +
 arch/x86/xen/mmu_pv.c                 | 15 +++++++++++++++
 include/xen/interface/features.h      |  2 ++
 include/xen/interface/xen.h           |  1 +
 7 files changed, 27 insertions(+), 1 deletion(-)

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
index ac295ca6c92f..b0d7d6520984 100644
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
++	pte_t pte = pte_get_and_clear(ptep);
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
index 820af6f0aa57..7ce2feab6434 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -359,6 +359,15 @@ static void xen_set_pte(pte_t *ptep, pte_t pteval)
 	__xen_set_pte(ptep, pteval);
 }
 
+static pte_t xen_pte_get_and_clear(pte_t *ptep)
+{
+	struct mmu_update u;
+	u.ptr = virt_to_machine(ptep).maddr | MMU_PT_UPDATE_SWAP;
+	u.val = pte_val_ma(native_make_pte(0));
+	HYPERVISOR_mmu_update(&u, 1, NULL, DOMID_SELF);
+	return native_make_pte(u.val);
+}
+
 static pte_t xen_ptep_modify_prot_start(struct vm_area_struct *vma,
 					unsigned long addr, pte_t *ptep)
 {
@@ -2165,6 +2174,12 @@ static void __init xen_post_allocator_init(void)
 	pv_ops.mmu.set_pud = xen_set_pud;
 	pv_ops.mmu.set_p4d = xen_set_p4d;
 
+	if (xen_feature(XENFEAT_mmu_pt_update_swap))
+		pv_ops.mmu.pte_get_and_clear = xen_pte_get_and_clear;
+	else
+		pv_ops.mmu.pte_get_and_clear = native_ptep_get_and_clear;
+
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
index 40c9793e9880..92f972e53323 100644
--- a/include/xen/interface/xen.h
+++ b/include/xen/interface/xen.h
@@ -252,6 +252,7 @@
 #define MMU_MACHPHYS_UPDATE        1 /* ptr = MA of frame to modify entry for */
 #define MMU_PT_UPDATE_PRESERVE_AD  2 /* atomically: *ptr = val | (*ptr&(A|D)) */
 #define MMU_PT_UPDATE_NO_TRANSLATE 3 /* checked '*ptr = val'. ptr is MA.      */
+#define MMU_PT_UPDATE_SWAP         4
 
 /*
  * MMU EXTENDED OPERATIONS
-- 
2.52.0


