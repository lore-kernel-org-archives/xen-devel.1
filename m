Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93BECD98DF
	for <xen-devel@archiver.kernel.org>; Sat, 13 Jun 2026 21:48:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1337565.1598938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDK-0004Kg-1W; Sat, 13 Jun 2026 21:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337565.1598938; Sat, 13 Jun 2026 21:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDJ-0004Il-Cw; Sat, 13 Jun 2026 21:48:25 +0000
Received: by outflank-mailman (input) for mailman id 1337565;
 Sat, 13 Jun 2026 21:48:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWDH-00042b-Rr
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWDH-00DVVl-7z
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dcf9c-2eae-0a2a0a5409dd-0a2a4507e990-40
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:23 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd027-229c-0a2a45070019-d1558035e569-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:23 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso15449405e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:23 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387303; x=1781992103; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUOm7tCutCPMEp2EsZgFN8Gvb7lSqyzyFNxwcVNzws0=;
        b=sLKnqmgmVih/QFsnNKfwgBRTw+wi/29W5drCCGUD5khgg2QeuDQ/v/C8FS7UdojJAq
         /FNdC22i6Owd5R1qjgJLj4zv0vwTDmz1pdJd6JJCwUJF3NR/KtSIg58jvpPVoa7ILcgJ
         IyHZWJzR6/weQIpuW5rPvnEq+um/RViurkvCT1pAcPpUPfbvkbYyt8dfvg15fjwUPVck
         GGWOmUmKbfhogLOkbCrNv8bKGFUjI82srhGtt4kVwSLquakH2Xl9XUH1p5W8JpbX4vAF
         KvbrPGfY2ElZvLxYBuTHPbnrUk0vWZ2Z7S7bRL9rPKUI8zj7yoEsK7vMyyrc0x+RzQjD
         T8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387303; x=1781992103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yUOm7tCutCPMEp2EsZgFN8Gvb7lSqyzyFNxwcVNzws0=;
        b=Wxr9Si21gSOu1Hvfm+pvVQgVwFexDh2F4MA4FUhb0j2NSv7vjl+KLGla0qPVmsAGcX
         YCWOxOCsD+Zv306097eezlNliEGSOvWkrOxalq8Cq7xM+SimGdnnSfge+H2LPa97i5HZ
         4ITA2z/hFU/07TO2mDwYMtbc1OmRDpUK4Kym5ADKqr/OtyVAm3rLHQ8cQWsRSfAehGUN
         99TuraYwDbsuphlG8WVCLtFonAcUnDmgG2aX7bhYSIZ0SyhwIcuVGuXFzjftcNLdXaFi
         MbsqfgyhCSSHuJf8lr2ZuEwFiHcm3lpnnz4//4hwaSPXMgH9fOxETqW1eVcTIrn1m4oZ
         xHpg==
X-Gm-Message-State: AOJu0YwIpgp9KZ6QrOZrE/XwmDk4g7xVwTVVNU+JQwkCe1pAt7SrSkNZ
	GjjMy8iTTYFGteupo9HYzBSfa6QCUDqGOjZw7zf0Nh45wHfCxqTRiJRjKHZnUluXJl8=
X-Gm-Gg: Acq92OHrIQoA9frNcoLs0PDYVdEzAMnySVsOgVRg5EupYh9HnaLlbwd7yAIbgi7sVyp
	w5uqlT3L5cq9WTXaWaaepPi9pUvoLBTIqaLaSsfkywzYVPhsRhN214HKC/GvIEF85y5b1MOmssW
	JySzMXB5tkc4jMam2R7nC8PIMbPjgZrw6DR/Jo3fTm47FlVq99g6c6+LOuNboSbcjg/gr6u9b5W
	0N664vy99cG7wiRwkOA2NdpJdh6cgfinS3tDVHEb4+0ikYVs9rmZ9wsuvPDnNP2UHErpjWUefWq
	uKq0eFwJG8gyPIhtSlsujyCZua8fh+PkuUEXbOHOdzI7U190OcvpaW4uZFBVQ9vMv2YNp5dl1WO
	d8vwnBX0FsHSpq/AdnOmLIm2r2Ry1UOBNdKRzN1NPSBdEddDOdWqCZuNhdyp7ppRsjzEia7QAo5
	/uZFzPYT1aD1vo+wmJE98LHzdkas6Dv+r9Z4jH3DwNmfbDtjXQB+PrB0fSCxfnJnIpcPYRRM2re
	BRHIVzG1q7N1jErtaC9XVXLrPo5QNRGkqqx
