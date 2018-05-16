From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 3/6] hvm/mtrr: use the hardware number of
 variable ranges for Dom0
Date: Wed, 16 May 2018 15:00:17 +0100
Message-ID: <20180516140017.gqz5lk6uo2ymeg6q@MacBook-Pro-de-Roger.local>
References: <20180515143617.69711-1-roger.pau@citrix.com>
 <20180515143617.69711-4-roger.pau@citrix.com>
 <5AFBEE3E02000078001C31F5@prv1-mh.provo.novell.com>
 <20180516115320.54bi4dzvy3bdhl77@MacBook-Pro-de-Roger.local>
 <5AFC1D7C02000078001C3316@prv1-mh.provo.novell.com>
 <20180516134118.wgulcwesvzhf7jxz@MacBook-Pro-de-Roger.local>
 <5AFC374B02000078001C3450@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dbwt=id=citrix.com=prvs=667141da6=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fIwyj-0004aW-F2
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 14:00:29 +0000
Content-Disposition: inline
In-Reply-To: <5AFC374B02000078001C3450@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMTYsIDIwMTggYXQgMDc6NTE6MDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE2LjA1LjE4IGF0IDE1OjQxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBNYXkgMTYsIDIwMTggYXQgMDY6MDE6MDBBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gQEAgLTcyOSw2ICs3MjksMTQgQEAgc3RhdGljIGludCBodm1fbG9h
ZF9tdHJyX21zcihzdHJ1Y3QgZG9tYQo+ID4+ICAgICAgaWYgKCBodm1fbG9hZF9lbnRyeShNVFJS
LCBoLCAmaHdfbXRycikgIT0gMCApCj4gPj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPj4g
IAo+ID4+ICsgICAgaWYgKCAodWludDhfdClod19tdHJyLm1zcl9tdHJyX2NhcCA+IE1UUlJfVkNO
VCApCj4gPiAKPiA+IEFuZCBoZXJlIEkgd291bGQgY29tcGFyZSBhZ2FpbnN0IHRoZSBWQ05UIGlu
IG10cnJfc3RhdGUtPm10cnJfY2F0Cj4gPiBpbnN0ZWFkIG9mIE1UUlJfVkNOVCBpZiB5b3UgYWdy
ZWUuCj4gCj4gTm8sIEkgZG9uJ3QgYWdyZWU6IFdlJ3JlIF9kZWZpbmluZ18gdGhlIG51bWJlciBv
ZiBNVFJScyBmb3IgdGhpcyB2Q1BVCj4gaGVyZS4gVGhlcmUncyBubyBkaWZmZXJlbmNlIGlmIHN1
Y2ggYSByZWNvcmQgaXMgbG9hZGVkIG9ubHkgb25jZSwgb3IgaWYgYWxsCj4gc3VjaCByZWNvcmRz
IGFncmVlIGluIGNvdW50LiBCdXQgSSBkb24ndCBzZWUgd2h5IHdlIHNob3VsZCByZWZ1c2UKPiBs
b2FkaW5nIGEgcmVjb3JkIHdpdGggYSBjb3VudCBoaWdoZXIgdGhhbiB0aGF0IHByb3ZpZGVkIGJ5
IGFuIGVhcmxpZXIKPiByZWNvcmQsIGJ1dCBubyBsYXJnZXIgdGhhbiBNVFJSX1ZDTlQuCgpZb3Ug
YXJlIHJpZ2h0LCBhIHByZXZpb3VzIGxvYWQgY291bGQgaGF2ZSBjaGFuZ2VkIG10cnJfc3RhdGUt
Pm10cnJfY2FwCnRvIDwgTVRSUl9WQ05ULCBhbmQgdGhlbiBzdWJzZXF1ZW50IGludGVudHMgdG8g
bG9hZCBNVFJSX1ZDTlQgbnVtYmVyCm9mIE1UUlJzIHdvdWxkIGZhaWwuCgpUaGFua3MsIFJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
