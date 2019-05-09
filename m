From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs
 helpers name
Date: Thu, 9 May 2019 20:32:25 +0000
Message-ID: <5fe19f3a-e17b-04b5-ff15-5579ebe789eb@arm.com>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kt3J=TJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOpib-0002nk-0F
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 20:32:41 +0000
In-Reply-To: <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Content-ID: <0FA6496710F12547A61E7F9C57C5488F@eurprd08.prod.outlook.com>
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

SGksDQoNCk9uIDA5LzA1LzIwMTkgMjE6MTMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gV2VkLCA4IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiAgIC8qIFJlbGVhc2Ug
YWxsIF9faW5pdCBhbmQgX19pbml0ZGF0YSByYW5nZXMgdG8gYmUgcmV1c2VkICovDQo+PiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9wYWdlLmggYi94ZW4vaW5jbHVkZS9h
c20tYXJtL2FybTMyL3BhZ2UuaA0KPj4gaW5kZXggNDBhNzdkYWE5ZC4uMGI0MWI5MjE0YiAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvcGFnZS5oDQo+PiArKysgYi94
ZW4vaW5jbHVkZS9hc20tYXJtL2FybTMyL3BhZ2UuaA0KPj4gQEAgLTYxLDEyICs2MSw4IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBpbnZhbGlkYXRlX2ljYWNoZV9sb2NhbCh2b2lkKQ0KPj4gICAgICAg
aXNiKCk7ICAgICAgICAgICAgICAgICAgICAgIC8qIFN5bmNocm9uaXplIGZldGNoZWQgaW5zdHJ1
Y3Rpb24gc3RyZWFtLiAqLw0KPj4gICB9DQo+PiAgIA0KPj4gLS8qDQo+PiAtICogRmx1c2ggYWxs
IGh5cGVydmlzb3IgbWFwcGluZ3MgZnJvbSB0aGUgZGF0YSBUTEIgb2YgdGhlIGxvY2FsDQo+PiAt
ICogcHJvY2Vzc29yLiBUaGlzIGlzIG5vdCBzdWZmaWNpZW50IHdoZW4gY2hhbmdpbmcgY29kZSBt
YXBwaW5ncyBvcg0KPj4gLSAqIGZvciBzZWxmIG1vZGlmeWluZyBjb2RlLg0KPj4gLSAqLw0KPj4g
LXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF94ZW5fZGF0YV90bGJfbG9jYWwodm9pZCkNCj4+ICsv
KiBGbHVzaCBhbGwgaHlwZXJ2aXNvciBtYXBwaW5ncyBmcm9tIHRoZSBUTEIgb2YgdGhlIGxvY2Fs
IHByb2Nlc3Nvci4gKi8NCj4gDQo+IEkgcmVhbGl6ZSB0aGF0IHRoZSBzdGF0ZW1lbnQgIlRoaXMg
aXMgbm90IHN1ZmZpY2llbnQgd2hlbiBjaGFuZ2luZyBjb2RlDQo+IG1hcHBpbmdzIG9yIGZvciBz
ZWxmIG1vZGlmeWluZyBjb2RlIiBpcyBub3QgcXVpdGUgYWNjdXJhdGUsIGJ1dCBJIHdvdWxkDQo+
IHByZWZlciBub3QgdG8gcmVtb3ZlIGl0IGNvbXBsZXRlbHkuIEl0IHdvdWxkIGJlIGdvb2QgdG8g
cmV0YWluIGEgd2FybmluZw0KPiBzb21ld2hlcmUgYWJvdXQgSUMgYmVlbiBuZWVkZWQgd2hlbiBj
aGFuZ2luZyBYZW4ncyBvd24gbWFwcGluZ3MuIE1heWJlDQo+IG9uIHRvcCBvZiBpbnZhbGlkYXRl
X2ljYWNoZV9sb2NhbD8NCg0KQ2FuIHlvdSBwbGVhc2UgZXhwYW5kIGluIHdoaWNoIGNpcmN1bXN0
YW5jZSB5b3UgbmVlZCB0byBpbnZhbGlkIHRoZSANCmluc3RydWN0aW9uIGNhY2hlIHdoZW4gY2hh
bmdpbmcgWGVuJ3Mgb3duIG1hcHBpbmdzPw0KDQpDaGVlcnMsDQoNCi0tIA0KSnVsaWVuIEdyYWxs
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
