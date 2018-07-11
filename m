From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 08/13] x86: add iommu_op to query
 reserved ranges
Date: Wed, 11 Jul 2018 12:21:33 +0000
Message-ID: <3a9724a45aa54ca9a757e5b0cb79888e@AMSPEX02CL03.citrite.net>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-9-paul.durrant@citrix.com>
 <dd660c29-f06c-ee5b-0063-2e0c4dd0099f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oywb=j3=citrix.com=prvs=72382d508=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fdE7l-00084U-DI
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 12:21:37 +0000
In-Reply-To: <dd660c29-f06c-ee5b-0063-2e0c4dd0099f@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIFttYWls
dG86Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tXQ0KPiBTZW50OiAxMSBKdWx5IDIwMTggMTE6MzQN
Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT47IEFuZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2Ug
RHVubGFwDQo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8SWFuLkph
Y2tzb25AY2l0cml4LmNvbT47IEtvbnJhZA0KPiBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdQ0KPiA8d2VpLmxpdTJAY2l0
cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwOC8xM10geDg2OiBhZGQgaW9tbXVf
b3AgdG8gcXVlcnkgcmVzZXJ2ZWQgcmFuZ2VzDQo+IA0KPiBPbiAwNy8wNy8yMDE4IDEyOjA1IFBN
LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gQEAgLTM1LDE3ICs5MywzMyBAQCBzdGF0aWMgdm9p
ZCBpb21tdV9vcCh4ZW5faW9tbXVfb3BfdCAqb3ApDQo+ID4NCj4gPiAgaW50IGRvX29uZV9pb21t
dV9vcCh4ZW5faW9tbXVfb3BfYnVmX3QgKmJ1ZikNCj4gPiAgew0KPiA+IC0gICAgeGVuX2lvbW11
X29wX3Qgb3A7DQo+ID4gKyAgICB4ZW5faW9tbXVfb3BfdCBvcCA9IHt9Ow0KPiA+ICsgICAgc2l6
ZV90IG9mZnNldDsNCj4gPiArICAgIHN0YXRpYyBjb25zdCBzaXplX3Qgb3Bfc2l6ZVtdID0gew0K
PiA+ICsgICAgICAgIFtYRU5fSU9NTVVPUF9xdWVyeV9yZXNlcnZlZF0gPSBzaXplb2Yoc3RydWN0
DQo+IHhlbl9pb21tdV9vcF9xdWVyeV9yZXNlcnZlZCksDQo+ID4gKyAgICB9Ow0KPiA+ICsNCj4g
PiArICAgIG9mZnNldCA9IG9mZnNldG9mKHN0cnVjdCB4ZW5faW9tbXVfb3AsIHUpOw0KPiA+DQo+
ID4gLSAgICBpZiAoIGJ1Zi0+c2l6ZSA8IHNpemVvZihvcCkgKQ0KPiA+ICsgICAgaWYgKCBidWYt
PnNpemUgPCBvZmZzZXQgKQ0KPiA+ICAgICAgICAgIHJldHVybiAtRUZBVUxUOw0KPiA+DQo+ID4g
LSAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdCgodm9pZCAqKSZvcCwgYnVmLT5oLCBzaXplb2Yob3Ap
KSApDQo+ID4gKyAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdCgodm9pZCAqKSZvcCwgYnVmLT5oLCBv
ZmZzZXQpICkNCj4gPiAgICAgICAgICByZXR1cm4gLUVGQVVMVDsNCj4gPg0KPiA+ICAgICAgaWYg
KCBvcC5wYWQgKQ0KPiA+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+DQo+ID4gKyAgICBp
ZiAoIG9wLm9wID49IEFSUkFZX1NJWkUob3Bfc2l6ZSkgKQ0KPiA+ICsgICAgICAgIHJldHVybiAt
RU9QTk9UU1VQUDsNCj4gPiArDQo+ID4gKyAgICBpZiAoIGJ1Zi0+c2l6ZSA8IG9mZnNldCArIG9w
X3NpemVbb3Aub3BdICkNCj4gPiArICAgICAgICByZXR1cm4gLUVGQVVMVDsNCj4gPiArDQo+ID4g
KyAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdF9vZmZzZXQoKHZvaWQgKikmb3AudSwgYnVmLT5oLCBv
ZmZzZXQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3Bfc2l6ZVtvcC5v
cF0pICkNCj4gPiArICAgICAgICByZXR1cm4gLUVGQVVMVDsNCj4gDQo+IFRoaXMgbG9va3MgbGlr
ZSBwYXJ0IG9mIGEgcG90ZW50aWFsIFNQMSBnYWRnZXQsIHNvIHRoaXMgbmVlZHMgdG8gdXNlDQo+
IGFycmF5X2luZGV4X25vc3BlYygpLg0KPiANCg0KT2suIFRoZXJlIGlzIHNpbWlsYXIgY29kZSBp
biBkbSBvcHMgdG9vIHNvIEknbGwgaGF2ZSBhIGxvb2sgd2hpbGUgSSdtIGF0IGl0Lg0KDQogIFBh
dWwNCg0KPiAgLUdlb3JnZQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
