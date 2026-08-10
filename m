Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F12C5B567
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:30:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387328.1628618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHK-0004tl-4h; Mon, 10 Aug 2026 10:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387328.1628618; Mon, 10 Aug 2026 10:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHJ-0004tc-W6; Mon, 10 Aug 2026 10:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1387328;
 Mon, 10 Aug 2026 10:30:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wtNHJ-0004ir-4M
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:30:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtNHI-00Dyin-HR
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:30:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a842-bab6-0a2a0a5309dd-0a2a4504c9d8-22
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:44 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a854-b57f-0a2a45040019-d155802dd551-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:44 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so10862685e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 03:30:44 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995bb8b668sm218478455e9.0.2026.08.10.03.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 03:30:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786357843; x=1786962643; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmYKOwc9TBhHBw9HKQnv11v7wtvX4hGi6xT3sze3LxM=;
        b=c9eyfgznDHwu2KFRkAc50rBNR8rftgT1J23Rmqp97Z0WRxm+RhDwY4K+l+l8xrh0KU
         3wAJTBHeSYDR7lbdOzXKEp6kc+MwZ9Cb8pzvqL2wGJHafopwqyHAPJO4xg+pXlIJsubl
         oLYNOt8Z7IqNqU5ieODubmMRUCgAI5uNHGHRIvtseOfAKVlV3K0lQcXiApzVQ2mbTRz5
         fPAoQKxB+bLAQmTX05YupoK1dBAi8VEAcnTI1MmixNtHEdq+7x6dLdNCrkotcQP8zt0x
         d0/Zgqs4nOSnjYTA3dLDd3h5taJN31VvraEpvYvqycakpQKwmO+D+vOmgJb/7OitpQez
         /G4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357843; x=1786962643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mmYKOwc9TBhHBw9HKQnv11v7wtvX4hGi6xT3sze3LxM=;
        b=eQbLOBpe3qmqiK840BMANpP87LpQOxDhANMOP79RDNOW888qcBWGPD0WtmqYgeyhqU
         VtkkpqRmY8f/PrHgHyXUG0ixgi61TJC1JtjKH4uDCby8/POaNjrytJPnT31s0vh0OQmv
         x4aovnk620OtPQi35dVIIbHIFq7AMluEs2RcRWHJKycjKKy7AzTLP490QZPxgbW2Z0YE
         Gnt2xATrLl3hM5ieB1qBKCMGlZ2r31xW7OdGQACmF4fxdm106a4Sd3M4xIinmlM05Es8
         MbuheIvHOSPIEqdLeSUE1gfMM/qwrKJ38h8wcsoSfhKE4VdIZeyI4LD5sEFIfpId6cML
         Fi2Q==
X-Gm-Message-State: AOJu0YwazFJExIbwzBquVb/tz0lWRsommcT/GEouq4yGbYbH7FkBkCjt
	Fap1xZPvHdRf+jBQIBmmd5rW8CRh/SsgfqfPA/rNGLofCSaRqDHNjB53IOZfkt/94c0=
X-Gm-Gg: AR+sD12WBUM0fMkuAJQxxc27YUthk2n0YcsD+ozU5BEMLrwThQOm8bjUV9ctpvKOmQx
	xUKp76U7IKcH+Ly5OOtyLaTg3NOAk5qDR7Vj6LPBUHt4PKTxe9liJzXSAC9W0G4rOvh67NoV0u7
	nMxQP6dohXPMrn1MQYs5qhJ0BRtDDOZxG2Au45OL4Xbk20WrvHD2i2ZJ2U5o013F4Bj/WQDvVNS
	rse0152W5JHykR2OuhlYNZ7qC+QtJyV/TETbkN4ETMLu/W4wlKIP2RFNDaU9TAroDRGKd4pI7Ua
	F7uQ+4meHclH+H4vzCLdodelCwPi0U6W7ToUetJGz2DmphxH0RzLUYxG7Qs/1/fjXvUlgCftJgT
	ks007RO3ufT3uyWv8OvIJnwo5/1v3420Ku8k+x7J48+6FR8LTZUo+++SKFTfa0LRixSypYV3Aq+
	gT1fGT+VXt1HTfu4EqzilXArKql1+FYnu0JY0/SN8RkQ7SZqE8+6TyYbPJgHIAjp/JTJa4z03si
	VmnmKUr37H4T54m1G9NTcGkwOfnPRroruRaxs6v
