Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5360CC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 07:06:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382651.1626144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVha-0004lJ-1B; Wed, 05 Aug 2026 07:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382651.1626144; Wed, 05 Aug 2026 07:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVhZ-0004lC-UP; Wed, 05 Aug 2026 07:06:09 +0000
Received: by outflank-mailman (input) for mailman id 1382651;
 Tue, 04 Aug 2026 21:36:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gyf161023@gmail.com>) id 1wrMnq-0007Ho-H7
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 21:36:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrMno-00A65A-UO
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 23:36:00 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gyf161023@gmail.com>)
 id 6a725b2c-5cb7-0a2a0a5109dd-0a2a4507af30-18
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 23:36:00 +0200
Received: from [209.85.216.41] (helo=mail-pj1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <gyf161023@gmail.com>)
 id 6a725b3f-b4ea-0a2a45070019-d155d829c11a-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 23:36:00 +0200
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-3811f512167so293683a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 14:36:00 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu.
 [128.210.106.74]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31586447d52sm7628775eec.12.2026.08.04.14.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 14:35:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785879358; x=1786484158; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QH2K5FogbEg2Pu5YlCvSeafRigFtD0Kz01lkbZ2ZcwI=;
        b=e3oalOmoaqQ8EzJ8TAiy6yWYzjW3Zg8NowW2Q502DhBk8Z0pHOxJueLingJBTMFNkc
         WQJxqwhm3BJt4ZGN7EX6zlM4A+dx+mS1FNmxOc+77XOxyjWdCAoRv0gEktWXyL34Punq
         Js6uHyPpPgIgnMbSxOyoUl253h2BNwSRKo76bCr3McFKUJGX9EFEahfRrTAyS4+SSZ04
         OcoKUDScsE9lQBBuFjXq+b9Fn4tPKtX/EZeG/VKt4bM9uw5A5xINGi7J+CZqa7NDw9GE
         fL8fIXbK2DPj9EgvCnvF0W0x51o4n7N8gFpuIy31rFct/Ft8muq8UmaP/gUGchkLJTcW
         1jcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785879358; x=1786484158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QH2K5FogbEg2Pu5YlCvSeafRigFtD0Kz01lkbZ2ZcwI=;
        b=pBIpWKgt5qu0tAnEBsE/+BDWdVnbRRQ9ERKT+0ZTIfWnGZ+H6prRWl33ce4TShNqJA
         CYLkYR7EQWcXEboiKQ4olrBVsOtjpqGWLiAkSsC34ybB9WhkmE/HpBZe9o1W0P8+/4AX
         YH7Pf4i+mXOjgFMSpDWWuge5m4Up3f6weme7+UxO8VD4tbFLAn0NZS84UzxVYo5NlKpH
         x4jXO7R+/w8pc/tzbPaWE0q3bieHXg77n05LBrrbnv6AV29M6Cd4CXWWqlHyV5lq8bdM
         Xpe2OANp7klwXWGeX/B8l1zdXJ86R9qJwHTAzozH+bE1U9tVjVQQuL4wN6CZi6NM/mRk
         egig==
X-Forwarded-Encrypted: i=1; AHgh+RoI3+Dc1AwZ40fF2o6+TJ4Pi2rdBIlDWtLI9K3yA+1m9z4Oo+Z6r9K6nJ9+RBfXPOQRoDV8cNcg2iQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuqgDbxqNQBMWbz45oVZ0GZtLEStGcH9uh5A9X0yFzzHNIwU9p
	Eigd1qWlmor22Vo0OP0TvCrOym83TInyngumG+8fD/kOosXNuOdNOcHU
X-Gm-Gg: AR+sD13WEgdRQ0BaWHaEf2nkfhhxgHXztkeJDcF/OMPs2dRsIkWfdLkXcFil6ku2meL
	/SrGpOcOAv/OslNsOEkHIGUwfguvaEQDqiksESJCf0cisYyHWHgr2K3a3VvaAR1APNIy2gpQg/p
	nUMFEM3f3VTquatrjrzDyQEV4RNhSvp3okbg7f58RCXQmqBwb0E+7i2mWmozHRjMOZVgTS3mr07
	edeDz7IDNJSg8/h3uwNo+i5MpyeHo0m0JD1vOUMzZ3H/S1onvcVBuFRb/p1lVXhaD1y2za+wxe4
	LUA7zhWYJHq6JWzhdVecpUB9CnhTrfofYzVPnWhgdo39tthu4urcj+fwQ/9lBeUfYpxWVpf7ycf
	6k0wOnsJRp9XMUCS6WJ+XiOUuyTv+Fn3F9ytVXtYdp3KkW1zgvvzeEeS/fw4uJ7JhEfc1nC2E4D
	Ocyq95UqywJePt1FMtNWhg7W9cOxk299PH1m96ZmLRgFnqCOPqzVeNDnh/CJN4cb9TF4F61/VgH
	P3G6A+aNYEtyaZ4nltiU9qbD6FAZRS3Uz+5wP9Bvpg=
X-Received: by 2002:a05:6a21:50b:b0:3c3:8aa8:6caf with SMTP id adf61e73a8af0-3cb85efb72bmr1956240637.27.1785879358555;
        Tue, 04 Aug 2026 14:35:58 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	v9fs@lists.linux.dev
Cc: Christian Schoenebeck <linux_oss@crudebyte.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] 9p/xen: fix refcount leak in p9_xen_response() on wrong tag
Date: Tue,  4 Aug 2026 21:35:49 +0000
Message-ID: <20260804213550.3409638-1-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1785879360-A72DCAE4-3827DD67/0/0
X-purgate-type: clean
X-purgate-size: 1323

p9_xen_response() looks up the request for an incoming reply with
p9_tag_lookup(), which takes a reference on the returned p9_req_t. When
the tag does not resolve to a request in REQ_STATUS_SENT, the function
warns and continues the loop without dropping that reference, permanently
leaking the p9_req_t and its msize buffers. The reply header, including
the tag, is supplied by the backend, so a malicious or buggy 9P backend
can leak kernel memory on every crafted response.

Drop the reference before continuing, mirroring the equivalent path in
trans_fd.c.

Fixes: f66c72bea129 ("xen/9pfs: receive responses")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
 net/9p/trans_xen.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index f9fb2db7a066..8eea0da8797f 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -203,6 +203,8 @@ static void p9_xen_response(struct work_struct *work)
 		req = p9_tag_lookup(priv->client, h.tag);
 		if (!req || req->status != REQ_STATUS_SENT) {
 			dev_warn(&priv->dev->dev, "Wrong req tag=%x\n", h.tag);
+			if (req)
+				p9_req_put(priv->client, req);
 			cons += h.size;
 			virt_mb();
 			ring->intf->in_cons = cons;
-- 
2.43.0


