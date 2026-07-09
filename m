Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C73C43458
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 07:44:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357595.1612010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjQt-00089q-NM; Thu, 09 Jul 2026 07:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357595.1612010; Thu, 09 Jul 2026 07:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjQt-00088Z-GS; Thu, 09 Jul 2026 07:44:31 +0000
Received: by outflank-mailman (input) for mailman id 1357595;
 Thu, 09 Jul 2026 07:44:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1whjQs-00081G-3L
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 07:44:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whjQr-002ZqU-GH
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:44:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f5151-5cb7-0a2a0a5109dd-0a2a4508d66a-20
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:44:29 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f515d-edec-0a2a45080019-d155802ad5cd-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:44:29 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so8763085e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 00:44:29 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3b85sm69114695e9.2.2026.07.09.00.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 00:44:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783583069; x=1784187869; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdvYbFZJbCfZSA6txvl8zWdgc4tqxqpTHmXXPQRK7cA=;
        b=j2kQImmKXur6OBRa+1MyvRdaKob9iVoVX1mDfUMRVWnR0jerXIwniUmEWIYKYFB4l2
         FuQWhw7RUw6t1odLp/GVg/3pZlZ3V0jUm5z3/LnYQTEEZVBf+3XYS7ifDSAB9Mk4D2GS
         jQpaeM0fAE5cbQ8kTB8/PqcLHgyHxZqQpU2y9i0ahmO2f0ws2DERYlL1HzRbvj7ixShm
         W92rJ1IsPLY2XqVKX4doAr6Dv4PIDmCTixpx872JENebAX75LtAezFjGyHycdv5Lg/BY
         j8ILnfp0OGKwxwhXtnwDofrx9dEvZTwJIr4LBFiQAk+reQNeY6VwwC+odQ3Z4ODTNZTC
         +MNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583069; x=1784187869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdvYbFZJbCfZSA6txvl8zWdgc4tqxqpTHmXXPQRK7cA=;
        b=SpnjrB3vDv0wdVZL5Xn8y/YgDoTh8RNcg0ISBYdM5BGVm95UyHfdfQGVqAiQZg32B9
         HX6MOVW+vaNAIrHOTAEtvXHPpf1bpWZRqfN+5Xd+R/p3GILD5aZibmkWIK1uHU5GuuSP
         jZTpWoBTZL2hBUptAIwSoIWNvsuoLtN571P8yRh4Fl0IrtI+ci2eNO/yRDGjcoye+AWP
         HhoWuff6OkFrp9rU8qPEpaXXi//AGbd3iV3bfV2zma2LjkZA7AvlpHFy+Q2hOTaI4B2E
         eIQBLQrUi7WRe0voseTdJTdRYN4wz7JuA6Yo8c1JxU3QT/+klIppwiGVm5gmveWKXyWx
         ULPA==
X-Gm-Message-State: AOJu0Yw7hp0G+a1LBOoLEOXIq5KNXutxx0DXryfFvqg6YSVg2TbpLpgy
	D56sJqx2mqDr4N4pCWFwNabpeniohOghzfiiIwy1VtMwKT/7ho/KcMx1mnq5h6+D5JI=
X-Gm-Gg: AfdE7clKDXozvaCg7+O/4BceWt6QuJmoMYGZrHaLwLwQ6hdelrMsGvBG8mIGjAtwm+E
	BVpp8cARHswt6lRHcUcYXLBeJtH/eTRpeESb3y1aCfvo48XNWI9lA4crs4MkxisqEgadr+VYPmX
	OvgVhfJoCIJcT9CnO7+mzlEWZseQ5xMFEoAjMBDIwfbhP5AywVjBfzXThWfqIKZt9uhD79tYN0H
	LRbLX4Hy5jOJxjbqAsAyLF4BCpILTsDbIkVWIKd3uta0rAsd/paAxMfjmwKGnQgciZ8AseB7P6n
	MVjtw7tbE0H8USgY8MYFX/ABgsvF/l0ItQkNYZzUs3hj97kokbcLKLtWyoaJoLQVHtUGnAaVD+Q
	QNgYzIll4QvMXqvvu9sXzBRSjJ15M6RbrP2i+Ot6LeM8U9WD1BRPCLyv1bMWQ710UqG5Mix0Gn2
	IMOqx25hvN5vxgidhr6n+sCHKwnHqUXNndfeP7o1V3HQrhi8y91Wc33yhStIUeNSx6wAB7l6EWJ
	DClxGEdtjoKH48cLRI=
