Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FA8C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 15:50:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366740.1616692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFg-00077a-RB; Mon, 20 Jul 2026 15:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366740.1616692; Mon, 20 Jul 2026 15:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFg-00077R-OM; Mon, 20 Jul 2026 15:49:56 +0000
Received: by outflank-mailman (input) for mailman id 1366740;
 Mon, 20 Jul 2026 15:49:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1wlqFf-00075e-7r
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 15:49:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqFe-00GJmC-L4
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 17:49:54 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e438b-5cb7-0a2a0a5109dd-0a2a450387ba-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:49:54 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e43a1-fae8-0a2a45030019-a0658309b22c-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:49:54 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 8CF898291CBC;
 Mon, 20 Jul 2026 11:48:12 -0400 (EDT)
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
Subject: [PATCH v1 3/6] tools/libs/guest: compress PAGE_DATA with LZ4 on save
Date: Mon, 20 Jul 2026 16:48:28 +0100
Message-ID: <20260720154832.1907401-4-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720154832.1907401-1-marcus.granado@citrix.com>
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784562594-6F4C74E9-0C6C3709/0/0
X-purgate-type: clean
X-purgate-size: 14629

This patch updates the save side of the migration stream to emit
REC_TYPE_PAGE_DATA_LZ4 compressed records of page data batches.

The compression algorithm is selected at runtime via a new ctx->compression
field of type enum xc_sr_compression.  It defaults to XC_SR_COMPRESS_NONE,
so the on-wire behaviour is unchanged unless compression is explicitly
requested; the opt-in that selects XC_SR_COMPRESS_LZ4 is added in a later
patch.  The LZ4-specific code is compiled in only when libxenguest is built
with liblz4 support (ie. HAVE_LZ4 is defined).

The compression state (buffers, state) is kept in the xc_sr_context struct,
guarded by #ifdef HAVE_LZ4 for LZ4-specific members.
setup_compression_lz4() allocates one persistent buffer:
* lz4_compress_buf: the output buffer packing the per-page
  compressed output (worst case: every page stored raw), with a few spare
  bytes so the record's 8-byte alignment padding can be folded into its tail

It is freed in cleanup_compression_lz4(). Using a persistent buffer
avoids a malloc/free cycle per batch during migration.

lz4_compress_batch() compresses each present page independently. The raw
page data has already been written into iov[2 ..) by write_batch() (which
coalesces physically-contiguous pages), so each page is recovered by
walking those iov entries in PAGE_SIZE strides. Each page is compressed
with a destination capacity of PAGE_SIZE - 1, so any page that does not
strictly shrink is stored raw. Then it checks a per-batch ratio threshold
(XC_SR_COMPRESS_BATCH_THRESHOLD 97%): if the compressed payload is at
least 97% of the original size, lz4_compress_batch() returns false and the
batch is sent uncompressed as REC_TYPE_PAGE_DATA instead of
REC_TYPE_PAGE_DATA_LZ4. The caller then emits the batch through the native
uncompressed per-page path, which the receiver side handles natively as
REC_TYPE_PAGE_DATA without any awareness of the discarded compression
attempt. This avoids wasting receiver CPU on decompression for
negligible size savings and handles incompressible data (eg encrypted
pages) where framing overhead would otherwise make the compressed output
larger than the input.

