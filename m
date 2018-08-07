From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/9] x86: enclose hypercall page
 initialisation code in CONFIG_{HVM, PV}
Date: Tue, 07 Aug 2018 10:18:36 -0600
Message-ID: <5B69C65C02000078001DBB11@prv1-mh.provo.novell.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <d801b0cb143980c7912f5188d0887321614bbd81.1533636027.git-series.wei.liu2@citrix.com>
 <5B6977FD02000078001DB7D7@prv1-mh.provo.novell.com>
 <20180807160807.kp327nlhtoomsuy7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hjto=kw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fn4gz-0001Fb-PW
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 16:18:41 +0000
In-Reply-To: <20180807160807.kp327nlhtoomsuy7@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDE4OjA4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBBdWcgMDcsIDIwMTggYXQgMDQ6NDQ6MTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNy4wOC4xOCBhdCAxMjowMCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+PiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+PiA+IEBAIC0zNTIsMTIgKzM1MiwxOSBAQCB2b2lk
IHN1YmFyY2hfcGVyY3B1X3RyYXBzX2luaXQodm9pZCkKPj4gPiAgdm9pZCBoeXBlcmNhbGxfcGFn
ZV9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4gKmQsIHZvaWQgKmh5cGVyY2FsbF9wYWdlKQo+PiA+
ICB7Cj4+ID4gICAgICBtZW1zZXQoaHlwZXJjYWxsX3BhZ2UsIDB4Q0MsIFBBR0VfU0laRSk7Cj4+
ID4gKyNpZiBDT05GSUdfSFZNCj4+ID4gICAgICBpZiAoIGlzX2h2bV9kb21haW4oZCkgKQo+PiA+
ICAgICAgICAgIGh2bV9oeXBlcmNhbGxfcGFnZV9pbml0aWFsaXNlKGQsIGh5cGVyY2FsbF9wYWdl
KTsKPj4gPiAtICAgIGVsc2UgaWYgKCAhaXNfcHZfMzJiaXRfZG9tYWluKGQpICkKPj4gPiAtICAg
ICAgICBoeXBlcmNhbGxfcGFnZV9pbml0aWFsaXNlX3JpbmczX2tlcm5lbChoeXBlcmNhbGxfcGFn
ZSk7Cj4+ID4gLSAgICBlbHNlCj4+ID4gLSAgICAgICAgaHlwZXJjYWxsX3BhZ2VfaW5pdGlhbGlz
ZV9yaW5nMV9rZXJuZWwoaHlwZXJjYWxsX3BhZ2UpOwo+PiA+ICsjZW5kaWYKPj4gPiArI2lmIENP
TkZJR19QVgo+PiA+ICsgICAgaWYgKCBpc19wdl9kb21haW4oZCkgKQo+PiA+ICsgICAgewo+PiA+
ICsgICAgICAgIGlmICggIWlzX3B2XzMyYml0X2RvbWFpbihkKSApCj4+ID4gKyAgICAgICAgICAg
IGh5cGVyY2FsbF9wYWdlX2luaXRpYWxpc2VfcmluZzNfa2VybmVsKGh5cGVyY2FsbF9wYWdlKTsK
Pj4gPiArICAgICAgICBlbHNlCj4+ID4gKyAgICAgICAgICAgIGh5cGVyY2FsbF9wYWdlX2luaXRp
YWxpc2VfcmluZzFfa2VybmVsKGh5cGVyY2FsbF9wYWdlKTsKPj4gPiArICAgIH0KPj4gPiArI2Vu
ZGlmCj4+ID4gIH0KPj4gCj4+IEknbSBub3QgY29udmluY2VkOiBUaGlzIGlzIHVnbGllciB0byBy
ZWFkLCBhbmQgdGhpbmdzIGxpa2UgaXNfaHZtX2RvbWFpbigpCj4+IHNob3VsZCBldmFsdWF0ZSB0
byBjb25zdGFudCBmYWxzZSBhbnl3YXkgd2l0aG91dCB0aGUgcmVzcGVjdGl2ZQo+PiBDT05GSUdf
KiBzZXR0aW5nIGVuYWJsZWQuCj4gCj4gSSB0YWtlIGl0IHlvdSBhcmUgYWdhaW5zdCBhZGRpbmcg
Q09ORklHXyogaGVyZT8KPiAKPiBUaGUgYWRkaXRpb24gb2YgaXNfcHZfZG9tYWluIGJyYW5jaCBp
cyBzdGlsbCBuZWVkZWQgYmVjYXVzZSBib3RoIHNldHMKPiBtaWdodCBnZXQgY29tcGlsZWQgb3V0
LgoKQnV0IHRoYXQgY2FuIGJlIGRvbmUgYnkgbWFraW5nIHRoZSBzZXF1ZW5jZQoKCWlmICggaXNf
aHZtXy4uLiApCgllbHNlIGlmICggaXNfcHZfMzJiaXRfLi4uICkKCWVsc2UgaWYgKCBpc19wdl8u
Li4gKQoKSS5lLiBpbiBwYXJ0aWN1bGFyIHdpdGhvdXQgYW55IGNoYW5nZXMgdG8gdGhlIG5lc3Rp
bmcuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
