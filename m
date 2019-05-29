From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH V1 2/2] xen/device-tree: Add ability to
 handle nodes with interrupts-extended prop
Date: Wed, 29 May 2019 18:18:03 +0000
Message-ID: <c84036fb-27c9-8fb1-ec3b-f43a8e66515f@arm.com>
References: <1558460254-7127-1-git-send-email-olekstysh@gmail.com>
 <1558460254-7127-3-git-send-email-olekstysh@gmail.com>
 <a35d398b-d2e9-9c80-8ac2-923a82c68019@arm.com>
 <fbb40b64-c23b-be02-2c56-f0e0bf47324b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hW39L-0003iL-Pc
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 18:18:07 +0000
In-Reply-To: <fbb40b64-c23b-be02-2c56-f0e0bf47324b@gmail.com>
Content-Language: en-US
Content-ID: <B5E5FBB65BE5A44EB27E2D06CD653E16@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr <olekstysh@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, nd <nd@arm.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDI5LzA1LzIwMTkgMTg6NTgsIE9sZWtzYW5kciB3cm90ZToNCj4gDQo+IE9uIDI5LjA1
LjE5IDIwOjQ0LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBIaSBPbGVrc2FuZHIsDQo+IA0KPiBI
aSwgSnVsaWVuDQo+IA0KPiANCj4+DQo+PiBPbiAyMS8wNS8yMDE5IDE4OjM3LCBPbGVrc2FuZHIg
VHlzaGNoZW5rbyB3cm90ZToNCj4+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3Nh
bmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+Pj4NCj4+PiBUaGUgImludGVycnVwdHMtZXh0ZW5k
ZWQiIHByb3BlcnR5IGlzIGEgc3BlY2lhbCBmb3JtIGZvciB1c2Ugd2hlbg0KPj4+IGEgbm9kZSBu
ZWVkcyB0byByZWZlcmVuY2UgbXVsdGlwbGUgaW50ZXJydXB0IHBhcmVudHMuID4NCj4+PiBBY2Nv
cmRpbmcgdG8gdGhlOg0KPj4NCj4+IE5JVDogcy90aGUvLw0KPj4NCj4+PiBMaW51eC9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaW50ZXJydXB0
cy50eHQgDQo+Pj4NCj4+Pg0KPj4+IEJ1dCwgdGhlcmUgYXJlIGNhc2VzIHdoZW4gImludGVycnVw
dHMtZXh0ZW5kZWQiIHByb3BlcnR5IGlzIHVzZWQgZm9yDQo+Pj4gIm91dHNpZGUgL3NvYyBub2Rl
IiB3aXRoIGEgc2luZ2xlIGludGVycnVwdCBwYXJlbnQgYXMgYW4gZXF1aXZhbGVudCBvZg0KPj4+
IHBhaXJzICgiaW50ZXJydXB0LXBhcmVudCIgKyAiaW50ZXJydXB0cyIpLg0KPj4+DQo+Pj4gVGhl
IGdvb2QgZXhhbXBsZSBoZXJlIGlzIEFSQ0ggdGltZXIgbm9kZSBmb3IgUi1DYXIgR2VuMy9HZW4y
IGZhbWlseSwNCj4+DQo+PiBOSVQ6IHMvVGhlL0EvIEkgdGhpbmsNCj4+DQo+Pj4gd2hpY2ggaXMg
bWFuZGF0b3J5IGRldmljZSBmb3IgWGVuIHVzYWdlIG9uIEFSTS4gQW5kIHdpdGhvdXQgYWJpbGl0
eQ0KPj4+IHRvIGhhbmRsZSBzdWNoIG5vZGVzLCBYZW4gZmFpbHMgdG8gb3BlcmF0ZS4NCj4+Pg0K
Pj4+IFNvLCB0aGlzIHBhdGNoIGFkZHMgcmVxdWlyZWQgc3VwcG9ydCBmb3IgWGVuIHRvIGJlIGFi
bGUgdG8gaGFuZGxlDQo+Pj4gbm9kZXMgd2l0aCB0aGF0IHByb3BlcnR5Lg0KPj4+DQo+Pj4gU2ln
bmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVw
YW0uY29tPg0KPj4NCj4+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+DQo+IA0KPiBUaGFuayB5b3UhIEkgYXNzdW1lIHlvdSBtZWFudCBSZXZp
ZXdlZC1ieTogSnVsaWVuIEdyYWxsIA0KPiA8anVsaWVuLmdyYWxsQGFybS5jb20+ICkNCg0KWWVz
IHNvcnJ5LCBJIHdhcyBhZGRpbmcgaXMgcmV2aWV3ZWQtYnkgb24gc29tZSBvZiBteSBwYXRjaGVz
IGFuZCANCm1lY2hhbmljYWxseSBjb3BpZWQgaGVyZS4gQXBvbG9naWVzIGZvciB0aGUgaW5jb252
ZW5pZW5jZS4NCg0KPiANCj4gU2hhbGwgSSBzZW5kIG5ldyB2ZXJzaW9uIHdpdGggcHJvcG9zZWQg
Y2hhbmdlcz8NCg0KTm8gbmVlZCwgSSBjYW4gZG8gdGhlIGNoYW5nZSB3aGlsZSBjb21taXR0aW5n
IChhc3N1bWluZyBTdGVmYW5vIGhhcyBubyANCm90aGVyIGNvbW1lbnRzKS4NCg0KQ2hlZXJzLA0K
DQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
