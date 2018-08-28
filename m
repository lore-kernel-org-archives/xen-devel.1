From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xenforeignmemory: work around bug in older
 privcmd
Date: Tue, 28 Aug 2018 15:20:12 +0100
Message-ID: <20180828142012.cprvk7r76i2psbbj@citrix.com>
References: <20180824121626.27261-1-paul.durrant@citrix.com>
 <fcd947b7-844d-2ddf-71ee-45dfd6cf4566@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fuern-0004gV-EF
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 14:21:11 +0000
Content-Disposition: inline
In-Reply-To: <fcd947b7-844d-2ddf-71ee-45dfd6cf4566@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDM6MTI6MzJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNC8wOC8xOCAxMzoxNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4gZGlmZiAt
LWdpdCBhL3Rvb2xzL2xpYnMvZm9yZWlnbm1lbW9yeS9saW51eC5jIGIvdG9vbHMvbGlicy9mb3Jl
aWdubWVtb3J5L2xpbnV4LmMKPiA+IGluZGV4IDM2ODZjZjQxZTAuLjAzNjhhYTA5ZjQgMTAwNjQ0
Cj4gPiAtLS0gYS90b29scy9saWJzL2ZvcmVpZ25tZW1vcnkvbGludXguYwo+ID4gKysrIGIvdG9v
bHMvbGlicy9mb3JlaWdubWVtb3J5L2xpbnV4LmMKPiA+IEBAIC01Myw2ICs1MywyMyBAQCBpbnQg
b3NkZXBfeGVuZm9yZWlnbm1lbW9yeV9vcGVuKHhlbmZvcmVpZ25tZW1vcnlfaGFuZGxlICpmbWVt
KQo+ID4gICAgICAgICAgcmV0dXJuIC0xOwo+ID4gICAgICB9Cj4gPiAgCj4gPiArICAgIC8qCj4g
PiArICAgICAqIE9sZGVyIHZlcnNpb25zIG9mIHByaXZjbWQgcmV0dXJuIC1FSU5WQUwgZm9yIHVu
aW1wbGVtZW50ZWQgaW9jdGxzCj4gPiArICAgICAqIHNvIHdlIG5lZWQgdG8gcHJvYmUgZm9yIHRo
ZSBlcnJubyB0byB1c2UgcmF0aGVyIHRoYW4ganVzdCB1c2luZwo+ID4gKyAgICAgKiB0aGUgY29u
dmVudGlvbmFsIEVOT1RUWS4KPiA+ICsgICAgICovCj4gPiArICAgIGlmICggaW9jdGwoZmQsIElP
Q1RMX1BSSVZDTURfVU5JTVBMRU1FTlRFRCwgTlVMTCkgPj0gMCApCj4gPiArICAgIHsKPiA+ICsg
ICAgICAgIHh0bF9sb2coZm1lbS0+bG9nZ2VyLCBYVExfRVJST1IsIC0xLCAieGVuZm9yZWlnbm1l
bW9yeSIsCj4gPiArICAgICAgICAgICAgICAgICJwcml2Y21kIGlvY3RsIHNob3VsZCBub3QgYmUg
aW1wbGVtZW50ZWQiKTsKPiAKPiBUaGlzIGVycm9yIHBhdGggbGVha3MgZmQuCgpQYXRjaCBzZW50
LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