write_batch() is refactored to dispatch on ctx->compression: the iovec
for writev() is sized at nr_pfns + 2 entries (2 header iovs plus up to one
per present page), covering both the LZ4 path (a single payload iov, with
the record's alignment padding folded into it) and the uncompressed
per-page path used natively and on LZ4 decline.

Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---
 tools/libs/guest/xg_sr_common.h |  26 ++++
 tools/libs/guest/xg_sr_save.c   | 244 +++++++++++++++++++++++++++++++-
 2 files changed, 267 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index e2321b25d5..ccb02511ec 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -210,11 +210,26 @@ static inline int update_blob(struct xc_sr_blob *blob,
 }
 
 /* Little-endian accessors for the PAGE_DATA_LZ4 per-page clen prefix. */
+static inline void lz4_page_put_clen(uint8_t *p, uint16_t clen)
+{
+    p[0] = (uint8_t)(clen & 0xff);
+    p[1] = (uint8_t)((clen >> 8) & 0xff);
+}
+
 static inline uint16_t lz4_page_get_clen(const uint8_t *p)
 {
     return (uint16_t)(p[0] | (p[1] << 8));
 }
 
+/* Compression mode for the migration stream. */
+enum xc_sr_compression
+{
+    XC_SR_COMPRESS_NONE = 0,
+#ifdef HAVE_LZ4
+    XC_SR_COMPRESS_LZ4,
+#endif
+};
+
 struct xc_sr_context
 {
     xc_interface *xch;
@@ -224,6 +239,9 @@ struct xc_sr_context
     /* Plain VM, or checkpoints over time. */
     xc_stream_type_t stream_type;
 
+    /* Compression algorithm for page data records. */
+    enum xc_sr_compression compression;
+
     xc_domaininfo_t dominfo;
 
     union /* Common save or restore data. */
@@ -250,6 +268,14 @@ struct xc_sr_context
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
+
+#ifdef HAVE_LZ4
+            /*
+             * Persistent LZ4 output buffer (avoids repeated malloc/free),
+             * sized MAX_BATCH_SIZE * (PAGE_SIZE + clen) + (REC_ALIGN - 1).
+             */
+            void *lz4_compress_buf;
+#endif
         } save;
 
         struct /* Restore data. */
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 84fdbe4140..8f661f0168 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -3,6 +3,22 @@
 
 #include "xg_sr_common.h"
 
+#ifdef HAVE_LZ4
+#include <lz4.h>
+#endif
+
+#include <xen-tools/common-macros.h>
+
+/*
+ * Per-batch compression ratio threshold (percentage). When the compressed
+ * output of a single batch is at least this fraction of the original size,
+ * send uncompressed page data instead. This avoids wasting receiver CPU on
+ * decompression for negligible (or negative) size savings. At 100%+ the
+ * compressed output is actually larger than the input due to framing
+ * overhead on incompressible data
+ */
+#define XC_SR_COMPRESS_BATCH_THRESHOLD  97
+
 /*
  * Writes an Image header and Domain header into the stream.
  */
@@ -73,6 +89,161 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
     return write_record(ctx, &checkpoint);
 }
 
