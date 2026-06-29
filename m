Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00712C43458
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 16:06:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347756.1605588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weEUi-0003vS-9K; Mon, 29 Jun 2026 16:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347756.1605588; Mon, 29 Jun 2026 16:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weEUi-0003vL-6R; Mon, 29 Jun 2026 16:06:00 +0000
Received: by outflank-mailman (input) for mailman id 1347756;
 Mon, 29 Jun 2026 16:05:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alhouseenyousef@gmail.com>) id 1weEUg-0003uA-Rg
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 16:05:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weEUe-005OL7-GF
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 18:05:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a4297d0-2eae-0a2a0a5409dd-0a2a4506a422-48
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 18:05:56 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a4297e4-08de-0a2a45060019-d155802ab51d-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 18:05:56 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so29385775e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:05:56 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-472bca3caccsm16289696f8f.33.2026.06.29.09.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 09:05:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782749156; x=1783353956; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=urju7AHNAPTsZhmiiZ2fXVN5kyTyXWHOnIy66aKFET0=;
        b=elt5y22BvDyKDxbeFu+aiELEAnRPTQkBdZrfFuIdpG2doJMqryhEiZDNRAXr5klsY5
         CGUXeTV2Z6U41OerIGMbLY/PXhsO83HoJ4Ch87dSK7mB5mpnMO6IEbkm59Eixpme+iQr
         r7Tb64jgs6geiLG16CEb/DUkBS5MUV4N6TbYDTAAWnZqW0Wam3OHSk8gSXdfOTfoCx0V
         BpHYtX6mWkHZz1BnIcJKFtqEd/RsnlyIGwLASEhuYnQbhYFfna18yK1hpqWEXNZijBVX
         47ByWDbezO6ZnC23rWl3SUWtncEG6QZ2eRpzNx0xUbFEcnsUO3wW1ciGCs1gJNQtyrbQ
         LRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782749156; x=1783353956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urju7AHNAPTsZhmiiZ2fXVN5kyTyXWHOnIy66aKFET0=;
        b=FdoFOSs48EMVVmY7UBjwBluCoTAomGAqjeijTyQlCubtD/tGtFyoZvnqPXdog8Pv34
         cts73v2fW0En80TON6mh3StImOQXPBwQBsY04XCT7+dOa+g1gudJWi5n21vifoFBJLFr
         9TTyqRBywEsDxlHW1pCOSxE1RrN7qGN5s9RXDUeKv/PTLOdiDISDyYEaAWN6X39M1mVZ
         vZEfLWtJP1Gus5Obqb9oln00LxnsxDCeda/84hs5aiLpnB403a8xAeYgvN20azqLb2UY
         4XQX0B5VJmfk20ZRMOSPxwBGL7RZmdzRmvrjvCmpsW6vXQV1bdqaPiuOb85EMz3RFY0h
         dDFw==
X-Forwarded-Encrypted: i=1; AFNElJ+qNpaBB0BeS+jTQatxRSarXbRLVsdkQOtact/rPXhu+7mSo5lHEDJBLQbfR1Zi/sM0ryBEuc3Chvw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrIh00QdPYEgP27kUuivAJVTCwJFxcy6J6qe73/lKsOM9IdW7f
	U5h9V3RHbg7v66llOqh5wYj1BjOKWwCIySQzImT0G5RS/JADd8BuRwZM
X-Gm-Gg: AfdE7clpNaunmvLwB2lfU8TLxJfXAwffQrqD+FsC2Pirr6tdgg7InZatTxkktD8yDKi
	hBRpwuwmM8vK4veaDpAy0MVA2VwpuhRSM6YL8JGKuE/U4sd9yVOchBifWDNzOsZGlDaLyr8CcHv
	l/F+SC42q1kFYJ9RI2EprfrfUuoLYon1eLnJwbQs+9B70oD4zB+nyf/n0yL6PPj7t87+O6WAejE
	8P7eRgEdQYMN4Y20fbj5ZzzVcrUKbp1/z1nUMpQI6W0Z7ZeQkP1XAQSEN1z1eI7V8ElCfDw9+C/
	HW9hHYrtyT3cFgdz48ajj5V8EB4ctXOu0DJhVJ2IeAFExlGTm/RSg6rwHTcrO3mAu8HCTX6vntg
	fpyoIyK3oq8MKa/btw4LCn2OQcIFiFNNbgNlTGt7knseOWnGOGGBA+6XQoDX+KemXx2RAwKh1eM
	9vR5CWQZNYbohgFHwMJ5FfK9LdRA==
X-Received: by 2002:a05:600c:8b4b:b0:493:b55f:bca2 with SMTP id 5b1f17b1804b1-493b82c3225mr4557905e9.34.1782749155666;
        Mon, 29 Jun 2026 09:05:55 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] xen/front-pgdir-shbuf: free grant reference head on errors
Date: Mon, 29 Jun 2026 18:05:17 +0200
Message-ID: <20260629160517.29340-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1782749156-43F2C68D-C2A51C70/0/0
X-purgate-type: clean
X-purgate-size: 1650

grant_references() allocates a private grant-reference head before
claiming references for the page directory and, for guest-owned buffers,
the data pages. The success path frees the remaining head, but claim
failures and grant_refs_for_buffer() errors return immediately.

Unwind through a common exit path so the private grant-reference head is
released even when granting fails part-way through setup. The caller
still tears down any references already stored in buf->grefs.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/xen/xen-front-pgdir-shbuf.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/xen-front-pgdir-shbuf.c b/drivers/xen/xen-front-pgdir-shbuf.c
index 9c7d8af6e6a1..428187edf85d 100644
--- a/drivers/xen/xen-front-pgdir-shbuf.c
+++ b/drivers/xen/xen-front-pgdir-shbuf.c
@@ -445,8 +445,10 @@ static int grant_references(struct xen_front_pgdir_shbuf *buf)
 		unsigned long frame;
 
 		cur_ref = gnttab_claim_grant_reference(&priv_gref_head);
-		if (cur_ref < 0)
-			return cur_ref;
+		if (cur_ref < 0) {
+			ret = cur_ref;
+			goto out_free_refs;
+		}
 
 		frame = xen_page_to_gfn(virt_to_page(buf->directory +
 						     PAGE_SIZE * i));
@@ -457,11 +459,13 @@ static int grant_references(struct xen_front_pgdir_shbuf *buf)
 	if (buf->ops->grant_refs_for_buffer) {
 		ret = buf->ops->grant_refs_for_buffer(buf, &priv_gref_head, j);
 		if (ret)
-			return ret;
+			goto out_free_refs;
 	}
 
+	ret = 0;
+out_free_refs:
 	gnttab_free_grant_references(priv_gref_head);
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.54.0


