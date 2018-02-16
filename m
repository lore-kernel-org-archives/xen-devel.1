From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2 2/2] vmx/hap: optimize CR4 trapping
Date: Fri, 16 Feb 2018 17:03:22 +0200
Message-ID: <42d0a45f-c164-334f-a85b-a4de3be44572@bitdefender.com>
References: <20180216121029.6872-1-roger.pau@citrix.com>
 <20180216121029.6872-3-roger.pau@citrix.com>
 <338ca9c5-d5f5-c0e9-4e35-154c9919ae75@bitdefender.com>
 <20180216123747.fqmqfgc7xqmof2oq@MacBook-Pro-de-Roger.local>
 <c61588a3-9e98-8440-f895-fd3a75eef460@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wjjn=fk=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1emhXq-0000Q4-OY
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 15:03:26 +0000
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 887F67FC03
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2018 17:03:23 +0200 (EET)
In-Reply-To: <c61588a3-9e98-8440-f895-fd3a75eef460@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTYvMjAxOCAwMjozOSBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDAyLzE2
LzIwMTggMDI6MzcgUE0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIEZyaSwgRmViIDE2
LCAyMDE4IGF0IDAyOjMwOjU1UE0gKzAyMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4+IE9u
IDAyLzE2LzIwMTggMDI6MTAgUE0sIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L21vbml0b3IuYyBiL3hlbi9hcmNoL3g4Ni9tb25pdG9yLmMKPj4+
PiBpbmRleCBmMjI5ZTY5OTQ4Li40MzE3NjU4YzU2IDEwMDY0NAo+Pj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9tb25pdG9yLmMKPj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW9uaXRvci5jCj4+Pj4gQEAg
LTE4OSwxMCArMTg5LDExIEBAIGludCBhcmNoX21vbml0b3JfZG9tY3RsX2V2ZW50KHN0cnVjdCBk
b21haW4gKmQsCj4+Pj4gICAgICAgICAgICAgIGFkLT5tb25pdG9yLndyaXRlX2N0cmxyZWdfZW5h
YmxlZCAmPSB+Y3RybHJlZ19iaXRtYXNrOwo+Pj4+ICAgICAgICAgIH0KPj4+PiAgCj4+Pj4gLSAg
ICAgICAgaWYgKCBWTV9FVkVOVF9YODZfQ1IzID09IG1vcC0+dS5tb3ZfdG9fY3IuaW5kZXggKQo+
Pj4+ICsgICAgICAgIGlmICggVk1fRVZFTlRfWDg2X0NSMyA9PSBtb3AtPnUubW92X3RvX2NyLmlu
ZGV4IHx8Cj4+Pj4gKyAgICAgICAgICAgICBWTV9FVkVOVF9YODZfQ1I0ID09IG1vcC0+dS5tb3Zf
dG9fY3IuaW5kZXggKQo+Pj4+ICAgICAgICAgIHsKPj4+PiAgICAgICAgICAgICAgc3RydWN0IHZj
cHUgKnY7Cj4+Pj4gLSAgICAgICAgICAgIC8qIExhdGNoZXMgbmV3IENSMyBtYXNrIHRocm91Z2gg
Q1IwIGNvZGUuICovCj4+Pj4gKyAgICAgICAgICAgIC8qIExhdGNoZXMgbmV3IENSMyBvciBDUjQg
bWFzayB0aHJvdWdoIENSMCBjb2RlLiAqLwo+Pj4+ICAgICAgICAgICAgICBmb3JfZWFjaF92Y3B1
ICggZCwgdiApCj4+Pj4gICAgICAgICAgICAgICAgICBodm1fdXBkYXRlX2d1ZXN0X2NyKHYsIDAp
Owo+Pj4+ICAgICAgICAgIH0KPj4+Cj4+PiBEaWQgeW91LCBieSBhbnkgY2hhbmNlLCB0ZXN0IHRo
aXMgY29kZSB3aXRoIHhlbi1hY2Nlc3MuYyAoaXQgYWxyZWFkeSBoYXMKPj4+IGEgdGVzdCBmb3Ig
Q1I0IGZvciB0aGUgUEdFIHN0dWZmKT8gSSdtIG5vdCBjb252aW5jZWQgdGhlCj4+PiBodm1fdXBk
YXRlX2d1ZXN0X2NyKHYsIDApOyBjYWxsIHN1ZmZpY2VzIHRvIGVuYWJsZSBDUjQgbG9hZCBleGl0
cy4KPj4KPj4gaHZtX3VwZGF0ZV9ndWVzdF9jciBpcyBqdXN0IGEgd3JhcHBlciB0byB2bXhfdXBk
YXRlX2d1ZXN0X2NyIHdoZW4KPj4gdXNpbmcgdm14LCB3aGljaCB3aWxsIHVuY29uZGl0aW9uYWxs
eSByZS1jYWxjdWxhdGUgdGhlIENSNCBtYXNrIHdoZW4KPj4gY2FsbGVkIHdpdGggY3IgPT0gMCBv
ciBjciA9PSA0Lgo+Pgo+PiBJIGhhdmUgbm90IHRlc3RlZCBpdCB3aXRoIHhlbi1hY2Nlc3MsIGJ1
dCBpdCBzZWVtcyBxdWl0ZQo+PiBzdHJhaWdodGZvcndhcmQgdG8gbWUuIEFyZSB5b3Ugc2VlaW5n
IGFueSBvdGhlciBwYXRoIHRoYXQgY291bGQKPj4gZW5hYmxlIENSNCBsb2FkIGFjY2Vzc2VzIHdp
dGhvdXQgY2FsbGluZyBodm1fdXBkYXRlX2d1ZXN0X2NyPwo+IAo+IE5vLCBJIHRob3VnaHQgSSBk
aWQgYnV0IGFzIGl0IHR1cm5zIG91dCBpdCB3YXNuJ3QuIEknbGwgcnVuIGEgcXVpY2sgdGVzdAo+
IG9uIHRoZSBwYXRjaGVzIGp1c3QgdG8gbWFrZSBzdXJlIHRob3VnaC4gVGhleSBzaG91bGQgYmUg
YWxyaWdodC4KClJhbiBhIGZldyB0ZXN0cywgYW5kIGV2ZXJ5dGhpbmcgYXBwZWFycyB0byBiZSBp
biBvcmRlci4gRm9yIHRoZSBtb25pdG9yCi8gdm1fZXZlbnQgcGFydHM6CgpBY2tlZC1ieTogUmF6
dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoKClRoYW5rcywKUmF6dmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
