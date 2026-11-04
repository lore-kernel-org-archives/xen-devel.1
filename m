Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E979606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wBjMjhzg
Received: from list by lists.xenproject.org with outflank-mailman.1471449.1679822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOUm9-0002wg-Pl; Wed, 04 Nov 2026 06:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471449.1679822; Wed, 04 Nov 2026 06:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOUm9-0002wZ-Mc; Wed, 04 Nov 2026 06:47:13 +0000
Received: by outflank-mailman (input) for mailman id 1471449;
 Wed, 04 Nov 2026 06:47:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1xOUm8-0002wS-DL
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 06:47:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOUm7-005mj0-QM
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 07:47:11 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6aead4e5-bab6-0a2a0a5309dd-0a2a4502dc80-30
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 07:47:10 +0100
Received: from [40.93.195.46]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6aead4ed-6ca4-0a2a45020019-285dc32edbcb-4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 07:47:10 +0100
Received: from BN9PR03CA0367.namprd03.prod.outlook.com (2603:10b6:408:f7::12)
 by SA1PR12MB7150.namprd12.prod.outlook.com (2603:10b6:806:2b4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 4 Nov
 2026 06:47:05 +0000
Received: from IA0PEPF00000045.namprd04.prod.outlook.com
 (2603:10b6:408:f7:cafe::31) by BN9PR03CA0367.outlook.office365.com
 (2603:10b6:408:f7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Wed, 4
 Nov 2026 06:47:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000045.mail.protection.outlook.com (10.167.249.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 06:47:05 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 00:47:02 -0600
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
 b=cbseGUAe85lzhhN1bIfrzt5CtesYSh992/W1hcfc3XRAbmjg1KNVeXyQIZJf5MHJ2Ir/INjEo4zBFR11P/As4YRo3KNMDnLcMv0umhk+ZrnjMtE8UGlWPjdNvZsVpmJ+34XGmQG22ReGqRxqbBn69Pf4lmnhHF4Mg7yFKB+yAfiH8g7NMsNcJDRQ4MfYtJEjdhU7sJVH4XS5tOfQe74fi3o7Fx2eKM3TbXHq2uwq1Sxa2IFLyPX1B3JYTMx3klWAkFVs+kLo43em22i7psuLURuzbmIR+jZt7slp7ELawOG61iRd2dFc1OVaxdINW7FXpI1ToJeI7br7mKmrIpcMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGbpboLTGfr9u2Y17PMtSLDxqQpn1FGLzhcqxMZFVTA=;
 b=BTnRwV3y1Yd3cinzQoe/Xd9DDAx9UW/BpB+4qkkDlDPO9Z1z37Yy9kFK3my+Z9y5ALtQEN4asadd+fh3xTEL4NKg5cqcF8KQw/qOS6EMpRpS3LtQKJTdXEp4xFTP8KdyGfKZLWMEx0/iPY9LRDpcA7t+Pb8nfjfJFl894UZAepIlUOxgNDBDaR7gGEJXYFAdJ1ALj/pUKaj3kTU+5Dz+GvpVSUllzdUOyinHUldHCXui6/hBuRc6SUqpGAXCYz2Rrp9WyAzilZZHf+hB3L3kxbYPgcPfU/oeDPa6vQGR/nq8mjLDHwESs965K7K5qPUJEX/ulx0iEeolpY2PxWcdbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGbpboLTGfr9u2Y17PMtSLDxqQpn1FGLzhcqxMZFVTA=;
 b=wBjMjhzgP1tGNLNlx6uduwcnEXBjE8gmPVv2zMu71MzKJlm82If+ImSIG7Qf/C5QiU6nf5Xs6JJO7efCMx7FI4UjvrGq4/WboQOgY9uMRH30KySUnCn+mHNlz+JwwcecpVATTh5qRND+PJYpWJFqQRMmoZjIZQ61+iu71WeQQfg=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jiaqing Zhao <Zhao.Jiaqing@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Penny Zheng <penny.zheng@amd.com>
Subject: [PATCH] libxl: wait for QEMU exit before restarting a domain
Date: Wed, 4 Nov 2026 14:46:28 +0800
Message-ID: <20261104064645.1171477-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000045:EE_|SA1PR12MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7117f1-4a78-4fe2-c0c7-08df3a3f7053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|261021121427099003|261026140227099003|56012099006|261102124527099003|11063799006|261021123027099003|10067099003|5023799004|261009223027099003|261028144727099003|261022105027099003|261022115727099003|261022075727099003|261102123227099003|261026121527099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	NWFf5ECy5rHv3yRA1q0pk8/kA0CTaGdWfquyldcPNH3dPf8zI88u+NXi74/jKtDP0mvSManmJR2RiTNj2zJzoYbn+nyUfjiWjolCd2NOMqaBurxTs6aZyWKx7bI/clS6RSBdURRgT115EFzTm866IPQXl6+FlT5gsF1z/oMAtQw+2nnwUDu3GpuNjh5Suges6n5gR6FZ8mqf533IOvSkCUFRoJycSqaXuNdfEwtIygZrQsfpzA0lH+RDeuoyj/QthRrHDAlMTWxlz6yT+4MRG9an4CH3nx2d4R2LLvLhXvDoCGprv5njn4x+RdteiJAUyL/62JsX8izSePVb1xA7JhhdWRXUULe7HpC/H6kTL3VcffRQ7tcLqyFJ3A3YEfW+j57zKO9rP+82XonhmlutMzfsoNh/iXlHAKmx7SPtYoR1fy5ZDtjPL6xhygdijs+u+ap1DrZcyomlqxi4ImMaYtrFoKKlopPn8HcSRzCGH+V51COuyUTAR2yIWSrG+pNUgfz1dAPoQEqgN7y8+4pHHx5EAsxboJNe5ChCiFe/jhRySJzMOMCMCO2hXZO7eLcu2IJ3b0gsIFbyl+5+gSpRbzTOMbEyhSulgud4tWiGlFVV1lZPd/p7E4V58HvBOdGKanwK0/aNwJP3cue0sVVA0x9R0DP5h5XuDS4Koij5USeDv0Ry+I9RHX0M/lyewOaV05DSSbLHd087IzDh2bBepA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(261021121427099003)(261026140227099003)(56012099006)(261102124527099003)(11063799006)(261021123027099003)(10067099003)(5023799004)(261009223027099003)(261028144727099003)(261022105027099003)(261022115727099003)(261022075727099003)(261102123227099003)(261026121527099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wu59VawDGj2RLWr+yQdo/mLrm6AQMdJwuFQSr+Q6YNO/HsAVHtCnaKv6i9bwZnvZBRH5OVq0I4lgI4CWySJBKSQDAmSIl3iBH32z/0BccY8oAlRS3t33FL0MhfTKACLctO0Ft0CGXI49LG7eRTUtwP7itrdLd4g2q6sProyO6SIDuZOK4+xFF2hJBvuNQ6uAPrD3Yd15FLjjLkfKGlnaYeWTHr+7xNvyTaXMBZSuf0/lGki4oc3BIx1QTW6rnyng/75XwHvAX3yEdxO9jYZLBm1m2loqasq0eyjJ2YLMQyQd2XAPfWLo2TlL+eBRBWLyJCnQK445ChGsEzLhJrBr+R9M7gK4ndQFM43asgYaBRTtHSUQW0I86lGyQ9xK2RirAW4WARoOc3zo4RUL2Qr+CiHmJwNkJxuqWZLiNRMNRLO1auxZoETlKzLuqOCxOUEn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 06:47:05.1436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7117f1-4a78-4fe2-c0c7-08df3a3f7053
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000045.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7150
X-purgate-ID: tlsNG-720697/1793774830-F1EAB2AC-9D0EB6BE/0/0
X-purgate-type: clean
X-purgate-size: 7270
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PID-based device model destruction path returns immediately after
sending SIGHUP, before QEMU has necessarily exited. When an HVM guest
reboots with VNC enabled, the new QEMU process may fail to bind the VNC
port because the old process still holds it.

Wait for QEMU to exit in a child process after singaling it for at most
60 seconds. If waiting fails or times out, log the error and retain the
existing domain destruction behaviour.

Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
---
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>
Cc: Roger Pau Monné <roger@xenproject.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <penny.zheng@amd.com>
---
 tools/libs/light/libxl_aoutils.c  |  8 ++++--
 tools/libs/light/libxl_dm.c       | 45 ++++++++++++++++++++++++++-----
 tools/libs/light/libxl_domain.c   |  2 +-
 tools/libs/light/libxl_internal.h |  3 ++-
 4 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/tools/libs/light/libxl_aoutils.c b/tools/libs/light/libxl_aoutils.c
index c2d42e7cac..977a2705a8 100644
--- a/tools/libs/light/libxl_aoutils.c
+++ b/tools/libs/light/libxl_aoutils.c
@@ -628,10 +628,11 @@ void libxl__kill(libxl__gc *gc, pid_t pid, int sig, const char *what)
 
 /* Generic function to signal (HUP) a pid stored in xenstore */
 int libxl__kill_xs_path(libxl__gc *gc, const char *xs_path_pid,
-                        const char *what)
+                        const char *what, pid_t *pid_r)
 {
     const char *xs_pid;
-    int ret, pid;
+    int ret;
+    pid_t pid;
 
     ret = libxl__xs_read_checked(gc, XBT_NULL, xs_path_pid, &xs_pid);
     if (ret || !xs_pid) {
@@ -640,6 +641,9 @@ int libxl__kill_xs_path(libxl__gc *gc, const char *xs_path_pid,
         goto out;
     }
     pid = atoi(xs_pid);
+    if (pid_r) {
+        *pid_r = pid;
+    }
 
     ret = kill(pid, SIGHUP);
     if (ret < 0 && errno == ESRCH) {
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 511ec76a65..ac1db9fe6a 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2859,7 +2859,7 @@ static void device_model_probe_spawn_outcome(libxl__egc *egc,
 
     /* Ensure our QEMU command line probe is killed. */
     rc = libxl__kill_xs_path(gc, dmss->spawn.pidpath,
-                             "qemu command-line probe");
+                             "qemu command-line probe", NULL);
     if (rc) {
         LOGD(WARN, dmss->guest_domid,
              "Killing qemu command-line probe pid from path %s",
@@ -3420,9 +3420,10 @@ out:
 }
 
 /* Generic function to signal a Qemu instance to exit */
-static int kill_device_model(libxl__gc *gc, const char *xs_path_pid)
+static int kill_device_model(libxl__gc *gc, const char *xs_path_pid,
+                             pid_t *pid_r)
 {
-    return libxl__kill_xs_path(gc, xs_path_pid, "Device Model");
+    return libxl__kill_xs_path(gc, xs_path_pid, "Device Model", pid_r);
 }
 
 /* Helper to destroy a Qdisk backend */
@@ -3433,7 +3434,7 @@ int libxl__destroy_qemu_xenpv_backend(libxl__gc *gc, uint32_t domid)
 
     pid_path = GCSPRINTF("libxl/%u/qdisk-backend-pid", domid);
 
-    rc = kill_device_model(gc, pid_path);
+    rc = kill_device_model(gc, pid_path, NULL);
     if (rc)
         goto out;
 
@@ -3454,6 +3455,21 @@ static void kill_device_model_uid_cb(libxl__egc *egc,
                                      libxl__ev_child *destroyer,
                                      pid_t pid, int status);
 
+/* Run in a child so waiting for QEMU does not block the libxl event loop. */
+static int wait_device_model_pid_child(libxl__gc *gc, uint32_t domid, pid_t pid)
+{
+    unsigned int i;
+
+    for (i = 0; i < LIBXL_DEVICE_MODEL_STOP_TIMEOUT * 10; i++) {
+        if (kill(pid, 0) && errno == ESRCH)
+            return 0;
+        usleep(100000);
+    }
+
+    LOGD(ERROR, domid, "Timed out waiting for device model [%d] to exit", pid);
+    return ERROR_TIMEDOUT;
+}
+
 /*
  * If we have a uid, we shouldn't kill by pid.  This is because a
  * hostile QEMU might have exited, in which case the pid we have may
@@ -3477,6 +3493,7 @@ void libxl__destroy_device_model(libxl__egc *egc,
     int domid = ddms->domid;
     char *path;
     const char *dm_kill_uid_str = NULL;
+    pid_t dm_pid;
     int reaper_pid;
 
     ddms->rc = 0;
@@ -3547,12 +3564,28 @@ void libxl__destroy_device_model(libxl__egc *egc,
     LOGD(DEBUG, domid, "Didn't find dm UID; destroying by pid");
 
     path = GCSPRINTF("/local/domain/%d/image/device-model-pid", domid);
-    rc = kill_device_model(gc, path);
-
+    rc = kill_device_model(gc, path, &dm_pid);
     if (rc) {
         ACCUMULATE_RC(ddms->rc);
         LOGD(ERROR, domid, "Killing device model pid from path %s", path);
+        goto out;
+    }
+
+    LOGD(DEBUG, domid, "Waiting for device model [%d] to exit", dm_pid);
+    reaper_pid = libxl__ev_child_fork(gc, &ddms->destroyer,
+                                      kill_device_model_uid_cb);
+    if (reaper_pid < 0) {
+        rc = ERROR_FAIL;
+        ACCUMULATE_RC(ddms->rc);
+        LOGD(ERROR, domid, "Unable to fork device model exit waiter");
+        goto out;
     }
+    if (!reaper_pid) {
+        rc = wait_device_model_pid_child(gc, domid, dm_pid);
+        assert(rc <= 0 && rc >= -125);
+        _exit(-rc);
+    }
+    return;
 
 out:
     /*
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 37fcd92871..6e332cfed7 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -1270,7 +1270,7 @@ static void dm_destroy_cb(libxl__egc *egc,
         libxl__stubdomain_is_linux_running(gc, target_domid)) {
         char *path = GCSPRINTF("/local/domain/%d/image/qmp-proxy-pid", domid);
 
-        libxl__kill_xs_path(gc, path, "QMP Proxy");
+        libxl__kill_xs_path(gc, path, "QMP Proxy", NULL);
         /* qmp-proxy for stubdom registers target_domid's QMP sockets. */
         libxl__qmp_cleanup(gc, target_domid);
     }
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index b65e0064b9..f4fde8009e 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -97,6 +97,7 @@
 /* QEMU may be slow to load and start due to a bug in Linux where the I/O
  * subsystem sometime produce high latency under load. */
 #define LIBXL_DEVICE_MODEL_START_TIMEOUT 60
+#define LIBXL_DEVICE_MODEL_STOP_TIMEOUT 60
 #define LIBXL_DEVICE_MODEL_SAVE_FILE XEN_LIB_DIR "/qemu-save" /* .$domid */
 #define LIBXL_DEVICE_MODEL_RESTORE_FILE XEN_LIB_DIR "/qemu-resume" /* .$domid */
 #define LIBXL_QMP_CMD_TIMEOUT 10
@@ -2659,7 +2660,7 @@ bool libxl__async_exec_inuse(const libxl__async_exec_state *aes);
 _hidden void libxl__kill(libxl__gc *gc, pid_t pid, int sig, const char *what);
 /* kill SIGHUP a pid stored in xenstore */
 _hidden int libxl__kill_xs_path(libxl__gc *gc, const char *xs_path_pid,
-                                const char *what);
+                                const char *what, pid_t *pid_r);
 
 /*----- device addition/removal -----*/
 
-- 
2.53.0


