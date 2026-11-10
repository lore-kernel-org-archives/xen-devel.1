Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7329B606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZB5S3Iso
Received: from list by lists.xenproject.org with outflank-mailman.1481446.1685330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQihO-0006it-Kp; Tue, 10 Nov 2026 10:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481446.1685330; Tue, 10 Nov 2026 10:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQihO-0006im-I2; Tue, 10 Nov 2026 10:03:30 +0000
Received: by outflank-mailman (input) for mailman id 1481446;
 Tue, 10 Nov 2026 10:03:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1xQihM-0006ig-Lh
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:03:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQihL-00AY2S-S7
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:03:27 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6af2ebec-e002-0a2a0a5209dd-0a2a4508c390-10
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:03:27 +0100
Received: from [52.101.57.52]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6af2ebee-f659-0a2a45080019-34653934bf7d-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:03:27 +0100
Received: from PH8PR21CA0010.namprd21.prod.outlook.com (2603:10b6:510:2ce::10)
 by IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 10:03:16 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:510:2ce:cafe::74) by PH8PR21CA0010.outlook.office365.com
 (2603:10b6:510:2ce::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Tue, 10
 Nov 2026 10:03:15 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 10:03:15 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 04:03:13 -0600
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
 b=PVAM6Uc5Jp+DA6ga/0YGKGwPkmJSqkk/PM7+ZIRd24GzPIjqfsZQaPTta8xjM3I8ndotukbf208Gi+4jBXJxokBlQ6e7KjB8HStsnbqpq/XOzBXxz1gRuKWEZVrZyAcZpOJ05qo4qQWHIUzHyOjVAHeGoiKLD00f3SAsn1YB1Dh/olNe6uAsvIMYaYaTqhSBbX5LkFxGiqGvFjii1v/5552AD7fYlic12wuAqPyWsjvFnpvibuK7S8sY9FURiB4kjfVoPCOgTP0lclYS19nr4GX9U/WNNFfhSx3H4/EGmiK2QdQEwcSE0HEAMQgO1t5gxzesMRMDzTWmN1aQP3YeKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bLaUGZF+nFYvn/iMsThKV8FR7ACpLtWV3STHpO+91k=;
 b=bkamV6uQvBXWI2gL1XSEVHDcpg+E93HSe9paY1/Ise7FcP5RO0A20hTtx+mPNk8PvBGFSPHfzrJDjOEAlqTb6IMt/z/sRVWJb9H8CaKazqZGh/0kqahXaVf2h/FLOA/Gdwv9lI2jX/imjy23MAw7I01WHua9V+fFoq2SfGi9C8EmibZdkpF2AtOWyuw3FGlC2JYu84INX55SoHQ5YWMSrKvune1nhn/fZeGiwk5ez2k1Gemu/6gQ7nVlC7CKQiAkz+AytFSDsNY01+RIR4UeCNISt58c/6Yc2CuH9wUKZvLqXmwM1ke0SVhONGB8ot0GoD//q68Gs6cx8RRxhVjqYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bLaUGZF+nFYvn/iMsThKV8FR7ACpLtWV3STHpO+91k=;
 b=ZB5S3IsoHvJDpJLWqAJyr3Tx4DzBLEQOPUgps87x8hXFHieUWIeT2RbEUebPyBEtR+VjACQMp/O1TE+OgEslruf+HG7VuLobh6MMYlhwHQKnR4CQtkUJCHh24s/pTTBAxM5ekbplh78G/qsXCKjZouZ20/4ob0SM6kmMKoRKgto=
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
Subject: [PATCH v2] libxl: wait for QEMU exit before restarting a domain
Date: Tue, 10 Nov 2026 18:02:57 +0800
Message-ID: <20261110100258.490701-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|IA1PR12MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: fd40b9d4-42e5-44e9-1904-08df3f11d685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|18002099003|6133799003|5023799004|56012099006|11063799006|10067099003|261026121527099003|261028144727099003|261021121427099003|261102124527099003|261022115727099003|261022075727099003|261021123027099003|261022105027099003|261102123227099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	+WB7xVqxR7HIaeXsUqHtiS1r2spU8XFgqIOH2CWKl5xEPtHLT5JxYYWOpgOHs3xv77v5ZL/1vI8U4LcstNARflav2NOcE9caPnAu9w6Vs8UuvmWTlostJQear02fU1+SrwNImKHlbGBrTdIttkkN6kFznJZWafdMCH12Xmzd5ehf5q134FwD1zV/djV2kfKXe+w/iM2RFgyWTrXDSThENr8CcVKDOcjhOo1OzndfFwAOziTKxoF68A+lbBVStdtU3qyzV4ovs1BlcaA8DmElZr8cQ0mtyvrrFCEXZqW3+RpY5Q5fC09AMNt+2TUB2Y0GNabfObIJVrTR1lDRFN9wrACVq0dUCIBoKLaL+FVwwBEvi99Nwehp4ukbN2nvuGBZua1sn8ml69N2+dbHOWU21FVrL/qKGvCxq7ElNR6E8036ee+OiAmbATxpYE0u3xxILq/JQdMJ3pCpGreF/W1NkR83g9+Qn8wIwXsdEipTLjET0az6pzkbgizRf0u0dlQnZP/ghRlVrZVE3PhU1UgmVfeMpjPtpvfT6DQzEFJnKQa/iWPiPycUlQ5794QKm7fl3vEU+mwc2FZutWbQNWL1+RtOqjklUpYy5ZnruNwx5AmrHkLH+whqTjzjYlxAuQn1mnghRCb0pi8sfedHDpIdQ7Pthh0zx9nld4uuTAeoHsfIfejVGg3dVv6Vma/ElHoJ8IKMRFmpJRKa4DqbQEexTQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(6133799003)(5023799004)(56012099006)(11063799006)(10067099003)(261026121527099003)(261028144727099003)(261021121427099003)(261102124527099003)(261022115727099003)(261022075727099003)(261021123027099003)(261022105027099003)(261102123227099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sKqW1X+NoL4RwaMcUoEON9iOfu6vFhY0eBA0nTiXX7Y8u/7qHXlzG8OYCV6xdltWxhu6yghzz0VUG68GuGmChkiI/GoO/AKXQlEEbMbkNanAoy3sqlETq8reYQzsiHe+3YpK5YinGmobqDqh0VN02I4K5LCuI+ogXR0spDtEETWQoGW63lWCj8i6O5bmFov6xFof35JjmHFW1+Z3cydCImyS/8lJUE/e7eL5nJqB2UhiDguuX/XUwQBqMMpdd+R3A2rHdNQ38YCacFiJoJ7ISeV49D8smCre2XYUR2OZmO2vn5+YzLVgdv8TFsgpbc+Qqm3bAyBzR8R4EDOHRlcDetGLzmvCD8/fzF5ueiGE7DJhzB24TWj+wpY/BnQn3XTbEzu0pHUrPsYmP9EEyg7yDhFNvYT3xv99NsBfMytkcf03k9GzjSokJfpg/4lm0lKA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:03:15.4960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd40b9d4-42e5-44e9-1904-08df3f11d685
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6460
X-purgate-ID: tlsNG-c1860d/1794305007-D6F5F87B-01E25A0E/0/0
X-purgate-type: clean
X-purgate-size: 9880
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
10 seconds. If waiting fails or times out, log the error and retain the
existing domain destruction behaviour.

Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
---
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
Cc: Roger Pau Monné <roger@xenproject.com>
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
index b65e0064b9..b4a8273b3e 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -97,6 +97,7 @@
 /* QEMU may be slow to load and start due to a bug in Linux where the I/O
  * subsystem sometime produce high latency under load. */
 #define LIBXL_DEVICE_MODEL_START_TIMEOUT 60
+#define LIBXL_DEVICE_MODEL_STOP_TIMEOUT 10
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


