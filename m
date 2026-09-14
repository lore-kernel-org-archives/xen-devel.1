Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6701EC88E73
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 21:38:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420749.1647274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6EN1-0005b3-I3; Mon, 14 Sep 2026 21:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420749.1647274; Mon, 14 Sep 2026 21:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6EN1-0005av-Dk; Mon, 14 Sep 2026 21:37:47 +0000
Received: by outflank-mailman (input) for mailman id 1420749;
 Mon, 14 Sep 2026 10:50:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Lei.Huang@amd.com>) id 1x64GK-0007R8-AL
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 10:50:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x64GJ-00FQGd-64
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:50:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Lei.Huang@amd.com>)
 id 6aa7d153-e002-0a2a0a5209dd-0a2a4501dfa0-34
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:50:10 +0200
Received: from [40.107.200.21]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Lei.Huang@amd.com>)
 id 6aa7d160-5984-0a2a45010019-286bc815b109-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:50:10 +0200
Received: from PH1PEPF0001330C.namprd07.prod.outlook.com (2603:10b6:518:1::1b)
 by SJ2PR12MB8650.namprd12.prod.outlook.com (2603:10b6:a03:544::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Mon, 14 Sep
 2026 10:50:00 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2a01:111:f403:c902::7) by PH1PEPF0001330C.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Mon, 14
 Sep 2026 10:50:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 10:50:00 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 05:49:59 -0500
Received: from localhost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Mon, 14 Sep 2026 05:49:57 -0500
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
 b=xQ9tOJm+K6dWjjze29Dbch5nS/aX3hVLlSii86/apwzsSjA+4LyyE4jWrkfHaYjaHz2ZgsbQguOsmRuczF8zdGZD7xjHejWeTp/SOocO46Cv52VYj9N7WkJRzC/jVfZDcq8FsMBBaO9Lwq9S06y7ctd3crVZ41NQjGkrFu2CEIyQ5BUzpR2VGxnsgK/0rtY9wl8NzL3STqSD7x89U/oSSinY4tdJBJh+lUKrDgwc8nwAFfBZR/CNXZm+svI87DyyFROhGsmPc0rtR5UxWXFvMx4yUNnuJMURy9opwvwTef+pfhM+K49vijR1KwTw1lfxaAxbwgILsn3u+F+qa/C7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmMNrl28IFnlEeTDxgaWxQyRK4ELYjXjpeG1ntvUuIk=;
 b=ht3YLv2woc0ZTw7W4egqmS85qhglS5DLWdqDq2iPT6G3d+9OtFf5O3HQEn/35rlH0IyA+VoMe6WcltKdhsWosdQj4cF3Tq5Sg/93iRRarquNEEyK7o+4bvyC1TBtJMPE/VwVlDDwVPt20i93SrEmOYRm9Oh29RsSgtaMc0RS1ZS7BXAEUSNPnG+0dhn9TMn86axeWB2IvIth/0oqa6T1cItglqbiUyKHSxhvIFyVsJOYG62Iq2/r51tYlknp+2V0g+/+6czedNA1KrPUpwhp9/kc4S5Z8UvnxRBHRtgabjCA9jo39hqAxpMaiX98R8JOOeDN8dbfcEPucTYUecbelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmMNrl28IFnlEeTDxgaWxQyRK4ELYjXjpeG1ntvUuIk=;
 b=Jl0fEjIb4iPLwwYuzGL1KDh2woqfkR4bRVcGGrUKyyfXad4bx8EPIJQMR2RluRT0NZddoka0QVslC7J5kj1r6p11UEiPNXpMHiS7jqDwqSbEoDRZHbhtiwP2mhD1Bu+/MF/DebxnCG5SI+5qEFy5wGNIpa4eCwQRzJU4UCrm+Rc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Huang Lei <Lei.Huang@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	<xen-devel@lists.xenproject.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <Lei.Huang@amd.com>
