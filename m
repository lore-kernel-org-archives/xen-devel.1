From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] mm: disallow MEMF_no_refcount to be
 passed for domain-owned allocations
Date: Tue, 20 Nov 2018 16:35:06 +0000
Message-ID: <ceb94eb3-5b0a-8178-904f-024916cf1179@citrix.com>
References: <5BF4328902000078001FE240@prv1-mh.provo.novell.com>
 <5BF4339D02000078001FE26D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwHA=N7=citrix.com=prvs=8552da0fd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gP9Ch-0003h5-6E
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 16:48:47 +0000
In-Reply-To: <5BF4339D02000078001FE26D@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMTEvMjAxOCAxNjoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hlbiBzdWNoIHBhZ2Vz
IGdldCBhc3NpZ25lZCB0byBkb21haW5zIChhbmQgaGVuY2UgdGhlaXIgLT50b3RfcGFnZXMKPiBu
b3QgaW5jcmVtZW50ZWQgYWNjb3JkaW5nbHkpIHdlIHdvdWxkIG90aGVyd2lzZSBhbHNvIG5lZWQg
dG8gc3VwcHJlc3MKPiBkZWNyZW1lbnRpbmcgdGhlIGNvdW50IHdoZW4gZnJlZWluZyB0aG9zZSBw
YWdlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Pgo+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gKysrIGIveGVuL2NvbW1vbi9wYWdl
X2FsbG9jLmMKPiBAQCAtMjMwMyw2ICsyMzAzLDggQEAgc3RydWN0IHBhZ2VfaW5mbyAqYWxsb2Nf
ZG9taGVhcF9wYWdlcygKPiAgCj4gICAgICBpZiAoIG1lbWZsYWdzICYgTUVNRl9ub19vd25lciAp
Cj4gICAgICAgICAgbWVtZmxhZ3MgfD0gTUVNRl9ub19yZWZjb3VudDsKPiArICAgIGVsc2UgaWYg
KCAobWVtZmxhZ3MgJiBNRU1GX25vX3JlZmNvdW50KSAmJiBkICkKPiArICAgICAgICByZXR1cm4g
TlVMTDsKClBlcmhhcHMgQVNTRVJUX1VOUkVBQ0hBQkxFKCkgaW4gaGVyZSBhcyB3ZWxsPwoKQXMg
d2UndmUgbGVhcm50IHRoZSBoYXJkIHdheSwgdGhpcyBpcyBkZWZpbml0ZWx5IGEgcHJvZ3JhbW1p
bmcgZXJyb3IsIHNvCnByb3ZpZGluZyBhIHN0YWNrIHRyYWNlIGlzIGxpYWJsZSB0byBiZSBtb3Jl
IGhlbHBmdWwgdG8gc29tZW9uZQpkZWJ1Z2dpbmcgd2h5IHRoZWlyIG1lbW9yeSBhbGxvY2F0aW9u
cyBhcmUgc3VkZGVubHkgZmFpbGluZy4KCn5BbmRyZXcKCj4gIAo+ICAgICAgaWYgKCBkbWFfYml0
c2l6ZSAmJiAoKGRtYV96b25lID0gYml0c190b196b25lKGRtYV9iaXRzaXplKSkgPCB6b25lX2hp
KSApCj4gICAgICAgICAgcGcgPSBhbGxvY19oZWFwX3BhZ2VzKGRtYV96b25lICsgMSwgem9uZV9o
aSwgb3JkZXIsIG1lbWZsYWdzLCBkKTsKPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
