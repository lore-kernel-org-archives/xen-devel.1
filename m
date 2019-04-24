From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1] x86/mm: Make change_type_range return
 error
Date: Wed, 24 Apr 2019 17:59:06 +0300
Message-ID: <a7e91022-7ca0-594b-cb07-3ac517f98f2a@bitdefender.com>
References: <20190424142718.14721-1-aisaila@bitdefender.com>
 <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ea5E=S2=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hJJMp-000585-1Q
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 14:59:23 +0000
In-Reply-To: <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Cc: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yNC8xOSA1OjQ2IFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFdlZCwgQXBy
IDI0LCAyMDE5IGF0IDAyOjI3OjMyUE0gKzAwMDAsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdy
b3RlOgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5jIGIveGVuL2FyY2gveDg2
L21tL3AybS5jCj4+IGluZGV4IDllODFhMzBjYzQuLjI3Njk3ZDVhNzcgMTAwNjQ0Cj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPj4g
QEAgLTEwMjgsNyArMTAyOCw3IEBAIGludCBwMm1fY2hhbmdlX3R5cGVfb25lKHN0cnVjdCBkb21h
aW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2ZuX2wsCj4+ICAgfQo+PiAgIAo+PiAgIC8qIE1vZGlmeSB0
aGUgcDJtIHR5cGUgb2YgW3N0YXJ0LCBlbmRfZXhjbHVzaXZlKSBmcm9tIG90IHRvIG50LiAqLwo+
PiAtc3RhdGljIHZvaWQgY2hhbmdlX3R5cGVfcmFuZ2Uoc3RydWN0IHAybV9kb21haW4gKnAybSwK
Pj4gK3N0YXRpYyBpbnQgY2hhbmdlX3R5cGVfcmFuZ2Uoc3RydWN0IHAybV9kb21haW4gKnAybSwK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCB1
bnNpZ25lZCBsb25nIGVuZF9leGNsdXNpdmUsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcDJtX3R5cGVfdCBvdCwgcDJtX3R5cGVfdCBudCkKPj4gICB7Cj4+IEBAIC0xMDUzLDE1
ICsxMDUzLDExIEBAIHN0YXRpYyB2b2lkIGNoYW5nZV90eXBlX3JhbmdlKHN0cnVjdCBwMm1fZG9t
YWluICpwMm0sCj4+ICAgICAgICAqIFRoaXMgc2hvdWxkIGJlIHJldmlzaXRlZCBsYXRlciwgYnV0
IGZvciBub3cgcG9zdCBhIHdhcm5pbmcuCj4+ICAgICAgICAqLwo+PiAgICAgICBpZiAoIHVubGlr
ZWx5KGVuZCA+IGhvc3RfbWF4X3BmbikgKQo+PiAtICAgIHsKPj4gLSAgICAgICAgcHJpbnRrKFhF
TkxPR19HX1dBUk5JTkcgIkRvbSVkIGxvZ2RpcnR5IHJhbmdlc2V0IGNsaXBwZWQgdG8gbWF4X21h
cHBlZF9wZm5cbiIsCj4+IC0gICAgICAgICAgICAgICBkLT5kb21haW5faWQpOwo+PiAtICAgICAg
ICBlbmQgPSBpbnZhbGlkYXRlX2VuZCA9IGhvc3RfbWF4X3BmbjsKPj4gLSAgICB9Cj4+ICsgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+PiAgIAo+PiAgICAgICAvKiBJZiB0aGUgcmVxdWVzdGVkIHJh
bmdlIGlzIG91dCBvZiBzY29wZSwgcmV0dXJuIGRvaW5nIG5vdGhpbmcuICovCj4+ICAgICAgIGlm
ICggc3RhcnQgPiBlbmQgKQo+PiAtICAgICAgICByZXR1cm47Cj4+ICsgICAgICAgIHJldHVybiAw
Owo+IAo+IFNpbmNlIHlvdSBhcmUgYWxyZWFkeSBjaGFuZ2luZyB0aGUgYmVoYXZpb3Igb2YgdGhl
IGZ1bmN0aW9uIGFib3ZlIHRoaXMKPiBzaG91bGQgYWxzbyByZXR1cm4gRUlOVkFMIElNTy4KCk15
IGZhdWx0LCBJIHN1Z2dlc3RlZCAwIHRoZXJlLiA6KQoKClRoYW5rcywKUmF6dmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