X-Received: by 2002:a05:600c:4fd4:b0:493:e3ea:b23f with SMTP id 5b1f17b1804b1-493e6861ac2mr55928515e9.10.1783583068770;
        Thu, 09 Jul 2026 00:44:28 -0700 (PDT)
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
Subject: [PATCH v7 6/6] libs/guest: use Valgrind to detect various buffer overflows
Date: Thu,  9 Jul 2026 08:43:57 +0100
Message-ID: <20260709074358.256084-7-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709074358.256084-1-frediano.ziglio@citrix.com>
References: <20260709074358.256084-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1783583069-A1F223FC-CB3DB1F0/0/0
X-purgate-type: clean
X-purgate-size: 4048

Previously this was done as buffers were allocated separately.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/ctrl/xc_private.h    |  8 ++++++++
 tools/libs/guest/xg_sr_common.h |  8 ++++++++
 tools/libs/guest/xg_sr_save.c   | 12 ++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index 8a325c17b0..bef96521c3 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -45,8 +45,16 @@
 #if defined(HAVE_VALGRIND_MEMCHECK_H) && !defined(NDEBUG) && !defined(__MINIOS__)
 /* Compile in Valgrind client requests? */
 #include <valgrind/memcheck.h>
+#define MEM_NOACCESS_BUFFER(name, size) uint8_t name[size];
+#define MEM_NOACCESS_INIT(field) \
+    VALGRIND_MAKE_MEM_NOACCESS(field, sizeof(field))
+#define MEM_UNDEFINED_INIT(field) \
+    VALGRIND_MAKE_MEM_UNDEFINED(field, sizeof(field))
 #else
 #define VALGRIND_MAKE_MEM_UNDEFINED(addr, len) /* addr, len */
+#define MEM_NOACCESS_BUFFER(name, size)
+#define MEM_NOACCESS_INIT(field) do {} while(0)
+#define MEM_UNDEFINED_INIT(field) do {} while(0)
 #endif
 
 #if defined(__MINIOS__)
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index c07c6db59e..d3fc7f363e 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -245,13 +245,21 @@ struct xc_sr_context
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
             struct xc_sr_context_save_buffers
             {
+                MEM_NOACCESS_BUFFER(na0, 16);
                 xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na1, 16);
                 xen_pfn_t mfns[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na2, 16);
                 xen_pfn_t types[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na3, 16);
                 void *local_pages[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na4, 16);
                 struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
+                MEM_NOACCESS_BUFFER(na5, 16);
                 uint64_t rec_pfns[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na6, 16);
                 int errors[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na7, 16);
             } *buffers;
         } save;
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index a49df00971..e03282e385 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -117,8 +117,10 @@ static int write_batch(struct xc_sr_context *ctx)
     batch_pfns = ctx->save.buffers->batch_pfns;
 
     /* Mfns of the batch pfns. */
+    MEM_UNDEFINED_INIT(ctx->save.buffers->mfns);
     mfns = ctx->save.buffers->mfns;
     /* Types of the batch pfns. */
+    MEM_UNDEFINED_INIT(ctx->save.buffers->types);
     types = ctx->save.buffers->types;
     /* Errors from attempting to map the gfns. */
     errors = ctx->save.buffers->errors;
@@ -126,8 +128,10 @@ static int write_batch(struct xc_sr_context *ctx)
     local_pages = ctx->save.buffers->local_pages;
     memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
     /* iovec[] for writev(). */
+    MEM_UNDEFINED_INIT(ctx->save.buffers->iov);
     iov = ctx->save.buffers->iov;
     /* page_data record PFNs list */
+    MEM_UNDEFINED_INIT(ctx->save.buffers->rec_pfns);
     rec_pfns = ctx->save.buffers->rec_pfns;
 
     iov[0].iov_base = &hdrs;
@@ -790,6 +794,14 @@ static int setup(struct xc_sr_context *ctx)
         errno = ENOMEM;
         goto err;
     }
+    MEM_NOACCESS_INIT(ctx->save.buffers->na0);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na1);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na2);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na3);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na4);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na5);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na6);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na7);
 
     rc = 0;
 
-- 
2.43.0


