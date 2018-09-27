From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH] tools/ocaml: Add OCaml binding of virq bind
Date: Thu, 27 Sep 2018 10:16:18 +0000
Message-ID: <724F0AED-A1ED-4B4C-815A-1BB96A6B2955@citrix.com>
References: <20180927075304.6178-1-yang.qian@citrix.com>
 <d75655da-bdeb-d937-7e41-217ba39081d5@citrix.com>
 <E5FD578E-7AC8-4B02-A979-41F1B0E7D87B@citrix.com>
 <9d3f94b3-d59f-00f4-a1b8-be6711c09b3d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jp5q=mj=citrix.com=prvs=801a46d84=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1g5TLI-0008R3-Uj
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 10:16:20 +0000
In-Reply-To: <9d3f94b3-d59f-00f4-a1b8-be6711c09b3d@citrix.com>
Content-Language: en-US
Content-ID: <2A3ABEC051F5B943AECFCB0943CD636F@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Yang Qian <yang.qian@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Yang Qian <krizex@gmail.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gMjcgU2VwIDIwMTgsIGF0IDExOjE1LCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDI3LzA5LzE4IDExOjExLCBDaHJpc3Rp
YW4gTGluZGlnIHdyb3RlOg0KPj4gDQo+Pj4gT24gMjcgU2VwIDIwMTgsIGF0IDA5OjU5LCBBbmRy
ZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4+PiANCj4+PiBP
biAyNy8wOS8xOCAwODo1MywgWWFuZyBRaWFuIHdyb3RlOg0KPj4+PiAxLiBBZGQgYSBjb21tb24g
YmluZCB2aXJxIGZ1bmN0aW9uDQo+Pj4+IDIuIFJlZHVjZSB0aGUgc3R1YiBjb2RlIG9mIGBiaW5k
X2RvbV9leGNfdmlycWANCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFlhbmcgUWlhbiA8eWFu
Zy5xaWFuQGNpdHJpeC5jb20+DQo+Pj4gQ0MnaW5nIHRoZSByZWxldmFudCBtYWludGFpbmVycy4N
Cj4+PiANCj4+PiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4gKGZvcndhcmRpbmcgbXkNCj4+PiBpbnRlcm5hbCByZXZpZXcgb2YgdGhpcyBwYXRj
aCkNCj4+IFRoZXJlIGlzIGEgZGlzY3Vzc2lvbiBhYm91dCBjYW1sX3tsZWF2ZSxlbnRlcn1fYmxv
Y2tpbmdfc2VjdGlvbiByZXF1aXJlZCBmb3IgdGhpcyB0byB3b3JrIGluIGEgdGhyZWFkIGNvbnRl
eHQgdGhhdCBpcyBub3QgeWV0IGFkZHJlc3NlZCBpbiB0aGUgcGF0Y2guDQo+IA0KPiBSaWdodCwg
YnV0IHRoYXQgaXMganVzdCBhIHBlcmZvcm1hbmNlIGlzc3VlIGlzIGl0IG5vdD8gIFdlIGhvbGQg
dGhlIEdDDQo+IGxvY2sgbG9uZ2VyIHRoYW4gd2UgbmVlZCB0by4NCj4gDQo+IGkuZS4gQUZBQ0lU
LCB0aGF0IGlzIGEgZ29vZCBmb2xsb3d1cCBwYXRjaCwgYnV0IGRvZXNuJ3QgaW52YWxpZGF0ZSB0
aGlzIG9uZT8NCj4gDQo+IH5BbmRyZXcNCg0KWW91IGFyZSBjb3JyZWN0LiBJdCBkb2VzIG5vdCBp
bnZhbGlkYXRlIHRoaXMgcGF0Y2guDQoNCuKAlCBDaHJpc3RpYW4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
