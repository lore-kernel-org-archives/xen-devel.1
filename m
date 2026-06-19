Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267E6CDB466
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 13:05:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342204.1602466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuP-0001w1-As; Fri, 19 Jun 2026 13:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342204.1602466; Fri, 19 Jun 2026 13:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuP-0001ud-5q; Fri, 19 Jun 2026 13:05:21 +0000
Received: by outflank-mailman (input) for mailman id 1342204;
 Fri, 19 Jun 2026 13:05:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuN-0001Wt-U6
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuN-00D4ah-Ac
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e89-2eae-0a2a0a5409dd-0a2a450ba98e-22
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:19 +0200
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e8f-5e53-0a2a450b0019-d155d032bc5e-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:19 +0200
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-69532288224so3950688a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:19 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874319; x=1782479119; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZidMZWTCYLyL5ufIMI3PcR9yOlOw9e9GMi8xqFKVOr8=;
        b=RH5ZaNnXnutl+59wVjGfXnwseXaNH71z440zvKQe11I1Lh6XZQdY+3K2Nvd94978YG
         SXJa/a6Z86ruc2KHdI9Uaivgf8YWIvPi+u/8CM14RJk80l+XnSPSPonntrqi8pxjCja7
         Co4WqUPxztOfngUlFWLOIX0xaDPOy+Zf7JzImoM7N1LSFybwTUMj8/fnbaFwLYyqD1gP
         K82oqUl2vaz2VjhFTZEa3PxVf4zafFB3bszCLG3WmGwfVmcmQ4OHUi4p0lkRtCwjvSSC
         vVaepIkR8CUNXEm+BC9D7nq/sJfHa25c63BXK8cqxvD2PaMsJ7oCp8Fb9t0UIGSEClMs
         xCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874319; x=1782479119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZidMZWTCYLyL5ufIMI3PcR9yOlOw9e9GMi8xqFKVOr8=;
        b=gflDynSKdOYtRT8mDCn9MIENdrTeZerJ+U21n40haK/VNuWS4wsAyOCozEVuPZthXY
         LUK8rqO6PVUDxVwaVni4mapLBbfDqaoR+bOIr4gTTRBcdm1EzEUgt1zUX+u+R3dnxsH4
         /Dam9QhtOz4QJvIi9bUW/rOeYsTQm1dFbiG0KdD+3Aa0rKEIh7HFdKqdUgIe4H3piZAr
         wfhpcu0jxYdE/z4RPrZ0mZhAnH59Qg5l9DEw87X8EBNsYyPEhAbgYCMXg9hJ5cZ6XBBq
         kLv3QFigNJm57X+AnCdiCpcp3xPUMGzdkGqjB4TKlSNqR3oZ7S1ooKOBblVSqRDiSj9v
         i4lA==
X-Gm-Message-State: AOJu0Yx4lJt5vJI9t5LNj0KaJlJzIZkzLRDAk7FAFxSvxHgjfjiRrfCG
	hqJKjhyZkNhm/tiOIRY3RBqS7vN5ne7MafoW0Pqd2/l5ExP7mv32O4KMX634FT6jMgI=
X-Gm-Gg: AfdE7cnrUQPhU4NE1ORbLVjYO0+a4DriMFIVwM7oBPPtJgSPE7/bJJxNMI+s7FmIN0i
	sVyS+g9ffMaJSC6bwOl5lA8RvLbgBB2DXcG6Szdppk8p2trTZ5qv6NxQC5ocDuhqK1BSqcFac20
	l/6JPCliauEbPp7SfROvS5MADLKVj3bmNehplC0O6YNCrlgi0Jgu4GvBCwZqhLK7PC7YO3aQCYO
	0cRNdQRAc1CkYrYugKLwutimrAeKmh1yBup2+JxEogMDJ+aKIcu8mG/4UguXIoNLkwepZ8f8Vx7
	c41daUJ7HGZlx3gJ3ORjtT40mxMopWdYfjpFL12S+5lx9cqSiM/IKsTXQElpzQfYM6irOL/375T
	SFzmqzwEs8GcuaMfnmM4qfPFzxW1uvo7BvIkMIqdlc3OZfTm/qGM+A/B3enflEel691oW+/fTIW
	5hRtJ8PHM6cXwTG23Eyzr7Mwa2sbE3t4idOJH/nIEnzmmdADWGHIeJVaL9quvDCzuRJxKblMZaQ
	2ppBHVf
X-Received: by 2002:a17:907:724e:b0:c08:3409:b747 with SMTP id a640c23a62f3a-c0b62137c57mr133369766b.33.1781874318503;
        Fri, 19 Jun 2026 06:05:18 -0700 (PDT)
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
Subject: [PATCH v6 07/16] libs/guest: avoids using 2 indexes
Date: Fri, 19 Jun 2026 14:04:52 +0100
Message-ID: <20260619130501.272832-8-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781874319-45DF800E-D2DF68FF/0/0
X-purgate-type: clean
X-purgate-size: 2731

Simplify code, after the first scan of the various arrays we don't need to
keep original types and PFNs but only the ones having data.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
--
Changes since v4:
- added Reviewed-by.
---
 tools/libs/guest/xg_sr_restore.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index e148fc594a..fb46142d87 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -260,9 +260,7 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     int *map_errs = malloc(count * sizeof(*map_errs));
     int rc;
     void *mapping = NULL, *guest_page = NULL;
-    unsigned int i, /* i indexes the pfns from the record. */
-        j,          /* j indexes the subset of pfns we decide to map. */
-        nr_pages = 0;
+    unsigned nr_pages;
 
     if ( !mfns || !map_errs )
     {
@@ -279,12 +277,18 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         goto err;
     }
 
-    for ( i = 0; i < count; ++i )
+    nr_pages = 0;
+    for ( unsigned i = 0; i < count; ++i )
     {
         ctx->restore.ops.set_page_type(ctx, pfns[i], types[i]);
 
-        if ( page_type_has_stream_data(types[i]) )
-            mfns[nr_pages++] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
+        if ( !page_type_has_stream_data(types[i]) )
+            continue;
+
+        mfns[nr_pages] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
+        pfns[nr_pages] = pfns[i];
+        types[nr_pages] = types[i];
+        nr_pages++;
     }
 
     /* Nothing to do? */
@@ -302,16 +306,13 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         goto err;
     }
 
-    for ( i = 0, j = 0; i < count; ++i )
+    for ( unsigned i = 0; i < nr_pages; ++i )
     {
-        if ( !page_type_has_stream_data(types[i]) )
-            continue;
-
-        if ( map_errs[j] )
+        if ( map_errs[i] )
         {
             rc = -1;
             ERROR("Mapping pfn %#"PRIpfn" (mfn %#"PRIpfn", type %#"PRIx32") failed with %d",
-                  pfns[i], mfns[j], types[i], map_errs[j]);
+                  pfns[i], mfns[i], types[i], map_errs[i]);
             goto err;
         }
 
@@ -337,7 +338,6 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
             memcpy(guest_page, page_data, PAGE_SIZE);
         }
 
-        ++j;
         guest_page += PAGE_SIZE;
         page_data += PAGE_SIZE;
     }
-- 
2.43.0


