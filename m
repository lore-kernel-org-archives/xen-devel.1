Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592F6C5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:31:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387334.1628660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHQ-0005zd-S1; Mon, 10 Aug 2026 10:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387334.1628660; Mon, 10 Aug 2026 10:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHQ-0005yb-GH; Mon, 10 Aug 2026 10:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1387334;
 Mon, 10 Aug 2026 10:30:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wtNHP-0005rk-Bq
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:30:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtNHO-00Dyin-Oq
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:30:50 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a85a-bab6-0a2a0a5309dd-0a2a450ce3f8-0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:50 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a85a-f479-0a2a450c0019-d1558032ad5d-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:50 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso13250535e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 03:30:50 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995bb8b668sm218478455e9.0.2026.08.10.03.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 03:30:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786357850; x=1786962650; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAXV9ixt1kgi3GnwQ2iOZUoRsAZqt/4+AFDCaE6CjSg=;
        b=P5iCpsfNaVH88Si13CsIDlLOFZztr6wXx6/QCdl1ZFuI4R/OZccH+ZMMxp5OAFoS2/
         IQsUMSmvlVryFWImXqacDwF/dXwMabeeRyrSsqyRmyCaDxSgT2MRpkerCM/tdLkE3bA4
         pHO693NJptx9bwrdUmbznIh8L0PrUL0nGGGYF+9zfCA9+SlcohYv5LiDaZ3X/8JTG5k4
         lPl4aplLUymxPbI55R8UpTejLhm2ybPnjL7xF8QJCkWygt9ZcVVOQgarR6ELVijkoort
         mS8oyYbSqkhIhhgT0Fn35QTFIiy6Bma7f8pmcOUcrTHtKkdSSxZggFwjpaMC1ieAxNqC
         pe/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357850; x=1786962650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kAXV9ixt1kgi3GnwQ2iOZUoRsAZqt/4+AFDCaE6CjSg=;
        b=rY/hK24RFYvWKtj+nJpwj03KxQepQ0sGNqDpP6PnG2hHUWHMazsQ3VXQ+WLGybocg7
         oxIC3p7LD41aiEU/+mzNqI30WPF0riSlXcsgevmDYo6jsGF3EmPCIJkSfL6SV3Mg9YSy
         k8gXbsS2yMGJX8v4OGr909Q9mQG52Zx9uYCdme6ONg7Yy5O5PW+N+DCQpNYp7KnQPcHB
         z8MQlwrQNYtvU+STulPuJurlhP72Ahlhg/4xNyxiTzJ7tzSBRJajXxTz+QLC7BR5wk6X
         wysYMoeHEM2x3PLsPWXdAYdIHc37ZFmFxBjp1G2rE3tUwH/lN76BrnC+gm1EoMzI8ifc
         Fnmw==
X-Gm-Message-State: AOJu0YzncX2+NPhg9m9OZTiQgTtN53M6hpXdS0fmTUkOCQ7h43ioOg5W
	YzQjJpHOg7z9gB4eUsop3w4HUtkqwfXbLQCpLEmbyfKCKlZLd23Cetew9PFZSal2T6s=
X-Gm-Gg: AR+sD11ZoQpDWYJWdZduz8EPTTu2UDEv+8gGN6W3lT3OZLoGxmLGxIqtzLTuPqzTumh
	G8x4ISKAgJLt0Sz/WiA55jMZS5pUdnvoRDFgHoy5RKuzHPD7f2ay0VkTJA07sgi3+FDGch8wK2N
	+CinvDQ2iLAA4CgqFt9pZoSxabkrAmU0kUeHQ743AvGZySd/t+gPgQgPufO+/0Ub0ddKgIcrFsC
	GiORVZfh1uP5Ap9mdN5rNCIzrwfuYwPVn7j54wE8dO9v/j+5TKWOwo9jZzzqsGpRpTs313sX1P/
	osto5luJSZWm+0/B3vqJPn2Z39PqIXWUKwTeIsfn6U8S0lde8jUO/kz7T6E9JRzyCI9QjbH773p
	fepH99Yx93OIwHAKwBTSC+tMRSohwMM67SEogEGkRWgvmswSk0OszqtRoKo1T8Hw1wkBBp11v7e
	rCZa+7L0VNk1NTkD5hUXWRgFla0Wo8Gt/k3KT913+QL5q3Q1k21QYX7TLOYZzOT06RqcXfkCuuU
	VUv4VheoKXoxPdPBeyQpRKk4auOfKPdtJdIbbBD
X-Received: by 2002:a05:600c:35c8:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499593ba192mr395987645e9.1.1786357850038;
        Mon, 10 Aug 2026 03:30:50 -0700 (PDT)
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
Subject: [PATCH v10 9/10] libs/guest: use new hypercall if available
Date: Mon, 10 Aug 2026 11:30:12 +0100
Message-ID: <20260810103018.54564-10-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810103018.54564-1-frediano.ziglio@citrix.com>
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1786357850-51D34A5B-337B1D1C/0/0
X-purgate-type: clean
X-purgate-size: 4281

Use new hypercall if available, otherwise fall back to map+copy+unmap
sequence.

I took some statistics while migrating some machines instrumenting the
code to use new and old code and doing it 5 times in a row for each and
the raw operation takes at least 4 (from) or 5 (to) times less.

Specifically for a test done with a machine with Intel Xeon Sapphire
Rapids CPUs and migrating a Windows 10 machine with 12 GB of RAM
the ratios were:
- 4.9 times faster copying from guest to dom0;
- 5.3 times faster copying to guest from dom0.
The test was repeated multiple times resulting consistent in all rans.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v4:
- use int8_t instead of char for signed type.

Changes since v6:
- add some statistics.

Changes since v9:
- fixed a pointer initialization.
---
 tools/libs/guest/xg_sr_common.c | 47 ++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 9 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 90da21c35f..ce5026c707 100644
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
+        copy.pfns = (xen_pfn_t *)HYPERCALL_BUFFER_AS_ARG(foreign_pfns);
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


