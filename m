From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v19 06/11] x86/hvm/ioreq: add a new mappable
 resource type...
Date: Tue, 3 Apr 2018 14:10:48 +0000
Message-ID: <948ac71931c040a7903ff1bf14f30945@AMSPEX02CL03.citrite.net>
References: <20180329153616.2929-1-paul.durrant@citrix.com>
 <20180329153616.2929-7-paul.durrant@citrix.com>
 <ef33cb19-0b77-6434-7d0b-916a7da5f3d8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+x/b=gy=citrix.com=prvs=6242dc2aa=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1f3MgY-0001jH-Gt
 for xen-devel@lists.xenproject.org; Tue, 03 Apr 2018 14:13:18 +0000
In-Reply-To: <ef33cb19-0b77-6434-7d0b-916a7da5f3d8@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgW21haWx0
bzpqdWxpZW4uZ3JhbGxAYXJtLmNvbV0NCj4gU2VudDogMDMgQXByaWwgMjAxOCAxNTowOA0KPiBU
bzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsg
R2VvcmdlIER1bmxhcA0KPiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT47IEFuZHJldw0KPiBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJp
eC5jb20+OyBJYW4gSmFja3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IEtvbnJhZCBS
emVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbQ0KPiAoWGVuLm9yZykgPHRpbUB4ZW4u
b3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxOSAwNi8xMV0geDg2L2h2bS9pb3JlcTogYWRk
IGEgbmV3IG1hcHBhYmxlDQo+IHJlc291cmNlIHR5cGUuLi4NCj4gDQo+IEhpIFBhdWwsDQo+IA0K
PiBPbiAyOS8wMy8xOCAxNjozNiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgNCj4g
PiBpbmRleCBhMGU5MjJmMzYwLi44Y2RkZjQ4NGQ4IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNs
dWRlL2FzbS1hcm0vbW0uaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaA0KPiA+
IEBAIC0zNzQsNiArMzc0LDE0IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwdXRfcGFnZV9hbmRfdHlw
ZShzdHJ1Y3QNCj4gcGFnZV9pbmZvICpwYWdlKQ0KPiA+DQo+ID4gICB2b2lkIGNsZWFyX2FuZF9j
bGVhbl9wYWdlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UpOw0KPiA+DQo+ID4gK3N0YXRpYyBpbmxp
bmUgaW50IGFyY2hfYWNxdWlyZV9yZXNvdXJjZSgNCj4gDQo+IEkgd291bGQgbXVjaCBwcmVmZXIg
dG8gc2VlICJzdGF0aWMgaW5saW5lIiBvbiBhIHNlcGFyYXRlIGxpbmUgYW5kIGdldA0KPiB0aGUg
cGFyYW1ldGVycyBjb3JyZWN0bHkgaW5kZW50ZWQuDQo+IA0KPiBXaXRoIHRoYXQ6DQo+IA0KPiBB
Y2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4gDQoNClRoYW5r
cy4gQ2FuIHRoZSBmb3JtYXR0aW5nIGJlIGZpeGVkIG9uIGNvbW1pdCBwbGVhc2U/DQoNCiAgUGF1
bA0KDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