X-Received: by 2002:a05:600c:314a:b0:490:bcc1:4edb with SMTP id 5b1f17b1804b1-490ec504eb5mr92109205e9.27.1781387302615;
        Sat, 13 Jun 2026 14:48:22 -0700 (PDT)
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
Subject: [PATCH v5 14/16] libs/guest: use new hypercall if available
Date: Sat, 13 Jun 2026 22:47:47 +0100
Message-ID: <20260613214749.20620-15-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1781387303-2236CC48-96F20C25/0/0
X-purgate-type: clean
X-purgate-size: 3659

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Use new hypercall if available, otherwise fall back to map+copy+unmap
sequence.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v4:
- use int8_t instead of char for signed type.
---
 tools/libs/guest/xg_sr_common.c | 47 ++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index f760b63548..b26633d95f 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -156,11 +156,6 @@ static void __attribute__((unused)) build_assertions(void)
     BUILD_BUG_ON(sizeof(struct xc_sr_rec_hvm_params)        != 8);
 }
 
-enum {
-    foreigncopy_from,
-    foreigncopy_to
-};
-
 static int xg_foreignmemory_copy(xc_interface *xch, domid_t domid,
                                  int dir, size_t nr_pages, void *buffer,
                                  const xen_pfn_t foreign_pfns[nr_pages])
@@ -174,8 +169,42 @@ static int xg_foreignmemory_copy(xc_interface *xch, domid_t domid,
         return -1;
     }
 
+    /*
+     * If foreign copy is supported, -1 not initialized, 0 not supported,
+     * 1 supported.
+     */
+    static int8_t foreign_copy_supported = -1;
+
+    if ( foreign_copy_supported )
+    {
+        int rc;
+        privcmd_foreigncopy_t copy = {
+            .dom = domid,
+            .dir = dir,
+            .num = nr_pages,
+            .buffer = buffer,
+        };
+        DECLARE_HYPERCALL_BOUNCE_IN(foreign_pfns, nr_pages * sizeof(xen_pfn_t));
+
+        if ( xc_hypercall_bounce_pre(xch, foreign_pfns) )
+            return -1;
+
+        copy.pfns = foreign_pfns;
+
+        rc = ioctl(xencall_fd(xch->xcall), IOCTL_PRIVCMD_FOREIGNCOPY, &copy);
+        if ( foreign_copy_supported < 0 )
+            foreign_copy_supported =
+                (!rc || (errno != ENOTTY && errno != ENOSYS));
+
+        xc_hypercall_bounce_post(xch, foreign_pfns);
+
+        if ( foreign_copy_supported )
+            return rc;
+    }
+
+    /* Fallback, emulate. */
     int err[nr_pages];
-    const int prot = (dir == foreigncopy_from) ? PROT_READ : PROT_READ|PROT_WRITE;
+    const int prot = (dir == XENMEM_foreigncopy_from) ? PROT_READ : PROT_READ|PROT_WRITE;
 
     void *p = xenforeignmemory_map(xch->fmem, domid, prot, nr_pages, foreign_pfns, err);
     if ( !p )
@@ -192,7 +221,7 @@ static int xg_foreignmemory_copy(xc_interface *xch, domid_t domid,
             return -1;
         }
 
-    if ( dir == foreigncopy_from )
+    if ( dir == XENMEM_foreigncopy_from )
         memcpy(buffer, p, nr_pages * XC_PAGE_SIZE);
     else
         memcpy(p, buffer, nr_pages * XC_PAGE_SIZE);
@@ -204,7 +233,7 @@ int xg_foreignmemory_copy_from(xc_interface *xch, domid_t dom,
                                size_t nr_pages, void *dest,
                                const xen_pfn_t source[nr_pages])
 {
-    return xg_foreignmemory_copy(xch, dom, foreigncopy_from,
+    return xg_foreignmemory_copy(xch, dom, XENMEM_foreigncopy_from,
                                  nr_pages, dest, source);
 }
 
@@ -212,7 +241,7 @@ int xg_foreignmemory_copy_to(xc_interface *xch, domid_t dom,
                              size_t nr_pages, const xen_pfn_t dest[nr_pages],
                              const void *source)
 {
-    return xg_foreignmemory_copy(xch, dom, foreigncopy_to,
+    return xg_foreignmemory_copy(xch, dom, XENMEM_foreigncopy_to,
                                  nr_pages, (void *) source, dest);
 }
 
-- 
2.43.0


