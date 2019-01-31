From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] x86emul: avoid speculative out of
 bounds accesses
Date: Thu, 31 Jan 2019 14:54:51 +0000
Message-ID: <bed75e46-1a6d-45b2-e945-a3bb49f8e8fe@citrix.com>
References: <5C5301290200007800212C6B@prv1-mh.provo.novell.com>
 <5C53056B0200007800212C9B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dit8=QH=citrix.com=prvs=927878326=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gpDjy-0003kc-Nx
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 14:54:54 +0000
In-Reply-To: <5C53056B0200007800212C9B@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, nmanthey@amazon.de, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDEvMjAxOSAxNDoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPiArKysgYi94ZW4vYXJjaC94ODYveDg2X2Vt
dWxhdGUveDg2X2VtdWxhdGUuYwo+IEBAIC0yMjA3LDEwICsyMjA3LDcgQEAgc3RhdGljIHZvaWQg
Kl9kZWNvZGVfZ3ByKAo+ICAKPiAgICAgIEFTU0VSVChtb2RybV9yZWcgPCBBUlJBWV9TSVpFKGJ5
dGVfcmVnX29mZnNldHMpKTsKPiAgCj4gLSAgICAvKiBGb3Igc2FmZXR5IGluIHJlbGVhc2UgYnVp
bGRzLiAgRGVidWcgYnVpbGRzIHdpbGwgaGl0IHRoZSBBU1NFUlQoKSAqLwo+IC0gICAgbW9kcm1f
cmVnICY9IEFSUkFZX1NJWkUoYnl0ZV9yZWdfb2Zmc2V0cykgLSAxOwo+IC0KPiAtICAgIHJldHVy
biAodm9pZCAqKXJlZ3MgKyBieXRlX3JlZ19vZmZzZXRzW21vZHJtX3JlZ107Cj4gKyAgICByZXR1
cm4gKHZvaWQgKilyZWdzICsgYXJyYXlfYWNjZXNzX25vc3BlYyhieXRlX3JlZ19vZmZzZXRzLCBt
b2RybV9yZWcpOwo+ICB9CgpBY3R1YWxseSwgdGhlICY9IGhlcmUgd2Fzbid0IGJ5IGFjY2lkZW50
LsKgIFdoZW4gdGhlIGFycmF5IHNpemUgaXMgYW4KcG93ZXIgb2YgdHdvIGFuZCBrbm93biB0byB0
aGUgY29tcGlsZXIsIGl0IGlzIGEgcmF0aGVyIGxvd2VyIG92ZXJoZWFkCmFsdGVybmF0aXZlIHRv
IGFycmF5X2FjY2Vzc19ub3NwZWMoKSwgYXMgaXQgYXZvaWRzIHRoZSBjbXAvc2JiIGRhbmNlIGlu
CnRoZSBhc20gdm9sYXRpbGUgc3RhdGVtZW50LgoKSSB3b25kZXIgaWYgdGhlcmUgaXMgYSBzZW5z
aWJsZSB3YXkgY29wZSB3aXRoIHRoaXMgaW4KYXJyYXlfYWNjZXNzX25vc3BlYygpLsKgIFBlcmhh
cHMgc29tZXRoaW5nIGxpa2U6CgojZGVmaW5lIGFycmF5X2FjY2Vzc19ub3NwZWMoYXJyYXksIGlu
ZGV4KQooewrCoMKgwqAgc2l6ZV90IF9zID0gQVJSQVlfU0laRShhcnJheSk7CgrCoMKgwqAgaWYg
KCAhKF9zICYgKF9zIC0gMSkpICkKwqDCoMKgIHsKwqDCoMKgwqDCoMKgwqAgdHlwZW9mKGluZGV4
KSBfaSA9IGluZGV4ICYgKF9zIC0gMSk7CsKgwqDCoMKgwqDCoMKgIE9QVElNSVpFUl9ISURFX1ZB
UihfaSk7CsKgwqDCoMKgwqDCoMKgIChhcnJheSlbX2ldOwrCoMKgwqAgfQrCoMKgwqAgZWxzZQrC
oMKgwqDCoMKgwqDCoCAoYXJyYXkpW2FycmF5X2luZGV4X25vc3BlYyhpbmRleCwgQVJSQVlfU0la
RShhcnJheSkpXTsKfSkKCkFzIF9zIGlzIGtub3duIGF0IGNvbXBpbGUgdGltZSwgb25seSBvbmUg
aGFsZiBvZiB0aGUgaWYgY29uZGl0aW9uIHdpbGwKYmUgZW1pdHRlZCBieSB0aGUgY29tcGlsZXIu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
