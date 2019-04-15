Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A78FC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:56:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED38E20854
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:56:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSgkCO7F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED38E20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGAWI-0004KH-D9; Mon, 15 Apr 2019 22:56:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ip/=SR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGAWH-0004K3-1t
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:56:09 +0000
X-Inumbo-ID: a79fdad4-5fd1-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a79fdad4-5fd1-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 22:56:08 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1030F2087C;
 Mon, 15 Apr 2019 22:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555368937;
 bh=wd++nzgpTjuECfi4PcRnKRD0dHn5ZSS5FTtK6yRHUTc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=MSgkCO7Fbs2eWk0sONlRkgV5068QHb+BsUWwrH7fZDmNPN7+PfbEuijU7R8Akj5Lg
 Vp8TnFBotGATv3q/KG/ewBmw6DtDDFkgBlyppAXPWjl6q/6oWOMgV/eWPgImxEmyO3
 AtYLBpPyrHlqmnG1RWcLK58cheDsd5b0crlScxmE=
Date: Mon, 15 Apr 2019 15:55:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190411072000.4306-3-hch@lst.de>
Message-ID: <alpine.DEB.2.10.1904151541370.29275@sstabellini-ThinkPad-X260>
References: <20190411072000.4306-1-hch@lst.de>
 <20190411072000.4306-3-hch@lst.de>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/4] swiotlb-xen: use ->map_page to
 implement ->map_sg
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

