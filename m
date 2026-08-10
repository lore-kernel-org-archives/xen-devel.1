Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231AFC5AC82
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:30:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387327.1628609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHI-0004eP-LO; Mon, 10 Aug 2026 10:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387327.1628609; Mon, 10 Aug 2026 10:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHI-0004eF-H9; Mon, 10 Aug 2026 10:30:44 +0000
Received: by outflank-mailman (input) for mailman id 1387327;
 Mon, 10 Aug 2026 10:30:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wtNHH-0004Qx-Cx
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:30:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtNHG-000B9X-Pv
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:30:42 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a84d-2eae-0a2a0a5409dd-0a2a450ce5b4-16
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:42 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a852-f479-0a2a450c0019-d155802fe454-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:42 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso12486915e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 03:30:42 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995bb8b668sm218478455e9.0.2026.08.10.03.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 03:30:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786357842; x=1786962642; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2NxxLpvMxvCVNIhMLzqk93Yy2TTgs6s75lOWPEK4aL8=;
        b=WWMY34C84Gr2gIQEaxu6lLq5DNlTNwYhWCjGo99tLHoTTAvvrEBhKdpXVAbhAER/dI
         xShAcUzSH6rwIcYm8/jy0ws8yXx3PHzxsdqcnLu9p6Rb0sJl9/ZlsXwRzaKKOKdODe/4
         J9uRIaqeGCwJM8sbY+y7+si3q4684NniBbD+rI5k567JdZnhd3bEkF7Xa6ghzFaLtKCQ
         tT8WhcB1XQlMhrssCb9KlpBt6P/u9vm3nYM1M7e5wpiSZcZaA4KfkceT1D0cUwKUBsQX
         81rDHFTEYpQ5FXn2siLlCQUWryUYDOpzVtczDUlX70JZsJFUW0HTuq10BSELoc7RQsdS
         8cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357842; x=1786962642;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NxxLpvMxvCVNIhMLzqk93Yy2TTgs6s75lOWPEK4aL8=;
        b=U7Ob54e4udQPEf4hbQRTlSHgq9WxFYvsq03m0qBkGVFVETVl4Ivo/8qhTQOA6/iVNn
         NXsuhZD9lxC4+mojFx+Ex/s+nsuYPMBSK2cIYtSWQfEwJN7ZG0V974NK0HIhQzqev7HI
         nzQ4AtzUAuHYamubwQiBHJZ5M32zL30vy8ADHht9NxRM5l8M5Jb1ghr1YWbSK4e7xkjL
         CyFqYVIAMIk+wwomy3235oUGmUQKKU9+XZSwTtHx6yjis9MdHFc8/g/4SBosJG0HE4/K
         2OG0/PfZjjfr0b7y5DX1ptWw0WJqBPpMw0a0iEttFYkzDDu1YnkPBljW9hXi2EMRr/+k
         3MPQ==
X-Gm-Message-State: AOJu0YzhzZyR7f75N2MndHdI5Ud08seJEGcnNv9H1zjFOj4tqTPU5QR/
	4b3juZr/SJiP6s/I8wP2KYGCXshnWLGKPbmhIHBddunDTr6ripkibmUxaNtPtC5RRwg=
X-Gm-Gg: AR+sD13xEAgsLrqQ2r8yol4nTt/olGWo8B0mM7KXqF5WR1W9ONmPHWLJSS/8lMXVmlF
	Ptae/Ae/9/Dn2P/t/hIwydTf0VCpyq/PZCF2wPRVMA9x6es2bVLSv1n5mQtIa2yp8bXM2nfzCSG
	LKmkrIjEJ/b0y+0qWnnT+A3xtrnc5loBoeUHOOhIrj+Mp8SUpHNHjvfC8Dqh+SnkVoOXCCOXLjO
	XE2/qbTHDt3g8u9oJm42wqzV4oU/rP0AN14GWC2XzNY9OiUwSSVONBEDSo1neeOGK3HioC/odcx
	1RCHpCsVLkTbOspK+EHsIF+Q4ViSdVGYhfr9YF53cmIEVCOsCwLbF0f21vxn1vuzwMGFgs6eVMA
	FnJDinlqHbKshAYE2j5Xo5WKB01LxSV2/+SBPfK1wscaGbQmJqgx2Jv8ep/0na14bWRcU8AogS3
	GpKFk6mFUZ7IOIRoqNLuk2HrB482qESPoXKaaFd2wt+CsViwCHMhM1ZcR5jF+iBUWgtHJr5e9zK
	bLzcwvdlDH6l/ICD0H5jNKheqV97FpGEM+P0aPd
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4995e084875mr253273375e9.7.1786357841888;
        Mon, 10 Aug 2026 03:30:41 -0700 (PDT)
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
Subject: [PATCH v10 3/10] libs/guest: allocate various migration arrays just once
Date: Mon, 10 Aug 2026 11:30:06 +0100
Message-ID: <20260810103018.54564-4-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810103018.54564-1-frediano.ziglio@citrix.com>
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1786357842-034D7A5B-FE0536AF/0/0
X-purgate-type: clean
X-purgate-size: 4898

