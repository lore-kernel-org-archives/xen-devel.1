From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 5/9] x86: relocate pvh_info
Date: Fri, 19 Jan 2018 10:53:53 +0000
Message-ID: <20180119105353.urn7doxvyir27l46@MacBook-Pro-de-Roger.local>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
 <20180118181652.26397-6-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0ckf=ae=citrix.com=prvs=55082200c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ecUJQ-0003CO-54
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 10:54:20 +0000
Content-Disposition: inline
In-Reply-To: <20180118181652.26397-6-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTgsIDIwMTggYXQgMDY6MTY6NDhQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TIGIveGVuL2FyY2gveDg2L2Jv
b3QvaGVhZC5TCj4gaW5kZXggMGY2NTJjZWExMS4uMmY5NGMyODZkNSAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMK
PiBAQCAtNDE0LDYgKzQxNCw3IEBAIF9fcHZoX3N0YXJ0Ogo+ICAKPiAgICAgICAgICAvKiBTZXQg
dHJhbXBvbGluZV9waHlzIHRvIHVzZSBtZm4gMSB0byBhdm9pZCBoYXZpbmcgYSBtYXBwaW5nIGF0
IFZBIDAgKi8KPiAgICAgICAgICBtb3Z3ICAgICQweDEwMDAsIHN5bV9lc2kodHJhbXBvbGluZV9w
aHlzKQo+ICsgICAgICAgIHhvciAgICAgJWVheCwgJWVheCAvKiBOZWVkZWQgYnkgcmVsb2MuYyAq
LwoKSSB3b3VsZCByYXRoZXIgZG86Cgptb3ZsICRYRU5fSFZNX1NUQVJUX01BR0lDX1ZBTFVFLCVl
YXgKCk9yOgoKbW92ICglZWJ4KSwlZWF4CgpTbyB0aGF0Li4uCgo+IC1tdWx0aWJvb3RfaW5mb190
IF9fc3RkY2FsbCAqcmVsb2ModTMyIG1iX21hZ2ljLCB1MzIgbWJpX2luLCB1MzIgdHJhbXBvbGlu
ZSkKPiArdm9pZCBfX3N0ZGNhbGwgKnJlbG9jKHUzMiBtYWdpYywgdTMyIGluLCB1MzIgdHJhbXBv
bGluZSkKPiAgewo+ICAgICAgYWxsb2MgPSB0cmFtcG9saW5lOwo+ICAKPiAtICAgIGlmICggbWJf
bWFnaWMgPT0gTVVMVElCT09UMl9CT09UTE9BREVSX01BR0lDICkKPiAtICAgICAgICByZXR1cm4g
bWJpMl9yZWxvYyhtYmlfaW4pOwo+ICsjaWZkZWYgQ09ORklHX1BWSF9HVUVTVAo+ICsgICAgaWYg
KCBtYWdpYyA9PSAwICkKCi4uLiBoZXJlIHlvdSBjYW4gZG8gbWFnaWMgPT0gWEVOX0hWTV9TVEFS
VF9NQUdJQ19WQUxVRS4KCj4gKyAgICAgICAgcmV0dXJuIHB2aF9pbmZvX3JlbG9jKGluKTsKPiAr
ICAgIGVsc2UKPiArI2VuZGlmCj4gKyAgICBpZiAoIG1hZ2ljID09IE1VTFRJQk9PVDJfQk9PVExP
QURFUl9NQUdJQyApCj4gKyAgICAgICAgcmV0dXJuIG1iaTJfcmVsb2MoaW4pOwo+ICAgICAgZWxz
ZQo+IC0gICAgICAgIHJldHVybiBtYmlfcmVsb2MobWJpX2luKTsKPiArICAgICAgICByZXR1cm4g
bWJpX3JlbG9jKGluKTsKCkEgJ3N3aXRjaCAoIG1hZ2ljICknIHdvdWxkIGJlIGJldHRlciBoZXJl
IElNSE8uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
