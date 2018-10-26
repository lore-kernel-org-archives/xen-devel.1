From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] CONFIG_XEN_PV breaks
 xen_create_contiguous_region on ARM
Date: Fri, 26 Oct 2018 08:54:56 +0200
Message-ID: <f9c0b190-e56b-0204-3ae3-349f8cd7d5df@suse.com>
References: <alpine.DEB.2.10.1810161627250.5150@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=h74x=ng=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gFw1M-0002mt-T3
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 06:55:00 +0000
In-Reply-To: <alpine.DEB.2.10.1810161627250.5150@sstabellini-ThinkPad-X260>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com, vkuznets@redhat.com
Cc: xen-devel@lists.xenproject.org, Nathan.Studer@dornerworks.com, Jeff.Kubascik@dornerworks.com, Jarvis.Roach@dornerworks.com
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMTAvMjAxOCAxMDozOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IHhlbl9jcmVh
dGVfY29udGlndW91c19yZWdpb24gaGFzIG5vdyBvbmx5IGFuIGltcGxlbWVudGF0aW9uIGlmCj4g
Q09ORklHX1hFTl9QViBpcyBkZWZpbmVkLiBIb3dldmVyLCBvbiBBUk0gd2UgbmV2ZXIgc2V0IENP
TkZJR19YRU5fUFYgYnV0Cj4gd2UgZG8gaGF2ZSBhbiBpbXBsZW1lbnRhdGlvbiBvZiB4ZW5fY3Jl
YXRlX2NvbnRpZ3VvdXNfcmVnaW9uIHdoaWNoIGlzCj4gcmVxdWlyZWQgZm9yIHN3aW90bGIteGVu
IHRvIHdvcmsgY29ycmVjdGx5IChhbHRob3VnaCBpdCBqdXN0IHNldHMKPiAqZG1hX2hhbmRsZSku
Cj4gCj4gVGhpcyBmaXhlcyBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IDE2NjI0MzkwODE2YzRjNDBkZjNk
Nzc3YjM0NjY1ZDNmZDAxZTY5M2QuCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL3hlbi1v
cHMuaCBiL2luY2x1ZGUveGVuL3hlbi1vcHMuaAo+IGluZGV4IGZkMThjOTcuLjkzOWE5NjIgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS94ZW4veGVuLW9wcy5oCj4gKysrIGIvaW5jbHVkZS94ZW4veGVu
LW9wcy5oCj4gQEAgLTQxLDcgKzQxLDcgQEAgc3RhdGljIGlubGluZSB1aW50MzJfdCB4ZW5fdmNw
dV9ucihpbnQgY3B1KQo+ICAKPiAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgKnhlbl9jb250aWd1b3Vz
X2JpdG1hcDsKPiAgCj4gLSNpZmRlZiBDT05GSUdfWEVOX1BWCj4gKyNpZmRlZiBDT05GSUdfWEVO
X1BWIHx8IENPTkZJR19BUk0gfHwgQ09ORklHX0FSTTY0Cj4gIGludCB4ZW5fY3JlYXRlX2NvbnRp
Z3VvdXNfcmVnaW9uKHBoeXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVyLAo+ICAJ
CQkJdW5zaWduZWQgaW50IGFkZHJlc3NfYml0cywKPiAgCQkJCWRtYV9hZGRyX3QgKmRtYV9oYW5k
bGUpOwo+IAo+IAoKQ291bGQgeW91IHBsZWFzZSB0ZXN0IHlvdXIgcGF0Y2ggYmVmb3JlIHNlbmRp
bmc/IEl0IGRvZXNuJ3QgZXZlbiBjb21waWxlCndpdGhvdXQgd2FybmluZyBhbmQgaXQgaXMgbWlz
c2luZyBTb0IsIGNvcnJlY3QgIkZpeGVzOiIgdGFnIGFuZCBsb29rcyBhcwppZiBpdCBoYXMgYmVl
biBhc3NlbWJsZWQgYnkgaGFuZCBpbnN0ZWFkIG9mIHVzaW5nIGEgcHJvcGVyIHRvb2wgbGlrZQoi
Z2l0IGZvcm1hdC1wYXRjaCIgKG5vICItLS0iIGRlbGltaXRlciwgZXh0cmEgZW1wdHkgbGluZXMg
YXQgdGhlIGVuZCkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
