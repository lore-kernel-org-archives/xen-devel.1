From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 03/16] x86/HVM: switch
 virtual_intr_delivery_enabled() hook to simple boolean
Date: Thu, 19 Jul 2018 00:15:44 -0600
Message-ID: <5B502C9002000078001D5AB4@prv1-mh.provo.novell.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B46052502000078001D3255@prv1-mh.provo.novell.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19126FCDB@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hpq6=kd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fg2E7-0006NX-V4
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 06:15:47 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19126FCDB@SHSMSX101.ccr.corp.intel.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA3LjE4IGF0IDAzOjU2LCA8a2V2aW4udGlhbkBpbnRlbC5jb20+IHdyb3RlOgo+
PiAgRnJvbTogSmFuIEJldWxpY2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDog
V2VkbmVzZGF5LCBKdWx5IDExLCAyMDE4IDk6MjUgUE0KPj4gCj4+IEZyb206IFN1cmF2ZWUgU3V0
aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+Cj4+IAo+PiBUaGlzIHBh
dGNoIG1vZGlmaWVzIHRoZSBodm1fZnVuY3MudmlydHVhbF9pbnRyX2RlbGl2ZXJ5X2VuYWJsZWQo
KQo+PiB0byBiZWNvbWUgYSBib29sIHZhcmlhYmxlIGFzIFZNWCBkb2VzIGFuZCBTVk0gd2lsbCBz
aW1wbHkgcmV0dXJuIGEKPj4gc3RhdGljIHZhbHVlLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogU3Vy
YXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KPj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiAtLS0KPj4gRXh0
cmFjdGVkIGZyb20gYW4gU1ZNL0FWSUMgc2VyaWVzIHBhdGNoLgo+PiAKPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS92bGFwaWMuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZsYXBpYy5jCj4+
IEBAIC0xMjU4LDE0ICsxMjU4LDYgQEAgdm9pZCB2bGFwaWNfYWRqdXN0X2k4MjU5X3RhcmdldChz
dHJ1Y3QgZAo+PiAgICAgIHB0X2FkanVzdF9nbG9iYWxfdmNwdV90YXJnZXQodik7Cj4+ICB9Cj4+
IAo+PiAtaW50IHZsYXBpY192aXJ0dWFsX2ludHJfZGVsaXZlcnlfZW5hYmxlZCh2b2lkKQo+PiAt
ewo+PiAtICAgIGlmICggaHZtX2Z1bmNzLnZpcnR1YWxfaW50cl9kZWxpdmVyeV9lbmFibGVkICkK
Pj4gLSAgICAgICAgcmV0dXJuIGh2bV9mdW5jcy52aXJ0dWFsX2ludHJfZGVsaXZlcnlfZW5hYmxl
ZCgpOwo+PiAtICAgIGVsc2UKPj4gLSAgICAgICAgcmV0dXJuIDA7Cj4+IC19Cj4+IC0KPj4gIGlu
dCB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKHN0cnVjdCB2Y3B1ICp2KQo+PiAgewo+PiAgICAgIHN0
cnVjdCB2bGFwaWMgKnZsYXBpYyA9IHZjcHVfdmxhcGljKHYpOwo+PiBAQCAtMTI3OCw3ICsxMjcw
LDcgQEAgaW50IHZsYXBpY19oYXNfcGVuZGluZ19pcnEoc3RydWN0IHZjcHUgKgo+PiAgICAgIGlm
ICggaXJyID09IC0xICkKPj4gICAgICAgICAgcmV0dXJuIC0xOwo+PiAKPj4gLSAgICBpZiAoIHZs
YXBpY192aXJ0dWFsX2ludHJfZGVsaXZlcnlfZW5hYmxlZCgpICYmCj4+ICsgICAgaWYgKCBodm1f
ZnVuY3MudmlydHVhbF9pbnRyX2RlbGl2ZXJ5X2VuYWJsZWQgJiYKPj4gICAgICAgICAgICFuZXN0
ZWRodm1fdmNwdV9pbl9ndWVzdG1vZGUodikgKQo+PiAgICAgICAgICByZXR1cm4gaXJyOwo+PiAK
PiAKPiBhYm92ZSBpcyBhbm90aGVyIGZ1bmN0aW9uYWwgY2hhbmdlLiBDYW4geW91IGV4cGxhaW4g
YW5kIGlmIG1ha2luZyBzZW5zZQo+IHRoZW4gcHV0IHRoZSBmaXggaW4gc2VwYXJhdGUgcGF0Y2g/
CgpJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZDogV2hhdCBmdW5jdGlvbmFsIGNoYW5nZT8g
QWxsIHRoZSBwYXRjaApkb2VzIGlzIGNoYW5nZSBmcm9tIGEgaG9vayBiYXNlZCBhcHByb2FjaCB0
byBhIGZsYWcgYmFzZWQgb25lLCBhcwpzYWlkIGluIHRoZSBkZXNjcmlwdGlvbi4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
