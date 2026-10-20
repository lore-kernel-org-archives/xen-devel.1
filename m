Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67073606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 20:04:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1456201.1669712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG4B-0001qD-V6; Tue, 20 Oct 2026 20:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456201.1669712; Tue, 20 Oct 2026 20:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG4B-0001q6-Rv; Tue, 20 Oct 2026 20:04:11 +0000
Received: by outflank-mailman (input) for mailman id 1456201;
 Tue, 20 Oct 2026 20:04:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1xJG4A-0001nL-LV
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:04:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJG4A-005Yr0-2P
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:04:10 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c928-e002-0a2a0a5209dd-0a2a4505d56e-30
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:04:10 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c938-4cb1-0a2a45050019-a0658309e0f6-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:04:09 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 1741A842421A;
 Tue, 20 Oct 2026 16:03:24 -0400 (EDT)
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
Subject: [PATCH v2 4/9] tools/libs/guest: compress PAGE_DATA records with LZ4 on save
Date: Tue, 20 Oct 2026 21:02:32 +0100
Message-ID: <20261020200238.1815766-5-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020200238.1815766-1-marcus.granado@citrix.com>
References: <20261020200238.1815766-1-marcus.granado@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1792526649-71EA92A1-5C38F210/0/0
X-purgate-type: clean
X-purgate-size: 9122
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

write_batch() sends the pages of each batch uncompressed, writing
iovecs which point into the foreign mapping straight to the stream.
Restore decodes PAGE_DATA algorithm 0x01, LZ4, but nothing emits it, so
memory which compresses well still crosses the link at full size.

When ctx->save.compression selects LZ4, copy the batch's page data into
a staging buffer, compress it into one LZ4 frame with block checksums,
and send the frame, zero-padded to REC_ALIGN, in place of the pages.
Send the batch uncompressed unless the frame is strictly shorter than
the page data, as the stream specification requires of a saver.

The copy is required: LZ4 may encode a page P by reference to an
earlier page Q, checked against Q's current bytes but rebuilt from Q as
encoded earlier in the frame.  A guest write to Q in between corrupts P
undetected, as the block checksums cover the compressed data, and P is
not re-sent unless the guest writes it again.

Stage from the iov rather than the mapping, as only the iov describes
the record: PV pagetables are normalised into separately allocated
pages, and a page deferred on EAGAIN stays in the mapping but has no
data in the record.

The batch is staged whole and compressed as one block of up to 4MB;
copying in smaller chunks interleaved with compression was slower in
most configurations measured.

The two buffers, about 8MB together, are allocated on first use.  If
allocation or compression fails, compression is switched off for the
rest of the save rather than failing it.  The encoder is guarded by
XG_SR_LZ4, as the decoder is.

Nothing sets ctx->save.compression yet, so behaviour is unchanged.

Suggested-by: Frediano Ziglio <freddy77@gmail.com>
Suggested-by: Teddy Astie <teddy.astie@vates.tech>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---

Notes:
    Changes in v2:
    - Was v1 3/6.
    - One LZ4 frame per batch, carried in PAGE_DATA and compressed from a
      staged copy of the page data, replaces per-page blocks compressed
      from the live mapping in a separate record type.
    - Send compressed whenever the frame is shorter (v1: below 97%).
    - If allocation fails, compression is switched off rather than failing
      the save (v1 failed it).

 tools/libs/guest/xg_sr_common.h |  14 ++++
 tools/libs/guest/xg_sr_save.c   | 133 ++++++++++++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 53647caa30..e567a47582 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -221,6 +221,12 @@ static inline int update_blob(struct xc_sr_blob *blob,
     return 0;
 }
 
+enum xc_sr_compression
+{
+    XC_SR_COMPRESS_NONE,
+    XC_SR_COMPRESS_LZ4,
+};
+
 struct xc_sr_context
 {
     xc_interface *xch;
@@ -265,6 +271,14 @@ struct xc_sr_context
                 uint64_t rec_pfns[MAX_BATCH_SIZE];
                 int errors[MAX_BATCH_SIZE];
             } *buffers;
+
+            /* Which algorithm to compress page data with. */
+            enum xc_sr_compression compression;
+
+            /* LZ4 staging and output buffers, allocated on first use. */
+            void *lz4_staging_buf;
+            void *lz4_compress_buf;
+            size_t lz4_compress_buf_size;
         } save;
 
         struct /* Restore data. */
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 6a77e33a47..33954a7023 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -73,6 +73,118 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
     return write_record(ctx, &checkpoint);
 }
 
