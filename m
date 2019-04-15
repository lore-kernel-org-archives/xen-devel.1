Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CBAC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:56:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A0F020854
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:56:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9XA429Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A0F020854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGAW6-0004JY-4Z; Mon, 15 Apr 2019 22:55:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ip/=SR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGAW4-0004JS-V1
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:55:57 +0000
X-Inumbo-ID: a06ecae3-5fd1-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a06ecae3-5fd1-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 22:55:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8A2E20854;
 Mon, 15 Apr 2019 22:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555368925;
 bh=js5bvjA0nzgx2XC9yVTzbOWG3i5fe6edHcYz6nrpovI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=N9XA429Zj8gSNYepsV9rlu5XZ2plyupWHwkuBWe4QVqPayX/ovaK3xgC5Ze6cuB2t
 KfvfAEseR3aeN+vBbV5LWyPONhHDL9x5xlN7FudL+376tqdYy7EUh/XFTeysNWD8en
 ubUREYUwsq+85+7LayAO0rUKZtNQdwitN/xPe/J0=
Date: Mon, 15 Apr 2019 15:55:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190411072000.4306-2-hch@lst.de>
Message-ID: <alpine.DEB.2.10.1904151534390.29275@sstabellini-ThinkPad-X260>
References: <20190411072000.4306-1-hch@lst.de>
 <20190411072000.4306-2-hch@lst.de>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/4] swiotlb-xen: make instances match their
 method names
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

