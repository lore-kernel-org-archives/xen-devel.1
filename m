From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/9] x86/hvm: put
 hvm_local_events_need_delivery into a header file
Date: Tue, 07 Aug 2018 10:21:50 -0600
Message-ID: <5B69C71E02000078001DBB23@prv1-mh.provo.novell.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <34323b84099c5626c7e06f4a0b6a2dde53a5071d.1533636027.git-series.wei.liu2@citrix.com>
 <5B69796D02000078001DB7F7@prv1-mh.provo.novell.com>
 <20180807161300.x2fwute5t2exr3vs@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hjto=kw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fn4k7-000231-Bn
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 16:21:55 +0000
In-Reply-To: <20180807161300.x2fwute5t2exr3vs@citrix.com>
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

Pj4+IE9uIDA3LjA4LjE4IGF0IDE4OjEzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBBdWcgMDcsIDIwMTggYXQgMDQ6NTA6MjFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNy4wOC4xOCBhdCAxMjowMCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IC0tLSAvZGV2L251bGwKPj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2
bS9ldmVudC5oCj4+ID4gQEAgLTAsMCArMSwxNCBAQAo+PiA+ICsjaWZuZGVmIEFTTV9IVk1fRVZF
TlRfSAo+PiA+ICsjZGVmaW5lIEFTTV9IVk1fRVZFTlRfSAo+PiA+ICsKPj4gPiArI2lmIENPTkZJ
R19IVk0KPj4gPiArCj4+ID4gK2ludCBodm1fbG9jYWxfZXZlbnRzX25lZWRfZGVsaXZlcnkoc3Ry
dWN0IHZjcHUgKnYpOwo+PiA+ICsKPj4gPiArI2Vsc2UKPj4gPiArCj4+ID4gK3N0YXRpYyBpbmxp
bmUgaW50IGh2bV9sb2NhbF9ldmVudHNfbmVlZF9kZWxpdmVyeShzdHJ1Y3QgdmNwdSAqdikgeyBy
ZXR1cm4gMDsgfQo+PiA+ICsKPj4gPiArI2VuZGlmCj4+ID4gKwo+PiA+ICsjZW5kaWYJLyogQVNN
X0hWTV9FVkVOVF9IICovCj4+IAo+PiBBcmUgeW91IGV4cGVjdGluZyBtb3JlIHN0dWZmIHRvIGdv
IGludG8gdGhpcyBoZWFkZXI/IElmIG5vdCwgSSBkb24ndAo+PiB0aGluayBhIHNlcGFyYXRlIGhl
YWRlciBpcyByZWFsbHkgd2FycmFudGVkIGhlcmUuCj4gCj4gTm90IGF0IHRoaXMgc3RhZ2UuIEkg
aGF2ZSBtb3N0bHkgYmVlbiB1c2luZyB0aGUgZm9sbG93aW5nIHN0cnVjdHVyZQo+IHdoaWxlIHRy
eWluZyB0byBzcGxpdCB0aGluZ3M6Cj4gCj4gICBhc20teDg2L1RISU5HLmgKPiAgIGFzbS14ODYv
aHZtL1RISU5HLmgKPiAgIGFzbS14ODYvcHYvVEhJTkcuaAo+IAo+IFRoZW4gVEhJTkcuaCBpbmNs
dWRlcyBib3RoIHB2IGFuZCBodm0gVEhJTkcuaCdzLiAgSXQgaXMganVzdCBtb3JlCj4gc3RydWN0
dXJhbCB0byBtZS4KPiAKPiBTaW5jZSB5b3Ugb2JqZWN0IGhlcmUsIEkgZ3Vlc3MgeW91IHdpbGwg
YmUgaGFwcHkgd2l0aCBtb3ZpbmcgdGhlIGNvbnRlbnQKPiBvZiB0aGlzIG5ldyBmaWxlIHRvIGFz
bS14ODYvZXZlbnQuaD8KClllcywgYnV0IHRoYXQncyB3aGVyZSBpdCBpcyBub3cuIEFuZCB0b2dl
dGhlciB3aXRoIHRoZSBxdWVzdGlvbgp3aGV0aGVyIGFuIGlubGluZSBzdHViIGlzIG5lZWRlZCBp
biB0aGUgZmlyc3QgcGxhY2UsIEkgd29uZGVyCndoZXRoZXIgYSBjaGFuZ2UgaXMgbmVjZXNzYXJ5
IGhlcmUgYXQgYWxsLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
