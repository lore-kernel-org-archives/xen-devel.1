From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v5 12/15] libxl: QEMU startup sync based on
 QMP
Date: Mon, 12 Nov 2018 15:17:41 +0000
Message-ID: <23529.39317.577554.8161@mariner.uk.xensource.com>
References: <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-13-anthony.perard@citrix.com>
 <23493.62558.602998.340871@mariner.uk.xensource.com>
 <20181112150012.GG1302@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0ka0=nx=citrix.com=prvs=847df0986=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gMDyD-0006hz-2F
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 15:17:45 +0000
In-Reply-To: <20181112150012.GG1302@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2NSAxMi8xNV0gbGlieGw6IFFFTVUg
c3RhcnR1cCBzeW5jIGJhc2VkIG9uIFFNUCIpOgo+IE9uIFR1ZSwgT2N0IDE2LCAyMDE4IGF0IDAz
OjIzOjI2UE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gSXQncyByYXRoZXIgb2RkIHRo
YXQgbmVpdGhlciB0aGlzIHBhdGNoLCBub3IgYW55dGhpbmcgdGhhdCBmb2xsb3dzLAo+ID4gZG9l
cyBub3Qgc3RvcCBsaWJ4bCBmcm9tIGFsc28gd2F0Y2hpbmcgdGhlIHhlbnN0b3JlIHBhdGguICBJ
IHRoaW5rIGl0Cj4gPiB3b3VsZCBiZSBiZXR0ZXIgdG8gc3VwcHJlc3MgdGhhdCByYXRoZXIgdGhh
biBsZWF2ZSB2ZXN0aWdpYWwKPiA+IGJlaGF2aW91ci4gIENhbiB5b3UgYWRkIHBhdGNoKGVzKSB0
byBkbyB0aGF0LCByaWdodCBhZnRlciB0aGlzIG9uZSA/Cj4gCj4gSSBjYW4gdHJ5LiBUaGF0IGFs
c28gbWVhbiB0aGF0IHdlIG5lZWQgdG8gc2V0dXAgYSBuZXcgdGltZW91dCB0aGF0Cj4geHN3YWl0
IGlzIHNldHRpbmcgdXAgcmlnaHQgbm93LgoKT2gsIGdvb2QgcG9pbnQuICBUaGF0IHNlZW1zIGEg
Yml0IHRlZGlvdXMgYW5kIGZpZGRseS4gIE1heWJlIGl0IGlzCmJldHRlciB0byBsZWF2ZSBpdCB1
bnRpbCB3ZSBjYW4gdGhyb3cgYXdheSB0aGUgeHN3YWl0IGVudGlyZWx5IC0gc2luY2UKdGhhdCB3
YXkgdGhlcmUgYXJlLCBmb3Igbm93LCBmZXdlciBzZXBhcmF0ZSBjb2RlIHBhdGhzIGluIGxpYnhs
LgoKPiBJIGRvbid0IHJlYWxseSBoYXZlIGFuIGF3bnNlciBvbiBob3cgdG8gc3RhcnQgdGltZW91
dCB3aGVuIHdlIHVzZQo+IGxpYnhsX19ldl9xbXAuIEkgZ3Vlc3MganVzdCBhZGRpbmcgYSBjYWxs
IHRvIGxpYnhsX19ldl94c3dhdGNoX3JlZ2lzdGVyCj4gd2hlbmV2ZXIgd2UgaW50ZXJhY3Qgd2l0
aCBsaWJ4bF9fZXZfcW1wIGlzIGZpbmUuIEkgZG9uJ3QgdGhpbmsgd2UgY2FuIGRvCj4gc29tZXRo
aW5nIHNpbWlsYWlyIHRvIHhzd2FpdC4KCkknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQuICBJZiB5
b3Ugd2FudCB0byBoYXZlIGEgdGltZW91dCB0aGF0J3Mgbm90CnBhcnQgb2YgYW4geHN3YWl0LCB1
c2UgbGlieGxfX2V2X3RpbWUuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
