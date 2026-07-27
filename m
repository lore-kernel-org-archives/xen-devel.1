Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B866DC531FC
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 15:05:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371726.1619226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woMtT-0004iF-BN; Mon, 27 Jul 2026 15:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371726.1619226; Mon, 27 Jul 2026 15:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woMtT-0004i8-8G; Mon, 27 Jul 2026 15:05:27 +0000
Received: by outflank-mailman (input) for mailman id 1371726;
 Mon, 27 Jul 2026 15:05:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1woMtR-0004ej-5H
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 15:05:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woMtQ-0007gq-Hr
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 17:05:24 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a6773b1-bab6-0a2a0a5309dd-0a2a45099ac8-6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:05:24 +0200
Received: from [52.101.48.8]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6a6773b1-be1a-0a2a45090019-34653008bc71-4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:05:23 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SA3PR03MB8182.namprd03.prod.outlook.com (2603:10b6:806:465::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 27 Jul
 2026 15:05:19 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 15:05:19 +0000
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
 b=bagaMyk3/tc1uanchugvAElI5+0lYM2n/edTxQsDtAW0exAagpCWDRF9bwH85fTSBb/92uE8zTh+xiIrO+HCa4oQ1fGCSw682+ufakIsk64l+yGv86wF/6T9ZLj0dQtp43uPBzci13l1FjRTTAKXlcNBeM3gzfUkQqj2pQ38Foippqtv0ufeG9EF3B14mP8jQoGZzsiQNaJ23xOg6AD8+ZsSQy0MnOXcUzAfUpFDZDDbHlsisV1gp7MZMuxa1G1gFeZf9ZQ3LDI9zdAXrwoRuG/0dFDd9FvEcSUKvDCklJfAYcnaPDlrAtPbLBw6Gh9qJMGjk4pq90lcOPBSFQMPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujfQculv3wHfFyekrZ5tWOrthojOAbuyk/54bXUGct4=;
 b=RGoDZDx3ikcs5wm77zia7brzx6sQ8wcD18HI9QZlaoUAkFiG4vLrT374sVtYXRggMNj3v9/jDFUHcZzGfzQ8Mvw7JYYElO1i11tv0bjsnQY1sG8RYzLyIcykJ/V6/LPg1wAe6P30AjnBFI/DjEeFE9of6uivXvb+KiSXYr5Ns3TcGuOU7zjz41GWbAHxv9GKSYdBlTF9wnVkX46k5igvc29cv+6XWGlWplGtDD7uTSwv9WfOl9untPfGuLRQltIoQDGrgOQWr4XXIjMnhfKEo0ectIhdnHWDBp+hldXe486UEYceWdFhUlyq692VFW3/bBxirGJSeGZKmCOysvjviA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujfQculv3wHfFyekrZ5tWOrthojOAbuyk/54bXUGct4=;
 b=nA8TbS+M5zVDtVgljFnXdmsxKb57AonEJqplL5ZJcbjZt3gzIJgnPihkoFg4JMM1yqse4adfSPVu+MyUg5eeIgd/QKQtSznuVAyRy8BTYXQpZfpg5wAVx2AV1klwMRfz8H3g4MhgXUG+DGgiIO/0933ArAgZ0LJdTbpDAYjdyVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 4/4] x86: add new pte_get_and_clear hypercall
