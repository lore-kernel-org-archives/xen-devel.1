Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBCA606A326
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RmN3N1ZG
Received: from list by lists.xenproject.org with outflank-mailman.1503783.1699351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWcUk-0006tx-Td; Thu, 26 Nov 2026 16:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503783.1699351; Thu, 26 Nov 2026 16:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWcUk-0006tq-Qz; Thu, 26 Nov 2026 16:38:50 +0000
Received: by outflank-mailman (input) for mailman id 1503783;
 Thu, 26 Nov 2026 16:38:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xWcUj-0006sf-82
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 16:38:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWcUi-0079mB-1u
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 17:38:48 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b086093-e002-0a2a0a5209dd-0a2a4503df40-10
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 17:38:47 +0100
Received: from [52.101.201.20]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b086096-fae8-0a2a45030019-3465c914c359-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 17:38:47 +0100
Received: from BL1PR13CA0347.namprd13.prod.outlook.com (2603:10b6:208:2c6::22)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Thu, 26 Nov
 2026 16:38:42 +0000
Received: from IA0PEPF00000040.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::8) by BL1PR13CA0347.outlook.office365.com
 (2603:10b6:208:2c6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.4 via Frontend Transport; Thu, 26
 Nov 2026 16:38:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000040.mail.protection.outlook.com (10.167.249.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 16:38:41 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 10:38:39 -0600
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
 b=JSoRGm4ylWqQ6Ur+r9OJr1vQeFnqlRn6QwjZOvRdeoV1WvOxht/qWvAkrTpm7LqA0PXBHZGEQIlOavr9HgqUF4AYz89EuSHKonl7slr9vqbup+v4jQl0zp0/VHDLOKUnnVikztQMLHzTkVsoBkWW9OT77XRXbKPGEOvF68BVTd1hxvZgUCSnZ6hG5brLkyRm1GSrDHgCAYlte48wlzjXmxUwPrG/2KWkufO3n7lsjiCNBPSRMbWVzO2VaFSzXGHHjucrXL2VAaWVT5KXa70tGt1+4Y495biA6ZcGmtZXGz3UinpTM9wRVe9gH+svEDx5+u+u0aAGTZhk4woTkaC3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEF7V6PqLR1tvbP1GuN5UoC46DlF9OWiEWq+NaJpL8s=;
 b=KdXeE7QzrEjAd0sp+iuMExZ70rHAHjfKOm69Tp9FBGMF4+g5XJZ667Q9CTPMrVZsSgMoFzQDALXuaV8DJVQ4TaI+6tanGRTAojRsYSMp9CMkfI83bQJAfqfihBfEaCJQTmaa5+N+eNWwxnRR+SaPvcmSVkdM5jANdf9WJpCbkmiiE37kl6hH2xZJVebx+QjyO4UAdGcviVqFWL+j+lBaDVQESOpon2FHTQEfRt16ACo99GDGIFpIxaOR6MHU3131YzS2eLt6Sqt7m3s7b79aAO7FyLQDeMb+yvG/MOyrZ39vbB8v2PchXO7VXbZEWBuT4vTY1QMo+BO7XOSEZA/BTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEF7V6PqLR1tvbP1GuN5UoC46DlF9OWiEWq+NaJpL8s=;
 b=RmN3N1ZGB39hy51+YXbAH86VE6QrR1ioJovQj/iHSm2dm6hra8rZY3WC4uXYMpQGb29RmV3IDoEF6ituxqIImIAreeN57plpy8kU+u8AiC0xvwiAjZpal9sEbP7ZS6kdhNmKeZYJphREDxTct2MBbVJAtr2RnDVN/cXOOk/WAko=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/gicv3: Fix deadlock in gicv3_set_affinity()
Date: Thu, 26 Nov 2026 17:38:26 +0100
Message-ID: <20261126163828.4051516-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000040:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 303cd06f-091a-44c2-f255-08df4bdbbadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|18002099003|56012099006|261028144727099003|11063799006|261026121527099003|261009223027099003|261022105027099003|261026140227099003|261021121427099003|261021123027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	gOP1NFEKUpEce4zDwysXwCwozHhA3MSDNg6OWm6Mgp6iuGXVuGCqeVpA43lINlJtiX1Y4wz8dOd9A4IL3K+mCY4mjxIFA83UqT28FBNEA5IQoqI2EtEK7mHLRlUMDCauW3QQhs7nAsAUDoxJvXWhuDanmkkPrt6KJNx4Qp+dyF4wL9uGcRvrHTyUieybuWd9GCdNkYpwSspXEbNSp6Plrwhu5hnLs+tF9Nh5skxtmZ4ZxahLKlr2vOw06497NZz4x6HyurOSyBpN4NxG0r8FXkYj69lxE0sCXhYFQLvvCL8B10bBtS4u43CuljwYS7oYxnVboyMTAs6ScMudSoLg6gd7RLOS3FKczG/eu0YF7LTJ+q1/qB2ZNKqUpBrq7ljW/2nNxfK3C4oOKRGHM0kefUjv9mHv14vT3jMVyXi+8ObT0vUbHm8aKjF7F5e1Xko2/Dm3EqiihtNnfn7aA59Vrfq6TpKcHVct1YpN9YzdrK37TlZp3r1irVXtYh7ia7xZGVyJ5LjefOrHZ8gzWQSdhCvSM0vL5UiVErgWXFlfqnrM+mooZZfSNonwaIugNZ4qWARy4cry1pOYCZTVbED/9kWAzaanHWIkHdUzgr4rQW6jgQftWVkKLpH/CVTRS7nVeYSYaC2Zviodbkg/CyTopMtE4wfs9nc6isGLxkCBHrpuaRhdqknXtCp3xAMZrlOx0p0rMYT7h/0V5D1xWic4YA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099006)(261028144727099003)(11063799006)(261026121527099003)(261009223027099003)(261022105027099003)(261026140227099003)(261021121427099003)(261021123027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eIC1qowO6vzbPmN5KJ8KLuxj1MMI3ItefmLrnWVHZMNQaAQGjEQJt9vFREYrKDOlz+EB+UbcoTKLqGRDK6NjwlvPQUOlbQXXV3Lzc4WYXSbgKjx3acg2toRM6kI/lSrEElynbfq/9fkdAQ0LZ89KiIG0ZT2MiTrDMgc4+28SF/bMTrExGoG/Gw3bVxFV10X/8dY+xDQH7fDWF8qPigDS9bMkto8Q4nnnKEg21C/wV15SNNCouKFxLkSMiFibR0YJOH/C1qA48D+/MOLeD0o6pk3aYkiRYjI56uCBeChRy+suKIktW9YgJpNZ0Wz6CABD0J95I5zsFrET+d8TdXh59KNfVz7FV3Cclv1z6RVygYH0jh5GzembddKxVjv7XnSv/LYG0lsbp8vuKfo6RPHHwYDUuwAGF1t5dX1tD6ElsVXMI8mpcPPujV4FPu9wcjMn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:38:41.4358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 303cd06f-091a-44c2-f255-08df4bdbbadb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000040.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
X-purgate-ID: tlsNG-33051d/1795711127-6F0C94E9-ECD31386/0/0
X-purgate-type: clean
X-purgate-size: 1909
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

gicv3_irq_set_affinity() acquires the gicv3 lock with a bare spin_lock()
with IRQs on from arch_move_irqs(). This happens when a vCPU with
physical IRQs routed to it changes pCPU. The same function is called
with IRQs off from vgic_migrate_irq().

If the wrong interrupt arrives while moving IRQs, Xen would re-lock
the mutex, but it'll never succeed because it's already locked in the
interrupted thread of that very pCPU.

Have gicv3_irq_set_affinity() use spin_lock_irqsave() instead to avoid
the deadly embrace.

Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/arm/gic-v3.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cca49d2a2a..ec1e341f2e 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1463,6 +1463,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
     unsigned int cpu;
     uint64_t affinity;
     void __iomem *addr;
+    unsigned long flags;
 
     if ( desc->irq < NR_GIC_LOCAL_IRQS )
         return;
@@ -1473,7 +1474,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
 
     ASSERT(!cpumask_empty(mask));
 
-    spin_lock(&gicv3.lock);
+    spin_lock_irqsave(&gicv3.lock, flags);
 
     cpu = gicv3_get_cpu_from_mask(mask);
     affinity = gicv3_mpidr_to_affinity(cpu);
@@ -1481,7 +1482,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
     affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
     writeq_relaxed_non_atomic(affinity, addr);
 
-    spin_unlock(&gicv3.lock);
+    spin_unlock_irqrestore(&gicv3.lock, flags);
 }
 
 static int gicv3_make_hwdom_dt_node(const struct domain *d,

base-commit: 1208df803530bb885419627ab36a43313b98ce5c
-- 
2.43.0


