Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A49C5B561
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:30:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387329.1628627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHL-00058Z-CE; Mon, 10 Aug 2026 10:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387329.1628627; Mon, 10 Aug 2026 10:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtNHL-00058O-8P; Mon, 10 Aug 2026 10:30:47 +0000
Received: by outflank-mailman (input) for mailman id 1387329;
 Mon, 10 Aug 2026 10:30:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wtNHJ-0004t8-UU
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:30:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtNHJ-000B9X-Ay
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:30:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a854-2eae-0a2a0a5409dd-0a2a4509bf7e-10
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:45 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a79a855-be1a-0a2a45090019-d155802ec06a-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:30:45 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4996f1ee4a4so6106325e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 03:30:45 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995bb8b668sm218478455e9.0.2026.08.10.03.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 03:30:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786357845; x=1786962645; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkECl6LDMDGOPn0+PvCj6l9ySrP1BztPa+S0NKPl8lo=;
        b=XK4ZZmLdPIeRTaxO29DQeKvE5Yq9F2kKDoE/51xEgGvfJCOhc3VQTU2SsUf693ssh3
         LWKzwQ5/ARqHDrv/6JIt2VFglMMitk6P6GACT3nmFz/NHxrI0UWpWTmJm9uxF9d7TfqQ
         H+7EvhagApP6OKFXWJNOP0dxpmXNU8Y6XP09b/6QkKzfI5eks1x+2MQxJCJLpJCIFygF
         saU1GAgFTaq9QBfcL202wcg6/4Vf85nXDw/zcr7OnmMFHnz/lyazsqyUs5mQlAJTq400
         BQP1lz8bjADlFNOsIJ9rfBAhLa8csd3VFRpNrzbyEi09/7+dSBMfH4q5wXFoRImD9rni
         jXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357845; x=1786962645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DkECl6LDMDGOPn0+PvCj6l9ySrP1BztPa+S0NKPl8lo=;
        b=smh4Dds/2tE2EFxDV9SxuowfUvow7zxwImZh+/EEkEpEhKggFxYPysMUsvcBWWHMy1
         APpvwp8LiGE10ECBlM+9l9S4LctnaoUCuVN4EYyYP4zHnTbRbOEV0T44MWPnd1bSMrNp
         B11GDHqss8FeIY4Gtgh/CVyQy7cVob8yez0c+a4MYMhreCi1ly5eiYdNXxwkZgND691k
         pIaHahjd/VbKXUgGw6DJKaoF87p1W816zotfn2oTSjKr+y8IqpLLg+h909P76lFiF8rA
         UOiFXPHcqWwfQt/Tyn26CAr7S2IzdH39cw6TZe6BW1ErIfOR3r73swobpHOAxRoytvVn
         srwA==
X-Gm-Message-State: AOJu0YyIRu+n3IiHtAB6wzM5Q4OsziYbEoM14VLijSYUw5PZMO3tGsLJ
	v3zEJLFalBn05ZluDnb2LK6lDXM9GxzcWIVJoWz8S/sQ2ezrj4K+w4FiDcSC0RpWqXk=
X-Gm-Gg: AR+sD10bp/jD1AEj8oWHDVxrLEyn8C8E7QjgnZcAP/Qlxg/UwaInUKk+ekX4r9emFuK
	s9awuR06gsyyAeTg2Frm/Nkkr9GU32ZaLlimqDyGmtDMnsfkGRhdmvdY8oWkutBz0tMvG9GtAsH
	W0GLsc8kNf4tuXGYfriZjU0/ivXLrIia48zfz7gMvlu6lcns9Ha1pWB3QJPRDZbZWd887ZWk1IB
	0UI1tpVBuvqR6MUeCuCn7GlN63N9q/7AO995krbgT1ufC8yRo4dB9w8uVk1Phd5QQcEMkDSNmN4
	KiR3fcXXRF4R9o0kjTjLy5Qgqv1dp02q0Sb2BhXUi6IRE7n3yvVL+CpPdcCymVl4UWpekCskFEA
	RFq58/cP4ZDfn5GZgwhrIxNTZkzLfKz1zHsBtyCqtUgIJGXTZBPVHAl5UC1t2UsQRUpDDTBZYrY
	Nuvuj7u+W69lFUfl76NGsxV+ZRVEHM8qzGcoLZsZG4zCoOQ1uU5bbiiyiAKFD8ahscBTph07FMe
	1UaYkytL4EG3EMv+koplDndrTaMPMpfxfYXqmRm
