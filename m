From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 9/9] xen: Remove mfn_to_gmfn macro
Date: Thu, 14 Mar 2019 01:59:21 -0600
Message-ID: <5C8A09D9020000780021E67B@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-10-julien.grall@arm.com>
 <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
 <d99d0f41-9f56-be1b-96eb-de34fce812ee@arm.com>
 <5C892459020000780021E3FF@prv1-mh.provo.novell.com>
 <e5f62bfe-d31e-53b3-41c2-493960742890@arm.com>
 <5C8928DE020000780021E44B@prv1-mh.provo.novell.com>
 <5246f4a3-9099-d3e8-b950-4a17afb8e63b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4LGz-0006AF-0k
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 07:59:29 +0000
In-Reply-To: <5246f4a3-9099-d3e8-b950-4a17afb8e63b@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE5IGF0IDE4OjM0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDMvMjAxOSAxNTo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEz
LjAzLjE5IGF0IDE2OjQ4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4gT24gMTMv
MDMvMjAxOSAxNTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMTMuMDMuMTkgYXQg
MTY6MjQsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDEzLzAzLzIwMTkg
MTU6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gMTguMDIuMTkgYXQgMTI6MzYs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUv
YXNtLWFybS9tbS5oCj4+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4+Pj4+
Pj4gQEAgLTMyMSwxMCArMzIxLDggQEAgc3RydWN0IHBhZ2VfaW5mbyAqZ2V0X3BhZ2VfZnJvbV9n
dmEoc3RydWN0IHZjcHUgKnYsIAo+Pj4gdmFkZHJfdCB2YSwKPj4+Pj4+PiAgICAjZGVmaW5lIFNI
QVJFRF9NMlBfRU5UUlkgICAgICAgICAofjBVTCAtIDFVTCkKPj4+Pj4+PiAgICAjZGVmaW5lIFNI
QVJFRF9NMlAoX2UpICAgICAgICAgICAoKF9lKSA9PSBTSEFSRURfTTJQX0VOVFJZKQo+Pj4+Pj4+
ICAgIAo+Pj4+Pj4+IC0vKiBYZW4gYWx3YXlzIG93bnMgUDJNIG9uIEFSTSAqLwo+Pj4+Pj4+ICsv
KiBXZSBkb24ndCBoYXZlIGEgTTJQIG9uIEFybSAqLwo+Pj4+Pj4+ICAgICNkZWZpbmUgc2V0X2dw
Zm5fZnJvbV9tZm4obWZuLCBwZm4pIGRvIHsgKHZvaWQpIChtZm4pLCAodm9pZCkocGZuKTsgfSAK
Pj4+IHdoaWxlICgwKQo+Pj4+Pj4+IC0jZGVmaW5lIG1mbl90b19nbWZuKF9kLCBtZm4pICAobWZu
KQo+Pj4+Pj4gU28gaXMgdGhlIHBsYW4gdG8gcmVtb3ZlIHRoZSBvdGhlciBtYWNybyBmcm9tIEFy
bSB0aGVuIGFzIHdlbGw/Cj4+Pj4+IERvIHlvdSBtZWFuIG1mbl90b19nZm4/IElmIHNvIGl0IGRv
ZXMgbm90IGV4aXN0IG9uIEFybS4KPj4+PiBObywgSSBtZWFuIHRoZSBvbmUgaW4gY29udGV4dCBh
Ym92ZSAtIHNldF9ncGZuX2Zyb21fbWZuKCkuCj4+PiBJdCBpcyB1c2VkIGluIGNvbW1vbiBjb2Rl
LCBzbyB3ZSB3b3VsZCBuZWVkIHRvICNpZGVmIHRoZSBjYWxsZXIuCj4+IEhtbSwgcmlnaHQsIHN1
Y2ggI2lmZGVmLWFyeSB3b3VsZCBiZSB1bmRlc2lyYWJsZSAoYW5kIHR3byBvdXQgb2YKPj4gdGhl
IHRocmVlIGNvbW1vbiBjb2RlIGNhbGxlcnMgd291bGQgbmVlZCBpdC4KPj4KPj4+IEkgdGhpbmsg
aXQgaXMgYmV0dGVyIHRvIHByb3ZpZGUgYSBOT1AgaW1wbGVtZW50YXRpb24uIENvdWxkIGJlIG1v
dmVkIHNvbWV3aGVyZSAKPj4+IGluIHRoZSBjb21tb24gaGVhZGVyIHRob3VnaC4gQW55IG9waW5p
b25zPwo+PiBUaGlzIHdvdWxkIHBlcmhhcHMgYmUgYmV0dGVyLCBub3cgdGhhdCB5b3UgaGF2ZSBI
QVZFX00yUC4KPiAKPiBHaXZlbiB0aGF0ICJoYXZpbmcgYW4gTTJQIiBpcyBub3cgYW4geDg2LXNw
ZWNpZmljIGNvbmNlcHQsIEkgdGhpbmsKPiBwaGFzaW5nIHNldF9ncGZuX2Zyb21fbWZuKCkncyB1
c2Ugb3V0IG9mIGNvbW1vbiBjb2RlIGlzIHRoZSB3YXkgdG8gZ28uCgpCdXQgd2hhdCdzIHRoZSBp
bXBsaWNhdGlvbiBvZiB0aGlzPyBUaGVyZSB3b3VsZCBuZWVkIHRvIGJlIHNvbWUKYXJjaF8qKCkg
aG9vayB1c2VkIGluIHRoZSBwbGFjZSB0aGF0IHNldF9ncGZuX2Zyb21fbWZuKCkgaXMKaW52b2tl
ZCBjdXJyZW50bHkuIEJ1dCB0aGVuIGl0IGNhbiBhcyB3ZWxsIHJlbWFpbgpzZXRfZ3Bmbl9mcm9t
X21mbigpICh3aXRoIHRoZSAhSEFWRV9NMlAgc3R1YmJlZCBvdXQgcHJvcGVybHkKaW4gYSBjb21t
b24gaGVhZGVyKSwgY2FuJ3QgaXQ/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
