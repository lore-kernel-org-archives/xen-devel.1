Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25F2C44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 15:50:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366758.1616720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFr-0000XF-T7; Mon, 20 Jul 2026 15:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366758.1616720; Mon, 20 Jul 2026 15:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFr-0000X3-LP; Mon, 20 Jul 2026 15:50:07 +0000
Received: by outflank-mailman (input) for mailman id 1366758;
 Mon, 20 Jul 2026 15:50:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1wlqFq-0000Hr-MD
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 15:50:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqFq-00HRhq-2Y
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 17:50:06 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e43a7-bab6-0a2a0a5309dd-0a2a4504d538-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:50:06 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e43ad-b57f-0a2a45040019-a0658309b530-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:50:05 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 1A3038291E7B;
 Mon, 20 Jul 2026 11:48:24 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Marcus Granado <marcus.granado@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <freddy77@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Marcus Granado <marcus.granado@citrix.com>
Subject: [PATCH v1 6/6] tools/libxl,xl: add --compress flag to xl migrate
Date: Mon, 20 Jul 2026 16:48:31 +0100
Message-ID: <20260720154832.1907401-7-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720154832.1907401-1-marcus.granado@citrix.com>
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1784562606-512DCB50-0CD34522/0/0
X-purgate-type: clean
X-purgate-size: 6876

Wire the libxenguest XCFLAGS_COMPRESS_LZ4 bit added earlier in this
series to libxl and xl:
* xl migrate gets a new --compress option
* libxl gets a new public flag LIBXL_SUSPEND_COMPRESS_LZ4
* LIBXL_SUSPEND_COMPRESS_LZ4 is mapped to XCFLAGS_COMPRESS_LZ4

No change to the default behaviour: without --compress, xl migrate
continues to emit uncompressed PAGE_DATA records.

Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---
 docs/man/xl.1.pod.in              |  8 ++++++++
 tools/include/libxl.h             |  1 +
 tools/libs/light/libxl_dom_save.c |  4 +++-
 tools/libs/light/libxl_domain.c   |  1 +
 tools/libs/light/libxl_internal.h |  1 +
 tools/xl/xl_cmdtable.c            |  2 ++
 tools/xl/xl_migrate.c             | 13 ++++++++++---
 7 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 88ccf7ad82..51d50cafd8 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -488,6 +488,14 @@ domain.
 
 Display huge (!) amount of debug information during the migration process.
 
+=item B<--compress>
+
+Compress the memory stream using LZ4 inside libxenguest before sending it
+to the destination host. This can significantly reduce migration time on
+slow transports, and reduce dom0 CPU pressure during host evacuations when
+the migration data is subsequently encrypted or copied through pipes.
+Requires libxenguest to have been built against liblz4.
+
 =item B<-p>
 
 Leave the domain on the receive side paused after migration.
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 7c098edab6..bc1dbd1162 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1908,6 +1908,7 @@ int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd,
                          LIBXL_EXTERNAL_CALLERS_ONLY;
 #define LIBXL_SUSPEND_DEBUG 1
 #define LIBXL_SUSPEND_LIVE 2
