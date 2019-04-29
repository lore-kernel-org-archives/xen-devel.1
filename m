From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Mon, 29 Apr 2019 10:05:47 -0600
Message-ID: <CABfawhk4AnVBMTssrqsDr7e9FB2GSiCn9iE13L5=sBKhQdiEeQ@mail.gmail.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
 <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
 <4b3607ed-5596-496b-f6a6-19548703b773@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL8nV-0003OH-68
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:06:29 +0000
Received: by mail-wm1-f49.google.com with SMTP id h18so16632605wml.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 09:06:24 -0700 (PDT)
In-Reply-To: <4b3607ed-5596-496b-f6a6-19548703b773@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgOTo1MiBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8yOS8xOSA0OjQxIFBNLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4gPiBPbiBNb24sIEFwciAyOSwgMjAxOSBhdCA5OjAxIEFNIEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4KPiA+Pj4+PiBPbiAyNi4wNC4xOSBh
dCAxOToyMSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+ID4+PiBAQCAtOTk5LDYgKzk5
NiwxMCBAQCBzdGF0aWMgaW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBz
Z2ZuLCBzaHJfaGFuZGxlX3Qgc2gsCj4gPj4+ICAgICAgbWVtX3NoYXJpbmdfcGFnZV91bmxvY2so
c2Vjb25kcGcpOwo+ID4+PiAgICAgIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKGZpcnN0cGcpOwo+
ID4+Pgo+ID4+PiArICAgIEJVR19PTighcHV0X2NvdW50KTsKPiA+Pj4gKyAgICB3aGlsZSAoIHB1
dF9jb3VudC0tICkKPiA+Pj4gKyAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUoY3BhZ2UpOwo+ID4+
PiArCj4gPj4+ICAgICAgLyogRnJlZSB0aGUgY2xpZW50IHBhZ2UgKi8KPiA+Pj4gICAgICBpZih0
ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICZjcGFnZS0+Y291bnRfaW5mbykpCj4g
Pj4+ICAgICAgICAgIHB1dF9wYWdlKGNwYWdlKTsKPiA+Pgo+ID4+IElmIHRoaXMgd2FzIHRvIGhh
cHBlbiBiZWZvcmUgYWxsIHRoZSBwdXRfcGFnZV9hbmRfdHlwZSgpIGNhbGxzLAo+ID4+IHdvdWxk
bid0IGl0IHJlbmRlciB1bm5lY2Vzc2FyeSB0aGUgZXh0cmEgZ2V0X3BhZ2UoKS9wdXRfcGFnZSgp
Cj4gPj4gYXJvdW5kIHRoaXMgY29kZSByZWdpb24/Cj4gPgo+ID4gSXQgd291bGQgLSBJIGFscmVh
ZHkgc2VudCBhIHZlcnNpb24gb2YgdGhlIHBhdGNoIGluIHRoYXQgZm9ybSBidXQKPiA+IHRoZXJl
IHdhcyB1bmVhc2UgZXhwcmVzc2VkIGJ5IEdlb3JnZSBnb2luZyB0aGF0IHJvdXRlIGJlY2F1c2Ug
b2YgdGhlCj4gPiBjb21wbGV4aXR5IG9mIHRoZSBjb2RlIGFuZCBpbiBoaXMgdmlldyBpdCdzIHRo
ZSBzYWZlIGJldCB0byBrZWVwIHRoZQo+ID4gZXh0cmEgcmVmZXJlbmNlcy4gSSB0aGluayB0aGUg
b3ZlcmhlYWQgb2YgZ3JhYmJpbmcgdGhlIGV4dHJhCj4gPiByZWZlcmVuY2VzIGlzIG5lZ2xpZ2li
bGUgZW5vdWdoIHRoYXQgSSdtIG5vdCBnb2luZyB0byBhcmd1ZSBvdmVyIGl0Lgo+Cj4gRXIsIHRo
YXQncyBub3Qgd2hhdCBJIHNhaWQuIDotKQo+Cj4gSSBnYXZlIGZvdXIgcG9zc2libGUgb3B0aW9u
cywgKm9uZSogb2Ygd2hpY2ggd2FzIHRvIGNoYW5nZSB0aGUgQVNTRVJUKCkKPiB0byBhIEJVR19P
TigpLCBhbmQgKm9uZSogb2Ygd2hpY2ggd2FzIHRvIGtlZXAgdGhlIChwcm9iYWJseSByZWR1bmRh
bnQpCj4gZ2V0X3BhZ2UoKSBhbmQgcHV0X3BhZ2UoKSBjYWxscy4gIFlvdSBhcHBlYXIgdG8gaGF2
ZSBkb25lIGJvdGguIDotKQoKQWggaW5kZWVkIC0gSSd2ZSBjb21iaW5lZCB0aG9zZSByZWNvbW1l
bmRhdGlvbnMgOikKCj4KPiBJIGhhdmVuJ3QgcmUtZ3Jva2tlZCB0aGUgY29kZSBoZXJlLCBidXQg
YXNzdW1pbmcgSSB3YXMgY29ycmVjdCAyIHdlZWtzCj4gYWdvLCBpZiB5b3UgaGF2ZSB0aGUgQlVH
X09OKCkgdGhlcmUsIHlvdSBjYW4gZ2V0IHJpZCBvZiB0aGUgZXh0cmEKPiByZWZlcmVuY2VzLgo+
CgpTdXJlLCBidXQgYWdhaW4sIHRoZSBvdmVyaGVhZCBvZiBoYXZpbmcgdGhlbSBpbi1wbGFjZSBp
cyBuZWdsaWdpYmxlIHNvCm1pZ2h0IGFzIHdlbGwganVzdCBrZWVwIGl0LgoKVGFtYXMKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
