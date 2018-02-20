From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 3/4] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Tue, 20 Feb 2018 11:01:32 +0000
Message-ID: <20180220110108.tsekpststokuw5mo@MacBook-Pro-de-Roger.local>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-4-roger.pau@citrix.com>
 <5A8BF53C02000078001A97CE@prv-mh.provo.novell.com>
 <20180220101916.ve5gcjq6c53tkiey@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6c15=fo=citrix.com=prvs=582a52a2f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eo5gG-0008Bk-3R
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 11:01:52 +0000
Content-Disposition: inline
In-Reply-To: <20180220101916.ve5gcjq6c53tkiey@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMTA6MTk6MTZBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIEZlYiAyMCwgMjAxOCBhdCAwMjoxNToyNEFNIC0wNzAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+ID4+PiBPbiAxOS4wMi4xOCBhdCAxNToxNiwgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPiA+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9pbmRpcmVj
dF90aHVua19hc20uaAo+ID4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2luZGlyZWN0X3Ro
dW5rX2FzbS5oCj4gPiA+IEBAIC0zLDYgKzMsMTAgQEAKPiA+ID4gICAqIHVzdWFsICNpZmRlZidh
cnkgdG8gdHVybiBpbnRvIGNvbW1lbnRzLgo+ID4gPiAgICovCj4gPiA+ICAKPiA+ID4gKy5pZm5k
ZWYgQ09ORklHX0lORElSRUNUX1RIVU5LCj4gPiA+ICsgICAgLmVxdSBDT05GSUdfSU5ESVJFQ1Rf
VEhVTkssIDAKPiA+ID4gKy5lbmRpZgo+ID4gCj4gPiBJIGhhdmUgdG8gd2l0aGRyYXcgbXkgUi1i
OiBUaGlzIGZhaWxzIHRvIGJ1aWxkIChJJ20gZ2V0dGluZyBhbiBlcnJvcgo+ID4gb24gdGhlIC5p
Zm5kZWYgYWJvdmUgZm9yIG1vcmUgdGhhbiBvbmUgYXNzZW1ibGVyIHNvdXJjZSkuIEkgYXNzdW1l
Cj4gPiB0aGF0J3MgYmVjYXVzZSB3aXRoIGluZGlyZWN0IHRodW5rcyBlbmFibGVkIHRoZSBjb25z
dGFudCBnZXRzCj4gPiByZXBsYWNlZCBieSBsaXRlcmFsIDEgYnkgdGhlIEMgcHJlcHJvY2Vzc29y
Lgo+IAo+IFJpZ2h0LCBJJ3ZlIGp1c3QgaW5zdGFsbGVkIGdjYzctZGV2ZWwgYW5kIEknbSBzZWVp
bmcgdGhlIHNhbWUuIFRoYW5rcwo+IGZvciBub3RpY2luZy4gTGV0IG1lIHRyeSB0byBzb2x2ZSB0
aGlzIGluIGFub3RoZXIgd2F5Li4uCgpTbyBmYXIgdGhlIGJlc3Qgd2F5IEkndmUgZm91bmQgdG8g
c29sdmUgdGhpcyBpc3N1ZSB0aGF0IHdvcmtzIHdpdGgKYm90aCBnY2MgKHdpdGggYW5kIHdpdGhv
dXQgaW5kaXJlY3QgdGh1bmsgc3VwcG9ydCkgYW5kIGNsYW5nIGlzIHRoZQpmb2xsb3dpbmc6Cgpk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaCBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvYXNtX2RlZm5zLmgKaW5kZXggNmZjMTNkMzlkOC4uZWJkMmM4OGExZiAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaAorKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L2FzbV9kZWZucy5oCkBAIC0xNSw2ICsxNSw5IEBACiAjaW5jbHVkZSA8YXNtL2FsdGVy
bmF0aXZlLmg+CgogI2lmZGVmIF9fQVNTRU1CTFlfXworI2lmbmRlZiBDT05GSUdfSU5ESVJFQ1Rf
VEhVTksKKy5lcXUgQ09ORklHX0lORElSRUNUX1RIVU5LLCAwCisjZW5kaWYKICMgaW5jbHVkZSA8
YXNtL2luZGlyZWN0X3RodW5rX2FzbS5oPgogI2Vsc2UKIGFzbSAoICJcdC5lcXUgQ09ORklHX0lO
RElSRUNUX1RIVU5LLCAiCgpJdCdzIGZhaXJseSBzaW1pbGFyIHRvIG15IGZpcnN0IGFwcHJvYWNo
LCBidXQgYXQgbGVhc3QgIiNpZmRlZgpDT05GSUdfSU5ESVJFQ1RfVEhVTksiIHdpbGwgc3RpbGwg
d29yayBhcyBleHBlY3RlZCBhZnRlciB0aGlzIGZpeC4KClJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
