From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2 05/10] libxl: Do root checks once in
 libxl__domain_get_device_model_uid
Date: Thu, 20 Dec 2018 22:12:28 +0000
Message-ID: <9E1B3F6A-8BD6-4C16-9422-1A02B18A732C@citrix.com>
References: <20181206150252.30766-1-george.dunlap@citrix.com>
 <20181206150252.30766-5-george.dunlap@citrix.com>
 <23569.11525.449911.872788@mariner.uk.xensource.com>
 <61716EAF-E96D-44B9-A56D-6841C1FDB9E4@citrix.com>
 <23577.3378.432130.113064@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z86S=O5=citrix.com=prvs=885450f5c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ga6YR-00012R-VY
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 22:12:32 +0000
In-Reply-To: <23577.3378.432130.113064@mariner.uk.xensource.com>
Content-Language: en-US
Content-ID: <29CB1D92CE44CD45BDD6D20D54B9995D@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQo+IE9uIERlYyAxOCwgMjAxOCwgYXQgMzowNyBQTSwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4+IElmIHdlIHN3aXRjaCB0aGUgZWFybGllciBgcmV0
dXJuIDBgIGluIHRoZSAhZG1fcmVzdHJpY3QgY29uZGl0aW9uYWwgdG8gYSDigJxnb3RvIG91dOKA
nSwgdGhlbiB0aGlzIHdvdWxkIHR1cm4gaW50bzoNCj4gDQo+IEkgdGhpbmsgc2V0dGluZyBpbnRl
bmRlZF91aWQ9PTAgd2hlbiB1c2VyPT0wIGlzIGEgaG9zdGFnZSB0byBmb3J0dW5lLg0KPiBXaHkg
bm90IHNldCBpdCB0byAodWlkX3QpLTEgPw0KPiANCj4gVGhlbiB5b3Ugd3JpdGU6DQo+IA0KPiAg
aWYgKCFyYykgew0KPiAgICAgaWYgKGludGVuZGVkX3VpZCA9PSAwKSB7DQo+ICAgICAgICAgY29t
cGxhaW4NCj4gICAgICAgICByYyA9IEVSUk9SX0lOVkFMOw0KPiAgICAgfQ0KPiAgfQ0KPiAgaWYg
KCFyYykgew0KPiAgICAgc2F2ZSB1c2VyIGFuZCBpbnRlbmRlZF91aWQNCj4gIH0NCj4gDQo+PiBJ
ZiB5b3UgaGF2ZSBhIGZhdm9yaXRlIGNvbG9yIGl0IG1pZ2h0IGJlIGJldHRlciBqdXN0IHRvIHRl
bGwgbWUuIDotKQ0KPiANCj4gRG8geW91IHNlZSB3aHkgSSBwcmVmZXIgdGhlIGFib3ZlID8NCg0K
Tm90IGF0IGFsbCBJ4oCZbSBhZnJhaWQuICBFc3BlY2lhbGx5IG5vdyB0aGF0IHdlIGhhdmUgdHdv
IHNlcGFyYXRlIOKAnGlmICghcmMp4oCdIGNoZWNrcywgIEkgdGhpbmsgaGF2aW5nIGFuIGV4dHJh
IGxhYmVsIHRvIGp1bXAgdG8gd2hlbiB3ZSBrbm93IHRoZSBjaGVjayBuZWVkcyB0byBiZSBkb25l
IG1ha2VzIHRoZSBjb2RlIGJvdGggbW9yZSBhZXN0aGV0aWNhbGx5IHBsZWFzaW5nIGFuZCBlYXNp
ZXIgdG8gdW5kZXJzdGFuZC4gIEJ1dCBpdOKAmXMgeW91ciBob3VzZSwgaWYgeW91IHdhbnQgaXQg
b3JhbmdlIGFuZCBwdXJwbGUsIHRoYXTigJlzIHdoYXQgY29sb3IgSeKAmWxsIHBhaW50IGl0LiA6
LSkNCg0KIC1HZW9yZ2UNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
