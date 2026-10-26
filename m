Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E1E606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 00:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jqWvVCOZ
Received: from list by lists.xenproject.org with outflank-mailman.1461742.1672770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLUbK-0002Kn-9o; Mon, 26 Oct 2026 23:59:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461742.1672770; Mon, 26 Oct 2026 23:59:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLUbK-0002Kg-62; Mon, 26 Oct 2026 23:59:38 +0000
Received: by outflank-mailman (input) for mailman id 1461742;
 Mon, 26 Oct 2026 23:59:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xLUbJ-0002Ka-Lk
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 23:59:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLUbI-001mTq-KW
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 00:59:36 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6adfe968-e002-0a2a0a5209dd-0a2a45038f2e-0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 00:59:36 +0100
Received: from [40.107.209.42]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6adfe966-fae8-0a2a45030019-286bd12a1e58-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 00:59:35 +0100
Received: from BN9PR03CA0058.namprd03.prod.outlook.com (2603:10b6:408:fb::33)
 by CH1PR12MB9648.namprd12.prod.outlook.com (2603:10b6:610:2b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 23:59:31 +0000
Received: from BN1PEPF00018546.namprd05.prod.outlook.com
 (2603:10b6:408:fb:cafe::3c) by BN9PR03CA0058.outlook.office365.com
 (2603:10b6:408:fb::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 26 Oct 2026 23:59:31 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018546.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 23:59:30 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 18:59:30 -0500
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Mon, 26 Oct 2026 18:59:29 -0500
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
 b=DPU7hfR9d0myahnPwxUYUCceN7j3pbzBi+Q/JI4G8h8Y9sOAEhgHz5peGKPm1deH8nBpKONZbwwwpo/6gC2o2MFUpQTDWgIRPvqNxgHd9n313L2if3etVjXdYk7DLkMwhkzzICtY4pey0ZKF4AB/Ez+NHe0dEfHFkQQTViagryPKQjnJIpHKIZPybadf6bUe4Cg9SfRRdLVDXEnOVCYVuqsluXbSmFfd3Fw3hXqNid+9uQH6KhjZpbQmASsL+q+kMeXNyzZsXhjyiQtmInT5GaC9XW1RPV4gGTfzqHFrf1TrRVMspl3g2bi+yta15Ha0X2/kIr1A4GVbJCMM8mCJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWgMMYm6qraa7yW0VlmJDne9MS3CBCB+gTW/oD8hbgw=;
 b=LASdTsR/ERZal9GOdhfObaYIl0la3PujmrDM5Szoi6Ksh5k7NA7OciRGjZqJ19/FivcqqirvkLdHlomKHrft+o4SQxYJgAFlWrziTOXGz5LKQ4GMBlqq/8jT4LovN7C6droc35TecseC02cxfxQ88VRan4HF3ZaVARCBgMShHr2HLPehtrNJVdf4dgWOBPsPv4SGS8pzVSJwC1JxvIQBmIyHwh9o4W+nQRhJsQ4vj/GUQMwmzRSXjsngU8B0aydZZt35hh3sgVmEbtcb9a81UUyIIY54U9emZi+IVYG/CHDc6QawbY3Z376jE8ISzOqjH+7Y+cd/6YEeqAHX9HoO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWgMMYm6qraa7yW0VlmJDne9MS3CBCB+gTW/oD8hbgw=;
 b=jqWvVCOZsccj5jWiix4Cc74E501AEdPQ7mo1JilLKe2eugph2sBzA0uPqF0BmCn2T49k5Q7sXDfUIhOMpYr3k36B6K1YiNUc8BwPcNaTyKVD0pow4fjlAuCxtIBDSqX/ZG8Zc/KzEVt3Wj7dPJtRWV3cuQ4NCWu2GaU8R6lM4dM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger@xenproject.org>, <jason.andryuk@amd.com>,
	<teddy.astie@vates.tech>
Subject: [PATCH v2] xen/amd/iommu: record the IOMMU for alias DeviceIDs
Date: Mon, 26 Oct 2026 16:59:26 -0700
Message-ID: <20261026235926.2105578-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020221214.3683476-1-stefano.stabellini@amd.com>
References: <20261020221214.3683476-1-stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018546:EE_|CH1PR12MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f0e4ea-5063-4d6b-99ee-08df33bd2d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|6133799003|18002099003|22082099003|261026140227099003|10067099003|11063799006|5023799004|56012099006|261009223027099003|261022075727099003|261022105027099003|261021121427099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	zrB6f7I9YuWLKXUL18K6a/PMc8mUNXfFsCXquwM/Tf9jYAcGJx0hOhc7Px+5HDT+bAIZdG5JcnJWxFRcipvDkodi7ynz2SSUu3ftUEVHudCvd6UMXqB79UeGQ0j9MCqXoesGK9mjEJ+XR8vLayGIkbQ0dpYOtpECxz8ZCy9weIr54M4jNVmqBMMHk+7zaFXqdejjeASnCEiQZKgTfptHwmmqvfO0TnMtAAQgIvdprJiUCpOxLZFLp2tQhHB2TCU4MfhIRjvhjQS9qjlDR3iDBjymf9BHKalVeCFo56GjRitaCPvBOEhwBhshEoHaWEo0vIvDI6QbS6ru8Tzj8ZZ6/Vj0svJXyw3TtO7QM7h14OaxA1ZBqHAuINAaq+4Zn/9Oav/hnyHL7fQdrk1uFO/S34SH/uHkhx01hOLqqIgNaDtfhivxUrB5SeqHyHWHd8D9OYVxGzPl4+lUnJFIQOolvL7UJvtbO5PPqfTyfphxC+cMOKQ5HO3bzWdqexX6poQNHbbJSUcQNCSHzG2j/3zngIoz3vHmzG+WG9adtsjN/CFYYMh8xSurJPHGSz+DuHhBzLBZsFxlU9SQhPfycWvHtzySrqJI/0dXKVxx0bnfpO424C9mallpYKlTy3rKA+uaF35uTP8RhUfw+tgRVTTRUaIkguyUQgNhUWo3+3Rqt2Bm45PBefEV37JyqsnOqPSXDZySmtgFbANQYzFYtzmbyg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(261026140227099003)(10067099003)(11063799006)(5023799004)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FvgV1rR9k8DWCqWHE0llZDTVIGyl+ADHIeXz6iALF/9XH9ayiGI5iaindmhI8Ub3+pKmPNMZgprZXSvkNjw4rK/OYnhSedVlLLEMHTpyBhC4y0HuKeZB0p/XkVHFjy44N7K8d5Oc6NRzS/UYk+Nw5GpMc+IyFNj/UsTIkMCKIvjNqgapWWAV8ftNuVUO/UDoR62sLXL1IaWX+ojStHs2EiZghadLn/qBRwDeh5NFWZWOYCH2HtQRMAlyFHDLgbYUCY4uGnJe5GyFHdjwtcF+J0U75XHoTo6tYfV1PJHeJ7lLYxP1+VuxYnxXf8YISeZat7SxXz8/gdzCytcJiNoWlTjglkH82o18LRepbR9gPoUdP5LwHVjjehvdswe9BJw9KGXx3tPvKYKXd9MSVDU9zMAlhh+7BFwvAFwynpZjs9dtrvPFjjWbmZEmfLkPHJKm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 23:59:30.7811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f0e4ea-5063-4d6b-99ee-08df33bd2d16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018546.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9648
X-purgate-ID: tlsNG-33051d/1793059176-74C884E9-0F62AE7B/0/0
X-purgate-type: clean
X-purgate-size: 1834
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

add_ivrs_mapping_entry() marks an alias DeviceID valid and may give it
an interrupt remapping table, but records the IOMMU only for the device
using the alias.  If no IVHD entry names the alias DeviceID itself,
amd_iommu_setup_device_table() passes a NULL IOMMU to
amd_iommu_set_intremap_table(), which dereferences it at boot.

Record the IOMMU for the alias too, as was done before the interrupt
remapping rework.  Nothing relies on it being NULL: the alias is then
handled like any other DeviceID.  Its remapping table is freed on
cleanup and dumped by the 'V' key, a device at the alias DeviceID can
be added instead of failing with -ENODEV, and reserved ranges, already
recorded for the alias as well, are reported once under it.  A NULL
check at the crash site instead would leave the alias device table
entry without interrupt remapping.

Fixes: a3713b97e8e1 ("AMD IOMMU: Rework of interrupt remapping")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- describe the crash precisely, and why nothing relies on the alias
  entry's IOMMU being NULL
- add a Fixes tag

 xen/drivers/passthrough/amd/iommu_acpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index d118b36d80..d8ff4d24da 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -104,6 +104,10 @@ static void __init add_ivrs_mapping_entry(
 
     /* Assign IOMMU hardware. */
     ivrs_mappings[bdf].iommu = iommu;
+
+    /* Requests using the alias go through the same IOMMU. */
+    if ( !ivrs_mappings[alias_id].iommu )
+        ivrs_mappings[alias_id].iommu = iommu;
 }
 
 static struct amd_iommu * __init find_iommu_from_bdf_cap(
-- 
2.47.3


