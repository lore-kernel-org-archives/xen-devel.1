From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH RFC v1] x86/emulate: Send vm_event form
 emulate
Date: Thu, 10 Jan 2019 16:46:03 +0000
Message-ID: <c993855e-68f7-1d4e-1c5e-65a8c7cb81f4@bitdefender.com>
References: <20190107130952.27449-1-aisaila@bitdefender.com>
 <CAPLaKK6+iD1kU5cFc=gEYVR0YeFhf12L89CSGC1BHRLha-r5Dg@mail.gmail.com>
 <3c65f142-63e0-5d9d-eba3-63c4da4df048@bitdefender.com>
 <CAPLaKK6tnwUVZaMvnBeu5F2PP9YgkcEOuYFFgYgmRYOeZGVW+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OzDo=PS=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ghdT4-0000hP-OX
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 16:46:06 +0000
In-Reply-To: <CAPLaKK6tnwUVZaMvnBeu5F2PP9YgkcEOuYFFgYgmRYOeZGVW+A@mail.gmail.com>
Content-Language: en-US
Content-ID: <77DBC8CBBD10784785D0BFDF9D47B694@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <royger@freebsd.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQo+Pj4NCj4+PiBOZXdsaW5lLg0KPj4+DQo+Pj4+ICsgICAgZGVmYXVsdDoNCj4+Pj4gKyAgICAg
ICAgcmV0dXJuIGZhbHNlOw0KPj4+PiArICAgIH0NCj4+Pg0KPj4+IEknbSBub3Qgc3VyZSB0aGUg
c3dpdGNoIGlzIG5lZWRlZCwgeW91IGNhbid0IGhhdmUgYSBQRkVDX3dyaXRlX2FjY2Vzcw0KPj4+
IGZvciBleGFtcGxlIGlmIHRoZSBwMm0gdHlwZSBpcyBwMm1fYWNjZXNzX3cgb3IgcDJtX2FjY2Vz
c19ydywgaGVuY2UgaXQNCj4+PiBzZWVtcyBsaWtlIGl0IGNvdWxkIGJlIHNpbXBsaWZpZWQgdG8g
b25seSB0YWtlIHRoZSBwZmVjIGludG8gYWNjb3VudD8NCj4+DQo+PiBJdCBpcyBwb3NzaWJsZSB0
byBoYXZlIFBGRUNfd3JpdGVfYWNjZXNzIGFuZCBwMm1fYWNjZXNzX3cgYnV0IHRoZW4gdGhlcmUN
Cj4+IGlzIG5vIHZpb2xhdGlvbiBhbmQgdGhlIGV2ZW50IHdpbGwgbm90IGJlIHNlbnQuDQo+IA0K
PiBJJ20gbm90IHN1cmUgSSBmb2xsb3cuIFBGRUMgaXMgYSB3YXkgdG8gc2lnbmFsIGEgcGFnZSBm
YXVsdCwgaGVuY2UgaXQNCj4gd291bGQgbWFrZSBubyBzZW5zZSB0byBmb3IgZXhhbXBsZSBnZXQg
UEZFQ193cml0ZV9hY2Nlc3MgaWYgdGhlIGFjY2Vzcw0KPiBpcyBwMm1fYWNjZXNzX3c/DQo+IA0K
WWVzLCBub3JtYWxseSBwZmVjIChwYWdlIGZhdWx0IGVycm9yIGNvZGUpIGRvZXMgd2hhdCB0aGUg
bmFtZSBpbXBsaWVzIA0KYnV0IGluIHRoaXMgY2FzZSB0aGUgcGZlYyB2YXIgaXMgY29uc3RydWN0
ZWQgaW4gdGhlIGNhbGxlciBmdW5jdGlvbi4NCg0KTGV0J3MgdGFrZSBmb3IgZXhhbXBsZSBodm1l
bXVsX3dyaXRlKCkgcGZlYyBoZXJlIGhhcyBhbHdheXMgDQpQRkVDX3dyaXRlX2FjY2VzcyBzbyBl
dmVyeSBlbXVsYXRlZCB3cml0ZSB3aWxsIGhhdmUgdGhpcyBubyBtYXR0ZXIgaWYgaXMgDQphIGZh
dWx0IG9yIG5vdCBhbmQgdGhhdCBpcyB3aGF0IEkgYW0gY2hlY2tpbmcuIElmIGluIGZhY3QgdGhl
cmUgaXMgYSANCmZhdWx0IHRoZW4gdGhlIGV2ZW50IGlzIHNlbnQuDQoNClJlZ2FyZHMsDQpBbGV4
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
