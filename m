Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F31DC44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 15:49:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366732.1616684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFb-0006mF-FQ; Mon, 20 Jul 2026 15:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366732.1616684; Mon, 20 Jul 2026 15:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFb-0006m4-Cf; Mon, 20 Jul 2026 15:49:51 +0000
Received: by outflank-mailman (input) for mailman id 1366732;
 Mon, 20 Jul 2026 15:49:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1wlqFa-0006k8-RU
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 15:49:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqFa-00CFTf-8T
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 17:49:50 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e4393-e002-0a2a0a5209dd-0a2a4507bf5a-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:49:50 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e439d-b4ea-0a2a45070019-a06583099fbe-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:49:50 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 3ED658291B34;
 Mon, 20 Jul 2026 11:48:08 -0400 (EDT)
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
Subject: [PATCH v1 2/6] tools/libs/guest: decompress PAGE_DATA_LZ4 records on restore
Date: Mon, 20 Jul 2026 16:48:27 +0100
Message-ID: <20260720154832.1907401-3-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720154832.1907401-1-marcus.granado@citrix.com>
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1784562590-A6AD8AE4-7492F775/0/0
X-purgate-type: clean
X-purgate-size: 9981

This patch updates the restore side of the migration stream to accept the
newly defined REC_TYPE_PAGE_DATA_LZ4 record. When HAVE_LZ4 is defined,
handle_data_lz4() decodes the PAGE_DATA_LZ4 record's data_lz4 payload
(containing the per-page [uint16 LE clen][clen octets] entries)
into ctx->restore.lz4_decomp_buf and returns it, or NULL on error.

clen is read via lz4_page_get_clen() (little-endian octet assembly instead
of a pointer cast as the entries are byte-packed and therefore unaligned).
Each entry's length and the running input offset are bounds-checked
against the record payload, each page_data_lz4 must decompress to exactly
PAGE_SIZE, and the walk must consume the payload exactly, before any byte
reaches the guest. The decompressed page_data_lz4 is sent to the existing
process_page_data() path of REC_TYPE_PAGE_DATA, so the rest of the
restore code stays the same.

The existing process_record() routes both types of page data records to
the same handle_page_data(), which is refactored to dispatch on rec->type:
* the original uncompresed REC_TYPE_PAGE_DATA case keeps its original
  exact-size check
* the new REC_TYPE_PAGE_DATA_LZ4 case expects variable record lengths
  and decompresses the expected_payload

The decompression buffer grows on demand via realloc() and is freed in
cleanup(). Sizing is driven by the uncompressed byte count from the
expected_payload of the header, so the buffer naturally converges
to the largest batch size used during the stream.

The existing per-object 'xg_dom_bzimageloader.o: CFLAGS += $(ZLIB_CFLAGS)'
is broadened to a global 'CFLAGS += $(ZLIB_CFLAGS)' (tools/configure groups
liblz4's -DHAVE_LZ4 and cflags into ZLIB_CFLAGS), so HAVE_LZ4 is defined
consistently for every libxenguest object that includes xg_sr_common.h.

Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---
 tools/libs/guest/Makefile        |   2 +-
 tools/libs/guest/xg_sr_common.h  |  12 +++
 tools/libs/guest/xg_sr_restore.c | 149 +++++++++++++++++++++++++++++--
 3 files changed, 154 insertions(+), 9 deletions(-)

diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 93338a9301..037f1f4de9 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -3,7 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 include Makefile.common
 
-xg_dom_bzimageloader.o xg_dom_bzimageloader.opic: CFLAGS += $(ZLIB_CFLAGS)
+CFLAGS += $(ZLIB_CFLAGS)
 
 $(LIBELF_OBJS:.o=.opic): CFLAGS += -Wno-pointer-sign
 
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index f1573aefcb..e2321b25d5 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -209,6 +209,12 @@ static inline int update_blob(struct xc_sr_blob *blob,
     return 0;
 }
 
+/* Little-endian accessors for the PAGE_DATA_LZ4 per-page clen prefix. */
+static inline uint16_t lz4_page_get_clen(const uint8_t *p)
+{
+    return (uint16_t)(p[0] | (p[1] << 8));
+}
+
 struct xc_sr_context
 {
     xc_interface *xch;
@@ -298,6 +304,12 @@ struct xc_sr_context
 
             /* memflags to pass to xc_domain_populate_physmap{_exact}(). */
             unsigned int memflags;
+
+#ifdef HAVE_LZ4
+            /* Persistent LZ4 decompression buffer */
+            void *lz4_decomp_buf;
+            size_t lz4_decomp_buf_size;
+#endif
         } restore;
     };
 
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 458eaa5992..be8a88288e 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -4,6 +4,10 @@
 
 #include "xg_sr_common.h"
 
