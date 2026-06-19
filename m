Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5696DCD98F2
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 13:05:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342200.1602432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuL-00015B-Aa; Fri, 19 Jun 2026 13:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342200.1602432; Fri, 19 Jun 2026 13:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuL-000150-5w; Fri, 19 Jun 2026 13:05:17 +0000
Received: by outflank-mailman (input) for mailman id 1342200;
 Fri, 19 Jun 2026 13:05:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuJ-0000ko-Mz
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuJ-002qjr-3j
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e83-5cb7-0a2a0a5109dd-0a2a45059ba6-46
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:15 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e8a-ef3d-0a2a45050019-d155dd32b062-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:15 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4633193af19so1587922f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:15 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874314; x=1782479114; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoUZP7EcTD3rMLem/j1Uq6cYO1SbjM2Ab1ems5g9aQQ=;
        b=gDrtqXYS9JD8WO7AefvaC6RIA1OQ+4djOF+Ysp6NwaiGn2NQXjcClwJise1zdMCgj8
         1BKwSLsSXrbjqzkdCxpkphja63gg0Zt2TYgR2iHYA0cWrLrzCVxAwkhCLXdJ2AflE7L2
         RDHh7ZIzXI57+eyYCfGgbAWJekpW6T5fOBmu+2eA5QcyDtGShJH9mi3cQ4OmJvWgLs1Q
         L4MfZiUmkiAEqqkPjmshyyH3SEuNCx/UFxwqsQfy+LcPXJKQ2bRRRRjNkASv+edsr9Bg
         NjXyf+3k34p1w2xVuL9/OF2MX8iMgFXyEX1cgli/CbX7mc8PyOEaoQh49otFonDcFz0i
         i7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874314; x=1782479114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YoUZP7EcTD3rMLem/j1Uq6cYO1SbjM2Ab1ems5g9aQQ=;
        b=CwdzG5/ws97yexHhXIvm3jyMVranlQMNppqZvJyuJltrKbO0FbvqEjg5MZuSVRD5vE
         b+4b9PUQr3dvz4Bt74HjPApw1Y+6TBVsniqDt0swi7kXqBSnn3clpBGDmyrWWvexLNcC
         vJvS9KIjQabxJGXe04Y54Ymclils2eeLBUO9zXI2U+sSeBn1NHfmXidcxNdfAzIjAtSk
         6gnmqGXtcnJcHqpWOZrLyLI1I8ldqTwkM4FN3rZj1PDr5KIOvqZZbFzW44oH9vzHJL6F
         MLJdfBtOty3kt2mAVto/3uya0asMoy9ncgCeF2VArYiZeKKO0qZcy8cnyp4W29Gx02dI
         uJBQ==
X-Gm-Message-State: AOJu0Yy2is9VDBF86Nc0fbLM9DcXZ4Ej36HNlfJdofFo06x+0O3grOgU
	kJUx9uyoUYwp3Ky6a02WlO2SaUUQwGhagRZ7+xne3N80ocNTTRLLqXsWilrTxTUfnkc=
X-Gm-Gg: AfdE7ck5Qwr7JMn0WKWFoKk0daM41B2h3d0NsrBj8nc8h3X3UP1YVp7QVrQgs1bZmwt
	ZVtsNIvUKIwlMPTNw6ByDNV33jSRwsQ6guUm20fx5fl5vUmWd3vP8dJAjMVh+ndf3EPhv3GSl71
	cXN76iIEJR69622p5g/dQ0OHd0Iz4J9jFP0XWnkPCB1WEBupoF95HETmPi0r5lGhnM3N962Y7kZ
	T8lTYSGJZ/mPpyloHWgAjLXMG9t5gECOi6W4hkK4n5NhQ+kWomT+jjl7k2wmYuJDzjWDpawRmN4
	tvg70ctHyiIKD1KQBaahI1OieUluToyL0WMIw8dn0uf9N/WiXasB3LhgCj+IDuSDvxMDFd2s5mw
	TI6ZqDT/k+hZHp1JZEmVqo1p9aN9CjeNYHGZRr9Obv1qWBbXHSK5ZiGf/GyPWIiGHxK5353GPVf
	2K3ZqYsmiKwI3o4lo9vS8FBLfPtvMWdzQh7ujm9wIRReuSZ6p7UESqtAMQCLOwIW5XxsPVNGWBW
	mOlgrG5
X-Received: by 2002:adf:f9c4:0:b0:45e:edc8:d440 with SMTP id ffacd0b85a97d-464ffa95327mr4426620f8f.1.1781874314412;
        Fri, 19 Jun 2026 06:05:14 -0700 (PDT)
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
Subject: [PATCH v6 03/16] libs/guest: Reduce number of I/O vectors in write_batch
Date: Fri, 19 Jun 2026 14:04:48 +0100
Message-ID: <20260619130501.272832-4-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781874315-F55C7127-4A357F92/0/0
X-purgate-type: clean
X-purgate-size: 1555

Each page was sent using a different iovec item. This potentially exceed
Linux maximum (1024).
Coalesce adjacent IO vector elements to attempt to reduce the number of
overall IO vectors for each operation.
Also some implementation (MiniOS) emulate writev with multiple write calls.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
--
Changes since v2:
- change prefix in subject.

Changes since v4:
- added Reviewed-by;
- improved commit message;
- minor style fix.
---
 tools/libs/guest/xg_sr_save.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 68ce1aeb98..eba33f861a 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -239,13 +239,21 @@ static int write_batch(struct xc_sr_context *ctx)
     {
         for ( i = 0; i < nr_pfns; ++i )
         {
-            if ( guest_data[i] )
+            if ( !guest_data[i] )
+                continue;
+
+            if ( iov[iovcnt - 1].iov_base + iov[iovcnt - 1].iov_len !=
+                 guest_data[i] )
             {
                 iov[iovcnt].iov_base = guest_data[i];
                 iov[iovcnt].iov_len = PAGE_SIZE;
                 iovcnt++;
-                --nr_pages;
             }
+            else
+            {
+                iov[iovcnt - 1].iov_len += PAGE_SIZE;
+            }
+            --nr_pages;
         }
     }
 
-- 
2.43.0


