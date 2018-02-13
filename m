From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 5/7] public / x86: introduce
 __HYPERCALL_iommu_op
Date: Tue, 13 Feb 2018 06:43:19 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191002712@SHSMSX101.ccr.corp.intel.com>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xgkp=fh=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1elUJN-0002dp-PX
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 06:43:29 +0000
In-Reply-To: <20180212104714.1922-6-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQNCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAxMiwgMjAxOCA2
OjQ3IFBNDQo+IA0KPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgdGhlIGJvaWxlcnBsYXRlIGZvciBh
IG5ldyBoeXBlcmNhbGwgdG8gYWxsb3cgYQ0KPiBkb21haW4gdG8gY29udHJvbCBJT01NVSBtYXBw
aW5ncyBmb3IgaXRzIG93biBwYWdlcy4NCj4gV2hpbHN0IHRoZXJlIGlzIGR1cGxpY2F0aW9uIG9m
IGNvZGUgYmV0d2VlbiB0aGUgbmF0aXZlIGFuZCBjb21wYXQgZW50cnkNCj4gcG9pbnRzIHdoaWNo
IGFwcGVhcnMgcmlwZSBmb3Igc29tZSBmb3JtIG9mIGNvbWJpbmF0aW9uLCBJIHRoaW5rIGl0IGlz
DQo+IGJldHRlciB0byBtYWludGFpbiB0aGUgc2VwYXJhdGlvbiBhcy1pcyBiZWNhdXNlIHRoZSBj
b21wYXQgZW50cnkgcG9pbnQNCj4gd2lsbCBuZWNlc3NhcmlseSBnYWluIGNvbXBsZXhpdHkgaW4g
c3Vic2VxdWVudCBwYXRjaGVzLg0KPiANCj4gTk9URTogVGhpcyBoeXBlcmNhbGwgaXMgb25seSBp
bXBsZW1lbnRlZCBmb3IgeDg2IGFuZCBpcyBjdXJyZW50bHkNCj4gICAgICAgcmVzdHJpY3RlZCBi
eSBYU00gdG8gZG9tMCBzaW5jZSBpdCBjb3VsZCBiZSB1c2VkIHRvIGNhdXNlIElPTU1VDQo+ICAg
ICAgIGZhdWx0cyB3aGljaCBtYXkgYnJpbmcgZG93biBhIGhvc3QuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KWy4uLl0NCj4gKw0K
PiArDQo+ICtzdGF0aWMgYm9vbCBjYW5fY29udHJvbF9pb21tdSh2b2lkKQ0KPiArew0KPiArICAg
IHN0cnVjdCBkb21haW4gKmN1cnJkID0gY3VycmVudC0+ZG9tYWluOw0KPiArDQo+ICsgICAgLyoN
Cj4gKyAgICAgKiBJT01NVSBtYXBwaW5ncyBjYW5ub3QgYmUgbWFuaXB1bGF0ZWQgaWY6DQo+ICsg
ICAgICogLSB0aGUgSU9NTVUgaXMgbm90IGVuYWJsZWQgb3IsDQo+ICsgICAgICogLSB0aGUgSU9N
TVUgaXMgcGFzc2VkIHRocm91Z2ggb3IsDQo+ICsgICAgICogLSBzaGFyZWQgRVBUIGNvbmZpZ3Vy
ZWQgb3IsDQo+ICsgICAgICogLSBYZW4gaXMgbWFpbnRhaW5pbmcgYW4gaWRlbnRpdHkgbWFwLg0K
DQoiZm9yIGRvbTAiDQoNCj4gKyAgICAgKi8NCj4gKyAgICBpZiAoICFpb21tdV9lbmFibGVkIHx8
IGlvbW11X3Bhc3N0aHJvdWdoIHx8DQo+ICsgICAgICAgICBpb21tdV91c2VfaGFwX3B0KGN1cnJk
KSB8fCBuZWVkX2lvbW11KGN1cnJkKSApDQoNCkkgZ3Vlc3MgaXQncyBjbGVhcmVyIHRvIGRpcmVj
dGx5IGNoZWNrIGlvbW11X2RvbTBfc3RyaWN0IGhlcmUNCg0KPiArICAgICAgICByZXR1cm4gZmFs
c2U7DQo+ICsNCj4gKyAgICByZXR1cm4gdHJ1ZTsNCj4gK30NCg0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
