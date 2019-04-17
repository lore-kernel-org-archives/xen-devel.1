Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E522BC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:27:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B109420821
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:27:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUIk6zG2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B109420821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGoLX-0001Qz-Bn; Wed, 17 Apr 2019 17:27:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CUiA=ST=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGoLW-0001Qs-9N
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 17:27:42 +0000
X-Inumbo-ID: 1a1f9db4-6136-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1a1f9db4-6136-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 17:27:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2762C20821;
 Wed, 17 Apr 2019 17:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555522060;
 bh=22+WiGspzfBs/zZwOlonqXseDORzR8t9IO55n+Ka/SA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=hUIk6zG2p6rnCajkm1bQm9c1dZqqaAidXLuhIPMOhEwpiLDiqzNyPKE2qlKDbeWZk
 /y9RuydNGslE9nwFPdmg8XOi2LENJsbQdncutQE7n+JVHnw36HCucHTI+hnVPUnQg0
 M1lexM78QzznCAdvtJvxhE79+e0KTNpEUE43V2EI=
Date: Wed, 17 Apr 2019 10:27:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <d36567cd-7c3e-3921-0355-77c55559d61b@arm.com>
Message-ID: <alpine.DEB.2.10.1904171027290.1370@sstabellini-ThinkPad-X260>
References: <20190128155909.14289-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904161444520.1370@sstabellini-ThinkPad-X260>
 <1ba05c55-5449-98a9-713b-d932a1f21b4c@arm.com>
 <alpine.DEB.2.10.1904171006020.1370@sstabellini-ThinkPad-X260>
 <d36567cd-7c3e-3921-0355-77c55559d61b@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-next] xen/arm: irq: Don't use
 _IRQ_PENDING when handling host interrupt
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
Cc: xen-devel@lists.xenproject.org, andre.przywara@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii.anisov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417172739.Gh-sBQWvHEAeUdh1XcrtQAZX4SPF79yXs5yBX6rROlI@z>

