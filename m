Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9978EC61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 07:36:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405209.1638744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fW9-0004xi-Ry; Wed, 02 Sep 2026 07:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405209.1638744; Wed, 02 Sep 2026 07:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fW9-0004xU-Ou; Wed, 02 Sep 2026 07:36:21 +0000
Received: by outflank-mailman (input) for mailman id 1405209;
 Wed, 02 Sep 2026 07:36:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x1fW8-0004us-MJ
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 07:36:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1fW8-006Bv5-2z
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:36:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a97d1ea-8faa-0a2a0a5109dd-0a2a4505bca0-36
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 09:36:19 +0200
Received: from [40.107.201.54]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a97d1f2-4cb1-0a2a45050019-286bc9360c1b-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 09:36:19 +0200
Received: from BY1P220CA0044.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::10)
 by PH9PR12MB995114.namprd12.prod.outlook.com (2603:10b6:510:426::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 07:36:14 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:59e:cafe::a1) by BY1P220CA0044.outlook.office365.com
 (2603:10b6:a03:59e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 07:36:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 07:36:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 02:36:14 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 02:36:13 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Wed, 2 Sep 2026 02:36:12 -0500
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
 b=Ffia8CDU6d0Vbp2q3VpONepV6pXgvCBR+kHtlKQUAXqgD9XgkkfzdIKoO0BKVmpjghuA80B77ZPB3Cp1cuF0XtavZOmxJv4go2Ikpy2QzPalEw7d2DPgSTXhrZjHapcz2VqLiVvKhkQw172FPq6ZdL13Nf7ydrEqA1V5ymLEmOEG6k52beoVclUqwNoU0M2pb+wfd3coiHDvFhfGMrwy0QOi31toV09GD8LdgAd8WpE+aRhX+3dms7J8H7zqtY6CNkKi6UygltAtEHtEHt24KyJZ/GXX2qiDUTQy11a0+RZf/+EXmiDV2crOZ6Dyng3BffHlhm7G6IeoeQP+Q6FoJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHPYvwj3xZPuM6fAr56NZQu/gReDAWZUwAt7EEUP2/Y=;
 b=UoZG0bW0NIgJq1t4fCSFP0qgxEPhTwb345tAHLJo2Ghq3O1YK3d/4DyvpZlZhNV7eReZO/qWswCIM7HDRLP0/aIBZ9/17NS6gTcjDchEmY1u4/f/f5Fs+BH5p+3SyjmkBGtpT9VIF7AeLM908bSUEwSnudmej2d9XZJ7frp4CW74CLbVdP8419oDqaWcXQE37SSZNd8n7fWBRrEStsOC5HUenrgGZkrjVjAY/+H/ZLhvTGV98PrFQmcce7KFyTXZc9cYbvfH0Mwgr7x89z0vwVkvOdTUHLb9YAfTuKZs2RMD7Qx3uXzoPVekZrctBNbtidubVTWutkBhq5TiHejnLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHPYvwj3xZPuM6fAr56NZQu/gReDAWZUwAt7EEUP2/Y=;
 b=h/FaoH9rAG4//TJWOb98rqw0bURm1CP+UPd6fwb9hHA+DgPPW381HiU2Q4BF5JrVjp7xqmc1XJzYadkFXEhqnmdezS5sGo7ywOZ9iZhZRptdIOCbC37uWyPXUMdbadMMjR1fb9njmDUKjAgjXSsxKY6qGEbefyh2HkIA9hr6KcA=
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
Subject: [PATCH 1/3] cmdline: Document console=dtuart option
Date: Wed, 2 Sep 2026 09:36:04 +0200
Message-ID: <20260902073606.61062-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073606.61062-1-michal.orzel@amd.com>
References: <20260902073606.61062-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|PH9PR12MB995114:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b67b044-ee8f-4be9-31d7-08df08c4de45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ggNiMFDikYcJUCWNuA87/1e1LSPNa4WJdb/ZaRkA0CLWCk04BfbRFP87bj6DVlPURGVspdHMBwk0ncN8YKNTq1Wny24FOWn4lD6NxsrTF6sqOFbN4howbjbmHA3ErzCeyjnWKnADL4b0EiayX0x5PwfaX/WBXFZ28zbhkdBY77VSe1DU3SwfwmpNHJ+vyUenmX4Ct8K86IDCBN63cKzN+hG+SSWnjpJAE90z0aObzBsCeo0c0BHMrvhgJpFSfnTiCa5ZvQi6uR0bFXeZJpRwprVaKYR9oW/zLNC4N64Y+QXualnN5DL3V6DiiLSX3XyfpBy4GAZruTwTh40x8+nRobkmBrDiF/8PrNaIF8aTOUkprk98oW3wfsOCz9qxjhUh8jtbAq9OdBSWbb0ny650A0VzLtye05ToPFqbuVxiGajRu4/ULu+PuD6UaKnPT/+bRwsUB0g34odl4NYAsGR3jHkLC+x+BK2cgrcYbyNImoDoloorYD2++PQt6tHmsR9Zhj5CR9KAiP4cTwFI37nxNCA36T7PaPIs2liEYitjDXjHh9Hzdqojy2xfBE9ky61BdlRM/Nw+I0RVNqs8KVucal3Sjk9s/j+uxN02XjlO0itar5H+Xui2RF/ga3YlfEsh9sAHEZtrD99098eydd8DDfUvfM8pdTBn1f5rrovAYXyJhMbcc2Ln8f6+8XG1+/wuOQXjt/+Vwa6PnahDew6a8w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JCT2R0RDJWSfLSKMm2og5i6hbSYE/spt0vyAUDXnzOS+gskgAG7E7KxAk8flBg3xk50UD7sWPw6qJlTm1UJt9Giq+9ooWYS8v30YlxssgHzkk70BX77rf0aNp2/LUS8ZEOO1AuM6lowDYs7fNGy7iv2x+Uhj6gE9utzEl8R6TGyixJs/OXRGME8C+rwimXhoGhscs+TnE5VvxURXAjjWYIwzwbRx9E601lauMipDl9jcopZYbf0Uiv/DkTXSTRyRObMiDXGt12s2vzSZaGwMxet1KfpUv6wZUMG7kZaARI4uMak80OMDQowBYHORiGLeV42Z7vCZQCxquDb1q7zDJ9Lb18A8PAcFy2cxLyVkm8qN59kb5sRVPY/vUwlhfT3KAFRD3vd91ItTgfeSD9hqWMsm7dKc2gYW43fgw67rrja+1CJ3bzIm4vYf1/vcsvJH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 07:36:14.4863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b67b044-ee8f-4be9-31d7-08df08c4de45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR12MB995114
X-purgate-ID: tlsNG-c201ff/1788334579-73ABF2A1-4C74B2B8/0/0
X-purgate-type: clean
X-purgate-size: 2214

Document the default console= option on Arm and RISC-V that is
"dtuart" indicating a generic UART parsed from a device tree or
ACPI SPCR table. This serial utilizes SERHND_DTUART handle.

Take the opportunity to:
 - fix documented x86 default to vga to match OPT_CONSOLE_STR,
 - mark dtuart option as available on RISC-V,
 - document fall back to /chosen/stdout-path.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misc/xen-command-line.pandoc | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1c711fa98086..3a416a38b74c 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -430,9 +430,10 @@ The following are examples of correct specifications:
 Specify the size of the console ring buffer.
 
 ### console
-> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | none ]`
+> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | dtuart | none ]`
 
