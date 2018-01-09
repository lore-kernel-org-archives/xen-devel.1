From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 52/74] xen: mark xenstore/console
 pages as RAM and add them to dom_io
Date: Tue, 09 Jan 2018 04:03:25 -0700
Message-ID: <5A54AF8D020000780019CA51@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-53-wei.liu2@citrix.com>
 <5A5384F1020000780019C3DE@prv-mh.provo.novell.com>
 <20180109092533.4gepqzc2xmdxnroo@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=o7xp=ee=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYrgs-0000E4-WC
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 11:03:35 +0000
In-Reply-To: <20180109092533.4gepqzc2xmdxnroo@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAxLjE4IGF0IDEwOjI1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSmFuIDA4LCAyMDE4IGF0IDA2OjQ5OjIxQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDQuMDEuMTggYXQgMTQ6MDYsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3
cm90ZToKPj4gPiArdm9pZCBfX2luaXQgaHlwZXJ2aXNvcl9pbml0X21lbW9yeSh2b2lkKQo+PiA+
ICt7Cj4+ID4gKyAgICB1aW50NjRfdCBwZm4gPSAwOwo+PiA+ICsgICAgbG9uZyByYzsKPj4gPiAr
Cj4+ID4gKyAgICBpZiAoICF4ZW5fZ3Vlc3QgKQo+PiA+ICsgICAgICAgIHJldHVybjsKPj4gPiAr
Cj4+ID4gKyNkZWZpbmUgU0hBUkVfUEFSQU0ocCkgKHsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ID4gKyAgICByYyA9IHhlbl9oeXBlcmNhbGxf
aHZtX2dldF9wYXJhbShwLCAmcGZuKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4g
PiArICAgIGlmICggcmMgKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPj4gPiArICAgICAgICBwYW5pYygiVW5hYmxlIHRvIGdl
dCAiICNwKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gPiAr
ICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QobWZuX3RvX3BhZ2UocGZuKSwgZG9tX2lvLCBY
RU5TSEFSRV93cml0YWJsZSk7IFwKPj4gCj4+IFdoeSBkb21faW8gcmF0aGVyIHRoYW4gdGhlIGNs
aWVudCBkb21haW4/Cj4gCj4gVGhlIGNsaWVudCBkb21haW4gaXMgbm90IHlldCBjcmVhdGVkIGF0
IHRoaXMgcG9pbnQuIFRoaXMgaXMgZXhhY3RseQo+IHRoZSBzYW1lIHRoYXQgWGVuIGRvZXMgZm9y
IHRoZSBsb3cgMU1pQiBmb3IgZXhhbXBsZS4KClRoZSBsb3cgMU1iIGlzIGJlaW5nIHRyZWF0ZWQg
YXMgTU1JTywgaGVuY2UgcmVtYWlucyBhc3NpZ25lZAp0byBkb21faW8uCgo+PiBUaGUgbW9yZSB0
aGF0IGRvbV9pbwo+PiBwYWdlcyBjYW4gb25seSBiZSBtYXBwZWQgYnkgcHJpdmlsZWdlZCBndWVz
dHMgKGFuZCBoZW5jZSBJCj4+IGFzc3VtZSB5b3UgbmVlZCBhbm90aGVyIHR3ZWFrIHNvbWV3aGVy
ZSB0aGlzIHdheSkuCj4gCj4gSSBqdXN0IHVzZSB1bnNoYXJlX3hlbl9wYWdlIGFuZCBzaGFyZSBp
dCBhZ2FpbiB3aXRoIHRoZSBndWVzdC4KCkFuZCB0aGVyZSBpcyBubyBvcHRpb24gb2Ygc2ltcGx5
IGRvaW5nIHRoZSBzaGFyaW5nIGhlcmUgbGF0ZXIsCndoZW4gdGhlIGRvbWFpbiBpcyBhbHJlYWR5
IGluIGV4aXN0ZW5jZT8KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
