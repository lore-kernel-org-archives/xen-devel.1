From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2] iommu: setup inclusive mappings before
 enabling iommu
Date: Wed, 19 Sep 2018 05:32:57 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19130EF65@SHSMSX101.ccr.corp.intel.com>
References: <20180914135843.24899-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+ech=mb=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1g2V6p-0000jg-07
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 05:33:07 +0000
In-Reply-To: <20180914135843.24899-1-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgW21haWx0bzpyb2dlci5wYXVAY2l0cml4LmNvbV0NCj4g
U2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMTQsIDIwMTggOTo1OSBQTQ0KPiANCj4gT3IgZWxzZSBp
dCBjYW4gbGVhZCB0byBmcmVlemVzIHdoZW4gZW5hYmxpbmcgdGhlIGlvbW11IG9uIGNlcnRhaW4N
Cj4gSW50ZWwgaGFyZHdhcmU6DQo+IA0KPiBbLi4uXQ0KPiAoWEVOKSBFTEY6IGFkZHJlc3NlczoN
Cj4gKFhFTikgICAgIHZpcnRfYmFzZSAgICAgICAgPSAweGZmZmZmZmZmODAwMDAwMDANCj4gKFhF
TikgICAgIGVsZl9wYWRkcl9vZmZzZXQgPSAweDANCj4gKFhFTikgICAgIHZpcnRfb2Zmc2V0ICAg
ICAgPSAweGZmZmZmZmZmODAwMDAwMDANCj4gKFhFTikgICAgIHZpcnRfa3N0YXJ0ICAgICAgPSAw
eGZmZmZmZmZmODEwMDAwMDANCj4gKFhFTikgICAgIHZpcnRfa2VuZCAgICAgICAgPSAweGZmZmZm
ZmZmODI5NTMwMDANCj4gKFhFTikgICAgIHZpcnRfZW50cnkgICAgICAgPSAweGZmZmZmZmZmODI3
NGUxODANCj4gKFhFTikgICAgIHAybV9iYXNlICAgICAgICAgPSAweDgwMDAwMDAwMDANCj4gKFhF
TikgIFhlbiAga2VybmVsOiA2NC1iaXQsIGxzYiwgY29tcGF0MzINCj4gKFhFTikgIERvbTAga2Vy
bmVsOiA2NC1iaXQsIFBBRSwgbHNiLCBwYWRkciAweDEwMDAwMDAgLT4gMHgyOTUzMDANCj4gPGZy
ZWV6ZT4NCj4gDQo+IFRoaXMgcmVzdG9yZXMgdGhlIGJlaGF2aW9yIGJlZm9yZSBjb21taXQgNjZh
OTI3NGNjMzQzNSB0aGF0IGNoYW5nZWQNCj4gdGhlIG9yZGVyIGFuZCBlbmFibGVkIHRoZSBpb21t
dSB3aXRob3V0IGhhdmluZyB0aGUgaW5jbHVzaXZlIG1hcHBpbmdzDQo+IHNldHVwLg0KPiANCj4g
Tm90ZSB0aGF0IG9uIEFNRCBoYXJkd2FyZSB0aGUgb3JkZXIgaXMgYWxzbyBjaGFuZ2VkIHRvIGFk
ZCBpbmNsdXNpdmUNCj4gbWFwcGluZ3MgYmVmb3JlIGFkZGluZyBhbnkgZGV2aWNlcy4NCj4gDQo+
IFJlcG9ydGVkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KUmV2
aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
