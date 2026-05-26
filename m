Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F5BCD5BDF
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2026 09:43:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1319668.1587148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoKA-0007qA-C3; Tue, 26 May 2026 09:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319668.1587148; Tue, 26 May 2026 09:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoKA-0007py-93; Tue, 26 May 2026 09:43:46 +0000
Received: by outflank-mailman (input) for mailman id 1319668;
 Tue, 26 May 2026 09:43:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wRoK8-0007ZZ-Vg
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 09:43:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRoK8-002r0l-BN
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 11:43:44 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b50-2eae-0a2a0a5409dd-0a2a45019012-0
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:44 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b50-c1f2-0a2a45010019-d155802bed89-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:44 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso4806235e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 02:43:44 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d70c51sm36522744f8f.36.2026.05.26.02.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 02:43:43 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779788624; x=1780393424; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syGgOjTw4c7Rut4emSk0LlZpDI5JJWx+QA9kfDo/79k=;
        b=eYSATg0MGpFfv+Ev2x3xDC1Utoz2RDAOsmxkt8onS9+57dnB7O0z/srcj2trvFioAU
         NYr7Wqddm8STbiVa7idDd5EGtVvG25v0pUScC0GIgQ8QESuI+GmDCr8nlaX2mWQFL1nV
         ZzSK8BWxBuoarRAaN88pop/skfcPI0fwyWqE/mzg8ljM7PBZ0mSylIm7tPqU+jUD6b6Z
         +rue7pMGIm1j0UNcNodldyqQDQw6vD9atK7HWyULPOgjD994Czrv8IyNL+7J9SeyN56/
         lExmh/3+Z+wxJOspRqeaDCN9ke5KGCnjzsnNHpQdH2V+nVJaoOL4HWkzS7yVlReXG8sI
         3Ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788624; x=1780393424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=syGgOjTw4c7Rut4emSk0LlZpDI5JJWx+QA9kfDo/79k=;
        b=Hef6OdjQLXU9PrVBZTLh8Zs9ydyYO1aIS8rUMb1bCIa5jgmFbCAIiMiIY3QAyJ8k3T
         InJa4THEJA85dqW6x+BwDPp3lk/FXwVss6EAMH1EFvwkDQ6NZoJJXvObjt36GNGSQREy
         eZSdnZRJSI+vQSseanJExzHgKnFu1Xb5YmiQEXho93lDcDwGjtsxoc2j2QBtjxLii3E8
         GHa1EnpsXpE8vmpQuha6HUa3dcfI59vUfakepFV+Sqjbt7ohVl/V8b7Vm6Ux9pniMCxa
         vJhd78CHgl2FOaU9GgGPj6VehhdTD/HWHfZx6XLRBZSITt9Y0/b62WAuGBDrMNEZH4+g
         ttUA==
X-Gm-Message-State: AOJu0Yyb6shl9apVvNchA6qdzOJDKGE3HUXtp8yePnDdKBfmPvJPrTTg
	XKa5fPL3c7YsRfpPaOxCT2+VrRRJZwTdlrGhtrlQikkYCSvfTLa9uO1+4QLiwSxM
X-Gm-Gg: Acq92OF8VdD7fKGfk+VEXLvJkVeJXCMCt4cIbGKzKSGg2hNdkF5bqc6xM+oFSOaFmxr
	EiW7eei12mQqF43GzCCP/LI4QI1U+SwCukjsveOcCzK1Mr4ImQbA4+mqSIUNt0rDTtUl4h2h7C+
	q1wls+mSh2zyOu05CPIyQaX8BgJuGVbds5wpKzWftyt29ErpyRgvYLs2DN4NWf1wZy/GtRMb69a
	sfgBkjsF+M/0nWTcParFybdcVJBaONoUOxKEOZ3nqhdREN0kagwUKjILeJRERZBw1iTzRQppPtY
	Rk8wFxjtCdhNrG+ZkYf10i1AuCXSpWYWPFFFBJYba8WW8zJpyli3QXO3+Txxj4x08hmmxXKczRT
	N+CC3uwqBmZjVdJ9QmH44NL7yB295Hr1+NSdgiJ0T318KTwa24bQ0sZ/f0kFnvOFctmPfgRXo+Q
	nlvOmelPd51DlZbYojSOCc9k4U3rQTZ9xU4WwQRlqFdrhWnzRU+Na6rgXp5ew+5ECk1Bq8w/0BJ
	G1GvgMJF7FBC2AEtviHji2LAEx0G55AnT6h
X-Received: by 2002:a05:600c:1f90:b0:490:5e2a:dbaf with SMTP id 5b1f17b1804b1-4905e2adc0dmr144697785e9.21.1779788623432;
        Tue, 26 May 2026 02:43:43 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 3/9] libs/guest: Reduce number of I/O vectors in write_batch
Date: Tue, 26 May 2026 10:43:14 +0100
Message-ID: <20260526094324.12286-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526094324.12286-1-frediano.ziglio@cloud.com>
References: <20260526094324.12286-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1779788624-B5545FF4-92044BAA/0/0
X-purgate-type: clean
X-purgate-size: 1328

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Each page was sent using a different iovec item. This potentially exceed
Linux maximum (1024).
Also some implementation (MiniOS) emulate writev with multiple write calls.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- change prefix in subject.
---
 tools/libs/guest/xg_sr_save.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 1700d819051a..62a39dfecc7a 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -240,13 +240,20 @@ static int write_batch(struct xc_sr_context *ctx)
     {
         for ( i = 0; i < nr_pfns; ++i )
         {
-            if ( guest_data[i] )
+            if ( !guest_data[i] )
+                continue;
+
+            if ( iov[iovcnt-1].iov_base + iov[iovcnt-1].iov_len != guest_data[i] )
             {
                 iov[iovcnt].iov_base = guest_data[i];
                 iov[iovcnt].iov_len = PAGE_SIZE;
                 iovcnt++;
-                --nr_pages;
             }
+            else
+            {
+                iov[iovcnt-1].iov_len += PAGE_SIZE;
+            }
+            --nr_pages;
         }
     }
 
-- 
2.54.0


