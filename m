Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E365B606A32A
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=blnweXoN
Received: from list by lists.xenproject.org with outflank-mailman.1503174.1698987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWUtI-0002Yc-Qs; Thu, 26 Nov 2026 08:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503174.1698987; Thu, 26 Nov 2026 08:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWUtI-0002YV-O0; Thu, 26 Nov 2026 08:31:40 +0000
Received: by outflank-mailman (input) for mailman id 1503174;
 Thu, 26 Nov 2026 08:31:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWUtH-0002YL-M3
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 08:31:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWUtH-006zK3-29
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 09:31:39 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b07ee6a-e002-0a2a0a5209dd-0a2a4504df24-2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 09:31:39 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b07ee6a-b57f-0a2a45040019-d1558030f0b6-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 09:31:39 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4bba60271d7so13569455e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 00:31:38 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb9066f6e6sm273020855e9.3.2026.11.26.00.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 00:31:37 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795681898; x=1796286698; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bC2sljL7kxfF/5QRb/8CIzzY3DsLnmD+y6ElmXF/3fk=;
        b=blnweXoNNVcNv2HFo/jU3Qqna1R2Vb5GuWDxymwbMqcS/0+rBgPSE5Qsikf4IZPdbd
         L7DnKfiC+IeYGeirM+qJfRG6xUyCCpx7cyA7iEOqS+tNJJWnyYYnz8T1Ebkjz61y+z8P
         ZJOsz6QQxU/AFkQW/2QsHwJfCj5jXhYz2vpup3cznbdKUTFZjCyJNGfB/+2qbxRnksnd
         BrnsnfxG8P9O6Ez/FoXxCz3APGRjgHYUU8ELF36XKfEwOAa5GM8EV5la1+OSZzQGsM3B
         mIkiTD5Wc/88Tq1tkuJIUcU+SHmk7rVBofwb55NkUXTl/0YrMo/HvexilbH+ckRwMpFs
         y7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681898; x=1796286698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bC2sljL7kxfF/5QRb/8CIzzY3DsLnmD+y6ElmXF/3fk=;
        b=s4l6q5/Lf0sJqkwZSyO/8a93YYb0eOGPrD0ySUtMf4dMfVB8ImdVwoSxXcaBK3VnIH
         n/nLQJZCf8mekPwdv83fkTWusv03pb70q75MPioWuFHutTYXAleZ8yAKnXkRRNuDxoAW
         FJO5ISk47lRTNw87WO3RYz+iS4wpjPAneoFgymNvDUO0+5E3oHvfjIiUgMiW8CxqE9RI
         Fvco6TkzO7t0mDDzo51nQQGjqwn8WtNjJm0PtcgpA18inui7ROIjMKCSSwGvdGSiYktd
         vXjvCFR/7lkxS6Fnv6OeL9P5qawRLPL7YtZMFwImKtceG3Xycm8abEjHPy1hD6y1wjjM
         uiQw==
X-Gm-Message-State: APuU4Z+1DkxqIHjyhMAjXPdo7MoNc+x2Fka9djhWgC6/ADnui7A/ODNb
	GiLIaZx3PUe0h7T7sp6pZtoOXyKowIt5TBR+Dpk2Dcy2O5+9u0iAGhVmWtRrgA==
X-Gm-Gg: AZFdTZf72iIIEfSCLLlMF+3mceTmJqD97HKC+KF6HEjdFtu0dhM/xcckt2OVrdaVWwY
	gZqTCmWSoc3HBnJJ8899dVxLpN2XV3Ybl1aopIlUCgAqGVtvHSPDVR+fiXGgzySyrkVZ45snyM7
	v6rOSeNSBRoBzL7SElIUDSDMOB/41Ub2ey7Egl4ce+9mt7E4vzIWbNiX4szvlz92KaNlapnp9Z/
	EgCIrxKJ+1PaXHIBMJyVTS7/zMxJN3oh+DRfjXW4iH9FRorbk80y6/3RJcksEuuI1wNXsSZ5dpM
	1JqcDK+d1xw2SZeUOZakN5Rw3nMO2ADSVTkTe4mxufaoQdUwiiP5fxvKbGquLIV8vXIepULD9Ep
	xYNpOPtmwHlfaVPi0qqCcvTVbd2luQ0Q0oo9epPJBJTpATPMSib+C0An7wnafS6FGQn5MNRrVAq
	eLyOegA+wDxjaaPr23gpTJv+pyejsTOJapLFSUoh+T/9XSBLUcNWb0Li9lbS2hPt0bjAwV3OB2U
	L/nwf0jCk5a6lgEeUwopxMqPp2O4GQEcRN7v8euCAJdgqSpMur5x1yBy5sgtnN46IQ38fPCR0X0
	vFugyRdvy8xvR/OSHUrALCVpVXwN8aYdp+pQDsxXrrxUUda1M2UFdYtJgyVHAnzsLdk+
X-Received: by 2002:a05:600c:3555:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb8881da76mr406777255e9.34.1795681898252;
        Thu, 26 Nov 2026 00:31:38 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/riscv: don't decrement total_pages on failed paging_alloc_page()
Date: Thu, 26 Nov 2026 09:31:30 +0100
Message-ID: <20261126083130.32791-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1795681899-51ED6B50-218D2A3E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1138
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

paging_alloc_page() unconditionally decrements d->arch.paging.total_pages,
even when the freelist is empty and page_list_remove_head() returns NULL.
In that case the counter underflows, so arch_get_paging_mempool_size()
reports a bogus pool size and subsequent paging_freelist_adjust() calls
operate on a wrong page count.

Only decrement the counter when a page was actually taken from the
freelist.

Fixes: af87a609c79d ("xen/riscv: implement p2m_next_level()")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/paging.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
index 35f572689a7c..6464c7ce68a6 100644
--- a/xen/arch/riscv/paging.c
+++ b/xen/arch/riscv/paging.c
@@ -120,7 +120,8 @@ struct page_info *paging_alloc_page(struct domain *d)
 
     spin_lock(&d->arch.paging.lock);
     pg = page_list_remove_head(&d->arch.paging.freelist);
-    d->arch.paging.total_pages--;
+    if ( pg )
+        d->arch.paging.total_pages--;
     spin_unlock(&d->arch.paging.lock);
 
     return pg;
-- 
2.56.1


