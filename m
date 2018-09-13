From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/4] x86/HVM: prefill cache with PDPTEs
 when possible
Date: Thu, 13 Sep 2018 02:55:10 -0600
Message-ID: <5B9A25EE02000078001E814E@prv1-mh.provo.novell.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <5B97C01202000078001E7413@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D191301A70@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jl0+=l3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g0NP8-00088a-80
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 08:55:14 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D191301A70@SHSMSX101.ccr.corp.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Tian <kevin.tian@intel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDA4OjMwLCA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOgo+
PiAgRnJvbTogSmFuIEJldWxpY2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDog
VHVlc2RheSwgU2VwdGVtYmVyIDExLCAyMDE4IDk6MTYgUE0KPj4gCj4+IFNpbmNlIHN0cmljdGx5
IHNwZWFraW5nIGl0IGlzIGluY29ycmVjdCBmb3IgZ3Vlc3Rfd2Fsa190YWJsZXMoKSB0byByZWFk
Cj4+IEwzIGVudHJpZXMgZHVyaW5nIFBBRSBwYWdlIHdhbGtzLCB0cnkgdG8gb3ZlcmNvbWUgdGhp
cyB3aGVyZSBwb3NzaWJsZSBieQo+IAo+IGNhbiB5b3UgZWxhYm9yYXRlPyB3aHkgaXQncyBpbmNv
cnJlY3QgdG8gcmVhZCBMMyBlbnRyaWVzPwoKQXJjaGl0ZWN0dXJhbCBiZWhhdmlvcjogSW4gUEFF
IG1vZGUgdGhleSBnZXQgcmVhZCB1cG9uIENSMyBsb2FkcywKbm90IGR1cmluZyBwYWdlIHdhbGtz
LgoKPj4gcHJlLWxvYWRpbmcgdGhlIHZhbHVlcyBmcm9tIGhhcmR3YXJlIGludG8gdGhlIGNhY2hl
LiBTYWRseSB0aGUKPj4gaW5mb3JtYXRpb24gaXMgYXZhaWxhYmxlIGluIHRoZSBFUFQgY2FzZSBv
bmx5LiBPbiB0aGUgcG9zaXRpdmUgc2lkZSBmb3IKPj4gTlBUIHRoZSBzcGVjIHNwZWxscyBvdXQg
dGhhdCBMMyBlbnRyaWVzIGFyZSBhY3R1YWxseSByZWFkIG9uIHdhbGtzLCBzbwo+PiB1cyByZWFk
aW5nIHRoZW0gaXMgY29uc2lzdGVudCB3aXRoIGhhcmR3YXJlIGJlaGF2aW9yIGluIHRoYXQgY2Fz
ZS4KPiAKPiBJJ20gYSBsaXR0bGUgYml0IGNvbmZ1c2VkIGFib3V0IHRoZSBkZXNjcmlwdGlvbiBo
ZXJlLiB5b3UgY2hhbmdlCj4gVk1YIGNvZGUgYnV0IHVzaW5nIE5QVCBzcGVjIGFzIHRoZSByZWZl
cmVuY2U/CgpJJ20gdHJ5aW5nIHRvIGV4cGxhaW4gd2h5IHRoZXJlIG5vdCBiZWluZyBhIHdheSB0
byBkbyB0aGUgc2FtZSBvbgpOUFQgaXMgbm90IG9ubHkgbm90IGEgcHJvYmxlbSwgYnV0IGluIGxp
bmUgd2l0aCBoYXJkd2FyZSBiZWhhdmlvci4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
