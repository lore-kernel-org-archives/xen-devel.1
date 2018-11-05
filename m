From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Mon, 5 Nov 2018 15:48:42 +0000
Message-ID: <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
 <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mtqo=nq=citrix.com=prvs=8406a2984=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gJh7O-00033u-AY
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 15:48:46 +0000
Content-Disposition: inline
In-Reply-To: <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
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

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDg6MDQ6MzdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAyLjExLjE4IGF0IDE2OjU1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPiA+ICsrKyBiL3hlbi9h
cmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+ID4gQEAgLTI5OCw4ICsyOTgsMjEgQEAgc3RhdGljIHVu
c2lnbmVkIGludCB3cml0ZV9zdHViX3RyYW1wb2xpbmUoCj4gPiAgfQo+ID4gIAo+ID4gIERFRklO
RV9QRVJfQ1BVKHN0cnVjdCBzdHVicywgc3R1YnMpOwo+ID4gKwo+ID4gKyNpZmRlZiBDT05GSUdf
UFYKPiA+ICB2b2lkIGxzdGFyX2VudGVyKHZvaWQpOwo+ID4gIHZvaWQgY3N0YXJfZW50ZXIodm9p
ZCk7Cj4gPiArI2Vsc2UKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgbHN0YXJfZW50ZXIodm9pZCkK
PiA+ICt7Cj4gPiArICAgIHBhbmljKCIlcyBjYWxsZWQiLCBfX2Z1bmNfXyk7Cj4gPiArfQo+ID4g
Kwo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBjc3Rhcl9lbnRlcih2b2lkKQo+ID4gK3sKPiA+ICsg
ICAgcGFuaWMoIiVzIGNhbGxlZCIsIF9fZnVuY19fKTsKPiA+ICt9Cj4gPiArI2VuZGlmIC8qIENP
TkZJR19QViAqLwo+IAo+IERvIHdlIHJlYWxseSBuZWVkIHR3byBzZXBhcmF0ZSBzdHVicyAoYW5k
IHR3byBzZXBhcmF0ZSBzdHJpbmcgbGl0ZXJhbHMpCj4gaGVyZT8KCkkgdGhpbmsgaXQgaXMgY2xl
YXJlciBpZiB3ZSBoYXZlIHR3byBkaXN0aW5jdCBtZXNzYWdlcy4gQnV0IEknbSBub3QgdG9vCmZ1
c3NlZCBlaXRoZXIgd2F5IHJlYWxseS4gSWYgeW91IGZlZWwgc3Ryb25nbHkgYWJvdXQgdGhpcywg
SSdtIGhhcHB5IHRvCmNoYW5nZSBpdCB0byBvbmx5IG9uZSBmdW5jdGlvbi4KCldlaS4KCj4gCj4g
SmFuCj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
