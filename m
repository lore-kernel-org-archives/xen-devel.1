Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F26C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:30:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387325.1628587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHF-00043N-4S; Mon, 10 Aug 2026 10:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387325.1628587; Mon, 10 Aug 2026 10:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHF-00042i-0W; Mon, 10 Aug 2026 10:30:41 +0000
Received: by outflank-mailman (input) for mailman id 1387325;
 Mon, 10 Aug 2026 10:30:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wtNHD-000418-UB
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:30:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtNHD-00GuV3-Au
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:30:39 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a84a-8faa-0a2a0a5109dd-0a2a4505b244-16
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:39 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a84f-4cb1-0a2a45050019-d1558032e1c9-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:39 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso16345825e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 03:30:39 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995bb8b668sm218478455e9.0.2026.08.10.03.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 03:30:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786357839; x=1786962639; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wimWBVOYQqwPaXI8zWtV5Ue4b9r9c1tb/eSNhf7mAu8=;
        b=pMUY2/gLuvqcZpxqSH9bQjQUMiMRz7VNj44/wMATq5FDXfYlUUIHNtcIYMkFnioD7g
         aTT7jQdzjZTihTKOfEo5Pde+rm00UqxP/T6/VySpfQCWoX4K6Qzn2O9x2BZLzaqZC3LE
         o2GDwMlUqxmJDBYBGkLxOMhS67xdP3Yr92cBGltYdV30jY4wMiTrqd6RMwafWIpYmhgC
         QbCjAn1IrLBuL3Sj2Bl3pJGKvcZNsJvOuTenpekm0z+GLT2/eDyfRVEIgJFEvA6t0/+r
         l53C1HVlx9ekfr58cJ/+vf9Iwl386KtspUwcUzQ9UMYYbPRBhoLPT1gMo2ujAg2ZC0v4
         YB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357839; x=1786962639;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wimWBVOYQqwPaXI8zWtV5Ue4b9r9c1tb/eSNhf7mAu8=;
        b=OB+K3eIcuyxWNy5hXxSBPTa5HvZRO4xdTQKS0ZumNLvtq3H6LSdwywjghNP5TwinWm
         shTrgpYsiPBoFP5Yy+2uYh2pQnFJHFBrC4MgpULSflAPDnobXJNQr9CKykfyXTASr8qa
         +P3jzh0JBxrdMmwQQfFg6NWS1Gay+Dfui03gxNOONBL3kZzFpAzjIadPgS0+x7AM+t/P
         tZmJ/W5pW/ptP7+wuBIHvV02xU/vzs1w/thrAq1pDWwtY0WgZkafNTvhwPEwALl7cyPf
         oL4NdBgx7EJEXeppUuyhewiBCSoLsPZRPPIrWwL1cO8boF9ABuNfp1/1JJUV3zyNmyIs
         zVPQ==
X-Gm-Message-State: AOJu0Yz80MEPM5A+eXTfuMOoSkluJ7x7I0HaSViyJSG6dPAhixzQiX7z
	oRAY0/UFQMVUYP8+kjitNrqb0RSQtPafWrrLVa1PZ7hxztYgKpbWoxgi7qAFjHP8RRs=
X-Gm-Gg: AR+sD114K50KmHlnBQk48gKRilgm2Wm66uS171Rf1h2CNmYJa9PpVK/zYZliOswxEQ9
	l/bYD8WRLmqVmSCNDDpuyMGWXCkJXXhukzMIoH40CNVCzXaY/AUAUVSVi/7CoF6o+0t9xSZHsFW
	g6qOf3N5HBsWWlqfLVFiTva2P991QUpWsdtfk7Fq6Pgsx1n2Mt6XPsgblGl9RMB7rt38/fsbEKr
	TkW7JEp/wFE3pzoWMwQCVUnM3xUXVwzhpd/5ozVe/rU68EFnbkNpqXBz3tLdSd9AZUGzAqe5i7e
	sW5c1J1PkbD9/kh5dh8br6dubNV7GepIL5cU815WYQbeFj3j53YyUlMbg/akOwksKc0UKVKDmrD
	DeKkXWxOjAAAtZzK3wMA1JH7uG5RVB6W8lX39f6xB9tx45RoUfGNMOYgeeLbcTWKmO7Glw1srKl
	1eiNevzc/ozaUyKqlHSaWCPAVk5xkeMzbnoJp2M1Dwc3mU+uDEKTsb2qeexS9qTeFQs6HgNYGuy
	9W6yeV7NTFqkzXwiAFsH1dRkFWF0VJ6QViN7ID+OgwYgRT/Jxza
