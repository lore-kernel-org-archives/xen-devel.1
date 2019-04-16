Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5755C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 21:52:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A273920821
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 21:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSqftPmu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A273920821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGVzH-0006Y0-Ch; Tue, 16 Apr 2019 21:51:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGVzG-0006Xv-Ch
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 21:51:30 +0000
X-Inumbo-ID: c9efccd8-6091-11e9-b6cd-bbfb60544fe2
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9efccd8-6091-11e9-b6cd-bbfb60544fe2;
 Tue, 16 Apr 2019 21:51:29 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE68920821;
 Tue, 16 Apr 2019 21:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555451488;
 bh=ntB14T52Tftbc/bc22OJ+mrhM43QPVeWwi5ZXGTRX50=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=SSqftPmueoCbqa+OyUIAW4swflb7r4Yhizu30XAm46A/BtzljDM0wMVyVrkRsX9Tv
 DSZl6XizA0dIEXaL0MFtEewKt5nlu1YqvoJdzd+S7Y8WGtnvw7cr0RGzQNXJrjRgHN
 4cGJEmbxNOfHEn47qQH0X53tw6J2z8oqrqonqgYo=
Date: Tue, 16 Apr 2019 14:51:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190128155909.14289-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904161444520.1370@sstabellini-ThinkPad-X260>
References: <20190128155909.14289-1-julien.grall@arm.com>
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
 sstabellini@kernel.org, andrii.anisov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416215127.72wimeGWbbu8I8NTJjKk98Dgh7oDNWyyc3EJqi9afoU@z>

