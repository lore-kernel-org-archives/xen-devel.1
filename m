From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] iommu: fix arm build after e9be34be5
Date: Wed, 10 Oct 2018 08:59:21 +0000
Message-ID: <bf56e8b6aa8945f694f0f8e8619b498f@AMSPEX02CL03.citrite.net>
References: <20181009185812.9597-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tmyd=mw=citrix.com=prvs=814b5ca87=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gAAL0-0001Yo-4y
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 08:59:26 +0000
In-Reply-To: <20181009185812.9597-1-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmDQo+IE9mIFdl
aSBMaXUNCj4gU2VudDogMDkgT2N0b2JlciAyMDE4IDE5OjU4DQo+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlcg0KPiBQYXUgTW9ubmUgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0hdIGlvbW11OiBm
aXggYXJtIGJ1aWxkIGFmdGVyIGU5YmUzNGJlNQ0KPiANCj4gVGhlIGZ1bmN0aW9uIGlvbW11X3No
YXJlX3AybV90YWJsZSBpcyB1c2VkIGJ5IGJvdGggQVJNIGFuZCB4ODYgYnV0DQo+IGhhcF9lbmFi
bGVkIG1hY3JvIGlzIHg4NiBvbmx5LiBQdXQgdGhlIEFTU0VSVCB1bmRlciBDT05GSUdfWDg2Lg0K
DQpXb3VsZCBpdCBiZSB1bnJlYXNvbmFibGUgdG8gbWFrZSBoYXBfZW5hYmxlZCgpIGNvbW1vbiBh
bmQgZGVmaW5lIGl0IHRvIHRydWUgZm9yIEFSTT8NCg0KICBQYXVsDQoNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiAgeGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvaW9tbXUuYyB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21t
dS5jDQo+IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPiBpbmRleCBlMDNkZTZl
M2FiLi44YjQzOGFlNGJjIDEwMDY0NA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4gQEAgLTUw
NSw3ICs1MDUsOSBAQCBpbnQgaW9tbXVfZG9fZG9tY3RsKA0KPiANCj4gIHZvaWQgaW9tbXVfc2hh
cmVfcDJtX3RhYmxlKHN0cnVjdCBkb21haW4qIGQpDQo+ICB7DQo+ICsjaWZkZWYgQ09ORklHX1g4
Ng0KPiAgICAgIEFTU0VSVChoYXBfZW5hYmxlZChkKSk7DQo+ICsjZW5kaWYNCj4gICAgICAvKg0K
PiAgICAgICAqIGlvbW11X3VzZV9oYXBfcHQoZCkgY2Fubm90IGJlIHVzZWQgaGVyZSBiZWNhdXNl
IGR1cmluZyBkb21haW4NCj4gICAgICAgKiBjb25zdHJ1Y3Rpb24gbmVlZF9pb21tdShkKSB3aWxs
IGFsd2F5cyByZXR1cm4gZmFsc2UgaGVyZS4NCj4gLS0NCj4gMi4xMS4wDQo+IA0KPiANCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVs
IG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
