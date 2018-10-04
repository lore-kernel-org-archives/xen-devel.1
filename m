From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v14 9/9] mm / iommu: split need_iommu() into
 has_iommu_pt() and need_iommu_pt_sync()
Date: Thu, 4 Oct 2018 18:15:42 +0100
Message-ID: <b8cb7f69-3144-8c4c-61bc-3fda8efaf0b2@arm.com>
References: <20181004104547.32316-1-paul.durrant@citrix.com>
 <20181004104547.32316-10-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qrui=mq=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g87E4-00074l-Ps
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 17:15:48 +0000
In-Reply-To: <20181004104547.32316-10-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUGF1bCwKCk9uIDA0LzEwLzIwMTggMTE6NDUsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGUg
bmFtZSAnbmVlZF9pb21tdSgpJyBpcyBhIGxpdHRsZSBjb25mdXNpbmcgYXMgaXQgc3VnZ2VzdHMg
YSBkb21haW4gbmVlZHMKPiB0byB1c2UgdGhlIElPTU1VIGJ1dCBzb21ldGhpbmcgbWlnaHQgbm90
IGJlIHNldCB1cCB5ZXQsIHdoZW4gaW4gZmFjdCBpdAo+IHJlcHJlc2VudHMgYSB0cmktc3RhdGUg
dmFsdWUgKG5vdCBhIGJvb2xlYW4gYXMgbWlnaHQgYmUgZXhwZWN0ZWQpIHdoZXJlCj4gLTEgbWVh
bnMgJ0lPTU1VIG1hcHBpbmdzIGJlaW5nIHNldCB1cCcgYW5kIDEgbWVhbnMgJ0lPTU1VIG1hcHBp
bmdzIGhhdmUKPiBiZWVuIGZ1bGx5IHNldCB1cCcuCj4gCj4gVHdvIGRpZmZlcmVudCBtZWFuaW5n
cyBhcmUgYWxzbyBpbmZlcnJlZCBmcm9tIHRoZSBtYWNybyBpdCBpbiB2YXJpb3VzCj4gcGxhY2Vz
IGluIHRoZSBjb2RlOgo+IAo+IC0gU29tZSBjYWxsZXJzIHdhbnQgdG8gdGVzdCB3aGV0aGVyIGEg
ZG9tYWluIGhhcyBJT01NVSBtYXBwaW5ncyBhdCBhbGwKPiAtIFNvbWUgY2FsbGVycyB3YW50IHRv
IHRlc3Qgd2hldGhlciB0aGV5IG5lZWQgdG8gc3luY2hyb25pemUgdGhlIGRvbWFpbidzCj4gICAg
UDJNIGFuZCBJT01NVSBtYXBwaW5ncwo+IAo+IFRoaXMgcGF0Y2ggcmVwbGFjZXMgdGhlICduZWVk
X2lvbW11JyB0cmktc3RhdGUgdmFsdWUgd2l0aCBhIGRlZmluZWQKPiBlbnVtZXJhdGlvbiBhbmQg
YWRkcyBhIGJvb2xlYW4gZmxhZyAnbmVlZF9zeW5jJyB0byBzZXBhcmF0ZSB0aGVzZSBtZWFuaW5n
cywKPiBhbmQgcGxhY2VzIGJvdGggb2YgdGhlc2UgaW4gc3RydWN0IGRvbWFpbl9pb21tdSwgcmF0
aGVyIHRoYW4gZGlyZWN0bHkgaW4KPiBzdHJ1Y3QgZG9tYWluLgo+IFRoaXMgcGF0Y2ggYWxzbyBj
cmVhdGVzIHR3byBuZXcgYm9vbGVhbiBtYWNyb3M6Cj4gCj4gLSAnaGFzX2lvbW11X3B0KCknIGV2
YWx1YXRlcyB0byB0cnVlIGlmIGEgZG9tYWluIGhhcyBJT01NVSBtYXBwaW5ncywgZXZlbgo+ICAg
IGlmIHRoZXkgYXJlIHN0aWxsIHVuZGVyIGNvbnN0cnVjdGlvbi4KPiAtICduZWVkX2lvbW11X3B0
X3N5bmMoKScgZXZhbHVhdGVzIHRvIHRydWUgaWYgYSBkb21haW4gcmVxdWlyZXMgZXhwbGljaXQK
PiAgICBzeW5jaHJvbml6YXRpb24gb2YgdGhlIFAyTSBhbmQgSU9NTVUgbWFwcGluZ3MuCj4gCj4g
QWxsIGNhbGxlcnMgb2YgbmVlZF9pb21tdSgpIGFyZSB0aGVuIG1vZGlmaWVkIHRvIHVzZSB0aGUg
bWFjcm8gYXBwcm9wcmlhdGUKPiB0byB3aGF0IHRoZXkgYXJlIHRyeWluZyB0byB0ZXN0LCBleGNl
cHQgZm9yIHRoZSBpbnN0YW5jZSBpbgo+IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jOmFz
c2lnbl9kZXZpY2UoKSB3aGljaCBoYXMgc2ltcGx5IGJlZW4KPiByZW1vdmVkIHNpbmNlIGl0IGFw
cGVhcnMgdG8gYmUgdW5uZWNlc3NhcnkuCj4gCj4gTk9URTogVGhlcmUgYXJlIHNvbWUgY2FsbGVy
cyBvZiBuZWVkX2lvbW11KCkgdGhhdCBzdHJpY3RseSBvcGVyYXRlIG9uCj4gICAgICAgIHRoZSBo
YXJkd2FyZSBkb21haW4uIEluIHNvbWUgb2YgdGhlc2UgY2FzZSBhIG1vcmUgZ2xvYmFsIGZsYWcg
aXMKPiAgICAgICAgdXNlZCBpbnN0ZWFkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8
cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KCkZvciB0aGUgQXJtIGJpdHM6CgpBY2tlZC1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
