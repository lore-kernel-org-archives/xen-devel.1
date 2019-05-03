From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v4 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
Date: Fri, 3 May 2019 07:46:36 -0600
Message-ID: <CABfawh=XGK1Eo1ceA8Ooskc4jywAY7BUJ_GvsSeU+=fmdX9RzQ@mail.gmail.com>
References: <20190502221345.18459-1-tamas@tklengyel.com>
 <20190502221345.18459-4-tamas@tklengyel.com>
 <5CCBF963020000780022B865@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQLm=TD=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMYX3-0001wK-IE
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 13:47:21 +0000
Received: by mail-wr1-f48.google.com with SMTP id c12so7974730wrt.8
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 06:47:14 -0700 (PDT)
In-Reply-To: <5CCBF963020000780022B865@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMywgMjAxOSBhdCAyOjE4IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDMuMDUuMTkgYXQgMDA6MTMsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gPiArKysgYi94ZW4v
YXJjaC94ODYvbW0uYwo+ID4gQEAgLTM2OCw3ICszNjgsOSBAQCB2b2lkIF9faW5pdCBhcmNoX2lu
aXRfbWVtb3J5KHZvaWQpCj4gPgo+ID4gICAgICBlZmlfaW5pdF9tZW1vcnkoKTsKPiA+Cj4gPiAr
I2lmZGVmIENPTkZJR19NRU1fU0hBUklORwo+ID4gICAgICBtZW1fc2hhcmluZ19pbml0KCk7Cj4g
PiArI2VuZGlmCj4KPiBXaGlsZSBmb3IgZG9tY3RsIGNvZGUgYW5kIGFsaWtlIHVzaW5nICNpZmRl
ZiBtYXkgaW5kZWVkIGJlIHRoZQo+IGJldHRlciBjaG9pY2UsIEkgdGhpbmsgaGVyZSBhbiBpbmxp
bmUgc3R1YiB0byBhdm9pZCB0aGUgI2lmZGVmCj4gd291bGQgYmUgcHJlZmVyYWJsZS4gVGhlbiBh
Z2FpbiAtIHJlY2FsbCB5b3UndmUgYWxyZWFkeSBhY2stZWQKPiBteSBwYXRjaCB0byBkcm9wIHRo
ZSBmdW5jdGlvbiBhbHRvZ2V0aGVyPyBQZXJoYXBzIHlvdSBzaG91bGQKPiBiYXNlIHlvdXIgcGF0
Y2ggb24gbWluZSAob3IgQW5kcmV3IGNvdWxkIHB1bGwgdGhhdCBvdGhlciBwYXRjaAo+IGludG8g
eDg2LW5leHQpPyBJbiB0aGF0IGNhc2UgKHdpdGggdGhlIGh1bmsgYWJvdmUgc2ltcGx5Cj4gZHJv
cHBlZCkKPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKWWVzLCB0
aGF0IGh1bmsgY2FuIGJlIHNpbXBseSBkcm9wcGVkIGlmIHlvdXIgcGF0Y2ggbWFrZXMgaXQgaW4g
YmVmb3JlCnRoaXMgZG9lcy4gVGhhdCB3b3VsZCBiZSB0aGUgb3B0aW1hbCByb3V0ZS4KClRoYW5r
cywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
