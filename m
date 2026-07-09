Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0FCC44508
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 07:44:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357591.1611973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjQo-0007GU-KX; Thu, 09 Jul 2026 07:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357591.1611973; Thu, 09 Jul 2026 07:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjQo-0007Fd-GZ; Thu, 09 Jul 2026 07:44:26 +0000
Received: by outflank-mailman (input) for mailman id 1357591;
 Thu, 09 Jul 2026 07:44:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1whjQn-00074a-I9
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 07:44:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whjQm-00Ca40-VM
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:44:24 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f5158-e002-0a2a0a5209dd-0a2a450ca7e4-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:44:24 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f5158-f399-0a2a450c0019-d155802cd443-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:44:24 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493e8d4f4dcso7714105e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 00:44:24 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3b85sm69114695e9.2.2026.07.09.00.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 00:44:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783583064; x=1784187864; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Acb+KBsW3mKtkw9510ffwdV80EN7Kf7SNHo6XfWGcqM=;
        b=b8MyR2yuRgmpuruk6+Ujgv1BNLrEIiq87Ez+C/btWfjRh2/VOA4yWbS29yh6b1alCR
         zL7x2HM4MvFUh6+ldhNQtvEYkzvXjDLPON0EFdWMVWUYbFwFXP2mfReUfl68KL6AF6TD
         CWFquqi7QxW1jcQa0Ba3zkXL1yg3ICK5MxoDbapHH0DMciV4XlI7ebz17PaWkpgL2fHC
         e1WfWVh6YqmWHESklDH3uYtU832eG7kblvoHTMNSrKNg6XwDdgalSzzJxqXxRSkwrlLw
         YpRHOvGsEQy72fEjDlcrnCIA6b0VxyYXqguY/FNwET2yPogXcRDPtVhajSq1HT2smBcw
         QCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583064; x=1784187864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Acb+KBsW3mKtkw9510ffwdV80EN7Kf7SNHo6XfWGcqM=;
        b=ANHvXXOQBIA/HKIG+9Czbgxy1mr9zQsZNZ+atxhdcbRFqUzNiIR3HmiWi8ZGBRzsru
         Ede6GT4CVL2TFKWFRNrnJnZnM7qJtwGCtJQcJLDjqe0F5znKtk1Evspy5svlao4Nz3D+
         r7vYbkTfbJscWoYig4W176LNYrysnL/TFSL+LFcNgrTk/px3TIGBKHkPIHbrxu8WD+8S
         /L8rGqsWP5WqkFMUheAhX9hpjAwovODYbKExd6oyyM7JiFyCI0I7hBzFo1L1Aoc/7+a5
         AGemRJ4R1tcGzNHNO7NJ7hT9bwcPTGlVaXNC9uxoaPTMjjcFohoNJTvwLJ0dUhHpfDqg
         2THw==
X-Gm-Message-State: AOJu0YzQ4bDdR6TUfgtPvOT0rJGBa+7rqft/WIVimC8rP6dAJCbs7PCc
	uDiibfN8NsryUnZQ8e/Eh3uwfYmG36prCbHI0rwiPP+GCUfJjsASQvr0GMIhMhV2Png=
X-Gm-Gg: AfdE7ckaKKVvClVRRsDW62TD66aCcnBt8TtLb+EtKIVWQ0VUc4SmSCFjnC2nZX6lhBQ
	NNGzOhlcI7xcqyDPtcWoucXrdoysN8IgyHz0OZRrrS6AjgTtak2xf1ve97HQCQV0BVnMTd3lqD7
	06qYMAgElevV5pD83yJb26zeX8SDUmRMf2dJa/zAcYMlo0PkOByWfTJhHNqklPVD8z2yD7ySaK8
	NdUZySOGRJiUTspzF+MAE5flUhG8fHY0h1bClkK1wktxVLOk3DbV2rCDOgSYnYR5+mBTXYk8YBY
	oE+ajLVhd0f8odI2HjSjht0OKlHLeBuAiaVyWn3X5Ocl52ON+iy5JUS3M4iPaVqlwOnzU7p2yjt
	SCfnzT3Nv2fEvu4X1eisF/a39TV0W1+twuZCxZcHq90fNe1OBC2EB+l3bshdaSzOfxaeQYBrfVn
	pZlLQ0od3lnxHB3zBF/JamkPdfYnSdpTcR0blsITz2iCQP0NV82aZwp0aH3OpRaWzQKrg4i81Wc
	uiZKkoHAWRxgXROd1U=