X-Received: by 2002:a05:600c:4715:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-4996195884bmr212355625e9.5.1786357838544;
        Mon, 10 Aug 2026 03:30:38 -0700 (PDT)
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
Subject: [PATCH v10 1/10] libs/call: cache up to 4 pages in hypercall bounce buffers
Date: Mon, 10 Aug 2026 11:30:04 +0100
Message-ID: <20260810103018.54564-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810103018.54564-1-frediano.ziglio@citrix.com>
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1786357839-F74BC2A1-E42AB6FA/0/0
X-purgate-type: clean
X-purgate-size: 5706

From: Edwin Török <edwin.torok@citrix.com>

During migration there are a lot of mmap/munmap calls,
because xc_get_pfn_type_batch() exceeds the default hypercall bounce
buffer cache size, and needs to allocate every time it is called.

munmap() is slow, especially in a PV Dom0 (takes an emulation fault),
so is best avoided.

Eventually it'd be good if the memory pool from  xmalloc_tlsf.c
was reused here, but for now make it handle the commonly encountered
sizes (so far up to 4 pages).

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
Changes since v2:
- change prefix in subject.

Changes since v4:
- fix off-by-one bug.

Changes since v5:
- avoids potential buffer underflow if nr_pages is 0 calling cache_alloc.

Changes since v6:
- align changes made to cache_alloc to cache_free.

Changes since v7:
- use "unsigned int" instead of "unsigned".

Changes since v8:
- added Reviewed-by.
---
 tools/libs/call/buffer.c  | 34 +++++++++++++++++++++++-----------
 tools/libs/call/core.c    |  3 ++-
 tools/libs/call/private.h |  8 +++++---
 3 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/tools/libs/call/buffer.c b/tools/libs/call/buffer.c
