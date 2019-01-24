From: "Nuernberger, Stefan" <snu@amazon.de>
Subject: Re: [PATCH for-4.12] gic-vgic: fix assert condition
Date: Thu, 24 Jan 2019 18:47:22 +0000
Message-ID: <1548355642.9022.23.camel@amazon.de>
References: <1548354814-23208-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e/ob=QA=amazon.de=prvs=920b9fb01=snu@srs-us1.protection.inumbo.net>)
 id 1gmk2A-00057d-NB
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 18:47:26 +0000
In-Reply-To: <1548354814-23208-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Content-ID: <064ACAD3CAE170479F1C3B9B43140878@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "jgross@suse.com" <jgross@suse.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE5LTAxLTI0IGF0IDIwOjMzICswMjAwLCBBbmRyaWkgQW5pc292IHdyb3RlOg0K
PiBGcm9tOiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4NCj4gLS0t
DQo+IMKgeGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgfCAyICstDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2dpYy12Z2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYw0KPiBpbmRleCA0ODky
MmY1Li42ODRmMmQxIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYw0KPiAr
KysgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYw0KPiBAQCAtNDQzLDcgKzQ0Myw3IEBAIGludCB2
Z2ljX2Nvbm5lY3RfaHdfaXJxKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdA0KPiB2Y3B1ICp2LCB1
bnNpZ25lZCBpbnQgdmlycSwNCj4gwqDCoMKgwqDCoGludCByZXQgPSAwOw0KPiDCoA0KPiDCoMKg
wqDCoMKgLyogImRlc2MiIGlzIG9wdGlvbmFsIHdoZW4gd2UgZGlzY29ubmVjdCBhbiBJUlEuICov
DQo+IC3CoMKgwqDCoEFTU0VSVChjb25uZWN0ICYmIGRlc2MpOw0KPiArwqDCoMKgwqBBU1NFUlQo
Y29ubmVjdCB8fCBkZXNjKTsNCg0KSSBhc3N1bWUgaXQgc2hvdWxkIGJlwqBBU1NFUlQoIWNvbm5l
Y3QgfHwgZGVzYyk7DQoNCi0gU3RlZmFuDQo+IMKgDQo+IMKgwqDCoMKgwqAvKiBXZSBhcmUgdGFr
aW5nIHRvIHJhbmsgbG9jayB0byBwcmV2ZW50IHBhcmFsbGVsIGNvbm5lY3Rpb25zLg0KPiAqLw0K
PiDCoMKgwqDCoMKgdmdpY19sb2NrX3Jhbmsodl90YXJnZXQsIHJhbmssIGZsYWdzKTsNCi0tIA0K
QW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgNCmMvbyBTdGVmYW4gTnVlcm5i
ZXJnZXINCkFtIEJyYXVoYXVzIDEyDQowMTA5OSBEcmVzZGVuDQpHZXJtYW55DQoNCkFtdHNnZXJp
Y2h0IENoYXJsb3R0ZW5idXJnIC0gSFJCIDE0OTE3MyBCIC0gVVN0SUQgREUgMjg5IDIzNyA4NzkN
Ck1hbmFnaW5nIERpcmVjdG9yczogUmFsZiBIZXJicmljaCwgQ2hyaXMgU2NobGFlZ2VyDQoKCgpB
bWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDEx
NyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVy
YnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBD
aGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
