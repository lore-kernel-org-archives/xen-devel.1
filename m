From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 28/74] x86: initialise shared_info
 page
Date: Fri, 05 Jan 2018 07:11:19 -0700
Message-ID: <5A4F9597020000780019B65C@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-29-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ivak=ea=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eXSiW-0001G0-G8
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 14:11:28 +0000
In-Reply-To: <20180104130625.28605-29-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0
L3hlbi5jCj4gQEAgLTcyLDYgKzcyLDMwIEBAIHZvaWQgX19pbml0IHByb2JlX2h5cGVydmlzb3Io
dm9pZCkKPiAgICAgIHhlbl9ndWVzdCA9IHRydWU7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIG1h
cF9zaGFyZWRfaW5mbyhzdHJ1Y3QgZTgyMG1hcCAqZTgyMCkKPiArewo+ICsgICAgcGFkZHJfdCBm
cmFtZSA9IDB4ZmYwMDAwMDA7IC8qIFRPRE86IEhhcmRjb2RlZCBiZXNpZGUgbWFnaWMgZnJhbWVz
LiAqLwoKV2hhdCBhcmUgdGhlIHBsYW5zIGhlcmU/Cgo+ICsgICAgc3RydWN0IHhlbl9hZGRfdG9f
cGh5c21hcCB4YXRwID0gewo+ICsgICAgICAgIC5kb21pZCA9IERPTUlEX1NFTEYsCj4gKyAgICAg
ICAgLmlkeCA9IDAsCj4gKyAgICAgICAgLnNwYWNlID0gWEVOTUFQU1BBQ0Vfc2hhcmVkX2luZm8s
Cj4gKyAgICAgICAgLmdwZm4gPSBmcmFtZSA+PiBQQUdFX1NISUZULAo+ICsgICAgfTsKPiArCj4g
KyAgICBpZiAoICFlODIwX2FkZF9yYW5nZShlODIwLCBmcmFtZSwgZnJhbWUgKyBQQUdFX1NJWkUs
IEU4MjBfUkVTRVJWRUQpICkKPiArICAgICAgICBwYW5pYygiRmFpbGVkIHRvIHJlc2VydmUgc2hh
cmVkX2luZm8gcmFuZ2UiKTsKPiArCj4gKyAgICBpZiAoIHhlbl9oeXBlcmNhbGxfbWVtb3J5X29w
KFhFTk1FTV9hZGRfdG9fcGh5c21hcCwgJnhhdHApICkKPiArICAgICAgICBwYW5pYygiRmFpbGVk
IHRvIG1hcCBzaGFyZWRfaW5mbyBwYWdlIik7CgpBbHNvIHJlcG9ydCB0aGUgZXJyb3IgY29kZT8K
CkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
