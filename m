From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: Ping: [PATCH v3 0/4] x86/HVM: implement memory read
 caching
Date: Thu, 11 Oct 2018 15:54:14 +0000
Message-ID: <525825CF-D14C-4EA5-8B43-8F72BD7BC7CA@citrix.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <5BAA42D102000078001EBBEB@prv1-mh.provo.novell.com>
 <5BB34A1102000078001EDABE@prv1-mh.provo.novell.com>
 <57c23678-c8e6-d6d8-f0de-38a48b8936f2@citrix.com>
 <5BB368C902000078001EDBAF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=erva=mx=citrix.com=prvs=8152b1c74=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gAdI3-00019H-Qt
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 15:54:19 +0000
In-Reply-To: <5BB368C902000078001EDBAF@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <559B4139733B5B4BAB23DD3FE4C723C6@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQo+IE9uIE9jdCAyLCAyMDE4LCBhdCAxOjQ3IFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4+Pj4gT24gMDIuMTAuMTggYXQgMTI6NTEsIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+PiBUaGlzIGRvZXNuJ3QgYmVoYXZlIGxpa2Ug
cmVhbCBoYXJkd2FyZSwgYW5kIGRlZmluaXRlbHkgZG9lc24ndCBiZWhhdmUgYXMNCj4+IG5hbWVk
IC0gInN0cnVjdCBodm1lbXVsX2NhY2hlIiBpcyBzaW1wbHkgZmFsc2UuICBJZiBpdCB3ZXJlIG5h
bWVkDQo+PiBodm1lbXVsX3BzYyAob3Igc29tZSBvdGhlciB2YXJpYXRpb24gb24gUGFnaW5nIFN0
cnVjdHVyZSBDYWNoZSkgdGhlbiBpdA0KPj4gd291bGRuJ3QgYmUgc28gYmFkLCBhcyB0aGUgaW5k
aXZpZHVhbCBsZXZlbHMgZG8gbWFrZSBtb3JlIHNlbnNlIGluIHRoYXQNCj4+IGNvbnRleHQNCj4g
DQo+IEFzIHByZXZpb3VzbHkgcG9pbnRlZCBvdXQgKHdpdGhvdXQgYW55IHN1Z2dlc3Rpb24gY29t
aW5nIGJhY2sgZnJvbQ0KPiB5b3UpLCBJIGNob3NlIHRoZSBuYW1lICJjYWNoZSIgZm9yIHRoZSBs
YWNrIG9mIGEgYmV0dGVyIHRlcm0uIEhvd2V2ZXIsDQo+IEkgY2VydGFpbmx5IGRpc2FncmVlIHdp
dGggbmFtaW5nIGl0IFBTQyBvciBzb21lIHN1Y2gsIGFzIGl0cyBsZXZlbCB6ZXJvDQo+IGlzIGlu
dGVudGlvbmFsbHkgdGhlcmUgdG8gYmUgZXZlbnR1YWxseSB1c2VkIGZvciBub24tcGFnaW5nLXN0
cnVjdHVyZQ0KPiBkYXRhLg0KDQpJIGNhbiB0aGluayBvZiBsb3RzIG9mIGRlc2NyaXB0aXZlIG5h
bWVzIHdoaWNoIGNvdWxkIHlpZWxkIHVuaXF1ZSB0aHJlZS1sZXR0ZXIgYWNyb255bXM6DQoNCkxv
Z2ljYWwgUmVhZCBTZXF1ZW5jZQ0KTG9naWNhbCBSZWFkIFNlcmllcw0KTG9naWNhbCBSZWFkIFJl
Y29yZA0KUmVhZCBDb25zaXN0ZW5jeSBTdHJ1Y3R1cmUNCkNvbnNpc3RlbnQgUmVhZCBTdHJ1Y3R1
cmUNCkNvbnNpc3RlbnQgUmVhZCBSZWNvcmQNCkVtdWxhdGlvbiBSZWFkIFJlY29yZA0KW+KApl0N
Cg0KIC1HZW9yZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
