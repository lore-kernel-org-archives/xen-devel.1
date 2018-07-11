From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Wed, 11 Jul 2018 10:55:56 +0200
Message-ID: <20180711085556.GC26572@olila.local.net-space.pl>
References: <20180709164516.3n5ht4qq5kjhp3mh@mac.bytemobile.com>
 <20180710110052.GY26572@olila.local.net-space.pl>
 <5B449CC702000078001D2A03@prv1-mh.provo.novell.com>
 <20180710134954.twd2cs6hhdfqumkq@mac.bytemobile.com>
 <5B44BE0202000078001D2B93@prv1-mh.provo.novell.com>
 <20180710153509.p4o2ffk22iqsqkif@mac.bytemobile.com>
 <5B45AD2A02000078001D2F16@prv1-mh.provo.novell.com>
 <20180711082936.y6p2eluyspbhno4j@mac.bytemobile.com>
 <5B45BFFF0200008503CB1CCA@prv1-mh.provo.novell.com>
 <5B45C45902000078001D2FA0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=argw=j3=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fdAur-0008A5-1C
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 08:56:05 +0000
Content-Disposition: inline
In-Reply-To: <5B45C45902000078001D2FA0@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTEsIDIwMTggYXQgMDI6NDg6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDExLjA3LjE4IGF0IDEwOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBKdWwgMTEsIDIwMTggYXQgMDE6MDk6MzBBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gQW5vdGhlciBwb3NzaWJsZSB0aGluZyB0byB0cnkgbWlnaHQgYmUg
dG8gbWFrZSB0aGUgZXh0ZXJuIGRlY2xhcmF0aW9uCj4gPj4gb2YgdGhlIHN5bWJvbCB3ZWFrLCBh
bmQgZHJvcCB0aGUgb2ZmZW5kaW5nIGxpbmUgYWx0b2dldGhlci4KPiA+Cj4gPiBPaCwgdGhhdCBk
aWRuJ3Qgb2NjdXIgdG8gbWUsIGFuZCBkb2VzIHNlZW0gdG8gd29yay4gQmVsb3cgaXMgd2hhdCBJ
J3ZlCj4gPiBzdWNjZXNzZnVsbHkgdGVzdGVkOgo+ID4KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gaW5kZXggNWYyMzky
NjIxZC4uZDg0NzA0NzQ1ZSAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMK
PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiA+IEBAIC0yOTcsOCArMjk3LDYgQEAg
U0VDVElPTlMKPiA+ICAgIH0gOnRleHQKPiA+ICAjZW5kaWYKPiA+Cj4gPiAtICBlZmkgPSBERUZJ
TkVEKGVmaSkgPyBlZmkgOiAuOwo+ID4gLQo+ID4gICAgLyogU2VjdGlvbnMgdG8gYmUgZGlzY2Fy
ZGVkICovCj4gPiAgICAvRElTQ0FSRC8gOiB7Cj4gPiAgICAgICAgICooLmV4aXQudGV4dCkKPiA+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vZWZpLmggYi94ZW4vaW5jbHVkZS94ZW4vZWZp
LmgKPiA+IGluZGV4IDQ0YjdkM2VjM2EuLjhlMjViZmFlYmIgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4v
aW5jbHVkZS94ZW4vZWZpLmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9lZmkuaAo+ID4gQEAg
LTIxLDcgKzIxLDcgQEAgc3RydWN0IGVmaSB7Cj4gPiAgICAgIHVuc2lnbmVkIGxvbmcgc21iaW9z
MzsgICAgICAvKiBTTUJJT1MgdjMgdGFibGUgKi8KPiA+ICB9Owo+ID4KPiA+IC1leHRlcm4gc3Ry
dWN0IGVmaSBlZmk7Cj4gPiArZXh0ZXJuIHN0cnVjdCBlZmkgZWZpIF9fYXR0cmlidXRlX18oKHdl
YWspKTsKPiA+Cj4gPiAgI2lmbmRlZiBfX0FTU0VNQkxZX18KPiA+Cj4gPgo+ID4gSWYgdGhhdCdz
IGFjY2VwdGFibGUgSSB3aWxsIHJlZnJlc2ggYW5kIHJlc2VuZCB0aGUgcGF0Y2guCj4KPiBMZXQn
cyBzZWUgd2hhdCBEYW5pZWwgYW5kIG1heWJlIG90aGVycyBzYXkuIElmIHlvdSBnbyB0aGF0IHJv
dXRlLAo+IGNvdWxkIEkgdGFsayB5b3UgaW50byBhZGRpbmcgX193ZWFrIHRvIGNvbXBpbGVyLmgg
KEkgZGlzbGlrZSB0byBzdWdnZXN0Cj4gdGhlIGxlYWRpbmcgZG91YmxlIHVuZGVyc2NvcmVzLCBi
dXQgbm90IHVzaW5nIHRoZW0gdGhlcmUgd291bGQganVzdAo+IGJlIHRvbyBpbmNvbnNpc3RlbnQg
d2l0aCB0aGUgcmVzdCBvZiB0aGlzIGhlYWRlcik/CgpJZiB0aGlzIHdvcmtzIGluIGFsbCBjYXNl
cyAoYnVpbGQgd2l0aCB0b29scyB3aXRoIGFuZCB3aXRob3V0IFBFIHN1cHBvcnQsCnhlbi5lZmkg
YW5kIHhlbi5neiB2aWEgTXVsdGlib290MiBwcm90byBib290IGNvcnJlY3RseSBvbiBFRkkgcGxh
dGZvcm1zLApldGMuKSB0aGVuIEkgYW0gT0sgd2l0aCB0aGF0LgoKRGFuaWVsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
