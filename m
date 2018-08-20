From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 07/34] x86: only call memory_type_changed
 for HVM guests
Date: Mon, 20 Aug 2018 05:57:25 -0600
Message-ID: <5B7AACA502000078001E0008@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <ede6a87dc100c0ef2cf28f7acc562244b8b0f79e.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1frioO-0002dF-OY
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 11:57:32 +0000
In-Reply-To: <ede6a87dc100c0ef2cf28f7acc562244b8b0f79e.1534518694.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWN0bC5j
Cj4gQEAgLTQxNiw3ICs0MTYsNyBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKAo+ICAgICAgICAgICAg
ICByZXQgPSBpb3BvcnRzX3Blcm1pdF9hY2Nlc3MoZCwgZnAsIGZwICsgbnAgLSAxKTsKPiAgICAg
ICAgICBlbHNlCj4gICAgICAgICAgICAgIHJldCA9IGlvcG9ydHNfZGVueV9hY2Nlc3MoZCwgZnAs
IGZwICsgbnAgLSAxKTsKPiAtICAgICAgICBpZiAoICFyZXQgKQo+ICsgICAgICAgIGlmICggIXJl
dCAmJiBpc19odm1fZG9tYWluKGQpICkKPiAgICAgICAgICAgICAgbWVtb3J5X3R5cGVfY2hhbmdl
ZChkKTsKCkkgdGhpbmsgd2hldGhlciB0byBhZGQgaXNfaHZtXy4uLigpIGNvbmRpdGlvbmFscyBv
ciB3aGV0aGVyIHRvIGludHJvZHVjZQpzdHVicyBzaG91bGQgYmUgc2VsZWN0ZWQgYmFzZWQgb24g
cmVzdWx0aW5nIGNvZGUgY2h1cm46IEluIHRoZSBjYXNlCmhlcmUgdGhpcyB3b3VsZCBzZWVtIHRv
IHN1Z2dlc3QgYSBzdGF0aWMgaW5saW5lIHN0dWIgaXMgb24gb3JkZXIuIE9yCnBlcmhhcHMgbW9y
ZSBnZW5lcmljYWxseSAtIGlmIGEgZnVuY3Rpb24gYWxyZWFkeSBzaXRzIHNvbGVseSBvbiBpc19o
dm1fLi4uKCkKZ3VhcmRlZCBjb2RlIHBhdGhzLCBkb24ndCBpbnRyb2R1Y2UgYSBzdHViLCBidXQg
b3RoZXJ3aXNlIHByb2JhYmx5CmludHJvZHVjaW5nIGEgc3R1YiBpcyBwcmVmZXJhYmxlIG92ZXIg
c2NhdHRlcmluZyBhcm91bmQgbmV3IGlzX2h2bV8uLi4oKQpndWFyZHMuCgo+IEBAIC0xMDM3LDcg
KzEwMzcsOCBAQCBsb25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21j
dGxfdCkgdV9kb21jdGwpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0LCBkLT5kb21haW5f
aWQsIG1mbiwgbWZuX2VuZCk7Cj4gICAgICAgICAgfQo+ICAgICAgICAgIC8qIERvIHRoaXMgdW5j
b25kaXRpb25hbGx5IHRvIGNvdmVyIGVycm9ycyBvbiBhYm92ZSBmYWlsdXJlIHBhdGhzLiAqLwo+
IC0gICAgICAgIG1lbW9yeV90eXBlX2NoYW5nZWQoZCk7Cj4gKwlpZiAoIGlzX2h2bV9kb21haW4o
ZCkgKQoKSGFyZCB0YWIgKG5vdCB0aGF0IGl0IG1hdHRlcnMgbXVjaCB3aXRoIHRoZSBhYm92ZSku
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
