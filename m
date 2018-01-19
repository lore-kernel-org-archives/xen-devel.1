From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 9/9] x86/shim: pass through vcpu runstate to
	L0 Xen
Date: Fri, 19 Jan 2018 15:18:07 +0000
Message-ID: <20180119151807.duni7w2vgzmmmvho@citrix.com>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
 <20180118181652.26397-10-wei.liu2@citrix.com>
 <20180119111838.ib45r6zsenom5xrv@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pswu=eo=citrix.com=prvs=5505d9d7e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecYRC-0000Kz-SK
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 15:18:38 +0000
Content-Disposition: inline
In-Reply-To: <20180119111838.ib45r6zsenom5xrv@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Anthony Liguori <anthony@codemonkey.ws>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTksIDIwMTggYXQgMTE6MTg6MzhBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEphbiAxOCwgMjAxOCBhdCAwNjoxNjo1MlBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29t
bW9uL2RvbWFpbi5jCj4gPiBpbmRleCA1NTgzMThlODUyLi4xODlmZmFjOWIxIDEwMDY0NAo+ID4g
LS0tIGEveGVuL2NvbW1vbi9kb21haW4uYwo+ID4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwo+
ID4gQEAgLTQ1LDYgKzQ1LDcgQEAKPiA+ICAKPiA+ICAjaWZkZWYgQ09ORklHX1g4Ngo+ID4gICNp
bmNsdWRlIDxhc20vZ3Vlc3QuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVyY2FsbC5o
Pgo+ID4gICNlbmRpZgo+ID4gIAo+ID4gIC8qIExpbnV4IGNvbmZpZyBvcHRpb246IHByb3BhZ2V0
ZWQgdG8gZG9tYWluMCAqLwo+ID4gQEAgLTE0MjUsNiArMTQyNiwxNSBAQCBsb25nIGRvX3ZjcHVf
b3AoaW50IGNtZCwgdW5zaWduZWQgaW50IHZjcHVpZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2
b2lkKSBhcmcpCj4gPiAgICAgICAgICBpZiAoICFndWVzdF9oYW5kbGVfb2theShhcmVhLmFkZHIu
aCwgMSkgKQo+ID4gICAgICAgICAgICAgIGJyZWFrOwo+ID4gIAo+ID4gKyNpZiBDT05GSUdfWDg2
Cj4gPiArICAgICAgICBpZiAoIHB2X3NoaW0gKQo+ID4gKyAgICAgICAgewo+ID4gKyAgICAgICAg
ICAgIHJjID0geGVuX2h5cGVyY2FsbF92Y3B1X29wKFZDUFVPUF9yZWdpc3Rlcl9ydW5zdGF0ZV9t
ZW1vcnlfYXJlYSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2
Y3B1aWQsICZhcmVhKTsKPiA+ICsgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgIH0KPiA+
ICsjZW5kaWYKPiAKPiBUaGlzIG9ubHkgZml4ZXMgVkNQVU9QX3JlZ2lzdGVyX3J1bnN0YXRlX21l
bW9yeV9hcmVhLCBidXQKPiBWQ1BVT1BfZ2V0X3J1bnN0YXRlX2luZm8gd2lsbCBzdGlsbCByZXBv
cnQgd3JvbmcgaW5mb3JtYXRpb24uIEkndmUKClllcywgaXQgYXBwZWFycyB0aGF0IHdlIHNob3Vs
ZCBwYXNzdGhyb3VnaCB0aGF0IGNhbGwgYXMgd2VsbC4KCj4gYWxzbyB3b25kZXJlZCB3aGV0aGVy
IHNpbXBseSByZXR1cm5pbmcgTDAgaW5mb3JtYXRpb24gaXMgY29ycmVjdC4gVG8KPiBnZXQgdGhl
IGV4YWN0IGluZm9ybWF0aW9uIHRoZSBzaGltIHNob3VsZCBhY3R1YWxseSByZXR1cm4gdGhlIEww
Cj4gaW5mb3JtYXRpb24gcGx1cyB3aGF0ZXZlciB0aW1lIGl0IHN0ZWFscyBmcm9tIHRoZSBndWVz
dC4KPiAKCkkgdGhpbmsgdGhhdCBzaG91bGQgYmUgbW9zdGx5IGNvcnJlY3QuIFRoZSBlcnJvciBt
YXJnaW4gaW4gdGhlIHNoaW0Kc2hvdWxkIGJlIHZlcnkgc21hbGwuCgo+IEFsc28sIGJlZm9yZSBh
ZGRpbmcgbW9yZSBob29rcyB0byBkb192Y3B1X29wIEkgd291bGQgYXR0ZW1wdCB0byBhZGQgYQo+
IHB2X3NoaW1fZG9fdmNwdV9vcCBoZWxwZXIgYW5kIHBhdGNoIHRoZSBoeXBlcmNhbGwgdGFibGUs
IGluIG9yZGVyIHRvCj4gYXZvaWQgbW9kaWZ5aW5nIG1vcmUgY29tbW9uIGNvZGUuIEFGQUlDVCB0
aGlzIGRvZXNuJ3QgcmVxdWlyZSBhZGRpbmcKPiBtdWNoIGNvbXBhdCBjb2RlIHRvIHRoZSBzaGlt
IGltcGxlbWVudGF0aW9uLgo+IAoKR29vZCBpZGVhLgoKSSdtIGdvaW5nIHRvIHJldmlzaXQgdGhp
cyBpZGVhIG5leHQgd2VlayB3aGVuIEkgaGF2ZSBtb3JlIHRpbWUuIEluIHRoZQptZWFuIHRpbWUg
SSB3aWxsIHJlcG9zdCB0aGUgZml4ZXMgcGF0Y2hlcyBJIGhhdmUuCgpXZWkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
