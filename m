Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F275C5B56A
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:31:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387330.1628636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHM-0005Nb-Jb; Mon, 10 Aug 2026 10:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387330.1628636; Mon, 10 Aug 2026 10:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHM-0005NI-FW; Mon, 10 Aug 2026 10:30:48 +0000
Received: by outflank-mailman (input) for mailman id 1387330;
 Mon, 10 Aug 2026 10:30:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wtNHL-00056B-5W
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:30:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtNHK-00Dyin-IZ
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:30:46 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a854-bab6-0a2a0a5309dd-0a2a450799ec-8
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:46 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a856-b4ea-0a2a45070019-d1558033dd86-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:46 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49802c418b5so16277125e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 03:30:46 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995bb8b668sm218478455e9.0.2026.08.10.03.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 03:30:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786357846; x=1786962646; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=noFi4Nk2/RkhWge/ysH4KvzMVBLDNZGcIPZ/3WMBXro=;
        b=Imf5WD3OT3FoiLQZlFAhUwHzfItTrfwcC805OQe8ZgUajU6edQ48oxW1Fp/lfVgGfK
         qweM9sP1zGrsbgXTalSCme7QTKxTV0IcW0HIHzupvYTAZAQOPq8ikTOPLYM+J6AusguP
         U+1dN7vFfDumlHhVs8RwAaZc++wxf2V0Y0YQ11RtZjFvId3XePbwPn2sMebNOYXZlkD7
         NBepaUPBSB721VMjuGJL+V1u7ZuHTg0QVXqjfLJt6EmCpqt8FkX4N3XPOa4JyOagawoq
         psE6/XJzxu+dXGJzy8CN2VX79RLp+QIKi0fNncf6WBcxTZiD7T5uqt2mMNk5UTwBFWFD
         UbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357846; x=1786962646;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=noFi4Nk2/RkhWge/ysH4KvzMVBLDNZGcIPZ/3WMBXro=;
        b=bfL7TnJxG2kVKz+iUOkJkJG5IXuXG6lwoL+YhCgQLefxQASALSLUxEZQy3oIxRelRq
         u7dop67zjyem7dsc/FqvYdwUOP/hP4JjxsFU1WbPJeOBjIAg/xXyREcURSx+FP6SuCg+
         8rg4FJAC66JPrjRVGsIEshY8YeTwaPA/VLY2Z2nROqz6CTCx/9CMwYGLH/AaJ84ASV0K
         44w1T1oDCZLqKLELYwJ7UY6qOWuz59bNDz1V64u8IILKFtNWSCfXisetZGNYHoHrAziH
         AdcY7avMvoD8BnUT18bxvIZOXGBuTKENLXAMOWnYWR5W4uKXzZiVTLXUdSpfqQwvClGA
         tKxw==
X-Gm-Message-State: AOJu0Yx19SGQ/cWTb7+JmUyMs49hgk34uzecIY8k3CPdzwJlcTrJOFiQ
	3u8QJDHnB/V01y8Gp9JAWQC121qlynJ7y1CpHB5RkSzI/1lEVc9VZq8w8Z/h1hBvrlI=
X-Gm-Gg: AR+sD12WeVVYwl5ZtZG/KZif3EoxcPUp/Owu9vs1dmpdEEmg9ef57g7wH0sKIRaIxCG
	Ua4mFNUQ1zY+iZ/AAipP+op/DlIZAzmh+itZlF7xfi1ZtrM9jV5HfLGacmt5DioTNap3K3aTSsZ
	VgjvRPzlKMgrqo+PZGt+X7BSlLf0O2jk+AM5TLQTAz2zq2PuGya8L4SqqpmYk7suBPQc51fHM5X
	aUbJFBLXBmNrNr/KGTvur21ymH7nRElsQIANCdZn/RMJwEjqcUaHntLKPot39bTkY2KdRL4Kf9+
	e345jt/LYg9xAVfYZ508IyYn9qOh2aoeiySI9g0YFVhjuV3H0kGWQyOlYfb+BpRkZzo5DQbIEI+
	KKZ4o7btN7r19HCsA01qZ12PdzpKVSBK3na8AAKOdh5vfqaYWwLbBNdchUgFSGgs/6VXVlI7g0A
	C+3WfTe45Zf2M5O06AzoSyyRCt6ctlc5HkSWy+8FoLDINdtEL7KudvswVy/ODa/IYTYDSmvUKIY
	AH9ilWkwM4auEZqcvqGvVoNdODgUcQQPySX4HoV
