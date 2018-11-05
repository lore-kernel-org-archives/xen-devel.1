From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Mon, 5 Nov 2018 15:49:40 +0000
Message-ID: <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
 <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
 <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y45x=nq=citrix.com=prvs=8403a2554=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gJh8J-0003DL-Ry
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 15:49:43 +0000
In-Reply-To: <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTEvMTggMTU6NDgsIFdlaSBMaXUgd3JvdGU6Cj4gT24gTW9uLCBOb3YgMDUsIDIwMTgg
YXQgMDg6MDQ6MzdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAyLjExLjE4
IGF0IDE2OjU1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJj
aC94ODYveDg2XzY0L3RyYXBzLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMu
Ywo+Pj4gQEAgLTI5OCw4ICsyOTgsMjEgQEAgc3RhdGljIHVuc2lnbmVkIGludCB3cml0ZV9zdHVi
X3RyYW1wb2xpbmUoCj4+PiAgfQo+Pj4gIAo+Pj4gIERFRklORV9QRVJfQ1BVKHN0cnVjdCBzdHVi
cywgc3R1YnMpOwo+Pj4gKwo+Pj4gKyNpZmRlZiBDT05GSUdfUFYKPj4+ICB2b2lkIGxzdGFyX2Vu
dGVyKHZvaWQpOwo+Pj4gIHZvaWQgY3N0YXJfZW50ZXIodm9pZCk7Cj4+PiArI2Vsc2UKPj4+ICtz
dGF0aWMgaW5saW5lIHZvaWQgbHN0YXJfZW50ZXIodm9pZCkKPj4+ICt7Cj4+PiArICAgIHBhbmlj
KCIlcyBjYWxsZWQiLCBfX2Z1bmNfXyk7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyBpbmxpbmUg
dm9pZCBjc3Rhcl9lbnRlcih2b2lkKQo+Pj4gK3sKPj4+ICsgICAgcGFuaWMoIiVzIGNhbGxlZCIs
IF9fZnVuY19fKTsKPj4+ICt9Cj4+PiArI2VuZGlmIC8qIENPTkZJR19QViAqLwo+PiBEbyB3ZSBy
ZWFsbHkgbmVlZCB0d28gc2VwYXJhdGUgc3R1YnMgKGFuZCB0d28gc2VwYXJhdGUgc3RyaW5nIGxp
dGVyYWxzKQo+PiBoZXJlPwo+IEkgdGhpbmsgaXQgaXMgY2xlYXJlciBpZiB3ZSBoYXZlIHR3byBk
aXN0aW5jdCBtZXNzYWdlcy4gQnV0IEknbSBub3QgdG9vCj4gZnVzc2VkIGVpdGhlciB3YXkgcmVh
bGx5LiBJZiB5b3UgZmVlbCBzdHJvbmdseSBhYm91dCB0aGlzLCBJJ20gaGFwcHkgdG8KPiBjaGFu
Z2UgaXQgdG8gb25seSBvbmUgZnVuY3Rpb24uCgpUaGlzIGlzIHRoZSBjb3JyZWN0IHdheSB0byBk
byBpdC7CoCBfX2Z1bmNfXyB3aWxsIGFscmVhZHkgYmUgaW4gdGhlCnN0cmluZyB0YWJsZSwgYW5k
IHRoZSBmb3JtYXQgc3RyaW5nIChiZWluZyBpZGVudGljYWwpIHdpbGwgYmUgbWVyZ2VkLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
