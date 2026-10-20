Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750A8606A31B
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 20:04:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1456229.1669740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG4S-0002u5-P1; Tue, 20 Oct 2026 20:04:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456229.1669740; Tue, 20 Oct 2026 20:04:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG4S-0002tw-Li; Tue, 20 Oct 2026 20:04:28 +0000
Received: by outflank-mailman (input) for mailman id 1456229;
 Tue, 20 Oct 2026 20:04:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1xJG4Q-0002qS-M1
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:04:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJG4Q-007mVw-35
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:04:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c943-8faa-0a2a0a5109dd-0a2a4505e3b4-12
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:04:26 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c948-4cb1-0a2a45050019-a06583099792-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:04:25 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 6C5D8842421A;
 Tue, 20 Oct 2026 16:03:41 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Marcus Granado <marcus.granado@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Marcus Granado <marcus.granado@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Frediano Ziglio <freddy77@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 7/9] tools/libxl,xl: add a --compress option to xl migrate
Date: Tue, 20 Oct 2026 21:02:35 +0100
Message-ID: <20261020200238.1815766-8-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020200238.1815766-1-marcus.granado@citrix.com>
References: <20261020200238.1815766-1-marcus.granado@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1792526666-F48A62A1-128FA400/0/0
X-purgate-type: clean
X-purgate-size: 8328
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libxenguest can compress PAGE_DATA records with LZ4 when its caller
sets XCFLAGS_COMPRESS_LZ4, but libxl never sets it, so xl has no way to
ask for compression.

Add a LIBXL_SUSPEND_COMPRESS_LZ4 flag for libxl_domain_suspend(), pass
it to libxenguest as XCFLAGS_COMPRESS_LZ4, and expose it as
"xl migrate --compress".

Off by default: whether compressing pays off depends on how compressible
the guest's memory is and on the CPU headroom of both hosts, so the
caller decides.  Only xl migrate gets the option; xl save and xl remus
never use LZ4.

The receiving side needs no option, as each PAGE_DATA record says
whether it is compressed.  A receiver which cannot decompress rejects
the first compressed record, after it has created the domain, and the
migration fails with the guest still on the source.  A sender whose
libxenguest was built without a supported liblz4 fails the migration
before sending any guest memory; libxl reports it as a suspend timeout.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---

Notes:
    Changes in v2:
    - Was v1 6/6.  The libxl and xl code is unchanged; the help text and
      man page now say both hosts need liblz4 support in libxenguest, and
      CHANGELOG.md has an entry.
    
    No LIBXL_HAVE_* macro: LIBXL_SUSPEND_COMPRESS_LZ4 is itself a #define,
    so a caller can test for it with #ifdef LIBXL_SUSPEND_COMPRESS_LZ4.

 CHANGELOG.md                      |  3 +++
 docs/man/xl.1.pod.in              |  8 ++++++++
 tools/include/libxl.h             |  1 +
 tools/libs/light/libxl_dom_save.c |  4 +++-
 tools/libs/light/libxl_domain.c   |  1 +
 tools/libs/light/libxl_internal.h |  1 +
 tools/xl/xl_cmdtable.c            |  2 ++
 tools/xl/xl_migrate.c             | 13 ++++++++++---
 8 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 225397f128..4f1da5d9e5 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      afterwards.
 
 ### Added
+ - On x86:
+   - Optional LZ4 compression of the memory stream during migration
+     (xl migrate --compress).
 
 ### Removed
  - On Arm:
diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 51405f4e33..b0439231e2 100644
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
+Requires liblz4 support in libxenguest on both hosts.
+
 =item B<-p>
 
 Leave the domain on the receive side paused after migration.
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d294fb36bd..1114c8f8d1 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1922,6 +1922,7 @@ int libxl_domain_suspend(libxl_ctx *ctx, uint32_t domid, int fd,
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
index e48d5c5edc..aadca23a77 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -174,6 +174,8 @@ const struct cmd_spec cmd_table[] = {
       "-e              Do not wait in the background (on <host>) for the death\n"
       "                of the domain.\n"
       "--debug         Print huge (!) amount of debug during the migration process.\n"
+      "--compress      Compress the memory stream using LZ4 in libxenguest.\n"
+      "                Requires liblz4 support in libxenguest on both hosts.\n"
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