X-Received: by 2002:a05:600c:6298:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-499619839d6mr196524995e9.9.1786357843492;
        Mon, 10 Aug 2026 03:30:43 -0700 (PDT)
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
Subject: [PATCH v10 4/10] libs/guest: use Valgrind or sanitizers to detect various buffer overflows
Date: Mon, 10 Aug 2026 11:30:07 +0100
Message-ID: <20260810103018.54564-5-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810103018.54564-1-frediano.ziglio@citrix.com>
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1786357844-C0EDEB50-0D7D9B2F/0/0
X-purgate-type: clean
X-purgate-size: 7329

Previously this was done as buffers were allocated separately.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v9:
- add support for sanitizers also;
- remove some unneeded check buffers.
---
 tools/config.h.in               |  6 ++++
 tools/configure                 | 12 +++++++
 tools/configure.ac              |  3 +-
 tools/libs/ctrl/xc_private.h    | 61 +++++++++++++++++++++++++++++++--
 tools/libs/guest/xg_sr_common.h |  6 ++++
 tools/libs/guest/xg_sr_save.c   | 11 ++++++
 6 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/tools/config.h.in b/tools/config.h.in
index ed0042018d..d51816453b 100644
--- a/tools/config.h.in
+++ b/tools/config.h.in
@@ -48,6 +48,12 @@
 /* ROMBIOS enabled */
 #undef HAVE_ROMBIOS
 
+/* Define to 1 if you have the <sanitizer/asan_interface.h> header file. */
+#undef HAVE_SANITIZER_ASAN_INTERFACE_H
+
+/* Define to 1 if you have the <sanitizer/msan_interface.h> header file. */
+#undef HAVE_SANITIZER_MSAN_INTERFACE_H
+
 /* Define to 1 if you have the <stdint.h> header file. */
 #undef HAVE_STDINT_H
 
diff --git a/tools/configure b/tools/configure
index cd989925ed..94e630665f 100755
--- a/tools/configure
+++ b/tools/configure
@@ -10203,6 +10203,18 @@ then :
   printf "%s\n" "#define HAVE_UTMP_H 1" >>confdefs.h
 
 fi
+ac_fn_c_check_header_compile "$LINENO" "sanitizer/asan_interface.h" "ac_cv_header_sanitizer_asan_interface_h" "$ac_includes_default"
+if test "x$ac_cv_header_sanitizer_asan_interface_h" = xyes
+then :
+  printf "%s\n" "#define HAVE_SANITIZER_ASAN_INTERFACE_H 1" >>confdefs.h
+
+fi
+ac_fn_c_check_header_compile "$LINENO" "sanitizer/msan_interface.h" "ac_cv_header_sanitizer_msan_interface_h" "$ac_includes_default"
+if test "x$ac_cv_header_sanitizer_msan_interface_h" = xyes
+then :
+  printf "%s\n" "#define HAVE_SANITIZER_MSAN_INTERFACE_H 1" >>confdefs.h
+
+fi
 
 
 # Check for libnl3 >=3.2.8. If present enable remus network buffering.
