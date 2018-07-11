From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Wed, 11 Jul 2018 10:59:20 +0200
Message-ID: <20180711085920.dkoyvia6elgwldvg@mac.bytemobile.com>
References: <20180710110052.GY26572@olila.local.net-space.pl>
 <5B449CC702000078001D2A03@prv1-mh.provo.novell.com>
 <20180710134954.twd2cs6hhdfqumkq@mac.bytemobile.com>
 <5B44BE0202000078001D2B93@prv1-mh.provo.novell.com>
 <20180710153509.p4o2ffk22iqsqkif@mac.bytemobile.com>
 <5B45AD2A02000078001D2F16@prv1-mh.provo.novell.com>
 <20180711082936.y6p2eluyspbhno4j@mac.bytemobile.com>
 <5B45BFFF0200008503CB1CCA@prv1-mh.provo.novell.com>
 <5B45C45902000078001D2FA0@prv1-mh.provo.novell.com>
 <20180711085556.GC26572@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ebcd=j3=citrix.com=prvs=7236e92fb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fdAy9-0008Oe-0W
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 08:59:29 +0000
Content-Disposition: inline
In-Reply-To: <20180711085556.GC26572@olila.local.net-space.pl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTEsIDIwMTggYXQgMTA6NTU6NTZBTSArMDIwMCwgRGFuaWVsIEtpcGVyIHdy
b3RlOgo+IE9uIFdlZCwgSnVsIDExLCAyMDE4IGF0IDAyOjQ4OjI1QU0gLTA2MDAsIEphbiBCZXVs
aWNoIHdyb3RlOgo+ID4gPj4+IE9uIDExLjA3LjE4IGF0IDEwOjI5LCA8cm9nZXIucGF1QGNpdHJp
eC5jb20+IHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1bCAxMSwgMjAxOCBhdCAwMTowOTozMEFNIC0w
NjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4+IEFub3RoZXIgcG9zc2libGUgdGhpbmcgdG8g
dHJ5IG1pZ2h0IGJlIHRvIG1ha2UgdGhlIGV4dGVybiBkZWNsYXJhdGlvbgo+ID4gPj4gb2YgdGhl
IHN5bWJvbCB3ZWFrLCBhbmQgZHJvcCB0aGUgb2ZmZW5kaW5nIGxpbmUgYWx0b2dldGhlci4KPiA+
ID4KPiA+ID4gT2gsIHRoYXQgZGlkbid0IG9jY3VyIHRvIG1lLCBhbmQgZG9lcyBzZWVtIHRvIHdv
cmsuIEJlbG93IGlzIHdoYXQgSSd2ZQo+ID4gPiBzdWNjZXNzZnVsbHkgdGVzdGVkOgo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3g4Ni94
ZW4ubGRzLlMKPiA+ID4gaW5kZXggNWYyMzkyNjIxZC4uZDg0NzA0NzQ1ZSAxMDA2NDQKPiA+ID4g
LS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gPiArKysgYi94ZW4vYXJjaC94ODYveGVu
Lmxkcy5TCj4gPiA+IEBAIC0yOTcsOCArMjk3LDYgQEAgU0VDVElPTlMKPiA+ID4gICAgfSA6dGV4
dAo+ID4gPiAgI2VuZGlmCj4gPiA+Cj4gPiA+IC0gIGVmaSA9IERFRklORUQoZWZpKSA/IGVmaSA6
IC47Cj4gPiA+IC0KPiA+ID4gICAgLyogU2VjdGlvbnMgdG8gYmUgZGlzY2FyZGVkICovCj4gPiA+
ICAgIC9ESVNDQVJELyA6IHsKPiA+ID4gICAgICAgICAqKC5leGl0LnRleHQpCj4gPiA+IGRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vZWZpLmggYi94ZW4vaW5jbHVkZS94ZW4vZWZpLmgKPiA+
ID4gaW5kZXggNDRiN2QzZWMzYS4uOGUyNWJmYWViYiAxMDA2NDQKPiA+ID4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL2VmaS5oCj4gPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9lZmkuaAo+ID4gPiBA
QCAtMjEsNyArMjEsNyBAQCBzdHJ1Y3QgZWZpIHsKPiA+ID4gICAgICB1bnNpZ25lZCBsb25nIHNt
YmlvczM7ICAgICAgLyogU01CSU9TIHYzIHRhYmxlICovCj4gPiA+ICB9Owo+ID4gPgo+ID4gPiAt
ZXh0ZXJuIHN0cnVjdCBlZmkgZWZpOwo+ID4gPiArZXh0ZXJuIHN0cnVjdCBlZmkgZWZpIF9fYXR0
cmlidXRlX18oKHdlYWspKTsKPiA+ID4KPiA+ID4gICNpZm5kZWYgX19BU1NFTUJMWV9fCj4gPiA+
Cj4gPiA+Cj4gPiA+IElmIHRoYXQncyBhY2NlcHRhYmxlIEkgd2lsbCByZWZyZXNoIGFuZCByZXNl
bmQgdGhlIHBhdGNoLgo+ID4KPiA+IExldCdzIHNlZSB3aGF0IERhbmllbCBhbmQgbWF5YmUgb3Ro
ZXJzIHNheS4gSWYgeW91IGdvIHRoYXQgcm91dGUsCj4gPiBjb3VsZCBJIHRhbGsgeW91IGludG8g
YWRkaW5nIF9fd2VhayB0byBjb21waWxlci5oIChJIGRpc2xpa2UgdG8gc3VnZ2VzdAo+ID4gdGhl
IGxlYWRpbmcgZG91YmxlIHVuZGVyc2NvcmVzLCBidXQgbm90IHVzaW5nIHRoZW0gdGhlcmUgd291
bGQganVzdAo+ID4gYmUgdG9vIGluY29uc2lzdGVudCB3aXRoIHRoZSByZXN0IG9mIHRoaXMgaGVh
ZGVyKT8KPiAKPiBJZiB0aGlzIHdvcmtzIGluIGFsbCBjYXNlcyAoYnVpbGQgd2l0aCB0b29scyB3
aXRoIGFuZCB3aXRob3V0IFBFIHN1cHBvcnQsCj4geGVuLmVmaSBhbmQgeGVuLmd6IHZpYSBNdWx0
aWJvb3QyIHByb3RvIGJvb3QgY29ycmVjdGx5IG9uIEVGSSBwbGF0Zm9ybXMsCj4gZXRjLikgdGhl
biBJIGFtIE9LIHdpdGggdGhhdC4KClllcywgSSd2ZSB0ZXN0ZWQgaXQgd2l0aCBib3RoIGxpbmtl
cnMgKFBFIGNhcGFibGUgYW5kIGluY2FwYWJsZSkgYW5kCml0IHdvcmtzLgoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