From: Edwin Török <edwin.torok@citrix.com>

Allocate these array just once at the start of migration,
using the maximum batch size, and free them at the end.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
Changes since v2:
- change prefix in subject.

Changes since v3:
- fix comment style

Changes since v4:
- change order of fields in structure.

Changes since v6:
- split preparation commit.

Changes since v8:
- remove useless memset;
- initialize variables while declaring them.

Changes since v9:
- added Reviewed-by.
---
 tools/libs/guest/xg_sr_common.h |  6 +++++
 tools/libs/guest/xg_sr_save.c   | 45 ++++++++++++---------------------
 2 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 7574c9f5b6..c07c6db59e 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -246,6 +246,12 @@ struct xc_sr_context
             struct xc_sr_context_save_buffers
             {
                 xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+                xen_pfn_t mfns[MAX_BATCH_SIZE];
+                xen_pfn_t types[MAX_BATCH_SIZE];
+                void *local_pages[MAX_BATCH_SIZE];
+                struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
+                uint64_t rec_pfns[MAX_BATCH_SIZE];
+                int errors[MAX_BATCH_SIZE];
             } *buffers;
         } save;
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 22348db445..6a77e33a47 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -86,15 +86,12 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = NULL, *types = NULL;
     void *guest_mapping = NULL;
-    void **local_pages = NULL;
-    int *errors = NULL, rc = -1;
+    int rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     void *page, *orig_page;
-    uint64_t *rec_pfns = NULL;
-    struct iovec *iov = NULL; int iovcnt = 0;
+    int iovcnt = 0;
     xen_pfn_t *const batch_pfns = ctx->save.buffers->batch_pfns;
     struct {
         struct xc_sr_rhdr rec;
@@ -110,28 +107,21 @@ static int write_batch(struct xc_sr_context *ctx)
         },
     };
 
-    assert(nr_pfns != 0);
-    assert(nr_pfns <= MAX_BATCH_SIZE);
-
     /* Mfns of the batch pfns. */
-    mfns = malloc(nr_pfns * sizeof(*mfns));
+    xen_pfn_t *const mfns = ctx->save.buffers->mfns;
     /* Types of the batch pfns. */
-    types = malloc(nr_pfns * sizeof(*types));
+    xen_pfn_t *const types = ctx->save.buffers->types;
     /* Errors from attempting to map the gfns. */
-    errors = malloc(nr_pfns * sizeof(*errors));
+    int *const errors = ctx->save.buffers->errors;
     /* Pointers to locally allocated pages.  Need freeing. */
-    local_pages = calloc(nr_pfns, sizeof(*local_pages));
+    void **const local_pages = ctx->save.buffers->local_pages;
     /* iovec[] for writev(). */
-    iov = malloc((nr_pfns + 2) * sizeof(*iov));
+    struct iovec *const iov = ctx->save.buffers->iov;
     /* page_data record PFNs list */
-    rec_pfns = malloc(nr_pfns * sizeof(*rec_pfns));
+    uint64_t *const rec_pfns = ctx->save.buffers->rec_pfns;
 
-    if ( !mfns || !types || !errors || !local_pages || !iov || !rec_pfns )
-    {
-        ERROR("Unable to allocate arrays for a batch of %u pages",
-              nr_pfns);
-        goto err;
-    }
+    assert(nr_pfns != 0);
+    assert(nr_pfns <= MAX_BATCH_SIZE);
 
     iov[0].iov_base = &hdrs;
     iov[0].iov_len = sizeof(hdrs);
@@ -249,14 +239,11 @@ static int write_batch(struct xc_sr_context *ctx)
  err:
     if ( guest_mapping )
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
-    for ( i = 0; local_pages && i < nr_pfns; ++i )
+    for ( i = 0; i < nr_pfns; ++i )
+    {
         free(local_pages[i]);
-    free(rec_pfns);
-    free(iov);
-    free(local_pages);
-    free(errors);
-    free(types);
-    free(mfns);
+        local_pages[i] = NULL;
+    }
 
     return rc;
 }
@@ -790,8 +777,8 @@ static int setup(struct xc_sr_context *ctx)
 
     if ( !ctx->save.buffers || !dirty_bitmap || !ctx->save.deferred_pages )
     {
-        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
-              " deferred pages");
+        ERROR("Unable to allocate memory for dirty bitmaps, deferred pages"
+              " and various batch buffers");
         rc = -1;
         errno = ENOMEM;
         goto err;
-- 
2.43.0