Subject: [RFC PATCH] xen/manage: allow forcing shutdown without a userspace helper
Date: Mon, 14 Sep 2026 18:49:45 +0800
Message-ID: <20260914104945.637-1-Lei.Huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|SJ2PR12MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: f7e4f340-7021-4ae0-2a3e-08df124dec9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|11063799006|56012099006|6133799003|3023799007|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gXExf+TgtiNmjVO4iBrwlEnf0HIrY5FHbJrpc9QovqsACB8CifaKkI9N3ztVreeje90+631/Ma0Um8QnacXCiNkNORDyBvjUnh/VwxMXEEun3HqNMFbSdmEHt8GfGlvmhJYPtW0Twhlfu/QLTyCBSEXNgltq7RI2YhwRktMxh1RBiQkC1mnrpgsrp2YbLDrrXiW25T0kMTCSMPAKUvM+iqTYsVPOEQBSWPzxlGY1+MpZ32ykGP5EesGAJZxNvpp3yMNXF2G3TXt3wVAHj6RSsl0PIwqIgIGSo6zjDybDzZDwOAJLgsAgvYO2Qnq3EZfblo63yDFyfr7SNEf7dZ5hMYoDurCDk7AAjC6SrprJ4l/gxxZSGJe8NNYbqjPRm/XTtcg/g+Nrgmt8r/EwAdphQ9x7lpuzd2WFzeUKSj2noLPyIA3dbTjJA0/fpXW04mNJKqGSrSNmTHNTmjlSDlVmdSoyk5OelSomENVCx7kBDU1VBpLa9rRLaHpJScH1B8TX2/244SbgwLGe0GO8tknJBYLvLrjOMKXPWCDbkTLhK0llxbz7kBNrcVEYcglQ27YaGb7qMRYwE29XyUKj8vUSTmpvFz/CNdlZoGEzeZZEeC0e5NCdsXkbmBXrAi5hAPcAZLe4OcEssoqQaE3UFUCXgRwRMvyzLgZRO2qemvf8ERgiBCej+FYbw1neaKZY4eUSUhj2uyefqjiDNbgMfTeY/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(11063799006)(56012099006)(6133799003)(3023799007)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tycHTZ6SmRmI1kW0J1GTaABI+Q1qGQhTtEn+nmmtBO/HjudM3mWcrKBU1LTZJu/MgMqbhlfvaCuNt4F+sJIZUV8NDPoXhZ4JQ8gCnsY7l1lPpF09ztMoTE/2dXbSjs9qKRuVuAdLpB8gMskcJuGRg9joKiN1+YpB5tibf98bSca4P6T6nlBrwbmKU9IvFIGHleY5i0hzenwy20uwez/O/46WEQ3yqb4U8l2+itNJjAskXeXW/6D0jYs0E+enp2146uS2OXKHah2/Q32f+FS2hw9uFkfvAOqR6BWfbHRNpQo4hcu7QywcJl3aQLH6GGWAeWWh3hVHfUBMd9s2bJfKtEAU6qFlVy7MFDBCT9ODn8cAdDfxhz08JMXfwyYsE1UGnhIEAbZ4K4cn4fbSI1QWkkBlFWGOFkgx3R1GeafkZFKg6Tb1opslsR1W10VbYOIH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:50:00.0617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e4f340-7021-4ae0-2a3e-08df124dec9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8650
X-purgate-ID: tlsNG-d62444/1789383010-BC359757-5874B308/0/0
X-purgate-type: clean
X-purgate-size: 5274

From: Lei Huang <Lei.Huang@amd.com>

Xen poweroff, halt and reboot requests are normally forwarded to a
userspace helper so that the guest can perform an orderly shutdown. Some
guests cannot provide a functional helper, for example when their security
policy prevents a kernel-initiated helper from completing the operation.

Add the xen.force_shutdown parameter to let such guests handle toolstack
shutdown requests in workqueue context. Flush filesystems synchronously
before performing the transition directly in the kernel.

This is an explicit bypass rather than a timeout fallback: once a userspace
helper has been executed successfully, the kernel cannot determine whether
it will eventually complete the shutdown.

Keep the parameter disabled by default so existing guests retain the
opportunity to perform userspace cleanup or reject a shutdown request.
Enabling the parameter explicitly accepts the risk of losing userspace data
which has not been committed before the request.

Signed-off-by: Lei Huang <Lei.Huang@amd.com>
---

