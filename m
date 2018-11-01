From: Peng Fan <peng.fan@nxp.com>
Subject: Re: Does XEN ARM support RTC in domu?
Date: Thu, 1 Nov 2018 03:37:54 +0000
Message-ID: <AM0PR04MB44814D7E3A6A14BA18C9A93788CE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <AM0PR04MB44819354E4855B72C4C7F82388CD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <0c0ce589-d65f-429d-9a2f-dd267b949c29@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ltwp=nm=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1gI3ny-0001M8-Ql
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 03:37:59 +0000
In-Reply-To: <0c0ce589-d65f-429d-9a2f-dd267b949c29@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCBbbWFpbHRvOmp1bGllbi5ncmFsbEBhcm0uY29tXQ0KPiBTZW50OiAyMDE45bm0MTHm
nIgx5pelIDI6NTINCj4gVG86IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBEb2VzIFhFTiBBUk0gc3VwcG9ydCBSVEMgaW4g
ZG9tdT8NCj4gDQo+IA0KPiANCj4gT24gMTAvMzEvMTggMTo1NyBQTSwgUGVuZyBGYW4gd3JvdGU6
DQo+ID4gSGkgQWxsLA0KPiANCj4gSGksDQo+IA0KPiA+DQo+ID4gSnVzdCBoYXZlIGEgcXVlc3Rp
b24sIGRvZXMgWEVOIEFSTSBzdXBwb3J0IFJUQyBpbiBkb211PyBUbyBzdXBwb3J0IEFuZHJvaWQN
Cj4gaW4gRG9tVSwgUlRDIGlzIG5lZWRlZCBmb3IgYWxhcm0sIGJ1dCBJIGRpZCBub3QgZmluZCBp
bmZvcm1hdGlvbiBhYm91dCBSVEMgb24NCj4geGVuIGZvciBkb211LiBTbyB0aGlzIG5lZWQgYSBu
ZXcgUlRDIHBhcmF2aXJ0dWFsaXphdGlvbiBkcml2ZXI/IEFueSBzdWdnZXN0aW9ucz8NCj4gDQo+
IEJ5IFJUQywgZG8geW91IG1lYW4gUmVhbC1UaW1lIENsb2NrPyBTb21ldGhpbmcgbGlrZSBQTDAz
MT8gT3IgZG8geW91IGhhdmUNCj4gc29tZXRoaW5nIGVsc2UgaW4gbWluZD8NCg0KWWVzLCBSZWFs
IFRpbWUgQ2xvY2sgbGlrZSBQTDAzMSBpbiBEb21VLiBJIGRvIG5vdCBoYXZlIGEgZ29vZCBpZGVh
IHN1cHBvcnQgUlRDIGluIEFSTSBEb21VLA0KS1ZNIGFuZCBYRU4geDg2IHNlZW1zIHVzZSBlbXVs
YXRlZCBSVEMgaW4gcWVtdS4gVGhpbmtpbmcgb2YgcGFyYXZpcnR1YWwgUlRDLCBhbmQgZG9tMA0K
Y29udHJvbCB0aGUgZXhwaXJlIHRpbWUgZm9yIGFsYXJtLg0KDQpUaGFua3MsDQpQZW5nLg0KDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
