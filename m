From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [RFC 06/16] gic: drop interrupts enabling on
 interrupts processing
Date: Wed, 28 Nov 2018 22:06:28 +0000
Message-ID: <8a5794cb-f5f1-1135-0101-2114fa999894@arm.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-7-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=83fl=oh=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gS7yZ-00050K-Qn
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 22:06:31 +0000
In-Reply-To: <1543440731-21947-7-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Content-ID: <513A22CB7933704D96E4D590E038CC7E@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Andrii Anisov <andrii_anisov@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDI4LzExLzIwMTggMjE6MzIsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6DQo+IEZyb206IEFu
ZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+DQo+IA0KPiBUaGlzIHJlZHVjZXMg
dGhlIG51bWJlciBvZiBjb250ZXh0IHN3aXRjaGVzIGluIGNhc2Ugd2UgaGF2ZSBhbg0KPiBpbnRl
cnJ1cHQgc3Rvcm0uIFdlIHdpbGwgcmVhZCBvdXQgYWxsIG9mIHRob3NlIGludGVycnVwdCBpbiB0
aGUNCj4gbG9vcCBhbnl3YXkuDQoNClRoaXMgbmVlZHMgYSBiZXR0ZXIgZXhwbGFuYXRpb24uIFlv
dSBtaWdodCB3YW50IHRvIGhhdmUgYSBsb29rIGF0IHRoZSANCmRldGFpbHMgSSBwcm92aWRlZCBp
biBhbm90aGVyIGRpc2N1c3Npb24uDQoNCkluIGdlbmVyYWwsIEkgd291bGQgbGlrZSBhbnkgY2hh
bmdlcyBpbiB0aGUgdkdJQyB0byBiZSB2ZXJ5IGRldGFpbGVkLiBBcyANCnRoZXkgYXJlIHVzdWFs
bHkgc3ViYnRsZSBpbXBsaWNhdGlvbiBvbiB0aGUgcmVzdCBvZiB0aGUgY29kZSBiYXNlLg0KDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29t
Pg0KPiAtLS0NCj4gICB4ZW4vYXJjaC9hcm0vZ2ljLmMgfCAyIC0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy5j
IGIveGVuL2FyY2gvYXJtL2dpYy5jDQo+IGluZGV4IDc3ZmMwNmYuLmIxMDc4M2IgMTAwNjQ0DQo+
IC0tLSBhL3hlbi9hcmNoL2FybS9naWMuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLmMNCj4g
QEAgLTM5MCwxMCArMzkwLDggQEAgdm9pZCBnaWNfaW50ZXJydXB0KHN0cnVjdCBjcHVfdXNlcl9y
ZWdzICpyZWdzLCBpbnQgaXNfZmlxKQ0KPiAgIA0KPiAgICAgICAgICAgaWYgKCBsaWtlbHkoaXJx
ID49IDE2ICYmIGlycSA8IDEwMjApICkNCj4gICAgICAgICAgIHsNCj4gLSAgICAgICAgICAgIGxv
Y2FsX2lycV9lbmFibGUoKTsNCj4gICAgICAgICAgICAgICBpc2IoKTsNCj4gICAgICAgICAgICAg
ICBkb19JUlEocmVncywgaXJxLCBpc19maXEpOw0KPiAtICAgICAgICAgICAgbG9jYWxfaXJxX2Rp
c2FibGUoKTsNCj4gICAgICAgICAgIH0NCj4gICAjaWZkZWYgQ09ORklHX0dJQ1YzDQo+ICAgICAg
ICAgICBlbHNlIGlmICggaXNfbHBpKGlycSkgKQ0KPiANCg0KLS0gDQpKdWxpZW4gR3JhbGwNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
