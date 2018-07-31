From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 1/4] iommu: remove unneeded return from
 iommu_hwdom_init
Date: Tue, 31 Jul 2018 07:19:20 +0000
Message-ID: <0391a24c1f744abe8e3d0a14ef3fd0eb@AMSPEX02CL03.citrite.net>
References: <20180727153149.25094-1-roger.pau@citrix.com>
 <20180727153149.25094-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xay/=kp=citrix.com=prvs=7434e2dac=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fkOwE-00056m-66
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 07:19:22 +0000
In-Reply-To: <20180727153149.25094-2-roger.pau@citrix.com>
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
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmDQo+IE9mIFJv
Z2VyIFBhdSBNb25uZQ0KPiBTZW50OiAyNyBKdWx5IDIwMTggMTY6MzINCj4gVG86IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPjsgUm9nZXIgUGF1IE1vbm5lDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVj
dDogW1hlbi1kZXZlbF0gW1BBVENIIDEvNF0gaW9tbXU6IHJlbW92ZSB1bm5lZWRlZCByZXR1cm4g
ZnJvbQ0KPiBpb21tdV9od2RvbV9pbml0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCg0KWWVhaCwgSSBub3RpY2VkIHRoaXMgdG9v
Li4uDQoNClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29t
Pg0KDQo+IC0tLQ0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0N
Cj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgfCAyICstDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvaW9tbXUuYw0KPiBpbmRleCAyYzQ0ZmFiZjk5Li43MGQyMThmOTEwIDEwMDY0NA0KPiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2lvbW11LmMNCj4gQEAgLTIwNyw3ICsyMDcsNyBAQCB2b2lkIF9faHdkb21faW5p
dCBpb21tdV9od2RvbV9pbml0KHN0cnVjdA0KPiBkb21haW4gKmQpDQo+ICAgICAgICAgICAgICAg
ICAgICAgZC0+ZG9tYWluX2lkLCByYyk7DQo+ICAgICAgfQ0KPiANCj4gLSAgICByZXR1cm4gaGQt
PnBsYXRmb3JtX29wcy0+aHdkb21faW5pdChkKTsNCj4gKyAgICBoZC0+cGxhdGZvcm1fb3BzLT5o
d2RvbV9pbml0KGQpOw0KPiAgfQ0KPiANCj4gIHZvaWQgaW9tbXVfdGVhcmRvd24oc3RydWN0IGRv
bWFpbiAqZCkNCj4gLS0NCj4gMi4xOC4wDQo+IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
