From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v21 1/2] common: add a new mappable resource
 type: XENMEM_resource_grant_table
Date: Wed, 08 Aug 2018 04:47:11 -0600
Message-ID: <5B6ACA2F02000078001DBF61@prv1-mh.provo.novell.com>
References: <20180808090032.2713-1-paul.durrant@citrix.com>
 <20180808090032.2713-2-paul.durrant@citrix.com>
 <77c64c71-f966-67c1-da3c-c3614d638199@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wdim=kx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fnLzo-0006Qe-Aw
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 10:47:16 +0000
In-Reply-To: <77c64c71-f966-67c1-da3c-c3614d638199@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA4LjE4IGF0IDEyOjEwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDgvMDgvMTggMTA6MDAsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gK3N0YXRpYyBp
bnQgZ250dGFiX2dldF9zdGF0dXNfZnJhbWVfbWZuKHN0cnVjdCBkb21haW4gKmQsCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGlkeCwgbWZu
X3QgKm1mbikKPj4gK3sKPj4gKyAgICBzdHJ1Y3QgZ3JhbnRfdGFibGUgKmd0ID0gZC0+Z3JhbnRf
dGFibGU7Cj4+ICsKPj4gKyAgICBBU1NFUlQoZ3QtPmd0X3ZlcnNpb24gPT0gMik7Cj4+ICsKPj4g
KyAgICBpZiAoIGlkeCA+PSBucl9zdGF0dXNfZnJhbWVzKGd0KSApCj4+ICsgICAgewo+PiArICAg
ICAgICB1bnNpZ25lZCBsb25nIG5yID0gc3RhdHVzX3RvX2dyYW50X2ZyYW1lcyhpZHggKyAxKTsK
PiAKPiBXaHkgdGhlICsxID8gV29uJ3QgdGhhdCBjYXVzZSBhIGZhaWx1cmUgaWYgeW91IGF0dGVt
cHQgdG8gbWFwIHRoZQo+IG1heGltdW0gdmFsaWQgaW5kZXg/CgpUaGF0J3MgdGhlIG5vcm1hbCBp
bmRleC1vZi1zb21ldGhpbmcgdG8gY291bnQtb2Ytc29tZXRoaW5nCmNvbnZlcnNpb24gKG9yIGVs
c2UgdGhlIHRhYmxlIG1heSBnZXQgZ3Jvd24gYnkgdG9vIGxpdHRsZSkuIEkndmUKaW5zdGVhZCBi
ZWVuIGNvbnNpZGVyaW5nIHRoZSBiYWRuZXNzIG9mIG92ZXJmbG93IGhlcmUsIGJ1dApkZWNpZGVk
IHRvIGxlYXZlIGl0IHVuY29tbWVudGVkIGFzIHRoZSBjaGVjayBmdXJ0aGVyIGRvd24Kd291bGQg
YXQgbGVhc3Qgbm90IG1ha2UgdGhpcyBpbnNlY3VyZS4gSG93ZXZlciwgd2l0aCAuLi4KCj4+ICsK
Pj4gKyAgICAgICAgaWYgKCBuciA8PSBndC0+bWF4X2dyYW50X2ZyYW1lcyApCj4+ICsgICAgICAg
ICAgICBnbnR0YWJfZ3Jvd190YWJsZShkLCBucik7Cj4gCj4gWW91IHdhbnQgdG8gY2FwdHVyZSB0
aGUgcmV0dXJuIHZhbHVlIG9mIGdyb3dfdGFibGUoKSwgd2hpY2ggYXQgbGVhc3QKPiBkaXN0aW5n
dWlzaGVzIGJldHdlZW4gRU5PREVWIGFuZCBFTk9NRU0uCj4gCj4+ICsKPj4gKyAgICAgICAgaWYg
KCBpZHggPj0gbnJfc3RhdHVzX2ZyYW1lcyhndCkgKQo+PiArICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gCj4gVGhpcyBjYW4gcHJvYmFibHkoPykgYmUgYXNzZXJ0ZWQgaWYgZ250dGFiX2dy
b3dfdGFibGUoKSByZXR1cm5zCj4gc3VjY2Vzc2Z1bGx5LgoKLi4uIHRoZXNlIHR3byBhIHBvdGVu
dGlhbCBvdmVyZmxvdyBhYm92ZSB3b3VsZCB0aGVuIGhhdmUgYQpjaGFuY2Ugb2YgdHJpZ2dlcmlu
ZyB0aGUgYXNzZXJ0aW9uIHlvdSBzdWdnZXN0IHRvIGFkZC4KCkFzIHRvIHRoZSBncm93X3RhYmxl
KCkgcmV0dXJuIHZhbHVlIGNoZWNrIC0gSSdkIHByZWZlciBpZiB0aGUKcGF0Y2ggaGVyZSBkaWRu
J3QgYWx0ZXIgb3JpZ2luYWwgYmVoYXZpb3IuIElmIHdlIHdhbnQgaXQgYWx0ZXJlZCwKYmV0dGVy
IGluIGEgc2VwYXJhdGUgcGF0Y2guCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
