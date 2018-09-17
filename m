From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] iommu: setup inclusive mappings before
 enabling iommu
Date: Mon, 17 Sep 2018 06:49:24 -0600
Message-ID: <5B9FA2D402000078001E90EC@prv1-mh.provo.novell.com>
References: <20180914135843.24899-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lj3m=l7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g1sy2-0001qb-53
 for xen-devel@lists.xenproject.org; Mon, 17 Sep 2018 12:49:30 +0000
In-Reply-To: <20180914135843.24899-1-roger.pau@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA5LjE4IGF0IDE1OjU4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9yIGVsc2UgaXQgY2FuIGxlYWQgdG8gZnJlZXplcyB3aGVuIGVuYWJsaW5nIHRoZSBpb21tdSBv
biBjZXJ0YWluCj4gSW50ZWwgaGFyZHdhcmU6Cj4gCj4gWy4uLl0KPiAoWEVOKSBFTEY6IGFkZHJl
c3NlczoKPiAoWEVOKSAgICAgdmlydF9iYXNlICAgICAgICA9IDB4ZmZmZmZmZmY4MDAwMDAwMAo+
IChYRU4pICAgICBlbGZfcGFkZHJfb2Zmc2V0ID0gMHgwCj4gKFhFTikgICAgIHZpcnRfb2Zmc2V0
ICAgICAgPSAweGZmZmZmZmZmODAwMDAwMDAKPiAoWEVOKSAgICAgdmlydF9rc3RhcnQgICAgICA9
IDB4ZmZmZmZmZmY4MTAwMDAwMAo+IChYRU4pICAgICB2aXJ0X2tlbmQgICAgICAgID0gMHhmZmZm
ZmZmZjgyOTUzMDAwCj4gKFhFTikgICAgIHZpcnRfZW50cnkgICAgICAgPSAweGZmZmZmZmZmODI3
NGUxODAKPiAoWEVOKSAgICAgcDJtX2Jhc2UgICAgICAgICA9IDB4ODAwMDAwMDAwMAo+IChYRU4p
ICBYZW4gIGtlcm5lbDogNjQtYml0LCBsc2IsIGNvbXBhdDMyCj4gKFhFTikgIERvbTAga2VybmVs
OiA2NC1iaXQsIFBBRSwgbHNiLCBwYWRkciAweDEwMDAwMDAgLT4gMHgyOTUzMDAKPiA8ZnJlZXpl
Pgo+IAo+IFRoaXMgcmVzdG9yZXMgdGhlIGJlaGF2aW9yIGJlZm9yZSBjb21taXQgNjZhOTI3NGNj
MzQzNSB0aGF0IGNoYW5nZWQKPiB0aGUgb3JkZXIgYW5kIGVuYWJsZWQgdGhlIGlvbW11IHdpdGhv
dXQgaGF2aW5nIHRoZSBpbmNsdXNpdmUgbWFwcGluZ3MKPiBzZXR1cC4KPiAKPiBOb3RlIHRoYXQg
b24gQU1EIGhhcmR3YXJlIHRoZSBvcmRlciBpcyBhbHNvIGNoYW5nZWQgdG8gYWRkIGluY2x1c2l2
ZQo+IG1hcHBpbmdzIGJlZm9yZSBhZGRpbmcgYW55IGRldmljZXMuCj4gCj4gUmVwb3J0ZWQtYnk6
IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpXaXRoIHRoZSBleGNlcHRpb24g
b2YgdGhlIEFSTSBhc3BlY3QgKGJlY2F1c2UgaXQncyBub3QKY2xlYXIgdG8gbWUgd2h5IHRoZSBj
b2RlIHJlbW92ZWQgZnJvbSBpb21tdV9od2RvbV9pbml0KCkKZG9lc24ndCBuZWVkIHRvIHJlLWFw
cGVhciBpbiBBUk0tc3BlY2lmaWMgY29kZSBhcyB3ZWxsKQpSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
