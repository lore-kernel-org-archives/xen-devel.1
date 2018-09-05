From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/altp2m: Allow setting the #VE info
 page for an arbitrary VCPU
Date: Wed, 05 Sep 2018 03:27:31 -0600
Message-ID: <5B8FA18302000078001E56A6@prv1-mh.provo.novell.com>
References: <20180904045922.31609-1-apop@bitdefender.com>
 <CABfawh=xspBY1rz5jWNiaOomiT8teO=pMLR+axYxptHarqAi5Q@mail.gmail.com>
 <5ed49738-7653-197c-6206-d2b8fcd94cb5@bitdefender.com>
 <5B8F7E1B02000078001E55B0@prv1-mh.provo.novell.com>
 <29aad5c1-d005-64da-e8c7-d583b17f1135@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jboo=lt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fxU63-0008KP-MN
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 09:27:35 +0000
In-Reply-To: <29aad5c1-d005-64da-e8c7-d583b17f1135@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA5LjE4IGF0IDEwOjE0LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gOS81LzE4IDk6NTYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNC4w
OS4xOCBhdCAyMjo1OCwgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Pj4gT24g
OS80LzE4IDExOjQwIFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+Pj4gT24gTW9uLCBTZXAg
MywgMjAxOCBhdCAxMDo1OSBQTSBBZHJpYW4gUG9wIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4+Pj4gKysrIGIveGVuL2Fy
Y2gveDg2L2h2bS9odm0uYwo+Pj4+PiBAQCAtNDUzMyw4ICs0NTMzLDcgQEAgc3RhdGljIGludCBk
b19hbHRwMm1fb3AoCj4+Pj4+ICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPj4+Pj4gICAg
ICB9Cj4+Pj4+Cj4+Pj4+IC0gICAgZCA9ICggYS5jbWQgIT0gSFZNT1BfYWx0cDJtX3ZjcHVfZW5h
YmxlX25vdGlmeSApID8KPj4+Pj4gLSAgICAgICAgcmN1X2xvY2tfZG9tYWluX2J5X2FueV9pZChh
LmRvbWFpbikgOiByY3VfbG9ja19jdXJyZW50X2RvbWFpbigpOwo+Pj4+PiArICAgIGQgPSByY3Vf
bG9ja19kb21haW5fYnlfYW55X2lkKGEuZG9tYWluKTsKPj4+Pgo+Pj4+IERvZXMgcmN1X2xvY2tf
ZG9tYWluX2J5X2FueV9pZCB3b3JrIGlmIGl0cyBmcm9tIHRoZSBjdXJyZW50IGRvbWFpbj8gSWYK
Pj4+PiBub3QsIGRvZXNuJ3QgdGhhdCBjaGFuZ2UgdGhpcyBmdW5jdGlvbidzIGFjY2Vzc2liaWxp
dHkgdG8gYmUgZnJvbQo+Pj4+IGV4Y2x1c2l2ZWx5IHVzYWJsZSBvbmx5IGJ5IHRoZSBvdXRzaWRl
IGFnZW50Pwo+Pj4gVGhlIGNvZGUgc2F5cyBpdCBzaG91bGQgYmUgc2FmZToKPj4+Cj4+PiAgNjMz
IHN0cnVjdCBkb21haW4gKnJjdV9sb2NrX2RvbWFpbl9ieV9hbnlfaWQoZG9taWRfdCBkb20pCj4+
PiAgNjM0IHsKPj4+ICA2MzUgICAgIGlmICggZG9tID09IERPTUlEX1NFTEYgKQo+Pj4gIDYzNiAg
ICAgICAgIHJldHVybiByY3VfbG9ja19jdXJyZW50X2RvbWFpbigpOwo+Pj4gIDYzNyAgICAgcmV0
dXJuIHJjdV9sb2NrX2RvbWFpbl9ieV9pZChkb20pOwo+Pj4gIDYzOCB9Cj4+Pgo+Pj4gYXMgbG9u
ZyBhcyBkb20gPT0gRE9NSURfU0VMRi4gSSB0aGluayB0aGUgb2xkIGJlaGF2aW91ciBhc3N1bWVk
IHRoYXQKPj4+IEhWTU9QX2FsdHAybV92Y3B1X2VuYWJsZV9ub3RpZnkgYWxvbmUgd291bGQgb25s
eSBldmVyIGJlIHVzZWQgZnJvbSB0aGUKPj4+IGN1cnJlbnQgZG9tYWluLCBhbmQgdGhpcyBjaGFu
Z2UgZXhwYW5kcyBpdHMgdXNhYmlsaXR5IChBZHJpYW4gc2hvdWxkCj4+PiBjb3JyZWN0IG1lIGlm
IEknbSB3cm9uZyBoZXJlKS4KPj4gCj4+IEJ1dCBhIGd1ZXN0IGV4cG9zZWQgaW50ZXJmYWNlIGNh
bid0IGJlIGNoYW5nZWQgbGlrZSB0aGlzOiBJZiBhLmRvbWFpbgo+PiB3YXMgaWdub3JlZCBmb3Ig
dGhpcyBzdWItb3AgYmVmb3JlLCBpdCBuZWVkcyB0byBjb250aW51ZSB0byBiZSBpZ25vcmVkLgo+
IAo+IEFsc28sIHRlY2huaWNhbGx5IHNwZWFraW5nIGEuZG9tYWluIGlzIG5vdCBjdXJyZW50bHkg
aWdub3JlZCAtIGl0J3MganVzdAo+IGNoZWNrZWQgYWdhaW5zdCBET01JRF9TRUxGOgo+IAo+IDQ1
OTYgICAgIGNhc2UgSFZNT1BfYWx0cDJtX3ZjcHVfZW5hYmxlX25vdGlmeToKPiA0NTk3ICAgICB7
Cj4gNDU5OCAgICAgICAgIHN0cnVjdCB2Y3B1ICpjdXJyID0gY3VycmVudDsKPiA0NTk5ICAgICAg
ICAgcDJtX3R5cGVfdCBwMm10Owo+IDQ2MDAKPiA0NjAxICAgICAgICAgaWYgKCBhLnUuZW5hYmxl
X25vdGlmeS5wYWQgfHwgYS5kb21haW4gIT0gRE9NSURfU0VMRiB8fAo+IDQ2MDIgICAgICAgICAg
ICAgIGEudS5lbmFibGVfbm90aWZ5LnZjcHVfaWQgIT0gY3Vyci0+dmNwdV9pZCApCj4gNDYwMyAg
ICAgICAgIHsKPiA0NjA0ICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPiA0NjA1ICAgICAgICAg
ICAgIGJyZWFrOwo+IDQ2MDYgICAgICAgICB9CgpBaCwgeWVzLCBJIHRoaW5rIHRoYXQncyBmaW5l
IHRoZW4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
