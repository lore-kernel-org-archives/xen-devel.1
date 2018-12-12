From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2 03/10] libxl: Clean up
 userlookup_helper_getpw* helper
Date: Wed, 12 Dec 2018 17:39:29 +0000
Message-ID: <A38D465C-921A-484A-A5CF-76AC86930F5A@citrix.com>
References: <20181206150252.30766-1-george.dunlap@citrix.com>
 <20181206150252.30766-3-george.dunlap@citrix.com>
 <23569.10407.403233.48606@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cfam=OV=citrix.com=prvs=8773add0b=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gX8UK-0001wU-8D
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 17:40:00 +0000
In-Reply-To: <23569.10407.403233.48606@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <0BD77398D3ED8E4C82CEAC176ED361F4@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gRGVjIDEyLCAyMDE4LCBhdCAzOjI2IFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIltQQVRD
SCB2MiAwMy8xMF0gbGlieGw6IENsZWFuIHVwIHVzZXJsb29rdXBfaGVscGVyX2dldHB3KiBoZWxw
ZXIiKToNCj4+IEJyaW5nIGNvbnZlbnRpb25zIG1vcmUgaW4gbGluZSB3aXRoIGxpYnhsX194c19y
ZWFkX2NoZWNrZWQoKToNCj4+IC0gSWYgZm91bmQsIHJldHVybiAwIGFuZCBzZXQgcG9pbnRlciB0
byBub24tTlVMTA0KPj4gLSBJZiBub3QgZm91bmQsIHJldHVybiAwIGFuZCBzZXQgcG9pbnRlciB0
byBOVUxMDQo+PiAtIE9uIGVycm9yLCByZXR1cm4gbGlieGwtc3R5bGUgZXJyb3IgbnVtYmVyLg0K
Pj4gDQo+PiBVcGRhdGUgZG9jdW1lbnRhdGlvbiB0byBtYXRjaC4NCj4gLi4uDQo+PiAjZGVmaW5l
IERFRklORV9VU0VSTE9PS1VQX0hFTFBFUihOQU1FLFNQRUNfVFlQRSxTVFJVQ1ROQU1FLFNZU0NP
TkYpICAgICBcDQo+PiAgICAgc3RhdGljIGludCB1c2VybG9va3VwX2hlbHBlcl8jI05BTUUobGli
eGxfX2djICpnYywgICAgICAgICAgICAgICAgICBcDQo+PiBAQCAtODMsNyArODksNyBAQCBzdGF0
aWMgaW50IGxpYnhsX19jcmVhdGVfcWVtdV9sb2dmaWxlKGxpYnhsX19nYyAqZ2MsIGNoYXIgKm5h
bWUpDQo+PiAgICAgICAgIHN0cnVjdCBTVFJVQ1ROQU1FICpyZXN1bHRwID0gTlVMTDsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcDQo+IA0KPiBnaXQgZGlmZiBoYXMgZXhjZWxsZWQgaXRz
ZWxmIGluIGNob2ljZSBvZiBoZWFkaW5nIGxpbmUsIGhhc24ndCBpdCA/DQo+IA0KPj4gQEAgLTE0
MiwxNCArMTQ3LDE0IEBAIHN0YXRpYyBpbnQgbGlieGxfX2RvbWFpbl9nZXRfZGV2aWNlX21vZGVs
X3VpZChsaWJ4bF9fZ2MgKmdjLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmdXNlcl9wd2J1ZiwgJnVzZXJfYmFzZSk7DQo+PiAgICAgaWYgKHJldCA8IDApDQo+
PiAgICAgICAgIHJldHVybiByZXQ7DQo+PiAtICAgIGlmIChyZXQgPiAwKSB7DQo+PiArICAgIGlm
ICh1c2VyX2Jhc2UpIHsNCj4gDQo+IEkgd291bGQgcHJlZmVyIHRvIGFsc286DQo+IA0KPiAgLSAg
ICBpZiAocmV0IDwgMCkNCj4gICsgICAgaWYgKHJldCkNCj4gICAgICAgICAgIHJldHVybiByZXQ7
DQo+IA0KPiB3aGljaCBpcyBtb3JlIGNvbnZlbnRpb25hbCBmb3IgcmMgYW5kIG1pZ2h0IHJlZHVj
ZSB0aGUgaW1wYWN0IG9mIGJ1Z3MNCj4gd2hlcmUgdGhlIGZ1bmN0aW9uIHJldHVybmVkIGEgcG9z
aXRpdmUuICAoVHdpY2UuKQ0KDQpMb29rcyBsaWtlIHRocmljZSwgYnV0IHN1cmUuDQoNCj4gDQo+
IFdpdGggb3Igd2l0aG91dCB0aGF0IGNoYW5nZSwNCj4gDQo+IEFja2VkLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGNsZWFu
dXAhDQoNCk5vIHByb2JsZW0g4oCUIGl04oCZcyBuaWNlIHRvIGhhdmUgc29tZXRoaW5nIHRyYWN0
YWJsZSBhbmQgc2F0aXNmeWluZyB0byBhY2NvbXBsaXNoIHdoZW4gbXkgb3RoZXIgYWN0aXZlIHBy
b2plY3QgaXMgYSBzZWVtaW5nbHkgbmV2ZXItZW5kaW5nIGJhbGwgb2YgdHdpbmXigKYNCg0KIC1H
ZW9yZ2UNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
