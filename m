From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11 v2] x86/EFI: further correct FPU
 state handling around runtime calls
Date: Mon, 25 Jun 2018 06:48:48 -0600
Message-ID: <5B30E4B002000078001CD85F@prv1-mh.provo.novell.com>
References: <5B30DD5A02000078001CD80E@prv1-mh.provo.novell.com>
 <077e5092a4a446b68cecebd6711a0697@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrz=jl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXQvP-0005E8-1b
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 12:48:55 +0000
In-Reply-To: <077e5092a4a446b68cecebd6711a0697@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA2LjE4IGF0IDE0OjI0LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAyNSBKdW5lIDIwMTggMTM6MTgKPj4gLS0tIGEveGVuL2FyY2gveDg2L2kzODcuYwo+PiArKysg
Yi94ZW4vYXJjaC94ODYvaTM4Ny5jCj4+IEBAIC0yMDYsMTEgKzIwNiwxMSBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgZnB1X2Z4c2F2ZShzdHJ1Y3QgdmNwCj4+ICAvKiAgICAgICBWQ1BVIEZQVSBGdW5j
dGlvbnMgICAgKi8KPj4gIC8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwo+PiAgLyog
UmVzdG9yZSBGUFUgc3RhdGUgd2hlbmV2ZXIgVkNQVSBpcyBzY2hkdWxlZCBpbi4gKi8KPj4gLXZv
aWQgdmNwdV9yZXN0b3JlX2ZwdV9lYWdlcihzdHJ1Y3QgdmNwdSAqdikKPj4gK3ZvaWQgdmNwdV9y
ZXN0b3JlX2ZwdV9ub25sYXp5KHN0cnVjdCB2Y3B1ICp2LCBib29sIG5lZWRfc3R0cykKPj4gIHsK
Pj4gICAgICAvKiBSZXN0b3JlIG5vbmxhenkgZXh0ZW5kZWQgc3RhdGUgKGkuZS4gcGFydHMgbm90
IHRyYWNrZWQgYnkgQ1IwLlRTKS4gKi8KPj4gICAgICBpZiAoICF2LT5hcmNoLmZ1bGx5X2VhZ2Vy
X2ZwdSAmJiAhdi0+YXJjaC5ub25sYXp5X3hzdGF0ZV91c2VkICkKPj4gLSAgICAgICAgcmV0dXJu
Owo+PiArICAgICAgICBnb3RvIG1heWJlX3N0dHM7Cj4gCj4gSXQncyByZWFsbHkganVzdCBhbiAn
b3V0JyBsYWJlbCAoQUZBSUNULCBzaW5jZSBuZWVkX3N0dHMgbmVlZHMgdG8gYmUgdHJ1ZSAKPiBm
b3IgdGhlcmUgdG8gYmUgYW55IG90aGVyIHNlbWFudGljKSBzbyBob3cgYWJvdXQganVzdCBjYWxs
aW5nIGl0IHRoYXQgcmF0aGVyIAo+IHRoYW4gJ21heWJlX3N0dHMnPwoKVG8gYmUgaG9uZXN0LCBJ
IGxpa2UgIm91dCIgbGVzcywgYXMgYmVpbmcgdG9vIGdlbmVyaWMgYSBuYW1lLiBOb3IgYW0gSQpj
b252aW5jZWQgdGhhdCwgZ29pbmcgZm9yd2FyZCAoYW5kIGxlYXZpbmcgYXNpZGUgdGhlIGZhY3Qg
dGhhdCB3ZSBtYXkKZGVjaWRlIHRvIGRyb3AgbGF6eSBtb2RlIGFsdG9nZXRoZXIpLCBhbGwgY29k
ZSBwYXRocyBuZWVkIHRvIHJlYWNoIHRoZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
