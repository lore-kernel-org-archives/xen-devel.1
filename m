Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5457D606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 20:08:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1456380.1669758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG8V-000583-MH; Tue, 20 Oct 2026 20:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456380.1669758; Tue, 20 Oct 2026 20:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG8V-00057w-IZ; Tue, 20 Oct 2026 20:08:39 +0000
Received: by outflank-mailman (input) for mailman id 1456380;
 Tue, 20 Oct 2026 20:08:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1xJG8U-00057q-Ly
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:08:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJG8T-0066gM-KU
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:08:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7ca16-8faa-0a2a0a5109dd-0a2a4508cd4a-18
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:08:37 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c954-f659-0a2a45080019-a0658309d064-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:04:36 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id B059E842421A;
 Tue, 20 Oct 2026 16:03:52 -0400 (EDT)
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
Subject: [PATCH v2 9/9] tools/libs/guest: compress the PAGE_DATA pfn array too
Date: Tue, 20 Oct 2026 21:02:37 +0100
Message-ID: <20261020200238.1815766-10-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020200238.1815766-1-marcus.granado@citrix.com>
References: <20261020200238.1815766-1-marcus.granado@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1792526677-DF8D587B-60237905/13/0
X-purgate-type: clean
X-purgate-size: 28017
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An LZ4 PAGE_DATA record compresses only its page data.  Its pfn array,
8 bytes per page, still travels in plaintext ahead of the frame.

Define bit 8 of the flags field: the pfn array is compressed too, with
the record's algorithm, as a frame of its own immediately before the
page data frame.  That makes it easier to handle the pfns and the page
data separately, in both the saver and restore.  Bit 8 needs an
algorithm other than PAGE_DATA_ALGO_NONE.  For PAGE_DATA_ALGO_LZ4 both
frames carry block checksums.  The count stays in plaintext, so restore
can bound it before decoding anything, and finds the page data frame
where decoding the pfn frame ends.  The saver sets bit 8 on every batch
it compresses, except when a) the pfn frame is no smaller than the
array, so would save nothing, or b) the size rule below applies, for
backwards compatibility.  Restore decodes both frames with a new helper,
which resets the LZ4 context before each frame.

This compresses the whole record body apart from count and flags, as
discussed in v1.  Compressing the pfn array saves a little on real
traffic: 0.33% of the page data bytes for a compressible 64 GiB guest,
0.016% for an incompressible one.

The size rule (b) makes the saver send the pfn array in plaintext when
the two frames total 8 * count bytes plus a whole number of pages.  A
receiver without "tools/libs/guest: reject non-zero reserved fields in
PAGE_DATA" ignores the flags field, so it reads the frames as count
pfns followed by page data.  Its checks of those pfns may let them
pass, which leaves its exact length check as the only certain
rejection, and that check could pass at exactly those sizes.  This rule
can be removed once every receiver has that commit, which is marked for
backport to 4.17 and later.  libxenguest does not check the rule on
restore, as that would prevent it ever being removed; only the Python
stream checker does, as a test of the saver.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---

Notes:
    Changes in v2:
    - New in v2.  Andrew Cooper suggested the pfn array to be compressed
      too; in v1 review Frediano Ziglio asked about compressing whole
      records.
    
    Tested: builds with and without liblz4; the Python unit tests; a round
    trip of the changed save and restore functions with Xen stubbed out,
    under ASan and UBSan, through uncompressed records, LZ4 records with
    plaintext and with compressed pfns, the size-rule fallback and malformed
    bit-8 records; and live migrations with xl migrate --compress --debug.

 docs/specs/libxc-migration-stream.pandoc |  55 ++++++++-
 tools/libs/guest/xg_sr_restore.c         | 140 ++++++++++++++++-------
 tools/libs/guest/xg_sr_save.c            |  59 ++++++++--
 tools/libs/guest/xg_sr_stream_format.h   |   8 +-
 tools/python/xen/migration/libxc.py      |  43 ++++++-
 tools/python/xen/migration/tests.py      |  39 ++++++-
 6 files changed, 284 insertions(+), 60 deletions(-)

diff --git a/docs/specs/libxc-migration-stream.pandoc b/docs/specs/libxc-migration-stream.pandoc
index 2d25e70e13..86028c7d20 100644
--- a/docs/specs/libxc-migration-stream.pandoc
+++ b/docs/specs/libxc-migration-stream.pandoc
@@ -326,7 +326,47 @@ flags       Bit 7-0:  Algorithm used to encode page_data.
                       does not implement, rather than attempting to
                       interpret the page_data.
 
