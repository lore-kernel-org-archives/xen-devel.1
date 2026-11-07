Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDE5606A32E
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2026 02:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=f8I+XQuF
Received: from list by lists.xenproject.org with outflank-mailman.1477743.1683066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPVxW-00067b-88; Sat, 07 Nov 2026 02:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477743.1683066; Sat, 07 Nov 2026 02:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPVxW-00067P-3p; Sat, 07 Nov 2026 02:15:10 +0000
Received: by outflank-mailman (input) for mailman id 1477743;
 Sat, 07 Nov 2026 02:15:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xPVxU-0005sV-NF
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 02:15:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPVxT-001QTj-AM
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 03:15:07 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aee89ab-8faa-0a2a0a5109dd-0a2a4507d6fc-0
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 03:15:07 +0100
Received: from [52.101.56.59]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aee89a9-b4ea-0a2a45070019-3465383b98e9-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 03:15:06 +0100
Received: from BN0PR10CA0029.namprd10.prod.outlook.com (2603:10b6:408:143::7)
 by SJ0PR12MB6901.namprd12.prod.outlook.com (2603:10b6:a03:47e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 02:14:59 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::53) by BN0PR10CA0029.outlook.office365.com
 (2603:10b6:408:143::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 02:14:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 02:14:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 20:14:58 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 20:14:58 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Fri, 6 Nov 2026 20:14:57 -0600
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
 b=vvLYw5clDVYLCFyYvGO+mFzRv6lWERUSW09afiLk4KEdD+d8wXOp6OVcoE2rPFiE+AegsmI2n8Pl73fQqBMiUxtdkff5Le4EmJuxZLvCdI3LAYLzcBt4Ah2ZsvO/4qAibuwf6av6ZKDWPiaOEsuoZR9eA5GEYz/w73dgpdNipIbqedEhlFJXARZwa8iaNhuoTD62KEpcYFsrU4WECV9lxRu+fRrcJhhIqeHTyqhJQepCrC8IKNa+EE+K1I8OJTxuE9kTwJxrJBxPuJKRSARhd2l/nnzHN0g5MgBNad1AvnohUFZYSRGXCGiZIhLI0GgBNQj398Rk0bfsycmCR0Cqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU6aJ/KvvHtBoLdsd60+qKvoKNjk6n2iz4mr+ZiTzLs=;
 b=mTmxOf7kyC2bQ4yJvFVtF7Q7alS4tRPb2yq8tX2IjNSyeWXmj52NCUxJ1mFTYxJz/7/TgQIODcZUh7SMHl/L/dmL7DKfAFF7gPQTxKLz5MYnHQ0f7CTwdBUImD+JRqH5fVLZP5knpRMx7nsYIq+aDq2nyZ6ANTyikF/xvNllmoP94JCjNxlPHzfVnIDIgjR3Lgq2qCkL4XtPuduEhBoYj/6YqSBe9qYWBm0pjK0Nfq9AUUp8nxsCAMsrlSUH0zWOEuzuwH9MHBn82FkQ62bTgr/Sbdrys4ALfkpDjT2UA/zrTdHwEGhZulGoNYDp3mFmH1ktvuwPYG0bcHUq2JC+5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU6aJ/KvvHtBoLdsd60+qKvoKNjk6n2iz4mr+ZiTzLs=;
 b=f8I+XQuFX0Z9eU497qAz5h2X8dJFwHj2udFkGdAW85jqKfvyu5/ZGgv2ra2EvwhdCdEggtqk1CJzxAQ6Y8Q1cpwFIy/eSpa9WKnvrBtslBjd1JTUegKRyRodWBWrA3jlVy1CSlkcWPplejcpl6cSHoPvqSRkzDiW5qlR7xRSmvE=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH 4/4] vpci/header: empty the BAR range sets when modify_bars() fails
