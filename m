From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 3/8] iommu: make iommu_inclusive_mapping
 a suboption of dom0-iommu
Date: Fri, 17 Aug 2018 04:04:34 -0600
Message-ID: <5B769DB202000078001DF50E@prv1-mh.provo.novell.com>
References: <20180814134336.75539-1-roger.pau@citrix.com>
 <20180814134336.75539-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfk=la=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqbcV-0003lq-5O
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 10:04:39 +0000
In-Reply-To: <20180814134336.75539-4-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA4LjE4IGF0IDE1OjQzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiBAQCAtMTMwNCwxMSArMTMwNCw5IEBAIHN0
YXRpYyB2b2lkIF9faHdkb21faW5pdCBpbnRlbF9pb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21h
aW4gKmQpCj4gIHsKPiAgICAgIHN0cnVjdCBhY3BpX2RyaGRfdW5pdCAqZHJoZDsKPiAgCj4gLSAg
ICBpZiAoICFpb21tdV9od2RvbV9wYXNzdGhyb3VnaCAmJiBpc19wdl9kb21haW4oZCkgKQo+IC0g
ICAgewo+IC0gICAgICAgIC8qIFNldCB1cCAxOjEgcGFnZSB0YWJsZSBmb3IgaGFyZHdhcmUgZG9t
YWluLiAqLwo+IC0gICAgICAgIHZ0ZF9zZXRfaHdkb21fbWFwcGluZyhkKTsKPiAtICAgIH0KPiAr
ICAgIC8qIEluY2x1c2l2ZSBtYXBwaW5ncyBhcmUgZW5hYmxlZCBieSBkZWZhdWx0IG9uIEludGVs
IGhhcmR3YXJlIGZvciBQVi4gKi8KPiArICAgIGlmICggaW9tbXVfaHdkb21faW5jbHVzaXZlID09
IC0xICkKPiArICAgICAgICBpb21tdV9od2RvbV9pbmNsdXNpdmUgPSBpc19wdl9kb21haW4oZCk7
CgpIbW0sIEkgZGlkbid0IG5vdGljZSB0aGlzIGJlZm9yZSwgYnV0IHRoZXJlJ3MgYW4gaXNzdWUg
aGVyZSBmb3IgdGhlCmxhdGUtaHdkb20gY2FzZTogV2hhdCBpZiBEb20wIGFuZCB0aGUgYWN0dWFs
IGhhcmR3YXJlIGRvbWFpbgpkaWZmZXIgaW4gdGhlaXIgUFYtbmVzcz8gSSB0aGluayB5b3UgbmVl
ZCB0byBrZWVwIGl0IGF0IC0xIGhlcmUgYW5kCnRha2UgdGhlIHN0aWxsIC0xIHZhbHVlIGludG8g
YWNjb3VudCBpbiBhcmNoX2lvbW11X2h3ZG9tX2luaXQoKS4KaW9tbXVfaHdkb21faW5pdCgpIHRo
ZW4gYWxzbyBzaG91bGQgbm90IG92ZXJyaWRlIGl0LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
