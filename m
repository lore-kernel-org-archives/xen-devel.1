From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Thu, 8 Nov 2018 16:42:13 +0000
Message-ID: <20181108164213.7shflq6gh2wm76gn@zion.uk.xensource.com>
References: <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
 <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
 <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
 <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
 <5BE06BC002000078001F823D@prv1-mh.provo.novell.com>
 <20181108153330.sm6vil2pdkgabegh@zion.uk.xensource.com>
 <cbd9fb77-110c-86e3-2e2f-da096bae83f0@citrix.com>
 <5BE45B1802000078001F9C36@prv1-mh.provo.novell.com>
 <20181108160949.qvmcl6kw3w4d6e2s@zion.uk.xensource.com>
 <5BE462B002000078001F9D4E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8d4c=nt=citrix.com=prvs=843a4775a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gKnQQ-00079O-Mc
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 16:44:58 +0000
Content-Disposition: inline
In-Reply-To: <5BE462B002000078001F9D4E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDk6MjI6MDhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA4LjExLjE4IGF0IDE3OjA5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUaHUsIE5vdiAwOCwgMjAxOCBhdCAwODo0OTo0NEFNIC0wNzAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMDguMTEuMTggYXQgMTY6MzYsIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPiA+PiA+IE9uIDA4LzExLzE4IDE1OjMzLCBXZWkgTGl1IHdy
b3RlOgo+ID4+ID4+IE9uIE1vbiwgTm92IDA1LCAyMDE4IGF0IDA5OjExOjQ0QU0gLTA3MDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+ID4+ID4+Pj4+PiBPbiAwNS4xMS4xOCBhdCAxNjo0OSwgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4+Pj4gT24gMDUvMTEvMTggMTU6NDgs
IFdlaSBMaXUgd3JvdGU6Cj4gPj4gPj4+Pj4gT24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDg6MDQ6
MzdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4+Pj4+Pj4+IE9uIDAyLjExLjE4
IGF0IDE2OjU1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gPj4+Pj4+PiAtLS0g
YS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPiA+PiA+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni94ODZfNjQvdHJhcHMuYwo+ID4+ID4+Pj4+Pj4gQEAgLTI5OCw4ICsyOTgsMjEgQEAgc3Rh
dGljIHVuc2lnbmVkIGludCB3cml0ZV9zdHViX3RyYW1wb2xpbmUoCj4gPj4gPj4+Pj4+PiAgfQo+
ID4+ID4+Pj4+Pj4gIAo+ID4+ID4+Pj4+Pj4gIERFRklORV9QRVJfQ1BVKHN0cnVjdCBzdHVicywg
c3R1YnMpOwo+ID4+ID4+Pj4+Pj4gKwo+ID4+ID4+Pj4+Pj4gKyNpZmRlZiBDT05GSUdfUFYKPiA+
PiA+Pj4+Pj4+ICB2b2lkIGxzdGFyX2VudGVyKHZvaWQpOwo+ID4+ID4+Pj4+Pj4gIHZvaWQgY3N0
YXJfZW50ZXIodm9pZCk7Cj4gPj4gPj4+Pj4+PiArI2Vsc2UKPiA+PiA+Pj4+Pj4+ICtzdGF0aWMg
aW5saW5lIHZvaWQgbHN0YXJfZW50ZXIodm9pZCkKPiA+PiA+Pj4+Pj4+ICt7Cj4gPj4gPj4+Pj4+
PiArICAgIHBhbmljKCIlcyBjYWxsZWQiLCBfX2Z1bmNfXyk7Cj4gPj4gPj4+Pj4+PiArfQo+ID4+
ID4+Pj4+Pj4gKwo+ID4+ID4+Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBjc3Rhcl9lbnRlcih2
b2lkKQo+ID4+ID4+Pj4+Pj4gK3sKPiA+PiA+Pj4+Pj4+ICsgICAgcGFuaWMoIiVzIGNhbGxlZCIs
IF9fZnVuY19fKTsKPiA+PiA+Pj4+Pj4+ICt9Cj4gPj4gPj4+Pj4+PiArI2VuZGlmIC8qIENPTkZJ
R19QViAqLwo+ID4+ID4+Pj4+PiBEbyB3ZSByZWFsbHkgbmVlZCB0d28gc2VwYXJhdGUgc3R1YnMg
KGFuZCB0d28gc2VwYXJhdGUgc3RyaW5nIGxpdGVyYWxzKQo+ID4+ID4+Pj4+PiBoZXJlPwo+ID4+
ID4+Pj4+IEkgdGhpbmsgaXQgaXMgY2xlYXJlciBpZiB3ZSBoYXZlIHR3byBkaXN0aW5jdCBtZXNz
YWdlcy4gQnV0IEknbSBub3QgdG9vCj4gPj4gPj4+Pj4gZnVzc2VkIGVpdGhlciB3YXkgcmVhbGx5
LiBJZiB5b3UgZmVlbCBzdHJvbmdseSBhYm91dCB0aGlzLCBJJ20gaGFwcHkgdG8KPiA+PiA+Pj4+
PiBjaGFuZ2UgaXQgdG8gb25seSBvbmUgZnVuY3Rpb24uCj4gPj4gPj4+PiBUaGlzIGlzIHRoZSBj
b3JyZWN0IHdheSB0byBkbyBpdC4gIF9fZnVuY19fIHdpbGwgYWxyZWFkeSBiZSBpbiB0aGUKPiA+
PiA+Pj4+IHN0cmluZyB0YWJsZSwgYW5kIHRoZSBmb3JtYXQgc3RyaW5nIChiZWluZyBpZGVudGlj
YWwpIHdpbGwgYmUgbWVyZ2VkLgo+ID4+ID4+PiBXaHkgd291bGQgX19mdW5jX18gYmUgaW4gdGhl
IHN0cmluZyB0YWJsZSBhbHJlYWR5LCBmb3IgZnVuY3Rpb25zCj4gPj4gPj4+IGNvbnRhaW5pbmcg
bm8gb3RoZXIgcmVmZXJlbmNlcyB0byBpdD8KPiA+PiA+PiBXaGF0IGlzIHRoZSB3YXkgZm9yd2Fy
ZD8gRG8gd2UgcmVhbGx5IGNhcmUgaWYgdGhlcmUgaXMgb25lIG1vcmUgc3RyaW5nCj4gPj4gPj4g
bGl0ZXJhbCBpbiB0aGUgYmluYXJ5Pwo+ID4+ID4gCj4gPj4gPiBOby4gIE9uZSBleHRyYSBzdHJp
bmcgbGlrZSB0aGlzIGlzIG5vdCBzb21ldGhpbmcgd2hpY2ggbmVlZHMgY2FyaW5nCj4gPj4gPiBh
Ym91dCBpbiB0aGUgc2xpZ2h0ZXN0Lgo+ID4+IAo+ID4+IFNvIGp1c3QgdG8gY2xhcmlmeSAtIHRo
ZSB1bm5lY2Vzc2FyeSByZWR1bmRhbmN5IGluIHRoZSBzb3VyY2UgaXMgb2YgbW9yZQo+ID4+IHJl
bGV2YW5jZSB0byBtZSB0aGFuIHRoZSByZXN1bHRpbmcgc2xpZ2h0bHkgbGFyZ2VyIGJpbmFyeS4K
PiA+IAo+ID4gU28geW91IHdvdWxkIHJhdGhlciBoYXZlCj4gPiAKPiA+ICAgICBzdGF0aWMgaW5s
aW5lIHZvaWQgbGNzdGFyX2VudGVyKHZvaWQpCj4gPiAgICAgewo+ID4gICAgICAgICBwYW5pYygi
bHN0YXIvY3N0YXJcbiIpOwo+ID4gICAgIH0KPiA+IAo+ID4gPwo+IAo+IFllcy4gTGV0J3Mgbm90
IGZvcmdldCB0aGF0IHRoaXMgZnVuY3Rpb24gaXMgbmV2ZXIgdG8gYmUgaW52b2tlZAo+IGFueXdh
eSwgc28gdGhlIGxlc3MgZGVhZCBjb2RlIGFuZCBkYXRhLCB0aGUgYmV0dGVyLiAoQXMgYQo+IHNp
ZGUgbm90ZSwgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGV5J3JlIGlubGluZSB3aGVuIHlvdSBu
ZWVkCj4gYSBwb2ludGVyIHRvIHRoZW0gYW55d2F5LiBJbnN0ZWFkIHRoZXkgc2hvdWxkIGdvIGlu
dG8KPiAudGV4dC5jb2xkIG9yIHdoYXRldmVyIGl0IGlzLikKCk9LLiBJIHdpbGwgc3VibWl0IGEg
Zm9sbG93dXAgcGF0Y2ggZm9yIHRoYXQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