-            Bit 31-8: Reserved.  Set to zero on save.  A restoring side
+            Bit 8:    Compressed pfn array.  The pfn array is
+                      compressed too, with the algorithm in bits 7-0.
+                      May only be set when bits 7-0 are not 0x00; a
+                      restoring side must reject the record otherwise.
+
+                      When set, the pfn array is not present in
+                      plaintext.  The flags field is instead followed
+                      by pfn_frame, whose decompressed content is the
+                      count pfn entries (count * 8 octets, encoded as
+                      for pfn below), then page_data_frame, whose
+                      decompressed content is page_size octets for each
+                      page set as present in that pfn array.  They are
+                      back to back, with no separator, length field or
+                      padding between them.
+
+                      The length of pfn_frame is not recorded; a
+                      restoring side finds its end by decoding it, so
+                      an algorithm can only be used with bit 8 if its
+                      encoding marks its own end.  count is never
+                      compressed, so that a restoring side can bound
+                      its buffers before decompressing anything.
+
+                      For algorithm 0x01, both are complete LZ4 frames.
+                      Both must set the block-checksum flag, and a
+                      restoring side must reject one which does not.
+                      page_data_frame is subject to the rules for
+                      algorithm 0x01, and a restoring side must reject
+                      a pfn_frame which does not decode to exactly
+                      count * 8 octets.
+
+                      A saving side must send the record with bit 8
+                      clear instead, the pfn array in plaintext and
+                      page_data_frame as page_data, when the two frames
+                      together, L octets, satisfy L >= count * 8 and
+                      (L - count * 8) is a multiple of page_size.  This
+                      ensures that a restoring side which ignores this
+                      field, as revisions 1 to 3 of this specification
+                      required, and so judges the record by its length
+                      alone, rejects it rather than misreading it.
+
+            Bit 31-9: Reserved.  Set to zero on save.  A restoring side
                       must reject a record with any of these bits set.
 
 pfn         An array of count PFNs and their types.
@@ -346,6 +386,19 @@ page_data   Contents of each page set as present in the pfn array,
 Note: Count is strictly > 0.  N is strictly <= C and it is possible for there
 to be no page_data in the record if all pfns are of invalid types.
 
+When flags bit 8 is set, the record is instead laid out as follows:
+
+     0     1     2     3     4     5     6     7 octet
+    +-----------------------+-------------------------+
+    | count (C)             | flags                   |
+    +-----------------------+-------------------------+
+    | pfn_frame...                                    |
+    ...
+    +-------------------------------------------------+
+    | page_data_frame...                              |
+    ...
+    +-------------------------------------------------+
+
 --------------------------------------------------------------------
 PFINFO type    Value      Description
 -------------  ---------  ------------------------------------------
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 29a3b13253..79dbfccd2f 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -356,32 +356,19 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 
 #if defined(XG_SR_LZ4)
 /*
- * Decode the LZ4 frame at src into ctx->restore.lz4_decomp_buf.  The
- * decoded size comes from the pfn array.
+ * Decode the LZ4 frame at the start of src into exactly dst_len bytes of
+ * ctx->restore.lz4_decomp_buf.  With consumed NULL the frame must use all of
+ * src, which rejects trailing data; otherwise its length is returned there.
  */
