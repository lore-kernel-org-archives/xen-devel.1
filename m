Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88815C88E72
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 07:54:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423728.1648665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x76we-0008UC-2X; Thu, 17 Sep 2026 07:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423728.1648665; Thu, 17 Sep 2026 07:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x76wd-0008U5-Vu; Thu, 17 Sep 2026 07:54:11 +0000
Received: by outflank-mailman (input) for mailman id 1423728;
 Thu, 17 Sep 2026 07:54:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x76wb-0008RG-NE
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 07:54:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x76wb-000NZh-3R
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 09:54:09 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aab9c8c-e002-0a2a0a5209dd-0a2a4504a7e2-48
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 09:54:09 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aab9ca0-b57f-0a2a45040019-c387df828450-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 09:54:08 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B6E021D78;
 Thu, 17 Sep 2026 07:54:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEFF513786;
 Thu, 17 Sep 2026 07:53:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id h8+cMJecq2oPPgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 17 Sep 2026 07:53:59 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789631644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JNIg8tCy5+mq+WNUtDANvh6UPH9IaowmYkVl1naPQ0=;
	b=Toi+Bz32epssW3GvVacTGwxOEk2cuR/BoTdPgdcMSXu/hK8Dsz+CmrPtcr6fmVPKav0XXK
	liYJT1y30M/zkIT6wK/QOe6gKsSQa2bUFHffHfEBXrsFxAvfy1CZhhAbUid6B5q3jB6Ojf
	HnQF4saW5j8KgsBLT9QgV+qqHSwC2dU=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789631640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JNIg8tCy5+mq+WNUtDANvh6UPH9IaowmYkVl1naPQ0=;
	b=uAcK6sl41MvLRToi2/XCdHnZ1EIoyoF673GoVeZfm6P/I4yBcpo8SaIqeaU17V3h1BHhf9
	rqMl61nhC41OVVWB4opJiE9whwApe1MeytRE4HjEO8Epm00hVyrUyg4PwWuoicjbwzOVCx
	AGwOtIpr7ZMYgLq5JsfwtNuk4l8qWTk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 1/4] tools/libxenguest: remove Mini-OS specific parts
Date: Thu, 17 Sep 2026 09:53:48 +0200
Message-ID: <20260917075351.37208-2-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917075351.37208-1-jgross@suse.com>
References: <20260917075351.37208-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid]
X-purgate-ID: tlsNG-ebf023/1789631648-53CC7B50-D5E771AC/35/110847
X-purgate-type: clean
X-purgate-size: 11480

The last Mini-OS use case of libxenguest is gone, so remove the
Mini-OS specific parts of libxenguest.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/Makefile.common              | 15 ------
 tools/libs/guest/xg_dom_decompress_unsafe.c   | 48 -------------------
 tools/libs/guest/xg_dom_decompress_unsafe.h   | 28 -----------
 .../guest/xg_dom_decompress_unsafe_bzip2.c    | 14 ------
 .../libs/guest/xg_dom_decompress_unsafe_lz4.c | 39 ---------------
 .../guest/xg_dom_decompress_unsafe_lzma.c     | 14 ------
 .../guest/xg_dom_decompress_unsafe_lzo1x.c    | 44 -----------------
 .../libs/guest/xg_dom_decompress_unsafe_xz.c  | 46 ------------------
 .../guest/xg_dom_decompress_unsafe_zstd.c     | 44 -----------------
 9 files changed, 292 deletions(-)
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe.h
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_bzip2.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzma.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_xz.c
 delete mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c

diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
index 86b1f160e5..47b3a52360 100644
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -1,8 +1,3 @@
-ifeq ($(CONFIG_LIBXC_MINIOS),y)
-# Save/restore of a domain is currently incompatible with a stubdom environment
-override CONFIG_MIGRATE := n
-endif
-
 OBJS-y += xg_private.o
 OBJS-y += xg_domain.o
 OBJS-y += xg_suspend.o
@@ -55,16 +50,6 @@ OBJS-$(CONFIG_X86)     += xg_dom_x86.o
 OBJS-$(CONFIG_X86)     += xg_cpuid_x86.o
 OBJS-$(CONFIG_ARM)     += xg_dom_arm.o
 
