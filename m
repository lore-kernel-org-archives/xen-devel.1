From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 5/9] x86/hvm: put
 hvm_local_events_need_delivery into a header file
Date: Tue, 7 Aug 2018 17:13:00 +0100
Message-ID: <20180807161300.x2fwute5t2exr3vs@citrix.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <34323b84099c5626c7e06f4a0b6a2dde53a5071d.1533636027.git-series.wei.liu2@citrix.com>
 <5B69796D02000078001DB7F7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xdgf=kw=citrix.com=prvs=7503460ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fn4bY-0000vA-RS
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 16:13:04 +0000
Content-Disposition: inline
In-Reply-To: <5B69796D02000078001DB7F7@prv1-mh.provo.novell.com>
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

T24gVHVlLCBBdWcgMDcsIDIwMTggYXQgMDQ6NTA6MjFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjA4LjE4IGF0IDEyOjAwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9l
dmVudC5oCj4gPiBAQCAtMCwwICsxLDE0IEBACj4gPiArI2lmbmRlZiBBU01fSFZNX0VWRU5UX0gK
PiA+ICsjZGVmaW5lIEFTTV9IVk1fRVZFTlRfSAo+ID4gKwo+ID4gKyNpZiBDT05GSUdfSFZNCj4g
PiArCj4gPiAraW50IGh2bV9sb2NhbF9ldmVudHNfbmVlZF9kZWxpdmVyeShzdHJ1Y3QgdmNwdSAq
dik7Cj4gPiArCj4gPiArI2Vsc2UKPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIGludCBodm1fbG9j
YWxfZXZlbnRzX25lZWRfZGVsaXZlcnkoc3RydWN0IHZjcHUgKnYpIHsgcmV0dXJuIDA7IH0KPiA+
ICsKPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICsjZW5kaWYJLyogQVNNX0hWTV9FVkVOVF9IICovCj4g
Cj4gQXJlIHlvdSBleHBlY3RpbmcgbW9yZSBzdHVmZiB0byBnbyBpbnRvIHRoaXMgaGVhZGVyPyBJ
ZiBub3QsIEkgZG9uJ3QKPiB0aGluayBhIHNlcGFyYXRlIGhlYWRlciBpcyByZWFsbHkgd2FycmFu
dGVkIGhlcmUuCgpOb3QgYXQgdGhpcyBzdGFnZS4gSSBoYXZlIG1vc3RseSBiZWVuIHVzaW5nIHRo
ZSBmb2xsb3dpbmcgc3RydWN0dXJlCndoaWxlIHRyeWluZyB0byBzcGxpdCB0aGluZ3M6CgogIGFz
bS14ODYvVEhJTkcuaAogIGFzbS14ODYvaHZtL1RISU5HLmgKICBhc20teDg2L3B2L1RISU5HLmgK
ClRoZW4gVEhJTkcuaCBpbmNsdWRlcyBib3RoIHB2IGFuZCBodm0gVEhJTkcuaCdzLiAgSXQgaXMg
anVzdCBtb3JlCnN0cnVjdHVyYWwgdG8gbWUuCgpTaW5jZSB5b3Ugb2JqZWN0IGhlcmUsIEkgZ3Vl
c3MgeW91IHdpbGwgYmUgaGFwcHkgd2l0aCBtb3ZpbmcgdGhlIGNvbnRlbnQKb2YgdGhpcyBuZXcg
ZmlsZSB0byBhc20teDg2L2V2ZW50Lmg/Cgo+IAo+IERpZCB5b3UgY29uc2lkZXIgdGFraW5nIHRo
ZSBvcHBvcnR1bml0eSBhbmQgc3dpdGNoaW5nIHRoZSBmdW5jdGlvbgo+IHRvIGhhdmUgYm9vbCBy
ZXR1cm4gdmFsdWUgYXQgdGhlIHNhbWUgdGltZT8gKFNlZWluZyB3aGV0aGVyIHRoZQo+IHBhcmFt
ZXRlciBjb3VsZCBhbHNvIGJlIGNvbnN0aWZpZWQgaXMgcHJvYmFibHkgbW9yZSBpbnZvbHZlZCBh
Cj4gdGFzaywgYW5kIGhlbmNlIG5vdCBzdWl0YWJsZSBoZXJlLikKPiAKClN3aXRjaGluZyB0byBi
b29sIC0tIHN1cmUuCgpXZWkuCgo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
