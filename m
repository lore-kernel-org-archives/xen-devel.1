From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: suppress general register update
 upon AVX gather failures
Date: Mon, 1 Apr 2019 15:04:03 +0100
Message-ID: <6715048e-a509-ec71-dbca-10735f872326@citrix.com>
References: <5C9DE7E40200007800222BA7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eSOb=SD=citrix.com=prvs=987a6ddbb=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hAxbi-0003eB-26
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 14:08:14 +0000
In-Reply-To: <5C9DE7E40200007800222BA7@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMjAxOSAwOTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPiArKysgYi94ZW4vYXJjaC94ODYveDg2X2Vt
dWxhdGUveDg2X2VtdWxhdGUuYwo+IEBAIC04NTQ3LDYgKzg1NDcsOSBAQCB4ODZfZW11bGF0ZSgK
PiAgICAgICAgICBpbnZva2Vfc3R1YigiIiwgIiIsICIrbSIgKG1hc2spIDogImEiICgmbWFzaykp
Owo+ICAgICAgICAgIHB1dF9zdHViKHN0dWIpOwo+ICAKPiArICAgICAgICBpZiAoIHJjICE9IFg4
NkVNVUxfT0tBWSApCj4gKyAgICAgICAgICAgIGdvdG8gZG9uZTsKClRoaXMgb2J2aW91c2x5IGlz
IG5lZWRlZCB0byBmaXggdGhlIHByb2JsZW0gYXMgaXQgbWFuaWZlc3RlZCBmb3IgR2VvcmdlLApi
dXQgaW4gdGhlIGNhc2UgdGhhdCB3ZSB0YWtlIGEgZmF1bHQvcmV0cnkgb24gaXRlcmF0aW9uIDAs
IHNob3VsZG4ndCB3ZQpza2lwIHRoZSB3cml0ZWJhY2sgYXMgd2VsbD8KCn5BbmRyZXcKCj4gKwo+
ICAgICAgICAgIHN0YXRlLT5zaW1kX3NpemUgPSBzaW1kX25vbmU7Cj4gICAgICAgICAgYnJlYWs7
Cj4gICAgICB9Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
