From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 14:48:21 +0100
Message-ID: <4c2574fb-eebb-68d5-8b4d-a60509dd51e6@citrix.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bvjw=il=citrix.com=prvs=675476172=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fLqbZ-0000C2-Nj
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 13:48:33 +0000
In-Reply-To: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Simon Gaiser <simon@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDUvMTggMTQ6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEluIGNvbW1pdCBkMWQ2ZmM5
N2Q2ICgieDg2L3hwdGk6IHJlYWxseSBoaWRlIGFsbW9zdCBhbGwgb2YgWGVuIGltYWdlIikKPiBJ
J3ZlIGZhaWxlZCB0byByZW1lbWJlciB0aGUgZmFjdCB0aGF0IG11bHRpcGxlIENQVXMgc2hhcmUg
YSBzdHViCj4gbWFwcGluZyBwYWdlLiBUaGVyZWZvcmUgaXQgaXMgd3JvbmcgdG8gdW5jb25kaXRp
b25hbGx5IHphcCB0aGUgbWFwcGluZwo+IHdoZW4gYnJpbmdpbmcgZG93biBhIENQVTsgaXQgbWF5
IG9ubHkgYmUgdW5tYXBwZWQgd2hlbiBubyBvdGhlciBvbmxpbmUKPiBDUFUgdXNlcyB0aGF0IHNh
bWUgcGFnZS4KPgo+IFJlcG9ydGVkLWJ5OiBTaW1vbiBHYWlzZXIgPHNpbW9uQGludmlzaWJsZXRo
aW5nc2xhYi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+Cj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9zbXBib290LmMKPiBAQCAtODc2LDcgKzg3NiwyMSBAQCBzdGF0aWMgdm9pZCBjbGVhbnVwX2Nw
dV9yb290X3BndCh1bnNpZ25lCj4gIAo+ICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKHJwdCk7Cj4g
IAo+IC0gICAgLyogQWxzbyB6YXAgdGhlIHN0dWIgbWFwcGluZyBmb3IgdGhpcyBDUFUuICovCj4g
KyAgICAvKgo+ICsgICAgICogQWxzbyB6YXAgdGhlIHN0dWIgbWFwcGluZyBmb3IgdGhpcyBDUFUs
IGlmIG5vIG90aGVyIG9ubGluZSBvbmUgdXNlcwo+ICsgICAgICogdGhlIHNhbWUgcGFnZS4KPiAr
ICAgICAqLwo+ICsgICAgaWYgKCBzdHViX2xpbmVhciApCj4gKyAgICB7Cj4gKyAgICAgICAgdW5z
aWduZWQgaW50IG90aGVyOwo+ICsKPiArICAgICAgICBmb3JfZWFjaF9vbmxpbmVfY3B1KG90aGVy
KQoKTG9vayBvdmVyIHRoZSBjb2RlLCBpdCBzZWVtcyB0aGF0IHdpdGggc3BhY2VzIGlzIHRoZSBt
b3JlIGNvbW1vbiBzdHlsZSwKYnV0IGl0IGlzIGFkbWl0dGVkbHkgZmFpcmx5IG1peGVkLgoKRWl0
aGVyIHdheSAoYXMgdGhhdCdzIHRyaXZpYWwgdG8gZml4KSwgQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIKPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgo+ICsgICAgICAgICAgICBpZiAoICEoKHBl
cl9jcHUoc3R1YnMuYWRkciwgb3RoZXIpIF4gc3R1Yl9saW5lYXIpID4+IFBBR0VfU0hJRlQpICkK
PiArICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAgICAgc3R1Yl9saW5lYXIgPSAwOwo+ICsg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgIH0KPiArICAgIH0KPiAgICAgIGlm
ICggc3R1Yl9saW5lYXIgKQo+ICAgICAgewo+ICAgICAgICAgIGwzX3BnZW50cnlfdCAqbDN0ID0g
bDRlX3RvX2wzZShjb21tb25fcGd0KTsKPgo+Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
