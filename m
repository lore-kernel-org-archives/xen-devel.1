From: Isaila Alexandru <aisaila@bitdefender.com>
Subject: Re: [PATCH v2] x86/hvm: Change return error for offline
 vcpus
Date: Fri, 21 Sep 2018 11:55:23 +0300
Message-ID: <c89bd6dbf158d6056c899fab9ad5abd802e4fb2f.camel@bitdefender.com>
References: <20180921073030.32354-1-aisaila@bitdefender.com>
 <20180921084322.57tkffdhwqyemw7w@zion.uk.xensource.com>
 <20180921084441.juqzlukd6efjhhfp@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kas4=md=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1g3HDs-0003dA-65
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 08:55:36 +0000
In-Reply-To: <20180921084441.juqzlukd6efjhhfp@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyMDE4LTA5LTIxIGF0IDA5OjQ0ICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+IE9uIEZy
aSwgU2VwIDIxLCAyMDE4IGF0IDA5OjQzOjIyQU0gKzAxMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPiBP
biBGcmksIFNlcCAyMSwgMjAxOCBhdCAxMDozMDozMEFNICswMzAwLCBBbGV4YW5kcnUgSXNhaWxh
IHdyb3RlOgo+ID4gPiBUaGlzIHBhdGNoIGlzIG5lZWRlZCBpbiBvcmRlciB0byBoYXZlIGEgZGlm
ZmVyZW50IHJldHVybiBlcnJvcgo+ID4gPiBmb3IgaW52YWxpZCB2Y3B1Cj4gPiA+IGFuZCBvZmZs
aW5lIHZjcHUgb24gdGhlIHBlciB2Y3B1IGtpbmcuCj4gPiAKPiA+IFNvcnJ5LCBJIGNhbid0IHBh
cnNlIHRoaXMgc2VudGVuY2UuIFdoYXQgaXMgInBlciB2Y3B1IGtpbmciPwo+IAo+IE9oLCAia2lu
ZyIgc2hvdWxkIGJlICJraW5kIi4KClllcywga2luZyA9IGtpbmQsIHNvcnJ5IGZvciB0aGF0ICAK
PiAKPiA+IAo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlz
YWlsYUBiaXRkZWZlbmRlci5jb20+Cj4gPiA+IAo+ID4gPiAtLS0KPiA+ID4gQ2hhbmdlcyBzaW5j
ZSBWMToKPiA+ID4gCS0gQWRkIGNvbmRpdGlvbmFsIHN0YXRlbWVudCBpbiBvcmRlciB0byBoYXZl
IGEgZGlmZmVyZW5jZQo+ID4gPiBiZXR3ZWVuCj4gPiA+IAlwZXJfdmNwdSBhbmQgcGVyX2RvbSBy
ZXR1cm4gZXJyb3IuCj4gPiA+IC0tLQo+ID4gPiAgeGVuL2FyY2gveDg2L2h2bS9zYXZlLmMgfCAz
ICsrLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc2F2ZS5jIGIveGVu
L2FyY2gveDg2L2h2bS9zYXZlLmMKPiA+ID4gaW5kZXggZDUyMDg5ODg0My4uMTc2NGZiMDkxOCAx
MDA2NDQKPiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zYXZlLmMKPiA+ID4gKysrIGIveGVu
L2FyY2gveDg2L2h2bS9zYXZlLmMKPiA+ID4gQEAgLTE2NSw3ICsxNjUsOCBAQCBpbnQgaHZtX3Nh
dmVfb25lKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkCj4gPiA+IGludCB0eXBlY29kZSwgdW5z
aWduZWQgaW50IGluc3RhbmNlLAo+ID4gPiAgICAgIGlmICggKHJ2ID0gaHZtX3NyX2hhbmRsZXJz
W3R5cGVjb2RlXS5zYXZlKHYsICZjdHh0KSkgIT0gMCApCj4gPiA+ICAgICAgICAgIHByaW50ayhY
RU5MT0dfR19FUlIgIkhWTSVkIHNhdmU6IGZhaWxlZCB0byBzYXZlIHR5cGUKPiA+ID4gJSJQUkl1
MTYiICglZClcbiIsCj4gPiA+ICAgICAgICAgICAgICAgICBkLT5kb21haW5faWQsIHR5cGVjb2Rl
LCBydik7Cj4gPiA+IC0gICAgZWxzZSBpZiAoIHJ2ID0gLUVOT0VOVCwgY3R4dC5jdXIgPj0gc2l6
ZW9mKCpkZXNjKSApCj4gPiA+ICsgICAgZWxzZSBpZiAoIHJ2ID0gaHZtX3NyX2hhbmRsZXJzW3R5
cGVjb2RlXS5raW5kID09Cj4gPiA+IEhWTVNSX1BFUl9WQ1BVID8KPiA+ID4gKyAgICAgICAgICAg
ICAgLUVOT0RBVEEgOiAtRU5PRU5ULCBjdHh0LmN1ciA+PSBzaXplb2YoKmRlc2MpICkKPiA+ID4g
ICAgICB7Cj4gPiA+ICAgICAgICAgIHVpbnQzMl90IG9mZjsKPiA+ID4gIAo+ID4gPiAtLSAKPiA+
ID4gMi4xNy4xCj4gPiA+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
