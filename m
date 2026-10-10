Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2238CA6017
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 13:29:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445127.1661571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFX88-0003Z6-9y; Sat, 10 Oct 2026 13:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445127.1661571; Sat, 10 Oct 2026 13:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFX88-0003Yx-4Y; Sat, 10 Oct 2026 13:28:52 +0000
Received: by outflank-mailman (input) for mailman id 1445127;
 Sat, 10 Oct 2026 13:28:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <coolhaoyt@gmail.com>) id 1xFX86-0003Yr-Sz
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 13:28:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFX85-00H6J3-PR
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 15:28:49 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <coolhaoyt@gmail.com>)
 id 6aca3d6a-8faa-0a2a0a5109dd-0a2a4504e2da-44
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 15:28:49 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <coolhaoyt@gmail.com>)
 id 6aca3d91-b57f-0a2a45040019-d155dd34dd94-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 15:28:49 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48b03f23305so482149f8f.1
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 06:28:49 -0700 (PDT)
Received: from MacBookPro.mynet ([2a01:4b00:d30b:d900:6ddd:39b4:db1c:54b9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db946323bsm10253800f8f.2.2026.10.10.06.28.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Oct 2026 06:28:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791638929; x=1792243729; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P1/Es9O9eGH8bjYRkCHog0dJrMCbWBRJpn4ygZ0p15g=;
        b=mdIE8uyOCbQGp+4SXz4tvtBihmHlWc/rEMrXDSxrYb2PEQZNQfj437L7pNpHDIxh4m
         1naAVTuKUK9WLMcG1z9rI4B6VaE6nt8aC8P/q0dLnUwJjI/8f9pYADKMfPibnNLUuE8u
         3l5Gg4e2eP+LFsepejbdPb0o/+DyszYC+FJBpJlDLJLn+E8kN+w6zwcEZ4xWuHN4Z1gG
         YQz/19rWdiR0s2ykj6pvvAVC0n+pH5HXGJEisfw2bcTo4o21mGBuakLtgtbDvllkQXkD
         b5mpGQWDO+SQatjWU25HQRGF9nMjq26wHIgdqanhYKF+lsTRbpO6QCRNZoQR5wWcP9fF
         iJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791638929; x=1792243729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1/Es9O9eGH8bjYRkCHog0dJrMCbWBRJpn4ygZ0p15g=;
        b=Y779/RmTF1H1WRepzSZNpfTNh509jo7b2UdEI6CMbilS6WVZDqyfJD4AgztSTTJUyv
         M7DQQlbfSwOL1J5ufQRWCgudbsglpQfJCRi0iGpQjA2BghUiOzpH9UXL17FolOKbMWyX
         ABaGp9OZ4PSAfC/DwrNp35byjBPYJsUtLUenhmVAWQe77/B/nOJJeo6OhbUOl28jVW+M
         6EDJy1weF2v3YArvCBYiBAJMU1vvL8qLZf2XPTos7dh6OdHhewKtyiTVj8RaH4/8aqJX
         TQbnLugVHPQ6AoNr2n39EbNyTFv3Fyh7MKVzn6SWJrDp+l9XfgRnkFbGJ5A3eW+RJugu
         rqJA==
X-Gm-Message-State: AFq9FYJo/dvFramTjbmu+eTUWrbtAs3Bmc9abHE9F+V9HUIKv49rbrbT
	QGY2fUN/iTwl4dX03HteDTeNWngA45dH3B6O/1nTHGBEcP2AGEoNn566OI0KAu+yuTo=
X-Gm-Gg: AYBFou2DrHNJs09wprEezUHF1q/xmVNpUKJD+BeP4p7Xhh+AEZO2ujcaRGU0nJGfP9U
	9jTkYkWaubqcx6CZnP0BLHTnbd7smJEISYdLR5vaPBxdN5kipXAzsWZ6sF40yAQdJr+cToM5Cms
	ilg5BmokTtu5m9bvgM+kBfDDMNgDMtNeyh2f3Q7kyhv6QoYN0OcU1EoI61olRVn7HBLW1HeOOVW
	tQa8bikZGhzLSdcp5NH2o7qqnBfnY3wyxgX2N6EZVmPPmgnoXFdzuLqqvLsTcQ77jmIOPU56273
	yrHpfsXkQAfv2oYAkvuOSYhnKgl9uyuGAfexBJTi0tKo8XNcK3ZUoTrvOCkwnKh/WN7HsPch4dr
	sde+lGykkhKa9O3U+UNKaLctLw4e/D8HtU38AQ6PgwuFdZMztZvLyazYAShUvsoIiVjYJOLcwsi
	wWF2YHYimFSaEyOVB3nCumdPuimfJzEAMOIfwUY0fQrSur39i29NRy591M+RI5Nmgxzfqjd08pW
	ITzsaGO0yW4DR5mzhjMWMPWt5poD4QdH53P3cw=
X-Received: by 2002:a5d:5e91:0:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-48dbacdf252mr9272302f8f.37.1791638929043;
        Sat, 10 Oct 2026 06:28:49 -0700 (PDT)
From: WeiqiW <coolhaoyt@gmail.com>
X-Google-Original-From: WeiqiW <lukewang19@outlook.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>,
	WeiqiW <lukewang19@outlook.com>
Subject: [PATCH] xen/argo: make the ring copy length check overflow-safe
Date: Sat, 10 Oct 2026 14:28:45 +0100
Message-ID: <20261010132845.36208-1-lukewang19@outlook.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1791638929-C28C9B50-714926AA/0/0
X-purgate-type: clean
X-purgate-size: 1328

From: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>

memcpy_to_guest_ring() bounds the copy against the ring size with

    if ( len + offset > XEN_ARGO_MAX_RING_SIZE )

where len and offset are unsigned int.  offset is masked below PAGE_SIZE
just above, but a len close to UINT_MAX makes len + offset wrap below
XEN_ARGO_MAX_RING_SIZE and pass the check.  The head_len computation in
the loop wraps the same way, so the copy length is no longer bounded.

All current callers bound len via iov_count(), so this is not reachable
in practice.  Do not rely on that: bound len first, then compare offset
against the room that is left.

No functional change for in-range inputs.

Signed-off-by: WeiqiW <lukewang19@outlook.com>
---
 xen/common/argo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 0b9a54db36..b308ee8311 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -568,7 +568,8 @@ memcpy_to_guest_ring(const struct domain *d, struct argo_ring_info *ring_info,
 
     offset &= ~PAGE_MASK;
 
-    if ( len + offset > XEN_ARGO_MAX_RING_SIZE )
+    if ( len > XEN_ARGO_MAX_RING_SIZE ||
+         offset > XEN_ARGO_MAX_RING_SIZE - len )
         return -EFAULT;
 
     while ( len )
-- 
2.50.1 (Apple Git-155)


