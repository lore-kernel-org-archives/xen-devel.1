Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3283C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:56:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0B020854
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:56:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0HoMyMV6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0B020854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGAWi-0004QB-W8; Mon, 15 Apr 2019 22:56:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ip/=SR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGAWi-0004Q2-DE
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:56:36 +0000
X-Inumbo-ID: b7b22f5f-5fd1-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b7b22f5f-5fd1-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 22:56:34 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AF8A20854;
 Mon, 15 Apr 2019 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555368994;
 bh=XrduhxDk0GZhoKcVedRr22IomCdKDgmMJ1c4H6c4fpk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=0HoMyMV66QqD4oh3Es6vlTNRMjrwtkgcL60uHd6U2u+eGxEpX+dauMeEOFDy8Qzeq
 x/86DJgDzmIWrwi6rO3BHMyO0UjqBIkSYzrt990IX/C3MbBw2LHlnQrL9s9ExrGIot
 tLbtSg22Uhe1+5HfJUP4UIKaZort7E+kkoDpDJPc=
Date: Mon, 15 Apr 2019 15:56:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190411072000.4306-5-hch@lst.de>
Message-ID: <alpine.DEB.2.10.1904151552250.29275@sstabellini-ThinkPad-X260>
References: <20190411072000.4306-1-hch@lst.de>
 <20190411072000.4306-5-hch@lst.de>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/4] swiotlb-xen: ensure we have a single
 callsite for xen_dma_map_page
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxMSBBcHIgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gUmVmYWN0b3Ig
dGhlIGNvZGUgYSBiaXQgdG8gbWFrZSBmdXJ0aGVyIGNoYW5nZXMgZWFzaWVyLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgoKUmV2aWV3ZWQtYnk6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCj4gLS0tCj4gIGRyaXZl
cnMveGVuL3N3aW90bGIteGVuLmMgfCAzMSArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMveGVuL3N3
aW90bGIteGVuLmMKPiBpbmRleCA5YTk1MTUwNGRjMTIuLjVkY2IwNmZlOTY2NyAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCj4gKysrIGIvZHJpdmVycy94ZW4vc3dpb3Rs
Yi14ZW4uYwo+IEBAIC0zOTEsMTMgKzM5MSw4IEBAIHN0YXRpYyBkbWFfYWRkcl90IHhlbl9zd2lv
dGxiX21hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gIAlp
ZiAoZG1hX2NhcGFibGUoZGV2LCBkZXZfYWRkciwgc2l6ZSkgJiYKPiAgCSAgICAhcmFuZ2Vfc3Ry
YWRkbGVzX3BhZ2VfYm91bmRhcnkocGh5cywgc2l6ZSkgJiYKPiAgCQkheGVuX2FyY2hfbmVlZF9z
d2lvdGxiKGRldiwgcGh5cywgZGV2X2FkZHIpICYmCj4gLQkJKHN3aW90bGJfZm9yY2UgIT0gU1dJ
T1RMQl9GT1JDRSkpIHsKPiAtCQkvKiB3ZSBhcmUgbm90IGludGVyZXN0ZWQgaW4gdGhlIGRtYV9h
ZGRyIHJldHVybmVkIGJ5Cj4gLQkJICogeGVuX2RtYV9tYXBfcGFnZSwgb25seSBpbiB0aGUgcG90
ZW50aWFsIGNhY2hlIGZsdXNoZXMgZXhlY3V0ZWQKPiAtCQkgKiBieSB0aGUgZnVuY3Rpb24uICov
Cj4gLQkJeGVuX2RtYV9tYXBfcGFnZShkZXYsIHBhZ2UsIGRldl9hZGRyLCBvZmZzZXQsIHNpemUs
IGRpciwgYXR0cnMpOwo+IC0JCXJldHVybiBkZXZfYWRkcjsKPiAtCX0KPiArCQlzd2lvdGxiX2Zv
cmNlICE9IFNXSU9UTEJfRk9SQ0UpCj4gKwkJZ290byBkb25lOwo+ICAKPiAgCS8qCj4gIAkgKiBP
aCB3ZWxsLCBoYXZlIHRvIGFsbG9jYXRlIGFuZCBtYXAgYSBib3VuY2UgYnVmZmVyLgo+IEBAIC00
MTAsMTkgKzQwNSwyNSBAQCBzdGF0aWMgZG1hX2FkZHJfdCB4ZW5fc3dpb3RsYl9tYXBfcGFnZShz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwYWdlICpwYWdlLAo+ICAJCXJldHVybiBETUFfTUFQ
UElOR19FUlJPUjsKPiAgCj4gIAlkZXZfYWRkciA9IHhlbl9waHlzX3RvX2J1cyhtYXApOwo+IC0J
eGVuX2RtYV9tYXBfcGFnZShkZXYsIHBmbl90b19wYWdlKG1hcCA+PiBQQUdFX1NISUZUKSwKPiAt
CQkJCQlkZXZfYWRkciwgbWFwICYgflBBR0VfTUFTSywgc2l6ZSwgZGlyLCBhdHRycyk7Cj4gIAo+
ICAJLyoKPiAgCSAqIEVuc3VyZSB0aGF0IHRoZSBhZGRyZXNzIHJldHVybmVkIGlzIERNQSdibGUK
PiAgCSAqLwo+IC0JaWYgKGRtYV9jYXBhYmxlKGRldiwgZGV2X2FkZHIsIHNpemUpKQo+IC0JCXJl
dHVybiBkZXZfYWRkcjsKPiAtCj4gLQlhdHRycyB8PSBETUFfQVRUUl9TS0lQX0NQVV9TWU5DOwo+
IC0Jc3dpb3RsYl90YmxfdW5tYXBfc2luZ2xlKGRldiwgbWFwLCBzaXplLCBkaXIsIGF0dHJzKTsK
PiArCWlmICh1bmxpa2VseSghZG1hX2NhcGFibGUoZGV2LCBkZXZfYWRkciwgc2l6ZSkpKSB7Cj4g
KwkJc3dpb3RsYl90YmxfdW5tYXBfc2luZ2xlKGRldiwgbWFwLCBzaXplLCBkaXIsCj4gKwkJCQlh
dHRycyB8IERNQV9BVFRSX1NLSVBfQ1BVX1NZTkMpOwo+ICsJCXJldHVybiBETUFfTUFQUElOR19F
UlJPUjsKPiArCX0KPiAgCj4gLQlyZXR1cm4gRE1BX01BUFBJTkdfRVJST1I7Cj4gKwlwYWdlID0g
cGZuX3RvX3BhZ2UobWFwID4+IFBBR0VfU0hJRlQpOwo+ICsJb2Zmc2V0ID0gbWFwICYgflBBR0Vf
TUFTSzsKPiArZG9uZToKPiArCS8qCj4gKwkgKiB3ZSBhcmUgbm90IGludGVyZXN0ZWQgaW4gdGhl
IGRtYV9hZGRyIHJldHVybmVkIGJ5IHhlbl9kbWFfbWFwX3BhZ2UsCj4gKwkgKiBvbmx5IGluIHRo
ZSBwb3RlbnRpYWwgY2FjaGUgZmx1c2hlcyBleGVjdXRlZCBieSB0aGUgZnVuY3Rpb24uCj4gKwkg
Ki8KPiArCXhlbl9kbWFfbWFwX3BhZ2UoZGV2LCBwYWdlLCBkZXZfYWRkciwgb2Zmc2V0LCBzaXpl
LCBkaXIsIGF0dHJzKTsKPiArCXJldHVybiBkZXZfYWRkcjsKPiAgfQo+ICAKPiAgLyoKPiAtLSAK
PiAyLjIwLjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
