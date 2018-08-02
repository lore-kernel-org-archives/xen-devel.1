From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 3/5] iommu: make iommu_inclusive_mapping
 a suboption of dom0-iommu
Date: Thu, 2 Aug 2018 07:58:48 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19129162C@SHSMSX101.ccr.corp.intel.com>
References: <20180801110340.67695-1-roger.pau@citrix.com>
 <20180801110340.67695-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wuhy=kr=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fl8W0-0001mj-Ru
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 07:59:20 +0000
In-Reply-To: <20180801110340.67695-4-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4LmNvbV0NCj4g
U2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMSwgMjAxOCA3OjA0IFBNDQo+IA0KPiBJbnRyb2R1Y2Ug
YSBuZXcgZG9tMC1pb21tdT1pbmNsdXNpdmUgZ2VuZXJpYyBvcHRpb24gdGhhdCBzdXBlcnNlZGVz
DQo+IGlvbW11X2luY2x1c2l2ZV9tYXBwaW5nLiBUaGUgcHJldmNpb3VzIGJlaGF2aW91ciBpcyBw
cmVzZXJ2ZWQgYW5kIHRoZQ0KPiBvcHRpb24gc2hvdWxkIG9ubHkgYmUgZW5hYmxlZCBieSBkZWZh
dWx0IG9uIEludGVsIGhhcmR3YXJlLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5k
ZWQuDQoNCnRoZXJlIGlzIGZ1bmN0aW9uYWwgY2hhbmdlLiBPcmlnaW5hbCBjb25kaXRpb24gaXM6
DQoNCiAtICAgIGlmICggIWlvbW11X2RvbTBfcGFzc3Rocm91Z2ggJiYgaXNfcHZfZG9tYWluKGQp
ICkNCiAtICAgIHsNCiAtICAgICAgICAvKiBTZXQgdXAgMToxIHBhZ2UgdGFibGUgZm9yIGhhcmR3
YXJlIGRvbWFpbi4gKi8NCiAtICAgICAgICB2dGRfc2V0X2h3ZG9tX21hcHBpbmcoZCk7DQogLSAg
ICB9DQoJDQpOb3cgaXQgaXMgYWx3YXlzIGNhbGxlZC4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2Vz
IHNpbmNlIHYxOg0KPiAgLSBVc2UgZG9tMC1pb21tdSBpbnN0ZWFkIG9mIHRoZSBpb21tdSBvcHRp
b24uDQo+ICAtIE9ubHkgZW5hYmxlIGJ5IGRlZmF1bHQgb24gSW50ZWwgaGFyZHdhcmUuDQoNClsu
Li5dDQo+IA0KPiArdm9pZCBfX2h3ZG9tX2luaXQgYXJjaF9pb21tdV9od2RvbV9pbml0KHN0cnVj
dCBkb21haW4gKmQpDQo+ICt7DQo+ICsgICAgdW5zaWduZWQgbG9uZyBpLCB0b3AsIG1heF9wZm47
DQo+ICsNCj4gKyAgICBCVUdfT04oIWlzX2hhcmR3YXJlX2RvbWFpbihkKSk7DQo+ICsNCj4gKyAg
ICAvKiBTZXQgdGhlIGRlZmF1bHQgdmFsdWUgb2YgaW5jbHVzaXZlIGRlcGVuZGluZyBvbiB0aGUg
aGFyZHdhcmUuICovDQo+ICsgICAgaWYgKCBpb21tdV9kb20wX2luY2x1c2l2ZSA9PSAtMSApDQo+
ICsgICAgICAgIGlvbW11X2RvbTBfaW5jbHVzaXZlID0gYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9y
ID09DQo+IFg4Nl9WRU5ET1JfSU5URUw7DQo+ICsNCg0KSSBkb24ndCBsaWtlIGFib3ZlIHN0eWxl
LiANCg0KYnR3IEl0J3MgYmV0dGVyIHRvIHNldCBpdCBpbiBpbnRlbF9pb21tdV9od2RvbV9pbml0
Lg0KDQpUaGFua3MNCktldmluDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
