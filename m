Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542ACCD98F2
	for <xen-devel@archiver.kernel.org>; Fri, 19 Jun 2026 13:05:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1342215.1602527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuY-0003s2-W7; Fri, 19 Jun 2026 13:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342215.1602527; Fri, 19 Jun 2026 13:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuY-0003pd-KX; Fri, 19 Jun 2026 13:05:30 +0000
Received: by outflank-mailman (input) for mailman id 1342215;
 Fri, 19 Jun 2026 13:05:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuW-0003Oi-Ns
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuW-00D4eo-4h
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e89-2eae-0a2a0a5409dd-0a2a450ba98e-48
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:27 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e97-5e53-0a2a450b0019-d155da2dc847-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:27 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c0c2cd63abcso8619666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:27 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874327; x=1782479127; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hgv7ktFS+jLe873S6Sbh6nVqNabtaLtoEOjsXoZuzKo=;
        b=cdF3yC64Ce+D2emYuDcoHFM5+ae2GJUS0BVu93IaDgZgKkfbdlvVmIUMWDPEXU2yKt
         aJ3LG3kqxqVOiQ8xXlb/13q+pDZgSHsUisa+tzdVPsE6EQSxppnT4ScMJmBiG3J9Unvl
         CVLwp6jnXDe2BQNggOp5f7WNAaW309SbYawfsNZ9n1lAyISG9rzAz8GTaPw2CDiPjIet
         EagKKo331Upge06Bwo9NG6pVk/QAEqmERcsueksX2BoViJToFOPL7xXzFeLLNZ/YkqCt
         YHHqTNB16M+kw+cuk/TCkjt+yb62YKdHZJ56+BjwyW6qdvPxDCoBfzpYS2ebZrcdrqo/
         3Wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874327; x=1782479127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hgv7ktFS+jLe873S6Sbh6nVqNabtaLtoEOjsXoZuzKo=;
        b=Z0qZ73yyCPp6sDuM4BtkKNCJGtz7vQpK+//EQrI8QVlVtDLzb6hDbBdPdt8g7K9WA8
         nZVNR1HxqsHy2qlHc1FViwLAbQCx5Cgcb3V4QNnREidBtQej2nZ5e2xiX5jZ24qsVx7X
         tPJayUUOklqrkFXQ95H8ehMFKzkLYzfJLQyw83anx/qe5Q4VNoUKKuswB+SfOHsCrBf3
         5MoMaiHb4lshhHRD5IvucD+FhzoHYTUUUAD3TbeRdkBThb7eebHvwWL0f0sG/gJhVqsI
         QM9WPPN8LhQGw1FSJairXW1CzQfXLW84b7e8ag961M/1I/8uRsSohSvbwo9NYX8igGKj
         t/hA==
X-Gm-Message-State: AOJu0Yz4aBokVz73Wf0RuTPDWROioDvJUmerFh+N7G5i5E8wjKTgVy43
	41By5h8+A4ydHu9MLjqINCXvIQaV3uja6Yzn5ZFqaV57s3dmgHySxpw3ctEqLU+51B4=
X-Gm-Gg: AfdE7clDC+oS9/ug9q9uiMzydQ2/tAeZgyzLwvUZV+3lnPNJYE5F6/t1o8P7euK85sf
	sqahgFta3VliebONgRs5EIuilETtCNzX+g1uwsd+tTe6wMTxQCQ+B6nRjQdmv9WPlvFZ005pTOt
	x5mTQF16ekS8icSNxyWv4yaHA/9EyeRiZArELwdlzWowKDLpe4hWicDptZjgTSNXL7rUmD/vyX6
	8RiCUKYDYnKOr8uxBrnYQmwxRavEDiY+8Dg9DmUnsRGXqsANLLOc7PfwH5PKXXrS7SJV9D5vHaz
	4AOLPlEC6fm8Nm8PLit3wcfDQNvwbV/rYEUAKzSygvQgiRBcWUs9wYCMvhv/i8pRwxkupOrtS2O
	NFntO5xAP9JttzlSb1DIymAycymJ2K/VHoZFAsBgIBPcgf/xNb3PU4Xnvm10OvGxI2v2UJKYBZf
	W1W32KX5oHqbEyFZu8GR0QtloTJDykB9IOyLiHLvIW8YHTcm8kWgLmL0rALdMVPBBI6zj9qxpNy
	pyHyufc
X-Received: by 2002:a17:907:25c1:b0:bee:1e36:876c with SMTP id a640c23a62f3a-c097cbca770mr174465366b.41.1781874327127;
        Fri, 19 Jun 2026 06:05:27 -0700 (PDT)
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
Subject: [PATCH v6 14/16] libs/guest: use new hypercall if available
Date: Fri, 19 Jun 2026 14:04:59 +0100
Message-ID: <20260619130501.272832-15-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781874327-473E300E-1732FAA3/0/0
X-purgate-type: clean
X-purgate-size: 3605

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
index 90da21c35f..c2e7d78e33 100644
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
@@ -189,7 +218,7 @@ static int xg_foreignmemory_copy(xc_interface *xch, domid_t domid,
             return -1;
         }
 
-    if ( dir == foreigncopy_from )
+    if ( dir == XENMEM_foreigncopy_from )
         memcpy(buffer, p, nr_pages * XC_PAGE_SIZE);
     else
         memcpy(p, buffer, nr_pages * XC_PAGE_SIZE);
@@ -201,7 +230,7 @@ int xg_foreignmemory_copy_from(xc_interface *xch, domid_t dom,
                                size_t nr_pages, void *dest,
                                const xen_pfn_t source[nr_pages])
 {
-    return xg_foreignmemory_copy(xch, dom, foreigncopy_from,
+    return xg_foreignmemory_copy(xch, dom, XENMEM_foreigncopy_from,
                                  nr_pages, dest, source);
 }
 
@@ -209,7 +238,7 @@ int xg_foreignmemory_copy_to(xc_interface *xch, domid_t dom,
                              size_t nr_pages, const xen_pfn_t dest[nr_pages],
                              const void *source)
 {
-    return xg_foreignmemory_copy(xch, dom, foreigncopy_to,
+    return xg_foreignmemory_copy(xch, dom, XENMEM_foreigncopy_to,
                                  nr_pages, (void *) source, dest);
 }
 
-- 
2.43.0