T24gVGh1LCAxMSBBcHIgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSnVzdCBkcm9w
IHR3byBwb2ludGxlc3MgX2F0dHJzIHByZWZpeGVzIHRvIG1ha2UgdGhlIGNvZGUgYSBsaXR0bGUK
PiBtb3JlIGdyZXAtYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8
aGNoQGxzdC5kZT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwgMTcgKysr
KysrKy0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTAgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9k
cml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCj4gaW5kZXggODc3YmFmMmE5NGY0Li5kNGJjM2FhYmQ0
NGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwo+ICsrKyBiL2RyaXZl
cnMveGVuL3N3aW90bGIteGVuLmMKPiBAQCAtNTA0LDkgKzUwNCw4IEBAIHhlbl9zd2lvdGxiX3N5
bmNfc2luZ2xlX2Zvcl9kZXZpY2Uoc3RydWN0IGRldmljZSAqaHdkZXYsIGRtYV9hZGRyX3QgZGV2
X2FkZHIsCj4gICAqIGNvbmNlcm5pbmcgY2FsbHMgaGVyZSBhcmUgdGhlIHNhbWUgYXMgZm9yIHN3
aW90bGJfdW5tYXBfcGFnZSgpIGFib3ZlLgo+ICAgKi8KPiAgc3RhdGljIHZvaWQKPiAteGVuX3N3
aW90bGJfdW5tYXBfc2dfYXR0cnMoc3RydWN0IGRldmljZSAqaHdkZXYsIHN0cnVjdCBzY2F0dGVy
bGlzdCAqc2dsLAo+IC0JCQkgICBpbnQgbmVsZW1zLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBk
aXIsCj4gLQkJCSAgIHVuc2lnbmVkIGxvbmcgYXR0cnMpCj4gK3hlbl9zd2lvdGxiX3VubWFwX3Nn
KHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbCwgaW50IG5lbGVt
cywKPiArCQllbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIsIHVuc2lnbmVkIGxvbmcgYXR0cnMp
Cj4gIHsKPiAgCXN0cnVjdCBzY2F0dGVybGlzdCAqc2c7Cj4gIAlpbnQgaTsKPiBAQCAtNTM1LDkg
KzUzNCw4IEBAIHhlbl9zd2lvdGxiX3VubWFwX3NnX2F0dHJzKHN0cnVjdCBkZXZpY2UgKmh3ZGV2
LCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbCwKPiAgICogc2FtZSBoZXJlLgo+ICAgKi8KPiAgc3Rh
dGljIGludAo+IC14ZW5fc3dpb3RsYl9tYXBfc2dfYXR0cnMoc3RydWN0IGRldmljZSAqaHdkZXYs
IHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLAo+IC0JCQkgaW50IG5lbGVtcywgZW51bSBkbWFfZGF0
YV9kaXJlY3Rpb24gZGlyLAo+IC0JCQkgdW5zaWduZWQgbG9uZyBhdHRycykKPiAreGVuX3N3aW90
bGJfbWFwX3NnKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbCwg
aW50IG5lbGVtcywKPiArCQllbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIsIHVuc2lnbmVkIGxv
bmcgYXR0cnMpCj4gIHsKPiAgCXN0cnVjdCBzY2F0dGVybGlzdCAqc2c7Cj4gIAlpbnQgaTsKPiBA
QCAtNTYyLDggKzU2MCw3IEBAIHhlbl9zd2lvdGxiX21hcF9zZ19hdHRycyhzdHJ1Y3QgZGV2aWNl
ICpod2Rldiwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZ2wsCj4gIAkJCQkvKiBEb24ndCBwYW5pYyBo
ZXJlLCB3ZSBleHBlY3QgbWFwX3NnIHVzZXJzCj4gIAkJCQkgICB0byBkbyBwcm9wZXIgZXJyb3Ig
aGFuZGxpbmcuICovCj4gIAkJCQlhdHRycyB8PSBETUFfQVRUUl9TS0lQX0NQVV9TWU5DOwo+IC0J
CQkJeGVuX3N3aW90bGJfdW5tYXBfc2dfYXR0cnMoaHdkZXYsIHNnbCwgaSwgZGlyLAo+IC0JCQkJ
CQkJICAgYXR0cnMpOwo+ICsJCQkJeGVuX3N3aW90bGJfdW5tYXBfc2coaHdkZXYsIHNnbCwgaSwg
ZGlyLCBhdHRycyk7Cj4gIAkJCQlzZ19kbWFfbGVuKHNnbCkgPSAwOwo+ICAJCQkJcmV0dXJuIDA7
Cj4gIAkJCX0KPiBAQCAtNjkwLDggKzY4Nyw4IEBAIGNvbnN0IHN0cnVjdCBkbWFfbWFwX29wcyB4
ZW5fc3dpb3RsYl9kbWFfb3BzID0gewo+ICAJLnN5bmNfc2luZ2xlX2Zvcl9kZXZpY2UgPSB4ZW5f
c3dpb3RsYl9zeW5jX3NpbmdsZV9mb3JfZGV2aWNlLAo+ICAJLnN5bmNfc2dfZm9yX2NwdSA9IHhl
bl9zd2lvdGxiX3N5bmNfc2dfZm9yX2NwdSwKPiAgCS5zeW5jX3NnX2Zvcl9kZXZpY2UgPSB4ZW5f
c3dpb3RsYl9zeW5jX3NnX2Zvcl9kZXZpY2UsCj4gLQkubWFwX3NnID0geGVuX3N3aW90bGJfbWFw
X3NnX2F0dHJzLAo+IC0JLnVubWFwX3NnID0geGVuX3N3aW90bGJfdW5tYXBfc2dfYXR0cnMsCj4g
KwkubWFwX3NnID0geGVuX3N3aW90bGJfbWFwX3NnLAo+ICsJLnVubWFwX3NnID0geGVuX3N3aW90
bGJfdW5tYXBfc2csCj4gIAkubWFwX3BhZ2UgPSB4ZW5fc3dpb3RsYl9tYXBfcGFnZSwKPiAgCS51
bm1hcF9wYWdlID0geGVuX3N3aW90bGJfdW5tYXBfcGFnZSwKPiAgCS5kbWFfc3VwcG9ydGVkID0g
eGVuX3N3aW90bGJfZG1hX3N1cHBvcnRlZCwKPiAtLSAKPiAyLjIwLjEKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