-> Default: `console=com1,vga`
+> Default (x86): `console=vga`
+> Default (Arm, RISC-V): `console=dtuart`
 
 Specify which console(s) Xen should use.
 
@@ -454,6 +455,10 @@ compiled with `CONFIG_XEN_GUEST` enabled.
 
 `xhci` indicates that Xen should use a USB3 debug port.
 
+`dtuart` indicates that Xen should use a generic UART (parsed from a device
+tree or ACPI SPCR table). Only available if Xen was compiled with
+`CONFIG_GENERIC_UART_INIT` enabled.
+
 `none` indicates that Xen should not use a console.  This option only
 makes sense on its own.
 
@@ -1069,13 +1074,15 @@ affinities to prefer but be not limited to the specified node(s).
 
 Pin dom0 vcpus to their respective pcpus
 
-### dtuart (ARM)
+### dtuart (ARM, RISC-V)
 > `= path [:options]`
 
 > Default: `""`
 
 Specify the full path in the device tree for the UART.  If the path doesn't
 start with `/`, it is assumed to be an alias.  The options are device specific.
+If the option is left empty, Xen will try to probe the device from the DT
+property /chosen/stdout-path if present.
 
 ### e820-mtrr-clip (x86)
 > `= <boolean>`
-- 
2.43.0