X-Received: by 2002:a05:600c:1391:b0:499:4dca:aa4 with SMTP id 5b1f17b1804b1-4996194deb6mr204011195e9.4.1786357845569;
        Mon, 10 Aug 2026 03:30:45 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v10 6/10] libs/guest: use foreign copy API during migration
Date: Mon, 10 Aug 2026 11:30:09 +0100
Message-ID: <20260810103018.54564-7-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810103018.54564-1-frediano.ziglio@citrix.com>
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1786357846-378D1AE4-808F9804/0/0
X-purgate-type: clean
X-purgate-size: 13400

From: Edwin Török <edwin.torok@citrix.com>

Use foreign code emulation code provided by previous commit to prepare
to use new hypercall.
This to make sure there are no regression in both functionality and
performance.

In particular tested:
- HVM VM;
- PV VM;
- verification code.

Migration times did not change.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v6:
- merge with "finalize PoC" to remove the PoC;
- remove statistics, old and not clear at all how they were made;
- describe tests made.
---
 tools/libs/guest/xg_sr_common.h  |  4 +-
 tools/libs/guest/xg_sr_restore.c | 78 +++++++++++++++++---------------
 tools/libs/guest/xg_sr_save.c    | 62 +++++++++++--------------
 3 files changed, 71 insertions(+), 73 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 50f235ba87..ec3435790a 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -243,6 +243,7 @@ struct xc_sr_context
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
+            xc_hypercall_buffer_t dest_buf;
             struct xc_sr_context_save_buffers
             {
                 xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
@@ -256,8 +257,6 @@ struct xc_sr_context
                 struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
                 MEM_NOACCESS_BUFFER(na4, 64);
                 uint64_t rec_pfns[MAX_BATCH_SIZE];
-                MEM_NOACCESS_BUFFER(na5, 64);
-                int errors[MAX_BATCH_SIZE];
             } *buffers;
         } save;
 
@@ -269,6 +268,7 @@ struct xc_sr_context
             int send_back_fd;
             unsigned long p2m_size;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
+            xc_hypercall_buffer_t verify_buf;
 
             /* From Image Header. */
             uint32_t format_version;
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 458eaa5992..af97f3d466 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -257,16 +257,15 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = malloc(count * sizeof(*mfns));
-    int *map_errs = malloc(count * sizeof(*map_errs));
     int rc;
-    void *mapping = NULL, *guest_page = NULL;
     unsigned int nr_pages = 0;
+    void *const source = page_data;
 
-    if ( !mfns || !map_errs )
+    if ( !mfns )
     {
         rc = -1;
         ERROR("Failed to allocate %zu bytes to process page data",
-              count * (sizeof(*mfns) + sizeof(*map_errs)));
+              count * sizeof(*mfns));
         goto err;
     }
 
@@ -294,27 +293,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     if ( nr_pages == 0 )
         goto done;
 
-    mapping = guest_page = xenforeignmemory_map(
-        xch->fmem, ctx->domid, PROT_READ | PROT_WRITE,
-        nr_pages, mfns, map_errs);
-    if ( !mapping )
-    {
-        rc = -1;
-        PERROR("Unable to map %u mfns for %u pages of data",
-               nr_pages, count);
-        goto err;
-    }
-
     for ( unsigned int i = 0; i < nr_pages; ++i )
     {
-        if ( map_errs[i] )
-        {
-            rc = -1;
-            ERROR("Mapping pfn %#"PRIpfn" (mfn %#"PRIpfn", type %#"PRIx32") failed with %d",
-                  pfns[i], mfns[i], types[i], map_errs[i]);
-            goto err;
-        }
-
         /* Undo page normalisation done by the saver. */
         rc = ctx->restore.ops.localise_page(ctx, types[i], page_data);
         if ( rc )
@@ -324,31 +304,41 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
             goto err;
         }
 
