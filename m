From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] dom_cow is needed for mem-sharing only
Date: Tue, 04 Jun 2019 00:46:02 -0600
Message-ID: <5CF613AA0200007800234E24@prv1-mh.provo.novell.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <CABfawhmsNx6L74jJEuPnfcXPXv3w2_q_nXHrcqVbd6TdDjs6pA@mail.gmail.com>
 <5CF4D98F02000078002346D9@prv1-mh.provo.novell.com>
 <CABfawhk2BEuUq+c_n1ssw0viEzdwf+tC=JTYZ6Tt4i7kyrjPVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY3D1-0000eN-Dm
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 06:46:11 +0000
In-Reply-To: <CABfawhk2BEuUq+c_n1ssw0viEzdwf+tC=JTYZ6Tt4i7kyrjPVw@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA2LjE5IGF0IDIxOjU3LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBKdW4gMywgMjAxOSBhdCAyOjI1IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4+Cj4+ID4+PiBPbiAwMi4wNi4xOSBhdCAwMjo0MCwgPHRhbWFzQHRrbGVu
Z3llbC5jb20+IHdyb3RlOgo+PiA+IE9uIEZyaSwgTWF5IDMxLCAyMDE5IGF0IDM6MzUgQU0gSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4gPj4KPj4gPj4gQSBjb3VwbGUg
b2YgYWRqdXN0bWVudHMgYXJlIG5lZWRlZCB0byBjb2RlIGNoZWNraW5nIGZvciBkb21fY293LCBi
dXQKPj4gPj4gc2luY2UgdGhlcmUgYXJlIHByZXR0eSBmZXcgaXQgaXMgcHJvYmFibHkgYmV0dGVy
IHRvIGFkanVzdCB0aG9zZSB0aGFuCj4+ID4+IHRvIHNldCB1cCBhbmQga2VlcCBhcm91bmQgYSBu
ZXZlciB1c2VkIGRvbWFpbi4KPj4gPj4KPj4gPj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIHRp
Z2h0ZW4gYSBCVUdfT04oKSBpbiBlbXVsLXByaXYtb3AuYzpyZWFkX2NyKCkuCj4+ID4+IChBcmd1
YWJseSB0aGlzIHBlcmhhcHMgc2hvdWxkbid0IGJlIGEgQlVHX09OKCkgaW4gdGhlIGZpcnN0IHBs
YWNlLikKPj4gPj4KPj4gPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+PiA+PiAtLS0KPj4gPj4gV2hpbGUgZm9yIG5vdyB0aGlzIGF2b2lkcyBjcmVhdGlu
ZyB0aGUgZG9tYWluIG9uIEFybSBvbmx5LCBUYW1hcydlcwo+PiA+PiBwYXRjaCBzd2l0Y2hpbmcg
dG8gQ09ORklHX01FTV9TSEFSSU5HIHdpbGwgbWFrZSB4ODYgbGV2ZXJhZ2UgdGhpcyB0b28uCj4+
ID4KPj4gPiBwZXJoYXBzIGl0IHdvdWxkIGJlIGJldHRlciB0byBoYXZlIHRoaXMgcGF0Y2ggYmUg
YXBwbGllZCBhZnRlciBteQo+PiA+IHBhdGNoPyBZb3UgYWxyZWFkeSBhY2tlZCB0aGF0IG9uZSBh
bmQgaXQgY291bGQgYmUgYXBwbGllZCBzZXBhcmF0ZWx5Cj4+ID4gZnJvbSB0aGUgc2VyaWVzIHRo
YXQgSSd2ZSBzZW50IGl0IGFzIHBhcnQgb2YuCj4+Cj4+IE9oLCBJIGRpZG4ndCByZWFsaXplIGl0
IGlzIGVudGlyZWx5IGluZGVwZW5kZW50IG9mIHRoZSBlYXJsaWVyIHBhdGNoZXMuCj4+IEl0IHdv
dWxkIGhlbHAgdG8gcG9pbnQgc3VjaCBvdXQgaW4gdGhlIGNvdmVyIGxldHRlciwgcmVxdWlyaW5n
IHRoZXJlCj4+IHRvIGJlIG9uZSBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gCj4gUmlnaHQsIEkgc2hv
dWxkIGhhdmUgYWRkZWQgYSBjb3ZlciBsZXR0ZXIuIFRoYXQgInNlcmllcyIgaXMgbW9yZSBsaWtl
Cj4gYW4gYXNzb3J0ZWQgY29sbGVjdGlvbiBvZiBmaXhlcyByYXRoZXIgdGhlbiBhIHNlcmllcyBp
biBhIHN0cmljdAo+IHNlbnNlLgoKSW4gd2hpY2ggY2FzZSBhbiBvcHRpb24gd291bGQgaGF2ZSBi
ZWVuIHRvIHNlbmQgZm91ciBzdGFuZGFsb25lCnBhdGNoZXMuIChJJ20gZGVmaW5pdGVseSBubyBj
b25zaXN0ZW50IHdpdGggdGhpcyBteXNlbGYgLSB0aGVyZSBhcmUKY2FzZXMgd2hlcmUgSSBjb2xs
ZWN0IHRoaW5ncyBpbnRvIGEgc2VyaWVzLCBidXQgdGhlcmUgYXJlIGFsc28gY2FzZXMKd2hlcmUg
SSBzZW5kIG11bHRpcGxlIGluZGl2aWR1YWwgcGF0Y2hlcy4pCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
