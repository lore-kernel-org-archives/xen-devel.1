From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] mm: disallow MEMF_no_refcount to be
 passed for domain-owned allocations
Date: Fri, 23 Nov 2018 10:28:03 +0000
Message-ID: <79b38b7a-29a9-256f-6e36-c85c115ccde2@citrix.com>
References: <3B3E4AB50200006BB4B78B26@prv1-mh.provo.novell.com>
 <5BF4339D02000078001FE26D@prv1-mh.provo.novell.com>
 <5BF7CC5102000078001FF4AE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zeqX=OC=citrix.com=prvs=8587bc52e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gQ8gw-0006aF-UC
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 10:28:06 +0000
In-Reply-To: <5BF7CC5102000078001FF4AE@prv1-mh.provo.novell.com>
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

T24gMjMvMTEvMjAxOCAwOTo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hlbiBzdWNoIHBhZ2Vz
IGdldCBhc3NpZ25lZCB0byBkb21haW5zIChhbmQgaGVuY2UgdGhlaXIgLT50b3RfcGFnZXMKPiBu
b3QgaW5jcmVtZW50ZWQgYWNjb3JkaW5nbHkpIHdlIHdvdWxkIG90aGVyd2lzZSBhbHNvIG5lZWQg
dG8gc3VwcHJlc3MKPiBkZWNyZW1lbnRpbmcgdGhlIGNvdW50IHdoZW4gZnJlZWluZyB0aG9zZSBw
YWdlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
PiAtLS0KPiB2MjogQWRkIEFTU0VSVF9VTlJFQUNIQUJMRSgpLgo+Cj4gLS0tIGEveGVuL2NvbW1v
bi9wYWdlX2FsbG9jLmMKPiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+IEBAIC0yMzAz
LDYgKzIzMDMsMTEgQEAgc3RydWN0IHBhZ2VfaW5mbyAqYWxsb2NfZG9taGVhcF9wYWdlcygKPiAg
Cj4gICAgICBpZiAoIG1lbWZsYWdzICYgTUVNRl9ub19vd25lciApCj4gICAgICAgICAgbWVtZmxh
Z3MgfD0gTUVNRl9ub19yZWZjb3VudDsKPiArICAgIGVsc2UgaWYgKCAobWVtZmxhZ3MgJiBNRU1G
X25vX3JlZmNvdW50KSAmJiBkICkKPiArICAgIHsKPiArICAgICAgICBBU1NFUlRfVU5SRUFDSEFC
TEUoKTsKClNvcnJ5IHRvIGRvIHRoaXMsIGJ1dCBvbiBzZWNvbmQgdGhvdWdodHMsIHRoaXMgcGF0
aCBpc24ndCBhY3R1YWxseQp1bnJlYWNoYWJsZS4KCkNvdWxkIEkgdGFsayB5b3UgaW50byB1c2lu
ZyBBU1NFUlQoISJBc3NpZ25lZCBkb21oZWFwIHBhZ2VzIG11c3QgYmUKcmVmY291bnRlZCIpIGlu
c3RlYWQsIHRvIGdpdmUgYSBzbGlnaHRseSBtb3JlIGNsZWFyIGVycm9yIHRvIGRldmVsb3BlcnMK
d2hvIG1hbmFnZSB0byBoaXQgaXQ/CgpJZiB5b3UncmUgaGFwcHkgd2l0aCBzb21ldGhpbmcgYWxv
bmcgdGhvc2UgbGluZXMsIFJldmlld2VkLWJ5OiBBbmRyZXcKQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
