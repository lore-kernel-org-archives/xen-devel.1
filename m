From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Thu, 08 Nov 2018 09:22:08 -0700
Message-ID: <5BE462B002000078001F9D4E@prv1-mh.provo.novell.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
 <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
 <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
 <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
 <5BE06BC002000078001F823D@prv1-mh.provo.novell.com>
 <20181108153330.sm6vil2pdkgabegh@zion.uk.xensource.com>
 <cbd9fb77-110c-86e3-2e2f-da096bae83f0@citrix.com>
 <5BE45B1802000078001F9C36@prv1-mh.provo.novell.com>
 <20181108160949.qvmcl6kw3w4d6e2s@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e9yk=nt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gKn4P-0005JB-Hp
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 16:22:13 +0000
In-Reply-To: <20181108160949.qvmcl6kw3w4d6e2s@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjExLjE4IGF0IDE3OjA5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDg6NDk6NDRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwOC4xMS4xOCBhdCAxNjozNiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+IHdyb3RlOgo+PiA+IE9uIDA4LzExLzE4IDE1OjMzLCBXZWkgTGl1IHdyb3RlOgo+PiA+PiBP
biBNb24sIE5vdiAwNSwgMjAxOCBhdCAwOToxMTo0NEFNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4gPj4+Pj4+IE9uIDA1LjExLjE4IGF0IDE2OjQ5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6Cj4+ID4+Pj4gT24gMDUvMTEvMTggMTU6NDgsIFdlaSBMaXUgd3JvdGU6Cj4+
ID4+Pj4+IE9uIE1vbiwgTm92IDA1LCAyMDE4IGF0IDA4OjA0OjM3QU0gLTA3MDAsIEphbiBCZXVs
aWNoIHdyb3RlOgo+PiA+Pj4+Pj4+Pj4gT24gMDIuMTEuMTggYXQgMTY6NTUsIDx3ZWkubGl1MkBj
aXRyaXguY29tPiB3cm90ZToKPj4gPj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L3Ry
YXBzLmMKPj4gPj4+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPj4gPj4+
Pj4+PiBAQCAtMjk4LDggKzI5OCwyMSBAQCBzdGF0aWMgdW5zaWduZWQgaW50IHdyaXRlX3N0dWJf
dHJhbXBvbGluZSgKPj4gPj4+Pj4+PiAgfQo+PiA+Pj4+Pj4+ICAKPj4gPj4+Pj4+PiAgREVGSU5F
X1BFUl9DUFUoc3RydWN0IHN0dWJzLCBzdHVicyk7Cj4+ID4+Pj4+Pj4gKwo+PiA+Pj4+Pj4+ICsj
aWZkZWYgQ09ORklHX1BWCj4+ID4+Pj4+Pj4gIHZvaWQgbHN0YXJfZW50ZXIodm9pZCk7Cj4+ID4+
Pj4+Pj4gIHZvaWQgY3N0YXJfZW50ZXIodm9pZCk7Cj4+ID4+Pj4+Pj4gKyNlbHNlCj4+ID4+Pj4+
Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBsc3Rhcl9lbnRlcih2b2lkKQo+PiA+Pj4+Pj4+ICt7Cj4+
ID4+Pj4+Pj4gKyAgICBwYW5pYygiJXMgY2FsbGVkIiwgX19mdW5jX18pOwo+PiA+Pj4+Pj4+ICt9
Cj4+ID4+Pj4+Pj4gKwo+PiA+Pj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgY3N0YXJfZW50ZXIo
dm9pZCkKPj4gPj4+Pj4+PiArewo+PiA+Pj4+Pj4+ICsgICAgcGFuaWMoIiVzIGNhbGxlZCIsIF9f
ZnVuY19fKTsKPj4gPj4+Pj4+PiArfQo+PiA+Pj4+Pj4+ICsjZW5kaWYgLyogQ09ORklHX1BWICov
Cj4+ID4+Pj4+PiBEbyB3ZSByZWFsbHkgbmVlZCB0d28gc2VwYXJhdGUgc3R1YnMgKGFuZCB0d28g
c2VwYXJhdGUgc3RyaW5nIGxpdGVyYWxzKQo+PiA+Pj4+Pj4gaGVyZT8KPj4gPj4+Pj4gSSB0aGlu
ayBpdCBpcyBjbGVhcmVyIGlmIHdlIGhhdmUgdHdvIGRpc3RpbmN0IG1lc3NhZ2VzLiBCdXQgSSdt
IG5vdCB0b28KPj4gPj4+Pj4gZnVzc2VkIGVpdGhlciB3YXkgcmVhbGx5LiBJZiB5b3UgZmVlbCBz
dHJvbmdseSBhYm91dCB0aGlzLCBJJ20gaGFwcHkgdG8KPj4gPj4+Pj4gY2hhbmdlIGl0IHRvIG9u
bHkgb25lIGZ1bmN0aW9uLgo+PiA+Pj4+IFRoaXMgaXMgdGhlIGNvcnJlY3Qgd2F5IHRvIGRvIGl0
LiAgX19mdW5jX18gd2lsbCBhbHJlYWR5IGJlIGluIHRoZQo+PiA+Pj4+IHN0cmluZyB0YWJsZSwg
YW5kIHRoZSBmb3JtYXQgc3RyaW5nIChiZWluZyBpZGVudGljYWwpIHdpbGwgYmUgbWVyZ2VkLgo+
PiA+Pj4gV2h5IHdvdWxkIF9fZnVuY19fIGJlIGluIHRoZSBzdHJpbmcgdGFibGUgYWxyZWFkeSwg
Zm9yIGZ1bmN0aW9ucwo+PiA+Pj4gY29udGFpbmluZyBubyBvdGhlciByZWZlcmVuY2VzIHRvIGl0
Pwo+PiA+PiBXaGF0IGlzIHRoZSB3YXkgZm9yd2FyZD8gRG8gd2UgcmVhbGx5IGNhcmUgaWYgdGhl
cmUgaXMgb25lIG1vcmUgc3RyaW5nCj4+ID4+IGxpdGVyYWwgaW4gdGhlIGJpbmFyeT8KPj4gPiAK
Pj4gPiBOby4gIE9uZSBleHRyYSBzdHJpbmcgbGlrZSB0aGlzIGlzIG5vdCBzb21ldGhpbmcgd2hp
Y2ggbmVlZHMgY2FyaW5nCj4+ID4gYWJvdXQgaW4gdGhlIHNsaWdodGVzdC4KPj4gCj4+IFNvIGp1
c3QgdG8gY2xhcmlmeSAtIHRoZSB1bm5lY2Vzc2FyeSByZWR1bmRhbmN5IGluIHRoZSBzb3VyY2Ug
aXMgb2YgbW9yZQo+PiByZWxldmFuY2UgdG8gbWUgdGhhbiB0aGUgcmVzdWx0aW5nIHNsaWdodGx5
IGxhcmdlciBiaW5hcnkuCj4gCj4gU28geW91IHdvdWxkIHJhdGhlciBoYXZlCj4gCj4gICAgIHN0
YXRpYyBpbmxpbmUgdm9pZCBsY3N0YXJfZW50ZXIodm9pZCkKPiAgICAgewo+ICAgICAgICAgcGFu
aWMoImxzdGFyL2NzdGFyXG4iKTsKPiAgICAgfQo+IAo+ID8KClllcy4gTGV0J3Mgbm90IGZvcmdl
dCB0aGF0IHRoaXMgZnVuY3Rpb24gaXMgbmV2ZXIgdG8gYmUgaW52b2tlZAphbnl3YXksIHNvIHRo
ZSBsZXNzIGRlYWQgY29kZSBhbmQgZGF0YSwgdGhlIGJldHRlci4gKEFzIGEKc2lkZSBub3RlLCBJ
IGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoZXkncmUgaW5saW5lIHdoZW4geW91IG5lZWQKYSBwb2lu
dGVyIHRvIHRoZW0gYW55d2F5LiBJbnN0ZWFkIHRoZXkgc2hvdWxkIGdvIGludG8KLnRleHQuY29s
ZCBvciB3aGF0ZXZlciBpdCBpcy4pCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
