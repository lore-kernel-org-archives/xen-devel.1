From: Alexey G <x1917x@gmail.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Thu, 31 May 2018 14:25:04 +1000
Message-ID: <20180531142504.00005bda@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <cover.1520867740.git.x1917x@gmail.com>
 <62c7a3037bb9f5631542f635dc36ae3338c7bf47.1520867741.git.x1917x@gmail.com>
 <5B0D627702000078001C6A9E@prv1-mh.provo.novell.com>
 <20180530035607.000071e0@gmail.com>
 <20180530044749.00006c68@gmail.com>
 <20180530143230.0000602b@gmail.com>
 <5B0E5D2A02000078001C6DC6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t0cv=is=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1fOF9K-00014y-C8
 for xen-devel@lists.xenproject.org; Thu, 31 May 2018 04:25:18 +0000
Received: by mail-lf0-x241.google.com with SMTP id t134-v6so7629961lff.6
 for <xen-devel@lists.xenproject.org>; Wed, 30 May 2018 21:25:16 -0700 (PDT)
In-Reply-To: <5B0E5D2A02000078001C6DC6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAzMCBNYXkgMjAxOCAwMjoxMzozMCAtMDYwMAoiSmFuIEJldWxpY2giIDxKQmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6Cgo+Pj4+IE9uIDMwLjA1LjE4IGF0IDA2OjMyLCA8eDE5MTd4QGdt
YWlsLmNvbT4gd3JvdGU6ICAKPj4+IE9uIFdlZCwgMzAgTWF5IDIwMTggMDM6NTY6MDcgKzEwMDAK
Pj4+QWxleGV5IEcgPHgxOTE3eEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gIAo+Pj4+T24gVHVlLCAy
OSBNYXkgMjAxOCAwODoyMzo1MSAtMDYwMAo+Pj4+IkphbiBCZXVsaWNoIiA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+ICAgIAo+Pj4+Pj4+PiBPbiAxMi4wMy4xOCBhdCAxOTozMywgPHgx
OTE3eEBnbWFpbC5jb20+IHdyb3RlOiAgICAgICAgCj4+Pj4+PiAtLS0gYS90b29scy9maXJtd2Fy
ZS9odm1sb2FkZXIvY29uZmlnLmgKPj4+Pj4+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRl
ci9jb25maWcuaAo+Pj4+Pj4gQEAgLTUzLDEwICs1MywxNCBAQCBleHRlcm4gdWludDhfdCBpb2Fw
aWNfdmVyc2lvbjsKPj4+Pj4+ICAjZGVmaW5lIFBDSV9JU0FfREVWRk4gICAgICAgMHgwOCAgICAv
KiBkZXYgMSwgZm4gMCAqLwo+Pj4+Pj4gICNkZWZpbmUgUENJX0lTQV9JUlFfTUFTSyAgICAweDBj
MjBVIC8qIElTQSBJUlFzIDUsMTAsMTEgYXJlIFBDSSBjb25uZWN0ZWQgKi8KPj4+Pj4+ICAjZGVm
aW5lIFBDSV9JQ0g5X0xQQ19ERVZGTiAgMHhmOCAgICAvKiBkZXYgMzEsIGZuIDAgKi8KPj4+Pj4+
ICsjZGVmaW5lIFBDSV9NQ0hfREVWRk4gICAgICAgMCAgICAgICAvKiBidXMgMCwgZGV2IDAsIGZ1
bmMgMCAqLyAgICAgICAgCj4+Pj4+Cj4+Pj4+SnVzdCBNQ0ggaXMgbGlhYmxlIHRvIGJlY29tZSBh
bWJpZ3VvdXMgaW4gdGhlIGZ1dHVyZS4gUGVyaGFwcyBQQ0lfUTM1X01DSF9ERVZGTj8gICAgICAK
Pj4+Pgo+Pj4+QWdyZWUsIFBDSV9RMzVfTUNIX0RFVkZOIGlzIG1vcmUgZXhwbGljaXQuICAKPj4g
Cj4+IE9uIHRoZSBvdGhlciB0aG91Z2h0LCB3ZSBjYW4gcmV1c2Ugb25lIE1DSCBCREYgI2RlZmlu
ZSBmb3IgbXVsdGlwbGUKPj4gZW11bGF0ZWQgY2hpcHNldHMsIG5vdCBqdXN0IGZvciBzb21ldGhp
bmcgY29tcGxldGVseSBkaXN0aW5jdCB0byBRMzUKPj4gYnV0IGV2ZW4gZm9yIHRob3NlIHdoaWNo
IG1vc3RseSByZXF1aXJlIG1lcmVseSBjaGFuZ2luZyBQQ0kgRElEcyAobGlrZQo+PiBQMzUgZXRj
LikgU28gaW4gdGhpcyBjYXNlIHByb2R1Y2luZyBtdWx0aXBsZSAjZGVmaW5lcyBsaWtlCj4+IFBD
SV97UXxQfEd9MzVfTUNIX0RFVkZOIGZvciB0aGUgc2FtZSBCREYgMDowLjAgbWlnaHQgYmUgZXhj
ZXNzaXZlLgo+PiAKPj4gUENJX0lDSDlfTFBDX0RFVkZOIGNhbiBiZSBhY3R1YWxseSByZXVzZWQg
dG9vLCBpdHMgQkRGIGxvY2F0aW9uCj4+IHN1cnZpdmVkIG1hbnkgY2hpcHNldCBnZW5lcmF0aW9u
cyBzbyBpdHMgI2RlZmluZSBjYW4gYmUgc2hhcmVkIGFzIHdlbGwKPj4gKHRob3VnaCByZW5hbWVk
IHRvIHNvbWV0aGluZyBsaWtlIFBDSV9MUENfQlJJREdFX0RFVkZOKS4gIAo+Cj5QQ0lfeDM1X01D
SF9ERVZGTiB0aGVuLCB3aXRoIGEgYnJpZWYgY29tbWVudCBleHBsYWluaW5nIHRoZSB4PwoKSG1t
LCBJJ20gYWZyYWlkIHRoZXJlIGFyZSB0b28gbWFueSBjaGlwc2V0cyBzaGFyaW5nIHNpbWlsYXJp
dHkgd2l0aCBRMzUsCmluY2x1ZGluZyB4MzEgYW5kIHgzMyBzZXJpZXMuIEFsc28sIGl0IG1pZ2h0
IGJlIGNvbmZ1c2luZyBkdWUgdG8KZXhpc3RlbmNlIG9mIFgtc2VyaWVzIGNoaXBzZXRzIGxpa2Ug
SW50ZWwgWDM4LgoKSSB0aGluayBpdCdzIGJldHRlciB0byByZW5hbWUgdGhpcyAjZGVmaW5lIHRv
IFBDSV9RMzVfTUNIX0RFVkZOIGZvciBub3cKYXMgeW91IHN1Z2dlc3RlZCBhbmQgbGVhdmUgdGhl
IGNob2ljZSBvZiB1bmlmaWVkIG5hbWVzICBmb3IgYW55b25lIChpZgphbnkpIHdobyB3aWxsIGJl
IGFjdHVhbGx5IGFkZGluZyBQMzUvRzM1L2V0YyBlbXVsYXRpb24gb24gdG9wIG9mIFEzNSdzLgpT
byBmYXIgd2UncmUgbGltaXRlZCB0byBRMzUgYWZ0ZXIgYWxsLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
