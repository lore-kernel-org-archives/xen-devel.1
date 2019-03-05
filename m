From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/3] memory: restrict
 XENMEM_remove_from_physmap to translated guests
Date: Tue, 05 Mar 2019 08:22:33 -0700
Message-ID: <5C7E9439020000780021BC6F@prv1-mh.provo.novell.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@suse.com>
 <55039c66-447d-6aa5-446e-58b0e3496e97@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M+W2=RI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1Btx-0001Ni-KX
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 15:22:41 +0000
In-Reply-To: <55039c66-447d-6aa5-446e-58b0e3496e97@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE5IGF0IDE0OjUzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
NS8wMy8yMDE5IDE0OjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlIGNvbW1pdCByZS1pbnRy
b2R1Y2luZyBpdCAoMTRlYjNiNDFkMCBbInhlbjogcmVpbnN0YXRlIHByZXZpb3VzbHkKPj4gdW51
c2VkIFhFTk1FTV9yZW1vdmVfZnJvbV9waHlzbWFwIGh5cGVyY2FsbCJdKSBhcyB3ZWxsIGFzIHRo
ZSBvbmUgaGF2aW5nCj4+IG9yaWdpbmFsbHkgaW50cm9kdWNlZCBpdCAoZDgxOGYzY2I3YyBbImh2
bTogVXNlIG1haW4gbWVtb3J5IGZvciB2aWRlbwo+PiBtZW1vcnkiXSkgYW5kIHRoZSBvbmUgdGhl
biBwdXJnaW5nIGl0IGFnYWluICg3OGMzMDk3ZTRmIFsiUmVtb3ZlIHVudXNlZAo+PiBYRU5NRU1f
cmVtb3ZlX2Zyb21fcGh5c21hcCJdKSBtYWtlIGNsZWFyIHRoYXQgdGhpcyBvcGVyYXRpb24gaXMg
aW50ZW5kZWQKPj4gZm9yIHVzZSBvbiBIVk0gKGkuZS4gdHJhbnNsYXRlZCkgZ3Vlc3RzIG9ubHku
IFJlc3RyaWN0IGl0IGF0IGxlYXN0IGFzCj4+IG11Y2gsIGJlY2F1c2UgZm9yIFBWIGd1ZXN0cyBk
b2N1bWVudGF0aW9uIChpbiB0aGUgcHVibGljIGhlYWRlcikgZG9lcwo+PiBub3QgZXZlbiBtYXRj
aCB0aGUgaW1wbGVtZW50YXRpb246IEl0IHRhbGtzIGFib3V0IEdQRk4gYXMgaW5wdXQsIGJ1dAo+
PiBnZXRfcGFnZV9mcm9tX2dmbigpIGFzc3VtZXMgYSBHTUZOIGluIHRoZSBub24tdHJhbnNsYXRl
ZCBjYXNlIChhbmQgaGFuZHMKPj4gYmFjayB0aGUgdmFsdWUgcGFzc2VkIGluKS4KPj4gCj4+IEFs
c28gbGlmdCB0aGUgY2hlY2sgaW4gWEVOTUVNX2FkZF90b19waHlzbWFweyxfYmF0Y2h9IGhhbmRs
aW5nIHVwCj4+IGRpcmVjdGx5IGludG8gdG9wIGxldmVsIGh5cGVyY2FsbCBoYW5kbGluZywgYW5k
IGNsYXJpZnkgdGhpbmdzIGluIHRoZQo+PiBwdWJsaWMgaGVhZGVyIGFjY29yZGluZ2x5Lgo+PiAK
Pj4gVGFrZSB0aGUgbGliZXJ0eSBhbmQgYWxzbyByZXBsYWNlIGEgcG9pbnRsZXNzIHVzZSBvZiAi
Y3VycmVudCIgd2l0aCBhCj4+IG1vcmUgZWZmaWNpZW50IHVzZSBvZiBhbiBleGlzdGluZyBsb2Nh
bCB2YXJpYWJsZSAob3IgZnVuY3Rpb24gcGFyYW1ldGVyCj4+IHRvIGJlIHByZWNpc2UpLgo+PiAK
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IERv
IEkgcmVhZCB0aGlzIGNvcnJlY3RseTogbm90aGluZyBiYWQgZm9yIHRoZSBob3N0IGNhbiBoYXBw
ZW4gd2l0aG91dAo+IHRoaXMgcGF0Y2g/CgpJZiB5b3UgYWRkICJJdCBpcyBiZWxpZXZlZCB0aGF0
IC4uLiIsIHRoZW4geWVzLgoKPiBJZiB0aGlzIGlzIGNvcnJlY3QgSSdkIGxpa2UgdG8gZGVmZXIg
dGhpcyBwYXRjaCB1bnRpbCA0LjEzLgoKT2theS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
