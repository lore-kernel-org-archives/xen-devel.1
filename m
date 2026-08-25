Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD94C5DF94
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 06:24:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399053.1635265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wykZZ-0002Q2-Gs; Tue, 25 Aug 2026 06:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399053.1635265; Tue, 25 Aug 2026 06:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wykZZ-0002Pa-CR; Tue, 25 Aug 2026 06:23:49 +0000
Received: by outflank-mailman (input) for mailman id 1399053;
 Tue, 25 Aug 2026 06:23:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wykZY-0002Nx-BX
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 06:23:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wykZX-001HsD-9q
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 08:23:47 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8d34d4-bab6-0a2a0a5309dd-0a2a4509a984-32
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 08:23:46 +0200
Received: from [40.93.198.43]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8d34f0-be1a-0a2a45090019-285dc62b6adb-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 08:23:46 +0200
Received: from CH5PR04CA0014.namprd04.prod.outlook.com (2603:10b6:610:1f4::26)
 by CH8PR12MB9742.namprd12.prod.outlook.com (2603:10b6:610:27a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 06:23:42 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::94) by CH5PR04CA0014.outlook.office365.com
 (2603:10b6:610:1f4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 06:23:42 +0000
Received: from satlexmb07.amd.com (149.199.90.133) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 06:23:41 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:23:41 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via
 Frontend Transport; Tue, 25 Aug 2026 01:23:39 -0500
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
 b=UlqT/v8uI6IiJbJvn84yXdaH6jVZCpLjMZhqb8KySW4cUzz5SOJCbvPbkmr8KwCH4hxp+cnQAdWFHdxhwI6uwhgTUiVDt4XvkBkxQ8GPgAr3rQOUU9tOY45Nr+JgvRKBDG3b9M0yqZh1pSdqQdki8elzSwUWyrsLTcUlYB5MR+FNinTxBc+5LNrZTJfwu1ahaS7z8IwsPwf8hG5tRlEDBdrDx74Pg10vQisCUevO6B0Q4tHQ9bSkn3jnIrAR5wTuod/+6VaOV3kBWpNC4CSKsqXEcxGaX7ZHdlIe2CLT2BBtGQPzizcpGLvXD/pMllpeyjsD8YIuUxKVtFcwA66mWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0tG7LxrvduKAPMs/G1qHGRWDG7gX+0MAt1PYS3j94A=;
 b=YRq52nREsAAJGrsDA3pK1XpmdG2aahRiGvPfPyMJkGzrJyJgnEZnCcCpGdYvEMerer1PFBznK8RKRidxTJi3Dy06Lrpje+sT39EoQ2WTI1fEa2YHKXny0o6nDG5n8AZiiT++iHk5affvWkLraspJeWuLGwLhsjO1eHobgXMCp5aF2DG7XxgqMA6Q86D6Vuno7GL7pywPtXLeGmUf25jIZwZP0mZpGmy9esxRiIF2WossA4an62FDdOPh1wj/28tDVZSrd6MwlAj8BThjJsiH2EOnkVRfxqFEo3Ivhziloo/Kfz+F/OUIuZbOYn5Hbw7Usn6EXto0m+uNqOLR4yk7tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0tG7LxrvduKAPMs/G1qHGRWDG7gX+0MAt1PYS3j94A=;
 b=LEa3B8/GjREJYJivUoW2hkOG3JSRFGlqUKH8oXkMPsapmitN3jOE6nKVmsXMjNaKZXJzonaYzXY2MyjJ2eClRvSEhYv74Ls6Gv89uLkQ7SKqMfHzTxosKPpCLSCHQNwvnWoSN03LHn7+FpsqqpBteo7tt7zpKDX49Ww72XjBYKA=
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: traps: report level 0 faults in panic_PAR()
Date: Tue, 25 Aug 2026 08:23:28 +0200
Message-ID: <20260825062329.16762-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825062329.16762-1-michal.orzel@amd.com>
References: <20260825062329.16762-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|CH8PR12MB9742:EE_
X-MS-Office365-Filtering-Correlation-Id: 12248c47-8c5b-44de-9ecd-08df027168b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	cE8d0hOQ85Mn2MzdTgNgdWpwJw+OAIkKyZjgI0qZcs0JLiBQoCEBiJRomUBpgyGqjlqRztMO2JxbOnY+ueQtw54XpImgE4D/jHMn8ZwoTLSRkq+Gv/okw+p4nX6NHDmqytfDtEljyI4y3lBN0PAHVOBwVSB+sT58g2vuT/wrXoo9g1RFx+6mv57UVo7jiZWAleyIanYAIVZXWpSjB5C1k3rnoysjgOlmGvCraVFaAFmexejdeXshjOfyixK0Ylv2ugPGgj5HOH+QuQCvfWG6soQn/MDqCiPuvLAUlRSvmTF/1ZMPhHtArw8VGWG4bs9GxdwwZanEz3N9g0ViMz/huqGFeD6TCX/r1M8EH2daIqITqm9jxeB/VnpmBlupelcYoEz/dhoIWQQo/UcbAzNZFgPbobc33Wz3hVWM4lL6XW1We6o+wHAsZ1uQybhy3MwDgcOmr/m4saClU1YWVikgFhiRwq3E+f2sweayUbGThP3OZb42GDiYZffbx8kgNVGNMmZk6XLXyMtjcQMMOYVq2oWIWOB7q5iePFZHJcLZjJz0GnwEUKtvp8L3BttyQjf69ESgFUrvBHpOXUamtgA0HPP1DT4WzLd1QSdHNfezFgXrxiNxrKZQuYmNmpZVTAFKIt5rhaccGEmwF3SyRy3oinW08vlnRuCMTW6SkK0JtDOfYzolY2Y8TDhXnkh+KQ0jwQeMNK0j348Bar4AVD1ucg==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kiyoA7XlN1MvYiP/IEErxZ/mNadawhY6HPLOTtCZwo3oXQc+j0xleWmLMtmACKxZ+nq+h/bGHxR9uG2lfjDOXDUOz9nV2pOQziKUX8K+ZVAOVtWXXsSPZgLvCmALPESvGYsMNPkSyyEWwOvrSBvwyWr6QyyqudOzJHH1ECcIDffguWRqoHfMhZ7kRThSdbD90eem3Hk8ZTyYCvZH3OV8M/ROipB3E0RljU1Jty9wHnExH+16HZgrquAhkIrzK2yCJWHrRM2X9weEArQRhGG4gKQFtuTzG1Rkwo6xocUUPyOjw818uWwn9JkIcQIfEkr56/EJ7LcsoSiP7dljbIPo4DjTpj+Fg+fffoXSSrxVRmjidbpn0NMIuiFgitSTB2i8VlD4bCEK1C8+hmJlr7GXy0VbocUsizLY+A1b//sVo2UwNHR7ylntbxQ8HS82/5+e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 06:23:41.9454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12248c47-8c5b-44de-9ecd-08df027168b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9742
X-purgate-ID: tlsNG-bad1c0/1787639026-FCC15034-4C6AC49A/0/0
X-purgate-type: clean
X-purgate-size: 2420

decode_fsc() derives the fault level from the low two bits of the FSC, so
level 0 is a valid output: FSC_FLT_TRANS is 0x04, i.e. "translation fault,
level 0".

This is reachable on arm64 because xen_pgtable is the zeroeth-level root,
but fsc_level_str() has no case for it and prints " (level invalid)"
instead. At the time the function was created Xen used only three levels.

Add the missing case. On arm32 the zeroeth level does not exist, hence
guard the case by CONFIG_ARM_64.

While at it, make decode_fsc() decode also address size faults.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/processor.h | 2 ++
 xen/arch/arm/traps.c                 | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index a3753c317fff..509040a1cdc0 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -521,6 +521,7 @@ extern register_t __cpu_logical_map[];
 /*
  * 543210 BIT
  * 00XXLL -- XX Fault Level LL
+ * ..00LL -- Address Size Fault LL
  * ..01LL -- Translation Fault LL
  * ..10LL -- Access Fault LL
  * ..11LL -- Permission Fault LL
@@ -534,6 +535,7 @@ extern register_t __cpu_logical_map[];
 #define FSC_TYPE_OTH   (_AC(0x02,U)<<4)
 #define FSC_TYPE_IMPL  (_AC(0x03,U)<<4)
 
+#define FSC_FLT_ADDR_SIZE (0x00)
 #define FSC_FLT_TRANS  (0x04)
 #define FSC_FLT_ACCESS (0x08)
 #define FSC_FLT_PERM   (0x0c)
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 0c01f37ad6b4..dc0ec8a345ed 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -307,6 +307,10 @@ static const char *decode_fsc(uint32_t fsc, int *level)
 
     switch ( fsc & 0x3f )
     {
+    case FSC_FLT_ADDR_SIZE ... FSC_FLT_ADDR_SIZE + 3:
+        msg = "Address size fault";
+        *level = fsc & FSC_LL_MASK;
+        break;
     case FSC_FLT_TRANS ... FSC_FLT_TRANS + 3:
         msg = "Translation fault";
         *level = fsc & FSC_LL_MASK;
@@ -363,6 +367,10 @@ static const char *fsc_level_str(int level)
     switch ( level )
     {
     case -1: return "";
+#ifdef CONFIG_ARM_64
+    /* On arm32 the zeroeth level does not exist */
+    case 0:  return " at level 0";
+#endif
     case 1:  return " at level 1";
     case 2:  return " at level 2";
     case 3:  return " at level 3";
-- 
2.43.0


