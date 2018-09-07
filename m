From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 06/14] iommu: track reserved ranges using
 a rangeset
Date: Fri, 07 Sep 2018 04:40:12 -0600
Message-ID: <5B92558C02000078001E64E1@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=p3pn=lv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fyEBT-0006d5-14
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 10:40:15 +0000
In-Reply-To: <20180823094711.21376-7-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA4LjE4IGF0IDExOjQ3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEBAIC0yNDgsMTIgKzI1MiwxNiBAQCBpbnQgaW9tbXVfY29uc3RydWN0KHN0cnVjdCBkb21h
aW4gKmQpCj4gIAo+ICB2b2lkIGlvbW11X2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQp
Cj4gIHsKPiAtICAgIGlmICggIWlvbW11X2VuYWJsZWQgfHwgIWRvbV9pb21tdShkKS0+cGxhdGZv
cm1fb3BzICkKPiArICAgIGNvbnN0IHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11
KGQpOwo+ICsKPiArICAgIGlmICggIWlvbW11X2VuYWJsZWQgfHwgIWhkLT5wbGF0Zm9ybV9vcHMg
KQo+ICAgICAgICAgIHJldHVybjsKPiAgCj4gICAgICBpb21tdV90ZWFyZG93bihkKTsKPiAgCj4g
ICAgICBhcmNoX2lvbW11X2RvbWFpbl9kZXN0cm95KGQpOwo+ICsKPiArICAgIHJhbmdlc2V0X2Rl
c3Ryb3koaGQtPnJlc2VydmVkX3Jhbmdlcyk7CgpGb3IgaWRlbXBvdGVuY3kgcmVhc29ucyBwZXJo
YXBzIGJldHRlciB0byBzdG9yZSBOVUxMIGFmdGVyCnRoZSBjYWxsPwoKPiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQveDg2L3Z0ZC5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvdnRkL3g4Ni92dGQuYwo+IEBAIC0xNTQsOCArMTU0LDIxIEBAIHZvaWQgX19od2RvbV9p
bml0IHZ0ZF9zZXRfaHdkb21fbWFwcGluZyhzdHJ1Y3QgZG9tYWluICpkKQo+ICAKPiAgICAgICAg
ICByYyA9IGlvbW11X21hcF9wYWdlKGQsIF9iZm4ocGZuKSwgX21mbihwZm4pLAo+ICAJCQkgICAg
SU9NTVVGX3JlYWRhYmxlIHwgSU9NTVVGX3dyaXRhYmxlKTsKPiArCj4gKyAgICAgICAgLyoKPiAr
ICAgICAgICAgKiBUaGUgb25seSByZWFzb24gYSByZXNlcnZlZCBwYWdlIHdvdWxkIGJlIG1hcHBl
ZCBpcyB0aGF0Cj4gKyAgICAgICAgICogaW9tbXVfaW5jbHVzaXZlX21hcHBpbmcgaXMgc2V0LCBp
biB3aGljaCBjYXNlIGl0IG5lZWRzIHRvIGJlCj4gKyAgICAgICAgICogbWFya2VkIGFzIHJlc2Vy
dmVkIGluIHRoZSBJT01NVS4KPiArICAgICAgICAgKi8KPiArICAgICAgICBpZiAoICFyYyAmJiBw
YWdlX2lzX3JhbV90eXBlKHBmbiwgUkFNX1RZUEVfUkVTRVJWRUQpICkKPiArICAgICAgICB7Cj4g
KyAgICAgICAgICAgIEFTU0VSVChpb21tdV9pbmNsdXNpdmVfbWFwcGluZyk7Cj4gKwo+ICsgICAg
ICAgICAgICByYyA9IHJhbmdlc2V0X2FkZF9zaW5nbGV0b24oZG9tX2lvbW11KGQpLT5yZXNlcnZl
ZF9yYW5nZXMsIHBmbik7Cj4gKyAgICAgICAgfQoKV2h5IHdvdWxkIHRoaXMgYmUgcmVzdHJpY3Rl
ZCB0byB0aGUgRTgyMCByZXNlcnZlZCB0eXBlPyBJIHRoaW5rIHRoaXMKc2hvdWxkIGNvdmVyIGV2
ZXJ5dGhpbmcgdGhhdCBnZXRzIG1hcHBlZCB3aXRoIGlvbW11X2luY2x1c2l2ZV9tYXBwaW5nCnNl
dCwgYnV0IG5vdCBtYXBwZWQgd2l0aCB0aGUgZmxhZyBjbGVhci4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