-        if ( ctx->restore.verify )
+        page_data += PAGE_SIZE;
+    }
+    if ( !ctx->restore.verify )
+    {
+        rc = xg_foreignmemory_copy_to(xch, ctx->domid, nr_pages, mfns, source);
+        if ( rc < 0 )
+            goto err;
+    }
+    else
+    {
+        DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, verify_buf,
+                                        &ctx->restore.verify_buf);
+        void *guest_page = verify_buf;
+
+        rc = xg_foreignmemory_copy_from(xch, ctx->domid, nr_pages, verify_buf, mfns);
+        if ( rc < 0 )
+            goto err;
+
+        page_data = source;
+        for ( unsigned int i = 0; i < nr_pages; ++i )
         {
             /* Verify mode - compare incoming data to what we already have. */
             if ( memcmp(guest_page, page_data, PAGE_SIZE) )
                 ERROR("verify pfn %#"PRIpfn" failed (type %#"PRIx32")",
                       pfns[i], types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
-        }
-        else
-        {
-            /* Regular mode - copy incoming data into place. */
-            memcpy(guest_page, page_data, PAGE_SIZE);
-        }
 
-        guest_page += PAGE_SIZE;
-        page_data += PAGE_SIZE;
+            guest_page += PAGE_SIZE;
+            page_data += PAGE_SIZE;
+        }
     }
 
  done:
     rc = 0;
 
  err:
-    if ( mapping )
-        xenforeignmemory_unmap(xch->fmem, mapping, nr_pages);
-
-    free(map_errs);
     free(mfns);
 
     return rc;
@@ -738,6 +728,18 @@ static int setup(struct xc_sr_context *ctx)
     int rc;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->restore.dirty_bitmap_hbuf);
+    DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, verify_buf,
+                                    &ctx->restore.verify_buf);
+
+    verify_buf = xc_hypercall_buffer_alloc_pages(
+        xch, verify_buf, MAX_BATCH_SIZE);
+
+    if ( !verify_buf )
+    {
+        ERROR("Unable to allocate memory for test buffer");
+        rc = -1;
+        goto err;
+    }
 
     if ( ctx->stream_type == XC_STREAM_COLO )
     {
@@ -786,6 +788,8 @@ static void cleanup(struct xc_sr_context *ctx)
     unsigned int i;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->restore.dirty_bitmap_hbuf);
+    DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, verify_buf,
+                                    &ctx->restore.verify_buf);
 
     for ( i = 0; i < ctx->restore.buffered_rec_num; i++ )
         free(ctx->restore.buffered_records[i].data);
@@ -794,6 +798,8 @@ static void cleanup(struct xc_sr_context *ctx)
         xc_hypercall_buffer_free_pages(
             xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->restore.p2m_size)));
 
+    xc_hypercall_buffer_free_pages(xch, verify_buf, MAX_BATCH_SIZE);
+
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 96d7e9e2f8..6b381f0219 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -86,11 +86,9 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    void *guest_mapping = NULL;
     int rc = -1;
-    unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
+    unsigned int i, nr_pages = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
-    void *page, *orig_page;
     int iovcnt = 0;
     xen_pfn_t *const batch_pfns = ctx->save.buffers->batch_pfns;
     struct {
@@ -111,8 +109,6 @@ static int write_batch(struct xc_sr_context *ctx)
     xen_pfn_t *const mfns = ctx->save.buffers->mfns;
     /* Types of the batch pfns. */
     xen_pfn_t *const types = ctx->save.buffers->types;
-    /* Errors from attempting to map the gfns. */
-    int *const errors = ctx->save.buffers->errors;
     /* Pointers to locally allocated pages.  Need freeing. */
     void **const local_pages = ctx->save.buffers->local_pages;
     /* iovec[] for writev(). */
@@ -170,30 +166,26 @@ static int write_batch(struct xc_sr_context *ctx)
         mfns[nr_pages++] = mfns[i];
     }
 
-    if ( nr_pages > 0 )
+    if ( nr_pages )
     {
-        guest_mapping = xenforeignmemory_map(
-            xch->fmem, ctx->domid, PROT_READ, nr_pages, mfns, errors);
-        if ( !guest_mapping )
+        DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, dest_buf,
+                                        &ctx->save.dest_buf);
+
+        rc = xg_foreignmemory_copy_from(xch, ctx->domid, nr_pages, dest_buf, mfns);
+        if ( rc < 0 )
         {
-            PERROR("Failed to map guest pages");
+            ERROR("xg_foreignmemory_copy_from failed");
             goto err;
         }
