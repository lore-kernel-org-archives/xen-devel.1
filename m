From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v2] x86/mm: Clean up p2m_finish_type_change
 return value
Date: Tue, 26 Feb 2019 09:17:39 +0000
Message-ID: <802ba74b-40eb-de90-3ff5-de743b3ff78b@bitdefender.com>
References: <20190117090635.23731-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v7ql=RB=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1gyYrw-0001Cz-Pg
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 09:17:44 +0000
In-Reply-To: <20190117090635.23731-1-aisaila@bitdefender.com>
Content-Language: en-US
Content-ID: <948B49EA6559B642960428631BDCE441@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UGluZy4gSXMgdGhpcyBvayB3aXRoIHlvdSwgR2VvcmdlPw0KDQpSZWdhcmRzLA0KQWxleA0KDQpP
biAxNy4wMS4yMDE5IDExOjA2LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4gQ2hh
bmdlZCB0aGUgcmV0dXJuIHZhbHVlIG9mIDEgdG8gMCBzbyBub3cgcDJtX2ZpbmlzaF90eXBlX2No
YW5nZSByZXR1cm5zDQo+IDAgZm9yIHN1Y2Nlc3Mgb3IgPDAgZm9yIGVycm9yLg0KPiBUaGUg4oCc
cm9vdOKAnSBjYWxsZXIgb2YgcDJtX2ZpbmlzaF90eXBlX2NoYW5nZSgpIGlzDQo+IFhFTl9ETU9Q
X21hcF9tZW1fdHlwZV90b19pb3JlcV9zZXJ2ZXIgYW5kIHRoaXMgZG9lcyBub3RoaW5nIHVzZWZ1
bCB3aXRoDQo+IHBvc2l0aXZlIHZhbHVlcy4NCj4gDQo+IFN1Z2dlc3RlZC1ieTogR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4NCj4gDQo+IC0tLQ0KPiBDaGFu
Z2VzIHNpbmNlIFYxOg0KPiAJLSBVcGRhdGUgY29tbWl0IG1lc3NhZ2UNCj4gCS0gTW92ZSByYyA9
IDAgYmVmb3JlIG91dCB0YWcuDQo+IC0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyB8IDEx
ICsrKy0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4v
YXJjaC94ODYvbW0vcDJtLmMNCj4gaW5kZXggZDE0Y2U1N2RkNS4uYTljMzY2YmI1ZSAxMDA2NDQN
Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0uYw0KPiBAQCAtMTE4OCwyMiArMTE4OCwxNyBAQCBpbnQgcDJtX2ZpbmlzaF90eXBlX2NoYW5n
ZShzdHJ1Y3QgZG9tYWluICpkLA0KPiAgICAgICAgICAgICAgIGlmICggZC0+YXJjaC5hbHRwMm1f
ZXB0cFtpXSAhPSBtZm5feChJTlZBTElEX01GTikgKQ0KPiAgICAgICAgICAgICAgIHsNCj4gICAg
ICAgICAgICAgICAgICAgc3RydWN0IHAybV9kb21haW4gKmFsdHAybSA9IGQtPmFyY2guYWx0cDJt
X3AybVtpXTsNCj4gLSAgICAgICAgICAgICAgICBpbnQgcmMxOw0KPiAgIA0KPiAgICAgICAgICAg
ICAgICAgICBwMm1fbG9jayhhbHRwMm0pOw0KPiAtICAgICAgICAgICAgICAgIHJjMSA9IGZpbmlz
aF90eXBlX2NoYW5nZShhbHRwMm0sIGZpcnN0X2dmbiwgbWF4X25yKTsNCj4gKyAgICAgICAgICAg
ICAgICByYyA9IGZpbmlzaF90eXBlX2NoYW5nZShhbHRwMm0sIGZpcnN0X2dmbiwgbWF4X25yKTsN
Cj4gICAgICAgICAgICAgICAgICAgcDJtX3VubG9jayhhbHRwMm0pOw0KPiAgIA0KPiAtICAgICAg
ICAgICAgICAgIGlmICggcmMxIDwgMCApDQo+IC0gICAgICAgICAgICAgICAgew0KPiAtICAgICAg
ICAgICAgICAgICAgICByYyA9IHJjMTsNCj4gKyAgICAgICAgICAgICAgICBpZiAoIHJjIDwgMCAp
DQo+ICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gLSAgICAgICAgICAgICAgICB9
DQo+IC0NCj4gLSAgICAgICAgICAgICAgICByYyB8PSByYzE7DQo+ICAgICAgICAgICAgICAgfQ0K
PiAgICAgICB9DQo+ICAgI2VuZGlmDQo+ICsgICAgcmMgPSAwOw0KPiAgIA0KPiAgICBvdXQ6DQo+
ICAgICAgIHAybV91bmxvY2soaG9zdHAybSk7DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
