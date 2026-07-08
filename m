Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A37DC43458
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2026 21:04:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357358.1611814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZR4-0005Bj-2G; Wed, 08 Jul 2026 21:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357358.1611814; Wed, 08 Jul 2026 21:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZR3-0005BY-Uu; Wed, 08 Jul 2026 21:04:01 +0000
Received: by outflank-mailman (input) for mailman id 1357358;
 Wed, 08 Jul 2026 21:04:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1whZR2-00053t-0S
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 21:04:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whZR1-00BD5T-Dh
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 23:03:59 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb3f-e002-0a2a0a5209dd-0a2a450aae6c-0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:59 +0200
Received: from [52.101.52.54]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb3d-e40e-0a2a450a0019-3465343685cf-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:58 +0200
Received: from CH0PR03CA0340.namprd03.prod.outlook.com (2603:10b6:610:11a::28)
 by SJ2PR12MB8009.namprd12.prod.outlook.com (2603:10b6:a03:4c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 21:03:54 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::a) by CH0PR03CA0340.outlook.office365.com
 (2603:10b6:610:11a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 21:03:53 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 21:03:53 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 16:03:53 -0500
Received: from ubuntu (10.180.168.240) by satlexmb09.amd.com (10.181.42.218)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 14:03:52 -0700
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
 b=scUJPh+G9d3VHKb1BRkNz/DDs7u7+OLLgVRofZf01SPtims2NbfKX1nxdpSlb/rvnCxCCzxpbHYk4RMCcOWcOIqR9dpgYh9bgKrLTH4FJ0UkFe3uOFnxHxy9fnhLRHsgAW9khKZNrmfd3baD06RzpA03hPvDtQzOIzTpO3wLmhT1I2rqbnnX5jJBYWLqG3F60t+YANawZPLICVam2cwnZgBdBj3zB+M0Yq4YV9eVDBXnFP8UemIauJesxXxyAZtZJLElmRaEeZaVWCs+8FqLqFqIj7cWT8a+ZdffsXp1ywBIPTov9zSiJ3gDTN4MRBt0OUQOicxNA/1LLBqD9tqnGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRLzzk0UEgl4+j4PxlJtdiOyBbtWQKjKKPnDYZswYE0=;
 b=lUt2Trf6A5abmFnFvfcmMSOytzOOyFyvqGkiXyuviMoQ0TuWSJ17ujPBSmuUx+8iPy28uV+eRdJuBwr5WJ+ZJsbX48M/Apmh2Rmr8aMA9Wvc3SsoNwmSSSu8LPG8XE1z9SBEvPUXOFP4lF8/bLJBIkbCXwvzFU/8sOE29JKulc88mW/eyD3qJUBPZcyED2yyrM0GWtixjSmqcytfXJt3oqR8v9nB7uzlmy72wMOmHNLpqVeL6uE2itf8Zvl4W6KTLaNhtQweLyp1hLIhYfG3mbT4hCIVh3L7QnL2l5Ot/ypGlAcbNsStaUMg3RVquahbrA2/alDVBWP5d2Sc2B/5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRLzzk0UEgl4+j4PxlJtdiOyBbtWQKjKKPnDYZswYE0=;
 b=WHL0UwOZgS2C/ekQkhQCUbjxQOtdatAGVN+L9jDdr4TbGTa5bBxIBT5o1Tp/Y1akwUFHMD8r8IcJgX8NBf22HNdKPM2Ew8CunRZfY7/hULNVPbYxz6IliZ8PU+9oK0eFZvL2KfcVvRVXCAugqTtQwoseCqJJT8uG2x6xYRh2Ufw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 7/9] vpci: split vpci_process_pending()
