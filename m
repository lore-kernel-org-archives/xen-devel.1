Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045CCCD4F26
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 13:05:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342203.1602454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuO-0001Zl-4s; Fri, 19 Jun 2026 13:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342203.1602454; Fri, 19 Jun 2026 13:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuN-0001Z9-TJ; Fri, 19 Jun 2026 13:05:19 +0000
Received: by outflank-mailman (input) for mailman id 1342203;
 Fri, 19 Jun 2026 13:05:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuM-0001IY-IX
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuL-00D4ah-VO
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:17 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e89-2eae-0a2a0a5409dd-0a2a450ba98e-20
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:17 +0200
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e8d-5e53-0a2a450b0019-d155da33d157-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:17 +0200
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-bf046d4da1fso238465566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:17 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874317; x=1782479117; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LON6WS/7+ITaf2v0md0IGTaQ3vNjQONNtUw2wlhSSko=;
        b=Dm5jFFQVU/eqX19fhC+wCPrEtf4W8zqXGuZ9Cm5aWsyPEJDfgfWO82XN1bLMqrTFTl
         PDbKTql8gX42EngAIccDxbaKUDs1eWQnoefr+fEvuoN5ljcWKgBkRdiG22Mkzwqy1IPN
         u/j8WgAgn9sbiyyA5qlk9b279JjtQRz66VMH6igHA0Ap4ro+KvphSbBYf4Hj0Q14Veas
         kh9AIkjTBwGe6LywNQSVYZKFymc7EWQTU5mpmijLP/B+HUX4SpMtlcWMi/ry92mAJhwS
         7GsjiCfKNRcXpK5io6xYLPe4QK7EbM7bC/0j3FYrVL+7EOQrkc1viwDPBy/jdv2v6hV+
         ByLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874317; x=1782479117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LON6WS/7+ITaf2v0md0IGTaQ3vNjQONNtUw2wlhSSko=;
        b=DOXUuL9igFzyN/yMxKeZa3lQHMVvLte0KEveQMKymCijxd9/j8KGIHOavtw0znnFI8
         zq7JkSsphJLzl2k5w13i5b0TnENBq6Dnngh/8eT2d5/L4K7av2ChlDrjjDkvdt/JDWSu
         ESJoGSKZnlAcSpHHcGdVd/3p9skUTcEm9sd89P5PsitdQHqyKzOcQeECwEJR0lok7Axq
         LH0GVlxsDhFyHh/btjygtFqznItnFiMDeN7FCKAVzSGbv9meDApmhrsGOUl5DhScDlPT
         6UV8NMkAZOUUM7zzYX9r2KTi3vltRCUuiTe2mb3usz14nlwpIRsOnc84mddZZk+iQUXO
         tscg==
X-Gm-Message-State: AOJu0YyXug9FrIqMBqdcXhm6w/PFyu4M99mbcUfdqe9mWU88gh63bDIt
	8B9gk/VYJ0GMswxLeJN11g5xpXdEx4ew7ZHLclqfz4bGSg7L7KTEGvPmjR5kJ37CFOo=
X-Gm-Gg: AfdE7cnOWngltfRQCBPquYKCtOKq1CRiRlDF25d8s2BdiQpSad4e83pwcXMrqIQQdTJ
	4VWsb3b7khkujy0oekF8xVKZMV1JljXQogHuEQKdqJQWPE7661Z8Sv7gMvIJRoWdrBJj/3cjw3c
	7mnUTb/MimpwbF+tIVE6aznMi6GDqZrhNGnl3YxNvCBEPkksEHUp4J3VTKtBJzdgz6LiGG/Pmi5
	/U1gld8e37OeIZTYZo64sKusunpdwlwcVebaChF3OSYXbD5OP3dygY/hfPoby73fCh2EAzeY8Pz
	t4DPScLPU5a/agtcJVtXrz6hx3vAzW7i7JOPXctNjw7Us8GWTLaP3IL8Ej87eMuiQiRUR8P+lny
	ynpL3Zs2hXUnkDkEspiSYylAbKYQEBAZdjs1QoOb6SF+69QrvSum+upQlpTthJBWssnGNLGi1ch
	26pQW52/MoSrnuZ8Mw/XEIVJS1Dy8Z5ePsA02xzmwS09kc+XXL/pt2zgwRXHW4GAm6JhI/wkKJA
	Agb5GRu
X-Received: by 2002:a17:907:c01c:b0:bec:687f:6603 with SMTP id a640c23a62f3a-c097c0af677mr190225066b.28.1781874317370;
        Fri, 19 Jun 2026 06:05:17 -0700 (PDT)
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
Subject: [PATCH v6 06/16] libs/call: cache up to 4 pages in hypercall bounce buffers
Date: Fri, 19 Jun 2026 14:04:51 +0100
Message-ID: <20260619130501.272832-7-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781874317-47BEF00E-F9EDC5F9/0/0
X-purgate-type: clean
X-purgate-size: 5352

From: Edwin Török <edwin.torok@citrix.com>

During migration there are a lot of mmap/munmap calls,
because `xc_get_pfn_type_batch` exceeds the default hypercall bounce
buffer cache size, and needs to allocate every time it is called.

`munmap` is slow, especially in a PV Dom0 (takes an emulation fault),
so is best avoided.

Eventually it'd be good if the memory pool from  xmalloc_tlsf.c
was reused here, but for now make it handle the commonly encountered
sizes (so far up to 4 pages).

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- change prefix in subject.

Changes since v4:
- fix off-by-one bug.

Changes since v5:
- avoids potential buffer underflow if nr_pages is 0 calling cache_alloc.
---
 tools/libs/call/buffer.c  | 31 ++++++++++++++++++++-----------
 tools/libs/call/core.c    |  3 ++-
 tools/libs/call/private.h |  8 +++++---
 3 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/tools/libs/call/buffer.c b/tools/libs/call/buffer.c
index 155e4f9d43..2f0515c273 100644
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
@@ -84,10 +87,10 @@ static int cache_free(xencall_handle *xcall, void *p, size_t nr_pages)
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
 
@@ -108,17 +111,23 @@ void buffer_release_cache(xencall_handle *xcall)
     DBGPRINTF("current allocations:%d maximum allocations:%d",
               xcall->buffer_current_allocations,
               xcall->buffer_maximum_allocations);
-    DBGPRINTF("cache current size:%d",
-              xcall->buffer_cache_nr);
+    for ( unsigned i = 0; i < ARRAY_SIZE(xcall->buffer_cache_nr); ++i )
+    {
+        DBGPRINTF("cache current size[%u pages]:%d", i+1,
+                xcall->buffer_cache_nr[i]);
+    }
     DBGPRINTF("cache hits:%d misses:%d toobig:%d",
               xcall->buffer_cache_hits,
               xcall->buffer_cache_misses,
               xcall->buffer_cache_toobig);
 
-    while ( xcall->buffer_cache_nr > 0 )
+    for ( unsigned i = 0; i < ARRAY_SIZE(xcall->buffer_cache_nr); ++i )
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