X-Received: by 2002:a05:600d:844f:20b0:493:c77c:108a with SMTP id 5b1f17b1804b1-493e68a1dc1mr43255775e9.36.1783583063974;
        Thu, 09 Jul 2026 00:44:23 -0700 (PDT)
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
Subject: [PATCH v7 2/6] libs/ctrl: Allow writev_exact() to change the iov array
Date: Thu,  9 Jul 2026 08:43:53 +0100
Message-ID: <20260709074358.256084-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709074358.256084-1-frediano.ziglio@citrix.com>
References: <20260709074358.256084-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1783583064-0F737D51-67959FFE/0/0
X-purgate-type: clean
X-purgate-size: 4311

Avoid having to allocate and copy the array if a partial write happens.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v2:
- change prefix in subject.

Changes since v6:
- use a single loop to skip IOVs;
- add a comment to the function.
---
 tools/libs/ctrl/xc_private.c | 65 +++++++++---------------------------
 tools/libs/ctrl/xc_private.h |  3 +-
 2 files changed, 17 insertions(+), 51 deletions(-)

diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index bb0f81d6f3..89ec68a183 100644
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
 
@@ -649,70 +649,35 @@ int writev_exact(int fd, const struct iovec *iov, int iovcnt)
     return 0;
 }
 #else
-int writev_exact(int fd, const struct iovec *iov, int iovcnt)
+int writev_exact(int fd, struct iovec *iov, int iovcnt)
 {
-    struct iovec *local_iov = NULL;
-    int rc = 0, iov_idx = 0, saved_errno = 0;
-    ssize_t len;
+    int rc = 0, iov_idx = 0;
+    ssize_t len = 0;
 
     while ( iov_idx < iovcnt )
     {
-        /*
-         * Skip over iov[] entries with 0 length.
-         *
-         * This is needed to cover the case where we took a partial write and
-         * all remaining vectors are of 0 length.  In such a case, the results
-         * from writev() are indistinguishable from EOF.
-         */
-        while ( iov[iov_idx].iov_len == 0 )
-            if ( ++iov_idx == iovcnt )
-                goto out;
+        /* Check iov[] to see whether we had a partial or complete write. */
+        if ( len >= iov[iov_idx].iov_len )
+        {
+            len -= iov[iov_idx++].iov_len;
+            continue;
+        }
+
+        /* Partial write of iov[iov_idx]. */
+        iov[iov_idx].iov_base += len;
+        iov[iov_idx].iov_len  -= len;
 
         len = writev(fd, &iov[iov_idx], min(iovcnt - iov_idx, IOV_MAX));
-        saved_errno = errno;
 
         if ( (len == -1) && (errno == EINTR) )
             continue;
         if ( len <= 0 )
         {
             rc = -1;
-            goto out;
-        }
-
-        /* Check iov[] to see whether we had a partial or complete write. */
-        while ( (len > 0) && (iov_idx < iovcnt) )
-        {
-            if ( len >= iov[iov_idx].iov_len )
-                len -= iov[iov_idx++].iov_len;
-            else
-            {
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
-                break;
-            }
+            break;
         }
     }
 
-    saved_errno = 0;
-
- out:
-    free(local_iov);
-    errno = saved_errno;
     return rc;
 }
 #endif
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index b5892ae8dc..8a325c17b0 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -383,7 +383,8 @@ int xc_flush_mmu_updates(xc_interface *xch, struct xc_mmu *mmu);
 /* Return 0 on success; -1 on error setting errno. */
 int read_exact(int fd, void *data, size_t size); /* EOF => -1, errno=0 */
 int write_exact(int fd, const void *data, size_t size);
-int writev_exact(int fd, const struct iovec *iov, int iovcnt);
+/* May alter @iov to cope with partial writes. */
+int writev_exact(int fd, struct iovec *iov, int iovcnt);
 
 int xc_ffs8(uint8_t x);
 int xc_ffs16(uint16_t x);
-- 
2.43.0


