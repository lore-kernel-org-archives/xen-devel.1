From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: Ping: [PATCH v3 0/4] x86/HVM: implement memory read
 caching
Date: Thu, 11 Oct 2018 16:33:07 +0000
Message-ID: <F05D0D1B-0119-47A4-8643-5E6411F1233B@citrix.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <5BAA42D102000078001EBBEB@prv1-mh.provo.novell.com>
 <5BB34A1102000078001EDABE@prv1-mh.provo.novell.com>
 <57c23678-c8e6-d6d8-f0de-38a48b8936f2@citrix.com>
 <5BB368C902000078001EDBAF@prv1-mh.provo.novell.com>
 <525825CF-D14C-4EA5-8B43-8F72BD7BC7CA@citrix.com>
 <5BBF772802000078001F0CAD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=erva=mx=citrix.com=prvs=8152b1c74=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gAdtg-0005c6-Eg
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 16:33:12 +0000
In-Reply-To: <5BBF772802000078001F0CAD@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <D689FA25F65AB942B242260F17DBF8C8@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gT2N0IDExLCAyMDE4LCBhdCA1OjE1IFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4+Pj4gT24gMTEuMTAuMTggYXQgMTc6NTQsIDxHZW9yZ2Uu
RHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4+PiBPbiBPY3QgMiwgMjAxOCwgYXQgMTo0
NyBQTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+Pj4+
PiBPbiAwMi4xMC4xOCBhdCAxMjo1MSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3Rl
Og0KPj4+IA0KPj4+PiBUaGlzIGRvZXNuJ3QgYmVoYXZlIGxpa2UgcmVhbCBoYXJkd2FyZSwgYW5k
IGRlZmluaXRlbHkgZG9lc24ndCBiZWhhdmUgYXMNCj4+Pj4gbmFtZWQgLSAic3RydWN0IGh2bWVt
dWxfY2FjaGUiIGlzIHNpbXBseSBmYWxzZS4gIElmIGl0IHdlcmUgbmFtZWQNCj4+Pj4gaHZtZW11
bF9wc2MgKG9yIHNvbWUgb3RoZXIgdmFyaWF0aW9uIG9uIFBhZ2luZyBTdHJ1Y3R1cmUgQ2FjaGUp
IHRoZW4gaXQNCj4+Pj4gd291bGRuJ3QgYmUgc28gYmFkLCBhcyB0aGUgaW5kaXZpZHVhbCBsZXZl
bHMgZG8gbWFrZSBtb3JlIHNlbnNlIGluIHRoYXQNCj4+Pj4gY29udGV4dA0KPj4+IA0KPj4+IEFz
IHByZXZpb3VzbHkgcG9pbnRlZCBvdXQgKHdpdGhvdXQgYW55IHN1Z2dlc3Rpb24gY29taW5nIGJh
Y2sgZnJvbQ0KPj4+IHlvdSksIEkgY2hvc2UgdGhlIG5hbWUgImNhY2hlIiBmb3IgdGhlIGxhY2sg
b2YgYSBiZXR0ZXIgdGVybS4gSG93ZXZlciwNCj4+PiBJIGNlcnRhaW5seSBkaXNhZ3JlZSB3aXRo
IG5hbWluZyBpdCBQU0Mgb3Igc29tZSBzdWNoLCBhcyBpdHMgbGV2ZWwgemVybw0KPj4+IGlzIGlu
dGVudGlvbmFsbHkgdGhlcmUgdG8gYmUgZXZlbnR1YWxseSB1c2VkIGZvciBub24tcGFnaW5nLXN0
cnVjdHVyZQ0KPj4+IGRhdGEuDQo+PiANCj4+IEkgY2FuIHRoaW5rIG9mIGxvdHMgb2YgZGVzY3Jp
cHRpdmUgbmFtZXMgd2hpY2ggY291bGQgeWllbGQgdW5pcXVlIA0KPj4gdGhyZWUtbGV0dGVyIGFj
cm9ueW1zOg0KPj4gDQo+PiBMb2dpY2FsIFJlYWQgU2VxdWVuY2UNCj4+IExvZ2ljYWwgUmVhZCBT
ZXJpZXMNCj4+IExvZ2ljYWwgUmVhZCBSZWNvcmQNCj4+IFJlYWQgQ29uc2lzdGVuY3kgU3RydWN0
dXJlDQo+PiBDb25zaXN0ZW50IFJlYWQgU3RydWN0dXJlDQo+PiBDb25zaXN0ZW50IFJlYWQgUmVj
b3JkDQo+PiBFbXVsYXRpb24gUmVhZCBSZWNvcmQNCj4+IFvigKZdDQo+IA0KPiBXZWxsLCBJJ20g
bm90IHN1cmUgTFJTLCBMUlIsIFJDUywgQ1JTLCBDUlIsIG9yIEVSUiB3b3VsZCBiZQ0KPiBlYXNp
bHkgcmVjb2duaXphYmxlIGFzIHdoYXQgdGhleSBzdGFuZCBmb3IuIFRvIGJlIGhvbmVzdCBJJ2QN
Cj4gcHJlZmVyIGEgbm9uLWFjcm9ueW0uIERpZCB5b3Ugc2VlIG15IGNvbnNpZGVyYXRpb24gdG93
YXJkcw0KPiAibGF0Y2jigJ0/DQoNCk9mIGNvdXJzZSBub3Q7IHRoYXTigJlzIHdoeSB5b3UgcHV0
IHRoZSBsb25nIGZvcm0gbmFtZSBpbiBhIGNvbW1lbnQgbmVhciB0aGUgZGVjbGFyYXRpb24uIDot
KQ0KDQpJIGRvbuKAmXQgdGhpbmsgSeKAmXZlIHBlcnNvbmFsbHkgdXNlZCDigJxsYXRjaOKAnSB3
aXRoIHRoYXQgbWVhbmluZyB2ZXJ5IGZyZXF1ZW50bHkgKGF0IGxlYXN0IG5vdCBpbiB0aGUgbGFz
dCAxMCB5ZWFycyksIHNvIHRvIG1lIGl0IHNvdW5kcyBhIGJpdCBvYnNjdXJlLiAgSSB3b3VsZCBw
cm9iYWJseSBnbyB3aXRoIHNvbWV0aGluZyBlbHNlIG15c2VsZiBidXQgSSBkb27igJl0IG9iamVj
dCB0byBpdC4NCg0KIC1HZW9yZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
