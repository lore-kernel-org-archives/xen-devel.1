From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 34/34] RFC x86: introduce directio virt cap
Date: Tue, 21 Aug 2018 14:43:10 +0100
Message-ID: <20180821134310.quzdjqur4h2rk7nx@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <84f9dde9a5f6253653fc267fd8f874d21e4f4a58.1534518694.git-series.wei.liu2@citrix.com>
 <5B7BFD0702000078001E0764@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7kme=le=citrix.com=prvs=7644f7420=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fs6wE-0003bS-Fq
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 13:43:14 +0000
Content-Disposition: inline
In-Reply-To: <5B7BFD0702000078001E0764@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMDU6NTI6MzlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvc3lzY3RsLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9zeXNjdGwuYwo+ID4gQEAgLTkyLDggKzkyLDEwIEBAIHZvaWQgYXJjaF9kb19waHlzaW5mbyhz
dHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyAqcGkpCj4gPiAgICAgICAgICAgICBtaW4oc2l6ZW9m
KHBpLT5od19jYXApLCBzaXplb2YoYm9vdF9jcHVfZGF0YS54ODZfY2FwYWJpbGl0eSkpKTsKPiA+
ICAgICAgaWYgKCBodm1fZW5hYmxlZCApCj4gPiAgICAgICAgICBwaS0+Y2FwYWJpbGl0aWVzIHw9
IFhFTl9TWVNDVExfUEhZU0NBUF9odm07Cj4gPiAtICAgIGlmICggaW9tbXVfZW5hYmxlZCApCj4g
PiArICAgIGlmICggaHZtX2VuYWJsZWQgJiYgaW9tbXVfZW5hYmxlZCApCj4gPiAgICAgICAgICBw
aS0+Y2FwYWJpbGl0aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9odm1fZGlyZWN0aW87Cj4gPiAr
ICAgIGVsc2UgaWYgKCBpb21tdV9lbmFibGVkICkKPiA+ICsgICAgICAgIHBpLT5jYXBhYmlsaXRp
ZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlvOwo+ID4gIH0KPiAKPiBBdCB0aGUgc3lz
Y3RsIGxheWVyIEkgdGhpbmsgeW91IGNhbiwgYXMgc3VnZ2VzdGVkIGlpcmMgYnkgUm9nZXIsCj4g
c2ltcGx5IHJlcGxhY2UgaHZtX2RpcmVjdGlvIHdpdGggZGlyZWN0aW8gKG9yIGlvbW11KS4gRm9y
IHRoZQo+ICJ4bCBpbmZvIiBvdXRwdXQsIG90b2gsIEknbSBhZnJhaWQgdGhpcyBkb2Vzbid0IGhv
bGQsIGFzIHBlb3BsZQo+IG1heSBwYXJzZSBmb3IgdGhlIHN0cmluZy4gRGVwZW5kaW5nIG9uIGhv
dyB0aGlzIHdvdWxkIGJlc3QKPiBiZSBhZGRyZXNzZWQgaW4gdGhlIHRvb2wgc3RhY2ssIHJlcGxh
Y2luZyB0aGUgc3lzY3RsIG5hbWVzIG1heQo+IHRoZW4gbm8gbG9uZ2VyIGJlIHRoZSBtb3N0IHN1
aXRhYmxlIHNvbHV0aW9uLgoKSW4gdGhhdCBjYXNlIHdoYXQgZG8geW91IHRoaW5rIGFib3V0IHRo
ZSB0d28gZmxhZ3MgdGhpcyBwYXRjaCBwcm92aWRlcwpvbiB0aGUgdG9vbHN0YWNrIGxldmVsPwoK
RXNzZW50aWFsbHkgd2UgY2hhbmdlIHNsaWdodGx5IGh2bV9kaXJlY3RpbydzIG1lYW5pbmcgdG8g
bWVhbiAiaHZtICYmCmlvbW11X2VuYWJsZWQiIHdoaWxlIGl0IHByZXZpb3VzbHkgbWVhbiAiaW9t
bXVfZW5hYmxlZCIsIGFuZCB0aGVuIGluIHRoZQphYnNlbmNlIG9mIGh2bV9kaXJlY3RpbywgYWRk
ICJkaXJlY3RpbyIgYXMgYW4gaW5kaWNhdGlvbiBmb3IKImlvbW11X2VuYWJsZWQiLgoKV2VpLgoK
PiAKPiBKYW4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
