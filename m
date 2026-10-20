Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5A8606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 20:04:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1456208.1669722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG4J-0002DB-9u; Tue, 20 Oct 2026 20:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456208.1669722; Tue, 20 Oct 2026 20:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG4J-0002D3-6Z; Tue, 20 Oct 2026 20:04:19 +0000
Received: by outflank-mailman (input) for mailman id 1456208;
 Tue, 20 Oct 2026 20:04:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1xJG4H-0002Bc-RT
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:04:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJG4H-00EFnl-8M
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:04:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c920-2eae-0a2a0a5409dd-0a2a45088be8-26
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:04:17 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c93f-f659-0a2a45080019-a06583098f38-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:04:17 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 29D17842421A;
 Tue, 20 Oct 2026 16:03:32 -0400 (EDT)
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
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin@tarides.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 5/9] tools/libs/guest: stop compressing PAGE_DATA when it stops paying off
Date: Tue, 20 Oct 2026 21:02:33 +0100
Message-ID: <20261020200238.1815766-6-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020200238.1815766-1-marcus.granado@citrix.com>
References: <20261020200238.1815766-1-marcus.granado@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1792526657-DF6D687B-5A915AB0/0/0
X-purgate-type: clean
X-purgate-size: 6136
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When LZ4 compression is in use, write_batch() compresses the page data
of every batch until the end of the save, whatever the result.  For a
guest whose memory hardly compresses, this spends CPU at both ends for
little or no reduction of the stream.

Total the page data bytes before and after compression over each
precopy iteration, counting a batch sent uncompressed as no saving.  If
an iteration's total after compression is 90% or more of its total
before, stop compressing for the rest of the save.

The check runs in send_memory_live() at the end of each precopy
iteration.  A non-live save (xc_domain_save() without XCFLAGS_LIVE) has
no precopy iterations, so it never stops compressing.

The 90% threshold is a heuristic; a poor choice costs CPU or bandwidth,
never correctness.  Log, at info level, the ratio of each judged
iteration, the decision to stop and a summary of the batches sent while
compression was on.

Suggested-by: Edwin Török <edvin@tarides.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---

Notes:
    Changes in v2:
    - Was v1 4/6, "adaptively disable LZ4 on poor compression ratio".
    - A batch sent uncompressed counts as no saving; v1 counted its
      compressed size.

 tools/libs/guest/xg_sr_common.h |  9 +++++
 tools/libs/guest/xg_sr_save.c   | 69 +++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index e567a47582..38ec1da095 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -275,6 +275,15 @@ struct xc_sr_context
             /* Which algorithm to compress page data with. */
             enum xc_sr_compression compression;
 
+            /*
+             * Page data bytes before (raw) and after (out) compression, in
+             * the current iteration and in all iterations so far.
+             */
+            uint64_t compress_raw_total;
+            uint64_t compress_out_total;
+            uint64_t compress_raw_all_total;
+            uint64_t compress_out_all_total;
+
             /* LZ4 staging and output buffers, allocated on first use. */
             void *lz4_staging_buf;
             void *lz4_compress_buf;
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 33954a7023..4fa1d22859 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -83,6 +83,67 @@ static void cleanup_compression(struct xc_sr_context *ctx)
 }
 
 #if defined(XG_SR_LZ4)
+static void compress_stats_reset(struct xc_sr_context *ctx)
+{
+    ctx->save.compress_raw_total = 0;
+    ctx->save.compress_out_total = 0;
+}
+
+static void compress_stats_accumulate(struct xc_sr_context *ctx,
+                                      size_t raw_len, size_t compressed_len)
+{
+    ctx->save.compress_raw_total += raw_len;
+    ctx->save.compress_out_total += compressed_len;
+    ctx->save.compress_raw_all_total += raw_len;
+    ctx->save.compress_out_all_total += compressed_len;
+}
+
+static void compress_stats_summary(const struct xc_sr_context *ctx)
+{
+    xc_interface *xch = ctx->xch;
+    uint64_t raw = ctx->save.compress_raw_all_total;
+    uint64_t out = ctx->save.compress_out_all_total;
+    unsigned int permil;
+
+    if ( !raw )
+        return;
+
+    permil = out * 1000 / raw;
+    IPRINTF("Compression summary: compressed %"PRIu64" -> %"PRIu64" bytes (%u.%u%% average ratio) while compression was on",
+            raw, out, permil / 10, permil % 10);
+}
+
+#define XC_SR_COMPRESS_ITER_THRESHOLD 90
+
+static void compress_stats_evaluate(struct xc_sr_context *ctx)
+{
+    xc_interface *xch = ctx->xch;
+    uint64_t raw = ctx->save.compress_raw_total;
+    uint64_t out = ctx->save.compress_out_total;
+    unsigned int iter = ctx->save.stats.iteration;
+
+    if ( ctx->save.compression == XC_SR_COMPRESS_NONE )
+        return;
+
+    if ( raw )
+    {
+        unsigned int permil = out * 1000 / raw;
+
+        IPRINTF("Iteration %u: compressed %"PRIu64" -> %"PRIu64" bytes (%u.%u%% average ratio)",
+                iter, raw, out, permil / 10, permil % 10);
+
+        if ( out * 100 >= raw * XC_SR_COMPRESS_ITER_THRESHOLD )
+        {
+            IPRINTF("Iteration %u: at or above the %u%% threshold - disabling compression for remaining iterations",
+                    iter, XC_SR_COMPRESS_ITER_THRESHOLD);
+            ctx->save.compression = XC_SR_COMPRESS_NONE;
+            cleanup_compression(ctx);
+        }
+    }
+
+    compress_stats_reset(ctx);
+}
+
 /*
  * One block per 4MB batch: smaller blocks can be 2x slower to decode.
  * liblz4 allows 64KB, 256KB, 1MB and 4MB.
@@ -164,11 +225,13 @@ static int lz4_compress_batch(struct xc_sr_context *ctx, struct iovec *iov,
     if ( clen >= raw )
     {
         DBGPRINTF("LZ4: %zu -> %zu bytes, sending uncompressed", raw, clen);
+        compress_stats_accumulate(ctx, raw, raw);
         return iovcnt;
     }
 
     DBGPRINTF("LZ4: %zu -> %zu bytes (%zu.%zu%% ratio)", raw, clen,
               (clen * 1000 / raw) / 10, (clen * 1000 / raw) % 10);
+    compress_stats_accumulate(ctx, raw, clen);
 
     /* Pad in place: raw is a multiple of REC_ALIGN and > clen, so it fits. */
     memset((uint8_t *)ctx->save.lz4_compress_buf + clen, 0,
@@ -638,6 +701,9 @@ static int send_memory_live(struct xc_sr_context *ctx)
             rc = send_dirty_pages(ctx, stats.dirty_count);
             if ( rc )
                 goto out;
+#if defined(XG_SR_LZ4)
+            compress_stats_evaluate(ctx);
+#endif
         }
 
         if ( policy_decision != XGS_POLICY_CONTINUE_PRECOPY )
@@ -939,6 +1005,9 @@ static void cleanup(struct xc_sr_context *ctx)
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
     free(ctx->save.buffers);
+#if defined(XG_SR_LZ4)
+    compress_stats_summary(ctx);
+#endif
     cleanup_compression(ctx);
 }
 
-- 
2.43.0


