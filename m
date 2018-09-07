From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] x86/hvm: Switch hvm_allow_get_param()
 to use a whitelist
Date: Fri, 07 Sep 2018 02:55:30 -0600
Message-ID: <5B923D0202000078001E63A4@prv1-mh.provo.novell.com>
References: <1536171124-27053-1-git-send-email-andrew.cooper3@citrix.com>
 <1536171124-27053-2-git-send-email-andrew.cooper3@citrix.com>
 <c2554d76f69749078dfe1ca60340042e@AMSPEX02CL03.citrite.net>
 <2145af5a-d61e-9b0c-2d47-b3f4e155306b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <2145af5a-d61e-9b0c-2d47-b3f4e155306b@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA5LjE4IGF0IDE3OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDYvMDkvMTggMDk6NTYsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IEBAIC00Mzkw
LDkgKzQ0MTEsNiBAQCBzdGF0aWMgaW50IGh2bW9wX2dldF9wYXJhbSgKPj4+ICAgICAgaWYgKCBj
b3B5X2Zyb21fZ3Vlc3QoJmEsIGFyZywgMSkgKQo+Pj4gICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7
Cj4+Pgo+Pj4gLSAgICBpZiAoIGEuaW5kZXggPj0gSFZNX05SX1BBUkFNUyApCj4+PiAtICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPj4+IC0KPj4gQVNTRVJULCBqdXN0IGluIGNhc2Ugc29tZW9uZSBz
Y3Jld3MgdXAgdGhlIGFsbG93IGZ1bmN0aW9uIGluIGZ1dHVyZT8KPiAKPiBUaGF0J3Mgbm90IGdv
aW5nIHRvIGhlbHAgaW4gYW55IHByYWN0aWNhbCB3YXkuICBUaGlzIGNoZWNrIGRvZXMgcmVhbGx5
Cj4gZXhpc3QsIGFuZCBpcyBwYXJ0IG9mIHRoZSBzd2l0Y2ggc3RhdGVtZW50LgoKV2hpY2ggc3dp
dGNoKCkgc3RhdGVtZW50PyBUaGUgb25lIGluIHRoZSBhbGxvdyBmdW5jdGlvbiBpbmNsdWRlcyB0
aGlzLApidXQgdGhlIG9uZSBoZXJlIHNpbXBseSBoYXMKCiAgICBkZWZhdWx0OgogICAgICAgIGEu
dmFsdWUgPSBkLT5hcmNoLmh2bS5wYXJhbXNbYS5pbmRleF07CiAgICAgICAgYnJlYWs7CgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