T24gTW9uLCAyOCBKYW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdoaWxlIFNQSXMgYXJl
IHNoYXJlZCBiZXR3ZWVuIENQVSwgaXQgaXMgbm90IHBvc3NpYmxlIHRvIHJlY2VpdmUgdGhlCj4g
c2FtZSBpbnRlcnJ1cHRzIG9uIGEgZGlmZmVyZW50IENQVSB3aGlsZSB0aGUgaW50ZXJydXB0IGlz
IGluIGFjdGl2ZQo+IHN0YXRlLiBUaGUgZGVhY3RpdmF0aW9uIG9mIHRoZSBpbnRlcnJ1cHQgaXMg
ZG9uZSBhdCB0aGUgZW5kIG9mIHRoZQo+IGhhbmRsaW5nLgo+IAo+IFRoaXMgbWVhbnMgdGhlIF9J
UlFfUEVORElORyBsb2dpYyBpcyB1bmVjZXNzYXJ5IG9uIEFybSBhcyBhIHNhbWUKPiBpbnRlcnJ1
cHQgY2FuIG5ldmVyIGNvbWUgdXAgd2hpbGUgaW4gdGhlIGxvb3AuIFNvIHJlbW92ZSBpdCB0bwo+
IHNpbXBsaWZ5IHRoZSBpbnRlcnJ1cHQgaGFuZGxlIGNvZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gvYXJt
L2lycS5jIHwgMzIgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMKPiBpbmRleCBjNTFjZjMz
M2NlLi4zODc3NjU3YTUyIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9pcnEuYwo+ICsrKyBi
L3hlbi9hcmNoL2FybS9pcnEuYwo+IEBAIC0xOTksNiArMTk5LDcgQEAgaW50IHJlcXVlc3RfaXJx
KHVuc2lnbmVkIGludCBpcnEsIHVuc2lnbmVkIGludCBpcnFmbGFncywKPiAgdm9pZCBkb19JUlEo
c3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGludCBpcnEsIGludCBpc19maXEp
Cj4gIHsKPiAgICAgIHN0cnVjdCBpcnFfZGVzYyAqZGVzYyA9IGlycV90b19kZXNjKGlycSk7Cj4g
KyAgICBzdHJ1Y3QgaXJxYWN0aW9uICphY3Rpb247Cj4gIAo+ICAgICAgcGVyZmNfaW5jcihpcnFz
KTsKPiAgCj4gQEAgLTI0MiwzNSArMjQzLDIyIEBAIHZvaWQgZG9fSVJRKHN0cnVjdCBjcHVfdXNl
cl9yZWdzICpyZWdzLCB1bnNpZ25lZCBpbnQgaXJxLCBpbnQgaXNfZmlxKQo+ICAgICAgICAgIGdv
dG8gb3V0X25vX2VuZDsKPiAgICAgIH0KPiAgCj4gLSAgICBzZXRfYml0KF9JUlFfUEVORElORywg
JmRlc2MtPnN0YXR1cyk7Cj4gLQo+IC0gICAgLyoKPiAtICAgICAqIFNpbmNlIHdlIHNldCBQRU5E
SU5HLCBpZiBhbm90aGVyIHByb2Nlc3NvciBpcyBoYW5kbGluZyBhIGRpZmZlcmVudAo+IC0gICAg
ICogaW5zdGFuY2Ugb2YgdGhpcyBzYW1lIGlycSwgdGhlIG90aGVyIHByb2Nlc3NvciB3aWxsIHRh
a2UgY2FyZSBvZiBpdC4KPiAtICAgICAqLwo+IC0gICAgaWYgKCB0ZXN0X2JpdChfSVJRX0RJU0FC
TEVELCAmZGVzYy0+c3RhdHVzKSB8fAo+IC0gICAgICAgICB0ZXN0X2JpdChfSVJRX0lOUFJPR1JF
U1MsICZkZXNjLT5zdGF0dXMpICkKPiArICAgIGlmICggdGVzdF9iaXQoX0lSUV9ESVNBQkxFRCwg
JmRlc2MtPnN0YXR1cykgKQo+ICAgICAgICAgIGdvdG8gb3V0OwoKSXQgaXMgYSBnb29kIGlkZWEg
dG8gcmVtb3ZlIHRoZSBJUlFfUEVORElORyBsb2dpYywgdGhhdCBpcyBPSy4KCgpIb3dldmVyLCBh
cmUgd2Ugc3VyZSB0aGF0IHdlIHdhbnQgdG8gcmVtb3ZlIHRoZSBfSVJRX0lOUFJPR1JFU1MgY2hl
Y2sKdG9vPyBJUlEgaGFuZGxlcnMgc2hvdWxkbid0IGJlIGNhbGxlZCB0d2ljZSBpbiBhIHJvdy4g
R2l2ZW4gdGhhdApfSVJRX0lOUFJPR1JFU1MgY2FuIGJlIHNldCBtYW51YWxseSAoZ2ljdjJfc2V0
X2FjdGl2ZV9zdGF0ZSkgaXQgc2VlbXMgaXQKd291bGQgYmUgYSBnb29kIGlkZWEgdG8ga2VlcCB0
aGUgY2hlY2sgYW55d2F5PwoKCj4gICAgICBzZXRfYml0KF9JUlFfSU5QUk9HUkVTUywgJmRlc2Mt
PnN0YXR1cyk7Cj4gIAo+IC0gICAgd2hpbGUgKCB0ZXN0X2JpdChfSVJRX1BFTkRJTkcsICZkZXNj
LT5zdGF0dXMpICkKPiAtICAgIHsKPiAtICAgICAgICBzdHJ1Y3QgaXJxYWN0aW9uICphY3Rpb247
Cj4gKyAgICBhY3Rpb24gPSBkZXNjLT5hY3Rpb247Cj4gIAo+IC0gICAgICAgIGNsZWFyX2JpdChf
SVJRX1BFTkRJTkcsICZkZXNjLT5zdGF0dXMpOwo+IC0gICAgICAgIGFjdGlvbiA9IGRlc2MtPmFj
dGlvbjsKPiArICAgIHNwaW5fdW5sb2NrX2lycSgmZGVzYy0+bG9jayk7Cj4gIAo+IC0gICAgICAg
IHNwaW5fdW5sb2NrX2lycSgmZGVzYy0+bG9jayk7Cj4gLQo+IC0gICAgICAgIGRvCj4gLSAgICAg
ICAgewo+IC0gICAgICAgICAgICBhY3Rpb24tPmhhbmRsZXIoaXJxLCBhY3Rpb24tPmRldl9pZCwg
cmVncyk7Cj4gLSAgICAgICAgICAgIGFjdGlvbiA9IGFjdGlvbi0+bmV4dDsKPiAtICAgICAgICB9
IHdoaWxlICggYWN0aW9uICk7Cj4gKyAgICBkbwo+ICsgICAgewo+ICsgICAgICAgIGFjdGlvbi0+
aGFuZGxlcihpcnEsIGFjdGlvbi0+ZGV2X2lkLCByZWdzKTsKPiArICAgICAgICBhY3Rpb24gPSBh
Y3Rpb24tPm5leHQ7Cj4gKyAgICB9IHdoaWxlICggYWN0aW9uICk7Cj4gIAo+IC0gICAgICAgIHNw
aW5fbG9ja19pcnEoJmRlc2MtPmxvY2spOwo+IC0gICAgfQo+ICsgICAgc3Bpbl9sb2NrX2lycSgm
ZGVzYy0+bG9jayk7Cj4gIAo+ICAgICAgY2xlYXJfYml0KF9JUlFfSU5QUk9HUkVTUywgJmRlc2Mt
PnN0YXR1cyk7Cj4gIAo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
