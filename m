Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B42C5AC82
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:30:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387326.1628600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHH-0004R7-E0; Mon, 10 Aug 2026 10:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387326.1628600; Mon, 10 Aug 2026 10:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHH-0004R0-AT; Mon, 10 Aug 2026 10:30:43 +0000
Received: by outflank-mailman (input) for mailman id 1387326;
 Mon, 10 Aug 2026 10:30:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wtNHF-0004A8-UM
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:30:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtNHE-00AlTW-T7
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:30:40 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a84a-e002-0a2a0a5209dd-0a2a450bb4c2-14
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:40 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a850-b7e8-0a2a450b0019-d1558031dcd9-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:40 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4954afac04bso18664995e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 03:30:40 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995bb8b668sm218478455e9.0.2026.08.10.03.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 03:30:39 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786357840; x=1786962640; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVzljfbFKFoNV9C92LIEgW8vPbCFaLYksP7zU4eJtPg=;
        b=mAuUos2CXlYTXPWJltByqIPNA33B+CgqhMp2167Xx6dyFfepDXvO40fF5An+0q0o+E
         uz5ssDPs9wHWyjOEuw0W47iT063PE9BajXSY4saCCbn67KO0or2rvSbQJQ0/nmWvEtYu
         29x5+3XxesexNMqS1Hlhrw6ivLT41PTv/ZYWqquuyz3xXN3ZyLfkkQCWmXHeqI+kOTuG
         UoUZB09yML3HC5v0LcswG8hslDVMAhhja4J9qEsXImnRQhvRN3U9c2gCCC/D6MpowiG3
         3cVxCL2ngY/gBz5rlntqxpmxVJnQBOO9uPTrIbSIegc4g80J0B0oJPzZHdt6nsLYRAmy
         r1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357840; x=1786962640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVzljfbFKFoNV9C92LIEgW8vPbCFaLYksP7zU4eJtPg=;
        b=nKglD52EDNS4oY59KtjyIiwDFYVjuHitrDfoS/imn8nWV6O6V1+nMEhU/EDEEj7ALm
         ZK0VAcOW/gq48pCS1ier5vzBWxBsPSctZp37ru4C4iPCS3O2VxCp8H8CtELny4Q9qleq
         cW2fC30yQfS1J9dpS7jw+g7QRlohlW85zU99FqrZdbRHrq5VJawzZHgueXg+h7KsvRN0
         aqK7qGI3teKPN/IfGJDpLlnh5kwRe0EAJGr82jVvsh3WtBGhZku0YMwdRhHY6b3v1heq
         JCkZ3EUutgrlRbfTT6tLWIYDDGJlFf2hM7W1Adhtg3FUzQVkdXqP6dBJUMXcwORgomvY
         pTZQ==
X-Gm-Message-State: AOJu0YyWDgjO99Ob7zCEhPbbyI3Pes52LgD7lnsGJYz6G+4rsiGGgHhQ
	MgM/74PG6m9z5E75hMKZgWdwDreLOwP0/DHa/ePEOlmG6JH4F971mVAVRpCgK6etzQg=
X-Gm-Gg: AR+sD13RNGobMQJo3WwOBOMTB3HvYO7+pHv1fR3QB0TyrK6n6qDh+3UtqbSE4Jah4e5
	qniKf7rnb248cqvTB8k7Bi2BvZseXROq/iDzLqEHfATrAKu4CQpLWJnAHcwLv6VWFR/WoWJThu9
	/7uFcnYmjZ8k7fQKjpC43PJDXIDAvTK+1sjQPPS8JyFEjpSgR32+AD0E9uAetJxGXIxSnQIEcNj
	wvmnO1/aQ3CkTO6z/5r2mCB+RBvPskwF6fO4+hgRPxEV7dobfyVIIOWik9jfbDksyjKxM6RAXhO
	PaXFHoPz8Lhe69ZMN2z33uqoCr1p5db9OLp10A0d0+EXi8w+Ratoql/mdljKo8ubhIxZcZrR1GG
	/7fKfDYCKuAhr6nppLbjqdSQFZsVP4MoE7n2QyC+VFHckCwWKVw0cetiEm1Cv7Djagi714MigSy
	OCnC7hX7hQ/gJseYZ3U1mkp6akij6ahAibWoXFwPyLaX7l12WzXEfOEjVEEZ10bD4GI6zeTZh+k
	ZItuQPBeIcBz5mDVUrNkLD4c/9kfAfV2DHvkdIp
X-Received: by 2002:a05:600c:3555:b0:499:521d:bff1 with SMTP id 5b1f17b1804b1-4996194e53emr251879455e9.2.1786357840167;
        Mon, 10 Aug 2026 03:30:40 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v10 2/10] libs/guest: move batch_pfns into a separate structure
Date: Mon, 10 Aug 2026 11:30:05 +0100
Message-ID: <20260810103018.54564-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810103018.54564-1-frediano.ziglio@citrix.com>
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1786357840-AB0DD9EA-63863286/0/0
X-purgate-type: clean
X-purgate-size: 6125

