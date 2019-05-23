From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/IO-APIC: fix build with gcc9
Date: Thu, 23 May 2019 15:20:33 +0100
Message-ID: <20190523142033.GF2373@zion.uk.xensource.com>
References: <5CE6A6020200007800231BBD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TQZZ=TX=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hToaK-0008Ph-Dy
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 14:20:44 +0000
Content-Disposition: inline
In-Reply-To: <5CE6A6020200007800231BBD@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDc6NTQ6MTBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlcmUgYXJlIGEgbnVtYmVyIG9mIHBvaW50bGVzcyBfX3BhY2tlZCBhdHRyaWJ1dGVz
IHdoaWNoIGNhdXNlIGdjYyA5IHRvCj4gbGVnaXRpbWF0ZWx5IHdhcm46Cj4gCj4gdXRpbHMuYzog
SW4gZnVuY3Rpb24gJ3Z0ZF9kdW1wX2lvbW11X2luZm8nOgo+IHV0aWxzLmM6Mjg3OjMzOiBlcnJv
cjogY29udmVydGluZyBhIHBhY2tlZCAnc3RydWN0IElPX0FQSUNfcm91dGVfZW50cnknIHBvaW50
ZXIgKGFsaWdubWVudCAxKSB0byBhICdzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9yZW1hcF9lbnRyeScg
cG9pbnRlciAoYWxpZ25tZW50IDgpIG1heSByZXN1bHQgaW4gYW4gdW5hbGlnbmVkIHBvaW50ZXIg
dmFsdWUgWy1XZXJyb3I9YWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVyXQo+ICAgMjg3IHwgICAgICAg
ICAgICAgICAgIHJlbWFwID0gKHN0cnVjdCBJT19BUElDX3JvdXRlX3JlbWFwX2VudHJ5ICopICZy
dGU7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KPiAKPiBpbnRyZW1hcC5jOiBJbiBmdW5jdGlvbiAnaW9hcGljX3J0ZV90
b19yZW1hcF9lbnRyeSc6Cj4gaW50cmVtYXAuYzozNDM6MjU6IGVycm9yOiBjb252ZXJ0aW5nIGEg
cGFja2VkICdzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeScgcG9pbnRlciAoYWxpZ25tZW50IDEp
IHRvIGEgJ3N0cnVjdCBJT19BUElDX3JvdXRlX3JlbWFwX2VudHJ5JyBwb2ludGVyIChhbGlnbm1l
bnQgOCkgbWF5IHJlc3VsdCBpbiBhbiB1bmFsaWduZWQgcG9pbnRlciB2YWx1ZSBbLVdlcnJvcj1h
ZGRyZXNzLW9mLXBhY2tlZC1tZW1iZXJdCj4gICAzNDMgfCAgICAgcmVtYXBfcnRlID0gKHN0cnVj
dCBJT19BUElDX3JvdXRlX3JlbWFwX2VudHJ5ICopIG9sZF9ydGU7Cj4gICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gCj4gU2ltcGx5IGRy
b3AgdGhlc2UgYXR0cmlidXRlcy4gVGFrZSB0aGUgbGliZXJ0eSBhbmQgYWxzbyByZS1mb3JtYXQg
dGhlCj4gc3RydWN0dXJlIGRlZmluaXRpb25zIGF0IHRoZSBzYW1lIHRpbWUuCj4gCj4gUmVwb3J0
ZWQtYnk6IENoYXJsZXMgQXJub2xkIDxjYXJub2xkQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
