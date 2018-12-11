From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: memory leak in block/xen_disk in qemu-3.x
Date: Tue, 11 Dec 2018 16:15:10 +0000
Message-ID: <2abf113b34c0478d853810ee1605a015@AMSPEX02CL03.citrite.net>
References: <20181211153047.GB18447@aepfle.de>
 <74c1c30c147444cea915ee1befa56cf6@AMSPEX02CL03.citrite.net>
 <20181211160752.GD18447@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yaMN=OU=citrix.com=prvs=87697dac6=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gWkiR-00022O-QI
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 16:16:59 +0000
In-Reply-To: <20181211160752.GD18447@aepfle.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Olaf Hering' <olaf@aepfle.de>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBPbGFmIEhlcmluZyBbbWFpbHRv
Om9sYWZAYWVwZmxlLmRlXQ0KPiBTZW50OiAxMSBEZWNlbWJlciAyMDE4IDE2OjA4DQo+IFRvOiBQ
YXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gU3ViamVjdDogUmU6
IFtYZW4tZGV2ZWxdIG1lbW9yeSBsZWFrIGluIGJsb2NrL3hlbl9kaXNrIGluIHFlbXUtMy54DQo+
IA0KPiBPbiBUdWUsIERlYyAxMSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiANCj4gPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4ZW4t
ZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24NCj4gQmVoYWxmDQo+ID4gPiBP
ZiBPbGFmIEhlcmluZw0KPiA+ID4gU2VudDogMTEgRGVjZW1iZXIgMjAxOCAxNTozMQ0KPiA+ID4g
VG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3Jn
DQo+ID4gPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBtZW1vcnkgbGVhayBpbiBibG9jay94ZW5fZGlz
ayBpbiBxZW11LTMueA0KPiA+ID4NCj4gPiA+IFdoYXQgYXJlIHRoZSBsaXZlIHRpbWUgcnVsZXMg
b2YgaW9yZXEtPmJ1Zj8NCj4gPiA+IEluIG15IHRlc3RpbmcgdGhlIG1lbW9yeSB1c2FnZSBvZiBx
ZW11IGlzIGNvbnN0YW50bHkgZ3Jvd2luZyBmcm9tDQo+IGFib3V0DQo+ID4gPiAyNTBNQiB0byBz
ZXZlcmFsIEdCIGFmdGVyIGEgZmV3IGRheXMuDQo+ID4gQXJlIHlvdSBwZXJoYXBzIHJ1bm5pbmcg
aW50byB0aGUgcHJvYmxlbSBhZGRyZXNzZWQgYnkgdGhpcyBwYXRjaD8NCj4gPiBodHRwczovL2xp
c3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtZGV2ZWwvMjAxOC0xMS9tc2cwMDI0NC5odG1s
DQo+IA0KPiBUaGlzIGxvb2tzIGxpa2UgYSBmaXgsIHJhdGhlciB0aGFuIGFuIGltcHJvdmVtZW50
Lg0KPiBNb3JlIHRoYW4gYSBtb250aCBwYXNzZWQgYWxyZWFkeSwgd2h5IGlzIGl0IG5vdCB5ZXQg
aW4gcWVtdS5naXQjbWFzdGVyPw0KPiANCg0KSXQgd2FzIG5hY2tlZCBvbiB0aGUgYmFzaXMgdGhh
dCB4ZW5fZGlzayBpcyBsZWdhY3kuIEkgaGF2ZSByZS1iYXNlZCBpdCBvbiBteSBzZXJpZXMgcmUt
d29ya2luZyB4ZW5fZGlzayBhbmQsIGFzIHNvb24gYXMgdGhhdCBpcyBhbGwgYWNrZWQsIEkgd2ls
bCBwb3N0IHRoZSByZS1iYXNlZCBwYXRjaC4NCg0KICBQYXVsDQoNCj4gT2xhZg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