T24gV2VkLCAxNyBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDE3
LzA0LzIwMTkgMTg6MTIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFR1ZSwgMTYg
QXByIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gSGkgU3RlZmFubywKPiA+ID4gCj4g
PiA+IE9uIDQvMTYvMTkgMTA6NTEgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4g
PiBPbiBNb24sIDI4IEphbiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4gPiBXaGls
ZSBTUElzIGFyZSBzaGFyZWQgYmV0d2VlbiBDUFUsIGl0IGlzIG5vdCBwb3NzaWJsZSB0byByZWNl
aXZlIHRoZQo+ID4gPiA+ID4gc2FtZSBpbnRlcnJ1cHRzIG9uIGEgZGlmZmVyZW50IENQVSB3aGls
ZSB0aGUgaW50ZXJydXB0IGlzIGluIGFjdGl2ZQo+ID4gPiA+ID4gc3RhdGUuIFRoZSBkZWFjdGl2
YXRpb24gb2YgdGhlIGludGVycnVwdCBpcyBkb25lIGF0IHRoZSBlbmQgb2YgdGhlCj4gPiA+ID4g
PiBoYW5kbGluZy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhpcyBtZWFucyB0aGUgX0lSUV9QRU5E
SU5HIGxvZ2ljIGlzIHVuZWNlc3Nhcnkgb24gQXJtIGFzIGEgc2FtZQo+ID4gPiA+ID4gaW50ZXJy
dXB0IGNhbiBuZXZlciBjb21lIHVwIHdoaWxlIGluIHRoZSBsb29wLiBTbyByZW1vdmUgaXQgdG8K
PiA+ID4gPiA+IHNpbXBsaWZ5IHRoZSBpbnRlcnJ1cHQgaGFuZGxlIGNvZGUuCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICAgIHhlbi9hcmNoL2FybS9pcnEuYyB8IDMyICsr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gPiAgICAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMKPiA+
ID4gPiA+IGluZGV4IGM1MWNmMzMzY2UuLjM4Nzc2NTdhNTIgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0g
YS94ZW4vYXJjaC9hcm0vaXJxLmMKPiA+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9pcnEuYwo+
ID4gPiA+ID4gQEAgLTE5OSw2ICsxOTksNyBAQCBpbnQgcmVxdWVzdF9pcnEodW5zaWduZWQgaW50
IGlycSwgdW5zaWduZWQgaW50Cj4gPiA+ID4gPiBpcnFmbGFncywKPiA+ID4gPiA+ICAgIHZvaWQg
ZG9fSVJRKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1bnNpZ25lZCBpbnQgaXJxLCBpbnQK
PiA+ID4gPiA+IGlzX2ZpcSkKPiA+ID4gPiA+ICAgIHsKPiA+ID4gPiA+ICAgICAgICBzdHJ1Y3Qg
aXJxX2Rlc2MgKmRlc2MgPSBpcnFfdG9fZGVzYyhpcnEpOwo+ID4gPiA+ID4gKyAgICBzdHJ1Y3Qg
aXJxYWN0aW9uICphY3Rpb247Cj4gPiA+ID4gPiAgICAgICAgICBwZXJmY19pbmNyKGlycXMpOwo+
ID4gPiA+ID4gICAgQEAgLTI0MiwzNSArMjQzLDIyIEBAIHZvaWQgZG9fSVJRKHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzLAo+ID4gPiA+ID4gdW5zaWduZWQKPiA+ID4gPiA+IGludCBpcnEsIGlu
dCBpc19maXEpCj4gPiA+ID4gPiAgICAgICAgICAgIGdvdG8gb3V0X25vX2VuZDsKPiA+ID4gPiA+
ICAgICAgICB9Cj4gPiA+ID4gPiAgICAtICAgIHNldF9iaXQoX0lSUV9QRU5ESU5HLCAmZGVzYy0+
c3RhdHVzKTsKPiA+ID4gPiA+IC0KPiA+ID4gPiA+IC0gICAgLyoKPiA+ID4gPiA+IC0gICAgICog
U2luY2Ugd2Ugc2V0IFBFTkRJTkcsIGlmIGFub3RoZXIgcHJvY2Vzc29yIGlzIGhhbmRsaW5nIGEK
PiA+ID4gPiA+IGRpZmZlcmVudAo+ID4gPiA+ID4gLSAgICAgKiBpbnN0YW5jZSBvZiB0aGlzIHNh
bWUgaXJxLCB0aGUgb3RoZXIgcHJvY2Vzc29yIHdpbGwgdGFrZSBjYXJlCj4gPiA+ID4gPiBvZgo+
ID4gPiA+ID4gaXQuCj4gPiA+ID4gPiAtICAgICAqLwo+ID4gPiA+ID4gLSAgICBpZiAoIHRlc3Rf
Yml0KF9JUlFfRElTQUJMRUQsICZkZXNjLT5zdGF0dXMpIHx8Cj4gPiA+ID4gPiAtICAgICAgICAg
dGVzdF9iaXQoX0lSUV9JTlBST0dSRVNTLCAmZGVzYy0+c3RhdHVzKSApCj4gPiA+ID4gPiArICAg
IGlmICggdGVzdF9iaXQoX0lSUV9ESVNBQkxFRCwgJmRlc2MtPnN0YXR1cykgKQo+ID4gPiA+ID4g
ICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4gPiAKPiA+ID4gPiBJdCBpcyBhIGdvb2QgaWRlYSB0
byByZW1vdmUgdGhlIElSUV9QRU5ESU5HIGxvZ2ljLCB0aGF0IGlzIE9LLgo+ID4gPiA+IAo+ID4g
PiA+IAo+ID4gPiA+IEhvd2V2ZXIsIGFyZSB3ZSBzdXJlIHRoYXQgd2Ugd2FudCB0byByZW1vdmUg
dGhlIF9JUlFfSU5QUk9HUkVTUyBjaGVjawo+ID4gPiA+IHRvbz8gSVJRIGhhbmRsZXJzIHNob3Vs
ZG4ndCBiZSBjYWxsZWQgdHdpY2UgaW4gYSByb3cuIEdpdmVuIHRoYXQKPiA+ID4gPiBfSVJRX0lO
UFJPR1JFU1MgY2FuIGJlIHNldCBtYW51YWxseSAoZ2ljdjJfc2V0X2FjdGl2ZV9zdGF0ZSkgaXQg
c2VlbXMgaXQKPiA+ID4gPiB3b3VsZCBiZSBhIGdvb2QgaWRlYSB0byBrZWVwIHRoZSBjaGVjayBh
bnl3YXk/Cj4gPiA+IAo+ID4gPiBzZXRfYWN0aXZlX3N0YXRlIGlzIG9ubHkgdXNlZCBieSB0aGUg
dkdJQyB0byByZXBsaWNhdGUgc3RhdGUgZnJvbSBvZiB0aGUKPiA+ID4gdmlydHVhbCBpbnRlcnJ1
cHQgdG8gdGhlIHBoeXNpY2FsIGludGVycnVwdC4gV2UgZG9uJ3QgaGF2ZSB0aGUgdmlydHVhbAo+
ID4gPiBpbnRlcnJ1cHQgaW4gdGhpcyBwYXRoIChzZWUgYWJvdmUpLgo+ID4gPiAKPiA+ID4gQW55
IG90aGVyIHVzZXIgKGUuZyBpbnRlcnJ1cHRzIHJvdXRlZCB0byBYZW4pIHdvdWxkIGJlIHByZXR0
eSBicm9rZW4uIEF0Cj4gPiA+IGJlc3QKPiA+ID4geW91IHdvdWxkIGJyZWFrIHRoZSBpbnRlcnJ1
cHQgZmxvdy4gQXQgd29yc3QsIHlvdSBtYXkgbmV2ZXIgcmVjZWl2ZSB0aGUKPiA+ID4gaW50ZXJy
dXB0IGFnYWluLgo+ID4gPiAKPiA+ID4gU28gSSB0aGluayB3ZSBjYW4gZHJvcCBfSVJRX1BST0dS
RVNTIGhlcmUuCj4gPiAKPiA+IEkgZ2F2ZSBpdCBhIGNsb3NlIGxvb2suIFlvdSBhcmUgcmlnaHQs
IGl0IGlzIHNhZmUgdG8gcmVtb3ZlIHRoZQo+ID4gX0lSUV9QUk9HUkVTUyBjaGVjayBoZXJlLgo+
ID4gCj4gPiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgo+ID4gCj4gPiAKPiA+IFRoZSB0aGluZyB0aGF0IHdvcnJpZXMgbWUgYSBiaXQgaXMg
dGhhdCB0ZWNobmljYWxseSBzZXRfYWN0aXZlX3N0YXRlIGlzCj4gPiBwYXJ0IG9mIHRoZSBnaWNf
aHdfb3BlcmF0aW9ucyBmdW5jdGlvbnMgd2hpY2ggYXJlIG5vdCBuZWNlc3NhcmlseSBndWVzdAo+
ID4gc3BlY2lmaWM6IHdlIGhhdmVuJ3Qgd3JpdHRlbiBkb3duIGFueXdoZXJlIHRoYXQgc2V0X2Fj
dGl2ZV9zdGF0ZSBjYW5ub3QKPiA+IGJlIGNhbGxlZCBwYXNzaW5nIG9uZSBvZiB0aGUgeGVuIGly
cXMgYXMgcGFyYW1ldGVyLiBJIGFncmVlIGl0IHdvdWxkIGJlCj4gPiBicm9rZW4gdG8gZG8gc28s
IGJ1dCBzdGlsbC4uLiBNYXliZSB3ZSBzaG91bGQgYWRkIGEgY29tbWVudD8KPiAKPiBIb3cgYWJv
dXQgYWRkaW5nIGFuIEFTU0VSVCh0ZXN0X2JpdChfSVJRX0dVRVNULCAmZGVzYy0+c3RhdHVzKSkg
PwoKZXZlbiBiZXR0ZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
