Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA87E606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 00:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=naC2xZtI
Received: from list by lists.xenproject.org with outflank-mailman.1493463.1693460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTU1B-0000JG-Jz; Wed, 18 Nov 2026 00:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493463.1693460; Wed, 18 Nov 2026 00:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTU1B-0000Hl-BG; Wed, 18 Nov 2026 00:59:21 +0000
Received: by outflank-mailman (input) for mailman id 1493463;
 Wed, 18 Nov 2026 00:59:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTU19-0008So-2D
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 00:59:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTU18-001be4-Ez
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 01:59:18 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afcf772-2eae-0a2a0a5409dd-0a2a450c8dc4-46
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:59:18 +0100
Received: from [40.93.195.70]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afcf864-f479-0a2a450c0019-285dc346801b-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:59:17 +0100
Received: from CH0PR13CA0043.namprd13.prod.outlook.com (2603:10b6:610:b2::18)
 by CYYPR12MB8749.namprd12.prod.outlook.com (2603:10b6:930:c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 00:59:13 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::a2) by CH0PR13CA0043.outlook.office365.com
 (2603:10b6:610:b2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Wed, 18
 Nov 2026 00:59:13 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 00:59:13 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 18:59:11 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport;
 Tue, 17 Nov 2026 18:59:11 -0600
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
 b=yob/SdrZqF2hsNu1CgjxYHSjNpDGqh7Io3AAUehmNM0L5kf/IQNsQkk7TUMSltNN3lKuB+qgTqJNGL0L0jIxa3QH8SGYaNxkDw8nq6rPEO3JueTu7yNhMVbG6XG8F5QFh4q6sPn2/jprqAedAA/b2N3ZrrQQ/Oh1ew2BJjFbJcCSDj7y5JmVeYTj4ghxMAQ9oQ/GAz0G3wpTcmWqf66ngCWBD4XAzmR9Hu2IXLfldbZBXK9b/7ljoopjCLU0p9DftMg5HpVNreaCl5mBWxol+G2vFmyIqLy4amHHlQgMzXZugxl+CFm//zt7wEvYUDbRLimnhBmyuV35dpRyjxXQzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lSVKmVILWUNX9Yz9FopKb56munjdEwyjPP/YA5wEzg=;
 b=FkuhLoxOqMFwyf7ouxValiS9+tUwZ1hqOGzRunY3Kn/OCvs33qmeNtxPuyGCpKAYFynW/3nLZD36m/HSKYE1zuu+BtKiOnn1cRRWIGL8auPD407n3VsH6Q3PRcuUdAjR3aBKZJMnGgLALe+2fWPepWp+DwdQhr5rBr1AI/X2rFOyqOKFSrV0nSs1dkEApyKM3H51EPG0GrPXiR8h//VOMHpAs6d/3qkATSguf+dLAkLI3Sty/YR4HJMIviziZtnCGZfmY0ogNdCDDqZ9MGpxRCG1enPyRHjPQfir4Nkrp3J3kp6EtDsZI3p3yf6ZSuWSn8/Pb6Y5A/ZJ166y5eJXPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lSVKmVILWUNX9Yz9FopKb56munjdEwyjPP/YA5wEzg=;
 b=naC2xZtIGFeeP23rQVa2GSZ/E/Q55doKrwPyL0jnlZe6pHm+sQDlmTCADa86IbrVzzsXtaxtlc3jcxxbOZ7CmHnssz3o29kPMesb5YgIMll4Nm94x/sb+ny4K1UITczrX91SEk3TU7A9A2+RtXe+T38U1UalY8n/cIFZh4gpMyA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: [PATCH v2 4/4] vpci/header: empty the BAR range sets when modify_bars() fails
Date: Tue, 17 Nov 2026 16:59:03 -0800
Message-ID: <3176ea70c0e09c051e9d1d357e707016b1515d5f.1794962603.git.stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794962603.git.stefano.stabellini@amd.com>
References: <cover.1794962603.git.stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|CYYPR12MB8749:EE_
X-MS-Office365-Filtering-Correlation-Id: b4dd1a68-fff5-451a-d466-08df450f2965
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|22082099003|18002099003|11063799006|56012099006|261028144727099003|10067099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	w4vbiXplphx2jtpZ6AiGzlvScLK83REvWVtkRKv55B94msZNHJ0eHCUBLgZ4/e+hK4+y6Vk7zdRx3L3MEUElX63gifwTM9G3Rl7h7fRNXuvGBgRQxHV8nt6tf5NJ+teShP0Clhc/jNLZvx9B4dy3ke3+BBziroG0IcetuI+KAeUiXnE8+U0BPfSrN5CzjNBCTuusItkMm/+1708ad75pfftIjDaxHo86Ckq6oHo+J0QQO2Tsga7HMd8hGgrFx3/AatZuLjvZftvZuqkCsN9ywL2aVZUskP80T9O+DAfP6NDkhFlfQBzoD6WUAbnkOHZcWXfxOa+kVJdAL9zIwsVIE5E+/ukxFH4kMNId5dFkjdZFixAXz9xGrzjgIvsN6IDROPYjyx8H22o/3K+dLELNVzRcxbPgJ+pfcY+5H8/PTOxsSoH+ynow0wM8fyrfePg94oLkyeXu7AQXuXu4P/Cd1au+6/aymK6gda/rbEByDygJCqkDVYoSiOGUoRxATtj7+aukX/lTmUFNdHom7OG7BvtXUfWRHr+irTa1O04LxU/XRKUrO5/posO8rlAhxrt7oXWd3LxoH8hOe9FUSZkXtW5yzW4mEAPRRDa6sX6OBa/jQmLDmvMOu36N6i1Kp3uHu1QBoBm/YDTPdHfVpQqg12rUqIA4myJSSx1I8VryIMiGnQ6M9b/PP/Ln87j+FEHmASLa3rdD1Ht/jjaCvrLX6w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(261028144727099003)(10067099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+x/e9GGoyjD6AK5WGyRNiuNpLFTsXKEEo8EoAVR9tCrmb9Kwa2ABRk0TLInzMrN7lDRe+01Fxax2W+cPQUjI8DnPLEAy5jhEoWSR6YyiA/n/V9gsQL9m8tivA+uNR+1VZJTMS4Bbg/cipEGtBg4yntP/h/c0y1P/voDqLHp4bbguQUAJ8ETwRJogiw5HJ546zuJcQMvd6EAoGdZrE5VSMCji+7cTOQXc9asNu4hXvPp7M8daC7gP9FUy3KuFP2o7R4rf0tX+RzNCrDq6YshD0vah5yTOyXZYojohWUMVJZFm+H1cmMEIssdF6LqtYR2jdIyBdwSrzH/jJsauMLNWzy77fYy5o5ffpvPUwYEI7Fo+4XA2BcXEEGMEhVPqPIfuOPx5x408bd521f6b7t28Z/47wnkh56Gw05DXaZ9O/ETlJV4DtibRx6iAFwgPDilX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 00:59:13.0612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4dd1a68-fff5-451a-d466-08df450f2965
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8749
X-purgate-ID: tlsNG-d25034/1794963558-006CEA5B-C0CED64C/10/78276251493
X-purgate-type: spam
X-purgate-size: 4033
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On error modify_bars() returned with the ranges already collected still
in the per-BAR sets. The next request on the device then trips the
ASSERT(rangeset_is_empty()) at the start of modify_bars() in a debug
build, and in a release build maps or unmaps the stale ranges along
with its own. Purge every set when collecting the ranges fails.

Fixes: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Cc: "Roger Pau Monné" <roger@xenproject.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>

Changes in v2:
- Mention the ASSERT(rangeset_is_empty()) in the commit message.
- Move the Cc list after ---.
- Add Jan's Reviewed-by.
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
2.47.3


