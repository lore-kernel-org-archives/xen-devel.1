Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8BFC433DF
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 06:00:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01A5320734
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 06:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01A5320734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfzyP-0002nx-E2; Tue, 02 Jun 2020 06:00:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jfzyO-0002ns-HM
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 06:00:28 +0000
X-Inumbo-ID: 59a040db-a496-11ea-ab98-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59a040db-a496-11ea-ab98-12813bfff9fa;
 Tue, 02 Jun 2020 06:00:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 252CDAFB0;
 Tue,  2 Jun 2020 06:00:26 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH-for-4.14 2/2] tools: make libxenhypfs interface more future
 proof
Date: Tue,  2 Jun 2020 08:00:21 +0200
Message-Id: <20200602060021.23289-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200602060021.23289-1-jgross@suse.com>
References: <20200602060021.23289-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

As compilers are free to choose the width of an enum they should be
avoided in stable interfaces when declaring a variable. So the
struct xenhypfs_dirent definition should be modified to have explicitly
sized members for type and encoding and the related enums should be
defined separately.

Additionally it is better to have a larger flags member in that struct
with the "writable" indicator occupying only a single bit. This will
make future additions easier.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/hypfs/core.c             |  2 +-
 tools/libs/hypfs/include/xenhypfs.h | 31 +++++++++++++++++------------
 tools/misc/xenhypfs.c               |  3 ++-
 3 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/tools/libs/hypfs/core.c b/tools/libs/hypfs/core.c
index d4309b5ae2..c91e165705 100644
--- a/tools/libs/hypfs/core.c
+++ b/tools/libs/hypfs/core.c
@@ -204,7 +204,7 @@ static void xenhypfs_set_attrs(struct xen_hypfs_direntry *entry,
         dirent->type = xenhypfs_type_blob;
     }
 
-    dirent->is_writable = entry->max_write_len;
+    dirent->flags = entry->max_write_len ? XENHYPFS_FLAG_WRITABLE : 0;
 }
 
 void *xenhypfs_read_raw(xenhypfs_handle *fshdl, const char *path,
diff --git a/tools/libs/hypfs/include/xenhypfs.h b/tools/libs/hypfs/include/xenhypfs.h
index ab157edceb..25432d2a16 100644
--- a/tools/libs/hypfs/include/xenhypfs.h
+++ b/tools/libs/hypfs/include/xenhypfs.h
@@ -26,22 +26,27 @@ struct xentoollog_logger;
 
 typedef struct xenhypfs_handle xenhypfs_handle;
 
+enum xenhypfs_type {
+    xenhypfs_type_dir,
+    xenhypfs_type_blob,
+    xenhypfs_type_string,
+    xenhypfs_type_uint,
+    xenhypfs_type_int,
+    xenhypfs_type_bool,
+};
+
+enum xenhypfs_encoding {
+    xenhypfs_enc_plain,
+    xenhypfs_enc_gzip
+};
+
 struct xenhypfs_dirent {
     char *name;
     size_t size;
-    enum {
-        xenhypfs_type_dir,
-        xenhypfs_type_blob,
-        xenhypfs_type_string,
-        xenhypfs_type_uint,
-        xenhypfs_type_int,
-        xenhypfs_type_bool
-    } type;
-    enum {
-        xenhypfs_enc_plain,
-        xenhypfs_enc_gzip
-    } encoding;
-    bool is_writable;
+    unsigned short type;
+    unsigned short encoding;
+    unsigned int flags;
+#define XENHYPFS_FLAG_WRITABLE  0x00000001
 };
 
 xenhypfs_handle *xenhypfs_open(struct xentoollog_logger *logger,
diff --git a/tools/misc/xenhypfs.c b/tools/misc/xenhypfs.c
index 5145b8969f..5da24aed90 100644
--- a/tools/misc/xenhypfs.c
+++ b/tools/misc/xenhypfs.c
@@ -125,7 +125,8 @@ static int xenhypfs_ls(char *path)
     } else {
         for (i = 0; i < n; i++)
             printf("%s r%c %s\n", xenhypfs_type(ent + i),
-                   ent[i].is_writable ? 'w' : '-', ent[i].name);
+                   (ent[i].flags & XENHYPFS_FLAG_WRITABLE) ? 'w' : '-',
+                   ent[i].name);
 
         free(ent);
     }
-- 
2.26.2


