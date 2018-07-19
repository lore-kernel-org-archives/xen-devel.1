From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 03/16] x86/HVM: switch
 virtual_intr_delivery_enabled() hook to simple boolean
Date: Thu, 19 Jul 2018 01:56:29 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19126FCDB@SHSMSX101.ccr.corp.intel.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B46052502000078001D3255@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vdwy=kd=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1ffyBS-0002ve-4j
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 01:56:46 +0000
In-Reply-To: <5B46052502000078001D3255@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFdl
ZG5lc2RheSwgSnVseSAxMSwgMjAxOCA5OjI1IFBNCj4gCj4gRnJvbTogU3VyYXZlZSBTdXRoaWt1
bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KPiAKPiBUaGlzIHBhdGNoIG1v
ZGlmaWVzIHRoZSBodm1fZnVuY3MudmlydHVhbF9pbnRyX2RlbGl2ZXJ5X2VuYWJsZWQoKQo+IHRv
IGJlY29tZSBhIGJvb2wgdmFyaWFibGUgYXMgVk1YIGRvZXMgYW5kIFNWTSB3aWxsIHNpbXBseSBy
ZXR1cm4gYQo+IHN0YXRpYyB2YWx1ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdXJhdmVlIFN1dGhp
a3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBFeHRyYWN0ZWQgZnJvbSBh
biBTVk0vQVZJQyBzZXJpZXMgcGF0Y2guCj4gCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bGFw
aWMuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmxhcGljLmMKPiBAQCAtMTI1OCwxNCArMTI1
OCw2IEBAIHZvaWQgdmxhcGljX2FkanVzdF9pODI1OV90YXJnZXQoc3RydWN0IGQKPiAgICAgIHB0
X2FkanVzdF9nbG9iYWxfdmNwdV90YXJnZXQodik7Cj4gIH0KPiAKPiAtaW50IHZsYXBpY192aXJ0
dWFsX2ludHJfZGVsaXZlcnlfZW5hYmxlZCh2b2lkKQo+IC17Cj4gLSAgICBpZiAoIGh2bV9mdW5j
cy52aXJ0dWFsX2ludHJfZGVsaXZlcnlfZW5hYmxlZCApCj4gLSAgICAgICAgcmV0dXJuIGh2bV9m
dW5jcy52aXJ0dWFsX2ludHJfZGVsaXZlcnlfZW5hYmxlZCgpOwo+IC0gICAgZWxzZQo+IC0gICAg
ICAgIHJldHVybiAwOwo+IC19Cj4gLQo+ICBpbnQgdmxhcGljX2hhc19wZW5kaW5nX2lycShzdHJ1
Y3QgdmNwdSAqdikKPiAgewo+ICAgICAgc3RydWN0IHZsYXBpYyAqdmxhcGljID0gdmNwdV92bGFw
aWModik7Cj4gQEAgLTEyNzgsNyArMTI3MCw3IEBAIGludCB2bGFwaWNfaGFzX3BlbmRpbmdfaXJx
KHN0cnVjdCB2Y3B1ICoKPiAgICAgIGlmICggaXJyID09IC0xICkKPiAgICAgICAgICByZXR1cm4g
LTE7Cj4gCj4gLSAgICBpZiAoIHZsYXBpY192aXJ0dWFsX2ludHJfZGVsaXZlcnlfZW5hYmxlZCgp
ICYmCj4gKyAgICBpZiAoIGh2bV9mdW5jcy52aXJ0dWFsX2ludHJfZGVsaXZlcnlfZW5hYmxlZCAm
Jgo+ICAgICAgICAgICAhbmVzdGVkaHZtX3ZjcHVfaW5fZ3Vlc3Rtb2RlKHYpICkKPiAgICAgICAg
ICByZXR1cm4gaXJyOwo+IAoKYWJvdmUgaXMgYW5vdGhlciBmdW5jdGlvbmFsIGNoYW5nZS4gQ2Fu
IHlvdSBleHBsYWluIGFuZCBpZiBtYWtpbmcgc2Vuc2UKdGhlbiBwdXQgdGhlIGZpeCBpbiBzZXBh
cmF0ZSBwYXRjaD8KClRoYW5rcwpLZXZpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
