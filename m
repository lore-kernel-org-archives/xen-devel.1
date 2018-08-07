From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v5 12/15] x86: add iommu_op to enable
 modification of IOMMU mappings
Date: Tue, 7 Aug 2018 09:22:08 +0000
Message-ID: <105705dc439844e782267eccae9a9be6@AMSPEX02CL03.citrite.net>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-13-paul.durrant@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AC265@SHSMSX101.ccr.corp.intel.com>
 <e8d453fd38d74526b6e07040f5362030@AMSPEX02CL03.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AE9E2@SHSMSX101.ccr.corp.intel.com>
 <ef80132eb1764ed686ad7d6de6444387@AMSPEX02CL03.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AEACC@SHSMSX101.ccr.corp.intel.com>
 <401d6969636b4158966b786ea184d5d2@AMSPEX02CL03.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AEBA5@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ay9j=kw=citrix.com=prvs=750b60ad6=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fmyC3-0000Mp-FS
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 09:22:19 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D1912AEBA5@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Tian <kevin.tian@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaWFuLCBLZXZpbiBbbWFpbHRv
OmtldmluLnRpYW5AaW50ZWwuY29tXQ0KPiBTZW50OiAwNyBBdWd1c3QgMjAxOCAxMDoyMA0KPiBU
bzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPjsgV2VpIExpdQ0KPiA8d2VpLmxpdTJAY2l0cml4LmNvbT47IEFuZHJldyBDb29w
ZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBUaW0NCj4gKFhlbi5vcmcpIDx0aW1AeGVu
Lm9yZz47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47DQo+IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+OyBJYW4NCj4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4NCj4gU3ViamVj
dDogUkU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NSAxMi8xNV0geDg2OiBhZGQgaW9tbXVfb3AgdG8g
ZW5hYmxlDQo+IG1vZGlmaWNhdGlvbiBvZiBJT01NVSBtYXBwaW5ncw0KPiANCj4gPiBGcm9tOiBQ
YXVsIER1cnJhbnQgW21haWx0bzpQYXVsLkR1cnJhbnRAY2l0cml4LmNvbV0NCj4gPiBTZW50OiBU
dWVzZGF5LCBBdWd1c3QgNywgMjAxOCA1OjEyIFBNDQo+ID4NCj4gPg0KPiA+ID4gU28gaGVyZSBj
dXJyZW50IHZlcnNpb24gcHZJT01NVSBvbmx5IHByb3ZpZGVzIGdsb2JhbCBhZGRyZXNzIHNwYWNl
LA0KPiA+ID4gdGhvdWdoIHVubGlrZSBhbnkgZXhpc3RpbmcgSU9NTVUuIG1heWJlIHdlIHNob3Vs
ZCBleHBsaWNpdGx5IGNhbGwgb3V0DQo+ID4gPiB0aGlzIGZhY3QgaW4gc29tZSBjYXBhYmlsaXR5
IGZpZWxkIGZvciBmdXR1cmUgZXh0ZW5zaW9uLg0KPiA+ID4NCj4gPg0KPiA+IERvZXMgTGludXgg
ZXhwb3NlIHN1Y2ggYSB0aGluZyB0aHJvdWdoIHRoZSBkbWFfb3BzPyBJIGRpZG4ndCBzZWUgb25l
LCBidXQNCj4gPiBpZiB0aGVyZSBpcyBvbmUgdGhlbiB3ZSBjYW4gb2YgY291cnNlIHNldCBpdCBj
b3JyZWN0bHkgYWNjb3JkaW5nIHRvIHRoZQ0KPiA+IGxpbWl0YXRpb25zIG9mIHRoZSB1bmRlcnlp
bmcgaHlwZXJ2aXNvci4gVGh1cywgaWYgWGVuIGlzIG1vZGlmaWVkIGluIGZ1dHVyZSB0bw0KPiA+
IHN1cHBvcnQgcGVyLWRldmljZSBtYXBwaW5ncywgdGhpcyBjb3VsZCBiZSBleHBvc2VkIHRocm91
Z2ggdG8gdGhlIGRyaXZlcnMNCj4gPiB1c2luZyBETUEuDQo+ID4NCj4gDQo+IG5vdCBhYm91dCBM
aW51eCBpbnRlcm5hbCBleHBvc2luZy4gaXQncyBhYm91dCBoeXBlcnZpc29yIGV4cG9zaW5nDQo+
IHRoZSBjYXBhYmlsaXR5IHRvIHB2SU9NTVUgZHJpdmVyLCBzbyB0aGUgbGF0dGVyIGtub3dzIHdo
ZXRoZXIgdG8NCj4gZW5hYmxlIHBlci1kZXZpY2UgbWFwcGluZy4gQnV0IGFzIHlvdSBjb21tZW50
ZWQgaW4gYW5vdGhlcg0KPiBtYWlsLCBpdCBjb3VsZCBiZSBhY2hpZXZlZCB0aHJvdWdoIGVuYWJs
aW5nIHNlcXVlbmNlLg0KPiANCg0KT2suIExldCdzIGdvIHdpdGggdGhhdCB0aGVuLg0KDQo+IGJ0
dyBjb3VsZCB5b3UgcHV0IGNsYXJpZmljYXRpb24gYWNjb3JkaW5nIHRvIG91ciBkaXNjdXNzaW9u
cyBpbiB5b3VyDQo+IG5leHQgdmVyc2lvbiBjb3ZlcmxldHRlciB0byBzZXQgdGhlIHRvbmUgY2xl
YXIgZnJvbSBzdGFydD8gSSBkb24ndA0KPiB0aGluayBJJ2xsIGJlIHRoZSBvbmx5IG9uZSBpbnRl
cnByZXRpbmcgd3JvbmcgZ29hbCBmb3IgdGhpcyB3b3JrLiA6LSkNCj4gDQoNCkkgY2FuIGNlcnRh
aW5seSBkbyB0aGF0LiBJJ2xsIHB1dCBhbiBleHBsYW5hdGlvbiBvZiB0aGUgWGVuU2VydmVyIHVz
ZS1jYXNlIGluIGFzIGEgY29uY3JldGUgZXhhbXBsZSB0b28uDQoNCiAgUGF1bA0KDQo+IFRoYW5r
cw0KPiBLZXZpbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
