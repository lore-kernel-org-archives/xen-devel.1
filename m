From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs
 helpers name
Date: Mon, 20 May 2019 21:59:30 +0000
Message-ID: <471832b3-c328-2275-2abd-845371be819b@arm.com>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
 <5fe19f3a-e17b-04b5-ff15-5579ebe789eb@arm.com>
 <cc1d2550-794c-842d-26db-178f614f81b3@arm.com>
 <4b1d9bf6-bf3b-a5ec-da06-534618bb34a8@arm.com>
 <alpine.DEB.2.21.1905101050260.25766@sstabellini-ThinkPad-T480s>
 <10c3ba27-c0df-a0d4-4033-530ec99291ac@arm.com>
 <alpine.DEB.2.21.1905201357570.16404@sstabellini-ThinkPad-T480s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSqJj-0008WD-Ul
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 21:59:36 +0000
In-Reply-To: <alpine.DEB.2.21.1905201357570.16404@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Content-ID: <443EAD24B6F089489D9990574F3D4E36@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Andrii Anisov <Andrii_Anisov@epam.com>, "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDIwLzA1LzIwMTkgMjI6MDEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24g
RnJpLCAxMCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gRmVlbCBmcmVlIHRvIHN1
Z2dlc3QgYW4gaW4tY29kZSBjb21tZW50IHNvIHdlIGNhbiBkaXNjdXNzIG9uIHRoZSB3b3J0aGlu
ZXNzLg0KPiANCj4gSSBzdWdnZXN0IHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmc6DQo+IA0K
PiAgIC8qDQo+ICAgICogRmx1c2ggYWxsIGh5cGVydmlzb3IgbWFwcGluZ3MgZnJvbSB0aGUgVExC
IG9mIHRoZSBsb2NhbCBwcm9jZXNzb3IuIE5vdGUNCj4gICAgKiB0aGF0IGluc3RydWN0aW9uIGNh
Y2hlIG1haW50ZW5hbmNlIG1pZ2h0IGFsc28gYmUgcmVxdWlyZWQgd2hlbiBzZWxmDQo+ICAgICog
bW9kaWZ5aW5nIFhlbiBjb2RlLCBzZWUgRDUtMjUyMiBpbiBBUk0gRERJIDA0ODdELmEgYW5kIEIz
LjExLjIgaW4gQVJNDQo+ICAgICogRERJIDA0MDZDLmMuDQo+ICAgICovDQoNClRoaXMgbG9va3Mg
cXVpdGUgb3V0LW9mLWNvbnRleHQsIHdoYXQgaXMgdGhlIHJlbGF0aW9uIGJldHdlZW4gDQpzZWxm
LW1vZGlmeWluZyBjb2RlIGFuZCBUTEIgZmx1c2g/DQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4g
R3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