diff --git a/tools/configure.ac b/tools/configure.ac
index 74b9f56025..5346ff6129 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -454,7 +454,8 @@ AC_CHECK_DECLS([fdt_property_u32],,,[#include <libfdt.h>])
 esac
 
 # Checks for header files.
-AC_CHECK_HEADERS([yajl/yajl_version.h sys/eventfd.h valgrind/memcheck.h utmp.h])
+AC_CHECK_HEADERS([yajl/yajl_version.h sys/eventfd.h valgrind/memcheck.h \
+                  utmp.h sanitizer/asan_interface.h sanitizer/msan_interface.h])
 
 # Check for libnl3 >=3.2.8. If present enable remus network buffering.
 PKG_CHECK_MODULES(LIBNL3, [libnl-3.0 >= 3.2.8 libnl-route-3.0 >= 3.2.8],
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index 8a325c17b0..7803192599 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -42,13 +42,70 @@
 
 #include <xen-tools/common-macros.h>
 
-#if defined(HAVE_VALGRIND_MEMCHECK_H) && !defined(NDEBUG) && !defined(__MINIOS__)
+#undef XEN_USE_MEM_NOACCESS
+#if !defined(NDEBUG) && !defined(__MINIOS__)
+
+#if !defined(__has_feature)
+#define __has_feature(x) 0
+#endif
+
+#if defined(HAVE_SANITIZER_ASAN_INTERFACE_H) && \
+    (__has_feature(address_sanitizer) || defined(__SANITIZE_ADDRESS__))
+#include <sanitizer/asan_interface.h>
+#define XEN_USE_MEM_NOACCESS 1
+#elif defined(HAVE_SANITIZER_MSAN_INTERFACE_H) && \
+    __has_feature(memory_sanitizer)
+#include <sanitizer/msan_interface.h>
+#define XEN_USE_MEM_NOACCESS 1
+#endif
+#if defined(HAVE_VALGRIND_MEMCHECK_H)
 /* Compile in Valgrind client requests? */
 #include <valgrind/memcheck.h>
-#else
+#define XEN_USE_MEM_NOACCESS 1
+#endif
+
+#endif
+
+#if !defined(HAVE_VALGRIND_MEMCHECK_H) || defined(NDEBUG) || defined(__MINIOS__)
 #define VALGRIND_MAKE_MEM_UNDEFINED(addr, len) /* addr, len */
 #endif
 
+#if defined(XEN_USE_MEM_NOACCESS)
+#define MEM_NOACCESS_BUFFER(name, size) uint8_t name[size];
+#if defined(HAVE_VALGRIND_MEMCHECK_H)
+#define MEM_NOACCESS_INIT_VALGRIND(field) \
+    VALGRIND_MAKE_MEM_NOACCESS(field, sizeof(field))
+#else
+#define MEM_NOACCESS_INIT_VALGRIND(field)
+#endif
+#if defined(HAVE_SANITIZER_ASAN_INTERFACE_H) && \
+    (__has_feature(address_sanitizer) || defined(__SANITIZE_ADDRESS__))
+#define MEM_NOACCESS_INIT_SANITIZER(field) \
+    ASAN_POISON_MEMORY_REGION(field, sizeof(field))
+#else
+#define MEM_NOACCESS_INIT_SANITIZER(field)
+#endif
+#if defined(HAVE_SANITIZER_MSAN_INTERFACE_H) && \
+    __has_feature(memory_sanitizer)
+#define MEM_UNDEFINED_INIT_SANITIZER(field) \
+    __msan_poison(field, sizeof(field))
+#else
+#define MEM_UNDEFINED_INIT_SANITIZER(field)
+#endif
+#define MEM_NOACCESS_INIT(field) do { \
+    MEM_NOACCESS_INIT_VALGRIND(field); \
+    MEM_NOACCESS_INIT_SANITIZER(field); \
+} while(0)
+#define MEM_UNDEFINED_INIT(field) do { \
+    VALGRIND_MAKE_MEM_UNDEFINED(field, sizeof(field)); \
+    MEM_UNDEFINED_INIT_SANITIZER(field); \
+} while(0)
+#else
+#define MEM_NOACCESS_BUFFER(name, size)
+#define MEM_NOACCESS_INIT(field) do {} while(0)
+#define MEM_UNDEFINED_INIT(field) do {} while(0)
+#endif
+
 #if defined(__MINIOS__)
 /*
  * MiniOS's libc doesn't know about sys/uio.h or writev().
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index c07c6db59e..020b1a5272 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -246,11 +246,17 @@ struct xc_sr_context
             struct xc_sr_context_save_buffers
             {
                 xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na0, 64);
                 xen_pfn_t mfns[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na1, 64);
                 xen_pfn_t types[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na2, 64);
                 void *local_pages[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na3, 64);
                 struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
+                MEM_NOACCESS_BUFFER(na4, 64);
                 uint64_t rec_pfns[MAX_BATCH_SIZE];
+                MEM_NOACCESS_BUFFER(na5, 64);
                 int errors[MAX_BATCH_SIZE];
             } *buffers;
         } save;
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 6a77e33a47..96d7e9e2f8 100644
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
 
@@ -783,6 +788,12 @@ static int setup(struct xc_sr_context *ctx)
         errno = ENOMEM;
         goto err;
     }
+    MEM_NOACCESS_INIT(ctx->save.buffers->na0);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na1);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na2);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na3);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na4);
+    MEM_NOACCESS_INIT(ctx->save.buffers->na5);
 
     rc = 0;
 
-- 
2.43.0