Date: Mon, 27 Jul 2026 16:06:15 +0100
Message-ID: <20260727150615.1373200-5-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260727150615.1373200-1-kevin.lampis@citrix.com>
References: <20260727150615.1373200-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0576.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::23) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SA3PR03MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbd3f07-383e-4a26-3678-08deebf07907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|56012099006|11063799006|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	oSKSOAwFZLLKaLKdryqMteqUGUHxX6rfKwmR7Q8fALr9NsnUwCnO+WkAAdsrUVFgcnAGR1QEedC7q8T77pPYzIW29PHED5ah5dLDveXn6byLYYMs8qNiCUDYXYwDGSpV/K/enQGSBX+wqky3bmUQmeMbv9sybzILrnt2Rs20VYYuWmfukuarN0Iwbi/AmfP7gU2Y/QEt5Fq7GS0fh0/8GEvi5VLBzLZKcf+THh/k24tJpz0GzwtnsjttOYygFHHfdI5+mI58bR/eFHgrqQCMo/MwFOUPJ0MkfD/9HbPnSHlisLAFRi9kJl4EiY2GPc8k5FkFnaKR0Y4hL7/cqqeEV4HVrQIttiYRYnqyUtGZ1XFJ3BPg20djEOq09igSLtXJQAMDQxhgo8ZISg+72L9kCc4O3aLEvFtsr8Fwo6TT0dKiKJOlb+u4Ldzypz+ejE/Lo4bnmm1m3ltWyzekaZy4UzE9Ynm67TmgSWnPMT6OL1sbZzjBb/Fl+WFADYbxXL26JP6kg/4xm8s90L7phf5+vwaKzFKZNemX7K1R+qJ7BUMfx32Yc3SiumQT9n2qSGmozNOyvUug4F0HgR552gk3ek/SvPuT4YymVX1RE+O5/XitWlss1SPnoj5ZdU8kPz2JfqwStc3TvXjiRV4qNI4cXvaWcXier2HPqfGyXmzPF8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(56012099006)(11063799006)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CYYxcZYZwWapWm7MOu9/X9N88orSBcs7+2aYM97kRsEpsewtwnyQA4WJnfNf?=
 =?us-ascii?Q?Mtss54AviFlb6h46MiZGbDu2ZNDwgljpjNgVz37TalQ2oXKYJcWrVg7Arx37?=
 =?us-ascii?Q?ef+Z3UOpiYnSOg0Tsdp4mg8T32kas0+xDfe01cSJLx5BEBD+0AjKx/txEU4u?=
 =?us-ascii?Q?5henOVebrDE8+vd6evVJzKee1FmMTxq5B31J6MYjlnLiqdz82aClZcWguFys?=
 =?us-ascii?Q?W8rKBaaZCNkcurOjT5QYVP/4NJmHrNcVX+vRDscN7wczIcNEEgyr4vf76PF6?=
 =?us-ascii?Q?RrLZ4TBYD9jP5Y7aX2WbLyaxt58LAb2PqBXUwUgBZ71Ul/zHGBLkskkCQ7Dv?=
 =?us-ascii?Q?znOZV1HnWU6q2OTFVx4wrtZTvTOJqFzGZpOJqlG1QK7qajlw93IAtcz3bKnn?=
 =?us-ascii?Q?YkdM+q6dZ/WnHbLItAjI0vK9xyMwHDPQTQ54agnVU+dGg03S/96Sq5SJZUb2?=
 =?us-ascii?Q?ISqcnRXEtrOj3UEaA170OsW6i4Wwt8fhN5a3HzwX7UasdQY0n6OigT4ykEu9?=
 =?us-ascii?Q?dYwh+8ooFhTFLNp2lwhfXFhlpJ5AxR7qu5CIeGytFk8hNGi6aM6AFSoJ8fz4?=
 =?us-ascii?Q?/FdZGYwAbWkP4Kmxl58g+lTi7WvZY4RAupzy9aTvnbP4xykhN1HS4yNzN6Ze?=
 =?us-ascii?Q?kbz57INWKLT4lIrPKkvDtljWhCRX/vMQfT+S/h0aTk2jGS30mf1aJpuHQYt6?=
 =?us-ascii?Q?1jU4PVUdjpY8v8IAYUSZMg6xmxit5j9HDhJe5Kj6WxPQnv4jXPxDVRRntvZf?=
 =?us-ascii?Q?FhqXt0nAqco0Sd/Y+d3tRiymm8RcgxRqVEWkupyUImQ3r1egAp0JiW3s3lp6?=
 =?us-ascii?Q?D7JfVKYocI/y5/svf67Vki40J0ttcpJtwKIwm6gltLcyuFzU83upAFn/pfeo?=
 =?us-ascii?Q?45dEl4P+TKh8T3qByQewe/wx4iMCHRoIKg5FXpYGVRERSCTCuUIEXv6kGE8F?=
 =?us-ascii?Q?PzbNNlN26Rwv78f62IBlxDfWm4U9oB84ui0LcDbfuDV+9XMv6i7gZMOYQQIx?=
 =?us-ascii?Q?wFkmX1a91I32p+KzQsi//R7kJ5RZ/unl3eWnsN7+SPYuIFot0zyc//cNfgUz?=
 =?us-ascii?Q?xTclYS3nRJhAQ/+B6afS+q6yPj9b2Y9jYDd6g9PZ/YBsEIIUm+D4zSI2DY2X?=
 =?us-ascii?Q?AHXNuuvYynYQMzXAJm6NRx9i9g4R1VJLndTTOGr20RPZ5RpqSVl2I4TsYjEp?=
 =?us-ascii?Q?5nbFTPJVgNUObpr9IDeMSx19AnZwNNa962C/JqjfDDmXGrHL9fPXMMCbW0zl?=
 =?us-ascii?Q?pOztliLPAeO2lKFSdi0NscvzTGQZP/hLjaUeJDN/0X0bP3FSmjxp8FvyKFDp?=
 =?us-ascii?Q?noI9QUtbar4p57BhQLbAJj2FxLwt4Uhfy2CMB/swuLcj1qgabDm0qR0Zd1qa?=
 =?us-ascii?Q?aFyA0bz9+CzlkcQqPXR/KMBYlMZ2nBknWQUM7QIgooxS2XPgH51NqkLmqLjP?=
 =?us-ascii?Q?7sbJbbpoDC4RU0+EasEqFLA8SjXhbJ9mcg0pW1KAPCCiKT1sVirK0I1ClJXi?=
 =?us-ascii?Q?7zIozmBIlyB9RPWqKdAkSmUpJMMSZo+1jYpspKt7FoDLkDNOHdAVW1DxAyVW?=
 =?us-ascii?Q?KHoryqgi1Jp3ZKlDLFWe9tnIHmRSfAYzvnJpUExFf3Gotz5MzFrv+M4oXuH7?=
 =?us-ascii?Q?ZwytHg5Vu8hT2lSLx8czVaA2vNh6q6qTnkDtVhEBh4x6Rdfd1i6xuuMXScIy?=
 =?us-ascii?Q?Rf/tDyi0ef7NGJdBgCfiHPpC9IP+s+TZVOVzjgNVXH26xTnVNHua5h3anw78?=
 =?us-ascii?Q?oAqVmX9vWQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbd3f07-383e-4a26-3678-08deebf07907
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:05:18.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7Y04Od7Kd3YQuMtUXJUGKr7uuoRGE4twA5a4uxZ7WNh9Y03QVrjhCRLYt2+Q3Gx81iGy+3EIkUMg6eXwypzaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8182
X-purgate-ID: tlsNG-bad1c0/1785164723-3A8D9034-D49B0814/0/0
X-purgate-type: clean
X-purgate-size: 4655

