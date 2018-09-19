From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/pvh: copy data from low 1MB to Dom0
 physmap instead of mapping it
Date: Wed, 19 Sep 2018 02:37:14 -0600
Message-ID: <5BA20ABA02000078001E9C42@prv1-mh.provo.novell.com>
References: <20180918085559.60177-1-roger.pau@citrix.com>
 <5BA0F94702000078001E9764@prv1-mh.provo.novell.com>
 <20180919071409.xxxfxapa6hf7so7i@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lqxj=mb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2Xz6-00078C-Sk
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 08:37:20 +0000
In-Reply-To: <20180919071409.xxxfxapa6hf7so7i@mac.bytemobile.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA5LjE4IGF0IDA5OjE0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgU2VwIDE4LCAyMDE4IGF0IDA3OjEwOjMxQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTguMDkuMTggYXQgMTA6NTUsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gQEAgLTQyMCwxNiArMzk0LDI3IEBAIHN0YXRpYyBpbnQgX19pbml0IHB2aF9z
ZXR1cF9wMm0oc3RydWN0IGRvbWFpbiAqZCkKPj4gPiAgICAgICAgICBhZGRyID0gUEZOX0RPV04o
ZC0+YXJjaC5lODIwW2ldLmFkZHIpOwo+PiA+ICAgICAgICAgIHNpemUgPSBQRk5fRE9XTihkLT5h
cmNoLmU4MjBbaV0uc2l6ZSk7Cj4+ID4gIAo+PiA+IC0gICAgICAgIGlmICggYWRkciA+PSBNQjFf
UEFHRVMgKQo+PiA+IC0gICAgICAgICAgICByYyA9IHB2aF9wb3B1bGF0ZV9tZW1vcnlfcmFuZ2Uo
ZCwgYWRkciwgc2l6ZSk7Cj4+ID4gLSAgICAgICAgZWxzZQo+PiA+IC0gICAgICAgIHsKPj4gPiAt
ICAgICAgICAgICAgQVNTRVJUKGFkZHIgKyBzaXplIDwgTUIxX1BBR0VTKTsKPj4gPiAtICAgICAg
ICAgICAgcHZoX3N0ZWFsX2xvd19yYW0oZCwgYWRkciwgc2l6ZSk7Cj4+ID4gLSAgICAgICAgfQo+
PiA+IC0KPj4gPiArICAgICAgICByYyA9IHB2aF9wb3B1bGF0ZV9tZW1vcnlfcmFuZ2UoZCwgYWRk
ciwgc2l6ZSk7Cj4+ID4gICAgICAgICAgaWYgKCByYyApCj4+ID4gICAgICAgICAgICAgIHJldHVy
biByYzsKPj4gPiArCj4+ID4gKyAgICAgICAgaWYgKCBhZGRyIDwgTUIxX1BBR0VTICkKPj4gPiAr
ICAgICAgICB7Cj4+ID4gKyAgICAgICAgICAgIHVpbnQ2NF90IGVuZCA9IG1pbl90KHVpbnQ2NF90
LCBNQigxKSwKPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZC0+YXJjaC5l
ODIwW2ldLmFkZHIgKyBkLT5hcmNoLmU4MjBbaV0uc2l6ZSk7Cj4+IAo+PiBJIHRoaW5rIG1pbl90
KCkgYW5kIG1heF90KCkgc2hvdWxkIG9ubHkgYmUgdXNlZCBhcyBhIGxhc3QgcmVzb3J0LCBkdWUK
Pj4gdG8gdGhlaXIgKGhpZGRlbikgY2FzdHMuIG1pbihNQigxVUxMKSwgLi4uKSBvdWdodCB0byBi
ZSBmaW5lIGhlcmUsIEkKPj4gd291bGQgdGhpbmsuCj4gCj4gTUIoMVVMTCkgZG9lc24ndCB3b3Jr
IGJlY2F1c2UgdGhlIG1hY3JvIGFscmVhZHkgYXBwZW5kcyBVTEw6Cj4gCj4gI2RlZmluZSBNQihf
bWIpICAgICAoX0FDKF9tYiwgVUxMKSA8PCAyMCkKCk9oLCByaWdodCAtIHRoYXQncyB0aGUgdW5m
b3J0dW5hdGUgaW5jb25zaXN0ZW50IG1hcHBpbmcgb2YgdWludDY0X3QgdG8KInVuc2lnbmVkIGxv
bmcgbG9uZyIgb24gMzItYml0IGJ1dCAidW5zaWduZWQgbG9uZyIgb24gNjQtYml0LgoKPiBTbyBJ
IGVpdGhlciBoYXZlIHRvIGNhc3QgZC0+YXJjaC5lODIwW2ldLmFkZHIgKyBkLT5hcmNoLmU4MjBb
aV0uc2l6ZQo+IHRvIHVuc2lnbmVkIGxvbmcgbG9uZywgb3IgdXNlICh1aW50NjRfdClNQigxKS4K
CkluIHRoYXQgY2FzZSBJJ2xsIHJhdGhlciB3aXRoZHJhdyBteSBjaGFuZ2UgcmVxdWVzdC4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