+#define LIBXL_SUSPEND_COMPRESS_LZ4 4
 
 /*
  * Only suspend domain, do not save its state to file, do not destroy it.
diff --git a/tools/libs/light/libxl_dom_save.c b/tools/libs/light/libxl_dom_save.c
index d64fd64f2e..16b882ecf0 100644
--- a/tools/libs/light/libxl_dom_save.c
+++ b/tools/libs/light/libxl_dom_save.c
@@ -245,6 +245,7 @@ void libxl__domain_save(libxl__egc *egc, libxl__domain_save_state *dss)
     const libxl_domain_type type = dss->type;
     const int live = dss->live;
     const int debug = dss->debug;
+    const int compress_lz4 = dss->compress_lz4;
     const libxl_domain_remus_info *const r_info = dss->remus;
     libxl__srm_save_autogen_callbacks *const callbacks =
         &dss->sws.shs.callbacks.save.a;
@@ -269,7 +270,8 @@ void libxl__domain_save(libxl__egc *egc, libxl__domain_save_state *dss)
     if (rc) goto out;
 
     dss->xcflags = (live ? XCFLAGS_LIVE : 0)
-          | (debug ? XCFLAGS_DEBUG : 0);
+          | (debug ? XCFLAGS_DEBUG : 0)
+          | (compress_lz4 ? XCFLAGS_COMPRESS_LZ4 : 0);
 
     /* Disallow saving a guest with vNUMA configured because migration
      * stream does not preserve node information.
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 37fcd92871..86458a69c0 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -527,6 +527,7 @@ int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd, int flags,
     dss->type = type;
     dss->live = flags & LIBXL_SUSPEND_LIVE;
     dss->debug = flags & LIBXL_SUSPEND_DEBUG;
+    dss->compress_lz4 = flags & LIBXL_SUSPEND_COMPRESS_LZ4;
     dss->checkpointed_stream = LIBXL_CHECKPOINTED_STREAM_NONE;
 
     rc = libxl__fd_flags_modify_save(gc, dss->fd,
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index b65e0064b9..ff7a334501 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -3598,6 +3598,7 @@ struct libxl__domain_save_state {
     libxl_domain_type type;
     int live;
     int debug;
+    int compress_lz4;
     int checkpointed_stream;
     const libxl_domain_remus_info *remus;
     /* private */
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 502244f683..1b1838735f 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -174,6 +174,8 @@ const struct cmd_spec cmd_table[] = {
       "-e              Do not wait in the background (on <host>) for the death\n"
       "                of the domain.\n"
       "--debug         Print huge (!) amount of debug during the migration process.\n"
+      "--compress      Compress the memory stream using LZ4 in libxenguest.\n"
+      "                Requires libxenguest to be built against liblz4.\n"
       "-p              Do not unpause domain after migrating it.\n"
       "-D              Preserve the domain id"
     },
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index 4b4a379aa1..31a8cb4f32 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -177,7 +177,7 @@ static void migrate_do_preamble(int send_fd, int recv_fd, pid_t child,
 }
 
 static void migrate_domain(uint32_t domid, int preserve_domid,
-                           const char *rune, int debug,
+                           const char *rune, int debug, int compress_lz4,
                            const char *override_config_file)
 {
     pid_t child = -1;
@@ -206,6 +206,8 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
 
     if (debug)
         flags |= LIBXL_SUSPEND_DEBUG;
+    if (compress_lz4)
+        flags |= LIBXL_SUSPEND_COMPRESS_LZ4;
     rc = libxl_domain_suspend(ctx, domid, send_fd, flags, NULL);
     if (rc) {
         fprintf(stderr, "migration sender: libxl_domain_suspend failed"
@@ -538,10 +540,11 @@ int main_migrate(int argc, char **argv)
     char *rune = NULL;
     char *host;
     int opt, daemonize = 1, monitor = 1, debug = 0, pause_after_migration = 0;
-    int preserve_domid = 0;
+    int preserve_domid = 0, compress_lz4 = 0;
     static struct option opts[] = {
         {"debug", 0, 0, 0x100},
         {"live", 0, 0, 0x200},
+        {"compress", 0, 0, 0x300},
         COMMON_LONG_OPTS
     };
 
@@ -571,6 +574,9 @@ int main_migrate(int argc, char **argv)
     case 0x200: /* --live */
         /* ignored for compatibility with xm */
         break;
+    case 0x300: /* --compress */
+        compress_lz4 = 1;
+        break;
     }
 
     domid = find_domain(argv[optind]);
@@ -602,7 +608,8 @@ int main_migrate(int argc, char **argv)
                   pause_after_migration ? " -p" : "");
     }
 
-    migrate_domain(domid, preserve_domid, rune, debug, config_filename);
+    migrate_domain(domid, preserve_domid, rune, debug, compress_lz4,
+                   config_filename);
     return EXIT_SUCCESS;
 }
 
-- 
2.43.0


