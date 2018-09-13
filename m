From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v7 4/6] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Thu, 13 Sep 2018 06:48:00 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191301B87@SHSMSX101.ccr.corp.intel.com>
References: <20180912113028.19610-1-paul.durrant@citrix.com>
 <20180912113028.19610-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0io5=l3=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1g0LQt-0004jV-Uj
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 06:48:55 +0000
In-Reply-To: <20180912113028.19610-5-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0KPiBT
ZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxMiwgMjAxOCA3OjMwIFBNCj4gCj4gVGhpcyBwYXRj
aCByZW1vdmVzIHRoZSBpbXBsaWNpdCBkb21haW5fY3Jhc2goKSBmcm9tIGlvbW11X21hcCgpLAo+
IHVubWFwX3BhZ2UoKSBhbmQgaW9tbXVfaW90bGJfZmx1c2goKSBhbmQgdHVybnMgdGhlbSBpbnRv
Cj4gc3RyYWlnaHRmb3J3YXJkCj4gd3JhcHBlcnMgdGhhdCBjaGVjayB0aGUgZXhpc3RlbmNlIG9m
IHRoZSByZWxldmFudCBpb21tdV9vcCBhbmQgY2FsbAo+IHRocm91Z2ggdG8gaXQuIFRoaXMgbWFr
ZXMgdGhlbSB1c2FibGUgYnkgUFYgSU9NTVUgY29kZSB0byBiZSBkZWxpdmVyZWQKPiBpbgo+IGZ1
dHVyZSBwYXRjaGVzLgo+IFRoaXMgcGF0Y2ggYWRkcyBhIGhlbHBlciBtYWNybywgZG9tdV9jcmFz
aCgpLCB0aGF0IHdpbGwgb25seSBpbnZva2UKPiBkb21haW5fY3Jhc2goKSBpZiB0aGUgZG9tYWlu
IGlzIG5vdCB0aGUgaGFyZHdhcmUgZG9tYWluIGFuZCBtb2RpZmllcwo+IGNhbGxlcnMgb2YgaW9t
bXVfbWFwKCksIHVubWFwX3BhZ2UoKSBhbmQgaW9tbXVfaW90bGJfZmx1c2goKSB0byB1c2UKPiB0
aGlzCj4gc2hvdWxkIGFuIG9wZXJhdGlvbiBmYWlsLgo+IAo+IE5PVEU6IFRoaXMgcGF0Y2ggaW5j
bHVkZXMgb25lIGJpdCBvZiBjbGVhbi11cCBpbiBzZXRfaWRlbnRpdHlfcDJtX2VudHJ5KCkKPiAg
ICAgICByZXBsYWNpbmcgdXNlIG9mIHAybS0+ZG9tYWluIHdpdGggdGhlIGRvbWFpbiBwb2ludGVy
IHBhc3NlZCBpbnRvIHRoZQo+ICAgICAgIGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
