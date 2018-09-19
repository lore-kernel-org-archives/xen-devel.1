From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] x86/pvh: copy data from low 1MB to Dom0
 physmap instead of mapping it
Date: Wed, 19 Sep 2018 09:14:09 +0200
Message-ID: <20180919071409.xxxfxapa6hf7so7i@mac.bytemobile.com>
References: <20180918085559.60177-1-roger.pau@citrix.com>
 <5BA0F94702000078001E9764@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t0u/=mb=citrix.com=prvs=7935e1ad4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g2Wgl-0008Dj-AO
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 07:14:19 +0000
Content-Disposition: inline
In-Reply-To: <5BA0F94702000078001E9764@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTgsIDIwMTggYXQgMDc6MTA6MzFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE4LjA5LjE4IGF0IDEwOjU1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQEAgLTQyMCwxNiArMzk0LDI3IEBAIHN0YXRpYyBpbnQgX19pbml0IHB2aF9zZXR1
cF9wMm0oc3RydWN0IGRvbWFpbiAqZCkKPiA+ICAgICAgICAgIGFkZHIgPSBQRk5fRE9XTihkLT5h
cmNoLmU4MjBbaV0uYWRkcik7Cj4gPiAgICAgICAgICBzaXplID0gUEZOX0RPV04oZC0+YXJjaC5l
ODIwW2ldLnNpemUpOwo+ID4gIAo+ID4gLSAgICAgICAgaWYgKCBhZGRyID49IE1CMV9QQUdFUyAp
Cj4gPiAtICAgICAgICAgICAgcmMgPSBwdmhfcG9wdWxhdGVfbWVtb3J5X3JhbmdlKGQsIGFkZHIs
IHNpemUpOwo+ID4gLSAgICAgICAgZWxzZQo+ID4gLSAgICAgICAgewo+ID4gLSAgICAgICAgICAg
IEFTU0VSVChhZGRyICsgc2l6ZSA8IE1CMV9QQUdFUyk7Cj4gPiAtICAgICAgICAgICAgcHZoX3N0
ZWFsX2xvd19yYW0oZCwgYWRkciwgc2l6ZSk7Cj4gPiAtICAgICAgICB9Cj4gPiAtCj4gPiArICAg
ICAgICByYyA9IHB2aF9wb3B1bGF0ZV9tZW1vcnlfcmFuZ2UoZCwgYWRkciwgc2l6ZSk7Cj4gPiAg
ICAgICAgICBpZiAoIHJjICkKPiA+ICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gPiArCj4gPiAr
ICAgICAgICBpZiAoIGFkZHIgPCBNQjFfUEFHRVMgKQo+ID4gKyAgICAgICAgewo+ID4gKyAgICAg
ICAgICAgIHVpbnQ2NF90IGVuZCA9IG1pbl90KHVpbnQ2NF90LCBNQigxKSwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkLT5hcmNoLmU4MjBbaV0uYWRkciArIGQtPmFyY2gu
ZTgyMFtpXS5zaXplKTsKPiAKPiBJIHRoaW5rIG1pbl90KCkgYW5kIG1heF90KCkgc2hvdWxkIG9u
bHkgYmUgdXNlZCBhcyBhIGxhc3QgcmVzb3J0LCBkdWUKPiB0byB0aGVpciAoaGlkZGVuKSBjYXN0
cy4gbWluKE1CKDFVTEwpLCAuLi4pIG91Z2h0IHRvIGJlIGZpbmUgaGVyZSwgSQo+IHdvdWxkIHRo
aW5rLgoKTUIoMVVMTCkgZG9lc24ndCB3b3JrIGJlY2F1c2UgdGhlIG1hY3JvIGFscmVhZHkgYXBw
ZW5kcyBVTEw6CgojZGVmaW5lIE1CKF9tYikgICAgIChfQUMoX21iLCBVTEwpIDw8IDIwKQoKU28g
SSBlaXRoZXIgaGF2ZSB0byBjYXN0IGQtPmFyY2guZTgyMFtpXS5hZGRyICsgZC0+YXJjaC5lODIw
W2ldLnNpemUKdG8gdW5zaWduZWQgbG9uZyBsb25nLCBvciB1c2UgKHVpbnQ2NF90KU1CKDEpLgoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
