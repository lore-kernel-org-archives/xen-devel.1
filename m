From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [BUG] kernel bug encountered at
 drivers/net/xen-netback/netback.c:430!
Date: Wed, 10 Jan 2018 13:58:33 +0000
Message-ID: <6ca3b938cb2949fba04f7fc9ce89f5aa@AMSPEX02CL03.citrite.net>
References: <5a3ca8ee.4426620a.b956d.1799@mx.google.com>
 <352b0317-cfc5-1ef4-fbd0-2b2879f9712e@suse.com>
 <5a3d6c93.886f620a.2522d.c2fb@mx.google.com>
 <23eb0f3f-590d-f03a-f971-65e86c52fbe4@ark-net.org>
 <5a4546b1.55da620a.5c435.4b4b@mx.google.com>
 <3f860d32831940e7aa40d97979155b6e@AMSPEX02CL03.citrite.net>
 <20180103203337.GA79570@elch.exwg.net>
 <3104994914c94a26baed6195f486c03f@AMSPEX02CL03.citrite.net>
 <20180107221904.GA78680@elch.exwg.net>
 <6f58d8db2c3a40248c447ff8f7f57067@AMSPEX02CL03.citrite.net>
 <ef22c8e42fc7441587dccba1e0729495@AMSPEX02CL03.citrite.net>
 <1fa2f53623a946e2b4ee2fc0b3632360@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mzcr=ef=citrix.com=prvs=5411c3939=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1eZGtp-0001BY-F8
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 13:58:37 +0000
In-Reply-To: <1fa2f53623a946e2b4ee2fc0b3632360@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Christoph Moench-Tegeder' <cmt@burggraben.net>
Cc: 'Michael Collins' <mike@ark-net.org>, 'Juergen Gross' <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, 'Alex Braunegg' <alex.braunegg@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmDQo+IE9mIFBh
dWwgRHVycmFudA0KPiBTZW50OiAxMCBKYW51YXJ5IDIwMTggMTI6NTINCj4gVG86ICdDaHJpc3Rv
cGggTW9lbmNoLVRlZ2VkZXInIDxjbXRAYnVyZ2dyYWJlbi5uZXQ+DQo+IENjOiAnTWljaGFlbCBD
b2xsaW5zJyA8bWlrZUBhcmstbmV0Lm9yZz47ICdKdWVyZ2VuIEdyb3NzJw0KPiA8amdyb3NzQHN1
c2UuY29tPjsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47ICdBbGV4IEJyYXVuZWdnJw0K
PiA8YWxleC5icmF1bmVnZ0BnbWFpbC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcNCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtCVUddIGtlcm5lbCBidWcgZW5jb3VudGVy
ZWQgYXQgZHJpdmVycy9uZXQveGVuLQ0KPiBuZXRiYWNrL25ldGJhY2suYzo0MzAhDQo+IA0KPiBJ
IGhhdmUgdHJhY2tlZCBkb3duIHRoZSBwcm9ibGVtIHRvIG11bHRpcGxlIGNhbGxzIHRvIHRoZSB6
ZXJvY29weSBjYWxsYmFjayBmb3INCj4gdGhlIHNhbWUgdWJ1Zl9pbmZvLiBJIGFtIG5vdCBzdXJl
IGV4YWN0bHkgd2hpY2ggcGF0Y2ggaW50cm9kdWNlZCB0aGUgaXNzdWUNCj4gYnV0IG15IHN1c3Bp
Y2lvbiBpcyB0aGF0IGl0IHdhcyBvbmUgb2YgdGhlIHRoZSBNU0dfWkVST0NPUFkgc2VyaWVzIChz
ZWUNCj4gaHR0cHM6Ly9tYXJjLmluZm8vP2w9bGludXgtbmV0ZGV2Jm09MTQ5ODA3OTk3NzI2NzMz
Jnc9MikuDQo+IEkgaGF2ZSBhIGNhbmRpZGF0ZSBwYXRjaCB0byBuZXRiYWNrIHRvIG1ha2UgdXNl
IG9mIHRoZSB1YnVmX2luZm8gcmVmIGNvdW50DQo+IHRvIGhhbmRsZSB0aGUgbXVsdGlwbGUgY2Fs
bGJhY2tzIGFuZCB0aGF0IGNlcnRhaW5seSBmaXhlcyB0aGUgaXNzdWUgZm9yIG1lLiBJJ2xsDQo+
IHBvc3QgdGhpcyBzaG9ydGx5IHJlY29tbWVuZGluZyBhIGJhY2twb3J0IHRvIHN0YWJsZS4NCj4g
DQoNCkFjdHVhbGx5IG5vIG5lZWQuLi4gVGhlIHVuZGVybHlpbmcgaXNzdWUgd2FzIHJlYWxseSBh
IGJ1ZyBhbmQgaGFzIGJlZW4gZml4ZWQgaW4gNC4xNC4xMS4gU2VlIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUuZ2l0L2Nv
bW1pdC8/aD12NC4xNC4xMyZpZD0xNzE1NWVhODI3YjJmZDgxMzMwYTQ0MmVkNTZkMGVkYWZkOTk2
OWUxDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
