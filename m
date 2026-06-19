Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31890CD98F6
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 13:05:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342201.1602440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuM-0001Ib-FF; Fri, 19 Jun 2026 13:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342201.1602440; Fri, 19 Jun 2026 13:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuM-0001IP-Bj; Fri, 19 Jun 2026 13:05:18 +0000
Received: by outflank-mailman (input) for mailman id 1342201;
 Fri, 19 Jun 2026 13:05:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuK-00010L-QY
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuK-002SWY-7E
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e81-e002-0a2a0a5209dd-0a2a450cb548-30
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:16 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e8c-94a4-0a2a450c0019-d1558036a8d0-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:16 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490b8ac62baso30805015e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:16 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874316; x=1782479116; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiBtoR80avPCt1Z1nhixmjeXxAuRwAb8Srdl+oua2xY=;
        b=RRVipjTU7RYi/Ez12IBJ7rRmLwtoz8Z8zGgAv0jVbxt1y0obdx7037lkq28051VvI4
         pvGWJp4rW6Gix9noY6qBhwyVgK+JBJwYAcju1zg3Y+T9cmEMd8fJEaMu1O8TqyI+ULQ7
         UWeaAFTT+pz+9zbbRi3bgu6/iz+rYgmKfmvCM4bnFpPuyiajeQMkKPRZSp+hfAGrmiOE
         N7N4IOPM4u/n0abi+8NsxjCj4ebLy80LzPXY85AvN6wGXkH3KDrBtNaT4yYNpmCZvtZY
         fRAP0GZU9TJGi03kIjI/obSOa+AvDU/1IPI54wcv2KptrfPsxlrSZRqsFN7DfrYIl4gM
         HZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874316; x=1782479116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qiBtoR80avPCt1Z1nhixmjeXxAuRwAb8Srdl+oua2xY=;
        b=PRxWGHJS6izsb+7yfcGYisx3UA5w1a5HciMmXJEk9Nl7EzqV7y6N+IKYLI96/LU1CD
         /zmtlj42V2NUx0MFJykqeTrx57ncz/wJA5bXjsZ1N4/YDKEmfXYYMa/3sOG2grjR5h6u
         zn+fUUvtIqF14gW7t/bWGkw9HWLXHoijVJgnQMDJRmv/ixw2IUbOCLSQFMJkjKrYa8rH
         62hnkSiFVHeUMbE0xE0hJuijH0BKf8LVDGklz5dB9tyvIX3iQd3DpoesXrv0bpnELNiv
         eyQi6i0AinFnbbhJQrgY826/vlSI/1/+WO+E39pA0vbtAnRvzGtoW5+63WBPgP3bGQaL
         l2uA==
X-Gm-Message-State: AOJu0YwIPTyqFdFL3lydK7eu6EEDDiwMLlSxGGAzM7pVhKMul/j7N1+z
	xYxv1lrOPrdJGVl9Np5o6J8Q8zE444R463JGFpQ+EtRq5W7YFfxEUcwq2e/FyNe1vLg=
X-Gm-Gg: AfdE7ck4hAwddxVgXwcMACLGTGzTqTnNlhd58G+NYLSuOYKw8oeO2aJYUYFEFSJxvVd
	gtYs5PLxpEQ8VUFVMPgmqaRFWzsTcFce5N0YPRHyj0BBd4IHgnNW3rFCzNjc2vUCFnzqHhCsERj
	D6oviK7sqgvDKAewSgShTOOZgabFtIeXypbgrH+QjIi4w202zswn6jfrE565nUKVoAHKlhULVsm
	5STQZVXm1jD3FG7EWzPmFNND8WyeyCyUG5V+dK15X+VZKnCq2JdwSyw69z1hlS015m/Bsz7q4uu
	O3hu2oYv/kDZDVeNoAqzA4FK9iU/rc4vXJa0n7BXWV0JLZR322NhrGMMgsKagoLwwvnXThYdFMC
	he8HYWJ55IsYn1/l+6grZ4s36/4bEOzPVS2i1OPJYgdgxWopxvX5RPDFlX6CAR9kJQh474UK37q
	hADwlgbFFy2nF0Hgqs0G1TJPkE+DJrLA8PSN7wTZNSEYXTbjCtppfdaRhlUZgb8Cg9T8FgqoxjL
	UXXHyC0
X-Received: by 2002:a05:600c:c04b:10b0:492:2ffd:8a74 with SMTP id 5b1f17b1804b1-49240a38ba5mr37619195e9.12.1781874315336;
        Fri, 19 Jun 2026 06:05:15 -0700 (PDT)
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
Subject: [PATCH v6 04/16] libs/guest: Use a single write_exact in write_headers
Date: Fri, 19 Jun 2026 14:04:49 +0100
Message-ID: <20260619130501.272832-5-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781874316-D85F8ABF-855B8CF3/0/0
X-purgate-type: clean
X-purgate-size: 2400

Reduce number of syscalls by coalescing the image and the domain headers
into a single I/O vector array.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
--
Changes since v2:
- change prefix in subject.

Changes since v4:
- added Reviewed-by;
- improved commit message.
---
 tools/libs/guest/xg_sr_save.c | 37 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index eba33f861a..8c31f9f86c 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -10,17 +10,22 @@ static int write_headers(struct xc_sr_context *ctx, uint16_t guest_type)
 {
     xc_interface *xch = ctx->xch;
     int32_t xen_version = xc_version(xch, XENVER_version, NULL);
-    struct xc_sr_ihdr ihdr = {
-        .marker  = IHDR_MARKER,
-        .id      = htonl(IHDR_ID),
-        .version = htonl(3),
-        .options = htons(IHDR_OPT_LITTLE_ENDIAN),
-    };
-    struct xc_sr_dhdr dhdr = {
-        .type       = guest_type,
-        .page_shift = XC_PAGE_SHIFT,
-        .xen_major  = (xen_version >> 16) & 0xffff,
-        .xen_minor  = (xen_version)       & 0xffff,
+    struct {
+        struct xc_sr_ihdr ihdr;
+        struct xc_sr_dhdr dhdr;
+    } hdrs = {
+        {
+            .marker  = IHDR_MARKER,
+            .id      = htonl(IHDR_ID),
+            .version = htonl(3),
+            .options = htons(IHDR_OPT_LITTLE_ENDIAN),
+        },
+        {
+            .type       = guest_type,
+            .page_shift = XC_PAGE_SHIFT,
+            .xen_major  = (xen_version >> 16) & 0xffff,
+            .xen_minor  = (xen_version)       & 0xffff,
+        },
     };
 
     if ( xen_version < 0 )
@@ -29,15 +34,9 @@ static int write_headers(struct xc_sr_context *ctx, uint16_t guest_type)
         return -1;
     }
 
-    if ( write_exact(ctx->fd, &ihdr, sizeof(ihdr)) )
-    {
-        PERROR("Unable to write Image Header to stream");
-        return -1;
-    }
-
-    if ( write_exact(ctx->fd, &dhdr, sizeof(dhdr)) )
+    if ( write_exact(ctx->fd, &hdrs, sizeof(hdrs)) )
     {
-        PERROR("Unable to write Domain Header to stream");
+        PERROR("Unable to write Headers to stream");
         return -1;
     }
 
-- 
2.43.0


