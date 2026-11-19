Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FC5606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0X1n9Ra1
Received: from list by lists.xenproject.org with outflank-mailman.1497456.1695758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9p4-0004tb-AD; Thu, 19 Nov 2026 21:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497456.1695758; Thu, 19 Nov 2026 21:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9p4-0004tU-7I; Thu, 19 Nov 2026 21:37:38 +0000
Received: by outflank-mailman (input) for mailman id 1497456;
 Thu, 19 Nov 2026 21:37:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xU9p3-0004tG-E5
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:37:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU9p2-009UcD-Qi
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 22:37:36 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aff6bfc-8faa-0a2a0a5109dd-0a2a4508e95e-42
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 22:37:36 +0100
Received: from [40.107.209.63]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aff6c1e-f659-0a2a45080019-286bd13fa5d8-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 22:37:35 +0100
Received: from CH0PR03CA0395.namprd03.prod.outlook.com (2603:10b6:610:11b::12)
 by SA1PR12MB999109.namprd12.prod.outlook.com (2603:10b6:806:4a1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 21:37:31 +0000
Received: from BN2PEPF0000A800.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::6c) by CH0PR03CA0395.outlook.office365.com
 (2603:10b6:610:11b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 21:37:30 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A800.mail.protection.outlook.com (10.167.245.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 21:37:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 15:37:27 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 15:37:26 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport;
 Thu, 19 Nov 2026 15:37:26 -0600
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
 b=WATBm+6k/H5aOOpiYP1SWldSTE4GV2weRFiZre4svoYx2fnl+0MQtwhGqz79PEW3A9r8+H3MmWhQAtP9M9p6ni6bClTNNRHmjfJ22L9WOGWFsaXN8G8F6++g89M3HVp74F+MMtzFNH/delUtQ+ehsfp6xP8jM+KjafY9IiIjSPmkSJq8BJaierLpOr1ZQ4BppRnCzizdV3sDKHCUZi7meCen6MT63DE82VC2eoNun88KJCHI1rbQxdCN4CW2GBj6tfCVLA9Hpf48EvKfXHXGtr3QwPkBNMXTLvAduxnizsg//wXS91HEGPP6cERbt8VawA4s5dCntcbszLS7cL0Mnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3EnGaPxpd0s9M8e/84KgfRDiKt9nPjVP0H5T44Ih1Y=;
 b=SqdVFATTbUt+2HMN/RG1Cq0rL+q68i7l68Go0ZQYg6numW/meF5QHnJYtCbOWHxNcxydJ8RV27SLaCYUtF0+4gnwZLfQdo+RpGM7UhUHw3kcE354+r9o9H2REVg+JW3VAO8YeR1w89lZPlSTpssqtMSqHhVRVBt8rUQ0TXyA6IPqVkPu+bYhZNka2nydOeiBVJwAC4F4DSqU+dfFdP7Xzf6C+rcZZWtq2Uoy6ZmuAX5BdvLZJhoam2+7X4aprvW71WtjZ12Fg9F99exss/OoZRhbxTiVI+a8hmJU6Jpmenxu/Qj62Vb3tam1211OxQrdtvJLQBiy7PZ8Y3EZ2e9BpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3EnGaPxpd0s9M8e/84KgfRDiKt9nPjVP0H5T44Ih1Y=;
 b=0X1n9Ra1cd9C/OdvCXgsbseNl+YC1nPlW3VeuSTW4E7Ocw5i2OsrWbyDZBvg2he3Gx85gnB2gKrvzB+sF5yTmgZ8sXIMSzpfeLFSE+QX/C+DCNuKiefF03PKVR1w+wJiTr06Z/CAB0+YimMHuCwXeoiw5dM0WkbDJhOJDj2URYQ=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: vpl011: reserve the virq before setting up the backend
Date: Thu, 19 Nov 2026 13:37:22 -0800
Message-ID: <20261119213722.4174845-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A800:EE_|SA1PR12MB999109:EE_
X-MS-Office365-Filtering-Correlation-Id: 03853496-661d-46ca-a7c9-08df46855088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|18002099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|11063799006|56012099006|261028144727099003|261021121427099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	4/nALxyKzgwEKJgMUdsO3BXuhFWXzf30wY/1xS9Wen7jY6j5YpXYqhgKCTXOaVyCCAi3irXMOBAZza2Ifky225YsFSCnGOCALpAWjYKdFLSeMtDG56qWZIC71ZtPBrZmsK+Y0FOiSvO6Gd9N6PhROruKYQ2RPjeeymhgndEVL4i6QgfBwX8Nw2/5m4xRubmywwJZlfnWvPC0njrWyUgVRx4mgjJUIr/myjzlHxDJkJTWurqXY08QR97I5KuY2SqPC9z0STpeLaUlx6nf3JN3GJWMLevODCbo2DBWW/4VWHQ1iLfYTcED99utoRH3KxrpAUvK1aUsmjrf6ZupZtTFOy37fOoYMfwBzpZLBzGRaFn+VifXi0sovkSEGjpNuNUMUNTop17PCB3R+v50CjRADHumrIj6Fp+/Wc0a7TIZhxrs0XU6dp+CQTJU781EibYii7aV1HQaWsXBeyAz3zmFuQCwFj9NdnxAI1iLg2oa7svelC6kYbehOc94yF/PwGhX8gwtf1x65Aj4EHgXea+OwMbr01LN0Y95xy0sMdx9j4IWFmd/rZtiSrnqRKzP5LFfNojSz21vGvIZL5v6IKC3O7OVUr8UbyXWKg7XQAq37DfWbYWEO0PAAqDF3yiQaGnDE6nqIy0rgWFEX0Yuh1wpO3YHUBM490KrHgf7fEGQJdHTSjMmZfD354wLB1b77BFVizr7GMzI+8AvLJqS+zDNnw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(18002099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ReLgidmOnrelHRMUzfNq3LiH9AqDqvueMROCHhHFVySPGA75DX7VCDYplRnwlrTyKHx+IJKSKiNmhTyLP488SBXVWKpOVRwYyHVk2A40VBFfOQb1XqVkLInJaYuXmZmsWOdemJC2LifSt+0Am6ajYlIudDzvWwqgbI65Ni9491K+lPKxtuCzEDKso56yBShvtHMFlFJ1XdUTrmNnjrbmZK61BKjoFI/4Vr8El97aRLgwKPphnHgP9W6v2FEDOEbx/1pZNgfKBuYvDdq9+kDyr2F1+A65p5yw6iYpSVyn/HOw3CzR9zrGFvcUlt/F59ow78v2LtkghmUYkSGb5b8iyMKgaeRShSSY+1jfn68eQ+kL2ALsx9UEgDnmGsj6ygaUAMZNJU1anGxunszljpvqWYetBHMNPq8frTQL7KO1AqNBPNu2RxFxly1vrYuJQCNp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:37:30.5183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03853496-661d-46ca-a7c9-08df46855088
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A800.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999109
X-purgate-ID: tlsNG-c1860d/1795124256-D514E87B-08573544/0/0
X-purgate-type: clean
X-purgate-size: 2843
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

domain_vpl011_init() allocates the backend event channel before it
reserves the virq and records it in vpl011->virq. A notification sent
on that port in between runs vpl011_update_interrupt_status() with
vpl011->virq still 0. With CONFIG_NEW_VGIC this calls
vgic_inject_irq(d, NULL, 0, ...), and vgic_get_irq() dereferences the
NULL vcpu to look up the private interrupt 0. The same notification
also takes vpl011->lock and updates vpl011->uartfr before either is
initialised, and both are then reset under it.

Reserve and record the virq, set the initial flags and initialise the
lock first, before any backend is set up, so that they are valid by the
time the event channel exists. All the failures after the reservation
now go through domain_vpl011_deinit(), which releases the virq.

Fixes: ca0637a147af ("xen/arm: vpl011: Add SBSA UART emulation in Xen")
Fixes: 85da01b71312 ("xen/arm: vpl011: record the virq only once it is reserved")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
CC: Julien Grall <julien@xen.org>,
CC: Bertrand Marquis <bertrand.marquis@arm.com>,
CC: Michal Orzel <michal.orzel@amd.com>,
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

 xen/arch/arm/vpl011.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index a37e88a8b4..b1d286e1d1 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -689,6 +689,14 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         virq = GUEST_VPL011_SPI;
     }
 
+    if ( !vgic_reserve_virq(d, virq) )
+        return -EINVAL;
+    vpl011->virq = virq;
+
+    vpl011->uartfr = TXFE | RXFE;
+
+    spin_lock_init(&vpl011->lock);
+
     /*
      * info is NULL when the backend is in Xen.
      * info is != NULL when the backend is in a domain.
@@ -708,7 +716,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         rc = alloc_unbound_xen_event_channel(d, 0, info->console_domid,
                                              vpl011_notification);
         if ( rc < 0 )
-            goto out1;
+            goto out;
 
         vpl011->evtchn = info->evtchn = rc;
     }
@@ -725,26 +733,14 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         }
     }
 
-    if ( !vgic_reserve_virq(d, virq) )
-    {
-        rc = -EINVAL;
-        goto out1;
-    }
-    vpl011->virq = virq;
-
-    vpl011->uartfr = TXFE | RXFE;
-
-    spin_lock_init(&vpl011->lock);
-
     register_mmio_handler(d, &vpl011_mmio_handler,
                           vpl011->base_addr, GUEST_PL011_SIZE, NULL);
 
     return 0;
 
-out1:
+out:
     domain_vpl011_deinit(d);
 
-out:
     return rc;
 }
 
-- 
2.47.3


