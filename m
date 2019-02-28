From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] xen-netback: fix occasional leak of grant
 ref mappings under memory pressure
Date: Thu, 28 Feb 2019 11:49:15 +0000
Message-ID: <271c9beb91a74ded8e62d1cfc540976c__47383.9926112973$1551354655$gmane$org@AMSPEX02CL02.citrite.net>
References: <1551319382-32595-1-git-send-email-igor.druzhinin@citrix.com>
 <8424fba34a1f43908a6dae3a9308863b@AMSPEX02CL02.citrite.net>
 <20190228110136.somjads2f5ivqhju@zion.uk.xensource.com>
 <e5ef3c0291854b67841b6c532f7651b9@AMSPEX02CL02.citrite.net>
 <447cd231-3ea4-e56d-29b0-6528804c9e9a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gZJR=RD=citrix.com=prvs=955235880=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gzKCO-000222-HL
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 11:50:00 +0000
In-Reply-To: <447cd231-3ea4-e56d-29b0-6528804c9e9a@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJZ29yIERydXpoaW5pbiBbbWFp
bHRvOmlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb21dDQo+IFNlbnQ6IDI4IEZlYnJ1YXJ5IDIwMTkg
MTE6NDQNCj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOw0KPiBkYXZlbUBkYXZlbWxvZnQubmV0DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhlbi1u
ZXRiYWNrOiBmaXggb2NjYXNpb25hbCBsZWFrIG9mIGdyYW50IHJlZiBtYXBwaW5ncyB1bmRlciBt
ZW1vcnkgcHJlc3N1cmUNCj4gDQo+IE9uIDI4LzAyLzIwMTkgMTE6MjEsIFBhdWwgRHVycmFudCB3
cm90ZToNCj4gPj4+IEBAIC0xMTUzLDYgKzExNTIsMTAgQEAgc3RhdGljIGludCB4ZW52aWZfdHhf
c3VibWl0KHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlKQ0KPiA+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBrZnJlZV9za2Ioc2tiKTsNCj4gPj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29udGludWU7DQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICB9
DQo+ID4+PiArDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAvKiBDb3BpZWQgYWxsIHRo
ZSBiaXRzIGZyb20gdGhlIGZyYWcgbGlzdC4gKi8NCj4gPj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHNrYl9mcmFnX2xpc3RfaW5pdChza2IpOw0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAga2ZyZWUobnNrYik7DQo+ID4+DQo+ID4+IEkgdGhpbmsgeW91IHdhbnQga2ZyZWVfc2tiIGhl
cmU/DQo+ID4NCj4gPiBOby4gbnNrYiBpcyB0aGUgZnJhZyBsaXN0Li4uIGl0IGlzIHVubGlua2Vk
IGZyb20gc2tiIGJ5IHRoZSBjYWxsIHRvIHNrYl9mcmFnX2xpc3RfaW5pdCgpIGFuZCB0aGVuIGl0
DQo+IGNhbiBiZSBmcmVlZCBvbiBpdHMgb3duLiBUaGUgc2tiIGlzIHdoYXQgd2UgbmVlZCB0byBy
ZXRhaW4sIGJlY2F1c2UgdGhhdCBub3cgY29udGFpbnMgYWxsIHRoZSBkYXRhLg0KPiA+DQo+IA0K
PiBBcmUgeW91IHNheWluZyBwcmV2aW91cyBjb2RlIGluIHhlbnZpZl9oYW5kbGVfZnJhZ19saXN0
KCkgaW5jb3JyZWN0bHkNCj4gY2FsbGVkIGtmcmVlX3NrYigpPw0KDQpObywgaXQgY29ycmVjdGx5
IGNhbGxlZCBrZnJlZV9za2IoKSBvbiBuc2tiIGluIHRoZSBzdWNjZXNzIGNhc2UuIFdoYXQgV2Vp
IGFuZCBteXNlbGYgd291bGQgcHJlZmVyIGlzIHRoYXQgd2UgaGF2ZSBhIHNpbmdsZSBwbGFjZSB0
aGF0IHRoZSBmcmFnIGxpc3QgaXMgZnJlZWQgaW4gYm90aCB0aGUgc3VjY2VzcyBhbmQgZXJyb3Ig
Y2FzZXMuDQoNCiAgUGF1bA0KDQo+IA0KPiBJZ29yDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