X-Received: by 2002:a05:600c:3b93:b0:495:6a50:3fb8 with SMTP id 5b1f17b1804b1-499727417c7mr9643525e9.1.1786357844497;
        Mon, 10 Aug 2026 03:30:44 -0700 (PDT)
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
Subject: [PATCH v10 5/10] libs/guest: add xg_foreignmemory_copy_{from,to}
Date: Mon, 10 Aug 2026 11:30:08 +0100
Message-ID: <20260810103018.54564-6-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810103018.54564-1-frediano.ziglio@citrix.com>
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1786357845-3A8D9034-D08973B3/0/0
X-purgate-type: clean
X-purgate-size: 4001

This change prepare code to use a new "foreign copy" hypercall.
The new hypercall will copy memory from/to a foreign domain.
The new hypercall can be emulated with a sequence of:
- map foreign memory;
- copy memory;
- unmap foreign memory.

The reason to introduce the emulation first is that you can refactor on the
emulation without having to introduce the new hypercall.  Introducing the
hypercall first would make testing more complicated as bugs on the hypercall
have to be taken into account and considered.  Also it is easier that way to
enable or disable new code. For instance you want to test for performance
regression (in this case the code emulated should not perform worse).

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v5:
- Do not overwrite errno if xenforeignmemory_map fails.

Changes since v6:
- improve commit message, explain order and changes.
---
 tools/libs/guest/xg_sr_common.c | 57 +++++++++++++++++++++++++++++++++
 tools/libs/guest/xg_sr_common.h |  8 +++++
 2 files changed, 65 insertions(+)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 9b2782b5cf..90da21c35f 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -156,6 +156,63 @@ static void __attribute__((unused)) build_assertions(void)
     BUILD_BUG_ON(sizeof(struct xc_sr_rec_hvm_params)        != 8);
 }
 
+enum {
+    foreigncopy_from,
+    foreigncopy_to
+};
+
+static int xg_foreignmemory_copy(xc_interface *xch, domid_t domid,
+                                 int dir, size_t nr_pages, void *buffer,
+                                 const xen_pfn_t foreign_pfns[nr_pages])
+{
+    if ( nr_pages == 0 )
+        return 0;
+
+    if ( !buffer || !foreign_pfns )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    int err[nr_pages];
+    const int prot = (dir == foreigncopy_from) ? PROT_READ : PROT_READ|PROT_WRITE;
+
+    void *p = xenforeignmemory_map(xch->fmem, domid, prot, nr_pages, foreign_pfns, err);
+    if ( !p )
+        return -1;
+
+    for ( size_t n = 0; n < nr_pages; ++n )
+        if ( err[n] )
+        {
+            xenforeignmemory_unmap(xch->fmem, p, nr_pages);
+            errno = -err[n];
+            return -1;
+        }
+
+    if ( dir == foreigncopy_from )
+        memcpy(buffer, p, nr_pages * XC_PAGE_SIZE);
+    else
+        memcpy(p, buffer, nr_pages * XC_PAGE_SIZE);
+
+    return xenforeignmemory_unmap(xch->fmem, p, nr_pages);
+}
+
+int xg_foreignmemory_copy_from(xc_interface *xch, domid_t dom,
+                               size_t nr_pages, void *dest,
+                               const xen_pfn_t source[nr_pages])
+{
+    return xg_foreignmemory_copy(xch, dom, foreigncopy_from,
+                                 nr_pages, dest, source);
+}
+
+int xg_foreignmemory_copy_to(xc_interface *xch, domid_t dom,
+                             size_t nr_pages, const xen_pfn_t dest[nr_pages],
+                             const void *source)
+{
+    return xg_foreignmemory_copy(xch, dom, foreigncopy_to,
+                                 nr_pages, (void *) source, dest);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 020b1a5272..50f235ba87 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -556,6 +556,14 @@ static inline bool page_type_has_stream_data(uint32_t type)
     }
 }
 
+int xg_foreignmemory_copy_from(xc_interface *xch, domid_t dom,
+                               size_t nr_pages, void *dest,
+                               const xen_pfn_t source[nr_pages]);
+
+int xg_foreignmemory_copy_to(xc_interface *xch, domid_t dom,
+                             size_t nr_pages, const xen_pfn_t dest[nr_pages],
+                             const void *source);
+
 #endif
 /*
  * Local variables:
-- 
2.43.0


