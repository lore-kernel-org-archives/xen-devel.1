From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 8/9] libxl: Kill QEMU by uid when possible
Date: Thu, 29 Nov 2018 12:38:07 +0000
Message-ID: <138137EE-1DC9-4B8A-998B-2D6790A232D5@citrix.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-8-george.dunlap@citrix.com>
 <8b086fb2-e018-a669-b90d-42ce2179eaa7@citrix.com>
 <20181128155758.GA14786@perard.uk.xensource.com>
 <20181129115524.4yjt2ff2hwwqjsgi@zion.uk.xensource.com>
 <C5994DCA-A993-4BBD-9433-CD6DA9C47C32@citrix.com>
 <23551.56043.674081.561342@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wOoB=OI=citrix.com=prvs=864e58e47=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gSLa6-0006Wa-AE
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 12:38:10 +0000
In-Reply-To: <23551.56043.674081.561342@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <FCCD80540E9B6C40B3A9739788141798@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gTm92IDI5LCAyMDE4LCBhdCAxMjoyNiBQTSwgSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gR2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTog
W1BBVENIIDgvOV0gbGlieGw6IEtpbGwgUUVNVSBieSB1aWQgd2hlbiBwb3NzaWJsZSIpOg0KPj4g
SXQgd291bGRu4oCZdCBiZSB0ZXJyaWJseSBoYXJkIHRvIGhhdmUgYSBjb21tb24g4oCcZXhpdOKA
nSB0byBib3RoIHRoZQ0KPj4ga2lsbC1ieS1waWQgYW5kIGtpbGwtYnktdWlkIHBhdGhzIHRoYXQg
ZGlkIGl0IG9uY2UsIGJ1dCBpdCB3b3VsZA0KPj4gaW52b2x2ZSBhZGRpbmcgWWV0IEFub3RoZXIg
RnVuY3Rpb247IGFuZCBlYWNoIGFkZGl0aW9uYWwgZnVuY3Rpb24NCj4+IG1ha2VzIHRoZSBjb2Rl
IGEgbGl0dGxlIGJpdCBtb3JlIGRpZmZpY3VsdCB0byBmb2xsb3cuDQo+IA0KPiBJJ20gYWZyYWlk
IEkgZGlzYWdyZWUgb24gdGhpcyBwb2ludC4NCj4gDQo+IEkgYWdyZWUgdGhhdCBhZGRpdGlvbmFs
IGZ1bmN0aW9ucyBzaG91bGQgYmUgYXZvaWRlZCB3aGVyZSB0aGV5IGFyZQ0KPiBuZWVkbGVzcy4g
IEJ1dCBhIHNpbmdsZSBleGl0IHBhdGggaXMgbW9yZSBpbXBvcnRhbnQuDQo+IA0KPiBXaXRob3V0
IGEgc2luZ2xlIGV4aXQgcGF0aCwgc29tZW9uZSB3aG8gbW9kaWZpZXMgdGhpcyBjb2RlIGluIHRo
ZQ0KPiBmdXR1dHVyZSAodG8gYWRkIG5ldyBzdGF0ZSwgc2F5KSB3aWxsIHJpc2sgYWx0ZXJpbmcg
b25seSBvbmUgb2YgdGhlDQo+IGV4aXQgcGF0aHMuDQoNCuKAnENyZWF0aW5nIGFuIGV4dHJhIGZ1
bmN0aW9uIHRvIGF2b2lkIG1vdmluZyBxbXBfY2xlYW51cCBlYXJsaWVy4oCdIGRvZXNu4oCZdCBz
b3VuZCBsaWtlIGEgZ29vZCByZWFzb24gdG8gbWUuIOKAnENyZWF0aW5nIGFuIGV4dHJhIGZ1bmN0
aW9uIHRvIG1ha2Ugc3VyZSBmdXR1cmUgbW9kaWZpY2F0aW9ucyBoYXZlIG9ubHkgb25lIGV4aXQg
cGF0aOKAnSBzb3VuZHMgbGlrZSBhIGdvb2QgcmVhc29uLCB0aG91Z2guDQoNCiAtR2VvcmdlCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
