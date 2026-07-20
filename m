Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB0AC44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 15:50:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366744.1616702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFl-0007Py-3m; Mon, 20 Jul 2026 15:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366744.1616702; Mon, 20 Jul 2026 15:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFk-0007Pk-Vx; Mon, 20 Jul 2026 15:50:00 +0000
Received: by outflank-mailman (input) for mailman id 1366744;
 Mon, 20 Jul 2026 15:50:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1wlqFj-0007Ny-VZ
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 15:50:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqFj-00GJmC-Ca
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 17:49:59 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e43a0-5cb7-0a2a0a5109dd-0a2a4505affa-4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:49:59 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e43a6-4cb1-0a2a45050019-a0658309df94-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:49:59 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 653958291CA3;
 Mon, 20 Jul 2026 11:48:17 -0400 (EDT)
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
Subject: [PATCH v1 4/6] tools/libs/guest: adaptively disable LZ4 on poor compression ratio
Date: Mon, 20 Jul 2026 16:48:29 +0100
Message-ID: <20260720154832.1907401-5-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720154832.1907401-1-marcus.granado@citrix.com>
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1784562599-F72B32A1-51A010A8/0/0
X-purgate-type: clean
X-purgate-size: 7864

If a VM's memory contain mostly incompressible page content, avoid
wasting CPU on both sender and receiver.

Add a per-iteration ratio tracker so that, after each precopy
iteration, the average compression ratio across all batches of that
iteration is computed; if it is worse than XC_SR_COMPRESS_ITER_THRESHOLD
(90%), ctx->compression is downgraded to XC_SR_COMPRESS_NONE for the
remainder of the migration.

Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---
 tools/libs/guest/xg_sr_common.h |  18 ++++++
 tools/libs/guest/xg_sr_save.c   | 109 ++++++++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index ccb02511ec..2b5b2ce26a 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -269,6 +269,24 @@ struct xc_sr_context
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
 
+            /*
+             * Compression ratio tracking per iteration. Accumulated by
+             * the compression function for each batch and evaluated at
+             * the end of every precopy iteration to decide whether to
+             * disable compression for the remaining iterations
+             */
+            uint64_t compress_raw_total;      /* uncompressed, this iter */
+            uint64_t compress_out_total;      /* compressed, this iter */
+
+            /*
+             * Cumulative compression totals across the whole save (not
+             * reset per iteration). Used for the final compression summary
+             * logged during teardown, remain valid even if adaptive
+             * disabling turned compression off partway through
+             */
+            uint64_t compress_raw_all_total;  /* uncompressed, all iters */
+            uint64_t compress_out_all_total;  /* compressed, all iters */
+
 #ifdef HAVE_LZ4
             /*
              * Persistent LZ4 output buffer (avoids repeated malloc/free),
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 8f661f0168..dbbcddf6fd 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -19,6 +19,15 @@
  */
 #define XC_SR_COMPRESS_BATCH_THRESHOLD  97
 
+/*
+ * Per-iteration compression ratio threshold (percentage). After each
+ * precopy iteration, the average compression ratio across all batches is
+ * calculated. If it exceeds this value, compression is disabled for all
+ * remaining iterations, as the data is not compressible enough to
+ * justify the CPU cost. Set to >= 100 to disable this adaptive behaviour
+ */
+#define XC_SR_COMPRESS_ITER_THRESHOLD   90
+
 /*
  * Writes an Image header and Domain header into the stream.
  */
@@ -89,6 +98,99 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
     return write_record(ctx, &checkpoint);
 }
 
