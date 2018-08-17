From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 3/8] iommu: make iommu_inclusive_mapping
 a suboption of dom0-iommu
Date: Fri, 17 Aug 2018 12:32:21 +0200
Message-ID: <20180817103221.76zaqe6rjv4fsbd3@mac>
References: <20180814134336.75539-1-roger.pau@citrix.com>
 <20180814134336.75539-4-roger.pau@citrix.com>
 <5B769DB202000078001DF50E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qfmz=la=citrix.com=prvs=760927a5f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fqc3W-0006u1-VE
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 10:32:34 +0000
Content-Disposition: inline
In-Reply-To: <5B769DB202000078001DF50E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDQ6MDQ6MzRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjA4LjE4IGF0IDE1OjQzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiA+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gPiBAQCAtMTMwNCwxMSAr
MTMwNCw5IEBAIHN0YXRpYyB2b2lkIF9faHdkb21faW5pdCBpbnRlbF9pb21tdV9od2RvbV9pbml0
KHN0cnVjdCBkb21haW4gKmQpCj4gPiAgewo+ID4gICAgICBzdHJ1Y3QgYWNwaV9kcmhkX3VuaXQg
KmRyaGQ7Cj4gPiAgCj4gPiAtICAgIGlmICggIWlvbW11X2h3ZG9tX3Bhc3N0aHJvdWdoICYmIGlz
X3B2X2RvbWFpbihkKSApCj4gPiAtICAgIHsKPiA+IC0gICAgICAgIC8qIFNldCB1cCAxOjEgcGFn
ZSB0YWJsZSBmb3IgaGFyZHdhcmUgZG9tYWluLiAqLwo+ID4gLSAgICAgICAgdnRkX3NldF9od2Rv
bV9tYXBwaW5nKGQpOwo+ID4gLSAgICB9Cj4gPiArICAgIC8qIEluY2x1c2l2ZSBtYXBwaW5ncyBh
cmUgZW5hYmxlZCBieSBkZWZhdWx0IG9uIEludGVsIGhhcmR3YXJlIGZvciBQVi4gKi8KPiA+ICsg
ICAgaWYgKCBpb21tdV9od2RvbV9pbmNsdXNpdmUgPT0gLTEgKQo+ID4gKyAgICAgICAgaW9tbXVf
aHdkb21faW5jbHVzaXZlID0gaXNfcHZfZG9tYWluKGQpOwo+IAo+IEhtbSwgSSBkaWRuJ3Qgbm90
aWNlIHRoaXMgYmVmb3JlLCBidXQgdGhlcmUncyBhbiBpc3N1ZSBoZXJlIGZvciB0aGUKPiBsYXRl
LWh3ZG9tIGNhc2U6IFdoYXQgaWYgRG9tMCBhbmQgdGhlIGFjdHVhbCBoYXJkd2FyZSBkb21haW4K
PiBkaWZmZXIgaW4gdGhlaXIgUFYtbmVzcz8gSSB0aGluayB5b3UgbmVlZCB0byBrZWVwIGl0IGF0
IC0xIGhlcmUgYW5kCj4gdGFrZSB0aGUgc3RpbGwgLTEgdmFsdWUgaW50byBhY2NvdW50IGluIGFy
Y2hfaW9tbXVfaHdkb21faW5pdCgpLgo+IGlvbW11X2h3ZG9tX2luaXQoKSB0aGVuIGFsc28gc2hv
dWxkIG5vdCBvdmVycmlkZSBpdC4KCkJ1dCBpc24ndCB0aGUgbGF0ZS1od2RvbSB0aGUgb25lIHRo
YXQgd291bGQgYmUgcGFzc2VkIHdoZW4gY2FsbGluZwppbnRlbF9pb21tdV9od2RvbV9pbml0PwoK
T3IgZWxzZSBob3cgaXMgaW50ZWxfaW9tbXVfaHdkb21faW5pdCBnb2luZyB0byBkaWZmZXJlbnRp
YXRlIGJldHdlZW4KRG9tMCBhbmQgYSBsYXRlLWh3ZG9tIGlmIHRoZSBmdW5jdGlvbiBpcyBjYWxs
ZWQgZm9yIGJvdGg/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
