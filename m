Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB90CA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 12:49:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442307.1659881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xER4j-0003D2-Fu; Wed, 07 Oct 2026 12:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442307.1659881; Wed, 07 Oct 2026 12:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xER4j-0003Cv-DB; Wed, 07 Oct 2026 12:48:49 +0000
Received: by outflank-mailman (input) for mailman id 1442307;
 Wed, 07 Oct 2026 12:48:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xER4h-0003Cp-M8
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 12:48:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xER4g-001ZYo-SX
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:48:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac63fa2-bab6-0a2a0a5309dd-0a2a4506bff8-22
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 14:48:46 +0200
Received: from [40.93.201.65]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac63fac-195a-0a2a45060019-285dc9417d59-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 14:48:46 +0200
Received: from CH0P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::21)
 by DSVPR12MB999126.namprd12.prod.outlook.com (2603:10b6:8:383::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 12:48:41 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::15) by CH0P221CA0039.outlook.office365.com
 (2603:10b6:610:11d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 12:48:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 12:48:40 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 07:48:39 -0500
Received: from APPOL-18KY0J4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 7 Oct 2026 07:48:37 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HT3gxFmMQdGku+BGnvWjndBQJPaiAplA6qzvtG3uPfg469CX/9tqg1jHTI9h1aaxYYA6qkDzlsTq6F3Oxqewad2STaYJp9IuOQIcpLRM05ru6iJDiW0s/P+Htk8vz+PrI2rnfv24MMa0SGwvAt5d2CNr7zifxaBe0ZXqO3+jyesYnGT5KdX0jW9MHb1yRhQBTo3OKVoV0ypWwMcBR/F1CUZWcnGnQuJeovHkD0Z228ORAydEl/YkGo+UGlQYrM0DQHXpzCgL3OM6PyCNnTkBSB6zQd4B9iJCm7DhZYn4KOJ23WOS7nG/vTZaj52PGjaXcOvWobpiH1xFQ6zn4yrXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUJVRizNZmdEf6Vn70Frllzcj4hzPR8FEdALiHfbpog=;
 b=MnV9rdlYsZ5gKCZbU5GKda1m/oXMeCoyBva2F5+20sqxZVSVMZ2zqeZ8nSnhA0z89WXIZiZd7agzH4X3QZi6de5gHqlqwo3qStPGg+X+cOtXBBsE4CFmI+8ViWx+lU5VDm6vnTIbayL9z2Fcd6UIAL4r88WpdlzVBpmSRIW0mpOl1FlSn5wr+N6sqXODOM3c1NrlMi9i5bRJ0IZ1bVreMIT5iybM3NSURYEuFVc5/VYRY85svodRVFQjUrCZxLEVakr81FOr3XwR6uy8o9O0P9DdVTC42SEfODoSpmESbrDYusbflT9qQ7hcJtj3aMRx0JWV6plG5yQh4g7gWTD6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUJVRizNZmdEf6Vn70Frllzcj4hzPR8FEdALiHfbpog=;
 b=fhyAD08FUlLlvWv4E8bZzI12GDTjRkjIv7sWdBkEWSWMVSf2b9/hHbN1QPCgF6/1hIhTZ5ol10eaNsnytFRQeem3rwUX0Kdwy3lCxr05ytS8p+pZiyV0X2SyiLciOTEonvXlk1hT6ww7SsuPLrcn6dHODlYDhH3kOqHdnu0XJuk=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH] xen/arm: Sanity test specified domain's memory for being a multiple of a page size
