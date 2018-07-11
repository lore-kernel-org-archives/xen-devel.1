From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Wed, 11 Jul 2018 11:11:05 +0200
Message-ID: <20180711091105.GD26572@olila.local.net-space.pl>
References: <5B449CC702000078001D2A03@prv1-mh.provo.novell.com>
 <20180710134954.twd2cs6hhdfqumkq@mac.bytemobile.com>
 <5B44BE0202000078001D2B93@prv1-mh.provo.novell.com>
 <20180710153509.p4o2ffk22iqsqkif@mac.bytemobile.com>
 <5B45AD2A02000078001D2F16@prv1-mh.provo.novell.com>
 <20180711082936.y6p2eluyspbhno4j@mac.bytemobile.com>
 <5B45BFFF0200008503CB1CCA@prv1-mh.provo.novell.com>
 <5B45C45902000078001D2FA0@prv1-mh.provo.novell.com>
 <20180711085556.GC26572@olila.local.net-space.pl>
 <20180711085920.dkoyvia6elgwldvg@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=argw=j3=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fdB9V-0001tZ-Td
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 09:11:13 +0000
Content-Disposition: inline
In-Reply-To: <20180711085920.dkoyvia6elgwldvg@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTEsIDIwMTggYXQgMTA6NTk6MjBBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEp1bCAxMSwgMjAxOCBhdCAxMDo1NTo1NkFNICswMjAwLCBEYW5p
ZWwgS2lwZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAxMSwgMjAxOCBhdCAwMjo0ODoyNUFNIC0w
NjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gPj4+IE9uIDExLjA3LjE4IGF0IDEwOjI5LCA8
cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgSnVsIDExLCAyMDE4
IGF0IDAxOjA5OjMwQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+PiBBbm90aGVy
IHBvc3NpYmxlIHRoaW5nIHRvIHRyeSBtaWdodCBiZSB0byBtYWtlIHRoZSBleHRlcm4gZGVjbGFy
YXRpb24KPiA+ID4gPj4gb2YgdGhlIHN5bWJvbCB3ZWFrLCBhbmQgZHJvcCB0aGUgb2ZmZW5kaW5n
IGxpbmUgYWx0b2dldGhlci4KPiA+ID4gPgo+ID4gPiA+IE9oLCB0aGF0IGRpZG4ndCBvY2N1ciB0
byBtZSwgYW5kIGRvZXMgc2VlbSB0byB3b3JrLiBCZWxvdyBpcyB3aGF0IEkndmUKPiA+ID4gPiBz
dWNjZXNzZnVsbHkgdGVzdGVkOgo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni94ZW4ubGRzLlMgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gPiA+ID4gaW5kZXggNWYy
MzkyNjIxZC4uZDg0NzA0NzQ1ZSAxMDA2NDQKPiA+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYveGVu
Lmxkcy5TCj4gPiA+ID4gKysrIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gPiA+IEBAIC0y
OTcsOCArMjk3LDYgQEAgU0VDVElPTlMKPiA+ID4gPiAgICB9IDp0ZXh0Cj4gPiA+ID4gICNlbmRp
Zgo+ID4gPiA+Cj4gPiA+ID4gLSAgZWZpID0gREVGSU5FRChlZmkpID8gZWZpIDogLjsKPiA+ID4g
PiAtCj4gPiA+ID4gICAgLyogU2VjdGlvbnMgdG8gYmUgZGlzY2FyZGVkICovCj4gPiA+ID4gICAg
L0RJU0NBUkQvIDogewo+ID4gPiA+ICAgICAgICAgKiguZXhpdC50ZXh0KQo+ID4gPiA+IGRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vZWZpLmggYi94ZW4vaW5jbHVkZS94ZW4vZWZpLmgKPiA+
ID4gPiBpbmRleCA0NGI3ZDNlYzNhLi44ZTI1YmZhZWJiIDEwMDY0NAo+ID4gPiA+IC0tLSBhL3hl
bi9pbmNsdWRlL3hlbi9lZmkuaAo+ID4gPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9lZmkuaAo+
ID4gPiA+IEBAIC0yMSw3ICsyMSw3IEBAIHN0cnVjdCBlZmkgewo+ID4gPiA+ICAgICAgdW5zaWdu
ZWQgbG9uZyBzbWJpb3MzOyAgICAgIC8qIFNNQklPUyB2MyB0YWJsZSAqLwo+ID4gPiA+ICB9Owo+
ID4gPiA+Cj4gPiA+ID4gLWV4dGVybiBzdHJ1Y3QgZWZpIGVmaTsKPiA+ID4gPiArZXh0ZXJuIHN0
cnVjdCBlZmkgZWZpIF9fYXR0cmlidXRlX18oKHdlYWspKTsKPiA+ID4gPgo+ID4gPiA+ICAjaWZu
ZGVmIF9fQVNTRU1CTFlfXwo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBJZiB0aGF0J3MgYWNjZXB0
YWJsZSBJIHdpbGwgcmVmcmVzaCBhbmQgcmVzZW5kIHRoZSBwYXRjaC4KPiA+ID4KPiA+ID4gTGV0
J3Mgc2VlIHdoYXQgRGFuaWVsIGFuZCBtYXliZSBvdGhlcnMgc2F5LiBJZiB5b3UgZ28gdGhhdCBy
b3V0ZSwKPiA+ID4gY291bGQgSSB0YWxrIHlvdSBpbnRvIGFkZGluZyBfX3dlYWsgdG8gY29tcGls
ZXIuaCAoSSBkaXNsaWtlIHRvIHN1Z2dlc3QKPiA+ID4gdGhlIGxlYWRpbmcgZG91YmxlIHVuZGVy
c2NvcmVzLCBidXQgbm90IHVzaW5nIHRoZW0gdGhlcmUgd291bGQganVzdAo+ID4gPiBiZSB0b28g
aW5jb25zaXN0ZW50IHdpdGggdGhlIHJlc3Qgb2YgdGhpcyBoZWFkZXIpPwo+ID4KPiA+IElmIHRo
aXMgd29ya3MgaW4gYWxsIGNhc2VzIChidWlsZCB3aXRoIHRvb2xzIHdpdGggYW5kIHdpdGhvdXQg
UEUgc3VwcG9ydCwKPiA+IHhlbi5lZmkgYW5kIHhlbi5neiB2aWEgTXVsdGlib290MiBwcm90byBi
b290IGNvcnJlY3RseSBvbiBFRkkgcGxhdGZvcm1zLAo+ID4gZXRjLikgdGhlbiBJIGFtIE9LIHdp
dGggdGhhdC4KPgo+IFllcywgSSd2ZSB0ZXN0ZWQgaXQgd2l0aCBib3RoIGxpbmtlcnMgKFBFIGNh
cGFibGUgYW5kIGluY2FwYWJsZSkgYW5kCj4gaXQgd29ya3MuCgpHcmVhdCEgV2hhdCBhYm91dCBi
b290IG9uIEVGSSBwbGF0Zm9ybXM/IFByb2JhYmx5IGl0IHdvcmtzIGJ1dCBJIHdvdWxkCmxpa2Ug
dG8gYmUgc3VyZS4KCkRhbmllbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
