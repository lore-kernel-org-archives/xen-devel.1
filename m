Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511D7C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 07:36:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405211.1638766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fWH-0005cK-Cm; Wed, 02 Sep 2026 07:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405211.1638766; Wed, 02 Sep 2026 07:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fWH-0005c8-9v; Wed, 02 Sep 2026 07:36:29 +0000
Received: by outflank-mailman (input) for mailman id 1405211;
 Wed, 02 Sep 2026 07:36:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x1fWG-0005Yd-7a
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 07:36:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1fWF-00AbTn-Kp
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:36:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a97d1f9-2eae-0a2a0a5409dd-0a2a450489c4-14
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 09:36:27 +0200
Received: from [52.101.56.28]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a97d1f9-b57f-0a2a45040019-3465381cd0e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 09:36:26 +0200
Received: from BY1P220CA0039.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::7)
 by DS0PR12MB999288.namprd12.prod.outlook.com (2603:10b6:8:424::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 07:36:21 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:59e:cafe::18) by BY1P220CA0039.outlook.office365.com
 (2603:10b6:a03:59e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 07:36:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 07:36:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 02:36:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 02:36:18 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Wed, 2 Sep 2026 02:36:16 -0500
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
 b=YEzISwQ84XgqB0ZzR1HbpBwRw+me3Pm80+4F6xlRKJhI6NXRTtSV4PxrT+74THsr11Et3WcIv8q3uRncc6FN5s5+stBlH7sE/9mOlkjsUq+djPzR+cipHZEvL6QirrbxtrqYWhc4j3zMFlhJSLx6d+jnNa6QJbRWDT8t1HtO3KpQGmVMz2JTIdn9ArF+ongc+KECMzJH3Z1y1Yv2mtw0ZDFnwBWVHLMt5hWYUCP6Acut2yK+lD1kjjceAATQOz904F5BrMRgeahIUmB2RlWBEAHTnPraOVVNYo6nd/kmd652cheIz5rjWuLGSRue+Qcv7y8gF+xVilFeTSjPGdd4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoClwoPRx+rVoH90jrgZnJbWUIYvOiLRrYE1TxOYvoM=;
 b=T/vfSFtavqWzoFZbDgXyBYju2y2P4tItG7FhM6FaTgjztusA8oVXEl4yNlZx5gk0VF9mlv5avoPqv73a2Y2YiCX727LtQRvT/AiC2ophep0DzpV0hYlXj6J88ly+qfvvjL8T0U153FzhV0cF2N080sRT+nZIwCnpS0h2noElyy+wes6uDIB8ZbaKhHZydy+DkmIRKnxLtFneGKt4D5uQsEV8hGpxGE19MsdEl9SIOCx/LYWTS/nZJVgI/TvzX60Zb5Vm8mRmVC6rY9FUH4N5TJXl0VwElWholBDbJaeKkrB9J2Ozv8skObY4XsLt25JJ2R0cHfDxtsBqVtlEuZ+8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoClwoPRx+rVoH90jrgZnJbWUIYvOiLRrYE1TxOYvoM=;
 b=EmUbQ9CX1BNWXRkVkEDtf6WxAN5IVgkgHxENnWLjPT3VoEORydAAiR4h6xV6ze9hQX0rxt3M6YvFUd1mjGQl3m0WUsvtcWIXs03ZNE6I+WPsQ9M47SGuCBAQ3l8XouLJPwWTLnN1T7d+jsOjXoHLz8p7Z1JXDywo77n+UmGuHbc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>
Subject: [PATCH 3/3] drivers/char: Panic when the requested UART fails to initialise
Date: Wed, 2 Sep 2026 09:36:06 +0200
Message-ID: <20260902073606.61062-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073606.61062-1-michal.orzel@amd.com>
References: <20260902073606.61062-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|DS0PR12MB999288:EE_
X-MS-Office365-Filtering-Correlation-Id: 10646f25-b374-42d9-bd4f-08df08c4e20c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|7416014|36860700016|376014|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	LYXTnWg8pzguaX9iGFTwT6p5KPwjpciyLG7VqkPx6xyd8VPMnE+ubyLfIxUoP3ejSc0PHi7tOGSPnW4OOVt2cwu9GdfT1aptwZwkpoucw8sljxUGAmJObCgCE4FF5XXnLbACiU73PK/Nd6lEmZ7Hwfu6+nWBgFv6fJmGKo5kTCEeXFjbXDcsWx9DZ/xJesXoBs6MPzcnhJ8lUCVEYwVXZWwpaeWWESz0b4r7LbLTUCg2Mf9YC4HlMBs7yRkpewc2PExOnZnYf9wLUp4+8lGo+LmbhrmPKERdwGMc+7FmTO3RZAi0CIfZTJUY46WHk4Htj/id/KrekgwhRBcTtKLW+/EQQ/84FDW5+8JAkEjlxvS30Dmh39IvUTmmoeEA8622BogqsFODlWwMo6UHvsHfoyJB96m1LgRQooknyfqybSpfpQouXypD7eX1Hw6Rdrhk5HLHqMByXB7xG5yY+NnyfUHsbK9KPRXvIWuyxDMXlTKOXfNoSBg5AqirZN4Hp7Db0Ssuwq31BzrGJdUpTFtbbIE4fRbBuakBw+V73PbArzcgMo3DdlehwqQVYbPrcqXxX20mSpKpcyF43Z1oHR/jW+i/PWSrxNmpiuuQMh4ZuvlCYtQPw1pKW/QO1/KuJ5NU/JwVpjCkZIDUQfpCfzq++UQW0L6pPd/xdKzv2HDby+eXs4D1iy6Xu+Veu2C985KbnvyFj+4q5JhBPdDcDs0TAA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(36860700016)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BwZrWZNkPynlZPPvZqrDT2AI9+Py690EvaCNAH0keNnP8DMMVwNYAUqFqDl/zLGEI9pqdKtGHWnfe7O5vx0egH6fJyu99dFPnQDENCIE35utYf5ZLpK3jl1IB/SIQLr5AnX5aTiJSRwZa/9bKp6eaoCzc/VJQKsnMEQq2pLdwPkaKpYMTuzxljR/YKtcJQiMEKZBPP3XCk7q6+q4DS36xfqiEez4j0pi0dbM0WDSfsZ4pwnIBtVnR53+2LL1SUHxlVkz/Jx9lnb/MPF11otp7mFLnDiD8xtJSlc4Z1q+d8JpCXh7qpjq3N36dLU1ZNeSHTPkW24b0a6cUAnXcBV0gyuXJW8Ywn2MM2vWq6UiYnHCyZdLydsdlMMMG7peb2mp0yxfxMEcWifVuA4T08zUFdQpo7UH5BvOwQ85/qNP6NLcVh1SQT7COIb0xNqpSWHA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 07:36:20.8276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10646f25-b374-42d9-bd4f-08df08c4e20c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999288
X-purgate-ID: tlsNG-ebf023/1788334587-C08D9B50-FA0CC9A4/0/0
X-purgate-type: clean
X-purgate-size: 6552

uart_init() cannot tell its caller that the UART the user asked for did
not come up: every failure path only printks. Arm and RISC-V carry on
into console_init_preirq() and boot without a console, rather than
refusing to boot as they do elsewhere when a user request cannot be met.

Return an error from dt_uart_init() and panic in start_xen(). An
explicit request Xen cannot satisfy should stop the boot rather than
silently degrade it, which is what start_xen() already does for the rest
of the boot configuration.

Only a path given on the command line counts as a request we have to
satisfy. Falling back to /chosen/stdout-path or acpi_uart_init()
therefore never fails. SPCR is firmware provided, the analogue of
stdout-path, and there is no ACPI equivalent of dtuart= to make an
explicit request with.

While here, decide whether the SPCR table was found from the returned
acpi_status rather than from the table pointer, which was only NULL
because the caller initialised it - acpi_get_table() writes it solely
on success.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
With this change diagnosibility decreases only for a single scenario:
when dom0 is reachable not via console (e.g. network) and you'd have used xl
dmesg to read messages from the conring.

On Arm (I suppose RISC-V is similar), given that safety becomes the major
use-case and we need to satisfy all the user/guest-xen contracts, I think the
patch moves us in a direction we already chose (i.e. we panic on every boot
failure where we cannot meet the requests).
---
 xen/arch/arm/setup.c         |  5 +++-
 xen/arch/riscv/setup.c       |  6 ++++-
 xen/drivers/char/uart-init.c | 52 +++++++++++++++++++++---------------
 xen/include/xen/serial.h     |  6 ++++-
 4 files changed, 44 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6310a47d68b6..d0066db42e7c 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -379,7 +379,10 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
 
     gic_preinit();
 
-    uart_init();
+    rc = uart_init();
+    if ( rc )
+        panic("Failed to initialize the requested UART (%d)\n", rc);
+
     console_init_preirq();
     console_init_ring();
 
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 56a0907a855f..07f46ac3ce27 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -77,6 +77,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     const char *cmdline;
     size_t fdt_size;
+    int rc;
 
     remove_identity_mapping();
 
@@ -149,7 +150,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     intc_preinit();
 
-    uart_init();
+    rc = uart_init();
+    if ( rc )
+        panic("Failed to initialize the requested UART (%d)\n", rc);
+
     console_init_preirq();
 
     intc_init();
diff --git a/xen/drivers/char/uart-init.c b/xen/drivers/char/uart-init.c
index eb7f85549593..b79135be9620 100644
--- a/xen/drivers/char/uart-init.c
+++ b/xen/drivers/char/uart-init.c
@@ -30,15 +30,17 @@
 static char __initdata opt_dtuart[256] = "";
 string_param("dtuart", opt_dtuart);
 
-static void __init dt_uart_init(void)
+static int __init dt_uart_init(void)
 {
     struct dt_device_node *dev;
     int ret;
     const char *devpath = opt_dtuart;
     const char *options;
     char *split;
+    /* Set on the command line, as opposed to inherited from /chosen */
+    bool explicit_request = strcmp(opt_dtuart, "") != 0;
 
-    if ( !strcmp(opt_dtuart, "") )
+    if ( !explicit_request )
     {
         const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
 
@@ -62,7 +64,12 @@ static void __init dt_uart_init(void)
     if ( !strcmp(opt_dtuart, "") )
     {
         printk("No dtuart path configured\n");
-        return;
+
+        /*
+         * console=dtuart is the compiled-in default, so an absent dtuart= is
+         * not a failed user request.
+         */
+        return 0;
     }
 
     split = strchr(opt_dtuart, ':');
@@ -83,48 +90,49 @@ static void __init dt_uart_init(void)
     if ( !dev )
     {
         printk("Unable to find device \"%s\"\n", devpath);
-        return;
+        return explicit_request ? -ENODEV : 0;
     }
 
     ret = device_init(dev, DEVICE_SERIAL, options);
-
     if ( ret )
         printk("Unable to initialize dtuart: %d\n", ret);
+
+    return explicit_request ? ret : 0;
 }
 
 #ifdef CONFIG_ACPI
-static void __init acpi_uart_init(void)
+static int __init acpi_uart_init(void)
 {
-    struct acpi_table_spcr *spcr = NULL;
+    struct acpi_table_spcr *spcr;
+    acpi_status status;
     int ret;
 
-    acpi_get_table(ACPI_SIG_SPCR, 0, (struct acpi_table_header **)&spcr);
+    /* SPCR is firmware provided, so nothing here is a failed user request */
+    status = acpi_get_table(ACPI_SIG_SPCR, 0,
+                            (struct acpi_table_header **)&spcr);
 
-    if ( spcr == NULL )
+    if ( ACPI_FAILURE(status) )
     {
         printk("Unable to get spcr table\n");
+        return 0;
     }
-    else
-    {
-        ret = acpi_device_init(DEVICE_SERIAL, NULL, spcr->interface_type);
 
-        if ( ret )
-            printk("Unable to initialize acpi uart: %d\n", ret);
-    }
+    ret = acpi_device_init(DEVICE_SERIAL, NULL, spcr->interface_type);
+    if ( ret )
+        printk("Unable to initialize acpi uart: %d\n", ret);
+
+    return 0;
 }
 #else
-static void __init acpi_uart_init(void) { }
+static int __init acpi_uart_init(void) { return 0; }
 #endif
 
-void __init uart_init(void)
+int __init uart_init(void)
 {
     if ( !console_has("dtuart") )
-        return; /* Not for us */
+        return 0; /* Not for us */
 
-    if ( acpi_disabled )
-        dt_uart_init();
-    else
-        acpi_uart_init();
+    return acpi_disabled ? dt_uart_init() : acpi_uart_init();
 }
 
 /*
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 8e1844555208..3a71da767dd7 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -170,7 +170,11 @@ void xhci_dbc_uart_init(void);
 static void inline xhci_dbc_uart_init(void) {}
 #endif
 
-void uart_init(void);
+/*
+ * Returns 0 unless a UART explicitly requested via dtuart= failed to
+ * initialise.
+ */
+int uart_init(void);
 
 struct physdev_dbgp_op;
 int dbgp_op(const struct physdev_dbgp_op *op);
-- 
2.43.0


