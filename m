From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 22/32] libxl_qmp: Handle messages from
 QEMU
Date: Tue, 21 Aug 2018 09:58:57 +0100
Message-ID: <20180821085857.s7cl7x6vwtzqxcsw@citrix.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-23-anthony.perard@citrix.com>
 <20180802111737.bxzbk6cododv2dmj@mac>
 <20180803172500.GL1327@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7kme=le=citrix.com=prvs=7644f7420=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fs2VC-0007w2-9K
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 08:59:02 +0000
Content-Disposition: inline
In-Reply-To: <20180803172500.GL1327@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMDMsIDIwMTggYXQgMDY6MjU6MDBQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gPiA+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgYi90
b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKPiA+ID4gaW5kZXggNGEzODU4MDFiYS4uZTEwNGZl
YTk0MSAxMDA2NDQKPiA+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCj4gPiA+
ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+ID4gPiBAQCAtNjksNiArNjksMTAg
QEAgbGlieGxfZXJyb3IgPSBFbnVtZXJhdGlvbigiZXJyb3IiLCBbCj4gPiA+ICAgICAgKC0yMywg
Ik5PVEZPVU5EIiksCj4gPiA+ICAgICAgKC0yNCwgIkRPTUFJTl9ERVNUUk9ZRUQiKSwgIyBUYXJn
ZXQgZG9tYWluIGNlYXNlZCB0byBleGlzdCBkdXJpbmcgb3AKPiA+ID4gICAgICAoLTI1LCAiRkVB
VFVSRV9SRU1PVkVEIiksICMgRm9yIGZ1bmN0aW9uYWxpdHkgdGhhdCBoYXMgYmVlbiByZW1vdmVk
Cj4gPiA+ICsgICAgKC0yNiwgIlFNUF9HRU5FUklDX0VSUk9SIiksICMgdW5zcGVjaWZpZWQgcW1w
IGVycm9yCj4gPiA+ICsgICAgKC0yNywgIlFNUF9DT01NQU5EX05PVF9GT1VORCIpLCAjIHRoZSBy
ZXF1ZXN0ZWQgY29tbWFuZCBoYXMgbm90IGJlZW4gZm91bmQKPiA+ID4gKyAgICAoLTI4LCAiUU1Q
X0RFVklDRV9OT1RfQUNUSVZFIiksICMgYSBkZXZpY2UgaGFzIGZhaWxlZCB0byBiZSBiZWNvbWUg
YWN0aXZlCj4gPiA+ICsgICAgKC0yOSwgIlFNUF9ERVZJQ0VfTk9UX0ZPVU5EIiksICMgdGhlIHJl
cXVlc3RlZCBkZXZpY2UgaGFzIG5vdCBiZWVuIGZvdW5kCj4gPiAKPiA+IERvIHdlIHJlYWxseSBu
ZWVkIHN1Y2ggZ3JhbnVsYXJpdHkgZm9yIFFNUCBlcnJvcnM/IElzbid0IGl0IGVub3VnaCB0bwo+
ID4gaGF2ZSBhIHNpbmdsZSBFUlJPUl9RTVAgb3Igc2ltaWxhcj8KPiAKPiBObyBJIGRvbid0IHRo
aW5rIHNvLiBRTVBfQ09NTUFORF9OT1RfRk9VTkQgY2FuIGJlIHVzZWZ1bCB3aGVuIGEgcW1wCj4g
Y29tbWFuZCBpcyByZW1vdmVkICh0aGVyZSBpcyBhbHJlYWR5IG9uZSB0aGF0IGlzIGRlcHJlY2F0
ZWQgYW5kIHdlIHVzZSkuCj4gCj4gVGhlIGxhc3QgdHdvIGNvdWxkIGJlIHVzZWZ1bCB0byB1c2Vy
IG9mIGxpYnhsIGFzIHRoZXkgY291bGQgcHJvdmlkZQo+IGJldHRlciBlcnJvciBtZXNzYWdlcy4g
eGwgZG9uJ3QgY2FyZSBiZWNhdXNlIHdoYXRldmVyIGVycm9yIG1lc3NhZ2UgaXMKPiBhdHRhY2gg
dG8gdGhlIGVycm9yLCBpdCB3aWxsIGJlIHByaW50ZWQuCgpJZiB0aGUgdXNlcnMgb2YgbGlieGwg
YXJlbid0IGxpa2VseSB0byBjYXJlIGFib3V0IHRoZSBleGFjdCBlcnJvcgptZXNzYWdlcywgd2Ug
ZG9uJ3QgbmVlZCB0byBleHBvc2UgdGhlc2UgYXQgYWxsLiBUaGV5IGFyZSBtb3JlIHN1aXRhYmxl
CnRvIGJlIHB1dCB1bmRlciBsaWJ4bF9pbnRlcm5hbF90eXBlcy5pZGwuCgpBbmQgdGhlbiB5b3Ug
dHJhbnNsYXRlIHRoZSBpbnRlcm5hbCBlcnJvciBudW1iZXJzIGludG8gZXh0ZXJuYWwgb25lcwp3
aGVyZSBhcHByb3ByaWF0ZS4KCldlaS4KCgo+IAo+IFRoYW5rcywKPiAKPiAtLSAKPiBBbnRob255
IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