Notes:
    RFC:
    
    This is an opt-in bypass rather than a timeout fallback. Once a
    userspace helper has been executed successfully, the kernel cannot
    determine whether it will eventually complete the shutdown.
    
    Would a kernel command-line opt-in be acceptable for this case, or
    should the policy be represented through XenStore instead?
    
    Test status:
    
    This exact xen.force_shutdown=1 version was built and booted on a
    Celadon Android Xen PVH guest. An xl shutdown request successfully
    powered off the guest through the direct kernel shutdown path.

 .../admin-guide/kernel-parameters.txt         |  7 +++
 drivers/xen/manage.c                          | 45 +++++++++++++++++--
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f2..6beda2f3d5b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8623,6 +8623,13 @@ Kernel parameters
 			fairer and the number of possible event channels is
 			much higher. Default is on (use fifo events).
 
+	xen.force_shutdown=	[XEN]
+			Force Xen toolstack poweroff, halt and reboot requests in
+			the kernel instead of invoking a userspace helper. This can
+			cause the loss of uncommitted userspace data and should only
+			be enabled for guests without a functional userspace shutdown
+			helper. The default is off.
+
 	xirc2ps_cs=	[NET,PCMCIA]
 			Format:
 			<irq>,<irq_mask>,<io>,<full_duplex>,<do_sound>,<lockup_hack>[,<irq2>[,<irq3>[,<irq4>]]]
diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
index 05d7de128e7..a86426c8671 100644
--- a/drivers/xen/manage.c
+++ b/drivers/xen/manage.c
@@ -7,14 +7,17 @@
 
 #include <linux/kernel.h>
 #include <linux/err.h>
+#include <linux/moduleparam.h>
 #include <linux/slab.h>
 #include <linux/reboot.h>
+#include <linux/syscalls.h>
 #include <linux/sysrq.h>
 #include <linux/stop_machine.h>
 #include <linux/suspend.h>
 #include <linux/freezer.h>
 #include <linux/syscore_ops.h>
 #include <linux/export.h>
+#include <linux/workqueue.h>
 
 #include <xen/xen.h>
 #include <xen/xenbus.h>
@@ -38,6 +41,14 @@ enum shutdown_state {
 	 SHUTDOWN_HALT = 4,
 };
 
+#undef MODULE_PARAM_PREFIX
+#define MODULE_PARAM_PREFIX "xen."
+
+static bool xen_force_shutdown;
+module_param_named(force_shutdown, xen_force_shutdown, bool, 0444);
+MODULE_PARM_DESC(force_shutdown,
+		 "Force Xen poweroff, halt and reboot requests without a userspace helper");
+
 /* Ignore multiple shutdown requests. */
 static enum shutdown_state shutting_down = SHUTDOWN_INVALID;
 
@@ -189,15 +200,40 @@ static int poweroff_nb(struct notifier_block *cb, unsigned long code, void *unus
 	}
 	return NOTIFY_DONE;
 }
+
+static void xen_poweroff_work_func(struct work_struct *work)
+{
+	pr_warn("Forcing Xen toolstack shutdown without userspace cleanup\n");
+	ksys_sync();
+	kernel_power_off();
+}
+
+static DECLARE_WORK(xen_poweroff_work, xen_poweroff_work_func);
+
+static void xen_reboot_work_func(struct work_struct *work)
+{
+	pr_warn("Forcing Xen toolstack reboot without userspace cleanup\n");
+	ksys_sync();
+	kernel_restart(NULL);
+}
+
+static DECLARE_WORK(xen_reboot_work, xen_reboot_work_func);
+
 static void do_poweroff(void)
 {
 	switch (system_state) {
 	case SYSTEM_BOOTING:
 	case SYSTEM_SCHEDULING:
-		orderly_poweroff(true);
+		if (xen_force_shutdown)
+			schedule_work(&xen_poweroff_work);
+		else
+			orderly_poweroff(true);
 		break;
 	case SYSTEM_RUNNING:
-		orderly_poweroff(false);
+		if (xen_force_shutdown)
+			schedule_work(&xen_poweroff_work);
+		else
+			orderly_poweroff(false);
 		break;
 	default:
 		/* Don't do it when we are halting/rebooting. */
@@ -209,7 +245,10 @@ static void do_poweroff(void)
 static void do_reboot(void)
 {
 	shutting_down = SHUTDOWN_POWEROFF; /* ? */
-	orderly_reboot();
+	if (xen_force_shutdown)
+		schedule_work(&xen_reboot_work);
+	else
+		orderly_reboot();
 }
 
 static const struct shutdown_handler shutdown_handlers[] = {

