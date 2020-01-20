Return-Path: <SRS0=qyBi=3J=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661ACC33CA1
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jan 2020 07:31:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F8D20684
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jan 2020 07:31:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zededa.com header.i=@zededa.com header.b="f3oVlnvb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04F8D20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zededa.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itRWR-0008Of-PE; Mon, 20 Jan 2020 07:30:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cmFT=3J=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1itRWQ-0008Oa-Aw
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 07:30:54 +0000
X-Inumbo-ID: ca647a9c-3b56-11ea-9fd7-bc764e2007e4
Received: from mail-qk1-x72b.google.com (unknown [2607:f8b0:4864:20::72b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca647a9c-3b56-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 07:30:53 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id z76so29221484qka.2
 for <xen-devel@lists.xenproject.org>; Sun, 19 Jan 2020 23:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=aU6luC3TxWAZmQ6eQXqYe/N0qzJLAAXjLi3vVbQpDWA=;
 b=f3oVlnvbSZmhm/z8ZR03HnGJoF7dPZ7qvkN7ScB5oz+AYI1UbrJBbomTwPiLLr+UBe
 +5tIDKl+h3LJTCqDBRl2R3OC5nBBAVNeLx+7lhCOBmpFABaxN315ih9BIm0caGSwVNKm
 AlbbTvELC4QYTJww//UpdDI/4Udah6VlJZ2sElR6W5lW+3xvzdfG+YoOrhwLD4g0nPXt
 d/lKjeiH7GJ2t9J0q5DROvuPx9ifKsEin37QtfZHhmHBbBcUZjuWGZ2rOBedsKBkIlK4
 /RRpbMxChwDX8xFTtZLiOR+TbNiD77uyx2fnOsfQqp/l/u+fT1PGDHwWw9UNlelSjel8
 O/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aU6luC3TxWAZmQ6eQXqYe/N0qzJLAAXjLi3vVbQpDWA=;
 b=MM/jWlZmpma0gsZXXCXkN1EnZYuHy9s9LZFsv4CpHcjOq6CqigmyslJOVZVKZ3eYyv
 pgcHETvuNRy9EE5R10wNuYGmBXtj7rHxTTxjA6991qr7QLIgsmAUeGQDvTg9BTSOAOrL
 fTEgvLCYeB/h0GxBzNfMdG/wS9iJXwOI0sABJ7AoPslRYrOdUPdepf4M1T8F2S3u1NHT
 R0xoHyhSGJ1U15skJoFs2I7Yv7xA2scqhi1yCUG8NqklwtlTVzhpXzso3fg0ZS9WXY3b
 4YImqutG4iWiPVWgxQgknpTxEA5hY5l7F4p+L2SEsAQBLjw8bcxBQcwMzbYQhXIKzBl7
 m12g==
X-Gm-Message-State: APjAAAVKkwXF8CJFwByB/QRMmk+p99F/+DJlpK1gOWEX3QAs0maYJf8M
 CVWE4D/4MH5Yt3sjUNkrV+0mFxUTeP4pr2iXrVTeMKSrYKc=
X-Google-Smtp-Source: APXvYqzp1nEr0tWwinxGR6P36ARMhzI7abzuhJJPXTHeoFhCMSa5DFQvyNex+iVn5YyZhTE4iMbSOHNtdlSLuiWLhKk=
X-Received: by 2002:a37:c57:: with SMTP id 84mr50199124qkm.157.1579505453104; 
 Sun, 19 Jan 2020 23:30:53 -0800 (PST)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Sun, 19 Jan 2020 23:30:42 -0800
Message-ID: <CAMmSBy8d1EGVeNLis-RJqBogihiY3T=4poxfLyF_s2PG89yGNQ@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] PVH PCI passthrough for DomUs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkhCgpJJ3ZlIGp1c3QgdHJpZWQgdGhpcyB3aXRoIFhlbiA0LjEzLjAgYW5kIGl0IHNlZW1zIGxp
a2UgdGhhdCBpcyBzdGlsbApub3Qgc3VwcG9ydGVkLgoKVGhpcyBtYWtlcyBtZSBjdXJpb3VzIGlm
IGFueWJvZHkgaXMgd29ya2luZyBvbiB0aGlzIGFuZCB3aGV0aGVyCnRoZXJlJ3MgYW55dGhpbmcg
d2UgY2FuIGRvIHRvIGhlbHAgYWNjZWxlcmF0ZSB0aGUgZWZmb3J0LgoKVGhhbmtzLApSb21hbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
