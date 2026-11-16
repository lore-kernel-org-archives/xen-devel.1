Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E5D606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mjt7a2AA
Received: from list by lists.xenproject.org with outflank-mailman.1490202.1691142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSqVK-0000K2-U1; Mon, 16 Nov 2026 06:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490202.1691142; Mon, 16 Nov 2026 06:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSqVK-0000Jv-RM; Mon, 16 Nov 2026 06:47:50 +0000
Received: by outflank-mailman (input) for mailman id 1490202;
 Mon, 16 Nov 2026 06:47:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1xSqVJ-0000Jn-2t
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 06:47:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSqVI-005I8L-Fa
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 07:47:48 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6afaa705-8faa-0a2a0a5109dd-0a2a450bbbe2-22
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 07:47:48 +0100
Received: from [52.101.43.4]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6afaa712-b7e8-0a2a450b0019-34652b04bac8-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 07:47:47 +0100
Received: from MW4PR04CA0039.namprd04.prod.outlook.com (2603:10b6:303:6a::14)
 by FT1PR12MB368815.namprd12.prod.outlook.com (2603:10b6:170:20::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 06:47:42 +0000
Received: from CO1PEPF00018868.namprd03.prod.outlook.com
 (2603:10b6:303:6a:cafe::85) by MW4PR04CA0039.outlook.office365.com
 (2603:10b6:303:6a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 06:47:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00018868.mail.protection.outlook.com (10.167.249.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 06:47:41 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 00:47:38 -0600
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
 b=ycj9gvdCVaQu1ypCsJYHk7xdtbK0TPY3L3OTeaV2nfVMSgbJMCUadLM/CrIl2bL15wYlQgPY4wLbO5SEAzsL/r2LD2RjKDycAmYWO6/s3/v1dK3dbamJH6LkyWi9wiK9XB8LLknhh6IDR9/VA7MaCPdwr8KdJ6LqFJP0AtUgzNKznKOVrvAXlyRgOZMSFJmP/S1JFNtcrbK8DwU/CpjHrjwG5b0fEPebIN2EixDX+FdzMdIuu+cgvxEdcrHQ74AqRQtaNxsBmMQTHfklrRdjaMhkncjCdcntzLH6pd6rvU6FF20Az8BuA4ziJ2jawNLHVffFtEx1jyWPFc09UCxq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzfSK1KgYRppXCTWbJUHxXSbTRrsSV68+/YgKd72NBI=;
 b=CkZhQTAXsZUr1aO69+DeDYqSCF8rZzrTVo9G+qC1jN4g1IOROImb4aAUZ1/3M9JbWeB1REoqjEui55LyDHWb+zAp2vVW4fi9CRUDlF4exJ1IZatwDwvvjAxRz635Rl65HywLtuj36xjF+MMYabYl9rQrXp1E9cku7hwEtstf6dK6LCHJOP+9YoeLYnOild7+g2nUTXMf6SiXn381zPiSkyWi5RUnhHSfoKsHKuD3mSHnoytwGRMHMSCNbS8a+MvZsrKIREm399YKQRlBlFbOpKYj23VSUL8daiFeKef7oHeMPrlf9iwc0rltM7Bn24kpN9UN78tKN929Ds9iyGxShg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzfSK1KgYRppXCTWbJUHxXSbTRrsSV68+/YgKd72NBI=;
 b=mjt7a2AAV8znKmU0ndLHbjCBcX+pqwV0vfn06PH1Ysh/OA1shluRm0VjK9ohhFUZs6/st1HlwKmfYOfd50ETWqtpmON/fy+iVYQ2Y5+YbZ7FNbh+fqEb/rnXiNmCTaI0NhkZnzx47CZ+k/O9e0sP78dd81MpXkGYbEFyuDcXxPo=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jiaqing Zhao <Zhao.Jiaqing@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Juergen
 Gross" <jgross@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "Penny
 Zheng" <penny.zheng@amd.com>
Subject: [PATCH v3] libxl: wait for QEMU exit before restarting a domain
Date: Mon, 16 Nov 2026 14:46:57 +0800
Message-ID: <20261116064658.980330-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018868:EE_|FT1PR12MB368815:EE_
X-MS-Office365-Filtering-Correlation-Id: fef56471-432c-452d-e21c-08df43ad82e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|56012099006|5023799004|11063799006|261026121527099003|261026140227099003|261028144727099003|261022115727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102124527099003|261102123227099003|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	7HWBrU3kspuq2wO+TG+YO3O3z1MCRYDbwU2cbaeB1MRNViGPT6bqvJ9TX11KlSxKw8pr5KAhKi9Nwbr/4jnTAB+OXHbnYOFNHYiWi8nEG985rKzSIRSOGXykRqtG4MiBBxbWsr5h+gSZthaafutHHKPkwxKivQqnwKNfModKluFD6XCp4TQPxDi8S8l6jbWalszVZRtolkchrBmDI5Mjr+lkEBfwKcFWNcPnKKiM/RFSJvZX0f88+ZmJ3efA2Y81UsgVgpfDJ1X73O0jSUFGb2sWoPZCiqM+17+98LeL0RHqvUyhWmW6BjPOwnUr7K6WRGL4Grc7tXY5lpMbEMi5H7Tj9HVCcez3m70wpTfu5KcFTc9uAr4BC+mSDuJ0lWIjj78YqydpjRF69vT+hQmo5vzBLhEhF2ghnZ9HsGDTpgXXYBH9/C6pIJH2HETPpSz3A8vBKdGwnuCAt+GUOZy1fYZ3p/rYAKtGbViOS+KqQcsQP0awSQfcGA7Bh0CkKFiuOhdZp8DuiKIz/mxGoZcnunG8KtYBaNqS78VN11EUVy4K7qyi88dCFq7mytGIiQfKTmTDuikkeEwvF6y5ul8u9aUAb4MryIOXU6+o3iFSVge24JOByiRxFV7tfUd2hS4lvv0pwOLsseD2zrSSEa6p2Ac2VCGoV7jty3v4vBO96Awm/H3iadXQT8XM0DBDvfQCMzV0dmCCnQbbqSTHpoNcJg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(5023799004)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022115727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102124527099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4DCvAGLmgELh7Xheam40l7P1UjbTsJS1rV85AVUJtCfYvN4xzKWoHkJcjz1uw3k7z5MVe37EiILnHNLpxFodXtLJkk0sXGJthhYYxA7WLYANOwzk0CBODKPTi9W4crUKL2oNIZ6QTIRhC5HCuvwPe2cZ0zlHGKaDrpHVtTFqGPX8zga2G2JhPBgtQkuK87YH3qPHVJIdDHOKypun+5tnritgXTh/5Yij9HJdMB/6/xP1STnaneXQejCPv2RNBiVTiOfB8wx3if4ygdZih8iqHvWKrlSF5gbbwWIDMWq7ZXPG3RrSA3gmZTO8xewEq0CtfIVuNujO01NpQInB+uzdj7NuQnG7uacdb3NdGDHQV9haHmLj7osX0nCUJQVA4Yln+mapBGcQFWkX1JcmVRMkWOLHeC8dcsjf01F2rbjBrwf3/aer35FkCb2LqmkP7ytL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 06:47:41.3235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fef56471-432c-452d-e21c-08df43ad82e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018868.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB368815
X-purgate-ID: tlsNG-42698a/1794811668-1BAD09EA-F440BA6C/0/0
X-purgate-type: clean
X-purgate-size: 10054
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

Wait for QEMU to exit in a child process after signaling it for at most
60 seconds. If waiting fails or times out, log the error and retain the
existing domain destruction behaviour.

Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
* Restore timeout to 60s for possible slow QEMU shutdown with flushing
  block I/O.
* Add Reviewed-by from Jason.
v2:
* Share the fork, error handling and child exit handling between UID and
  PID-based destruction paths.
* Reduce the device-model stop timeout from 60 to 10 seconds.
* Handle unexpected errors from kill(pid, 0) explicitly.
* Fix misspelled "signaling" in commit message.
* Coding style fixes against tools/libs/light/CODING_STYLE.
---
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>
Cc: Roger Pau Monné <roger@xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <penny.zheng@amd.com>
---
 tools/libs/light/libxl_aoutils.c  |  8 ++-
 tools/libs/light/libxl_dm.c       | 98 +++++++++++++++++++++----------
 tools/libs/light/libxl_domain.c   |  2 +-
 tools/libs/light/libxl_internal.h |  3 +-
 4 files changed, 75 insertions(+), 36 deletions(-)

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
index 511ec76a65..104c48a07d 100644
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
 
@@ -3454,6 +3455,30 @@ static void kill_device_model_uid_cb(libxl__egc *egc,
                                      libxl__ev_child *destroyer,
                                      pid_t pid, int status);
 
+/* Wait in a child so the libxl event loop is not blocked. */
+static int wait_device_model_pid_child(libxl__gc *gc, uint32_t domid,
+                                       pid_t pid)
+{
+    unsigned int i;
+    int r;
+
+    for (i = 0; i < LIBXL_DEVICE_MODEL_STOP_TIMEOUT * 10; i++) {
+        r = kill(pid, 0);
+        if (r) {
+            if (errno == ESRCH)
+                return 0;
+            LOGED(ERROR, domid,
+                  "Failed checking device model [%d] state", pid);
+            return ERROR_FAIL;
+        }
+        usleep(100000);
+    }
+
+    LOGD(ERROR, domid,
+         "Timed out waiting for device model [%d] to exit", pid);
+    return ERROR_TIMEDOUT;
+}
+
 /*
  * If we have a uid, we shouldn't kill by pid.  This is because a
  * hostile QEMU might have exited, in which case the pid we have may
@@ -3477,6 +3502,7 @@ void libxl__destroy_device_model(libxl__egc *egc,
     int domid = ddms->domid;
     char *path;
     const char *dm_kill_uid_str = NULL;
+    pid_t dm_pid;
     int reaper_pid;
 
     ddms->rc = 0;
@@ -3513,46 +3539,54 @@ void libxl__destroy_device_model(libxl__egc *egc,
     if (dm_kill_uid_str) {
         LOGD(DEBUG, domid, "Found DM uid %s, destroying by uid",
              dm_kill_uid_str);
+    } else {
+        /*
+         * No uid to kill; attempt to kill by pid.
+         */
+        LOGD(DEBUG, domid, "Didn't find dm UID; destroying by pid");
 
-        reaper_pid = libxl__ev_child_fork(gc, &ddms->destroyer,
-                                          kill_device_model_uid_cb);
-        if (reaper_pid < 0) {
-            rc = ERROR_FAIL;
+        path = GCSPRINTF("/local/domain/%d/image/device-model-pid", domid);
+        rc = kill_device_model(gc, path, &dm_pid);
+        if (rc) {
             ACCUMULATE_RC(ddms->rc);
-            /*
-             * Note that if this fails, we still don't kill by pid, to
-             * make sure that an untrusted DM has not "maliciously"
-             * exited (potentially causing us to kill an unrelated
-             * process which happened to get the same pid).
-             */
+            LOGD(ERROR, domid,
+                 "Killing device model pid from path %s", path);
             goto out;
         }
 
-        if (!reaper_pid) {  /* child */
-            rc = kill_device_model_uid_child(ddms, dm_kill_uid_str);
-            assert(rc <= 0 && rc >= -125);
-            _exit(-rc);
-        }
+        LOGD(DEBUG, domid,
+             "Waiting for device model [%d] to exit", dm_pid);
+    }
 
+    reaper_pid = libxl__ev_child_fork(gc, &ddms->destroyer,
+                                      kill_device_model_uid_cb);
+    if (reaper_pid < 0) {
+        rc = ERROR_FAIL;
+        ACCUMULATE_RC(ddms->rc);
+        LOGD(ERROR, domid, "Unable to fork device model destroyer");
         /*
-         * Parent of successful fork; execution will pick up in
-         * kill_device_model_uid_cb when child exits
+         * Note that if uid fails, we still don't kill by pid, to
+         * make sure that an untrusted DM has not "maliciously"
+         * exited (potentially causing us to kill an unrelated
+         * process which happened to get the same pid).
          */
-        return;
+        goto out;
+    }
+
+    if (!reaper_pid) {  /* child */
+        if (dm_kill_uid_str)
+            rc = kill_device_model_uid_child(ddms, dm_kill_uid_str);
+        else
+            rc = wait_device_model_pid_child(gc, domid, dm_pid);
+        assert(rc <= 0 && rc >= -125);
+        _exit(-rc);
     }
 
     /*
-     * No uid to kill; attept to kill by pid.
+     * Parent of successful fork; execution will pick up in
+     * kill_device_model_uid_cb when child exits
      */
-    LOGD(DEBUG, domid, "Didn't find dm UID; destroying by pid");
-
-    path = GCSPRINTF("/local/domain/%d/image/device-model-pid", domid);
-    rc = kill_device_model(gc, path);
-
-    if (rc) {
-        ACCUMULATE_RC(ddms->rc);
-        LOGD(ERROR, domid, "Killing device model pid from path %s", path);
-    }
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


