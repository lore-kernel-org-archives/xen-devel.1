From: Peng Fan <peng.fan@nxp.com>
Subject: Re: Does XEN ARM support RTC in domu?
Date: Mon, 5 Nov 2018 02:11:18 +0000
Message-ID: <AM0PR04MB448159C762A0CF5FD4B51AD388CA0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <AM0PR04MB44819354E4855B72C4C7F82388CD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <0c0ce589-d65f-429d-9a2f-dd267b949c29@arm.com>
 <AM0PR04MB44814D7E3A6A14BA18C9A93788CE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <009ad6b6-f2f3-9e53-6ab4-bb712feb7dfd@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mezv=nq=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1gJUMM-0000CD-Vl
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 02:11:23 +0000
In-Reply-To: <009ad6b6-f2f3-9e53-6ab4-bb712feb7dfd@arm.com>
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

SGkgSnVsaWVuLA0KDQo+ID4+DQo+ID4+Pg0KPiA+Pj4gSnVzdCBoYXZlIGEgcXVlc3Rpb24sIGRv
ZXMgWEVOIEFSTSBzdXBwb3J0IFJUQyBpbiBkb211PyBUbyBzdXBwb3J0DQo+ID4+PiBBbmRyb2lk
DQo+ID4+IGluIERvbVUsIFJUQyBpcyBuZWVkZWQgZm9yIGFsYXJtLCBidXQgSSBkaWQgbm90IGZp
bmQgaW5mb3JtYXRpb24NCj4gPj4gYWJvdXQgUlRDIG9uIHhlbiBmb3IgZG9tdS4gU28gdGhpcyBu
ZWVkIGEgbmV3IFJUQyBwYXJhdmlydHVhbGl6YXRpb24gZHJpdmVyPw0KPiBBbnkgc3VnZ2VzdGlv
bnM/DQo+ID4+DQo+ID4+IEJ5IFJUQywgZG8geW91IG1lYW4gUmVhbC1UaW1lIENsb2NrPyBTb21l
dGhpbmcgbGlrZSBQTDAzMT8gT3IgZG8geW91DQo+ID4+IGhhdmUgc29tZXRoaW5nIGVsc2UgaW4g
bWluZD8NCj4gPg0KPiA+IFllcywgUmVhbCBUaW1lIENsb2NrIGxpa2UgUEwwMzEgaW4gRG9tVS4g
SSBkbyBub3QgaGF2ZSBhIGdvb2QgaWRlYQ0KPiA+IHN1cHBvcnQgUlRDIGluIEFSTSBEb21VLCBL
Vk0gYW5kIFhFTiB4ODYgc2VlbXMgdXNlIGVtdWxhdGVkIFJUQyBpbg0KPiA+IHFlbXUuIFRoaW5r
aW5nIG9mIHBhcmF2aXJ0dWFsIFJUQywgYW5kIGRvbTAgY29udHJvbCB0aGUgZXhwaXJlIHRpbWUg
Zm9yDQo+IGFsYXJtLg0KPiANCj4gVGhlIFBMMDMxIGlzIHF1aXRlIHNtYWxsIChiYXNlZCBvbiB0
aGUgUUVNVSB2ZXJzaW9uKS4gU28gSSB0aGluayBpdCB3b3VsZCBiZSBmaW5lDQo+IHRvIHByb3Zp
ZGUgYW4gZW11bGF0aW9uIGluIHRoZSBoeXBlcnZpc29yLg0KDQpPay4gSnVzdCBsaWtlIHRoZSBo
dm0geDg2LCBpbXBsZW1lbnQgZW11bGF0ZSBQTDAzMSBpbnNpZGUgWEVOLiBJJ2xsIGdpdmUgYSB0
cnkuDQoNClRoYW5rcywNClBlbmcuDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGll
biBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
