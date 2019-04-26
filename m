Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0957DC43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 23:48:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C720C206C1
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 23:48:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYgJV1kk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C720C206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hKAZC-0000Ae-Hc; Fri, 26 Apr 2019 23:47:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TNlC=S4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hKAZB-0000AZ-72
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 23:47:41 +0000
X-Inumbo-ID: ad25f4b6-687d-11e9-843c-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ad25f4b6-687d-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 23:47:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3355206C1;
 Fri, 26 Apr 2019 23:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556322459;
 bh=/SAsrAHqFj93JVM2CczH6sIWz+nsR/2i/XVzlwflGic=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=qYgJV1kkB9DJlW14W+TMc+ukVHYjMg49MTAJKvPmFsR9kXfISvVaUg3iRz8d6+ogq
 3gx3EnxEJgeUmXySQxLJ6J/i0MvhgfbDitOkc9zJSDl6cT7cyj43u8nzYWBmC84fEP
 BurSGPrs4wU+dNiF9HarUUlc+YV1c5ARtnyy5W2A=
Date: Fri, 26 Apr 2019 16:47:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
Message-ID: <alpine.DEB.2.10.1904261621360.24598@sstabellini-ThinkPad-X260>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
 <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
 <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
 <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: skip first page when RAM starts at
 0x0
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, 206497@studenti.unimore.it,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426234738.c1t-QIlX8cUbLIiwHOWSZZo_FebMQ6uWwe2E5-Das84@z>

