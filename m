From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/9] x86: enclose hypercall page
 initialisation code in CONFIG_{HVM, PV}
Date: Tue, 7 Aug 2018 17:21:13 +0100
Message-ID: <20180807162113.5unhxqy2jqswsaig@citrix.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <d801b0cb143980c7912f5188d0887321614bbd81.1533636027.git-series.wei.liu2@citrix.com>
 <5B6977FD02000078001DB7D7@prv1-mh.provo.novell.com>
 <20180807160807.kp327nlhtoomsuy7@citrix.com>
 <5B69C65C02000078001DBB11@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xdgf=kw=citrix.com=prvs=7503460ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fn4jY-0001zk-2M
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 16:21:20 +0000
Content-Disposition: inline
In-Reply-To: <5B69C65C02000078001DBB11@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMDcsIDIwMTggYXQgMTA6MTg6MzZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjA4LjE4IGF0IDE4OjA4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUdWUsIEF1ZyAwNywgMjAxOCBhdCAwNDo0NDoxM0FNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMDcuMDguMTggYXQgMTI6MDAsIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+
ID4+ID4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jCj4gPj4gPiBAQCAtMzUyLDEy
ICszNTIsMTkgQEAgdm9pZCBzdWJhcmNoX3BlcmNwdV90cmFwc19pbml0KHZvaWQpCj4gPj4gPiAg
dm9pZCBoeXBlcmNhbGxfcGFnZV9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4gKmQsIHZvaWQgKmh5
cGVyY2FsbF9wYWdlKQo+ID4+ID4gIHsKPiA+PiA+ICAgICAgbWVtc2V0KGh5cGVyY2FsbF9wYWdl
LCAweENDLCBQQUdFX1NJWkUpOwo+ID4+ID4gKyNpZiBDT05GSUdfSFZNCj4gPj4gPiAgICAgIGlm
ICggaXNfaHZtX2RvbWFpbihkKSApCj4gPj4gPiAgICAgICAgICBodm1faHlwZXJjYWxsX3BhZ2Vf
aW5pdGlhbGlzZShkLCBoeXBlcmNhbGxfcGFnZSk7Cj4gPj4gPiAtICAgIGVsc2UgaWYgKCAhaXNf
cHZfMzJiaXRfZG9tYWluKGQpICkKPiA+PiA+IC0gICAgICAgIGh5cGVyY2FsbF9wYWdlX2luaXRp
YWxpc2VfcmluZzNfa2VybmVsKGh5cGVyY2FsbF9wYWdlKTsKPiA+PiA+IC0gICAgZWxzZQo+ID4+
ID4gLSAgICAgICAgaHlwZXJjYWxsX3BhZ2VfaW5pdGlhbGlzZV9yaW5nMV9rZXJuZWwoaHlwZXJj
YWxsX3BhZ2UpOwo+ID4+ID4gKyNlbmRpZgo+ID4+ID4gKyNpZiBDT05GSUdfUFYKPiA+PiA+ICsg
ICAgaWYgKCBpc19wdl9kb21haW4oZCkgKQo+ID4+ID4gKyAgICB7Cj4gPj4gPiArICAgICAgICBp
ZiAoICFpc19wdl8zMmJpdF9kb21haW4oZCkgKQo+ID4+ID4gKyAgICAgICAgICAgIGh5cGVyY2Fs
bF9wYWdlX2luaXRpYWxpc2VfcmluZzNfa2VybmVsKGh5cGVyY2FsbF9wYWdlKTsKPiA+PiA+ICsg
ICAgICAgIGVsc2UKPiA+PiA+ICsgICAgICAgICAgICBoeXBlcmNhbGxfcGFnZV9pbml0aWFsaXNl
X3JpbmcxX2tlcm5lbChoeXBlcmNhbGxfcGFnZSk7Cj4gPj4gPiArICAgIH0KPiA+PiA+ICsjZW5k
aWYKPiA+PiA+ICB9Cj4gPj4gCj4gPj4gSSdtIG5vdCBjb252aW5jZWQ6IFRoaXMgaXMgdWdsaWVy
IHRvIHJlYWQsIGFuZCB0aGluZ3MgbGlrZSBpc19odm1fZG9tYWluKCkKPiA+PiBzaG91bGQgZXZh
bHVhdGUgdG8gY29uc3RhbnQgZmFsc2UgYW55d2F5IHdpdGhvdXQgdGhlIHJlc3BlY3RpdmUKPiA+
PiBDT05GSUdfKiBzZXR0aW5nIGVuYWJsZWQuCj4gPiAKPiA+IEkgdGFrZSBpdCB5b3UgYXJlIGFn
YWluc3QgYWRkaW5nIENPTkZJR18qIGhlcmU/Cj4gPiAKPiA+IFRoZSBhZGRpdGlvbiBvZiBpc19w
dl9kb21haW4gYnJhbmNoIGlzIHN0aWxsIG5lZWRlZCBiZWNhdXNlIGJvdGggc2V0cwo+ID4gbWln
aHQgZ2V0IGNvbXBpbGVkIG91dC4KPiAKPiBCdXQgdGhhdCBjYW4gYmUgZG9uZSBieSBtYWtpbmcg
dGhlIHNlcXVlbmNlCj4gCj4gCWlmICggaXNfaHZtXy4uLiApCj4gCWVsc2UgaWYgKCBpc19wdl8z
MmJpdF8uLi4gKQo+IAllbHNlIGlmICggaXNfcHZfLi4uICkKPiAKPiBJLmUuIGluIHBhcnRpY3Vs
YXIgd2l0aG91dCBhbnkgY2hhbmdlcyB0byB0aGUgbmVzdGluZy4KClllYWgsIHN1cmUuIEkganVz
dCB3YW50ZWQgdG8gbWFrZSBzdXJlIFBWIGlzIGV4cGxpY2l0bHkgdGVzdGVkLiBUaGUKYWJvdmUg
c3RydWN0dXJlIGlzIGZpbmUgYnkgbWUuCgpXZWkuCgo+IAo+IEphbgo+IAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
