Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F34606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 20:04:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1456242.1669749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG4W-0003FC-4w; Tue, 20 Oct 2026 20:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456242.1669749; Tue, 20 Oct 2026 20:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG4V-0003Eq-TM; Tue, 20 Oct 2026 20:04:31 +0000
Received: by outflank-mailman (input) for mailman id 1456242;
 Tue, 20 Oct 2026 20:04:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1xJG4U-0003BB-Kd
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:04:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJG4U-005YwM-1b
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:04:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c91d-e002-0a2a0a5209dd-0a2a4507bb9c-44
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:04:30 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c94d-b4ea-0a2a45070019-a0658309a4fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:04:29 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id B6968842421A;
 Tue, 20 Oct 2026 16:03:45 -0400 (EDT)
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
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 8/9] tools/xl: mark LZ4 migration streams with a mandatory header flag
Date: Tue, 20 Oct 2026 21:02:36 +0100
Message-ID: <20261020200238.1815766-9-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020200238.1815766-1-marcus.granado@citrix.com>
References: <20261020200238.1815766-1-marcus.granado@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1792526670-3C411AE4-0F6C33C9/0/0
X-purgate-type: clean
X-purgate-size: 5662
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A receiver which cannot decompress LZ4 rejects the first compressed
PAGE_DATA record.  That is late: the receiver has already created the
domain, precopy has started, and an older libxenguest's error says
nothing about compression.

xl can fail earlier.  Its save file header carries mandatory_flags, and
create_domain() rejects unknown bits before it calls
libxl_domain_create_restore().  Similar to commit e72ce244dc91
("tools/xl: Mandatory flag indicating the format of the migration
stream"), claim bit 2 for LZ4 and set it for "xl migrate --compress".
An older xl then reports mandatory flag 0x4 as unsupported and creates
no domain.

This is defence in depth, for xl-to-xl migration only.  An xl which
knows the flag but whose libxenguest lacks liblz4 still accepts the
header and fails late, at the first compressed PAGE_DATA record, though
with an error that names LZ4.  The header is written before any record,
so a stream in which no record ends up compressed still carries the
flag and needs an LZ4-aware xl.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---

Notes:
    Changes in v2:
    - New, after an off-list question from Ross Lagerwall: an older xl
      now refuses a compressed stream before it creates the domain.

 tools/xl/xl.h             | 7 +++++--
 tools/xl/xl_migrate.c     | 8 ++++----
 tools/xl/xl_saverestore.c | 7 +++++--
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7b75f9a493..009cbd1c3c 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -77,8 +77,10 @@ static const char migrate_report[]=
 
 #define XL_MANDATORY_FLAG_JSON (1U << 0) /* config data is in JSON format */
 #define XL_MANDATORY_FLAG_STREAMv2 (1U << 1) /* stream is v2 */
+#define XL_MANDATORY_FLAG_COMPRESS_LZ4 (1U << 2) /* PAGE_DATA may use LZ4 */
 #define XL_MANDATORY_FLAG_ALL  (XL_MANDATORY_FLAG_JSON |        \
-                                XL_MANDATORY_FLAG_STREAMv2)
+                                XL_MANDATORY_FLAG_STREAMv2 |    \
+                                XL_MANDATORY_FLAG_COMPRESS_LZ4)
 
 struct save_file_header {
     char magic[32]; /* savefileheader_magic */
@@ -102,7 +104,8 @@ void save_domain_core_begin(uint32_t domid,
                             uint8_t **config_data_r,
                             int *config_len_r);
 void save_domain_core_writeconfig(int fd, const char *source,
-                                  const uint8_t *config_data, int config_len);
+                                  const uint8_t *config_data, int config_len,
+                                  int compress_lz4);
 
 /*
  * The xl process should always return either EXIT_SUCCESS or
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index 31a8cb4f32..230aac1b71 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -153,7 +153,7 @@ static void migration_child_report(int recv_fd) {
 
 static void migrate_do_preamble(int send_fd, int recv_fd, pid_t child,
                                 uint8_t *config_data, int config_len,
-                                const char *rune)
+                                const char *rune, int compress_lz4)
 {
     int rc = 0;
 
@@ -172,7 +172,7 @@ static void migrate_do_preamble(int send_fd, int recv_fd, pid_t child,
     }
 
     save_domain_core_writeconfig(send_fd, "migration stream",
-                                 config_data, config_len);
+                                 config_data, config_len, compress_lz4);
 
 }
 
@@ -200,7 +200,7 @@ static void migrate_domain(uint32_t domid, int preserve_domid,
     child = create_migration_child(rune, &send_fd, &recv_fd);
 
     migrate_do_preamble(send_fd, recv_fd, child, config_data, config_len,
-                        rune);
+                        rune, compress_lz4);
 
     xtl_stdiostream_adjust_flags(logger, XTL_STDIOSTREAM_HIDE_PROGRESS, 0);
 
@@ -740,7 +740,7 @@ int main_remus(int argc, char **argv)
         child = create_migration_child(rune, &send_fd, &recv_fd);
 
         migrate_do_preamble(send_fd, recv_fd, child, config_data, config_len,
-                            rune);
+                            rune, 0);
 
         if (ssh_command[0])
             free(rune);
diff --git a/tools/xl/xl_saverestore.c b/tools/xl/xl_saverestore.c
index 747094ec7b..5151c8a130 100644
--- a/tools/xl/xl_saverestore.c
+++ b/tools/xl/xl_saverestore.c
@@ -79,7 +79,8 @@ void save_domain_core_begin(uint32_t domid,
 }
 
 void save_domain_core_writeconfig(int fd, const char *source,
-                                  const uint8_t *config_data, int config_len)
+                                  const uint8_t *config_data, int config_len,
+                                  int compress_lz4)
 {
     struct save_file_header hdr;
     uint8_t *optdata_begin;
@@ -89,6 +90,8 @@ void save_domain_core_writeconfig(int fd, const char *source,
     memcpy(hdr.magic, savefileheader_magic, sizeof(hdr.magic));
     hdr.byteorder = SAVEFILE_BYTEORDER_VALUE;
     hdr.mandatory_flags = XL_MANDATORY_FLAG_STREAMv2;
+    if (compress_lz4)
+        hdr.mandatory_flags |= XL_MANDATORY_FLAG_COMPRESS_LZ4;
 
     optdata_begin= 0;
 
@@ -144,7 +147,7 @@ static int save_domain(uint32_t domid, int preserve_domid,
         exit(EXIT_FAILURE);
     }
 
-    save_domain_core_writeconfig(fd, filename, config_data, config_len);
+    save_domain_core_writeconfig(fd, filename, config_data, config_len, 0);
 
     int rc = libxl_domain_suspend(ctx, domid, fd, 0, NULL);
     close(fd);
-- 
2.43.0