T24gRnJpLCAyNiBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDQvMjYvMTkgNDo0
OCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+ID4gPiBPbiAyNi4wNC4xOSBhdCAxNzozOCwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPiA+ID4gT24gMjYvMDQvMjAxOSAxMDo0Miwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gMjYuMDQuMTkgYXQgMTE6MTksIDxK
dWxpZW4uR3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiBTbyBob3cgZG9lcyB0aGUgUERY
IHdvcmsgZm9yIG1lbW9yeSBiZWxvdyA0R0I/IERvIHlvdSBzdGlsbCBjYWxsCj4gPiA+ID4gPiBw
Zm5fdG9fcGR4IG9yIHRob3NlIHBhZ2VzPwo+ID4gPiA+IAo+ID4gPiA+IE9mIGNvdXJzZS4gV2Ug
bWVyZWx5IG5ldmVyIGNvbXByZXNzIGFueSBvZiB0aGUgbG93IDMyIGFkZHJlc3MKPiA+ID4gPiBi
aXRzLCBpLmUuIG91ciBjaG9pY2UgaXMgbGltaXRlZCB0byBhZGRyZXNzIGJpdHMgMzIgLi4uIDUx
Lgo+ID4gPiAKPiA+ID4gQWgsIHRoZSBjb2RlIG1ha2VzIGEgYml0IG1vcmUgc2Vuc2Ugb24gdGhl
IHg4NiBzaWRlLiBJcyB0aGVyZSBhbnkgcmVhc29uCj4gPiA+IHRvCj4gPiA+IGxpbWl0IHRvIGFk
ZHJlc3MgYml0IDMyIC4uIDUxPwo+ID4gCj4gPiBXZWxsLCB0aGVyZSBiZWluZyB2YXJpb3VzIHNw
ZWNpYWwgdGhpbmdzIGltbWVkaWF0ZWx5IGJlbG93IDRHYgo+ID4gdGhlcmUncyBzaW1wbHkgbGl0
dGxlIHBvaW50IGluIHRyeWluZyB0byBzcXVhc2ggYW55IG9mIHRoZSBsb3dlciBiaXRzLgo+ID4g
Cj4gPiA+IEZvciBBcm0sIHdlIGNhbid0IGNvbXByZXNzIGJpdHMgMCAuLi4gMzAgZHVlIHRvIHRo
ZSBidWRkeSBhbGxvY2F0b3IgKHNlZQo+ID4gPiBwZm5fcGR4X2hvbGVfc2V0dXApLiBTbyB3ZSBj
b3VsZCBpZ25vcmUgdGhlIGZpcnN0IDFHQiBvZiBSQU0uCj4gPiAKPiA+IEJpdHMgMCAuLi4gMzAg
d291bGQgYmUgdGhlIGZpcnN0IDJHYiBhZmFpY3QuCj4gCj4gU29ycnkgSSBtZXNzZWQgdXMgbXkg
bWF0aHMuIEkgbWVhbnQgMCAuLi4gMjkgKE1BWF9PUkRFUiA9IDE4KS4KPiAKPiBAU3RlZmFubywg
ZG8geW91IHRoaW5rIHlvdSBjYW4gaGF2ZSBhIGxvb2sgYXQgaXQ/CgpBZnRlciBhbiBleHRlbnNp
dmUgb25saW5lIGRlYnVnZ2luZyBzZXNzaW9uIHdpdGggSnVsaWVuLCB3ZSBmb3VuZCBhIGZpeAp0
byB0aGUgUERYIGNvZGUgdGhhdCBtYWtlcyB0aGUgbWFza3MgYW5kIG5yX3BkeHMgY2FsY3VsYXRp
b24gY29ycmVjdC4KU2VlIHRoZSBhcHBlbmRlZCBwYXRjaCBiZWxvdy4KCk1hc2sgaXMgaW5pdGlh
bGl6ZWQgdG8gMCB0byB0aGUgbGV0IHRoZSBhbGdvcml0aG0gY29tcHV0ZSB0aGUgcmlnaHQgbWFz
awpiYXNlZCBvbiB0aGUgUkFNIGJhbmtzLiBwZHhfaW5pdF9tYXNrIGRvZXNuJ3QgY29wZSB3aXRo
IGEgc3RhcnQgYWRkcmVzcwpvZiAweDAgYmVjYXVzZSBpdCBkb2VzIGBiYXNlX2FkZHIgLSAxJyB3
aGljaCBjYXVzZXMgYSB3cmFwIGFyb3VuZCB3aGVuCmJhc2VfYWRkciBpcyAweDAuIFRoYXQgd29y
a3MgT0sgYXMgZmFyIGFzIEkgY2FuIHRlbGwgYW5kIHRoZSByZXN1bHRpbmcKdmFsdWVzIG9mIGBw
Zm5fcGR4X2JvdHRvbV9tYXNrJywgYHBmbl90b3BfbWFzaycsIGFuZApgcGZuX3BkeF9ob2xlX3No
aWZ0JyBzZWVtcyBjb3JyZWN0ICh0aGV5IG1hdGNoIHRoZSBjYXNlIHdoZXJlIEkgZm9yY2UKcmFt
X3N0YXJ0ID0gUEFHRV9TSVpFKS4KClRoZSBvdGhlciBjaGFuZ2UgdG8gbnJfcGR4cyBpcyBsZXNz
IG9idmlvdXMuIEl0IGlzIGNsZWFyIHRoYXQgbnJfcGR4cyBpcwpjYWxjdWxhdGVkIHdyb25nbHkg
aW4gdGhpcyBjYXNlIChtZW1vcnkgMC0weDgwMDAwMDAwLAoweDgwMDAwMDAwMC0weDg4MDAwMDAw
MCwgcHM9MCwgcGU9MHg4ODAwMDAwMDApOiBucl9wZHhzPTUyNDI4OCB3aGljaCBpcwpoYWxmIHRo
ZSBudW1iZXIgd2UgbmVlZCAodGhlIGNvcnJlY3QgbnVtYmVyIGlzIDEwNDg1NzUpLgoKVGFraW5n
IGEgbGluZSBmcm9tIHRoZSB4ODYgY29kZSB4ZW4vYXJjaC94ODYvc2V0dXAuYzpzZXR1cF9tYXhf
cGR4CihKdWxpZW4ncyBzdWdnZXN0aW9uKToKCiAgbWF4X3BkeCA9IHBmbl90b19wZHgodG9wX3Bh
Z2UgLSAxKSArIDE7CgpJIGNoYW5nZWQgbnJfcGR4cyB0bwogIAogIG5yX3BkeHMgPSBwZm5fdG9f
cGR4KChwZSA+PiBQQUdFX1NISUZUKSAtIDEpICsgMTsKCmFuZCBpdCB3b3Jrcy4gSSB0aGluayB0
aGUgY2hhbmdlIGlzIGNvcnJlY3QgYmVjYXVzZSBsb29raW5nIGF0IHRoZQppbXBsZW1lbnRhdGlv
biBvZiBwZm5fdG9fcGR4IGl0IGlzIGNlcnRhaW5seSBtZWFudCB0byBvcGVyYXRlIG9uIGEgcGZu
Cm1hc2tpbmcgYml0cyBvbiBpdCB0byBjb21wZW5zYXRlIGZvciB0aGUgaG9sZXMuIEl0IGlzIG5v
dCBtZWFudCB0byB3b3JrCm9uIGEgc2l6ZS4KCkphbiwgZG9lcyBpdCBsb29rIGNvcnJlY3QgdG8g
eW91IHRvbz8KCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0v
bW0uYwppbmRleCAwMWFlMmNjLi5mNzExZWVmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0u
YworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtODc0LDggKzg3NCw3IEBAIHZvaWQgX19pbml0
IHNldHVwX3hlbmhlYXBfbWFwcGluZ3ModW5zaWduZWQgbG9uZyBiYXNlX21mbiwKIC8qIE1hcCBh
IGZyYW1lIHRhYmxlIHRvIGNvdmVyIHBoeXNpY2FsIGFkZHJlc3NlcyBwcyB0aHJvdWdoIHBlICov
CiB2b2lkIF9faW5pdCBzZXR1cF9mcmFtZXRhYmxlX21hcHBpbmdzKHBhZGRyX3QgcHMsIHBhZGRy
X3QgcGUpCiB7Ci0gICAgdW5zaWduZWQgbG9uZyBucl9wYWdlcyA9IChwZSAtIHBzKSA+PiBQQUdF
X1NISUZUOwotICAgIHVuc2lnbmVkIGxvbmcgbnJfcGR4cyA9IHBmbl90b19wZHgobnJfcGFnZXMp
OworICAgIHVuc2lnbmVkIGxvbmcgbnJfcGR4cyA9IHBmbl90b19wZHgoKHBlID4+IFBBR0VfU0hJ
RlQpIC0gMSkgKyAxOwogICAgIHVuc2lnbmVkIGxvbmcgZnJhbWV0YWJsZV9zaXplID0gbnJfcGR4
cyAqIHNpemVvZihzdHJ1Y3QgcGFnZV9pbmZvKTsKICAgICBtZm5fdCBiYXNlX21mbjsKICAgICBj
b25zdCB1bnNpZ25lZCBsb25nIG1hcHBpbmdfc2l6ZSA9IGZyYW1ldGFibGVfc2l6ZSA8IE1CKDMy
KSA/IE1CKDIpIDogTUIoMzIpOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94
ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRleCBjY2IwZjE4Li45ZTdkYTQxIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC9hcm0vc2V0dXAuYworKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwpAQCAtNDgyLDcg
KzQ4Miw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3BkeCh2b2lkKQogewogICAgIHBhZGRy
X3QgYmFua19zdGFydCwgYmFua19zaXplLCBiYW5rX2VuZDsKIAotICAgIHU2NCBtYXNrID0gcGR4
X2luaXRfbWFzayhib290aW5mby5tZW0uYmFua1swXS5zdGFydCk7CisgICAgdTY0IG1hc2sgPSAw
OwogICAgIGludCBiYW5rOwogCiAgICAgZm9yICggYmFuayA9IDAgOyBiYW5rIDwgYm9vdGluZm8u
bWVtLm5yX2JhbmtzOyBiYW5rKysgKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
