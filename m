Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA8FCD98F6
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 13:05:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342206.1602485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuT-0002ao-5N; Fri, 19 Jun 2026 13:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342206.1602485; Fri, 19 Jun 2026 13:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuS-0002aU-VW; Fri, 19 Jun 2026 13:05:24 +0000
Received: by outflank-mailman (input) for mailman id 1342206;
 Fri, 19 Jun 2026 13:05:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuR-0002GD-4O
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuQ-002qp2-FT
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e8c-5cb7-0a2a0a5109dd-0a2a4501e924-32
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:22 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e92-e031-0a2a45010019-d155802bb4ce-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:22 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso26773065e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:22 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874322; x=1782479122; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rq+qhmTPgKBhNpU+5cysMmMVcR/5yZiixTBKuWIy3R4=;
        b=BSpDRh9uqp4Oz4Q1KNTRN3xMV0HZxqvCgMpaYpwutUmO52n/WYVqzBqXOTiINbIr/V
         ve8VJwXvnXJHFypZszDtPo/psyHY9i/In43TBFyAsBphTrs93ez9ZPDkqbupFv7QuA/X
         7EgHASp/yvZ5qn6XhY5DTG/QynExHn67ASMt5LYUPRSG2F8nhQn5YuGoh2OQBGS43rXl
         U+FazrtkrOF34jD8vxCi2Gkf8cGISYYbO3dkkZPO2XSPx81YfipIQsBS9pOR5i3q9zSn
         Ya7kQunYGYKLploGTUVZh1tCZR0iDZuXNShVYK17fLN5EjunDP1NvJXrOgI8t8tiWKcR
         Pvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874322; x=1782479122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rq+qhmTPgKBhNpU+5cysMmMVcR/5yZiixTBKuWIy3R4=;
        b=W/++0ZtdzLDddF1PR9DZQXaY1Zi7bY5V1Om/nc8Hrkud88oHnrg0MP2j9CAx3oDARY
         aIyesLRaPPaekrbP5izIuUTR2VzmzvLVSAi9DsgFuPd0Vcvu2psJaCd4eVB7ktdRFu+o
         +54tdpi4cVbyhjhM0XOhOZhQrlN/HmBWuHZQ+BxFsend6Ir0pN5nqyKb01KkVjTGAXEC
         JjXQx7Tnry1zyinyRwYgDqJYz5iIt2Z6LGX5kYszOImYAVB7C8xXRjtIEK4UUPAEq2JP
         wsJ/a1xFyf/bbUItGjRqdz1gCSDDau6MOUgPoTnJ7Rs1EtUnjjzSr2M6gOjFjXZHqNJa
         qr/A==
X-Gm-Message-State: AOJu0YzVBDKmH7zzSwo7hnaZUu5r9c1mWiiCz6YsScGa/tmPDt/4jS5f
	kGjKBOuT3PrWJSH6VNqmfsD+5+WIrc7maA8yhyw/5sUWG1oEWKG3rD9V0dYJJBcIP1g=
X-Gm-Gg: AfdE7clIeOh4C17TEthyVoii78rGe8P5nSTV24bezkacmOuq/fcaA8r4xpWRw94AJAL
	e30m72Xptg/3m195YNbHG6Z7CfnIH9AhhPVNZ0MTgKfuS+iajlj3pqFnMrc/q0yxe6kDAWOcBol
	5AgbhhEci7RjZX7h5NPTc2hH8Q4Zqt4MGMOndgwlF3kJ37fNmQWQZSpM8lk/WxEZlZOpF0FbDJJ
	ncaKyqAtT11T/cJKGTHJAkTe/QC9xlsS55dBWrqRboK8zw9Ncl9M/Etv4/vxf7Ctq4LP+jCHg82
	Fs3MdqI5GYODSVrGSQDpHcCSYMmVZJy29odrQbnQMLFJPejVVoed9QNJTO3z0EmwvXooh06pBHi
	i7GDfCGbyJazjanqw66i7MtCVybN6l1mDriCM7+oinDa0S4XIlbeSkzqOf3akBXY6tkeJhlojQ3
	UZlccbZb8FmWcBWXR+dIfM5mCQ2pAeYNxDjSrrlL2icAMOgj4cYse1iwBHHwH6zAB2bW/AQvPNd
	8TIkEbl
