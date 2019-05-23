From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 19/50] x86emul: support AVX512F
 floating-point conversion insns
Date: Thu, 23 May 2019 17:08:34 +0100
Message-ID: <25fb8779-40a4-2aca-f364-72534619f698@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B82BF020000780021F1C7@prv1-mh.provo.novell.com>
 <f23432bc-ab78-6de9-60ab-57767896b380@citrix.com>
 <5CE41D6802000078002310DF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=52eM=TX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hTqGn-0000He-18
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 16:08:41 +0000
In-Reply-To: <5CE41D6802000078002310DF@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDUvMjAxOSAxNjo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMDUuMTkg
YXQgMTM6MzMsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTUvMDMv
MjAxOSAxMDo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBAQCAtOTMxMiw3ICs5Mzg2LDggQEAg
eDg2X2VtdWxhdGUoCj4+PiAgCj4+PiAgICAgICAgICBpZiAoIGVhLnR5cGUgPT0gT1BfTUVNICkK
Pj4+ICAgICAgICAgIHsKPj4+IC0gICAgICAgICAgICByYyA9IG9wcy0+d3JpdGUoZWEubWVtLnNl
ZywgZWEubWVtLm9mZiwgbW12YWxwLCA4IDw8IHZleC5sLCBjdHh0KTsKPj4+ICsgICAgICAgICAg
ICByYyA9IG9wcy0+d3JpdGUoZWEubWVtLnNlZywgdHJ1bmNhdGVfZWEoZWEubWVtLm9mZiArIGZp
cnN0X2J5dGUpLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKW1tdmFs
cCArIGZpcnN0X2J5dGUsIG9wX2J5dGVzLCBjdHh0KTsKPj4+ICAgICAgICAgICAgICBpZiAoIHJj
ICE9IFg4NkVNVUxfT0tBWSApCj4+PiAgICAgICAgICAgICAgewo+Pj4gICAgICAgICAgICAgICAg
ICBhc20gdm9sYXRpbGUgKCAibGRteGNzciAlMCIgOjogIm0iIChteGNzcikgKTsKPj4gVGhpcyBo
dW5rIGRvZXNuJ3QgYXBwZWFyIHRvIGZpdCB3aXRoIHRoZSByZXN0IG9mIHRoZSBwYXRjaCwgYmVj
YXVzZSBpdAo+PiBpc24ndCB0aGUgZmlyc3QgdXNlIG9mIGZpcnN0X2J5dGUuCj4+Cj4+IEhhdmUg
d2UgYmVlbiBzdWJ0bHkgYnJva2VuIGJlZm9yZT8KPiBJIGRvbid0IHRoaW5rIHNvLCBubywgYnV0
IEkgYWRtaXQgSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0Cj4geW91J3JlIHNheWluZyBh
Ym92ZS4gVGhlIHVzZSBvZiBmaXJzdF9ieXRlIGhlcmUgaXMgb2YgY291cnNlIG5vdAo+IHRoZSBm
aXJzdCB1c2UgLSBpdCBnZXRzIHNldCBpbiB0aGUgaHVuayBmdXJ0aGVyIHVwLiBUaGUgQVZYIGZv
cm0gb2YKPiBWQ1ZUUFMyUEggZG9lcyBub3Qgc3VwcG9ydCBmYXVsdCBzdXBwcmVzc2lvbiAoYXMg
dGhhdCdzIGFuCj4gQVZYNTEyIGZlYXR1cmUpLCBhbmQgaGVuY2Ugbm8gc3VjaCBhZGp1c3RtZW50
IHdhcyBuZWVkZWQKPiBoZXJlIGJlZm9yZS4KCkFoIC0gd2hhdCBJIGhhZG4ndCBzcG90dGVkIHdh
cyB0aGF0IHRoaXMgaXMgdGhlIHNwZWNpYWwgY2FzZSBmb3IKdmN2dHBzMnBoLCBzbyB0aGlzIGNo
YW5nZSBpcyBmaW5lIGluIGNvbnRleHQuCgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