+#ifdef HAVE_LZ4
+/*
+ * Allocate LZ4 compression buffers during setup_compression()
+ * when ctx->compression is XC_SR_COMPRESS_LZ4
+ */
+static int setup_compression_lz4(struct xc_sr_context *ctx)
+{
+    xc_interface *xch = ctx->xch;
+
+    /*
+     * Per-page packed payload; worst case is every page stored raw.  The
+     * trailing (REC_ALIGN - 1) spare bytes give room to fold the
+     * record's 8-byte alignment padding into this buffer's tail (see
+     * lz4_compress_batch()), avoiding a separate padding iov
+     */
+    ctx->save.lz4_compress_buf =
+        malloc((size_t)MAX_BATCH_SIZE * (PAGE_SIZE + PAGE_DATA_LZ4_CLEN_SIZE)
+               + (REC_ALIGN - 1));
+
+    if ( !ctx->save.lz4_compress_buf )
+    {
+        ERROR("Unable to allocate LZ4 buffer");
+        return -1;
+    }
+
+    return 0;
+}
+
+/*
+ * Free LZ4 compression buffers during cleanup_compression()
+ * when ctx->compression is XC_SR_COMPRESS_LZ4
+ */
+static void cleanup_compression_lz4(struct xc_sr_context *ctx)
+{
+    free(ctx->save.lz4_compress_buf);
+}
+
+/*
+ * Prepare and LZ4-compress a batch of page data.
+ *
+ * write_batch() has already filled iov[2 .. *iovcnt) with this batch's raw
+ * page data, coalescing physically-contiguous guest pages into larger iov
+ * entries.  Walk those entries in PAGE_SIZE strides to recover each present
+ * page (there are exactly nr_pages of them, in ascending order) and compress
+ * it as an independent LZ4 block.
+ *
+ * On success, discard the per-page iov entries, emit a single payload iov,
+ * update *iovcnt and rec->type / rec->length, and return true.  If the batch
+ * does not compress well enough, leave iov[], *iovcnt and *rec
+ * untouched and return false so the caller emits native PAGE_DATA.
+ */
+static bool lz4_compress_batch(struct xc_sr_context *ctx, unsigned int nr_pages,
+                               struct iovec *iov, int *iovcnt,
+                               struct xc_sr_rhdr *rec)
+{
+    xc_interface *xch = ctx->xch;
+    void *compressed = ctx->save.lz4_compress_buf;
+    size_t raw_len = (size_t)nr_pages * PAGE_SIZE;
+    size_t compressed_len;
+
+    /*
+     * Compress each page as an independent LZ4 block, packed back-to-back as
+     * [uint16 LE clen][clen bytes].  clen == 0 means a raw page follows.  The
+     * raw pages are recovered from iov[2 .. *iovcnt), which write_batch()
+     * filled (coalescing contiguous pages), by striding each entry in
+     * PAGE_SIZE units.
+     */
+    {
+        uint8_t *out = compressed;
+        size_t off = 0;
+        int v;
+
+        for ( v = 2; v < *iovcnt; ++v )
+        {
+            const uint8_t *base = iov[v].iov_base;
+            size_t poff;
+
+            for ( poff = 0; poff < iov[v].iov_len; poff += PAGE_SIZE )
+            {
+                const uint8_t *src = base + poff;
+                uint8_t *blk = out + off;
+                uint8_t *dst = blk + PAGE_DATA_LZ4_CLEN_SIZE;
+                int comp_ret;
+
+                /*
+                 * PAGE_SIZE-1 budget: LZ4 returns 0 for an incompressible page
+                 * or on error; such pages are stored raw below.
+                 */
+                comp_ret = LZ4_compress_default((const char *)src, (char *)dst,
+                                                (int)PAGE_SIZE,
+                                                (int)PAGE_SIZE - 1);
+                if ( comp_ret > 0 )
+                {
+                    lz4_page_put_clen(blk, (uint16_t)comp_ret);
+                    off += PAGE_DATA_LZ4_CLEN_SIZE + (size_t)comp_ret;
+                }
+                else
+                {
+                    lz4_page_put_clen(blk, PAGE_DATA_LZ4_CLEN_RAW);
+                    memcpy(dst, src, PAGE_SIZE);
+                    off += PAGE_DATA_LZ4_CLEN_SIZE + PAGE_SIZE;
+                }
+            }
+        }
+        compressed_len = off;
+    }
+
+    /*
+     * Decline: if compression didn't shrink the data enough, send
+     * uncompressed page data instead. This avoids transmitting extra
+     * bytes and saves the receiver from a pointless decompression pass
+     */
+    if ( compressed_len * 100 >= raw_len * XC_SR_COMPRESS_BATCH_THRESHOLD )
+    {
+        size_t permil = compressed_len * 1000 / raw_len;
+
+        DBGPRINTF("LZ4: %zu -> %zu bytes (%zu.%zu%% >= %u%%), "
+                  "sending uncompressed",
+                  raw_len, compressed_len, permil / 10, permil % 10,
+                  XC_SR_COMPRESS_BATCH_THRESHOLD);
+        return false;
+    }
+
+    {
+        size_t permil = compressed_len * 1000 / raw_len;
+
+        DBGPRINTF("LZ4: %zu -> %zu bytes (%zu.%zu%% ratio)",
+                  raw_len, compressed_len, permil / 10, permil % 10);
+    }
+
+    /*
+     * Accept: discard the raw per-page iov entries (iov[2 .. *iovcnt)) and
+     * emit a single payload iov.  Fold the record's 8-byte alignment zeroed
+     * padding into the compressed buffer's tail so no separate padding iov is
+     * needed; setup_compression_lz4() sized the buffer with (REC_ALIGN - 1)
+     * spare bytes for this reason.
+     */
+    rec->type = REC_TYPE_PAGE_DATA_LZ4;
+    rec->length += compressed_len;
+    {
+        size_t padding = ROUNDUP(rec->length, REC_ALIGN) - rec->length;
+
+        if ( padding )
+            memset((uint8_t *)compressed + compressed_len, 0, padding);
+
+        *iovcnt = 2;
+        iov[*iovcnt].iov_base = compressed;
+        iov[*iovcnt].iov_len = compressed_len + padding;
+        (*iovcnt)++;
+    }
+
+    return true;
+}
+#endif /* HAVE_LZ4 */
+
 /*
  * Writes a batch of memory as a PAGE_DATA record into the stream.  The batch
  * is constructed in ctx->save.batch_pfns.
@@ -232,11 +403,33 @@ static int write_batch(struct xc_sr_context *ctx)
         }
     }
 
-    hdrs.rec.length += nr_pages * PAGE_SIZE;
-
     for ( i = 0; i < nr_pfns; ++i )
         rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
 
+    /*
+     * Emit the batch's page data.  With LZ4 selected, try to compress it: on
+     * success lz4_compress_batch() has replaced the per-page iov entries built
+     * by the map loop with a single compressed payload iov and updated
+     * hdrs.rec; on decline (or compression off / not built with LZ4) fall
+     * through to emit the raw pages as native PAGE_DATA.
+     */
+    switch ( ctx->compression )
+    {
+#ifdef HAVE_LZ4
+    case XC_SR_COMPRESS_LZ4:
+        if ( nr_pages &&
+             lz4_compress_batch(ctx, nr_pages, iov, &iovcnt, &hdrs.rec) )
+            break;
+        /* LZ4 declined or empty batch: emit native PAGE_DATA. */
+        __attribute__((fallthrough));
+#endif
+
+    case XC_SR_COMPRESS_NONE:
+    default:
+        hdrs.rec.length += nr_pages * PAGE_SIZE;
+        break;
+    }
+
     if ( writev_exact(ctx->fd, iov, iovcnt) )
     {
         PERROR("Failed to write page data to stream");
@@ -771,6 +964,28 @@ static int send_domain_memory_nonlive(struct xc_sr_context *ctx)
     return rc;
 }
 