+/*
+ * Reset accumulators for compression ratio per iteration. Called at the
+ * start of each precopy iteration so that the ratio reflects only the
+ * current iteration's batches
+ */
+static void compress_stats_reset(struct xc_sr_context *ctx)
+{
+    ctx->save.compress_raw_total = 0;
+    ctx->save.compress_out_total = 0;
+}
+
+/*
+ * Accumulate compression statistics for a single batch. Called from
+ * the compression function after every LZ4_compress_default() (or any
+ * future compressor) so the totals per iteration stay up to date
+ */
+static inline void compress_stats_accumulate(struct xc_sr_context *ctx,
+                                             size_t raw_len,
+                                             size_t compressed_len)
+{
+    ctx->save.compress_raw_total += raw_len;
+    ctx->save.compress_out_total += compressed_len;
+    ctx->save.compress_raw_all_total += raw_len;
+    ctx->save.compress_out_all_total += compressed_len;
+}
+
+static void cleanup_compression(struct xc_sr_context *ctx);
+
+/*
+ * Evaluate the compression ratio per iteration. If the average ratio
+ * across all batches in the completed iteration exceeds the threshold,
+ * the data is not compressible enough to justify the CPU cost, then
+ * disable compression for all remaining iterations
+ */
+static void compress_stats_evaluate(struct xc_sr_context *ctx,
+                                    unsigned int iteration)
+{
+    xc_interface *xch = ctx->xch;
+    unsigned long ratio_permil;
+
+    if ( ctx->compression == XC_SR_COMPRESS_NONE )
+        return;
+
+    if ( ctx->save.compress_raw_total == 0 )
+        return;
+
+    ratio_permil = (unsigned long)(ctx->save.compress_out_total * 1000 /
+                                   ctx->save.compress_raw_total);
+
+    IPRINTF("Iteration %u: compressed %lu -> %lu bytes "
+            "(%lu.%lu%% average ratio)",
+            iteration,
+            (unsigned long)ctx->save.compress_raw_total,
+            (unsigned long)ctx->save.compress_out_total,
+            ratio_permil / 10, ratio_permil % 10);
+
+    if ( ctx->save.compress_out_total * 100 >=
+         ctx->save.compress_raw_total * XC_SR_COMPRESS_ITER_THRESHOLD )
+    {
+        IPRINTF("Iteration %u: average compression ratio %lu.%lu%% "
+                "(>= %u%% threshold) - disabling compression for "
+                "remaining iterations",
+                iteration, ratio_permil / 10, ratio_permil % 10,
+                XC_SR_COMPRESS_ITER_THRESHOLD);
+        cleanup_compression(ctx);
+        ctx->compression = XC_SR_COMPRESS_NONE;
+    }
+}
+
+/*
+ * Log a final compression summary covering the whole save. Called once
+ * during teardown. compress_*_all_total accumulate across all iterations
+ * (never reset), so this is meaningful even if adaptive disabling turned
+ * compression off partway through
+ */
+static void compress_stats_summary(struct xc_sr_context *ctx)
+{
+    xc_interface *xch = ctx->xch;
+    unsigned long ratio_permil;
+
+    if ( ctx->save.compress_raw_all_total == 0 )
+        return;
+
+    ratio_permil = (unsigned long)(ctx->save.compress_out_all_total * 1000 /
+                                   ctx->save.compress_raw_all_total);
+
+    IPRINTF("Compression summary: compressed %lu -> %lu bytes "
+            "(%lu.%lu%% average ratio) over the whole save",
+            (unsigned long)ctx->save.compress_raw_all_total,
+            (unsigned long)ctx->save.compress_out_all_total,
+            ratio_permil / 10, ratio_permil % 10);
+}
+
 #ifdef HAVE_LZ4
 /*
  * Allocate LZ4 compression buffers during setup_compression()
@@ -196,6 +298,8 @@ static bool lz4_compress_batch(struct xc_sr_context *ctx, unsigned int nr_pages,
         compressed_len = off;
     }
 
+    compress_stats_accumulate(ctx, raw_len, compressed_len);
+
     /*
      * Decline: if compression didn't shrink the data enough, send
      * uncompressed page data instead. This avoids transmitting extra
@@ -702,6 +806,8 @@ static int send_memory_live(struct xc_sr_context *ctx)
         policy_decision = precopy_policy(*policy_stats, data);
         x++;
 
+        compress_stats_reset(ctx);
+
         if ( stats.dirty_count > 0 && policy_decision != XGS_POLICY_ABORT )
         {
             rc = update_progress_string(ctx, &progress_str);
@@ -713,6 +819,8 @@ static int send_memory_live(struct xc_sr_context *ctx)
                 goto out;
         }
 
+        compress_stats_evaluate(ctx, x);
+
         if ( policy_decision != XGS_POLICY_CONTINUE_PRECOPY )
             break;
 
@@ -1055,6 +1163,7 @@ static void cleanup(struct xc_sr_context *ctx)
     free(ctx->save.deferred_pages);
     free(ctx->save.batch_pfns);
 
+    compress_stats_summary(ctx);
     cleanup_compression(ctx);
 }
 
-- 
2.43.0