-        nr_pages_mapped = nr_pages;
 
-        for ( i = 0, p = 0; i < nr_pfns; ++i )
+        for ( unsigned int i = 0, p = 0; i < nr_pfns; ++i )
         {
+            void *page, *orig_page;
+
             if ( !page_type_has_stream_data(types[i]) )
                 continue;
 
-            if ( errors[p] )
-            {
-                ERROR("Mapping of pfn %#"PRIpfn" (mfn %#"PRIpfn") failed %d",
-                      batch_pfns[i], mfns[p], errors[p]);
-                goto err;
-            }
-
-            orig_page = page = guest_mapping + (p * PAGE_SIZE);
+            orig_page = page = dest_buf + (p * PAGE_SIZE);
             rc = ctx->save.ops.normalise_page(ctx, types[i], &page);
 
             if ( orig_page != page )
@@ -201,15 +193,13 @@ static int write_batch(struct xc_sr_context *ctx)
 
             if ( rc )
             {
-                if ( rc == -1 && errno == EAGAIN )
-                {
-                    set_bit(batch_pfns[i], ctx->save.deferred_pages);
-                    ++ctx->save.nr_deferred_pages;
-                    types[i] = XEN_DOMCTL_PFINFO_XTAB;
-                    --nr_pages;
-                }
-                else
+                if ( rc != -1 || errno != EAGAIN )
                     goto err;
+
+                set_bit(batch_pfns[i], ctx->save.deferred_pages);
+                ++ctx->save.nr_deferred_pages;
+                types[i] = XEN_DOMCTL_PFINFO_XTAB;
+                --nr_pages;
             }
             else if ( iov[iovcnt - 1].iov_base + iov[iovcnt - 1].iov_len !=
                       page )
@@ -222,8 +212,6 @@ static int write_batch(struct xc_sr_context *ctx)
             {
                 iov[iovcnt - 1].iov_len += PAGE_SIZE;
             }
-
-            rc = -1;
             ++p;
         }
     }
@@ -236,14 +224,13 @@ static int write_batch(struct xc_sr_context *ctx)
     if ( writev_exact(ctx->fd, iov, iovcnt) )
     {
         PERROR("Failed to write page data to stream");
+        rc = -1;
         goto err;
     }
 
     rc = ctx->save.nr_batch_pfns = 0;
 
  err:
-    if ( guest_mapping )
-        xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; i < nr_pfns; ++i )
     {
         free(local_pages[i]);
@@ -770,17 +757,21 @@ static int setup(struct xc_sr_context *ctx)
     int rc;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
+    DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, dest_buf,
+                                    &ctx->save.dest_buf);
 
     rc = ctx->save.ops.setup(ctx);
     if ( rc )
         goto err;
 
+    dest_buf = xc_hypercall_buffer_alloc_pages(
+        xch, dest_buf, MAX_BATCH_SIZE);
     dirty_bitmap = xc_hypercall_buffer_alloc_pages(
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
     ctx->save.buffers = calloc(1, sizeof(*ctx->save.buffers));
 
-    if ( !ctx->save.buffers || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !ctx->save.buffers || !dirty_bitmap || !ctx->save.deferred_pages || !dest_buf )
     {
         ERROR("Unable to allocate memory for dirty bitmaps, deferred pages"
               " and various batch buffers");
@@ -793,7 +784,6 @@ static int setup(struct xc_sr_context *ctx)
     MEM_NOACCESS_INIT(ctx->save.buffers->na2);
     MEM_NOACCESS_INIT(ctx->save.buffers->na3);
     MEM_NOACCESS_INIT(ctx->save.buffers->na4);
-    MEM_NOACCESS_INIT(ctx->save.buffers->na5);
 
     rc = 0;
 
@@ -806,7 +796,8 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
-
+    DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, dest_buf,
+                                    &ctx->save.dest_buf);
 
     xc_shadow_control(xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_OFF,
                       NULL, 0);
@@ -816,6 +807,7 @@ static void cleanup(struct xc_sr_context *ctx)
 
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
+    xc_hypercall_buffer_free_pages(xch, dest_buf, MAX_BATCH_SIZE);
     free(ctx->save.deferred_pages);
     free(ctx->save.buffers);
 }
-- 
2.43.0