X-Received: by 2002:a05:600c:810c:b0:490:d3ef:fa4a with SMTP id 5b1f17b1804b1-4924233f9fcmr37363585e9.14.1781874321616;
        Fri, 19 Jun 2026 06:05:21 -0700 (PDT)
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
Subject: [PATCH v6 09/16] libs/ctrl: Allows writev_exact to change iov array
Date: Fri, 19 Jun 2026 14:04:54 +0100
Message-ID: <20260619130501.272832-10-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781874322-711F3E30-ECB58022/0/0
X-purgate-type: clean
X-purgate-size: 3172

Avoid having to allocate and copy the array if a partial write
happens.
The implementation in tools/libs/store/xs.c already use this
signature and method.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- change prefix in subject.
---
 tools/libs/ctrl/xc_private.c | 26 +++++---------------------
 tools/libs/ctrl/xc_private.h |  2 +-
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index bb0f81d6f3..946fc307aa 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -635,7 +635,7 @@ int write_exact(int fd, const void *data, size_t size)
 /*
  * MiniOS's libc doesn't know about writev(). Implement it as multiple write()s.
  */
-int writev_exact(int fd, const struct iovec *iov, int iovcnt)
+int writev_exact(int fd, struct iovec *iov, int iovcnt)
 {
     int rc, i;
 
@@ -649,9 +649,8 @@ int writev_exact(int fd, const struct iovec *iov, int iovcnt)
     return 0;
 }
 #else
-int writev_exact(int fd, const struct iovec *iov, int iovcnt)
+int writev_exact(int fd, struct iovec *iov, int iovcnt)
 {
-    struct iovec *local_iov = NULL;
     int rc = 0, iov_idx = 0, saved_errno = 0;
     ssize_t len;
 
@@ -686,23 +685,9 @@ int writev_exact(int fd, const struct iovec *iov, int iovcnt)
                 len -= iov[iov_idx++].iov_len;
             else
             {
-                /* Partial write of iov[iov_idx]. Copy iov so we can adjust
-                 * element iov_idx and resubmit the rest. */
-                if ( !local_iov )
-                {
-                    local_iov = malloc(iovcnt * sizeof(*iov));
-                    if ( !local_iov )
-                    {
-                        saved_errno = ENOMEM;
-                        rc = -1;
-                        goto out;
-                    }
-
-                    iov = memcpy(local_iov, iov, iovcnt * sizeof(*iov));
-                }
-
-                local_iov[iov_idx].iov_base += len;
-                local_iov[iov_idx].iov_len  -= len;
+                /* Partial write of iov[iov_idx]. */
+                iov[iov_idx].iov_base += len;
+                iov[iov_idx].iov_len  -= len;
                 break;
             }
         }
@@ -711,7 +696,6 @@ int writev_exact(int fd, const struct iovec *iov, int iovcnt)
     saved_errno = 0;
 
  out:
-    free(local_iov);
     errno = saved_errno;
     return rc;
 }
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index b5892ae8dc..3af996e900 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -383,7 +383,7 @@ int xc_flush_mmu_updates(xc_interface *xch, struct xc_mmu *mmu);
 /* Return 0 on success; -1 on error setting errno. */
 int read_exact(int fd, void *data, size_t size); /* EOF => -1, errno=0 */
 int write_exact(int fd, const void *data, size_t size);
-int writev_exact(int fd, const struct iovec *iov, int iovcnt);
+int writev_exact(int fd, struct iovec *iov, int iovcnt);
 
 int xc_ffs8(uint8_t x);
 int xc_ffs16(uint16_t x);
-- 
2.43.0