Date: Fri, 6 Nov 2026 18:14:41 -0800
Message-ID: <20261107021442.253612-4-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107021442.253612-1-stefano.stabellini@amd.com>
References: <20261107021442.253612-1-stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|SJ0PR12MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a06e0c7-7989-45e4-6e77-08df3c74ec5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|261102123227099003|261009223027099003|261021123027099003|261022105027099003|261021121427099003|261026140227099003|261028144727099003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lStvogRErECWamVLJmFCsIca7pEMN63ZzZP7I7UqSLVS+VGEkAqEUuhQHggnpevGQrKp3RA4Q2lJ/xA8RXi3e43aXHGu9Sd0Ka0YmAmODjSV01xpHoxpsvfhUy48GgaBzMABaQ7P+rgatNABBWoOFVVjOEK4fwTbOKwqXfYnapVOA6tnd9HhzaCbAIxx7wtZiEp2uSbTjdRsCuvfL8yzuSA+xpJKs8O1lMpkuRzW8gTE5PwiV+x9coLvCEBvA162udIt5CKWe3sLazbOKcmVE3p/glwNYwUlRKfbXkS75ZgFHRldT3/x2CJgurQo8a1REor9/jCewAG2Fwespcw+Z6agQHDvYvQUEEPFZJ0xRFS8bUqmIHCehw2JwznkpqONXW21EpqXVx8zT8A3ShGUDfexkp6fpkX/gtk2LB32JtmFqcdRo3H64u3uZjPtEsKF9RKNOuUGPdH2nn99Qq4Tql5ghM2ckWG5Ld+2ALQUBSKQDLth/ebcSOOMUG82/l2xWCwdct3OkBFZi9A2R5IiACNGBu305b+ZV8b7Wf4FkCCbPfQhMLn4qE1mV3SNlyceEx0DMi4ZKDfEeUAnS7UAxNw7UagWnkcCuUtpOy046jtd623FeCbgbrUC3EoQzZtqqJb2sOkRlZMrZQS3/5X2dsi//+45rJp1MKF0ouJDlsg1GjMQL49UTaxEopObeLNUEV7uliEfCM5VnkHz0a6X4w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(261102123227099003)(261009223027099003)(261021123027099003)(261022105027099003)(261021121427099003)(261026140227099003)(261028144727099003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	91mPM5MG9P5+PzIkDQ0LkS+933rJCCXtseZvUML1lEsfXtQifQhmXUzurE9EIxJFFJF2yq8S/U9ooYxXa2QFDz6zQX848cBLBnEJ7yScDEw6ovOr6+98WBs1E3lidPMcbRDsz/tzfFb/maAZ6U1TYbFD5zj25+iVAK1pb7tukOSZly+LuHMITFN5EmotzldIaYM1aIIr/v4fnQtL+mMoT7epWMaS0hbjou94RIBAEWuxqwtBANxh5p1xrtkHfEHL+0bCM7r0hfW95IGPozvJ6Py3hDVf4jlOO2zWODtmB4XGA1efQJt5LzWHH+S/RLyTvYl5RWQbvJJQnDTO70r6woibVUwwSE1noqOHAARNWhNi7IQyWoK+4bbWhUBNiCO2P+FlocbITDwLHOZFa0EEcAjz56bqH6v4zR68quixDMaTomEyP6L79QCA8rKumKqo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 02:14:58.8959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a06e0c7-7989-45e4-6e77-08df3c74ec5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6901
X-purgate-ID: tlsNG-ef75cf/1794017707-A50CDAE4-92898FF8/0/0
X-purgate-type: clean
X-purgate-size: 3682
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On error modify_bars() returned with the ranges already collected still
in the per-BAR sets. The next request on the device then maps or unmaps
them along with its own. Purge every set when collecting the ranges
fails.

Fixes: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: "Roger Pau Monné" <roger@xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/drivers/vpci/header.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 7e5f4b8a00..0bdc4d6a46 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -366,7 +366,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             gprintk(XENLOG_G_WARNING,
                     "%pp: can't map BAR%u - offset mismatch: %#lx vs %#lx\n",
                     &pdev->sbdf, i, bar->guest_addr, bar->addr);
-            return -EINVAL;
+            rc = -EINVAL;
+            goto fail;
         }
 
         rc = rangeset_add_range(bar->mem, start_guest, end_guest);
@@ -374,7 +375,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
                    start_guest, end_guest, rc);
-            return rc;
+            goto fail;
         }
 
         /* Check for overlap with the already setup BAR ranges. */
@@ -391,7 +392,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
                         &pdev->sbdf, start_guest, end_guest, rc);
-                return rc;
+                goto fail;
             }
         }
 
@@ -401,7 +402,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             gprintk(XENLOG_WARNING,
                     "%pp: failed to sanitize BAR#%u memory: %d\n",
                     &pdev->sbdf, i, rc);
-            return rc;
+            goto fail;
         }
     }
 
@@ -425,7 +426,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove MSIX table [%lx, %lx]: %d\n",
                         &pdev->sbdf, start, end, rc);
-                return rc;
+                goto fail;
             }
         }
     }
@@ -487,7 +488,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                         gprintk(XENLOG_WARNING,
                                 "%pp: failed to remove [%lx, %lx]: %d\n",
                                 &pdev->sbdf, start, end, rc);
-                        return rc;
+                        goto fail;
                     }
                 }
             }
@@ -516,6 +517,18 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     defer_map(pdev, cmd, rom_only);
 
     return 0;
+
+ fail:
+    /*
+     * Leave no range collected for the request that failed: the next request
+     * expects every BAR's set to start empty, and a range left behind would
+     * be mapped or unmapped with it.
+     */
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+        if ( header->bars[i].mem )
+            rangeset_purge(header->bars[i].mem);
+
+    return rc;
 }
 
 static void cf_check cmd_write(
-- 
2.43.0