index 155e4f9d43..b7d00185c4 100644
--- a/tools/libs/call/buffer.c
+++ b/tools/libs/call/buffer.c
@@ -49,6 +49,9 @@ static void *cache_alloc(xencall_handle *xcall, size_t nr_pages)
 {
     void *p = NULL;
 
+    if ( nr_pages == 0 )
+        return NULL;
+
     cache_lock(xcall);
 
     xcall->buffer_total_allocations++;
@@ -56,13 +59,13 @@ static void *cache_alloc(xencall_handle *xcall, size_t nr_pages)
     if ( xcall->buffer_current_allocations > xcall->buffer_maximum_allocations )
         xcall->buffer_maximum_allocations = xcall->buffer_current_allocations;
 
-    if ( nr_pages > 1 )
+    if ( nr_pages > ARRAY_SIZE(xcall->buffer_cache) )
     {
         xcall->buffer_cache_toobig++;
     }
-    else if ( xcall->buffer_cache_nr > 0 )
+    else if ( xcall->buffer_cache_nr[nr_pages-1] > 0 )
     {
-        p = xcall->buffer_cache[--xcall->buffer_cache_nr];
+        p = xcall->buffer_cache[nr_pages-1][--xcall->buffer_cache_nr[nr_pages-1]];
         xcall->buffer_cache_hits++;
     }
     else
@@ -79,15 +82,18 @@ static int cache_free(xencall_handle *xcall, void *p, size_t nr_pages)
 {
     int rc = 0;
 
+    if ( nr_pages == 0 )
+        return 0;
+
     cache_lock(xcall);
 
     xcall->buffer_total_releases++;
     xcall->buffer_current_allocations--;
 
-    if ( nr_pages == 1 &&
-         xcall->buffer_cache_nr < BUFFER_CACHE_SIZE )
+    if ( nr_pages && nr_pages <= ARRAY_SIZE(xcall->buffer_cache) &&
+         xcall->buffer_cache_nr[nr_pages-1] < BUFFER_CACHE_SIZE )
     {
-        xcall->buffer_cache[xcall->buffer_cache_nr++] = p;
+        xcall->buffer_cache[nr_pages-1][xcall->buffer_cache_nr[nr_pages-1]++] = p;
         rc = 1;
     }
 
@@ -108,17 +114,23 @@ void buffer_release_cache(xencall_handle *xcall)
     DBGPRINTF("current allocations:%d maximum allocations:%d",
               xcall->buffer_current_allocations,
               xcall->buffer_maximum_allocations);
-    DBGPRINTF("cache current size:%d",
-              xcall->buffer_cache_nr);
+    for ( unsigned int i = 0; i < ARRAY_SIZE(xcall->buffer_cache_nr); ++i )
+    {
+        DBGPRINTF("cache current size[%u pages]:%d", i+1,
+                xcall->buffer_cache_nr[i]);
+    }
     DBGPRINTF("cache hits:%d misses:%d toobig:%d",
               xcall->buffer_cache_hits,
               xcall->buffer_cache_misses,
               xcall->buffer_cache_toobig);
 
-    while ( xcall->buffer_cache_nr > 0 )
+    for ( unsigned int i = 0; i < ARRAY_SIZE(xcall->buffer_cache_nr); ++i )
     {
-        p = xcall->buffer_cache[--xcall->buffer_cache_nr];
-        osdep_free_pages(xcall, p, 1);
+        while ( xcall->buffer_cache_nr[i] > 0 )
+        {
+            p = xcall->buffer_cache[i][--xcall->buffer_cache_nr[i]];
+            osdep_free_pages(xcall, p, i + 1);
+        }
     }
 
     cache_unlock(xcall);
diff --git a/tools/libs/call/core.c b/tools/libs/call/core.c
index 02c4f8e1ae..dd8877c1a0 100644
--- a/tools/libs/call/core.c
+++ b/tools/libs/call/core.c
@@ -14,6 +14,7 @@
  */
 
 #include <stdlib.h>
+#include <string.h>
 
 #include "private.h"
 
@@ -44,7 +45,7 @@ xencall_handle *xencall_open(xentoollog_logger *logger, unsigned open_flags)
     xentoolcore__register_active_handle(&xcall->tc_ah);
 
     xcall->flags = open_flags;
-    xcall->buffer_cache_nr = 0;
+    memset(xcall->buffer_cache_nr, 0, sizeof(xcall->buffer_cache_nr));
 
     xcall->buffer_total_allocations = 0;
     xcall->buffer_total_releases = 0;
diff --git a/tools/libs/call/private.h b/tools/libs/call/private.h
index 9c3aa432ef..8e6a208975 100644
--- a/tools/libs/call/private.h
+++ b/tools/libs/call/private.h
@@ -31,13 +31,15 @@ struct xencall_handle {
     Xentoolcore__Active_Handle tc_ah;
 
     /*
-     * A simple cache of unused, single page, hypercall buffers
+     * A simple cache of unused, small, hypercall buffers
+     * buffer_cache[i]'s size is (i+1) pages
      *
      * Protected by a global lock.
      */
 #define BUFFER_CACHE_SIZE 4
-    int buffer_cache_nr;
-    void *buffer_cache[BUFFER_CACHE_SIZE];
+#define BUFFER_CACHE_NRPAGES 4
+    int buffer_cache_nr[BUFFER_CACHE_NRPAGES];
+    void *buffer_cache[BUFFER_CACHE_NRPAGES][BUFFER_CACHE_SIZE];
 
     /*
      * Hypercall buffer statistics. All protected by the global
-- 
2.43.0