-ifeq ($(CONFIG_LIBXC_MINIOS),y)
-OBJS-y                 += xg_dom_decompress_unsafe.o
-OBJS-y                 += xg_dom_decompress_unsafe_bzip2.o
-OBJS-y                 += xg_dom_decompress_unsafe_lz4.o
-OBJS-y                 += xg_dom_decompress_unsafe_lzma.o
-OBJS-y                 += xg_dom_decompress_unsafe_lzo1x.o
-OBJS-y                 += xg_dom_decompress_unsafe_xz.o
-OBJS-y                 += xg_dom_decompress_unsafe_zstd.o
-endif
-
 CFLAGS += -D__XEN_TOOLS__
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += -iquote ../../../xen/common/libelf
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe.c b/tools/libs/guest/xg_dom_decompress_unsafe.c
deleted file mode 100644
index 21d964787d..0000000000
--- a/tools/libs/guest/xg_dom_decompress_unsafe.c
+++ /dev/null
@@ -1,48 +0,0 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <inttypes.h>
-
-#include "xg_private.h"
-#include "xg_dom_decompress_unsafe.h"
-
-static struct xc_dom_image *unsafe_dom;
-static unsigned char *output_blob;
-static unsigned int output_size;
-
-static void unsafe_error(const char *msg)
-{
-    xc_dom_panic(unsafe_dom->xch, XC_INVALID_KERNEL, "%s", msg);
-}
-
-static int unsafe_flush(void *src, unsigned int size)
-{
-    void *n = realloc(output_blob, output_size + size);
-    if (!n)
-        return -1;
-    output_blob = n;
-
-    memcpy(&output_blob[output_size], src, size);
-    output_size += size;
-    return size;
-}
-
-int xc_dom_decompress_unsafe(
-    decompress_fn fn, struct xc_dom_image *dom, void **blob, size_t *size)
-{
-    int ret;
-
-    unsafe_dom = dom;
-    output_blob = NULL;
-    output_size = 0;
-
-    ret = fn(dom->kernel_blob, dom->kernel_size, NULL, unsafe_flush, NULL, NULL, unsafe_error);
-
-    if (ret)
-        free(output_blob);
-    else {
-        *blob = output_blob;
-        *size = output_size;
-    }
-
-    return ret;
-}
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe.h b/tools/libs/guest/xg_dom_decompress_unsafe.h
deleted file mode 100644
index 5bc2222076..0000000000
--- a/tools/libs/guest/xg_dom_decompress_unsafe.h
+++ /dev/null
@@ -1,28 +0,0 @@
-#ifdef __MINIOS__
-# include "../../xen/include/xen/decompress.h"
-#else
-typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
-                          int (*fill)(void*, unsigned int),
-                          int (*flush)(void*, unsigned int),
-                          unsigned char *outbuf, unsigned int *posp,
-                          void (*error)(const char *x));
-#endif
-
-#define cf_check /* No Control Flow Integriy checking */
-
-int xc_dom_decompress_unsafe(
-    decompress_fn fn, struct xc_dom_image *dom, void **blob, size_t *size)
-    __attribute__((visibility("internal")));
-
-int xc_try_bzip2_decode(struct xc_dom_image *dom, void **blob, size_t *size)
-    __attribute__((visibility("internal")));
-int xc_try_lz4_decode(struct xc_dom_image *dom, void **blob, size_t *size)
-    __attribute__((visibility("internal")));
-int xc_try_lzma_decode(struct xc_dom_image *dom, void **blob, size_t *size)
-    __attribute__((visibility("internal")));
-int xc_try_lzo1x_decode(struct xc_dom_image *dom, void **blob, size_t *size)
-    __attribute__((visibility("internal")));
-int xc_try_xz_decode(struct xc_dom_image *dom, void **blob, size_t *size)
-    __attribute__((visibility("internal")));
-int xc_try_zstd_decode(struct xc_dom_image *dom, void **blob, size_t *size)
-    __attribute__((visibility("internal")));
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_bzip2.c b/tools/libs/guest/xg_dom_decompress_unsafe_bzip2.c
deleted file mode 100644
index 9d3709e6cc..0000000000
--- a/tools/libs/guest/xg_dom_decompress_unsafe_bzip2.c
+++ /dev/null
@@ -1,14 +0,0 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <inttypes.h>
-
-#include "xg_private.h"
-#include "xg_dom_decompress_unsafe.h"
-
-#include "../../xen/common/bunzip2.c"
-
-int xc_try_bzip2_decode(
-    struct xc_dom_image *dom, void **blob, size_t *size)
-{
-    return xc_dom_decompress_unsafe(bunzip2, dom, blob, size);
-}
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_lz4.c b/tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
deleted file mode 100644
index 405143aa61..0000000000
--- a/tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
+++ /dev/null
@@ -1,39 +0,0 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <inttypes.h>
-#include <stdint.h>
-
-#include INCLUDE_ENDIAN_H
-
-#define XG_NEED_UNALIGNED
-#include "xg_private.h"
-#include "xg_dom_decompress.h"
-
-#define CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
-
-typedef uint8_t u8;
-typedef uint16_t u16;
-typedef uint32_t u32;
-typedef uint64_t u64;
-
-#define likely(a) a
-#define unlikely(a) a
-
-static inline uint16_t le16_to_cpu(uint16_t v)
-{
-#if BYTE_ORDER == BIG_ENDIAN
-    return __builtin_bswap16(v);
-#else
-    return v;
-#endif
-}
-
-#include "../../xen/include/xen/lz4.h"
-#include "../../xen/common/decompress.h"
-#include "../../xen/common/unlz4.c"
-
-int xc_try_lz4_decode(
-    struct xc_dom_image *dom, void **blob, size_t *size)
-{
-    return xc_dom_decompress_unsafe(unlz4, dom, blob, size);
-}
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_lzma.c b/tools/libs/guest/xg_dom_decompress_unsafe_lzma.c
deleted file mode 100644
index 5d178f0c43..0000000000
--- a/tools/libs/guest/xg_dom_decompress_unsafe_lzma.c
+++ /dev/null
@@ -1,14 +0,0 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <inttypes.h>
-
-#include "xg_private.h"
-#include "xg_dom_decompress_unsafe.h"
-
-#include "../../xen/common/unlzma.c"
-
-int xc_try_lzma_decode(
-    struct xc_dom_image *dom, void **blob, size_t *size)
-{
-    return xc_dom_decompress_unsafe(unlzma, dom, blob, size);
-}
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c b/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
deleted file mode 100644
index 356f228718..0000000000
--- a/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
+++ /dev/null
@@ -1,44 +0,0 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <inttypes.h>
-#include INCLUDE_ENDIAN_H
-#include <stdint.h>
-
-#include "xg_private.h"
-#include "xg_dom_decompress_unsafe.h"
-
-typedef uint8_t u8;
-typedef uint32_t u32;
-typedef uint16_t u16;
-typedef uint64_t u64;
-
-#define likely(a) a
-#define noinline
-#define unlikely(a) a
-
-static inline uint16_t be16_to_cpu(const uint16_t v)
-{
-#if BYTE_ORDER == LITTLE_ENDIAN
-	return __builtin_bswap16(v);
-#else
-	return v;
-#endif
-}
-
-static inline uint32_t be32_to_cpu(const uint32_t v)
-{
-#if BYTE_ORDER == LITTLE_ENDIAN
-	return __builtin_bswap32(v);
-#else
-	return v;
-#endif
-}
-
-#include "../../xen/common/lzo.c"
-#include "../../xen/common/unlzo.c"
-
-int xc_try_lzo1x_decode(
-    struct xc_dom_image *dom, void **blob, size_t *size)
-{
-    return xc_dom_decompress_unsafe(unlzo, dom, blob, size);
-}
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
deleted file mode 100644
index 0501f7f693..0000000000
--- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
+++ /dev/null
@@ -1,46 +0,0 @@
-#include <stdio.h>
-#include INCLUDE_ENDIAN_H
-#include <stdlib.h>
-#include <stddef.h>
-#include <stdint.h>
-#include <inttypes.h>
-
-#include "xg_private.h"
-#include "xg_dom_decompress_unsafe.h"
-
-// TODO
-#define XZ_DEC_X86
-
-typedef uint8_t u8;
-typedef uint16_t u16;
-typedef uint32_t u32;
-typedef uint32_t __le32;
-
-static inline uint32_t cpu_to_le32(const uint32_t v)
-{
-#if BYTE_ORDER == BIG_ENDIAN
-	return __builtin_bswap32(v);
-#else
-	return v;
-#endif
-}
-
-static inline uint32_t le32_to_cpu(const uint32_t v)
-{
-#if BYTE_ORDER == BIG_ENDIAN
-	return __builtin_bswap32(v);
-#else
-	return v;
-#endif
-}
-
-#define __force
-#define always_inline
-
-#include "../../xen/common/unxz.c"
-
-int xc_try_xz_decode(
-    struct xc_dom_image *dom, void **blob, size_t *size)
-{
-    return xc_dom_decompress_unsafe(unxz, dom, blob, size);
-}
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
deleted file mode 100644
index 319816a390..0000000000
--- a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
+++ /dev/null
@@ -1,44 +0,0 @@
-#include <stdio.h>
-#include INCLUDE_ENDIAN_H
-#include <stdlib.h>
-#include <stddef.h>
-#include <stdint.h>
-#include <inttypes.h>
-
-#include "xg_private.h"
-#include "xg_dom_decompress_unsafe.h"
-
-typedef uint8_t u8;
-
-typedef uint16_t __u16;
-typedef uint32_t __u32;
-typedef uint64_t __u64;
-
-typedef uint16_t __le16;
-typedef uint32_t __le32;
-typedef uint64_t __le64;
-
-typedef uint16_t __be16;
-typedef uint32_t __be32;
-typedef uint64_t __be64;
-
-#define attr_const
-#define __force
-#define always_inline
-#define noinline
-#define __packed __attribute__((__packed__))
-
-#undef ERROR
-
-#define __TYPES_H__ /* xen/types.h guard */
-#include "../../xen/include/xen/byteorder.h"
-#include "../../xen/include/xen/unaligned.h"
-#include "../../xen/include/xen/xxhash.h"
-#include "../../xen/lib/xxhash64.c"
-#include "../../xen/common/unzstd.c"
-
-int xc_try_zstd_decode(
-    struct xc_dom_image *dom, void **blob, size_t *size)
-{
-    return xc_dom_decompress_unsafe(unzstd, dom, blob, size);
-}
-- 
2.55.0