+static void cleanup_compression(struct xc_sr_context *ctx)
+{
+    free(ctx->save.lz4_staging_buf);
+    free(ctx->save.lz4_compress_buf);
+    ctx->save.lz4_staging_buf = NULL;
+    ctx->save.lz4_compress_buf = NULL;
+    ctx->save.lz4_compress_buf_size = 0;
+}
+
+#if defined(XG_SR_LZ4)
+/*
+ * One block per 4MB batch: smaller blocks can be 2x slower to decode.
+ * liblz4 allows 64KB, 256KB, 1MB and 4MB.
+ */
+#define XC_SR_COMPRESS_BLOCK_SIZE LZ4F_max4MB
+
+/*
+ * Compress the page data in iov[2..iovcnt) into an LZ4 frame, and replace
+ * those entries with one describing it, padded to the record alignment.
+ * Returns the new iovcnt, the original one with iov untouched if the batch
+ * should be sent uncompressed, or -1 if the batch itself is malformed.
+ */
+static int lz4_compress_batch(struct xc_sr_context *ctx, struct iovec *iov,
+                              int iovcnt, unsigned int nr_pages,
+                              uint32_t *flags, uint32_t *length)
+{
+    static const LZ4F_preferences_t prefs = {
+        .frameInfo = {
+            .blockSizeID = XC_SR_COMPRESS_BLOCK_SIZE,
+            .blockChecksumFlag = LZ4F_blockChecksumEnabled,
+        },
+    };
+    xc_interface *xch = ctx->xch;
+    size_t raw = (size_t)nr_pages * PAGE_SIZE, clen, staged;
+    uint8_t *dst;
+    int i;
+
+    if ( nr_pages == 0 )
+        return iovcnt;
+
+    if ( !ctx->save.lz4_staging_buf )
+    {
+        size_t bound = LZ4F_compressFrameBound(MAX_BATCH_SIZE * PAGE_SIZE,
+                                               &prefs);
+
+        ctx->save.lz4_staging_buf = malloc(MAX_BATCH_SIZE * PAGE_SIZE);
+        ctx->save.lz4_compress_buf = malloc(bound);
+        ctx->save.lz4_compress_buf_size = bound;
+
+        if ( !ctx->save.lz4_staging_buf || !ctx->save.lz4_compress_buf )
+        {
+            IPRINTF("Unable to allocate LZ4 buffers, sending uncompressed");
+            cleanup_compression(ctx);
+            ctx->save.compression = XC_SR_COMPRESS_NONE;
+            return iovcnt;
+        }
+    }
+
+    /* The iov must match nr_pages, or stale bytes would be compressed. */
+    for ( i = 2, staged = 0; i < iovcnt; ++i )
+        staged += iov[i].iov_len;
+    if ( staged != raw )
+    {
+        ERROR("Staged %zu bytes for a batch of %u pages", staged, nr_pages);
+        return -1;
+    }
+
+    /* LZ4 must not read live guest memory: the frame could decode wrong. */
+    for ( i = 2, dst = ctx->save.lz4_staging_buf; i < iovcnt; ++i )
+    {
+        memcpy(dst, iov[i].iov_base, iov[i].iov_len);
+        dst += iov[i].iov_len;
+    }
+
+    clen = LZ4F_compressFrame(ctx->save.lz4_compress_buf,
+                              ctx->save.lz4_compress_buf_size,
+                              ctx->save.lz4_staging_buf, raw, &prefs);
+
+    if ( LZ4F_isError(clen) )
+    {
+        IPRINTF("LZ4 compression failed: %s, sending uncompressed",
+                LZ4F_getErrorName(clen));
+        cleanup_compression(ctx);
+        ctx->save.compression = XC_SR_COMPRESS_NONE;
+        return iovcnt;
+    }
+
+    /* The stream format allows LZ4 only when strictly shorter. */
+    if ( clen >= raw )
+    {
+        DBGPRINTF("LZ4: %zu -> %zu bytes, sending uncompressed", raw, clen);
+        return iovcnt;
+    }
+
+    DBGPRINTF("LZ4: %zu -> %zu bytes (%zu.%zu%% ratio)", raw, clen,
+              (clen * 1000 / raw) / 10, (clen * 1000 / raw) % 10);
+
+    /* Pad in place: raw is a multiple of REC_ALIGN and > clen, so it fits. */
+    memset((uint8_t *)ctx->save.lz4_compress_buf + clen, 0,
+           ROUNDUP(clen, REC_ALIGN) - clen);
+
+    iov[2].iov_base = ctx->save.lz4_compress_buf;
+    iov[2].iov_len = ROUNDUP(clen, REC_ALIGN);
+
+    *flags |= PAGE_DATA_ALGO_LZ4;
+    *length -= raw - clen;
+
+    /* iov[0] headers, iov[1] pfns, iov[2] page data frame. */
+    return 3;
+}
+#endif /* XG_SR_LZ4 */
+
 /*
  * Writes a batch of memory as a PAGE_DATA record into the stream.  The batch
  * is constructed in ctx->save.buffers->batch_pfns.
@@ -228,6 +340,26 @@ static int write_batch(struct xc_sr_context *ctx)
     for ( i = 0; i < nr_pfns; ++i )
         rec_pfns[i] = ((uint64_t)(types[i]) << 32) | batch_pfns[i];
 
+    switch ( ctx->save.compression )
+    {
+    case XC_SR_COMPRESS_NONE:
+        break;
+
+    case XC_SR_COMPRESS_LZ4:
+#if defined(XG_SR_LZ4)
+        iovcnt = lz4_compress_batch(ctx, iov, iovcnt, nr_pages,
+                                    &hdrs.page_data.flags, &hdrs.rec.length);
+        /*
+         * -1: iov[2..] is not nr_pages pages.  Compressed: stale bytes for
+         * missing pages, or extra pages dropped, unseen by the checksums.
+         * Uncompressed: rec.length would not match the bytes writev() writes.
+         */
+        if ( iovcnt < 0 )
+            goto err;
+#endif
+        break;
+    }
+
     if ( writev_exact(ctx->fd, iov, iovcnt) )
     {
         PERROR("Failed to write page data to stream");
@@ -807,6 +939,7 @@ static void cleanup(struct xc_sr_context *ctx)
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
     free(ctx->save.buffers);
+    cleanup_compression(ctx);
 }
 
 /*
-- 
2.43.0


