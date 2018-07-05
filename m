From: Adrian Pop <apop@bitdefender.com>
Subject: Re: [PATCH v2 1/2] x86/mem_access: Add a helper
 function for memaccess conversion
Date: Fri, 6 Jul 2018 00:07:12 +0300
Message-ID: <20180705210711.GA5520@hel>
References: <20180705104445.8048-1-apop@bitdefender.com>
 <20180705104445.8048-2-apop@bitdefender.com>
 <CABfawhkgELLq-zJyGNJBMc_BF5kmA0HU5QthjT8LuF9Wx57qXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ccth=jv=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fbBT8-0006zr-Mk
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 21:07:14 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id C1BA3301AB44
 for <xen-devel@lists.xenproject.org>; Fri,  6 Jul 2018 01:23:24 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id C93397FBD9
 for <xen-devel@lists.xenproject.org>; Fri,  6 Jul 2018 00:07:12 +0300 (EEST)
Content-Disposition: inline
In-Reply-To: <CABfawhkgELLq-zJyGNJBMc_BF5kmA0HU5QthjT8LuF9Wx57qXQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgMDUsIDIwMTggYXQgMTA6NTM6MjJBTSAtMDYwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIFRodSwgSnVsIDUsIDIwMTggYXQgNDo0NCBBTSBBZHJpYW4gUG9wIDxhcG9w
QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4gPiBAQCAtNzIsMTEgKzgzLDcgQEAgc3RhdGljIGlu
dCBfcDJtX2dldF9tZW1fYWNjZXNzKHN0cnVjdCBwMm1fZG9tYWluICpwMm0sIGdmbl90IGdmbiwK
PiA+ICAgICAgaWYgKCBtZm5fZXEobWZuLCBJTlZBTElEX01GTikgKQo+ID4gICAgICAgICAgcmV0
dXJuIC1FU1JDSDsKPiA+Cj4gPiAtICAgIGlmICggKHVuc2lnbmVkIGludClhID49IEFSUkFZX1NJ
WkUobWVtYWNjZXNzKSApCj4gPiAtICAgICAgICByZXR1cm4gLUVSQU5HRTsKPiA+IC0KPiA+IC0g
ICAgKmFjY2VzcyA9ICBtZW1hY2Nlc3NbYV07Cj4gPiAtICAgIHJldHVybiAwOwo+ID4gKyAgICBy
ZXR1cm4gYWNjZXNzX3RvX3hlbm1lbV9hY2Nlc3MocDJtLCBhLCBhY2Nlc3MpOwo+IAo+IFNob3Vs
ZG4ndCB0aGlzIGJlIHAybV9hY2Nlc3NfdG9feGVubWVtX2FjY2Vzcz8gRGlkIHlvdSBjb21waWxl
IGNoZWNrCj4gdGhpcyBwYXRjaCBiZWZvcmUgc2VuZGluZz8KCk9oLCB0aGF0J3MgcmlnaHQhICBJ
dCBzZWVtcyBJJ3ZlIG1pc3Rha2VubHkgdXNlZCBhbiBpbnRlcm1lZGlhcnkgdmVyc2lvbgpvZiB0
aGUgcGF0Y2ggd2hlbiB0ZXN0aW5nIHVuZm9ydHVuYXRlbHkuCgpUaGFuayB5b3UhCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
