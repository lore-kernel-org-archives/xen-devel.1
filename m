Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8030EC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:12:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 500CC20675
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKXL9Cwi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 500CC20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGo6X-0000Lx-Fd; Wed, 17 Apr 2019 17:12:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CUiA=ST=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGo6V-0000Lr-Ri
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 17:12:11 +0000
X-Inumbo-ID: efcce18c-6133-11e9-801c-d3884e1e8a48
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efcce18c-6133-11e9-801c-d3884e1e8a48;
 Wed, 17 Apr 2019 17:12:11 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F21CB20675;
 Wed, 17 Apr 2019 17:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555521130;
 bh=5Y2cLsOy7mMZpLqxy+3/rmj7OAP/dt98oMUHFgdtSxM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=oKXL9CwiPOjbHJEeHGOkxIipNe2F+3plV+QJ5kDKzokxSBo7REVBmHFev3mddx+l+
 89y6UE8Fo+koToJSDSVAdCH8q9XsJBn7viZvDvx9tBSIZgFvL8rInca62NK4cGFgI2
 hENQNFfz9XEWjnzhx6ofKz6l7XNQ9j4BVEtyzBsA=
Date: Wed, 17 Apr 2019 10:12:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <1ba05c55-5449-98a9-713b-d932a1f21b4c@arm.com>
Message-ID: <alpine.DEB.2.10.1904171006020.1370@sstabellini-ThinkPad-X260>
References: <20190128155909.14289-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904161444520.1370@sstabellini-ThinkPad-X260>
 <1ba05c55-5449-98a9-713b-d932a1f21b4c@arm.com>
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
Message-ID: <20190417171209.4NbgNYvkIMrL5PRAgvagiXQQQqT50luIijk5ezji_ZI@z>

