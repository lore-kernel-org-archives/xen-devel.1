Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5158606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PKcpFVCw
Received: from list by lists.xenproject.org with outflank-mailman.1455934.1669555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAvs-00021w-7P; Tue, 20 Oct 2026 14:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455934.1669555; Tue, 20 Oct 2026 14:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAvs-00021p-4l; Tue, 20 Oct 2026 14:35:16 +0000
Received: by outflank-mailman (input) for mailman id 1455934;
 Tue, 20 Oct 2026 14:35:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xJAvq-00021h-Dc
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 14:35:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJAvp-005O5Y-JN
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 16:35:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ad77c1c-2eae-0a2a0a5409dd-0a2a450cd988-18
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 16:35:13 +0200
Received: from [52.101.52.7]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ad77c1f-f479-0a2a450c0019-34653407dc8b-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 16:35:12 +0200
Received: from BY3PR04CA0006.namprd04.prod.outlook.com (2603:10b6:a03:217::11)
 by SA1PR12MB8096.namprd12.prod.outlook.com (2603:10b6:806:326::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 14:35:09 +0000
Received: from SJ1PEPF000037AB.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::5b) by BY3PR04CA0006.outlook.office365.com
 (2603:10b6:a03:217::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 14:35:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037AB.mail.protection.outlook.com (10.167.244.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 14:35:08 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 09:35:06 -0500
Received: from APPOL-18KY0J4.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 20 Oct 2026 09:35:04 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEsPRQfvUR6NPzDnLv7lRIxiXR9UgSFlt79+5YKAGzv938lj+dEfeohUZ2dLiGRNuDSLFP6dqJKRTyUdDs3Z2Ulcr02wS/OgjTTw9xKG0UdgGA+jSz5UCck9KjTG21kul71GspF+RJLytuz9Cs0t+4e62E5YyXSqS8yflJcOkTpujfhhFbml9E0TG9uVg8tv2waim3zXwrnCF1Xr9aijNENkZ0DsNNG8NHSsBHHOpUwCOWDXoXLbABJJxks6hwvAQ2wRcLcmTrD3KZ5PPEfle39fhm8loq3yvbm/B1IwRsrbtiQz38H7AxUTMwRxRXKPv2GktF6yGubecczsfw67DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ3EkhLGGbupSOcpyXTTmgfore2DDfsMhPuaVmmgq0g=;
 b=TNGK0gLKSQET1EMAx9UnX93tdi5Cn2WVuBGD+otGutzKhsEGwY5KSkE5XHPWR2eKnHGdWZTbwEgIZXpWNGfbaFPq77QF5zle52Mgee+TqRkg0g46yLD/ENxCE9yRYqOdXoyg/l6Z97cfNABgUydwSclGZTGLUFdoOm/QpcJIiDzGe7EHePuisQWhHvzBhbitHGZZT68q5v5aJjmM7p18lJwvTvaZart22pYb2MkSqm02b1FXKYOzpdYNsQrxf79ojGvLI0yKqzef6nGe8ccolAbmyXw7LYDeqfcB+WByFeypnaKsluisYneH1RgQJipS1FGTKNdbgq11DWVsCjz9+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ3EkhLGGbupSOcpyXTTmgfore2DDfsMhPuaVmmgq0g=;
 b=PKcpFVCw686K2dbsrSVJGT1pkji55Cn0WoH7DiyAWTnENLVKStDWeXBE2tgv51KqObq3wfMAUPiJ0c0NhZjC2eC0YFg6SaKuH14quA8ILoCHM2fmdEC0ZkpBqLqFJor++6ZfbR0YWW+HsFcUvCMVLU5zhU9i55s4RQ/LC8RBRzk=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Don't create useless P2M pool for a hardware domain
Date: Tue, 20 Oct 2026 16:34:58 +0200
Message-ID: <20261020143458.194784-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AB:EE_|SA1PR12MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f3cc76-3e4d-47b8-93db-08df2eb75732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|5023799004|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xqRU61ssPLbbmTghZii2CbVifieVb2rQczk3ofLNf6s/dJxL/Pr6VtqknXQIg6OgcPNxfP29vfLQIggyKX/Xv0y1I+WTmxCmHVOtnPsZYF3Tto5OqEjeii6C3z36fzSebDyO8WcWANLW8dYTiF6bTIZRkVQUXZvVwaNova1i7Ipo0QZ/oxudq8et69NP/OKMmv7m1l8e5gOdcZEaYWdazrdBOl5fRPP9Susc9R2GyJ+ajOzyXNkzELUMGquHgvnNVQgrwcs5AXSXkFTHUrEmBEDAxMA6C9iVMd3ITBJSK20nI7YyFCI+U+DQigqm5gy56W1ucRXtONK0H7Z1e1O+7F9dy1t/DYJi0m2z4n7c10oT0A/rS5nolIBFYYgC6LBugLc6Z54lZmGJ+GaVZUvyZ/qD71VxWbYdUbpXiP7t/E8v8ngmoXe3cVBvT3W9OfMq1Mtuxa5jz+qHrUs06NDvDDSz4lPg5P5AjZbbZqX7yak0NnzVoz5kkXKPMDe3OOla6jTJdgcJf3W2d3bIYKu7PLpIWQW23bIlPqroZP2VZ+1qWVqT07McjV7V3E2X9lJCyqePww4h0VQ2RROWDAhuOOUaRwQ3azFYyzL0WDPwsj0e9PAQT2QWhgN66jnbMGTTRj0D9PgVQdUnuJ48kjMK1jFlPAelPQotetD4pwdSSY1283/bMvb+fxklhi8mcImgTu8SijuTfTeDJG9Qp/+Zlg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(5023799004)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RWq3T2Uh8ntOr6YEYtRKeZA29ixL/wCFIzNXF6p/96kdnuqww/oMPXYqeILTkWlJif5E8w78SqNW9A49/01ryX9D8Ar1zX+EgvoD0nmkeoLq/xLKkkUzDQTzoz9gaJ4RRhHNfYHmo51VFe9CUyHpJL4yLVeJ9+JndokR5PNNQXacosqnkXdTZkFiN0lHvSyengGBSKZqchub3ZbdK5VtMGj3SXqJscEf1Tro0NRzIgHRTgEr6viLk/FrcUla9/7ze9mUIdWL/WFa7MGYV9rZmB3ITBAh+nVHmvBp01uETBeq0OQOGOZTnB9qOspo5Vb4iXXXrYO/wEexDF6jYoqzawkoZ1tSeYdyK1xdHFYBrn7N6FrmsmQv2heKzrGtBOf1L+yLJnKQR/e4qVPG0OsXNN9e+7Lwyd+DP7uuug6oV29BYfZqjGdkwuJjIueMNgnl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 14:35:08.5456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f3cc76-3e4d-47b8-93db-08df2eb75732
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8096
X-purgate-ID: tlsNG-d25034/1792506913-014C7A5B-1455352E/0/0
X-purgate-type: clean
X-purgate-size: 4435
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Arm, the hardware domain does not use the P2M pool. Its P2M pages are
allocated directly from the heap, without any limit. However, when the
hardware domain is created using dom0less, we still allocate a P2M pool
for it, either of the default size or the one given in
xen,domain-p2m-mem-mb. This memory is never used and is simply wasted.
The same applies when the pool size is set for the hardware domain using
XEN_DOMCTL_set_paging_mempool_size.

Don't create the pool for a hardware domain. Make the get/set paging
mempool domctls return -EOPNOTSUPP, skip the pool teardown and reject
xen,domain-p2m-mem-mb for a hardware domain in dom0less.

The dom0less check is Arm specific, because on RISC-V the hardware domain
does use the P2M pool.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misc/arm/device-tree/booting.txt   |  4 +++-
 xen/arch/arm/mmu/p2m.c                  | 14 ++++++++++++++
 xen/common/device-tree/dom0less-build.c | 12 ++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 3787d2e2b668..c3705ab7d913 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -277,7 +277,9 @@ with the following properties:
     used for the domain P2M pool. This is in-sync with the shadow_memory
     option in xl.cfg. Leaving this field empty in device tree will lead to
     the default size of domain P2M pool, i.e. 1MB per guest vCPU plus 4KB
-    per MB of guest RAM plus 512KB for guest extended regions.
+    per MB of guest RAM plus 512KB for guest extended regions. On Arm, the
+    hardware domain has no dedicated P2M pool, so specifying this property
+    for it makes the domain fail to build.
 
 - max_grant_version
 
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 2cf35d8a3709..70d7c9fed955 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -61,6 +61,10 @@ static void p2m_free_page(struct domain *d, struct page_info *pg)
 /* Return the size of the pool, in bytes. */
 int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
 {
+    /* No dedicated pool (no limit) for a hardware domain */
+    if ( is_hardware_domain(d) )
+        return -EOPNOTSUPP;
+
     *size = (uint64_t)ACCESS_ONCE(d->arch.paging.p2m_total_pages) << PAGE_SHIFT;
     return 0;
 }
@@ -69,6 +73,8 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool can_preempt)
 {
     struct page_info *pg;
 
+    /* No dedicated pool (no limit) for a hardware domain */
+    ASSERT(!is_hardware_domain(d));
     ASSERT(spin_is_locked(&d->arch.paging.lock));
 
     for ( ; ; )
@@ -119,6 +125,10 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
     unsigned long pages = size >> PAGE_SHIFT;
     int rc;
 
+    /* No dedicated pool (no limit) for a hardware domain */
+    if ( is_hardware_domain(d) )
+        return -EOPNOTSUPP;
+
     if ( (size & ~PAGE_MASK) ||          /* Non page-sized request? */
          pages != (size >> PAGE_SHIFT) ) /* 32-bit overflow? */
         return -EINVAL;
@@ -134,6 +144,10 @@ int p2m_teardown_allocation(struct domain *d)
 {
     int ret = 0;
 
+    /* No dedicated pool - nothing to tear down */
+    if ( is_hardware_domain(d) )
+        return 0;
+
     spin_lock(&d->arch.paging.lock);
     if ( d->arch.paging.p2m_total_pages != 0 )
     {
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index fcb438c50a04..a877e695ad11 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -757,6 +757,18 @@ static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
     int rc;
 
     rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &p2m_mem_mb);
+
+    /* No dedicated pool (no limit) for a hardware domain on Arm */
+    if ( IS_ENABLED(CONFIG_ARM) && is_hardware_domain(d) )
+    {
+        if ( !rc )
+            return 0;
+
+        printk(XENLOG_ERR
+               "xen,domain-p2m-mem-mb cannot be specified for a hardware domain\n");
+        return -EINVAL;
+    }
+
     /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
     p2m_pages = rc ?
                 p2m_mem_mb << (20 - PAGE_SHIFT) :
-- 
2.43.0


