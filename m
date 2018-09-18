From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH v2] iommu: setup inclusive mappings before
 enabling iommu
Date: Tue, 18 Sep 2018 07:00:17 -0600
Message-ID: <5BA0F6E102000078001E9740@prv1-mh.provo.novell.com>
References: <20180914135843.24899-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xuki=ma=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2Fc8-00081Y-Ak
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 13:00:24 +0000
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
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Julien Grall <julien.grall@arm.com>, Kevin Tian <kevin.tian@intel.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
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
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBbGwsCgpJIHJlYWxpemUgaXQn
cyBhIGJpdCBlYXJseSBmb3IgYSBwaW5nLCBidXQgdGhlIG1hc3RlciBicmFuY2ggaXMgc3R1Y2sg
YXQgYQpyZWdyZXNzaW9uIHRoaXMgcGF0Y2ggaXMgc3VwcG9zZWQgdG8gYWRkcmVzcy4gTWF5IEkg
dGhlcmVmb3JlIHBsZWFzZQphc2sgZm9yIHRpbWVseSByZXZpZXcgb2YgdGhpcyBwYXRjaD8KClRo
YW5rcywgSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
