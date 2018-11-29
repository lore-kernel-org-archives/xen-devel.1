From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 8/9] libxl: Kill QEMU by uid when possible
Date: Thu, 29 Nov 2018 12:00:08 +0000
Message-ID: <C5994DCA-A993-4BBD-9433-CD6DA9C47C32@citrix.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-8-george.dunlap@citrix.com>
 <8b086fb2-e018-a669-b90d-42ce2179eaa7@citrix.com>
 <20181128155758.GA14786@perard.uk.xensource.com>
 <20181129115524.4yjt2ff2hwwqjsgi@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wOoB=OI=citrix.com=prvs=864e58e47=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gSKzM-0002wA-6d
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 12:00:12 +0000
In-Reply-To: <20181129115524.4yjt2ff2hwwqjsgi@zion.uk.xensource.com>
Content-Language: en-US
Content-ID: <7F5297162A778A41959BEFC0DA764B4F@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gTm92IDI5LCAyMDE4LCBhdCAxMTo1NSBBTSwgV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIE5vdiAyOCwgMjAxOCBhdCAwMzo1Nzo1OFBN
ICswMDAwLCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4+IE9uIEZyaSwgTm92IDIzLCAyMDE4IGF0
IDA1OjE4OjU5UE0gKzAwMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+Pj4gT24gMTEvMjMvMTgg
NToxNSBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+PiBEb2VzIGxpYnhsX19xbXBfY2xlYW51
cCgpIG5lZWQgdG8gYmUgY2FsbGVkIGFmdGVyIHRoZSBraWxsKCkgaGFwcGVucz8NCj4+PiBJZiBu
b3QsIHdlIGNvdWxkIHB1dCB0aGlzIGJlZm9yZSB0aGUga2lsbCgpIGFuZCBhdm9pZCBoYXZpbmcg
dHdvIGNhbGwgc2l0ZXMuDQo+PiANCj4+IFFFTVUgaXMgc3VwcG9zZWQgdG8gY3JlYXRlIG1vbml0
b3Igc29ja2V0cyBiZWZvcmUgdGhlIGd1ZXN0IGlzIHJ1bm5pbmcsDQo+PiBldmVuIGJlZm9yZSBp
dCBkcm9wcyBwcml2aWxlZGdlLCBzbyBJIGRvbid0IHRoaW5rIGl0IG1hdHRlciB3aGVuIHdlIGBy
bWANCj4+IHRob3NlIHFtcCBzb2NrZXRzLiBUaGVyZSBhcmUgb25seSB1c2VmdWwgdG8gbGlieGwg
YW55d2F5LCBvbmNlIGxpYnhsDQo+PiBkb24ndCBuZWVkcyB0aGVtIHRoZXkgY2FuIGJlIHJlbW92
ZWQuDQo+PiANCj4+IFNvLCBiZWZvcmUga2lsbCgpIHNob3VsZCBiZSBmaW5lLg0KPiANCj4gV2l0
aCB0aGlzIHNjaGVtZSwgbXkgcXVlc3Rpb24gaXMgc3VwcG9zZWRseSB0aGVyZSBpcyBhIHJvZ3Vl
IFFFTVUsIHdpbGwNCj4gaXQgYmUgYWJsZSB0byByZWNyZWF0ZSB0aGVzZSBzb2NrZXRzIGFnYWlu
IGJ5IGZvcmtpbmcgc28gd2UgbWF5IGVuZCB1cA0KPiBoYXZpbmcgc29tZSBnYXJiYWdlIGx5aW5n
IGFyb3VuZCBhZnRlciBpdCBoYXMgYmVlbiBraWxsZWQ/DQoNCk5vOyBpdCBzaG91bGQgYXQgdGhh
dCBwb2ludCBiZSBkZXByaXZpbGVnZWQgYW5kIGNocm9vdGVkIGludG8gYSBkaXJlY3Rvcnkgb3du
ZWQgYnkgcm9vdDsgc28gaXQgc2hvdWxkbuKAmXQgYmUgYWJsZSB0byBjcmVhdGUgYW55IG5ldyBz
b2NrZXRzLg0KDQpJdCB3b3VsZG7igJl0IGJlIHRlcnJpYmx5IGhhcmQgdG8gaGF2ZSBhIGNvbW1v
biDigJxleGl04oCdIHRvIGJvdGggdGhlIGtpbGwtYnktcGlkIGFuZCBraWxsLWJ5LXVpZCBwYXRo
cyB0aGF0IGRpZCBpdCBvbmNlLCBidXQgaXQgd291bGQgaW52b2x2ZSBhZGRpbmcgWWV0IEFub3Ro
ZXIgRnVuY3Rpb247IGFuZCBlYWNoIGFkZGl0aW9uYWwgZnVuY3Rpb24gbWFrZXMgdGhlIGNvZGUg
YSBsaXR0bGUgYml0IG1vcmUgZGlmZmljdWx0IHRvIGZvbGxvdy4NCg0KIC1HZW9yZ2UKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