+static int setup_compression(struct xc_sr_context *ctx)
+{
+    switch ( ctx->compression )
+    {
+#ifdef HAVE_LZ4
+    case XC_SR_COMPRESS_LZ4:
+        if ( setup_compression_lz4(ctx) )
+        {
+            errno = ENOMEM;
+            return -1;
+        }
+        break;
+#endif
+
+    case XC_SR_COMPRESS_NONE:
+    default:
+        break;
+    }
+
+    return 0;
+}
+
 static int setup(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
@@ -797,19 +1012,38 @@ static int setup(struct xc_sr_context *ctx)
         goto err;
     }
 
+    rc = setup_compression(ctx);
+    if ( rc )
+        goto err;
+
     rc = 0;
 
  err:
     return rc;
 }
 
+static void cleanup_compression(struct xc_sr_context *ctx)
+{
+    switch ( ctx->compression )
+    {
+#ifdef HAVE_LZ4
+    case XC_SR_COMPRESS_LZ4:
+        cleanup_compression_lz4(ctx);
+        break;
+#endif
+
+    case XC_SR_COMPRESS_NONE:
+    default:
+        break;
+    }
+}
+
 static void cleanup(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
 
-
     xc_shadow_control(xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_OFF,
                       NULL, 0);
 
@@ -820,6 +1054,8 @@ static void cleanup(struct xc_sr_context *ctx)
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
     free(ctx->save.batch_pfns);
+
+    cleanup_compression(ctx);
 }
 
 /*
@@ -971,6 +1207,8 @@ int xc_domain_save(xc_interface *xch, int io_fd, uint32_t dom,
     };
     bool hvm;
 
+    ctx.compression = XC_SR_COMPRESS_NONE;
+
     /* GCC 4.4 (of CentOS 6.x vintage) can' t initialise anonymous unions. */
     ctx.save.callbacks = callbacks;
     ctx.save.live  = !!(flags & XCFLAGS_LIVE);
-- 
2.43.0


