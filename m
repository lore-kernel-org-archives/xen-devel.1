From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] xen/public: Document
 HYPERCALL_console_io()
Date: Tue, 09 Apr 2019 05:42:40 -0600
Message-ID: <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
 <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
 <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDp9I-0003vZ-IS
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:42:44 +0000
In-Reply-To: <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA0LjE5IGF0IDEzOjI2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDAzLzA0LzIwMTkgMTQ6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBbHNvIHBsZWFzZSBu
b3RlIHRoZSBxdW90YXRpb24gdXNlZCBieSB0aGUgbWVudGlvbmVkCj4+IGV4aXN0aW5nIGRvYyBj
b21tZW50cywgYXMgd2VsbCBhcyBhIGZldyBvdGhlciBmb3JtYWwgYXNwZWN0cwo+PiAobGlrZSB0
aGVtIGFsc28gbWFraW5nIGNsZWFyIHdoYXQgdGhlIHJldHVybiB0eXBlIGlzKS4gSSB0aGluawo+
PiB0aGF0J3MgYSBtb2RlbCB1c2VkIGVsc2V3aGVyZSBhcyB3ZWxsLCBzbyBJIHRoaW5rIHlvdSBz
aG91bGQKPj4gZm9sbG93IGl0IGhlcmUuCj4gCj4gSSBoYXZlbid0IHJlcGxpY2F0ZWQgdGhlIGAg
YmVjYXVzZSBJIGhhdmUgbm8gaWRlYSB3aGF0IHRoZXkgYXJlIHVzZWQgZm9yLiBJIAo+IHdvdWxk
IGFwcHJlY2lhdGUgaWYgeW91IHByb3ZpZGUgcG9pbnRlciBob3cgdG8gdXNlIHRoZW0uCgpXZWxs
LCBJIGNhbiBvbmx5IHBvaW50IHlvdSBhdCB0aGUgaGlzdG9yeSBvZiB0aGluZ3MsIGUuZy4KMjYy
ZTExOGEzNyAiZG9jcy9odG1sLzogQW5ub3RhdGlvbnMgZm9yIHR3byBoeXBlcmNhbGxzIi4KCj4+
IFRoZSBvdGhlciB0aGluZyBpczogQXMgbWVudGlvbmVkIGVsc2V3aGVyZSwgSSBkb24ndCB0aGlu
ayB0aGUKPj4gZmlyc3QgdHdvIHBhcmFtZXRlcnMgc2hvdWxkIGJlIHBsYWluIGludC4gSSdtIG5v
dCBoYXBweSB0byBzZWUKPj4gdGhpcyBwcm9saWZlcmF0ZSBpbnRvIGRvY3VtZW50YXRpb24gYXMg
d2VsbCwgaS5lLiBJJ2QgcHJlZmVyIGlmCj4+IHRoaXMgd2FzIGNvcnJlY3RlZCBiZWZvcmUgYWRk
aW5nIGRvY3VtZW50YXRpb24uIFdvdWxkIHlvdQo+PiBiZSB3aWxsaW5nIHRvIGRvIHRoaXMsIG9y
IHNob3VsZCBJIGFkZCBpdCB0byBteSB0b2RvIGxpc3Q/Cj4gCj4gV2hpbGUgc3dpdGNoaW5nIGZy
b20gY21kIGZyb20gc2lnbmVkIHRvIHVuc2lnbmVkIHNob3VsZCBiZSBvay4gVGhpcyB3b3VsZCAK
PiBpbnRyb2R1Y2UgYSBkaWZmZXJlbnQgYmVoYXZpb3Igb2YgZm9yIGNvdW50LgoKU2luY2UgdGhp
cyByZW1vdmVzIGFuIGVycm9yIGNvbmRpdGlvbiwgSSB0aGluayB0aGlzIGlzIGFuIG9rYXkgY2hh
bmdlCnRvIGhhcHBlbiwgd2l0aG91dCAuLi4KCj4gQXJlIHdlIGhhcHB5IHdpdGggdGhhdCwgb3Ig
c2hhbGwgd2UgYWRkIGEgY2hlY2sgKChpbnQpY291bnQpID4gMD8KCi4uLiBhbnkgc3VjaCBleHRy
YSBjaGVjay4gVGhpcyBhbHNvIGlzbid0IGdvaW5nIHRvIGludHJvZHVjZSBhbnkgbmV3CnJlYWwg
cmlzayBvZiBhIGxvbmcgcnVubmluZyBvcGVyYXRpb24gb3Igc29tZSBzdWNoIC0gaWYgMkdiIG9m
IGlucHV0CmRhdGEgYXJlIGZpbmUsIEkgY2FuJ3Qgc2VlIHdoeSA0R2Igd291bGRuJ3QgYmUsIHRv
by4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
