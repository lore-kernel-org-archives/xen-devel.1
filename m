From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v7 4/6] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Thu, 13 Sep 2018 10:22:17 +0200
Message-ID: <20180913082217.xk6zd3v2ir4po3xa@mac.bytemobile.com>
References: <20180912113028.19610-1-paul.durrant@citrix.com>
 <20180912113028.19610-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m7pv=l3=citrix.com=prvs=787f1cd73=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g0MtN-0004bj-J2
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 08:22:25 +0000
Content-Disposition: inline
In-Reply-To: <20180912113028.19610-5-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTIsIDIwMTggYXQgMTI6MzA6MjZQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgaW1wbGljaXQgZG9tYWluX2NyYXNoKCkgZnJv
bSBpb21tdV9tYXAoKSwKPiB1bm1hcF9wYWdlKCkgYW5kIGlvbW11X2lvdGxiX2ZsdXNoKCkgYW5k
IHR1cm5zIHRoZW0gaW50byBzdHJhaWdodGZvcndhcmQKPiB3cmFwcGVycyB0aGF0IGNoZWNrIHRo
ZSBleGlzdGVuY2Ugb2YgdGhlIHJlbGV2YW50IGlvbW11X29wIGFuZCBjYWxsCj4gdGhyb3VnaCB0
byBpdC4gVGhpcyBtYWtlcyB0aGVtIHVzYWJsZSBieSBQViBJT01NVSBjb2RlIHRvIGJlIGRlbGl2
ZXJlZCBpbgo+IGZ1dHVyZSBwYXRjaGVzLgo+IFRoaXMgcGF0Y2ggYWRkcyBhIGhlbHBlciBtYWNy
bywgZG9tdV9jcmFzaCgpLCB0aGF0IHdpbGwgb25seSBpbnZva2UKPiBkb21haW5fY3Jhc2goKSBp
ZiB0aGUgZG9tYWluIGlzIG5vdCB0aGUgaGFyZHdhcmUgZG9tYWluIGFuZCBtb2RpZmllcwo+IGNh
bGxlcnMgb2YgaW9tbXVfbWFwKCksIHVubWFwX3BhZ2UoKSBhbmQgaW9tbXVfaW90bGJfZmx1c2go
KSB0byB1c2UgdGhpcwo+IHNob3VsZCBhbiBvcGVyYXRpb24gZmFpbC4KCkkgYXNzdW1lIHRoaXMg
aXMgYmVjYXVzZSBmdXR1cmUgdXNhZ2VzIG9mIGlvbW11X21hcCwgdW5tYXAgYW5kIGZsdXNoCndp
bGwgdG9sZXJhdGUgZmFpbHVyZSwgYW5kIHdpbGwgYmUgaGFuZGxlZCBkaWZmZXJlbnRseSB0aGFu
IGNyYXNoaW5nCnRoZSBkb21haW4uCgo+IE5PVEU6IFRoaXMgcGF0Y2ggaW5jbHVkZXMgb25lIGJp
dCBvZiBjbGVhbi11cCBpbiBzZXRfaWRlbnRpdHlfcDJtX2VudHJ5KCkKPiAgICAgICByZXBsYWNp
bmcgdXNlIG9mIHAybS0+ZG9tYWluIHdpdGggdGhlIGRvbWFpbiBwb2ludGVyIHBhc3NlZCBpbnRv
IHRoZQo+ICAgICAgIGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVu
L2luY2x1ZGUveGVuL3NjaGVkLmgKPiBpbmRleCAwYmE4MGNiMWE4Li5mMmM1OTRkMTk3IDEwMDY0
NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLmgKPiBAQCAtNjE2LDYgKzYxNiwxMSBAQCB2b2lkIF9fZG9tYWluX2NyYXNoKHN0cnVj
dCBkb21haW4gKmQpOwo+ICAgICAgX19kb21haW5fY3Jhc2goZCk7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgfSB3aGlsZSAoMCkKPiAgCj4g
KyNkZWZpbmUgZG9tdV9jcmFzaChkKSBkbyB7ICAgICAgICAgICAgICAgIFwKPiArICAgIGlmICgg
IWlzX2hhcmR3YXJlX2RvbWFpbihkKSApICAgICAgICAgXAo+ICsgICAgICAgIGRvbWFpbl9jcmFz
aChkKTsgICAgICAgICAgICAgICAgICBcCj4gK30gd2hpbGUgKGZhbHNlKQogICAgICAgICAgICBe
IG1pc3Npbmcgc3BhY2VzCj4gKwo+ICAvKgo+ICAgKiBDYWxsZWQgZnJvbSBhc3NlbWJseSBjb2Rl
LCB3aXRoIGFuIG9wdGlvbmFsIGFkZHJlc3MgdG8gaGVscCBpbmRpY2F0ZSB3aHkKPiAgICogdGhl
IGNyYXNoIG9jY3VyZWQuICBJZiBhZGRyIGlzIDAsIGxvb2sgdXAgYWRkcmVzcyBmcm9tIGxhc3Qg
ZXh0YWJsZQo+IC0tIAo+IDIuMTEuMAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
