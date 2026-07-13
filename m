Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F52C44501
	for <xen-devel@archiver.kernel.org>; Mon, 13 Jul 2026 20:48:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1361931.1613984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjNZX-000603-95; Mon, 13 Jul 2026 20:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361931.1613984; Mon, 13 Jul 2026 20:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjNZX-0005zo-3u; Mon, 13 Jul 2026 20:48:15 +0000
Received: by outflank-mailman (input) for mailman id 1361931;
 Mon, 13 Jul 2026 20:48:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wjNZV-0005P5-LY
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:48:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjNZV-00EnAW-2c
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 22:48:13 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a554ea5-2eae-0a2a0a5409dd-0a2a4509816e-38
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 22:48:13 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <freddy77@gmail.com>)
 id 6a554f0c-b440-0a2a45090019-d155802dcc88-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 22:48:13 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-493ec555a26so23344225e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 13:48:12 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49508724786sm23924255e9.3.2026.07.13.13.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 13:48:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783975692; x=1784580492; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ch0w6GZSKmn/pD177LTY+dgX+ATbp49+AP+ziJtpRo4=;
        b=DoFUHvUv1Yz8IcnR9ua60g+CflresRB9sgbfkNas20lzhd9mkT9Xn2VEOJUIiOlFzH
         abMhEZNJ2W7oSJJJ2FjEKYFpcSoYGN1JWRtk3ajti3hrKgCHDm/gMAVd+saMkj6WtDhF
         lMj/V6ysFtCmaNNb8SWgPpzFenxeo3jdXAsX3QqavyiFminLkq9JMQ4Eqj3oP7odcKqV
         lLK9+owhZ5BZ4QBqHLA+NHc6kuTy7i8pKdunok49i+kKEKOyn0JTa+EoGm1Yn3Ku669C
         xizzUyw2sP9/6xFVadVJ+mXxV9KvOqVlpCv9ZzkZkgXwnGnc03a60aFAMWEgRKPF4NPJ
         rbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783975692; x=1784580492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ch0w6GZSKmn/pD177LTY+dgX+ATbp49+AP+ziJtpRo4=;
        b=OPMWRTYd/339HaxE/uvA6uTj0WyBPFMo/5GqxWG29oSZ8wBDSdWm+6ZCZUA8Uvtu+B
         UVRVz7qcwBqGjrV+EteSnZRGrvDA9Zx+z3Uu7nRQV2JVL3lla7wyfrIpEJhk5K4kuPJK
         XrFWvJ/Ja/t/hveO2RR78Dz3vu/xWLYEjIBXBBvQijbIlidOerL4hmIgWLFajwbYTLpJ
         Vjw+fuYemNFjj8+5Mzg7A3NZJZK+gHSRPUVWsCw/ljy70XF2H/+7VZ9fJ8Lzp/dI3dxd
         fUYXRrb8hVqCfdHGDiDixFw8eRNZSlwqynRrpGma1fwGGvXeu2kLrimwd5Fi9ykw8lMU
         15Hw==
X-Gm-Message-State: AOJu0Yy6du0chR8NcYjCQt67QhJZuaMKgRkZazHevD+EZvskygnaf4C1
	yJ9Rg8vjj427VRp5rGSqRA9PmiMapGvlChOWd0XKEuiyPjSzbtkNNmClB7vXmqbzbjLrLQ==
X-Gm-Gg: AfdE7cmUpYizt1XYz5Eu2SlTKiHQscCi5Uaz1/yx+ji7rRpLiNsMUGxO6aP5zKv9xwP
	Sg8fjr2FCRD/HUF5QJFj8f86/gn0rsnT/kI1VhimAM1vZlyHe6GsRSvn02V4uJZjYMSM2U8IW00
	D/5D0cKpCxAeB9fXuXxTDBw+vHIIFpzH6+OD+a6LwQOeAtdyUJ3lXA9KBJv0KldLeeIWDOfa/Up
	Qak9STBV5W0vzIjzjMBjdW5LrbZTv/KjMibY92hfFJr8fDImOqQ9Yhs5i+zh2Dv7aNSa2p041NK
	Wh0KaT60mD/PR5gN8AA2FhmLTn0ywbacXorXoRxrvi33fEtR/J1AUYKYkwunveTTxt379jIqc8S
	SFiTvI8hGD/3KQ5aFECl7a5nAIbESwjh6OGHeRWRskHPA3XwI5qJYtHdowvWTNiRGO8bRTKTMrf
	TNlNUAfr9uqxd5DRo/9FDVJkxV18+NXbhyd+OjM84QW38/BcxU/NwxDGGruSMEVJVReqpLMxzRj
	p7uG1d8yW5Z5z8H7Ss=
X-Received: by 2002:a05:600c:1f91:b0:493:e79e:daa6 with SMTP id 5b1f17b1804b1-493f8826e69mr103268785e9.33.1783975692202;
        Mon, 13 Jul 2026 13:48:12 -0700 (PDT)
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
Subject: [PATCH v9 4/4] libs/guest: use Valgrind to detect various buffer overflows
Date: Mon, 13 Jul 2026 21:48:02 +0100
Message-ID: <20260713204802.105115-5-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713204802.105115-1-frediano.ziglio@citrix.com>
References: <20260713204802.105115-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1783975693-55971A0B-242463AA/0/0
X-purgate-type: clean
X-purgate-size: 3522

Previously this was done as buffers were allocated separately.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/ctrl/xc_private.h    |  8 ++++++++
 tools/libs/guest/xg_sr_common.h |  8 ++++++++
 tools/libs/guest/xg_sr_save.c   | 13 +++++++++++++
 3 files changed, 29 insertions(+)

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
index 6a77e33a47..25561e369f 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -123,6 +123,11 @@ static int write_batch(struct xc_sr_context *ctx)
     assert(nr_pfns != 0);
     assert(nr_pfns <= MAX_BATCH_SIZE);
 
+    MEM_UNDEFINED_INIT(ctx->save.buffers->mfns);
+    MEM_UNDEFINED_INIT(ctx->save.buffers->types);
+    MEM_UNDEFINED_INIT(ctx->save.buffers->iov);
+    MEM_UNDEFINED_INIT(ctx->save.buffers->rec_pfns);
+
     iov[0].iov_base = &hdrs;
     iov[0].iov_len = sizeof(hdrs);
 
@@ -783,6 +788,14 @@ static int setup(struct xc_sr_context *ctx)
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


