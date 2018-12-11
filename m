From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: memory leak in block/xen_disk in qemu-3.x
Date: Tue, 11 Dec 2018 16:01:51 +0000
Message-ID: <74c1c30c147444cea915ee1befa56cf6@AMSPEX02CL03.citrite.net>
References: <20181211153047.GB18447@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yaMN=OU=citrix.com=prvs=87697dac6=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gWkUs-0000Mr-Eb
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 16:02:58 +0000
In-Reply-To: <20181211153047.GB18447@aepfle.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Olaf Hering' <olaf@aepfle.de>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmDQo+IE9mIE9s
YWYgSGVyaW5nDQo+IFNlbnQ6IDExIERlY2VtYmVyIDIwMTggMTU6MzENCj4gVG86IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IFN1YmplY3Q6
IFtYZW4tZGV2ZWxdIG1lbW9yeSBsZWFrIGluIGJsb2NrL3hlbl9kaXNrIGluIHFlbXUtMy54DQo+
IA0KPiBXaGF0IGFyZSB0aGUgbGl2ZSB0aW1lIHJ1bGVzIG9mIGlvcmVxLT5idWY/DQo+IA0KPiBJ
biBteSB0ZXN0aW5nIHRoZSBtZW1vcnkgdXNhZ2Ugb2YgcWVtdSBpcyBjb25zdGFudGx5IGdyb3dp
bmcgZnJvbSBhYm91dA0KPiAyNTBNQiB0byBzZXZlcmFsIEdCIGFmdGVyIGEgZmV3IGRheXMuDQoN
CkFyZSB5b3UgcGVyaGFwcyBydW5uaW5nIGludG8gdGhlIHByb2JsZW0gYWRkcmVzc2VkIGJ5IHRo
aXMgcGF0Y2g/DQoNCmh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZl
bC8yMDE4LTExL21zZzAwMjQ0Lmh0bWwNCg0KICBQYXVsDQoNCj4gDQo+IFNvbWUgZGVidWdnaW5n
IHNob3dzIHRoYXQgaW9yZXFfcnVuaW9fcWVtdV9haW8oKSBvdmVyd3JpdGVzIGlvcmVxLT5idWYs
DQo+IHdoaWNoIGNvbnRyaWJ1dGVzIHRvIHRoZSBsZWFrLiBJbiBhZGRpdGlvbiwgaW9yZXFfcmVz
ZXQoKSBhbHNvIGp1c3QNCj4gZ2xvYmJlcnMgaW9yZXctPmJ1Zi4gV2hpbGUgdGhpcyB3YXMgb2Jz
ZXJ2ZWQgd2l0aCBhIGJhY2twb3J0IG9mIHhlbl9kaXNrDQo+IGNoYW5nZXMgdG8gcWVtdS0yLjks
IHRoZSBjb2RlIGluIHhlbl9kaXNrLmMgZGlkIG5vdCBjaGFuZ2UgaW4gdGhpcw0KPiByZWdhcmQu
IEkgY2hhbmdlZCB0aGUgY29kZSB0byBjYWxsIHFlbXVfdmZyZWUoaW9yZXEtPmJ1ZikgaW4gdGhl
IGZldw0KPiBwbGFjZXMgdGhhdCBnbG9iYmVyIHRoZSBwb2ludGVyLCB0aGF0IGZpeGVzIHRoZSBs
ZWFrIGZvciBtZS4NCj4gDQo+IFJpZ2h0IG5vdyBuZWl0aGVyIHFlbXUtMy4wIG5vciAzLjEgZm9y
IG1lLCBzbyBJIGNhbiBub3QgdGVzdA0KPiBxZW11LmdpdCNtYXN0ZXIgaWYgaXQgZXZlbnR1YWxs
eSBiZWhhdmVzIGRpZmZlcmVudCB0aGFuDQo+IHFlbXUuZ2l0I3N0YWJsZS0yLjkrYmFja3BvcnQu
DQo+IA0KPiBPbGFmDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