+#ifdef HAVE_LZ4
+#include <lz4.h>
+#endif
+
 /*
  * Read and validate the Image and Domain headers.
  */
@@ -354,6 +358,104 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     return rc;
 }
 
+/*
+ * Decode a PAGE_DATA_LZ4 record's data_lz4 (see xg_sr_stream_format.h):
+ * nr_pages per-page sub-blocks, each a uint16 LE clen then clen octets of
+ * page_data_lz4 (clen == 0 => a raw page), into ctx->restore.lz4_decomp_buf
+ * (grown as needed).  Returns the decoded page data, or NULL on error.
+ */
+static void *handle_data_lz4(struct xc_sr_context *ctx,
+                             const uint8_t *data_lz4,
+                             size_t data_lz4_len,
+                             unsigned int nr_pages)
+{
+    xc_interface *xch = ctx->xch;
+#ifdef HAVE_LZ4
+    size_t expected = (size_t)nr_pages * PAGE_SIZE;
+    size_t in_off = 0;
+    unsigned int p;
+
+    if ( nr_pages == 0 )
+    {
+        ERROR("Compressed PAGE_DATA record with zero present pages");
+        return NULL;
+    }
+
+    if ( expected > ctx->restore.lz4_decomp_buf_size )
+    {
+        void *new_buf = realloc(ctx->restore.lz4_decomp_buf, expected);
+        if ( !new_buf )
+        {
+            ERROR("Unable to allocate %zu bytes for LZ4 payload", expected);
+            return NULL;
+        }
+        ctx->restore.lz4_decomp_buf = new_buf;
+        ctx->restore.lz4_decomp_buf_size = expected;
+    }
+
+    for ( p = 0; p < nr_pages; ++p )
+    {
+        uint8_t *dst = (uint8_t *)ctx->restore.lz4_decomp_buf + p * PAGE_SIZE;
+        uint16_t clen;
+        int decomp_ret;
+
+        if ( in_off + PAGE_DATA_LZ4_CLEN_SIZE > data_lz4_len )
+        {
+            ERROR("PAGE_DATA_LZ4 record with truncated length prefix");
+            return NULL;
+        }
+        clen = lz4_page_get_clen(data_lz4 + in_off);
+        in_off += PAGE_DATA_LZ4_CLEN_SIZE;
+
+        /* top 4 bits reserved for future use; must be 0 */
+        if ( clen & PAGE_DATA_LZ4_CLEN_RESERVED_MASK )
+        {
+            ERROR("PAGE_DATA_LZ4 record with reserved clen bit set");
+            return NULL;
+        }
+
+        if ( clen == PAGE_DATA_LZ4_CLEN_RAW )
+        {
+            if ( PAGE_SIZE > data_lz4_len - in_off )
+            {
+                ERROR("PAGE_DATA_LZ4 record with truncated raw page");
+                return NULL;
+            }
+            memcpy(dst, data_lz4 + in_off, PAGE_SIZE);
+            in_off += PAGE_SIZE;
+            continue;
+        }
+
+        /* reserved-bit reject above already caps clen < PAGE_SIZE */
+        if ( (size_t)clen > data_lz4_len - in_off )
+        {
+            ERROR("PAGE_DATA_LZ4 record with bad block length");
+            return NULL;
+        }
+        decomp_ret = LZ4_decompress_safe((const char *)(data_lz4 + in_off),
+                                         (char *)dst, (int)clen,
+                                         (int)PAGE_SIZE);
+        if ( decomp_ret != (int)PAGE_SIZE )
+        {
+            ERROR("PAGE_DATA_LZ4 record decompressed to wrong size");
+            return NULL;
+        }
+        in_off += clen;
+    }
+
+    if ( in_off != data_lz4_len )
+    {
+        ERROR("PAGE_DATA_LZ4 record with trailing bytes in payload");
+        return NULL;
+    }
+
+    return ctx->restore.lz4_decomp_buf;
+#else
+    ERROR("LZ4 compressed PAGE_DATA record but LZ4 support not compiled in");
+    return NULL;
+#endif /* HAVE_LZ4 */
+}
+
 /*
  * Validate a PAGE_DATA record from the stream, and pass the results to
  * process_page_data() to actually perform the legwork.
@@ -448,18 +550,45 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         types[i] = type;
     }
 
-    if ( rec->length != (sizeof(*pages) +
-                         (sizeof(uint64_t) * pages->count) +
-                         (PAGE_SIZE * pages_of_data)) )
+    size_t header_len = sizeof(*pages) + (sizeof(uint64_t) * pages->count);
+    size_t expected_payload = PAGE_SIZE * pages_of_data;
+
+    if ( rec->length < header_len )
     {
-        ERROR("PAGE_DATA record wrong size: length %u, expected "
-              "%zu + %zu + %lu", rec->length, sizeof(*pages),
-              (sizeof(uint64_t) * pages->count), (PAGE_SIZE * pages_of_data));
+        ERROR("PAGE_DATA record too short: header %zu > length %u",
+              header_len, rec->length);
         goto err;
     }
 
-    rc = process_page_data(ctx, pages->count, pfns, types,
-                           &pages->pfn[pages->count]);
+    switch ( rec->type )
+    {
+    case REC_TYPE_PAGE_DATA:
+        if ( rec->length != header_len + expected_payload )
+        {
+            ERROR("PAGE_DATA record wrong size: length %u, expected "
+                  "%zu + %zu + %lu", rec->length, sizeof(*pages),
+                  (sizeof(uint64_t) * pages->count), expected_payload);
+            goto err;
+        }
+
+        rc = process_page_data(ctx, pages->count, pfns, types,
+                               &pages->pfn[pages->count]);
+        break;
+
+    case REC_TYPE_PAGE_DATA_LZ4:
+    {
+        const uint8_t *data_lz4 = (const uint8_t *)&pages->pfn[pages->count];
+        size_t data_lz4_len = rec->length - header_len;
+        void *page_data = handle_data_lz4(ctx, data_lz4, data_lz4_len,
+                                          pages_of_data);
+
+        if ( !page_data )
+            goto err;
+
+        rc = process_page_data(ctx, pages->count, pfns, types, page_data);
+        break;
+    }
+    }
  err:
     free(types);
     free(pfns);
@@ -705,6 +834,7 @@ static int process_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         break;
 
     case REC_TYPE_PAGE_DATA:
+    case REC_TYPE_PAGE_DATA_LZ4:
         rc = handle_page_data(ctx, rec);
         break;
 
@@ -796,6 +926,9 @@ static void cleanup(struct xc_sr_context *ctx)
 
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
+#ifdef HAVE_LZ4
+    free(ctx->restore.lz4_decomp_buf);
+#endif
 
     if ( ctx->restore.ops.cleanup(ctx) )
         PERROR("Failed to clean up");
-- 
2.43.0