Date: Wed, 8 Jul 2026 17:02:22 -0400
Message-ID: <20260708210233.922275-8-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708210233.922275-1-stewart.hildebrand@amd.com>
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|SJ2PR12MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3c03cd-7aa8-4b0f-547b-08dedd346af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	nwpeD2q4o8lNHHzF3tai4ZwEnY1apl6q4MVWUzoUUQfE9BFOGgJiOeJYVwUbu0I3o72MDoyrEpj+bBrXUDVqlUmAKa7gKN9oQkLnPZbngCFpKvTwgDblSsA4rkeP2iAWi7UgMq3BaUoaT4ewSx8+7R0xAgxS2eyfk5EJRv3h+0eIGOWRkMNfvcjGl4IsuDkIFly9dq543mMFv/fPM83+j0U3LgclSKTzioJNLmu9iVYj0STokSH2sNejdDgWlav+1CX4zT0UY5CsjYDbAhyuvE84Lo5sHV0Wwv1cLv4nawddoiFQ4LXzYnbo1i9PVYhn0xWZhpUa4SLW7HTsY8PaSH+MwuGaCbgi2angbfidbhnbik68Fci3taXz50RpIuSMi1A5/ZbthDMsGGCv9yViRO50ygQhtu4f7k1fbHLt9NFLlPbJlAGmDxiTkFI30Hbiks1pchsCWuTXm/ZaMpcMqlgexpx4pQ3wJCtst+TcN1bWp1zkELOvnnV01pgYxMSxmBOB//woubabI7i5rNa90+S26DbQ+9dUbw0ExNrKpaYcbG/5kDciutHJWt0CxDi1SERoibj0aY0l++HjGkvyNfOOMj8NTNEVKWDiYHf4Wae5STzshoR1OKS1uuI07HTksBPB+R79s2D88GA938u7ZLSp/q5860474YBQu0aGPNfxSVO+ECLjU+atrOiGjbTb3xG/nJVG2SWKEdGtkgqoxQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LMH5Tpc5chYhMHyO3aMpUBd16pQBu0zMVJLxdnWpV/V4Aougc30nYBKXiAc8lnoGQhreT3X6Z9pw9eDnFJIGDU7uqjaK+pVi/YEXkEL47XBu8WgVhk38+F/24bLGJ4CU3Z3UZaIwpP6vMZoQbfx/WZUTgxeHB7JczHipT8Z7iEwJ6tgpZDGddLX1IWfSoQz/4l5JKFUBNxyjk/4ePbIZ3aKZkeS0kjuPCYvUEG9Gc/suEMQVMxQyZ4IwTRg9AKQ97vqsG+yOrQWVtlm6un4xxME1d7CpspYTvXrwZbn6FJ0j+7bKFhqYxLgiSjQQuprcjpKjIdVFoI6JtCT1Ofci11/zoneRpddS2xou/3OU83ut4uTU3NtH567c0ETbntHSvRMafrn72NKvb0oosEzw6wCqC+LS8Tompd4lggjU2iHq7PTZ71SAesbUbRgVO591
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 21:03:53.5263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3c03cd-7aa8-4b0f-547b-08dedd346af2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8009
X-purgate-ID: tlsNG-4011c0/1783544639-3E806DDE-258A867B/0/0
X-purgate-type: clean
X-purgate-size: 3347

Create a new function to separate the mapping logic from the pdev
validation and lock-acquiring logic. Slightly consolidate exit paths for
hardware_domain and !hardware_domain.

No functional change.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v4->v5:
* new patch
---
 xen/drivers/vpci/header.c | 65 +++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 27 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 28e051f2779c..f7eaf9c6ddf2 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -102,23 +102,12 @@ static int cf_check map_range(
     return rc;
 }
 
-bool vpci_process_pending(struct vcpu *v)
+static int process_map_task(const struct pci_dev *pdev, bool map)
 {
-    const struct pci_dev *pdev = v->vpci.pdev;
     struct vpci_header *header = NULL;
     unsigned int i;
 
-    if ( !pdev )
-        return false;
-
-    read_lock(&v->domain->pci_lock);
-
-    if ( !pdev->vpci || (v->domain != pdev->domain) )
-    {
-        v->vpci.pdev = NULL;
-        read_unlock(&v->domain->pci_lock);
-        return false;
-    }
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
 
     header = &pdev->vpci->header;
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
@@ -126,8 +115,8 @@ bool vpci_process_pending(struct vcpu *v)
         struct vpci_bar *bar = &header->bars[i];
         struct rangeset *mem = bar->mem;
         struct map_data data = {
-            .d = v->domain,
-            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
+            .d = pdev->domain,
+            .map = map,
             .bar = bar,
         };
         int rc;
@@ -136,21 +125,12 @@ bool vpci_process_pending(struct vcpu *v)
             continue;
 
         rc = rangeset_consume_ranges(mem, map_range, &data);
-
         if ( rc == -ERESTART )
-        {
-            read_unlock(&v->domain->pci_lock);
-            return true;
-        }
-
-        if ( rc && !is_hardware_domain(v->domain) )
-        {
-            read_unlock(&v->domain->pci_lock);
+            return rc;
 
-            domain_crash(v->domain);
+        if ( rc && !is_hardware_domain(pdev->domain) )
+            return rc;
 
-            return false;
-        }
         ASSERT(!rc);
         /*
          * Purge rangeset to deal with the hardware domain having triggered an
@@ -160,10 +140,41 @@ bool vpci_process_pending(struct vcpu *v)
          */
         rangeset_purge(bar->mem);
     }
+
+    return 0;
+}
+
+bool vpci_process_pending(struct vcpu *v)
+{
+    const struct pci_dev *pdev = v->vpci.pdev;
+    int rc;
+
+    if ( !pdev )
+        return false;
+
+    read_lock(&v->domain->pci_lock);
+
+    if ( !pdev->vpci || (v->domain != pdev->domain) )
+    {
+        v->vpci.pdev = NULL;
+        read_unlock(&v->domain->pci_lock);
+        return false;
+    }
+
+    rc = process_map_task(pdev, v->vpci.cmd & PCI_COMMAND_MEMORY);
+    if ( rc == -ERESTART )
+    {
+        read_unlock(&v->domain->pci_lock);
+        return true;
+    }
+
     v->vpci.pdev = NULL;
 
     read_unlock(&v->domain->pci_lock);
 
+    if ( rc && !is_hardware_domain(v->domain) )
+        domain_crash(v->domain);
+
     return false;
 }
 
-- 
2.54.0


