Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF091606A8BD
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 02:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=t1dj11C1
Received: from list by lists.xenproject.org with outflank-mailman.1488403.1690377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xS34g-0001eh-15; Sat, 14 Nov 2026 02:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488403.1690377; Sat, 14 Nov 2026 02:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xS34f-0001ea-Uj; Sat, 14 Nov 2026 02:01:01 +0000
Received: by outflank-mailman (input) for mailman id 1488403;
 Sat, 14 Nov 2026 02:01:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xS34e-0001dP-9W
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 02:01:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xS34c-004j1v-GI
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 03:00:58 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6af7c0d3-e002-0a2a0a5209dd-0a2a4506d5b2-10
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 03:00:57 +0100
Received: from [52.101.193.45]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6af7c0d8-195a-0a2a45060019-3465c12d4bb2-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 03:00:57 +0100
Received: from BN9PR03CA0853.namprd03.prod.outlook.com (2603:10b6:408:13d::18)
 by LV2PR12MB5750.namprd12.prod.outlook.com (2603:10b6:408:17e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Sat, 14 Nov
 2026 02:00:52 +0000
Received: from BN2PEPF0000A801.namprd02.prod.outlook.com
 (2603:10b6:408:13d:cafe::9c) by BN9PR03CA0853.outlook.office365.com
 (2603:10b6:408:13d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Sat,
 14 Nov 2026 02:00:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A801.mail.protection.outlook.com (10.167.245.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 14 Nov 2026 02:00:51 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 20:00:51 -0600
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Fri, 13 Nov 2026 20:00:50 -0600
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
 b=A3KBSLpxzbGiLenNLg/0yT7riNNWyrb2Qr1q7O4ZZyOXctdaYgkyvvoVM1jN6MjRPo8ckG3qhtWTXC3Sg7g0womWqhcOqnRL7NrLBW9EW2qBjrrO/LIKQIM1/Ax5Hqgj7BoPwC5PWFu9au45oD6g0uQznr+M9d+8dthqxr8OLit29RxYk+6PIhqiJKBWrU20QAQNfAlYIK01Pc2uYmFsVwXCE9Z6FICN1j8rkI95U2dJeKNZEvF0Fiy+yaUGQmbBsAsLvnbQFjeXZpk5TvAY4djXUyR9opZJ8B71ZVqQkK76oLP2cbPnThJwMLSF8lMx5plkkZFlOMcmHxgxLdSAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bixuWMLgXTssLvB67EoK9dbkSZ2/awug8YA4EzayTlI=;
 b=seMdApIO4wew5scb0cocdtLnq7D/WZicXNJMppvuwJD+X2vsX5a4rQTjAxn3XgiS2Vyjf/2b6dv5NFVLpx9watUPNIq2ZaRQqW0kYabv8QuPomVcafKNv5Ozxa/eE5mfCRh+x+Iql7w/dx400zg8lXKlLj3nP+efbuRj+1XmTf3mQSPa5303C18/EEeC6m1ZdFj7BvTyfypuSlhFBA2Bf260O/K0CXDMfvp94hDWQ4Xe+wj1v4qnic/TMPcV6fXlevFt6+KCIqF+v5APGNozyWO2htCzgpA6CTD9HInIzbUYpf/c5RVfxDfnEbV6SHQ2qnv4meyXFG6MJ5q7YV18vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bixuWMLgXTssLvB67EoK9dbkSZ2/awug8YA4EzayTlI=;
 b=t1dj11C1QnDiijdjR7rVwAKzHDk9DqYqloRZ0q/3LDOxLaoEgDQ9LFLqJtOQpjNJYgWbGOYbf8OfvA6+xwOslU5ghGgHstVHuEjf1Jv0lSfGela7GJifDuHZOxFUpCNGLQ5G+6pQA2GA6O5JDeOULEa2DFFXiOT0n5XHWa7miGE=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: vpl011: record the virq only once it is reserved
Date: Fri, 13 Nov 2026 18:00:40 -0800
Message-ID: <20261114020040.4154189-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A801:EE_|LV2PR12MB5750:EE_
X-MS-Office365-Filtering-Correlation-Id: 15055856-d87b-4b13-1492-08df41f31c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|261028144727099003|261026121527099003|11063799006|56012099006|261026140227099003|261021123027099003|261022105027099003|10067099003|261102123227099003|261021121427099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XADsFwdzUMdhNvGZXHIoAfWYdGZh2Ebdgn57JqpfA6SombTk1NtQBVZZpNyHNaqY79hU1dPJn0VCYUek16Ga1BqLd93SH2lb+pyHZJ0eePlhaQOtTl16FBYTEl6OtC9Af7tfP4Ub+oHqCamTYGP7t8mOwXVSWgMPgK0QoLhywLLbZlkD83V0Fuvrc5ICJK9w4iyI/gp/L7gG8FnHHdZJjqyDg5Rjo5HPZaEiOOgFw9J96EgaBSMUKpda5NMqYtTLvhqAXcOWhrJW6mnO41lHXmnL40pQ+0UDu/hSg7YM7PtmWu4ZeZzzyIchCbhrpt2fK7SPdBEi32fLSaAPUeMSaeu8yEtmA5AnF0d3T4BVTD/5RkdlMpsiH9K/FQX798x3gWqALC6c/jKUbEXq7msWlo3c8QQek7RnoSQuDREsSozJmU0692M1/LhdmZZgWe2O2jV4RO5aWEtHtppgEMi7Yz/1Dz9OjohgwLUWtneo4P+BoK+Zr/TSGV9IDJ6ATGcj7vXfSzKW9SIoE50NpdVUUVr84KVA87myOq1LUVSVgQJzH+kjQZ59wgWFBBjajJjh39Gams85Fh1mclezaJOvdC97UJblw3u4DRRFL+wziJKCdIGStB145jzBZKqo6eDJlA0NX8ZtQyYuv1j315KagXlwyDHIoGqPkWE6uQt8OJOSRIup+EK9VC82AYUj+9wvfj9naKTJCVU3jCI63IEXaA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(261028144727099003)(261026121527099003)(11063799006)(56012099006)(261026140227099003)(261021123027099003)(261022105027099003)(10067099003)(261102123227099003)(261021121427099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z8fhIEOOqnEXrD+Ql7Y7uXKRYleiasg/R6wgpYYKzB/wczU9+uxMey6FmOCMMx/56aHvotqTi6MlIJdPf6r6WwFHyoFH7D8lZdd+K9ieBZg316Oo7tmbnyv9Hd/5AeuCRExMJ+hie8nWgTp/tv+NUdKzEQBi8XKRTpA7pSAWoad0uuYXakhmqf5w18jenFcZk4PBd65SRgFVSJVdKIynWEV/FkQHvzCEvI9kmyr+7+sUakn3bShpPnVmGuEALEWS/QOPLUV6HF1E2XuUCSoE47BrYaM+/5ZQVDp9zCa1rfh5AK4/dggOA5eDa79RX65Xt3CeNJ1tWuhGxAAljKvcMdG9EyR1Jo5NrbI7e/YWAjV83EakoTA15Rw9Er8Qg/Y7Mr45gA1OMecRG3vQsm0ccQ0avJM0sFh0x344Q/PsmuF0nEORmU6Cp71oOF9LJZCu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 02:00:51.5310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15055856-d87b-4b13-1492-08df41f31c31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A801.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5750
X-purgate-ID: tlsNG-16d1c6/1794621657-1EAC277B-F7F2DD75/0/0
X-purgate-type: clean
X-purgate-size: 2309
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

domain_vpl011_init() sets vpl011->virq before vgic_reserve_virq() claims
it, and both a refused reservation and a failed
alloc_unbound_xen_event_channel() take the out1 error path into
domain_vpl011_deinit(), which frees vpl011->virq. That clears the
allocation bit of an interrupt the vPL011 never reserved, so an
interrupt held by another user can be handed out a second time.

Record the virq only after the reservation succeeds.

Fixes: 08bbc1c02d38 ("xen/arm: vpl011: Fix domain_vpl011_init error path")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>,
CC: Julien Grall <julien@xen.org>,
CC: Bertrand Marquis <bertrand.marquis@arm.com>,
CC: Michal Orzel <michal.orzel@amd.com>,
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

 xen/arch/arm/vpl011.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index d0d17c76b7..a37e88a8b4 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -640,6 +640,7 @@ static void vpl011_notification(struct vcpu *v, unsigned int port)
 int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
 {
     int rc;
+    unsigned int virq;
     struct vpl011 *vpl011 = &d->arch.vpl011;
 
     if ( vpl011->backend.dom.ring_buf )
@@ -659,7 +660,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         if ( (uart != NULL) && (vpl011_irq > 0) )
         {
             vpl011->base_addr = uart->base_addr;
-            vpl011->virq = vpl011_irq;
+            virq = vpl011_irq;
         }
         else
         {
@@ -685,7 +686,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     else
     {
         vpl011->base_addr = GUEST_PL011_BASE;
-        vpl011->virq = GUEST_VPL011_SPI;
+        virq = GUEST_VPL011_SPI;
     }
 
     /*
@@ -724,12 +725,12 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         }
     }
 
-    rc = vgic_reserve_virq(d, vpl011->virq);
-    if ( !rc )
+    if ( !vgic_reserve_virq(d, virq) )
     {
         rc = -EINVAL;
         goto out1;
     }
+    vpl011->virq = virq;
 
     vpl011->uartfr = TXFE | RXFE;
 
-- 
2.47.3