T24gVHVlLCAxNiBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gNC8xNi8xOSAxMDo1MSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
TW9uLCAyOCBKYW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBXaGlsZSBTUElzIGFy
ZSBzaGFyZWQgYmV0d2VlbiBDUFUsIGl0IGlzIG5vdCBwb3NzaWJsZSB0byByZWNlaXZlIHRoZQo+
ID4gPiBzYW1lIGludGVycnVwdHMgb24gYSBkaWZmZXJlbnQgQ1BVIHdoaWxlIHRoZSBpbnRlcnJ1
cHQgaXMgaW4gYWN0aXZlCj4gPiA+IHN0YXRlLiBUaGUgZGVhY3RpdmF0aW9uIG9mIHRoZSBpbnRl
cnJ1cHQgaXMgZG9uZSBhdCB0aGUgZW5kIG9mIHRoZQo+ID4gPiBoYW5kbGluZy4KPiA+ID4gCj4g
PiA+IFRoaXMgbWVhbnMgdGhlIF9JUlFfUEVORElORyBsb2dpYyBpcyB1bmVjZXNzYXJ5IG9uIEFy
bSBhcyBhIHNhbWUKPiA+ID4gaW50ZXJydXB0IGNhbiBuZXZlciBjb21lIHVwIHdoaWxlIGluIHRo
ZSBsb29wLiBTbyByZW1vdmUgaXQgdG8KPiA+ID4gc2ltcGxpZnkgdGhlIGludGVycnVwdCBoYW5k
bGUgY29kZS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgIHhlbi9hcmNoL2FybS9pcnEuYyB8IDMy
ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9pcnEuYyBiL3hlbi9hcmNoL2FybS9pcnEuYwo+ID4gPiBpbmRleCBj
NTFjZjMzM2NlLi4zODc3NjU3YTUyIDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vaXJx
LmMKPiA+ID4gKysrIGIveGVuL2FyY2gvYXJtL2lycS5jCj4gPiA+IEBAIC0xOTksNiArMTk5LDcg
QEAgaW50IHJlcXVlc3RfaXJxKHVuc2lnbmVkIGludCBpcnEsIHVuc2lnbmVkIGludAo+ID4gPiBp
cnFmbGFncywKPiA+ID4gICB2b2lkIGRvX0lSUShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywg
dW5zaWduZWQgaW50IGlycSwgaW50IGlzX2ZpcSkKPiA+ID4gICB7Cj4gPiA+ICAgICAgIHN0cnVj
dCBpcnFfZGVzYyAqZGVzYyA9IGlycV90b19kZXNjKGlycSk7Cj4gPiA+ICsgICAgc3RydWN0IGly
cWFjdGlvbiAqYWN0aW9uOwo+ID4gPiAgICAgICAgIHBlcmZjX2luY3IoaXJxcyk7Cj4gPiA+ICAg
QEAgLTI0MiwzNSArMjQzLDIyIEBAIHZvaWQgZG9fSVJRKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpy
ZWdzLCB1bnNpZ25lZAo+ID4gPiBpbnQgaXJxLCBpbnQgaXNfZmlxKQo+ID4gPiAgICAgICAgICAg
Z290byBvdXRfbm9fZW5kOwo+ID4gPiAgICAgICB9Cj4gPiA+ICAgLSAgICBzZXRfYml0KF9JUlFf
UEVORElORywgJmRlc2MtPnN0YXR1cyk7Cj4gPiA+IC0KPiA+ID4gLSAgICAvKgo+ID4gPiAtICAg
ICAqIFNpbmNlIHdlIHNldCBQRU5ESU5HLCBpZiBhbm90aGVyIHByb2Nlc3NvciBpcyBoYW5kbGlu
ZyBhIGRpZmZlcmVudAo+ID4gPiAtICAgICAqIGluc3RhbmNlIG9mIHRoaXMgc2FtZSBpcnEsIHRo
ZSBvdGhlciBwcm9jZXNzb3Igd2lsbCB0YWtlIGNhcmUgb2YKPiA+ID4gaXQuCj4gPiA+IC0gICAg
ICovCj4gPiA+IC0gICAgaWYgKCB0ZXN0X2JpdChfSVJRX0RJU0FCTEVELCAmZGVzYy0+c3RhdHVz
KSB8fAo+ID4gPiAtICAgICAgICAgdGVzdF9iaXQoX0lSUV9JTlBST0dSRVNTLCAmZGVzYy0+c3Rh
dHVzKSApCj4gPiA+ICsgICAgaWYgKCB0ZXN0X2JpdChfSVJRX0RJU0FCTEVELCAmZGVzYy0+c3Rh
dHVzKSApCj4gPiA+ICAgICAgICAgICBnb3RvIG91dDsKPiA+IAo+ID4gSXQgaXMgYSBnb29kIGlk
ZWEgdG8gcmVtb3ZlIHRoZSBJUlFfUEVORElORyBsb2dpYywgdGhhdCBpcyBPSy4KPiA+IAo+ID4g
Cj4gPiBIb3dldmVyLCBhcmUgd2Ugc3VyZSB0aGF0IHdlIHdhbnQgdG8gcmVtb3ZlIHRoZSBfSVJR
X0lOUFJPR1JFU1MgY2hlY2sKPiA+IHRvbz8gSVJRIGhhbmRsZXJzIHNob3VsZG4ndCBiZSBjYWxs
ZWQgdHdpY2UgaW4gYSByb3cuIEdpdmVuIHRoYXQKPiA+IF9JUlFfSU5QUk9HUkVTUyBjYW4gYmUg
c2V0IG1hbnVhbGx5IChnaWN2Ml9zZXRfYWN0aXZlX3N0YXRlKSBpdCBzZWVtcyBpdAo+ID4gd291
bGQgYmUgYSBnb29kIGlkZWEgdG8ga2VlcCB0aGUgY2hlY2sgYW55d2F5Pwo+IAo+IHNldF9hY3Rp
dmVfc3RhdGUgaXMgb25seSB1c2VkIGJ5IHRoZSB2R0lDIHRvIHJlcGxpY2F0ZSBzdGF0ZSBmcm9t
IG9mIHRoZQo+IHZpcnR1YWwgaW50ZXJydXB0IHRvIHRoZSBwaHlzaWNhbCBpbnRlcnJ1cHQuIFdl
IGRvbid0IGhhdmUgdGhlIHZpcnR1YWwKPiBpbnRlcnJ1cHQgaW4gdGhpcyBwYXRoIChzZWUgYWJv
dmUpLgo+IAo+IEFueSBvdGhlciB1c2VyIChlLmcgaW50ZXJydXB0cyByb3V0ZWQgdG8gWGVuKSB3
b3VsZCBiZSBwcmV0dHkgYnJva2VuLiBBdCBiZXN0Cj4geW91IHdvdWxkIGJyZWFrIHRoZSBpbnRl
cnJ1cHQgZmxvdy4gQXQgd29yc3QsIHlvdSBtYXkgbmV2ZXIgcmVjZWl2ZSB0aGUKPiBpbnRlcnJ1
cHQgYWdhaW4uCj4gCj4gU28gSSB0aGluayB3ZSBjYW4gZHJvcCBfSVJRX1BST0dSRVNTIGhlcmUu
CgpJIGdhdmUgaXQgYSBjbG9zZSBsb29rLiBZb3UgYXJlIHJpZ2h0LCBpdCBpcyBzYWZlIHRvIHJl
bW92ZSB0aGUKX0lSUV9QUk9HUkVTUyBjaGVjayBoZXJlLgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgpUaGUgdGhpbmcgdGhhdCB3b3Jy
aWVzIG1lIGEgYml0IGlzIHRoYXQgdGVjaG5pY2FsbHkgc2V0X2FjdGl2ZV9zdGF0ZSBpcwpwYXJ0
IG9mIHRoZSBnaWNfaHdfb3BlcmF0aW9ucyBmdW5jdGlvbnMgd2hpY2ggYXJlIG5vdCBuZWNlc3Nh
cmlseSBndWVzdApzcGVjaWZpYzogd2UgaGF2ZW4ndCB3cml0dGVuIGRvd24gYW55d2hlcmUgdGhh
dCBzZXRfYWN0aXZlX3N0YXRlIGNhbm5vdApiZSBjYWxsZWQgcGFzc2luZyBvbmUgb2YgdGhlIHhl
biBpcnFzIGFzIHBhcmFtZXRlci4gSSBhZ3JlZSBpdCB3b3VsZCBiZQpicm9rZW4gdG8gZG8gc28s
IGJ1dCBzdGlsbC4uLiBNYXliZSB3ZSBzaG91bGQgYWRkIGEgY29tbWVudD8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