Date: Wed, 7 Oct 2026 14:48:13 +0200
Message-ID: <20261007124813.177940-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DSVPR12MB999126:EE_
X-MS-Office365-Filtering-Correlation-Id: 834729a6-669e-40bf-2397-08df24715028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	CIcEy6FnlUif4L0ZGy3rixlH2FBUUkpPR7dW8vT1xR+gMrNXMU5flc0qCfzwJgxwM2mOxrNh+UjlLIIcko/Z4FAEzEpL/G4/oac37pWcljk81220gXuTeYFIn/ka4Fnb+sL2kmRRtCvNgOlRwzE4l+nZFNB/vg6MDbo0R8mQzgvQA6ptvkHJEDSqPLyPk3ZTgLT0sOiLCkrIarTEhcSlGnUjTG/WLQLud4iBlL7MScH/WiWjm3lLiu4t/Hbb1ZKgjvS44LyoDmRh6H1tBvR+Wck+X83GS0Ixmx96tAzJs7LOilOxL9q3teU6aCBURVAtgkUY9Dr5R+y9zeFlj/ysKw2hmwL11MkUioY7Ml0C2Et7mJaKABfO5VAodqbMQbuxRucIrHCHSs7htMeOjWK2A9RXsTtpdiGIlrumarNoWg1m5xn4PznvPrNjrG3QUw7jhvPfxRGx4JQISrRS10A6yUvEPQAXvd+VzWbKukRH6y6HTVyg7500OXgPZVElW/XCzpVhSNWJuRgJfHhMKNGJtsFLBhqYf5P+oILn9RCxvoVuOfD8UP7tvPPq2t16FBaFy0dNAO7L2k7jRa+RDR3LXUKhYwltZvtYToinmsF1AjT9y3FgCw9Q0ItnfzNMlx73jZZT8YPZPqyK0JEjYmT9dYWQxjytHtcRS0iQH2OyqsHDWd83p4B7YFhCx/L/792xk+tycUkXZFCYG0+ARoQ5gw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XDU+JlnGaWN12K8IpPZ/6TGvOPQf4T4NjCy0X3wFWu4/EAy6A+31psI+4BcCgFqp77wOcHpOj4/Ye1HxgiBKvFRcBlZYVIftWki6gVS91FfDjD3zKIPiQuVBAYMdzyR5FQvOp29Bv2ZKtxKFZbSkVht+3E6iaa2b/h88jOagwI8CJqeMzp95ztuHuXmnsWW1dszypRoXpeerTsPUWGXEzOw5SPk56Pva10YpXSjmof+gMY3PK2UboAXAPFWlHxQLZU3qMGyImJQnTSmrFe1kh67d/6okl/xNlEu29FiHO2ZmRunoxL33R83NdWVAsHBhkaBRDR1KsAdarEDktVXi5Rb7bWFprgWrVs2YsHdlfeB5dLmO3SaQetBtYvSGURSFeXQFvehrh2+rk0CEclcX4AhAzIAZ6i3f7o8AGGYsaFMQE5wp+sn7hZUj9L8i5khJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:48:40.4034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 834729a6-669e-40bf-2397-08df24715028
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999126
X-purgate-ID: tlsNG-16d1c6/1791377326-F72C677B-58E5BB7D/0/0
X-purgate-type: clean
X-purgate-size: 3432

We require memory to allocate for a domain as RAM to be a multiple of a
page size. However, we neither document this nor sanity test. Specifying
memory size that does not conform to this requirement fails the domain
memory allocation in the non-obvious way that is difficult to parse for
the user (printing over-allocation messages followed by the panic that Xen
could not allocate the requested amount of memory).

While there, fix indentation from tabs to spaces for "memory" parameter in
booting.txt.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misc/arm/device-tree/booting.txt   | 4 ++--
 docs/misc/xen-command-line.pandoc       | 5 +++--
 xen/arch/arm/domain_build.c             | 6 ++++++
 xen/common/device-tree/dom0less-build.c | 7 +++++++
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index bcb06bc796bf..7dfac2062a37 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -155,8 +155,8 @@ with the following properties:
 
 - memory
 
-	A 64-bit integer specifying the amount of kilobytes of RAM to
-    allocate to the guest.
+    A 64-bit integer specifying the amount of kilobytes of RAM to
+    allocate to the guest. Must be a multiple of 4KB (the page size).
 
 - cpus
 
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index ea0e3368b1d6..d49db353d8a8 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1020,8 +1020,9 @@ and architecture-specific domain limits.
 > `= <size>`
 
 Set the amount of memory for the initial domain (dom0). It must be
-greater than zero. This parameter is required (and only used) when the initial
-domain is not described in the Device-Tree.
+greater than zero and a multiple of the page size (4KB). This parameter is
+required (and only used) when the initial domain is not described in the
+Device-Tree.
 
 ### dom0_mem (x86)
 > `= List of ( min:<sz> | max:<sz> | <sz> )`
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 72d531618045..bc3d1ebad1c4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1881,6 +1881,12 @@ static int __init construct_dom0(struct domain *d)
         warning_add("PLEASE SPECIFY dom0_mem PARAMETER - USING 512M FOR NOW\n");
         dom0_mem = MB(512);
     }
+    else if ( dom0_mem % PAGE_SIZE )
+    {
+        printk("%pd: specified dom0_mem (%"PRIu64"B) is not a multiple of a page size\n",
+               d, dom0_mem);
+        return -EINVAL;
+    }
 
     d->max_pages = dom0_mem >> PAGE_SHIFT;
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index fcbeb8adbd73..b3f24e5d555f 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -789,6 +789,13 @@ static int __init construct_domU(struct kernel_info *kinfo,
     }
     kinfo->unassigned_mem = (paddr_t)mem * SZ_1K;
 
+    if ( kinfo->unassigned_mem % PAGE_SIZE )
+    {
+        printk("%pd: specified \"memory\" (%"PRIu64"KB) is not a multiple of a page size\n",
+               d, mem);
+        return -EINVAL;
+    }
+
     rc = domain_p2m_set_allocation(d, mem, node);
     if ( rc != 0 )
         return rc;
-- 
2.43.0


