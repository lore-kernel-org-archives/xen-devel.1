From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Xen-unstable PVHdom0: Assertion
 'IS_ALIGNED(dfn_x(dfn), (1ul << page_order))' failed at iommu.c:324
Date: Fri, 18 Jan 2019 13:50:58 +0100
Message-ID: <20190118125058.4old2fc2zvzyue6f@mac>
References: <cafa45db-e775-b212-ad12-90236f151bb5@eikelenboom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cEJC=P2=citrix.com=prvs=914b546e2=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gkTdX-0000jl-4W
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 12:52:39 +0000
Content-Disposition: inline
In-Reply-To: <cafa45db-e775-b212-ad12-90236f151bb5@eikelenboom.it>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTgsIDIwMTkgYXQgMDE6MDM6MDRQTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+IEhpIFJvZ2VyLAo+IAo+IEkgZ2F2ZSBQVkggZG9tMCBhIHNwaW4sIHNlZSBo
b3cgZmFyIEkgd291bGQgZ2V0LgoKVGhhbmtzIQoKPiBXaXRoIGN1cnJlbnQgeGVuLXVuc3RhYmxl
IHVuZm9ydHVuYXRlbHkgbm90IHRoYXQgZmFyLCBpIGdvdCB0aGUgc3BsYXQgYmVsb3cuCgpZZXMs
IHRoaXMgd2FzIGFscmVhZHkgcmVwb3J0ZWQ6CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDEvbXNnMDEwMzAuaHRtbAoKPiBJZiB5b3Ug
bmVlZCBtb3JlIGluZm8sIHdvdWxkIGxpa2UgbWUgdG8gdGVzdCBhIHBhdGNoIChvciBzb21lIG90
aGVyIGdpdCB0cmVlL2JyYW5jaCksIAo+IEkgd2lsbCBiZSBoYXBweSB0byBnaXZlIGl0IGEgc3Bp
biAhCgpQYXVsIGlzIHdvcmtpbmcgb24gYSBmaXgsIGJ1dCBpbiB0aGUgbWVhbnRpbWUganVzdCBy
ZW1vdmluZyB0aGUKYXNzZXJ0aW9ucyBzaG91bGQgYmUgZmluZToKCi0tLTg8LS0tCmRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvaW9tbXUuYwppbmRleCBiZDFhZjM1YTEzLi45OGU2ZmMzNWUyIDEwMDY0NAotLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMKQEAgLTMyMSw5ICszMjEsNiBAQCBpbnQgaW9tbXVfbWFwKHN0cnVjdCBkb21h
aW4gKmQsIGRmbl90IGRmbiwgbWZuX3QgbWZuLAogICAgIGlmICggIWlvbW11X2VuYWJsZWQgfHwg
IWhkLT5wbGF0Zm9ybV9vcHMgKQogICAgICAgICByZXR1cm4gMDsKIAotICAgIEFTU0VSVChJU19B
TElHTkVEKGRmbl94KGRmbiksICgxdWwgPDwgcGFnZV9vcmRlcikpKTsKLSAgICBBU1NFUlQoSVNf
QUxJR05FRChtZm5feChtZm4pLCAoMXVsIDw8IHBhZ2Vfb3JkZXIpKSk7Ci0KICAgICBmb3IgKCBp
ID0gMDsgaSA8ICgxdWwgPDwgcGFnZV9vcmRlcik7IGkrKyApCiAgICAgewogICAgICAgICByYyA9
IGhkLT5wbGF0Zm9ybV9vcHMtPm1hcF9wYWdlKGQsIGRmbl9hZGQoZGZuLCBpKSwgbWZuX2FkZCht
Zm4sIGkpLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
