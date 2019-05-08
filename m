From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/mm: subsume set_gpfn_from_mfn() into
 guest_physmap_add_entry()
Date: Wed, 8 May 2019 16:08:18 +0100
Message-ID: <64365dfd-3324-7b2d-f8d9-8600627f467f@citrix.com>
References: <5CCA94F9020000780022B02A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DUHD=TI=citrix.com=prvs=024c7dee5=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hOOBE-0001Vh-Av
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 15:08:24 +0000
In-Reply-To: <5CCA94F9020000780022B02A@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8yLzE5IDc6NTggQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgaXMgd2hhdCBib3Ro
IGNhbGxlcnMgb2YgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZSgpIGluIG1lbW9yeS5jIHdhbnQKPiAo
Zm9yIHRoZSAhcGFnaW5nX21vZGVfdHJhbnNsYXRlKCkgY2FzZSksIGFuZCBpdCBpcyBhbHNvIHdo
YXQgYm90aAo+IGNhbGxlcnMgaW4gZ250dGFiX3RyYW5zZmVyKCkgbmVlZCAoYnV0IGhhdmUgYmVl
biBsYWNraW5nKS4gVGhlIG90aGVyCj4gKHg4Ni1zcGVjaWZpYykgY2FsbGVycyBhcmUgYWxsIEhW
TS1vbmx5LCBhbmQgaGVuY2UgdW5hZmZlY3RlZCBieSB0aGlzCj4gY2hhbmdlLgo+IAo+IFNhZGx5
IHRoaXMgaXNuJ3QgZW5vdWdoIHlldCB0byBkcm9wIEFybSdzIGR1bW15IG1hY3JvLCBhcyB0aGVy
ZSdzIG9uZQo+IG1vcmUgdXNlIGluIHBhZ2VfYWxsb2MuYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gLS0tIGEveGVuL2FyY2gveDg2L21t
L3AybS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gQEAgLTg0MSwxNSArODQxLDE5
IEBAIGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5KHN0cnVjdCBkb21haW4gKmQKPiAgICAgICAgICAg
KiBhbnkgZ3Vlc3QtcmVxdWVzdGVkIHR5cGUgY2hhbmdlcyBzdWNjZWVkIGFuZCByZW1vdmUgdGhl
IElPTU1VCj4gICAgICAgICAgICogZW50cnkpLgo+ICAgICAgICAgICAqLwo+IC0gICAgICAgIGlm
ICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSB8fCB0ICE9IHAybV9yYW1fcncgKQo+ICsgICAgICAg
IGlmICggdCAhPSBwMm1fcmFtX3J3ICkKPiAgICAgICAgICAgICAgcmV0dXJuIDA7CgpTbywgeW91
IHNlZW0gdG8gYmUgY2xhaW1pbmcgdGhhdCB0aGUgb25seSB3YXkgdG8gZ2V0IGhlcmUgaXMgdmlh
Cmd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoKSwgd2hpY2ggd2lsbCBhbHdheXMgY2FsbCB0aGlzIGZ1
bmN0aW9uIHdpdGgKcDJtX3JhbV9ydy4gIFNvIHRoZW4gd2hhdCdzIHRoZSBwb2ludCBvZiB0aGlz
IGNvbmRpdGlvbmFsIGF0IGFsbAphbnltb3JlPyAgV291bGQgaXQgYmUgYmV0dGVyIHRvIGFkZCBh
biBBU1NFUlQodCA9PSBwMm1fcmFtX3J3KSBoZXJlPwoKQW5kIGlmIHdlIGV2ZXIgKmRvKiBnZXQg
aGVyZSB3aXRoIHQgPT0gcDJtX3JhbV9ydywgZG8gd2UgcmVhbGx5IG5vdCB3YW50CnRvIGNhbGwg
c2V0X2dwZm5fZnJvbV9tZm4oKT8KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
