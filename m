From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Wed, 11 Jul 2018 02:48:25 -0600
Message-ID: <5B45C45902000078001D2FA0@prv1-mh.provo.novell.com>
References: <20180704104900.GI4670@olila.local.net-space.pl>
 <20180705074757.s4ztvfm56crljopt@mac.bytemobile.com>
 <20180706134839.GJ26572@olila.local.net-space.pl>
 <20180709164516.3n5ht4qq5kjhp3mh@mac.bytemobile.com>
 <20180710110052.GY26572@olila.local.net-space.pl>
 <5B449CC702000078001D2A03@prv1-mh.provo.novell.com>
 <20180710134954.twd2cs6hhdfqumkq@mac.bytemobile.com>
 <5B44BE0202000078001D2B93@prv1-mh.provo.novell.com>
 <20180710153509.p4o2ffk22iqsqkif@mac.bytemobile.com>
 <5B45AD2A02000078001D2F16@prv1-mh.provo.novell.com>
 <20180711082936.y6p2eluyspbhno4j@mac.bytemobile.com>
 <5B45BFFF0200008503CB1CCA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t1xz=j3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fdAnV-00077v-7A
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 08:48:29 +0000
In-Reply-To: <5B45BFFF0200008503CB1CCA@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA3LjE4IGF0IDEwOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgSnVsIDExLCAyMDE4IGF0IDAxOjA5OjMwQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBBbm90aGVyIHBvc3NpYmxlIHRoaW5nIHRvIHRyeSBtaWdodCBiZSB0byBtYWtlIHRo
ZSBleHRlcm4gZGVjbGFyYXRpb24KPj4gb2YgdGhlIHN5bWJvbCB3ZWFrLCBhbmQgZHJvcCB0aGUg
b2ZmZW5kaW5nIGxpbmUgYWx0b2dldGhlci4KPiAKPiBPaCwgdGhhdCBkaWRuJ3Qgb2NjdXIgdG8g
bWUsIGFuZCBkb2VzIHNlZW0gdG8gd29yay4gQmVsb3cgaXMgd2hhdCBJJ3ZlCj4gc3VjY2Vzc2Z1
bGx5IHRlc3RlZDoKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hl
bi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiBpbmRleCA1ZjIzOTI2MjFkLi5kODQ3MDQ3NDVlIDEwMDY0
NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiArKysgYi94ZW4vYXJjaC94ODYveGVu
Lmxkcy5TCj4gQEAgLTI5Nyw4ICsyOTcsNiBAQCBTRUNUSU9OUwo+ICAgIH0gOnRleHQKPiAgI2Vu
ZGlmCj4gIAo+IC0gIGVmaSA9IERFRklORUQoZWZpKSA/IGVmaSA6IC47Cj4gLQo+ICAgIC8qIFNl
Y3Rpb25zIHRvIGJlIGRpc2NhcmRlZCAqLwo+ICAgIC9ESVNDQVJELyA6IHsKPiAgICAgICAgICoo
LmV4aXQudGV4dCkKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2VmaS5oIGIveGVuL2lu
Y2x1ZGUveGVuL2VmaS5oCj4gaW5kZXggNDRiN2QzZWMzYS4uOGUyNWJmYWViYiAxMDA2NDQKPiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vZWZpLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZWZpLmgK
PiBAQCAtMjEsNyArMjEsNyBAQCBzdHJ1Y3QgZWZpIHsKPiAgICAgIHVuc2lnbmVkIGxvbmcgc21i
aW9zMzsgICAgICAvKiBTTUJJT1MgdjMgdGFibGUgKi8KPiAgfTsKPiAgCj4gLWV4dGVybiBzdHJ1
Y3QgZWZpIGVmaTsKPiArZXh0ZXJuIHN0cnVjdCBlZmkgZWZpIF9fYXR0cmlidXRlX18oKHdlYWsp
KTsKPiAgCj4gICNpZm5kZWYgX19BU1NFTUJMWV9fCj4gIAo+IAo+IElmIHRoYXQncyBhY2NlcHRh
YmxlIEkgd2lsbCByZWZyZXNoIGFuZCByZXNlbmQgdGhlIHBhdGNoLgoKTGV0J3Mgc2VlIHdoYXQg
RGFuaWVsIGFuZCBtYXliZSBvdGhlcnMgc2F5LiBJZiB5b3UgZ28gdGhhdCByb3V0ZSwKY291bGQg
SSB0YWxrIHlvdSBpbnRvIGFkZGluZyBfX3dlYWsgdG8gY29tcGlsZXIuaCAoSSBkaXNsaWtlIHRv
IHN1Z2dlc3QKdGhlIGxlYWRpbmcgZG91YmxlIHVuZGVyc2NvcmVzLCBidXQgbm90IHVzaW5nIHRo
ZW0gdGhlcmUgd291bGQganVzdApiZSB0b28gaW5jb25zaXN0ZW50IHdpdGggdGhlIHJlc3Qgb2Yg
dGhpcyBoZWFkZXIpPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