Preparation for a followup patch "libs/guest: allocate various migration
arrays just once".

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
Changes since v6:
- split from "libs/guest: allocate various migration arrays just once".

Changes since v7:
- initialize "batch_pfns" on declaration.

Changes since v8:
- remove useless check;
- added Reviewed-by.
---
 tools/libs/guest/xg_sr_common.h |  5 ++++-
 tools/libs/guest/xg_sr_save.c   | 28 ++++++++++++++--------------
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index f1573aefcb..7574c9f5b6 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -239,11 +239,14 @@ struct xc_sr_context
 
             struct precopy_stats stats;
 
-            xen_pfn_t *batch_pfns;
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
+            struct xc_sr_context_save_buffers
+            {
+                xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+            } *buffers;
         } save;
 
         struct /* Restore data. */
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 84fdbe4140..22348db445 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -75,7 +75,7 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 
 /*
  * Writes a batch of memory as a PAGE_DATA record into the stream.  The batch
- * is constructed in ctx->save.batch_pfns.
+ * is constructed in ctx->save.buffers->batch_pfns.
  *
  * This function:
  * - gets the types for each pfn in the batch.
@@ -95,6 +95,7 @@ static int write_batch(struct xc_sr_context *ctx)
     void *page, *orig_page;
     uint64_t *rec_pfns = NULL;
     struct iovec *iov = NULL; int iovcnt = 0;
+    xen_pfn_t *const batch_pfns = ctx->save.buffers->batch_pfns;
     struct {
         struct xc_sr_rhdr rec;
         struct xc_sr_rec_page_data_header page_data;
@@ -110,6 +111,7 @@ static int write_batch(struct xc_sr_context *ctx)
     };
 
     assert(nr_pfns != 0);
+    assert(nr_pfns <= MAX_BATCH_SIZE);
 
     /* Mfns of the batch pfns. */
     mfns = malloc(nr_pfns * sizeof(*mfns));
@@ -141,13 +143,12 @@ static int write_batch(struct xc_sr_context *ctx)
 
     for ( i = 0; i < nr_pfns; ++i )
     {
-        types[i] = mfns[i] = ctx->save.ops.pfn_to_gfn(ctx,
-                                                      ctx->save.batch_pfns[i]);
+        types[i] = mfns[i] = ctx->save.ops.pfn_to_gfn(ctx, batch_pfns[i]);
 
         /* Likely a ballooned page. */
         if ( mfns[i] == INVALID_MFN )
         {
-            set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
+            set_bit(batch_pfns[i], ctx->save.deferred_pages);
             ++ctx->save.nr_deferred_pages;
         }
     }
@@ -193,7 +194,7 @@ static int write_batch(struct xc_sr_context *ctx)
             if ( errors[p] )
             {
                 ERROR("Mapping of pfn %#"PRIpfn" (mfn %#"PRIpfn") failed %d",
-                      ctx->save.batch_pfns[i], mfns[p], errors[p]);
+                      batch_pfns[i], mfns[p], errors[p]);
                 goto err;
             }
 
@@ -207,7 +208,7 @@ static int write_batch(struct xc_sr_context *ctx)
             {
                 if ( rc == -1 && errno == EAGAIN )
                 {
-                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
+                    set_bit(batch_pfns[i], ctx->save.deferred_pages);
                     ++ctx->save.nr_deferred_pages;
                     types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
@@ -235,7 +236,7 @@ static int write_batch(struct xc_sr_context *ctx)
     hdrs.rec.length += nr_pages * PAGE_SIZE;
 
     for ( i = 0; i < nr_pfns; ++i )
-        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
+        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | batch_pfns[i];
 
     if ( writev_exact(ctx->fd, iov, iovcnt) )
     {
@@ -274,9 +275,9 @@ static int flush_batch(struct xc_sr_context *ctx)
 
     if ( !rc )
     {
-        VALGRIND_MAKE_MEM_UNDEFINED(ctx->save.batch_pfns,
+        VALGRIND_MAKE_MEM_UNDEFINED(ctx->save.buffers->batch_pfns,
                                     MAX_BATCH_SIZE *
-                                    sizeof(*ctx->save.batch_pfns));
+                                    sizeof(*ctx->save.buffers->batch_pfns));
     }
 
     return rc;
@@ -293,7 +294,7 @@ static int add_to_batch(struct xc_sr_context *ctx, xen_pfn_t pfn)
         rc = flush_batch(ctx);
 
     if ( rc == 0 )
-        ctx->save.batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
+        ctx->save.buffers->batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
 
     return rc;
 }
@@ -784,11 +785,10 @@ static int setup(struct xc_sr_context *ctx)
 
     dirty_bitmap = xc_hypercall_buffer_alloc_pages(
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
-    ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
-                                  sizeof(*ctx->save.batch_pfns));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
+    ctx->save.buffers = calloc(1, sizeof(*ctx->save.buffers));
 
-    if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !ctx->save.buffers || !dirty_bitmap || !ctx->save.deferred_pages )
     {
         ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
               " deferred pages");
@@ -819,7 +819,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
-    free(ctx->save.batch_pfns);
+    free(ctx->save.buffers);
 }
 
 /*
-- 
2.43.0


