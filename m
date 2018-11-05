From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Mon, 05 Nov 2018 08:04:37 -0700
Message-ID: <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5iqt=nq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gJgQm-0007nZ-Pc
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 15:04:44 +0000
In-Reply-To: <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
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

Pj4+IE9uIDAyLjExLjE4IGF0IDE2OjU1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jCj4gKysrIGIveGVuL2FyY2gveDg2L3g4
Nl82NC90cmFwcy5jCj4gQEAgLTI5OCw4ICsyOTgsMjEgQEAgc3RhdGljIHVuc2lnbmVkIGludCB3
cml0ZV9zdHViX3RyYW1wb2xpbmUoCj4gIH0KPiAgCj4gIERFRklORV9QRVJfQ1BVKHN0cnVjdCBz
dHVicywgc3R1YnMpOwo+ICsKPiArI2lmZGVmIENPTkZJR19QVgo+ICB2b2lkIGxzdGFyX2VudGVy
KHZvaWQpOwo+ICB2b2lkIGNzdGFyX2VudGVyKHZvaWQpOwo+ICsjZWxzZQo+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgbHN0YXJfZW50ZXIodm9pZCkKPiArewo+ICsgICAgcGFuaWMoIiVzIGNhbGxlZCIs
IF9fZnVuY19fKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIGNzdGFyX2VudGVyKHZv
aWQpCj4gK3sKPiArICAgIHBhbmljKCIlcyBjYWxsZWQiLCBfX2Z1bmNfXyk7Cj4gK30KPiArI2Vu
ZGlmIC8qIENPTkZJR19QViAqLwoKRG8gd2UgcmVhbGx5IG5lZWQgdHdvIHNlcGFyYXRlIHN0dWJz
IChhbmQgdHdvIHNlcGFyYXRlIHN0cmluZyBsaXRlcmFscykKaGVyZT8KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
