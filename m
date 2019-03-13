From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-next 9/9] xen: Remove mfn_to_gmfn macro
Date: Wed, 13 Mar 2019 17:34:41 +0000
Message-ID: <5246f4a3-9099-d3e8-b950-4a17afb8e63b@citrix.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-10-julien.grall@arm.com>
 <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
 <d99d0f41-9f56-be1b-96eb-de34fce812ee@arm.com>
 <5C892459020000780021E3FF@prv1-mh.provo.novell.com>
 <e5f62bfe-d31e-53b3-41c2-493960742890@arm.com>
 <5C8928DE020000780021E44B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tilE=RQ=citrix.com=prvs=968d75336=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h47sa-0001Ph-BZ
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 17:41:24 +0000
In-Reply-To: <5C8928DE020000780021E44B@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDMvMjAxOSAxNTo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTMuMDMuMTkg
YXQgMTY6NDgsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAx
My8wMy8yMDE5IDE1OjQwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDEzLjAzLjE5IGF0
IDE2OjI0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+IE9uIDEzLzAzLzIwMTkg
MTU6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+PiBPbiAxOC4wMi4xOSBhdCAxMjozNiwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vbW0uaAo+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4+Pj4+PiBA
QCAtMzIxLDEwICszMjEsOCBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfcGFnZV9mcm9tX2d2YShz
dHJ1Y3QgdmNwdSAqdiwgCj4+IHZhZGRyX3QgdmEsCj4+Pj4+PiAgICAjZGVmaW5lIFNIQVJFRF9N
MlBfRU5UUlkgICAgICAgICAofjBVTCAtIDFVTCkKPj4+Pj4+ICAgICNkZWZpbmUgU0hBUkVEX00y
UChfZSkgICAgICAgICAgICgoX2UpID09IFNIQVJFRF9NMlBfRU5UUlkpCj4+Pj4+PiAgICAKPj4+
Pj4+IC0vKiBYZW4gYWx3YXlzIG93bnMgUDJNIG9uIEFSTSAqLwo+Pj4+Pj4gKy8qIFdlIGRvbid0
IGhhdmUgYSBNMlAgb24gQXJtICovCj4+Pj4+PiAgICAjZGVmaW5lIHNldF9ncGZuX2Zyb21fbWZu
KG1mbiwgcGZuKSBkbyB7ICh2b2lkKSAobWZuKSwgKHZvaWQpKHBmbik7IH0gCj4+IHdoaWxlICgw
KQo+Pj4+Pj4gLSNkZWZpbmUgbWZuX3RvX2dtZm4oX2QsIG1mbikgIChtZm4pCj4+Pj4+IFNvIGlz
IHRoZSBwbGFuIHRvIHJlbW92ZSB0aGUgb3RoZXIgbWFjcm8gZnJvbSBBcm0gdGhlbiBhcyB3ZWxs
Pwo+Pj4+IERvIHlvdSBtZWFuIG1mbl90b19nZm4/IElmIHNvIGl0IGRvZXMgbm90IGV4aXN0IG9u
IEFybS4KPj4+IE5vLCBJIG1lYW4gdGhlIG9uZSBpbiBjb250ZXh0IGFib3ZlIC0gc2V0X2dwZm5f
ZnJvbV9tZm4oKS4KPj4gSXQgaXMgdXNlZCBpbiBjb21tb24gY29kZSwgc28gd2Ugd291bGQgbmVl
ZCB0byAjaWRlZiB0aGUgY2FsbGVyLgo+IEhtbSwgcmlnaHQsIHN1Y2ggI2lmZGVmLWFyeSB3b3Vs
ZCBiZSB1bmRlc2lyYWJsZSAoYW5kIHR3byBvdXQgb2YKPiB0aGUgdGhyZWUgY29tbW9uIGNvZGUg
Y2FsbGVycyB3b3VsZCBuZWVkIGl0Lgo+Cj4+IEkgdGhpbmsgaXQgaXMgYmV0dGVyIHRvIHByb3Zp
ZGUgYSBOT1AgaW1wbGVtZW50YXRpb24uIENvdWxkIGJlIG1vdmVkIHNvbWV3aGVyZSAKPj4gaW4g
dGhlIGNvbW1vbiBoZWFkZXIgdGhvdWdoLiBBbnkgb3BpbmlvbnM/Cj4gVGhpcyB3b3VsZCBwZXJo
YXBzIGJlIGJldHRlciwgbm93IHRoYXQgeW91IGhhdmUgSEFWRV9NMlAuCgpHaXZlbiB0aGF0ICJo
YXZpbmcgYW4gTTJQIiBpcyBub3cgYW4geDg2LXNwZWNpZmljIGNvbmNlcHQsIEkgdGhpbmsKcGhh
c2luZyBzZXRfZ3Bmbl9mcm9tX21mbigpJ3MgdXNlIG91dCBvZiBjb21tb24gY29kZSBpcyB0aGUg
d2F5IHRvIGdvLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
