From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 3/5] iommu: make iommu_inclusive_mapping
 a suboption of dom0-iommu
Date: Fri, 3 Aug 2018 12:39:26 +0200
Message-ID: <20180803103926.332bvockhvb277gf@mac>
References: <20180801110340.67695-1-roger.pau@citrix.com>
 <20180801110340.67695-4-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19129162C@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jouf=ks=citrix.com=prvs=7468cef67=roger.pau@srs-us1.protection.inumbo.net>)
 id 1flXUj-0005sg-Ey
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 10:39:41 +0000
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19129162C@SHSMSX101.ccr.corp.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMDIsIDIwMTggYXQgMDc6NTg6NDhBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiArdm9pZCBfX2h3ZG9tX2luaXQgYXJjaF9pb21tdV9od2RvbV9pbml0KHN0cnVjdCBk
b21haW4gKmQpCj4gPiArewo+ID4gKyAgICB1bnNpZ25lZCBsb25nIGksIHRvcCwgbWF4X3BmbjsK
PiA+ICsKPiA+ICsgICAgQlVHX09OKCFpc19oYXJkd2FyZV9kb21haW4oZCkpOwo+ID4gKwo+ID4g
KyAgICAvKiBTZXQgdGhlIGRlZmF1bHQgdmFsdWUgb2YgaW5jbHVzaXZlIGRlcGVuZGluZyBvbiB0
aGUgaGFyZHdhcmUuICovCj4gPiArICAgIGlmICggaW9tbXVfZG9tMF9pbmNsdXNpdmUgPT0gLTEg
KQo+ID4gKyAgICAgICAgaW9tbXVfZG9tMF9pbmNsdXNpdmUgPSBib290X2NwdV9kYXRhLng4Nl92
ZW5kb3IgPT0KPiA+IFg4Nl9WRU5ET1JfSU5URUw7Cj4gPiArCj4gCj4gSSBkb24ndCBsaWtlIGFi
b3ZlIHN0eWxlLiAKPiAKPiBidHcgSXQncyBiZXR0ZXIgdG8gc2V0IGl0IGluIGludGVsX2lvbW11
X2h3ZG9tX2luaXQuCgpUaGVuIEkgd2lsbCBhbHNvIGhhdmUgdG8gc2V0IHRoZSBBTUQgZGVmYXVs
dCBpbiBhbWRfaW9tbXVfaHdkb21faW5pdC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
