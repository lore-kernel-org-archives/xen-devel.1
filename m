Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092DFC61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 07:36:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405210.1638757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fWF-0005Mm-3Q; Wed, 02 Sep 2026 07:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405210.1638757; Wed, 02 Sep 2026 07:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fWE-0005Md-Vl; Wed, 02 Sep 2026 07:36:26 +0000
Received: by outflank-mailman (input) for mailman id 1405210;
 Wed, 02 Sep 2026 07:36:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x1fWD-0005LZ-Vd
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 07:36:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1fWD-00AbTn-C2
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:36:25 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a97d1ea-2eae-0a2a0a5409dd-0a2a4504ea94-44
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 09:36:25 +0200
Received: from [40.93.196.2]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a97d1f7-b57f-0a2a45040019-285dc402c94b-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 09:36:24 +0200
Received: from BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::9)
 by MW3PR12MB4378.namprd12.prod.outlook.com (2603:10b6:303:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 07:36:19 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::6a) by BY1P220CA0014.outlook.office365.com
 (2603:10b6:a03:59d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 07:36:19 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 07:36:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 02:36:16 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 02:36:16 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Wed, 2 Sep 2026 02:36:14 -0500
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
 b=ruiZ55ql3MHuqd4kyhExdrhBVftriaLYAD+O/sZi7YkSA9t5frXV92mABVBkvDW+JSqZUcuvvw9jYCuC1jE8aPQCeFLnhhLk2PSpiNx5FsAoUkiBBCEkxtWmxHH7ub3y93WbYqYppfycAowjsAT4CqGXQad8ZlV4U7fg7LjR761ZXXo0xkPIWFU4Oq4hsm4VJCmG13lY6ug/PItsh1vxJs+eknIuZiEqeEcZpkoIabLplrjYlPYy53+os+9X5XepsiG325kXiYL0EG6qecZXmr0s+x/oyrGXmgP23pp/Z9Hd5bQvTUTiEmCtsOan1+bWpSGBAYSiH+FE3bHtxRG1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0Km7Tc1xeK6Y+oTde3bVSSHLb0d+PMC+KbuvBwG/aM=;
 b=HujfN4uzT9W7d0GdV/nXy9usB04kHIrD3uX5ZNQPdNPpKB0gk6JgML/lSfBftNZfIN6av93BYuTRSqRdpp3BcdzMLjr4vLkyxutxplLs/xlQVVtipfN4gT7htrpyMxQViN/FhYtpxsejVqI92tvF9lbSFHKbj8jnSzDuf9YSQ0uQML+EdyjD5jS1/oRPhsDMqqQIRMzuTn8mTEJ/ZJW/o9BORrL5WRCpHx3Lnodv35FZbsAVF7AINuDPj0fHoy1WaW2Ejx39ZnZ60NXQX6GdR2gp09Xtg6MKmX5CpgNHSJqMt/nzetHijKHX1rQVJVte2UKkJLtUBhJm8mdi1BQJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0Km7Tc1xeK6Y+oTde3bVSSHLb0d+PMC+KbuvBwG/aM=;
 b=I3c8IQ7KSO1LofH4zjhZliFbtI+dNawN3diSpQNmpHzCKej1DY278qabCB6uBB5oPt/vd6D3Wzv/qQAequPU0fckQW5LRp/4Tiu0URLmGuWIr5pAcXRPw3gp5Q0mibrU5a/H/vxSGGOxRA/tZkTesf7Xzrh+SVLlGn8xYfYZiNk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH 2/3] drivers/char: Check if console=dtuart for ACPI SPCR serial bring up