T24gVGh1LCAxMSBBcHIgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gV2UgY2FuIHNp
bXBseSBsb29wIG92ZXIgdGhlIHNlZ21lbnRzIGFuZCBtYXAgdGhlbSwgcmVtb3ZpbmcgbG90cyBv
Zgo+IGR1cGxpY2F0ZSBjb2RlLgoKUmlnaHQsIHRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgdGhlIGFk
ZGl0aW9uYWwgZG1hX2NhcGFibGUgY2hlY2sgd2hpY2ggaXMKZ29vZCB0byBoYXZlLgoKUmV2aWV3
ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBkcml2
ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwgNjggKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1OCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZl
cnMveGVuL3N3aW90bGIteGVuLmMKPiBpbmRleCBkNGJjM2FhYmQ0NGQuLjk3YTU1YzIyNTU5MyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCj4gKysrIGIvZHJpdmVycy94
ZW4vc3dpb3RsYi14ZW4uYwo+IEBAIC01MTcsMjQgKzUxNyw4IEBAIHhlbl9zd2lvdGxiX3VubWFw
X3NnKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbCwgaW50IG5l
bGVtcywKPiAgCj4gIH0KPiAgCj4gLS8qCj4gLSAqIE1hcCBhIHNldCBvZiBidWZmZXJzIGRlc2Ny
aWJlZCBieSBzY2F0dGVybGlzdCBpbiBzdHJlYW1pbmcgbW9kZSBmb3IgRE1BLgo+IC0gKiBUaGlz
IGlzIHRoZSBzY2F0dGVyLWdhdGhlciB2ZXJzaW9uIG9mIHRoZSBhYm92ZSB4ZW5fc3dpb3RsYl9t
YXBfcGFnZQo+IC0gKiBpbnRlcmZhY2UuICBIZXJlIHRoZSBzY2F0dGVyIGdhdGhlciBsaXN0IGVs
ZW1lbnRzIGFyZSBlYWNoIHRhZ2dlZCB3aXRoIHRoZQo+IC0gKiBhcHByb3ByaWF0ZSBkbWEgYWRk
cmVzcyBhbmQgbGVuZ3RoLiAgVGhleSBhcmUgb2J0YWluZWQgdmlhCj4gLSAqIHNnX2RtYV97YWRk
cmVzcyxsZW5ndGh9KFNHKS4KPiAtICoKPiAtICogTk9URTogQW4gaW1wbGVtZW50YXRpb24gbWF5
IGJlIGFibGUgdG8gdXNlIGEgc21hbGxlciBudW1iZXIgb2YKPiAtICogICAgICAgRE1BIGFkZHJl
c3MvbGVuZ3RoIHBhaXJzIHRoYW4gdGhlcmUgYXJlIFNHIHRhYmxlIGVsZW1lbnRzLgo+IC0gKiAg
ICAgICAoZm9yIGV4YW1wbGUgdmlhIHZpcnR1YWwgbWFwcGluZyBjYXBhYmlsaXRpZXMpCj4gLSAq
ICAgICAgIFRoZSByb3V0aW5lIHJldHVybnMgdGhlIG51bWJlciBvZiBhZGRyL2xlbmd0aCBwYWly
cyBhY3R1YWxseQo+IC0gKiAgICAgICB1c2VkLCBhdCBtb3N0IG5lbnRzLgo+IC0gKgo+IC0gKiBE
ZXZpY2Ugb3duZXJzaGlwIGlzc3VlcyBhcyBtZW50aW9uZWQgYWJvdmUgZm9yIHhlbl9zd2lvdGxi
X21hcF9wYWdlIGFyZSB0aGUKPiAtICogc2FtZSBoZXJlLgo+IC0gKi8KPiAgc3RhdGljIGludAo+
IC14ZW5fc3dpb3RsYl9tYXBfc2coc3RydWN0IGRldmljZSAqaHdkZXYsIHN0cnVjdCBzY2F0dGVy
bGlzdCAqc2dsLCBpbnQgbmVsZW1zLAo+ICt4ZW5fc3dpb3RsYl9tYXBfc2coc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbCwgaW50IG5lbGVtcywKPiAgCQllbnVtIGRt
YV9kYXRhX2RpcmVjdGlvbiBkaXIsIHVuc2lnbmVkIGxvbmcgYXR0cnMpCj4gIHsKPiAgCXN0cnVj
dCBzY2F0dGVybGlzdCAqc2c7Cj4gQEAgLTU0Myw1MCArNTI3LDE4IEBAIHhlbl9zd2lvdGxiX21h
cF9zZyhzdHJ1Y3QgZGV2aWNlICpod2Rldiwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZ2wsIGludCBu
ZWxlbXMsCj4gIAlCVUdfT04oZGlyID09IERNQV9OT05FKTsKPiAgCj4gIAlmb3JfZWFjaF9zZyhz
Z2wsIHNnLCBuZWxlbXMsIGkpIHsKPiAtCQlwaHlzX2FkZHJfdCBwYWRkciA9IHNnX3BoeXMoc2cp
Owo+IC0JCWRtYV9hZGRyX3QgZGV2X2FkZHIgPSB4ZW5fcGh5c190b19idXMocGFkZHIpOwo+IC0K
PiAtCQlpZiAoc3dpb3RsYl9mb3JjZSA9PSBTV0lPVExCX0ZPUkNFIHx8Cj4gLQkJICAgIHhlbl9h
cmNoX25lZWRfc3dpb3RsYihod2RldiwgcGFkZHIsIGRldl9hZGRyKSB8fAo+IC0JCSAgICAhZG1h
X2NhcGFibGUoaHdkZXYsIGRldl9hZGRyLCBzZy0+bGVuZ3RoKSB8fAo+IC0JCSAgICByYW5nZV9z
dHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwYWRkciwgc2ctPmxlbmd0aCkpIHsKPiAtCQkJcGh5c19h
ZGRyX3QgbWFwID0gc3dpb3RsYl90YmxfbWFwX3NpbmdsZShod2RldiwKPiAtCQkJCQkJCQkgc3Rh
cnRfZG1hX2FkZHIsCj4gLQkJCQkJCQkJIHNnX3BoeXMoc2cpLAo+IC0JCQkJCQkJCSBzZy0+bGVu
Z3RoLAo+IC0JCQkJCQkJCSBkaXIsIGF0dHJzKTsKPiAtCQkJaWYgKG1hcCA9PSBETUFfTUFQUElO
R19FUlJPUikgewo+IC0JCQkJZGV2X3dhcm4oaHdkZXYsICJzd2lvdGxiIGJ1ZmZlciBpcyBmdWxs
XG4iKTsKPiAtCQkJCS8qIERvbid0IHBhbmljIGhlcmUsIHdlIGV4cGVjdCBtYXBfc2cgdXNlcnMK
PiAtCQkJCSAgIHRvIGRvIHByb3BlciBlcnJvciBoYW5kbGluZy4gKi8KPiAtCQkJCWF0dHJzIHw9
IERNQV9BVFRSX1NLSVBfQ1BVX1NZTkM7Cj4gLQkJCQl4ZW5fc3dpb3RsYl91bm1hcF9zZyhod2Rl
diwgc2dsLCBpLCBkaXIsIGF0dHJzKTsKPiAtCQkJCXNnX2RtYV9sZW4oc2dsKSA9IDA7Cj4gLQkJ
CQlyZXR1cm4gMDsKPiAtCQkJfQo+IC0JCQlkZXZfYWRkciA9IHhlbl9waHlzX3RvX2J1cyhtYXAp
Owo+IC0JCQl4ZW5fZG1hX21hcF9wYWdlKGh3ZGV2LCBwZm5fdG9fcGFnZShtYXAgPj4gUEFHRV9T
SElGVCksCj4gLQkJCQkJCWRldl9hZGRyLAo+IC0JCQkJCQltYXAgJiB+UEFHRV9NQVNLLAo+IC0J
CQkJCQlzZy0+bGVuZ3RoLAo+IC0JCQkJCQlkaXIsCj4gLQkJCQkJCWF0dHJzKTsKPiAtCQkJc2ct
PmRtYV9hZGRyZXNzID0gZGV2X2FkZHI7Cj4gLQkJfSBlbHNlIHsKPiAtCQkJLyogd2UgYXJlIG5v
dCBpbnRlcmVzdGVkIGluIHRoZSBkbWFfYWRkciByZXR1cm5lZCBieQo+IC0JCQkgKiB4ZW5fZG1h
X21hcF9wYWdlLCBvbmx5IGluIHRoZSBwb3RlbnRpYWwgY2FjaGUgZmx1c2hlcyBleGVjdXRlZAo+
IC0JCQkgKiBieSB0aGUgZnVuY3Rpb24uICovCj4gLQkJCXhlbl9kbWFfbWFwX3BhZ2UoaHdkZXYs
IHBmbl90b19wYWdlKHBhZGRyID4+IFBBR0VfU0hJRlQpLAo+IC0JCQkJCQlkZXZfYWRkciwKPiAt
CQkJCQkJcGFkZHIgJiB+UEFHRV9NQVNLLAo+IC0JCQkJCQlzZy0+bGVuZ3RoLAo+IC0JCQkJCQlk
aXIsCj4gLQkJCQkJCWF0dHJzKTsKPiAtCQkJc2ctPmRtYV9hZGRyZXNzID0gZGV2X2FkZHI7Cj4g
LQkJfQo+ICsJCXNnLT5kbWFfYWRkcmVzcyA9IHhlbl9zd2lvdGxiX21hcF9wYWdlKGRldiwgc2df
cGFnZShzZyksCj4gKwkJCQlzZy0+b2Zmc2V0LCBzZy0+bGVuZ3RoLCBkaXIsIGF0dHJzKTsKPiAr
CQlpZiAoc2ctPmRtYV9hZGRyZXNzID09IERNQV9NQVBQSU5HX0VSUk9SKQo+ICsJCQlnb3RvIG91
dF91bm1hcDsKPiAgCQlzZ19kbWFfbGVuKHNnKSA9IHNnLT5sZW5ndGg7Cj4gIAl9Cj4gKwo+ICAJ
cmV0dXJuIG5lbGVtczsKPiArb3V0X3VubWFwOgo+ICsJeGVuX3N3aW90bGJfdW5tYXBfc2coZGV2
LCBzZ2wsIGksIGRpciwgYXR0cnMgfCBETUFfQVRUUl9TS0lQX0NQVV9TWU5DKTsKPiArCXNnX2Rt
YV9sZW4oc2dsKSA9IDA7Cj4gKwlyZXR1cm4gMDsKPiAgfQo+ICAKPiAgLyoKPiAtLSAKPiAyLjIw
LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
