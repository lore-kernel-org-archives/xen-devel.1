From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/7] x86/xpti: don't flush TLB twice when
 switching to 64-bit pv context
Date: Thu, 22 Mar 2018 08:50:32 -0600
Message-ID: <5AB3D0C802000078001B52E0@prv-mh.provo.novell.com>
References: <20180321125129.28539-1-jgross@suse.com>
 <20180321125129.28539-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ez1Y4-0006uZ-ES
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 14:50:36 +0000
In-Reply-To: <20180321125129.28539-3-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAzLjE4IGF0IDEzOjUxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBXaGVu
IHN3aXRjaGluZyB0byBhIDY0LWJpdCBwdiBjb250ZXh0IHRoZSBUTEIgaXMgZmx1c2hlZCB0d2lj
ZSB0b2RheToKPiB0aGUgZmlyc3QgdGltZSB3aGVuIHN3aXRjaGluZyB0byB0aGUgbmV3IGFkZHJl
c3Mgc3BhY2UgaW4KPiB3cml0ZV9wdGJhc2UoKSwgdGhlIHNlY29uZCB0aW1lIHdoZW4gc3dpdGNo
aW5nIHRvIGd1ZXN0IG1vZGUgaW4KPiByZXN0b3JlX3RvX2d1ZXN0Lgo+IAo+IEF2b2lkIHRoZSBm
aXJzdCBUTEIgZmx1c2ggaW4gdGhhdCBjYXNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiBWMzoKPiAtIG9taXQgc2V0dGluZyByb290
X3BndF9jaGFuZ2VkIHRvIGZhbHNlIChKYW4gQmV1bGljaCkKPiAtLS0KPiAgeGVuL2FyY2gveDg2
L21tLmMgfCA5ICsrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2Fy
Y2gveDg2L21tLmMKPiBpbmRleCAzNTI2MDBhZDczLi44Yzk0NGIzM2M5IDEwMDY0NAo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAtMTIzLDYg
KzEyMyw3IEBACj4gICNpbmNsdWRlIDxhc20vaW9fYXBpYy5oPgo+ICAjaW5jbHVkZSA8YXNtL3Bj
aS5oPgo+ICAjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+Cj4gKyNpbmNsdWRlIDxhc20vcHJvY2Vzc29y
Lmg+Cj4gIAo+ICAjaW5jbHVkZSA8YXNtL2h2bS9ncmFudF90YWJsZS5oPgo+ICAjaW5jbHVkZSA8
YXNtL3B2L2dyYW50X3RhYmxlLmg+Cj4gQEAgLTUwNyw4ICs1MDgsMTQgQEAgdm9pZCBtYWtlX2Ny
MyhzdHJ1Y3QgdmNwdSAqdiwgbWZuX3QgbWZuKQo+ICB2b2lkIHdyaXRlX3B0YmFzZShzdHJ1Y3Qg
dmNwdSAqdikKPiAgewo+ICAgICAgaWYgKCB0aGlzX2NwdShyb290X3BndCkgJiYgaXNfcHZfdmNw
dSh2KSAmJiAhaXNfcHZfMzJiaXRfdmNwdSh2KSApCj4gKyAgICB7Cj4gICAgICAgICAgZ2V0X2Nw
dV9pbmZvKCktPnJvb3RfcGd0X2NoYW5nZWQgPSB0cnVlOwo+IC0gICAgd3JpdGVfY3IzKHYtPmFy
Y2guY3IzKTsKPiArICAgICAgICBhc20gdm9sYXRpbGUgKCAibW92ICUwLCAlJWNyMyIgOiA6ICJy
IiAodi0+YXJjaC5jcjMpIDogIm1lbW9yeSIgKTsKPiArICAgIH0KPiArICAgIGVsc2UKPiArICAg
IHsKPiArICAgICAgICB3cml0ZV9jcjModi0+YXJjaC5jcjMpOwo+ICsgICAgfQoKVW5uZWNlc3Nh
cnkgYnJhY2VzLiB3aXRoIHRoYXQKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KKFRoaXMgY291bGQgYmUgdGFrZW4gY2FyZSBvZiB3aGlsZSBjb21taXR0aW5nLCBi
dXQgdGhlIHBhdGNoCmRlcGVuZHMgb24gcGF0Y2ggMSBhbnl3YXksIHdoaWNoIG1heSBzZWUgZnVy
dGhlcgp0cmFuc2Zvcm1hdGlvbi4pCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
