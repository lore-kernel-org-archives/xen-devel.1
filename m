From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Wed, 11 Jul 2018 11:02:34 +0200
Message-ID: <20180711090234.lw5w4cy6t7w5pqqo@mac.bytemobile.com>
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
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ebcd=j3=citrix.com=prvs=7236e92fb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fdB1V-0000fy-CN
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 09:02:57 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTEsIDIwMTggYXQgMDI6NDg6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDExLjA3LjE4IGF0IDEwOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBKdWwgMTEsIDIwMTggYXQgMDE6MDk6MzBBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gQW5vdGhlciBwb3NzaWJsZSB0aGluZyB0byB0cnkgbWlnaHQgYmUg
dG8gbWFrZSB0aGUgZXh0ZXJuIGRlY2xhcmF0aW9uCj4gPj4gb2YgdGhlIHN5bWJvbCB3ZWFrLCBh
bmQgZHJvcCB0aGUgb2ZmZW5kaW5nIGxpbmUgYWx0b2dldGhlci4KPiA+IAo+ID4gT2gsIHRoYXQg
ZGlkbid0IG9jY3VyIHRvIG1lLCBhbmQgZG9lcyBzZWVtIHRvIHdvcmsuIEJlbG93IGlzIHdoYXQg
SSd2ZQo+ID4gc3VjY2Vzc2Z1bGx5IHRlc3RlZDoKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni94ZW4ubGRzLlMgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gPiBpbmRleCA1ZjIz
OTI2MjFkLi5kODQ3MDQ3NDVlIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMu
Uwo+ID4gKysrIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gQEAgLTI5Nyw4ICsyOTcsNiBA
QCBTRUNUSU9OUwo+ID4gICAgfSA6dGV4dAo+ID4gICNlbmRpZgo+ID4gIAo+ID4gLSAgZWZpID0g
REVGSU5FRChlZmkpID8gZWZpIDogLjsKPiA+IC0KPiA+ICAgIC8qIFNlY3Rpb25zIHRvIGJlIGRp
c2NhcmRlZCAqLwo+ID4gICAgL0RJU0NBUkQvIDogewo+ID4gICAgICAgICAqKC5leGl0LnRleHQp
Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2VmaS5oIGIveGVuL2luY2x1ZGUveGVu
L2VmaS5oCj4gPiBpbmRleCA0NGI3ZDNlYzNhLi44ZTI1YmZhZWJiIDEwMDY0NAo+ID4gLS0tIGEv
eGVuL2luY2x1ZGUveGVuL2VmaS5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZWZpLmgKPiA+
IEBAIC0yMSw3ICsyMSw3IEBAIHN0cnVjdCBlZmkgewo+ID4gICAgICB1bnNpZ25lZCBsb25nIHNt
YmlvczM7ICAgICAgLyogU01CSU9TIHYzIHRhYmxlICovCj4gPiAgfTsKPiA+ICAKPiA+IC1leHRl
cm4gc3RydWN0IGVmaSBlZmk7Cj4gPiArZXh0ZXJuIHN0cnVjdCBlZmkgZWZpIF9fYXR0cmlidXRl
X18oKHdlYWspKTsKPiA+ICAKPiA+ICAjaWZuZGVmIF9fQVNTRU1CTFlfXwo+ID4gIAo+ID4gCj4g
PiBJZiB0aGF0J3MgYWNjZXB0YWJsZSBJIHdpbGwgcmVmcmVzaCBhbmQgcmVzZW5kIHRoZSBwYXRj
aC4KPiAKPiBMZXQncyBzZWUgd2hhdCBEYW5pZWwgYW5kIG1heWJlIG90aGVycyBzYXkuIElmIHlv
dSBnbyB0aGF0IHJvdXRlLAo+IGNvdWxkIEkgdGFsayB5b3UgaW50byBhZGRpbmcgX193ZWFrIHRv
IGNvbXBpbGVyLmggKEkgZGlzbGlrZSB0byBzdWdnZXN0Cj4gdGhlIGxlYWRpbmcgZG91YmxlIHVu
ZGVyc2NvcmVzLCBidXQgbm90IHVzaW5nIHRoZW0gdGhlcmUgd291bGQganVzdAo+IGJlIHRvbyBp
bmNvbnNpc3RlbnQgd2l0aCB0aGUgcmVzdCBvZiB0aGlzIGhlYWRlcik/CgpIbSwgdGhlIGhlYWRl
ciBpcyBraW5kIG9mIG1peGVkIG9uIHRoZSB1c2FnZSBvZiB1bmRlcnNjb3Jlcy4gaW5saW5lLAph
bHdheXNfaW5saW5lIG9yIG5vcmV0dXJuIGZvciBleGFtcGxlIGRvbid0IGhhdmUgdGhlbSwgc28g
aWYgeW91CnByZWZlciBJIHRoaW5rIGl0IHNob3VsZCBiZSBmaW5lIHRvIGFkZCB3ZWFrIHdpdGhv
dXQgdW5kZXJzY29yZXMuCgpUaGVyZSdzIGFuIGV4aXN0aW5nIGNhc2Ugb2YgX19hdHRyaWJ1dGVf
Xygod2VhaykpIGluCmxpdmVwYXRjaF9wYXlsb2FkLmggd2hpY2ggSSB3aWxsIHJlcGxhY2UgaW4g
dGhlIHNhbWUgcGF0Y2ggaWYgdGhhdCdzCmZpbmUuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