-static void *decompress_page_data(struct xc_sr_context *ctx, const void *src,
-                                  size_t src_len, unsigned int nr_pages)
+static void *lz4_decode_frame(struct xc_sr_context *ctx, const char *what,
+                              const void *src, size_t src_len, size_t dst_len,
+                              size_t *consumed)
 {
     xc_interface *xch = ctx->xch;
     LZ4F_frameInfo_t info;
-    size_t expected = (size_t)nr_pages * PAGE_SIZE;
-    size_t out_len = expected, hdr_len = src_len, rest_len, in_len, ret;
-
-    /* The buffer is a fixed MAX_BATCH_SIZE pages. */
-    if ( nr_pages > MAX_BATCH_SIZE )
-    {
-        ERROR("Compressed PAGE_DATA record with %u pages exceeds MAX_BATCH_SIZE %u",
-              nr_pages, MAX_BATCH_SIZE);
-        return NULL;
-    }
+    size_t out_len = dst_len, hdr_len = src_len, rest_len, in_len, ret;
 
-    /* The format requires the frame to be strictly shorter than the pages. */
-    if ( src_len >= expected )
-    {
-        ERROR("LZ4 frame in PAGE_DATA record (%zu bytes) is not shorter than its page data (%zu bytes)",
-              src_len, expected);
-        return NULL;
-    }
+    assert(dst_len <= MAX_BATCH_SIZE * PAGE_SIZE);
 
     if ( !ctx->restore.lz4_dctx )
     {
@@ -402,15 +389,15 @@ static void *decompress_page_data(struct xc_sr_context *ctx, const void *src,
     ret = LZ4F_getFrameInfo(ctx->restore.lz4_dctx, &info, src, &hdr_len);
     if ( LZ4F_isError(ret) )
     {
-        ERROR("LZ4 frame in PAGE_DATA record has a bad header: %s",
-              LZ4F_getErrorName(ret));
+        ERROR("LZ4 %s frame in PAGE_DATA record has a bad header: %s",
+              what, LZ4F_getErrorName(ret));
         return NULL;
     }
 
     /* liblz4 accepts frames without the block checksums required here. */
     if ( info.blockChecksumFlag != LZ4F_blockChecksumEnabled )
     {
-        ERROR("LZ4 frame in PAGE_DATA record has no block checksums");
+        ERROR("LZ4 %s frame in PAGE_DATA record has no block checksums", what);
         return NULL;
     }
 
@@ -436,36 +423,64 @@ static void *decompress_page_data(struct xc_sr_context *ctx, const void *src,
 
     if ( LZ4F_isError(ret) )
     {
-        ERROR("Failed to decompress PAGE_DATA record: %s",
-              LZ4F_getErrorName(ret));
+        ERROR("Failed to decompress LZ4 %s frame in PAGE_DATA record: %s",
+              what, LZ4F_getErrorName(ret));
         return NULL;
     }
 
     /* Not an error, but the frame did not end: input or output ran out. */
     if ( ret != 0 )
     {
-        ERROR("LZ4 frame in PAGE_DATA record is truncated or decodes to over %zu bytes",
-              expected);
+        ERROR("LZ4 %s frame in PAGE_DATA record is truncated or decodes to over %zu bytes",
+              what, dst_len);
         return NULL;
     }
 
     /* in_len and out_len now hold the bytes consumed and produced. */
-    if ( out_len != expected )
+    if ( out_len != dst_len )
     {
-        ERROR("LZ4 frame in PAGE_DATA record produced %zu bytes, expected %zu",
-              out_len, expected);
+        ERROR("LZ4 %s frame in PAGE_DATA record produced %zu bytes, expected %zu",
+              what, out_len, dst_len);
         return NULL;
     }
 
-    if ( in_len != rest_len )
+    if ( consumed )
+        *consumed = hdr_len + in_len;
+    else if ( in_len != rest_len )
     {
-        ERROR("LZ4 frame in PAGE_DATA record followed by %zu unconsumed bytes",
-              rest_len - in_len);
+        ERROR("LZ4 %s frame in PAGE_DATA record followed by %zu unconsumed bytes",
+              what, rest_len - in_len);
         return NULL;
     }
 
     return ctx->restore.lz4_decomp_buf;
 }
+
+/* Decompress the page data frame at src, of nr_pages pages. */
+static void *decompress_page_data(struct xc_sr_context *ctx, const void *src,
+                                  size_t src_len, unsigned int nr_pages)
+{
+    xc_interface *xch = ctx->xch;
+    size_t expected = (size_t)nr_pages * PAGE_SIZE;
+
+    /* The buffer is a fixed MAX_BATCH_SIZE pages. */
+    if ( nr_pages > MAX_BATCH_SIZE )
+    {
+        ERROR("Compressed PAGE_DATA record with %u pages exceeds MAX_BATCH_SIZE %u",
+              nr_pages, MAX_BATCH_SIZE);
+        return NULL;
+    }
+
+    /* The format requires the frame to be strictly shorter than the pages. */
+    if ( src_len >= expected )
+    {
+        ERROR("LZ4 frame in PAGE_DATA record (%zu bytes) is not shorter than its page data (%zu bytes)",
+              src_len, expected);
+        return NULL;
+    }
+
+    return lz4_decode_frame(ctx, "page data", src, src_len, expected, NULL);
+}
 #endif /* XG_SR_LZ4 */
 
 /*
@@ -476,7 +491,9 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
 {
     xc_interface *xch = ctx->xch;
     struct xc_sr_rec_page_data_header *pages = rec->data;
+    const uint64_t *rec_pfns;
     unsigned int i, pages_of_data = 0;
+    size_t pfn_len;
     void *page_data;
     int rc = -1;
 
@@ -523,17 +540,54 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
+    /* Compressed pfns need an algorithm; only LZ4 is implemented. */
+    if ( (pages->flags & PAGE_DATA_FLAG_COMPRESSED_PFNS) &&
+         (pages->flags & PAGE_DATA_ALGO_MASK) != PAGE_DATA_ALGO_LZ4 )
+    {
+        ERROR("Compressed pfn array with unsupported algorithm %u in PAGE_DATA record",
+              (unsigned int)(pages->flags & PAGE_DATA_ALGO_MASK));
+        goto err;
+    }
+
     if ( pages->count < 1 )
     {
         ERROR("Expected at least 1 pfn in PAGE_DATA record");
         goto err;
     }
 
-    if ( rec->length < sizeof(*pages) + (pages->count * sizeof(uint64_t)) )
+    if ( pages->flags & PAGE_DATA_FLAG_COMPRESSED_PFNS )
     {
-        ERROR("PAGE_DATA record (length %u) too short to contain %u"
-              " pfns worth of information", rec->length, pages->count);
+#if defined(XG_SR_LZ4)
+        if ( pages->count > MAX_BATCH_SIZE )
+        {
+            ERROR("Compressed pfns in PAGE_DATA record: count %u exceeds MAX_BATCH_SIZE %u",
+                  pages->count, MAX_BATCH_SIZE);
+            goto err;
+        }
+
+        /* The page data frame overwrites these, after the copy below. */
+        rec_pfns = lz4_decode_frame(ctx, "pfn", pages->pfn,
+                                    rec->length - sizeof(*pages),
+                                    pages->count * sizeof(uint64_t),
+                                    &pfn_len);
+        if ( !rec_pfns )
+            goto err;
+#else
+        ERROR("LZ4 compressed PAGE_DATA record but LZ4 support not compiled in");
         goto err;
+#endif
+    }
+    else
+    {
+        if ( rec->length < sizeof(*pages) + (pages->count * sizeof(uint64_t)) )
+        {
+            ERROR("PAGE_DATA record (length %u) too short to contain %u"
+                  " pfns worth of information", rec->length, pages->count);
+            goto err;
+        }
+
+        rec_pfns = pages->pfn;
+        pfn_len = pages->count * sizeof(uint64_t);
     }
 
     pfns = malloc(pages->count * sizeof(*pfns));
@@ -547,21 +601,21 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
 
     for ( i = 0; i < pages->count; ++i )
     {
-        if ( pages->pfn[i] & PAGE_DATA_PFN_RESZ_MASK )
+        if ( rec_pfns[i] & PAGE_DATA_PFN_RESZ_MASK )
         {
             ERROR("Reserved bits set in pfn[%u]: %#"PRIx64, i,
-                  pages->pfn[i]);
+                  rec_pfns[i]);
             goto err;
         }
 
-        pfn = pages->pfn[i] & PAGE_DATA_PFN_MASK;
+        pfn = rec_pfns[i] & PAGE_DATA_PFN_MASK;
         if ( !ctx->restore.ops.pfn_is_valid(ctx, pfn) )
         {
             ERROR("pfn %#"PRIpfn" (index %u) outside domain maximum", pfn, i);
             goto err;
         }
 
-        type = (pages->pfn[i] & PAGE_DATA_TYPE_MASK) >> 32;
+        type = (rec_pfns[i] & PAGE_DATA_TYPE_MASK) >> 32;
         if ( !is_known_page_type(type) )
         {
             ERROR("Unknown type %#"PRIx32" for pfn %#"PRIpfn" (index %u)",
@@ -578,7 +632,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         types[i] = type;
     }
 
-    page_data = &pages->pfn[pages->count];
+    page_data = (uint8_t *)pages->pfn + pfn_len;
 
     switch ( pages->flags & PAGE_DATA_ALGO_MASK )
     {
@@ -598,7 +652,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     case PAGE_DATA_ALGO_LZ4:
 #if defined(XG_SR_LZ4)
     {
-        size_t hdrsz = sizeof(*pages) + (sizeof(uint64_t) * pages->count);
+        size_t hdrsz = sizeof(*pages) + pfn_len;
 
         page_data = decompress_page_data(ctx, page_data,
                                          rec->length - hdrsz, pages_of_data);
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index fe3d78bdd6..192abc82c5 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -150,11 +150,19 @@ static void compress_stats_evaluate(struct xc_sr_context *ctx)
  */
 #define XC_SR_COMPRESS_BLOCK_SIZE LZ4F_max4MB
 
+/* Size rule: could len bytes pass as pfns_len of pfns plus whole pages? */
+static bool page_data_size_clash(size_t len, size_t pfns_len)
+{
+    return len >= pfns_len && (len - pfns_len) % PAGE_SIZE == 0;
+}
+
 /*
  * Compress the page data in iov[2..iovcnt) into an LZ4 frame, and replace
- * those entries with one describing it, padded to the record alignment.
- * Returns the new iovcnt, the original one with iov untouched if the batch
- * should be sent uncompressed, or -1 if the batch itself is malformed.
+ * those entries with one describing it, padded to the record alignment.  The
+ * pfn array in iov[1] becomes a second frame too, unless that is no smaller or
+ * the size rule applies.  Returns the new iovcnt, the original one with iov
+ * untouched if the batch should be sent uncompressed, or -1 if the batch
+ * itself is malformed.
  */
 static int lz4_compress_batch(struct xc_sr_context *ctx, struct iovec *iov,
                               int iovcnt, unsigned int nr_pages,
@@ -167,7 +175,7 @@ static int lz4_compress_batch(struct xc_sr_context *ctx, struct iovec *iov,
         },
     };
     xc_interface *xch = ctx->xch;
-    size_t raw = (size_t)nr_pages * PAGE_SIZE, clen, staged;
+    size_t raw = (size_t)nr_pages * PAGE_SIZE, clen, pfn_clen, staged, pad;
     uint8_t *dst;
     int i;
 
@@ -176,8 +184,9 @@ static int lz4_compress_batch(struct xc_sr_context *ctx, struct iovec *iov,
 
     if ( !ctx->save.lz4_staging_buf )
     {
+        /* The page data frame plus up to REC_ALIGN - 1 bytes of padding. */
         size_t bound = LZ4F_compressFrameBound(MAX_BATCH_SIZE * PAGE_SIZE,
-                                               &prefs);
+                                               &prefs) + REC_ALIGN;
 
         ctx->save.lz4_staging_buf = malloc(MAX_BATCH_SIZE * PAGE_SIZE);
         ctx->save.lz4_compress_buf = malloc(bound);
@@ -233,16 +242,44 @@ static int lz4_compress_batch(struct xc_sr_context *ctx, struct iovec *iov,
               (clen * 1000 / raw) / 10, (clen * 1000 / raw) % 10);
     compress_stats_accumulate(ctx, raw, clen);
 
-    /* Pad in place: raw is a multiple of REC_ALIGN and > clen, so it fits. */
-    memset((uint8_t *)ctx->save.lz4_compress_buf + clen, 0,
-           ROUNDUP(clen, REC_ALIGN) - clen);
-
-    iov[2].iov_base = ctx->save.lz4_compress_buf;
-    iov[2].iov_len = ROUNDUP(clen, REC_ALIGN);
+    /* The pages are compressed: reuse the staging buffer for the pfn frame. */
+    assert(LZ4F_compressFrameBound(iov[1].iov_len, &prefs) <=
+           MAX_BATCH_SIZE * PAGE_SIZE);
+    pfn_clen = LZ4F_compressFrame(ctx->save.lz4_staging_buf,
+                                  MAX_BATCH_SIZE * PAGE_SIZE,
+                                  iov[1].iov_base, iov[1].iov_len, &prefs);
+
+    /*
+     * The size rule only protects receivers without "tools/libs/guest:
+     * reject non-zero reserved fields in PAGE_DATA"; drop it once none remain.
+     * Such a receiver reads the frames as iov[1].iov_len bytes of pfns and
+     * pages, so page_data_size_clash() checks the lengths as it sees them.
+     */
+    if ( LZ4F_isError(pfn_clen) || pfn_clen >= iov[1].iov_len ||
+         page_data_size_clash(pfn_clen + clen, iov[1].iov_len) )
+        DBGPRINTF("LZ4: sending %zu bytes of pfns uncompressed",
+                  iov[1].iov_len);
+    else
+    {
+        *flags |= PAGE_DATA_FLAG_COMPRESSED_PFNS;
+        *length -= iov[1].iov_len - pfn_clen;
+        iov[1].iov_base = ctx->save.lz4_staging_buf;
+        iov[1].iov_len = pfn_clen;
+    }
 
     *flags |= PAGE_DATA_ALGO_LZ4;
     *length -= raw - clen;
 
+    /* Pad in place: the buffer was allocated with REC_ALIGN to spare. */
+    pad = ROUNDUP(*length, REC_ALIGN) - *length;
+    memset((uint8_t *)ctx->save.lz4_compress_buf + clen, 0, pad);
+
+    iov[2].iov_base = ctx->save.lz4_compress_buf;
+    iov[2].iov_len = clen + pad;
+
+    assert(iov[0].iov_len + iov[1].iov_len + iov[2].iov_len ==
+           sizeof(struct xc_sr_rhdr) + ROUNDUP(*length, REC_ALIGN));
+
     /* iov[0] headers, iov[1] pfns, iov[2] page data frame. */
     return 3;
 }
diff --git a/tools/libs/guest/xg_sr_stream_format.h b/tools/libs/guest/xg_sr_stream_format.h
index af695ae771..9bc5b75104 100644
--- a/tools/libs/guest/xg_sr_stream_format.h
+++ b/tools/libs/guest/xg_sr_stream_format.h
@@ -87,9 +87,13 @@ struct xc_sr_rec_page_data_header
     uint64_t pfn[0];
 };
 
-/* PAGE_DATA flags: bits 7-0 are the algorithm, bits 31-8 are reserved. */
+/*
+ * PAGE_DATA flags: bits 7-0 are the algorithm, bit 8 marks a compressed pfn
+ * array, bits 31-9 are reserved.
+ */
 #define PAGE_DATA_ALGO_MASK       0x000000ffU
-#define PAGE_DATA_FLAGS_RESZ_MASK 0xffffff00U
+#define PAGE_DATA_FLAG_COMPRESSED_PFNS 0x00000100U
+#define PAGE_DATA_FLAGS_RESZ_MASK 0xfffffe00U
 
 #define PAGE_DATA_ALGO_NONE       0x00000000U
 #define PAGE_DATA_ALGO_LZ4        0x00000001U
diff --git a/tools/python/xen/migration/libxc.py b/tools/python/xen/migration/libxc.py
index 10e163e272..5e606a70ee 100644
--- a/tools/python/xen/migration/libxc.py
+++ b/tools/python/xen/migration/libxc.py
@@ -86,9 +86,11 @@ PAGE_DATA_FORMAT             = "II"
 PAGE_DATA_PFN_MASK           = (1 << 52) - 1
 PAGE_DATA_PFN_RESZ_MASK      = ((1 << 60) - 1) & ~((1 << 52) - 1)
 
-# page_data flags: bits 7-0 algorithm, bits 31-8 reserved (must reject)
+# page_data flags: bits 7-0 algorithm, bit 8 pfn array compressed too (not with
+# algorithm 0), bits 31-9 reserved (must reject)
 PAGE_DATA_ALGO_MASK          = 0x000000ff
-PAGE_DATA_FLAGS_RESZ_MASK    = 0xffffff00
+PAGE_DATA_FLAG_COMPRESSED_PFNS = 0x00000100
+PAGE_DATA_FLAGS_RESZ_MASK    = 0xfffffe00
 PAGE_DATA_ALGO_NONE          = 0x00
 PAGE_DATA_ALGO_LZ4           = 0x01
 
@@ -278,6 +280,10 @@ class VerifyLibxc(VerifyBase):
 
         algo = flags & PAGE_DATA_ALGO_MASK
 
+        if flags & PAGE_DATA_FLAG_COMPRESSED_PFNS:
+            self.verify_page_data_compressed_pfns(content[minsz:], count, algo)
+            return
+
         pfnsz = count * 8
         if (len(content) - minsz) < pfnsz:
             raise RecordError(
@@ -333,6 +339,39 @@ class VerifyLibxc(VerifyBase):
                 "Unsupported algorithm %u in PAGE_DATA record" % (algo, ))
 
 
+    def verify_page_data_compressed_pfns(self, payload, count, algo):
+        """ Page Data record whose pfn array is compressed too """
+
+        if algo == PAGE_DATA_ALGO_NONE:
+            raise RecordError(
+                "Compressed pfn array without an algorithm in PAGE_DATA record")
+        if algo != PAGE_DATA_ALGO_LZ4:
+            raise StreamError(
+                "Unsupported algorithm %u in PAGE_DATA record" % (algo, ))
+
+        if count == 0:
+            raise RecordError("PAGE_DATA record with no pfns")
+
+        # Without decompressing, check the saver's size rule: not count pfns
+        # plus whole pages, which a receiver ignoring flags could misread.
+        pfnsz = count * 8
+        if len(payload) >= pfnsz and (len(payload) - pfnsz) % 4096 == 0:
+            raise RecordError(
+                "Compressed PAGE_DATA payload of %u is %u pfns and whole pages"
+                % (len(payload), count))
+
+        # Only the pfn frame's header is checkable: the page data frame starts
+        # where decoding the pfn frame ends.
+        if len(payload) < PAGE_DATA_LZ4_FRAME_MIN:
+            raise RecordError(
+                "LZ4 frame in PAGE_DATA record too short: %u bytes"
+                % (len(payload), ))
+
+        if not ord(payload[4:5]) & PAGE_DATA_LZ4_FLG_BLOCKSUM:
+            raise RecordError(
+                "LZ4 frame in PAGE_DATA record has no block checksums")
+
+
     def verify_record_x86_pv_info(self, content):
         """ x86 PV Info record """
 
diff --git a/tools/python/xen/migration/tests.py b/tools/python/xen/migration/tests.py
index 9e6d925e51..dd7e8eb5cd 100644
--- a/tools/python/xen/migration/tests.py
+++ b/tools/python/xen/migration/tests.py
@@ -74,10 +74,47 @@ class TestLibxc(unittest.TestCase):
         # An unimplemented algorithm, and any reserved bit, are refused.
         self.assertRaises(libxc.StreamError, v.verify_record_page_data,
                           rec(libxc.PAGE_DATA_ALGO_LZ4 + 1, FRAME))
-        for bit in range(8, 32):
+        for bit in range(9, 32):
             self.assertRaises(libxc.StreamError, v.verify_record_page_data,
                               rec(1 << bit, PAGE))
 
+    def test_page_data_compressed_pfns(self):
+        """ PAGE_DATA with the pfn array compressed too (flags bit 8) """
+
+        v = libxc.VerifyLibxc(lambda *_: None, lambda *_: b"")
+        FRAME = b"\x04\x22\x4d\x18\x70\x70\x72" + b"\x00" * 93
+        PFNS = libxc.PAGE_DATA_FLAG_COMPRESSED_PFNS
+        LZ4 = libxc.PAGE_DATA_ALGO_LZ4
+
+        def rec(count, flags, payload):
+            return pack(libxc.PAGE_DATA_FORMAT, count, flags) + payload
+
+        # Two frames are fine unless they total 8 * count plus whole pages,
+        # which a receiver ignoring the flags could misread.
+        v.verify_record_page_data(rec(1024, PFNS | LZ4, FRAME + FRAME))
+        v.verify_record_page_data(rec(16, PFNS | LZ4, FRAME + FRAME))
+        for extra in (0, 4096, 2 * 4096):
+            self.assertRaises(libxc.RecordError, v.verify_record_page_data,
+                              rec(16, PFNS | LZ4,
+                                  FRAME + b"\x00" * (128 + extra - 100)))
+
+        # The pfn frame has a whole header, with block checksums, and there
+        # are pfns at all.
+        self.assertRaises(libxc.RecordError, v.verify_record_page_data,
+                          rec(16, PFNS | LZ4, FRAME[:6]))
+        self.assertRaises(libxc.RecordError, v.verify_record_page_data,
+                          rec(16, PFNS | LZ4,
+                              FRAME[:4] + b"\x60" + FRAME[5:] + FRAME))
+        self.assertRaises(libxc.RecordError, v.verify_record_page_data,
+                          rec(0, PFNS | LZ4, FRAME + FRAME))
+
+        # Bit 8 needs a compression algorithm, and one this checker knows.
+        self.assertRaises(libxc.RecordError, v.verify_record_page_data,
+                          rec(16, PFNS | libxc.PAGE_DATA_ALGO_NONE,
+                              FRAME + FRAME))
+        self.assertRaises(libxc.StreamError, v.verify_record_page_data,
+                          rec(16, PFNS | (LZ4 + 1), FRAME + FRAME))
+
 
 class TestLibxl(unittest.TestCase):
 
-- 
2.43.0


