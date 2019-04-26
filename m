From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
Date: Thu, 25 Apr 2019 18:12:58 -0600
Message-ID: <CABfawhm8KxHwY4PB8u-EBqw0K+G1Hv9S9iTC_RYaqOY15bxX4A@mail.gmail.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
 <495a1395-06d4-2ce3-7216-1417ba41fe07@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jv+f=S4=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hJoUm-00038Q-03
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 00:13:40 +0000
Received: by mail-wm1-f50.google.com with SMTP id j13so1458572wmh.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 17:13:36 -0700 (PDT)
In-Reply-To: <495a1395-06d4-2ce3-7216-1417ba41fe07@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMjowMSBQTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDI1LzA0LzIwMTkgMjA6NTcsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IE9uIFRodSwgQXByIDI1LCAyMDE5IGF0IDEyOjU4IFBNIEFuZHJl
dyBDb29wZXIKPiA+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+PiBPbiAy
NS8wNC8yMDE5IDE2OjMyLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPj4+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKPiA+
Pj4gaW5kZXggNmZhYTU2MzE2Ny4uNTk0ZGU2MTQ4ZiAxMDA2NDQKPiA+Pj4gLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9tbS5oCj4gPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+
ID4+PiBAQCAtMTMzLDcgKzEzMywxMCBAQCBzdHJ1Y3QgcGFnZV9pbmZvCj4gPj4+ICAgICAgICAg
ICAqIG9mIHNoYXJpbmcgc2hhcmUgdGhlIHZlcnNpb24gdGhleSBleHBlY3QgdG8uCj4gPj4+ICAg
ICAgICAgICAqIFRoaXMgbGlzdCBpcyBhbGxvY2F0ZWQgYW5kIGZyZWVkIHdoZW4gYSBwYWdlIGlz
IHNoYXJlZC91bnNoYXJlZC4KPiA+Pj4gICAgICAgICAgICovCj4gPj4+IC0gICAgICAgIHN0cnVj
dCBwYWdlX3NoYXJpbmdfaW5mbyAqc2hhcmluZzsKPiA+Pj4gKyAgICAgICAgc3RydWN0IHsKPiA+
Pj4gKyAgICAgICAgICAgIHN0cnVjdCBwYWdlX3NoYXJpbmdfaW5mbyAqaW5mbzsKPiA+Pj4gKyAg
ICAgICAgICAgIHJ3bG9ja190IGxvY2s7Cj4gPj4+ICsgICAgICAgIH0gc2hhcmluZzsKPiA+Pj4g
ICAgICB9Owo+ID4+Pgo+ID4+PiAgICAgIC8qIFJlZmVyZW5jZSBjb3VudCBhbmQgdmFyaW91cyBQ
R0NfeHh4IGZsYWdzIGFuZCBmaWVsZHMuICovCj4gPj4gSSdtIGFmcmFpZCB0aGlzIGlzIGEgbm8t
Z28sIGJ1dCBmb3Igc29tZSByZWFzb25zIHdoaWNoIGFyZSByYXRoZXIgbW9yZQo+ID4+IHN1YnRs
ZSB0aGF0IHRoZXkgYXBwZWFyIGhlcmUuCj4gPj4KPiA+PiBUaGVyZSBpcyBvbmUgc3RydWN0IHBh
Z2VfaW5mbyBwZXIgNGsgZnJhbWUsIGFuZCB5b3UndmUgYWRkZWQgYW4gZXh0cmEgMTYKPiA+PiBi
eXRlcywgdGFraW5nIGl0IGZyb20gMzIgYnl0ZXMgdG8gNDggYnl0ZXMuCj4gPj4KPiA+PiBPdGhl
ciB0aGFuIG1ha2luZyBpdCBhIG5vbi1wb3dlci1vZi0yIChuZXQgZGlmZnN0YXQgZ3Jvdy9zaHJp
bms6IDI1Ni8yNwo+ID4+IHVwL2Rvd246IDc3NTAvLTU2OTYgKDIwNTQpIGR1ZSB0byBsZXNzIGVm
ZmljaWVudCBhcml0aG1ldGljWzFdKSwgdGhlCj4gPj4gZnJhbXRhYmxlIGhhcyBhIGZpeGVkIHZp
cnR1YWwgc2l6ZSAoMTI4RyBieSBkZWZhdWx0KSwgc28geW91J3ZlIGVuZGVkIHVwCj4gPj4gZHJv
cHBpbmcgWGVuJ3MgbWVtb3J5IGxpbWl0ICgxNlRCIGJ5IGRlZmF1bHQpIGJ5IDEvMy4KPiA+IElu
dGVyZXN0aW5nLCBJJ20gbm90IHN1cmUgSSBjb21wbGV0ZWx5IGZvbGxvdyBidXQgZG9lcyB0aGlz
IG1lYW4gdGhhdAo+ID4gdGhpcyBzdHJ1Y3R1cmUgaXMgbm93IG5vdCBhbGxvd2VkIHRvIGdyb3cs
IGxpa2UgZXZlciwgb3IgdGhhdCBJIGp1c3QKPiA+IG5lZWQgdG8gYWRkIHBhZGRpbmcgdG8gZml4
IHVwIGl0cyBhbGlnbm1lbnQ/Cj4KPiBCYXNpY2FsbHksIGl0IG5lZWRzIGV4Y2VlZGluZ2x5IGdv
b2QgcmVhc29ucyB0byBncm93LiAgRXZlbiAic3VwcG9ydGluZwo+IG1vcmUgdGhhbiAxNlQgb2Yg
UkFNIiB3YXNuJ3QgYSBnb29kIGVub3VnaCByZWFzb24gdG8gZ3JvdyBpdCBmcm9tIDMyIHRvCj4g
NjQgYnl0ZXMsIHdoaWNoIGlzIHdoeSBDT05GSUdfQklHTUVNIGV4aXN0cyBhbmQgaXMgb2ZmIGJ5
IGRlZmF1bHQuCj4KPiBBdCB0aGUgbW9tZW50LCBJIGRvbid0IGhhdmUgYSBnb29kIHNvbHV0aW9u
IGZvciB5b3VyIHByb2JsZW0gdG8gc3VnZ2VzdC4KPgoKSSB3b3VsZCBiZSBPSyB3aXRoIHB1dHRp
bmcgdGhlIHdob2xlIHRoaW5nIGJlaGluZApDT05GSUdfSEFTX01FTV9TSEFSSU5HIGFuZCBoYXZp
bmcgdGhhdCBiZSBvZmYgYnkgZGVmYXVsdC4gSXMgdGhhdCBhCmZlYXNpYmxlIHJvdXRlIGZyb20g
eW91ciBQT1Y/CgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
