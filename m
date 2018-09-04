From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 05/14] public / x86: introduce
 __HYPERCALL_iommu_op
Date: Tue, 04 Sep 2018 06:55:15 -0600
Message-ID: <5B8E80B302000078001E5222@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-6-paul.durrant@citrix.com>
 <5B8E717702000078001E51A4@prv1-mh.provo.novell.com>
 <0a843f35407c4b23bd9398df400066bc@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qfrq=ls=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fxArZ-0002jS-0N
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 12:55:21 +0000
In-Reply-To: <0a843f35407c4b23bd9398df400066bc@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA5LjE4IGF0IDE0OjIzLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAwNCBTZXB0ZW1iZXIgMjAxOCAxMjo1MAo+PiAKPj4gPj4+IE9uIDIzLjA4LjE4IGF0IDExOjQ3
LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+ICtpbnQgY29tcGF0X29uZV9p
b21tdV9vcChjb21wYXRfaW9tbXVfb3BfYnVmX3QgKmJ1ZikKPj4gPiArewo+PiA+ICsgICAgY29t
cGF0X2lvbW11X29wX3QgY21wOwo+PiA+ICsgICAgeGVuX2lvbW11X29wX3QgbmF0Owo+PiA+ICsg
ICAgaW50IHJjOwo+PiA+ICsKPj4gPiArICAgIGlmICggYnVmLT5zaXplIDwgc2l6ZW9mKGNtcCkg
KQo+PiA+ICsgICAgICAgIHJldHVybiAtRUZBVUxUOwo+PiA+ICsKPj4gPiArICAgIGlmICggY29w
eV9mcm9tX2NvbXBhdCgodm9pZCAqKSZjbXAsIGJ1Zi0+aCwgc2l6ZW9mKGNtcCkpICkKPj4gPiAr
ICAgICAgICByZXR1cm4gLUVGQVVMVDsKPj4gPiArCj4+ID4gKyAgICBpZiAoIGNtcC5wYWQgKQo+
PiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiA+ICsKPj4gPiArICAgIHJjID0geHNtX2lv
bW11X29wKFhTTV9QUklWLCBjdXJyZW50LT5kb21haW4sIGNtcC5vcCk7Cj4+ID4gKyAgICBpZiAo
IHJjICkKPj4gPiArICAgICAgICByZXR1cm4gcmM7Cj4+ID4gKwo+PiA+ICsgICAgWExBVF9pb21t
dV9vcCgmbmF0LCAmY21wKTsKPj4gPiArCj4+ID4gKyAgICBpb21tdV9vcCgmbmF0KTsKPj4gPiAr
Cj4+ID4gKyAgICBYTEFUX2lvbW11X29wKCZjbXAsICZuYXQpOwo+PiA+ICsKPj4gPiArICAgIGlm
ICggX19jb3B5X2ZpZWxkX3RvX2NvbXBhdChjb21wYXRfaGFuZGxlX2Nhc3QoYnVmLT5oLAo+PiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21w
YXRfaW9tbXVfb3BfdCksCj4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNt
cCwgc3RhdHVzKSApCj4+IAo+PiBTaW5jZSB5b3UncmUgb25seSBhZnRlciB0aGUgc3RhdHVzIGZp
ZWxkLCBwZXJoYXBzIGJldHRlciB0byBhdm9pZCB0aGUKPj4gZnVsbC1ibG93biByZXZlcnNlIFhM
QVRfaW9tbXVfb3AoKSBhbmQgY29weSBqdXN0IHRoYXQgb25lIGZpZWxkPwo+PiAKPiAKPiBJIGtp
bmQgb2YgbGlrZSB0aGUgZmFjdCB0aGF0IHRoZSB0d28gY2FsbHMgbWlycm9yIGVhY2ggb3RoZXIg
c28gSSdkIHByZWZlciAKPiB0byBrZWVwIGl0LgoKV291bGQgeW91IG1pbmQgbG9va2luZyBhdCB0
aGUgZ2VuZXJhdGVkIGNvZGUgKG9uY2UgeW91IGhhdmUgYSBmZXcKc3ViLW9wcyBpbiBwbGFjZSk/
IElmIHRoZSBjb21waWxlciBtYW5hZ2VzIHRvIHJlbW92ZSBtb3N0IG9mIHRoZQpjcnVmdCwgSSdk
IGJlIGZpbmUga2VlcGluZyBpdCBhcyBpcy4gSWYsIGhvd2V2ZXIsIGEgd2hvbGUgbG90IG9mIGV4
dHJhCmNvZGUgZ2V0cyBnZW5lcmF0ZWQsIEknZCByZWFsbHkgbGlrZSB0byBhc2sgdG8gdXNlIHRo
ZSBzaG9ydGVyIGZvcm0uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
