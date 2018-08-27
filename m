From: Adrian Pop <apop@bitdefender.com>
Subject: Re: [PATCH] x86/altp2m: Allow setting the #VE info page
 for an arbitrary VCPU
Date: Mon, 27 Aug 2018 12:41:16 +0300
Message-ID: <20180827094116.GC1307@hel>
References: <20180725114915.26614-1-apop@bitdefender.com>
 <5B604D9C02000078001D96A6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pdfo=lk=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fuE1O-00080f-Ca
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 09:41:18 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 3BA9C3075039
 for <xen-devel@lists.xenproject.org>; Mon, 27 Aug 2018 12:41:17 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 356D47FE67
 for <xen-devel@lists.xenproject.org>; Mon, 27 Aug 2018 12:41:17 +0300 (EEST)
Content-Disposition: inline
In-Reply-To: <5B604D9C02000078001D96A6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDU6NTM6MDBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPiArICAgIHN0cnVjdCB2Y3B1ICp2Owo+ID4gKwo+ID4gKyAgICBkb20gPSByY3VfbG9j
a19kb21haW5fYnlfaWQoZG9tYWluX2lkKTsKPiA+ICsKPiA+ICsgICAgZm9yX2VhY2hfdmNwdSgg
ZG9tLCB2ICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgaWYgKCB2Y3B1X2lkID09IHYtPnZjcHVf
aWQgKQo+ID4gKyAgICAgICAgewo+ID4gKyAgICAgICAgICAgIHJjdV91bmxvY2tfZG9tYWluKGRv
bSk7Cj4gPiArICAgICAgICAgICAgcmV0dXJuIHY7Cj4gPiArICAgICAgICB9Cj4gPiArICAgIH0K
PiAKPiBmb3JfZWFjaF92Y3B1KCkgbG9va3MgZXhjZXNzaXZlIGhlcmUgLSBhbGwgeW91IG5lZWQg
aXMgYSBib3VuZHMKPiBjaGVjayBhbmQgYW4gYWNjZXNzIGludG8gZC0+dmNwdXNbXS4gVG9nZXRo
ZXIgd2l0aCB0aGUgZmFjdAo+IHRoYXQgeW91ciBjYWxsZXIgaGFzIGFscmVhZHkgaWRlbnRpZmll
ZCBhbmQgbG9ja2VkIGQgSSB3b25kZXIKPiB3aGV0aGVyIHRoaXMgaGVscGVyIGlzIG5lZWRlZCBp
biB0aGUgZmlyc3QgcGxhY2UuCiAKQWxsIHJpZ2h0LiAgSSdsbCByZW1vdmUgaXQgYWx0b2dldGhl
ci4KCj4gPiBAQCAtNDU3NiwyNiArNDU5OSwzMiBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgK
PiA+ICAKPiA+ICAgICAgY2FzZSBIVk1PUF9hbHRwMm1fdmNwdV9lbmFibGVfbm90aWZ5Ogo+ID4g
ICAgICB7Cj4gPiAtICAgICAgICBzdHJ1Y3QgdmNwdSAqY3VyciA9IGN1cnJlbnQ7Cj4gPiArICAg
ICAgICBzdHJ1Y3QgdmNwdSAqdjsKPiA+ICAgICAgICAgIHAybV90eXBlX3QgcDJtdDsKPiA+ICAK
PiA+IC0gICAgICAgIGlmICggYS51LmVuYWJsZV9ub3RpZnkucGFkIHx8IGEuZG9tYWluICE9IERP
TUlEX1NFTEYgfHwKPiA+IC0gICAgICAgICAgICAgYS51LmVuYWJsZV9ub3RpZnkudmNwdV9pZCAh
PSBjdXJyLT52Y3B1X2lkICkKPiA+ICsgICAgICAgIGlmICggYS51LmVuYWJsZV9ub3RpZnkucGFk
ICkKPiA+ICAgICAgICAgIHsKPiA+ICAgICAgICAgICAgICByYyA9IC1FSU5WQUw7Cj4gPiAgICAg
ICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICAgICB9Cj4gPiAgCj4gPiAtICAgICAgICBpZiAoICFn
Zm5fZXEodmNwdV9hbHRwMm0oY3VycikudmVpbmZvX2dmbiwgSU5WQUxJRF9HRk4pIHx8Cj4gPiAt
ICAgICAgICAgICAgIG1mbl9lcShnZXRfZ2ZuX3F1ZXJ5X3VubG9ja2VkKGN1cnItPmRvbWFpbiwK
PiA+ICsgICAgICAgIHYgPSBfX2dldF92Y3B1KGEuZG9tYWluLCBhLnUuZW5hYmxlX25vdGlmeS52
Y3B1X2lkKTsKPiA+ICsgICAgICAgIGlmICggIXYgKQo+ID4gKyAgICAgICAgewo+ID4gKyAgICAg
ICAgICAgIHJjID0gLUVGQVVMVDsKPiAKPiBIYXJkbHkgYW4gYXBwcm9wcmlhdGUgZXJyb3IgaW5k
aWNhdG9yIGZvciB0aGUgY29uZGl0aW9uLgoKSSdsbCBjaGFuZ2UgaXQgdG8gLUVJTlZBTC4KCj4g
PiArICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICB9Cj4gPiArCj4gPiArICAgICAgICBp
ZiAoICFnZm5fZXEodmNwdV9hbHRwMm0odikudmVpbmZvX2dmbiwgSU5WQUxJRF9HRk4pIHx8Cj4g
PiArICAgICAgICAgICAgIG1mbl9lcShnZXRfZ2ZuX3F1ZXJ5X3VubG9ja2VkKHYtPmRvbWFpbiwK
PiA+ICAgICAgICAgICAgICAgICAgICAgIGEudS5lbmFibGVfbm90aWZ5LmdmbiwgJnAybXQpLCBJ
TlZBTElEX01GTikgKQo+ID4gICAgICAgICAgewo+ID4gICAgICAgICAgICAgIHJjID0gLUVJTlZB
TDsKPiA+ICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgIH0KPiA+ICAKPiA+IC0gICAg
ICAgIHZjcHVfYWx0cDJtKGN1cnIpLnZlaW5mb19nZm4gPSBfZ2ZuKGEudS5lbmFibGVfbm90aWZ5
Lmdmbik7Cj4gPiAtICAgICAgICBhbHRwMm1fdmNwdV91cGRhdGVfdm1mdW5jX3ZlKGN1cnIpOwo+
ID4gKyAgICAgICAgdmNwdV9hbHRwMm0odikudmVpbmZvX2dmbiA9IF9nZm4oYS51LmVuYWJsZV9u
b3RpZnkuZ2ZuKTsKPiA+ICsgICAgICAgIGFsdHAybV92Y3B1X3VwZGF0ZV92bWZ1bmNfdmUodik7
Cj4gCj4gSSdkIGxpa2UgeW91IHRvIG91dGxpbmUgaW4gdGhlIGRlc2NyaXB0aW9uIGhvdyB5b3Ug
bWVhbiBhbiBleHRlcm5hbAo+IGFnZW50IHRvIGNvb3JkaW5hdGUgdGhlIHVzZSBvZiB0aGlzIEdG
TiB3aXRoIHRoZSBndWVzdCAoYW5kIGluCj4gcGFydGljdWxhciB3aXRob3V0IGluLWd1ZXN0IGFn
ZW50KS4KCkknbGwgdHJ5IHRvIGNsYXJpZnkgdGhpcy4KClRoYW5rIHlvdSEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
