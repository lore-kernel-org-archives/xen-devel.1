From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH 06/12] xen/arm64: sysreg: Implement the
 32-bit helpers using the 64-bit helpers
Date: Wed, 27 Mar 2019 20:21:27 +0000
Message-ID: <de771877-4056-f782-860d-b5ee2b1069b9@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-7-julien.grall@arm.com>
 <a74aba5f-823f-c49c-4852-c832dcdb8ecf@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h58V=R6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9F3F-0003D1-0k
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 20:21:33 +0000
In-Reply-To: <a74aba5f-823f-c49c-4852-c832dcdb8ecf@citrix.com>
Content-Language: en-US
Content-ID: <44F8009097D23F4386EC14F4ABAEAEDE@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksDQoNCk9uIDI3LzAzLzIwMTkgMTk6MTUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI3
LzAzLzIwMTkgMTg6NDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IENsYW5nIGlzIHBpY2tpZXIg
dGhhbiBHQ0MgZm9yIHRoZSByZWdpc3RlciBzaXplIGluIGFzbSBzdGF0ZW1lbnQuIEl0DQo+PiBl
eHBlY3RzIHRoZSByZWdpc3RlciBzaXplIHRvIG1hdGNoIHRoZSB2YWx1ZSBzaXplLg0KPj4NCj4+
IFRoZSBpbnN0cnVjdGlvbnMgbXNyL21ycyBhcmUgZXhwZWN0aW5nIGEgNjQtYml0IHJlZ2lzdGVy
LiBUaGlzIG1lYW5zIHRoZQ0KPj4gaW1wbGVtZW50YXRpb24gb2YgdGhlIDMyLWJpdCBoZWxwZXJz
IGlzIG5vdCBjb3JyZWN0LiBUaGUgZWFzaWVzdA0KPj4gc29sdXRpb24gaXMgdG8gaW1wbGVtZW50
IHRoZSAzMi1iaXQgaGVscGVycyB1c2luZyB0aGUgNjQtYml0IGhlbHBlcnMuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4gDQo+IChJ
IGRvbid0IGhhdmUgYW4gb3BpbmlvbiBvbiBob3cgdG8gZml4IHRoZSBpc3N1ZSwgYnV0KQ0KPiAN
Cj4gQXJlIFNZU1JFR1MgYWN0dWFsbHkgYWx3YXlzIDY0IGJpdHMgZXZlbiBvbiBhcm0zMiwgYW5k
IHRoZXNlIGhlbHBlcnMNCj4ganVzdCBhIHNob3J0aGFuZCBmb3IgdGhlIGxvd2VyIDMyIGJpdHMs
IG9yIGlzIHRoaXMgYW4NCj4gZWZmZWN0aXZlbHktdW5uZWNlc3NhcnkgY29uc3RyYWludCBpbXBv
c2VkIGJ5IENsYW5nPw0KDQpUaGlzIGNvZGUgaXMgQXJtNjQgc3BlY2lmaWMuIE9uIEFybTY0LCBz
eXN0ZW0gcmVnaXN0ZXJzIGFyZSBhbHdheXMgDQo2NC1iaXRzLCBhbmQgdGhlcmVmb3JlIHRoZSBp
bnN0cnVjdGlvbnMgbXNyL21ycyByZXF1aXJlIGEgNjQtYml0IHJlZ2lzdGVyLg0KDQpTbyB0aGUg
Y29tcGxhaW4gZnJvbSBDbGFuZyBpcyB2YWxpZCBoZXJlLiBJdCBoYXBwZW5zIHRoYXQgc29tZSBv
ZiB0aGUgDQpyZWdpc3RlcnMgaGF2ZSB0aGUgdG9wIDMyLWJpdCBSRVMwIGluIGN1cnJlbnQgYXJj
aGl0ZWN0dXJlLiBPbmUgY291bGQgDQphcmd1ZSB0aGF0IHRoaXMgaXMgbm90IHZlcnkgZnV0dXJl
LXByb29mIGFuZCB3ZSBzaG91bGQgZ2V0IHJpZCBvZiB7UkVBRCwgDQpXUklURSlfU1lTUkVHMzIu
DQoNClVuZm9ydHVuYXRlbHksIHRoZSBjYWxsZXJzIGFyZSBleHBlY3RpbmcgYSAzMi1iaXQgdmFs
dWUuIEkgbmVlZCB0byANCmludmVzdGlnYXRlIGFsbCB0aGUgY2FsbGVycyB0byBlbnN1cmUgbm8g
b25lIGlzIHRyYW5zZm9ybWluZyB0aGUgdmFsdWUgDQp0byA2NC1iaXQgYWdhaW4uIEkgZG9uJ3Qg
cmVhbGx5IHdhbnQgdG8gYmxvY2sgY2xhbmcgc3VwcG9ydCBvbiB0aGF0LCBzbyANCkkgaGF2ZSBh
ZGRlZCBhbiBhY3Rpb24gZm9yIGZpeGluZyB0aGlzIGxhdGVyIG9uLg0KDQpDaGVlcnMsDQoNCi0t
IA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
