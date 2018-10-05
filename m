From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] fix uninitialized variable error in
 do_poll()
Date: Fri, 5 Oct 2018 12:25:08 +0100
Message-ID: <20181005112508.4xueqrjv7bysjnpi@zion.uk.xensource.com>
References: <5BB738FA02000078001EEB89@prv1-mh.provo.novell.com>
 <20181005102855.vldsq4kolbs2diuy@zion.uk.xensource.com>
 <5BB7497502000078001EEC9A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qudt=mr=citrix.com=prvs=80982b68a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g8OEL-0006NG-2Q
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 11:25:13 +0000
Content-Disposition: inline
In-Reply-To: <5BB7497502000078001EEC9A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMDUsIDIwMTggYXQgMDU6MjI6MjlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA1LjEwLjE4IGF0IDEyOjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIE9jdCAwNSwgMjAxOCBhdCAwNDoxMjoxMEFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiBOb3cgdGhhdCBDT05GSUdfSFZNIGNhbiAoYW5kIHNob3VsZCkgYmUg
dHVybmVkIG9mZiBmb3IgdGhlIHNoaW0sIGdjYyA4LjIKPiA+PiBhcHBhcmVudGx5IGlzIG5vIGxv
bmdlciBzdXJlIHRoYXQgInBvcnQiIGlzIGluZGVlZCBpbml0aWFsaXplZCBhdAo+ID4+IAo+ID4+
ICAgICBpZiAoIHNjaGVkX3BvbGwtPm5yX3BvcnRzID09IDEgKQo+ID4+ICAgICAgICAgdi0+cG9s
bF9ldnRjaG4gPSBwb3J0Owo+ID4+IAo+ID4+IEl0IGRvZXNuJ3QgbG9vayB0byBiZSBpbXBvc3Np
YmxlIGZvciB0aGUgY29tcGlsZXIgdG8gcHJvdmUgaXQgaXMgbm90LAo+ID4+IGJ1dCB3ZSBhbHNv
IGNhbid0IHJlbHkgb24gdGhhdCB0byBiZSB0aGUgY2FzZS4gQWRkIGFuIGluaXRpYWxpemVyLgo+
ID4+IAo+ID4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
PiA+IAo+ID4gVEJIIEkgZmFpbCB0byBzZWUgaG93IENPTkZJR19IVk0gd291bGQgYWZmZWN0IGRv
X3BvbGwuIEFsc28gdGhlcmUgaXMKPiA+IGFscmVhZHkgYnVpbGQgdGVzdCB3aXRoIGdjYyA4LjIg
d2hpY2ggbmV2ZXIgZGlzY292ZXJlZCB0aGUgaXNzdWUgeW91Cj4gPiBkZXNjcmliZWQuCj4gCj4g
SSBjYW4ndCBleHBsYWluIHRoZSBzdWRkZW4gZGlhZ25vc3RpYyB0b28gKHdpdGhvdXQgdGFraW5n
IGFwYXJ0IHdoYXQKPiBleGFjdGx5IHRoZSBjb21waWxlciBkb2VzKSwgYnV0IHRoZSBzYW1lIGNv
bmZpZyAoanVzdCB3aXRoIEhWTT15KQo+IGJ1aWx0IGZpbmUgYmVmb3JlLiBXaXRob3V0IGFueSBm
dXJ0aGVyIGluc2lnaHQgKHdoaWNoIEkgZG9uJ3QgdGhpbmsgaXMKPiB3b3J0aCB0aGUgdGltZSkg
SSBkb24ndCBzZWUgaG93IEkgY291bGQgaW1wcm92ZSB0aGUgZGVzY3JpcHRpb24uCgpPaCB3ZWxs
LgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgoKPiAKPiBKYW4KPiAK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