Date: Wed, 2 Sep 2026 09:36:05 +0200
Message-ID: <20260902073606.61062-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073606.61062-1-michal.orzel@amd.com>
References: <20260902073606.61062-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|MW3PR12MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1eebe0-8f56-4cf0-36a0-08df08c4e0f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	btRi+gCgVcVTQQ6LxvWDx1UoudHSu7iIaGZg63j3h2wXvVu+33S+JcYVLMl0xJLFO6852x/uPvkAAVfk5bHSuciI2NATt4qj5j45sb1/y2eEBwU91qgnRrSqHIOHywS/Aw5S4E6kEzF7QcDG8k0Iupnn3/V4CEGZayONddEU7OtULpjwHl/A/afbrKQ0vbpfOZ+vsm+SsX/0eOtbT5fPT9AKilJ8I5gkWdJWlamPZIFrJqRI+2FH8EIO0CGu1oUnn7iu9VJRjJ2/YbdevnBD6qTNfRttEWNV8413IICZxD8tNC1Gq6mCbyqEw7rI/0XgezMONI8osnsV4n9AvY1f3nFUm0c3m93bwb08049pxwIKtUi5ri5hIVtYYO5QOKlTfk4QuPOsUyX55pp6dvgyY/fjID0CSf7kPySXTaVxwga9CDeX8dic15dQBS3O2Qc2Ga745uKVuMHHonwofdvCQx+MTLUOCqzzDT1KpiyBAeG2IVtI1H7UFZMuM/4ne7+H9ajkpBYH1DNFUYqitSzuej5xZ44ty5kacmBkiGdI2kg7vo2n2+EbswFmz4zbqvjvoDTdp1qpLVzBW+4uHsE1PRuiY9oKPPMW2iZUzYucBn2VgtH0tdIaU+fMdJavzjcH2Kw4JOfl4GqUpBIwFzE+sZ3FXHieFlPc5JeJHKfgs7CKZLLvWw6SGNX0Xy9uCga9WuqvXik303SRsPeKGGUaxA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rvlXpI3B5D+dPkXML7sviu/KWyCWEs1w/Xn5xOGpnW2oWAbwrZXhvH7hdTrjpkDaqkS1fHSFTdbhMXUKesv/EP+NlT4WjKvCrAag+6KH4BCos1LBIPmoSMtl+XgpDen734sX0rtkc8R3L0FNKSD09KuT7mw+HevI0NTrmgrYX2ijmA3enZkt5uKniAG+j54BfSPdou4oBxVPJS3Y+N5FbZ/R71I4ITQJDxVABxanQKkJKN8LTPvceokYqoZXkFhz11BMVBrwMG63hd141wLX44KTrFNGwnjkjFtvD2ijwUsMu1Yt5kYsAZNMS7qY8P6s0qC9rpzwx9zvbC+yHILvhP+TxYMn2j2bw2zj3GsnEtasqK3HOt7yStgjH+TNN+mdFWjQVEh0f/aewtml/6YSzW605dgp867FNytmX98Gs82C75nEii14QucseBEcT79Y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 07:36:18.9334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1eebe0-8f56-4cf0-36a0-08df08c4e0f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4378
X-purgate-ID: tlsNG-ebf023/1788334585-C1CD7B50-13E7476A/0/0
X-purgate-type: clean
X-purgate-size: 1335

dtuart denotes a generic UART parsed from a device tree (back then it
was the only method, hence dt prefix) or ACPI SPCR table (they all use
the SERHND_DTUART serial handle). Currently we only check if console= is
set to dtuart in the DT flow and not in the ACPI flow. This means that
even if we set console=none we would still bring up ACPI parsed
serial device for nothing. Move the check to uart_init() to cover both
paths.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/char/uart-init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/uart-init.c b/xen/drivers/char/uart-init.c
index a2181399389f..eb7f85549593 100644
--- a/xen/drivers/char/uart-init.c
+++ b/xen/drivers/char/uart-init.c
@@ -38,9 +38,6 @@ static void __init dt_uart_init(void)
     const char *options;
     char *split;
 
-    if ( !console_has("dtuart") )
-        return; /* Not for us */
-
     if ( !strcmp(opt_dtuart, "") )
     {
         const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
@@ -121,6 +118,9 @@ static void __init acpi_uart_init(void) { }
 
 void __init uart_init(void)
 {
+    if ( !console_has("dtuart") )
+        return; /* Not for us */
+
     if ( acpi_disabled )
         dt_uart_init();
     else
-- 
2.43.0


