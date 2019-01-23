From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [RFC] arm/p2m: call iommu iotlb flush if iommu
 exists and enabled
Date: Wed, 23 Jan 2019 12:41:27 +0000
Message-ID: <4a9586dac80748f0a8b0f575792cbbb8@AMSPEX02CL03.citrite.net>
References: <1548238334-23168-1-git-send-email-andrii.anisov@gmail.com>
 <c861a2f4-25a4-e5a4-f112-42853cba84e3@arm.com>
 <68e806f1d1b7496fb3e948576508bd86@AMSPEX02CL03.citrite.net>
 <5ff8a4ec-dc2f-488e-d462-794e72a942bc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TXmL=P7=citrix.com=prvs=919de7af8=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gmHqV-0007pI-3T
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 12:41:31 +0000
In-Reply-To: <5ff8a4ec-dc2f-488e-d462-794e72a942bc@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Andrii Anisov' <andrii.anisov@gmail.com>, 'Julien Grall' <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyaWkgQW5pc292IFttYWls
dG86YW5kcmlpLmFuaXNvdkBnbWFpbC5jb21dDQo+IFNlbnQ6IDIzIEphbnVhcnkgMjAxOSAxMjo0
MA0KPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47ICdKdWxpZW4g
R3JhbGwnDQo+IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZw0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgQW5kcmlpIEFuaXNvdg0KPiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtSRkNdIGFybS9wMm06IGNhbGwgaW9tbXUgaW90bGIgZmx1c2ggaWYgaW9tbXUgZXhpc3Rz
IGFuZA0KPiBlbmFibGVkDQo+IA0KPiBIZWxsbyBQYXVsLA0KPiANCj4gT24gMjMuMDEuMTkgMTM6
NDUsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBZZXMsIHRoaXMgd2FzIGEgbWlzdGFrZSB3aGVu
IG1vdmluZyBmcm9tIHRoZSBvbGQgbWFjcm9zIGFuZCBuZWVkX2lvbW11Lg0KPiBBbmRyaWkgaXMg
Y29ycmVjdCB0aGF0IG5lZWRfaW9tbXVfcHRfc3luYygpIGlzIHN1cHBvc2VkIHRvIGdhdGUgd2hl
dGhlciBhbg0KPiBleHBsaWNpdCBtYXAvdW5tYXAgaXMgbmVlZGVkLiBUaGUgbmVlZCBmb3IgZmx1
c2ggc2hvdWxkIG9ubHkgZGVwZW5kIG9uDQo+IGhhc19pb21tdV9wdCgpLg0KPiBTbyBJIGZpeCB0
aGUgY29tbWl0IG1lc3NhZ2UgYW5kIHNlbmQgVjIgZm9yIFhFTiA0LjEyLg0KDQpDb29sLg0KDQo+
IA0KPiA+IFRoZXJlIGlzIGFsc28gaW9tbXVfdXNlX2hhcF9wdCgpIHdoaWNoIGlzIGFjdHVhbGx5
IGRlZmluZWQgYXMNCj4gaGFzX2lvbW11X3B0KCksIGJ1dCBJIHdvbmRlciB3aGV0aGVyIHRoYXQg
c2hvdWxkIGp1c3QgZ28gYXdheSBmb3IgQVJNDQo+IHNpbmNlIHRoZSBwYWdlIHRhYmxlcyBhcmUg
YWx3YXlzIHNoYXJlZC4NCj4gQWN0dWFsbHksIHRoZSBtYWlubGluZSBjdXJyZW50bHkgc3VwcG9y
dHMgb25seSBTTU1VLCB3aGljaCBkb2VzIHNoYXJlIHRoZQ0KPiBwYWdlIHRhYmxlLg0KPiBCdXQg
aXQgaXMgbm90IGFsd2F5cyB0cnVlLCB3ZSBhcmUgdXNpbmcgSFcsIHdoZXJlIFBUIGlzIG5vdCBz
aGFyZWQuIEFuZA0KPiBnb2luZyB0byB1cHN0cmVhbSB0aGF0IHN1cHBvcnQgb25lIGRheS4NCg0K
T2gsIG9rLiBMZWF2ZSBpdCBpbiB0aGVuIDotKQ0KDQogIFBhdWwNCg0KPiANCj4gLS0NCj4gU2lu
Y2VyZWx5LA0KPiBBbmRyaWkgQW5pc292Lg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