This new hypercall uses the same interface as the mmu_update hypercall except
the old PTE value is returned in the mmu_update_t->val field.

The purpose of this new hypercall is to improve performance over the current
trap and emulate behavior. Only l1 PTEs are supported because they have the
biggest performance impact.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
 xen/arch/x86/mm.c            | 24 +++++++++++++++++-------
 xen/include/hypercall-defs.c |  2 ++
 xen/include/public/xen.h     |  1 +
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 278b992aca5c..e5fdfc66081a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3993,6 +3993,7 @@ static long __do_mmu_update(
     unsigned int count,
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
     unsigned int foreigndom,
+    unsigned int op,
     bool write_back_old)
 {
     struct mmu_update req;
@@ -4013,8 +4014,7 @@ static long __do_mmu_update(
     {
         if ( likely(rc == -ERESTART) )
             rc = hypercall_create_continuation(
-                     __HYPERVISOR_mmu_update, "hihi", ureqs, count, pdone,
-                     foreigndom);
+                     op, "hihi", ureqs, count, pdone, foreigndom);
         return rc;
     }
 
@@ -4316,8 +4316,8 @@ static long __do_mmu_update(
 
     if ( rc == -ERESTART )
         rc = hypercall_create_continuation(
-            __HYPERVISOR_mmu_update, "hihi",
-            ureqs, (count - i) | MMU_UPDATE_PREEMPTED, pdone, foreigndom);
+            op, "hihi", ureqs, (count - i) | MMU_UPDATE_PREEMPTED,
+            pdone, foreigndom);
     else if ( curr->arch.old_guest_table )
     {
         XEN_GUEST_HANDLE_PARAM(void) null;
@@ -4330,8 +4330,7 @@ static long __do_mmu_update(
          * on the fact that this argument isn't needed anymore.
          */
         rc = hypercall_create_continuation(
-                __HYPERVISOR_mmu_update, "hihi", null,
-                MMU_UPDATE_PREEMPTED, null, rc);
+                op, "hihi", null, MMU_UPDATE_PREEMPTED, null, rc);
     }
 
     put_pg_owner(pg_owner);
@@ -4417,7 +4416,18 @@ long do_mmu_update(
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
     unsigned int foreigndom)
 {
-    return __do_mmu_update(ureqs, count, pdone, foreigndom, false);
+    return __do_mmu_update(ureqs, count, pdone, foreigndom,
+                           __HYPERVISOR_mmu_update, false);
+}
+
+long do_pte_get_and_clear(
+    XEN_GUEST_HANDLE_PARAM(mmu_update_t) ureqs,
+    unsigned int count,
+    XEN_GUEST_HANDLE_PARAM(uint) pdone,
+    unsigned int foreigndom)
+{
+    return __do_mmu_update(ureqs, count, pdone, foreigndom,
+                           __HYPERVISOR_pte_get_and_clear, true);
 }
 
 #endif /* CONFIG_PV */
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index a625d634b694..0552e93ab560 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -174,6 +174,7 @@ multicall(multicall_entry_t *call_list, unsigned long nr_calls)
 #ifdef CONFIG_PV
 mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
 mmu_update(mmu_update_t *ureqs, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
+pte_get_and_clear(mmu_update_t *ureqs, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
 stack_switch(unsigned long ss, unsigned long esp)
 fpu_taskswitch(int set)
 set_debugreg(int reg, unsigned long value)
@@ -232,6 +233,7 @@ caller: arm
 table:                             pv32     pv64     hvm32    hvm64    arm
 set_trap_table                     compat   do       -        -        -
 mmu_update                         do:1     do:1     -        -        -
+pte_get_and_clear                  do:1     do:1     -        -        -
 set_gdt                            compat   do       -        -        -
 stack_switch                       do:2     do:2     -        -        -
 set_callbacks                      compat   do       -        -        -
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 2149b8dd3808..9e2ba0107d3b 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -118,6 +118,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define __HYPERVISOR_xenpmu_op            40
 #define __HYPERVISOR_dm_op                41
 #define __HYPERVISOR_hypfs_op             42
+#define __HYPERVISOR_pte_get_and_clear    43
 
 /* Architecture-specific hypercall definitions. */
 #define __HYPERVISOR_arch_0               48
-- 
2.52.0


