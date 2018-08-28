From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 15/23] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Tue, 28 Aug 2018 11:41:16 +0100
Message-ID: <20180828104116.txedtql4cvjnetrw@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <1f5209e13cb12be42209f977c97290dd4343d2a8.1535285866.git-series.wei.liu2@citrix.com>
 <5B84205B02000078001E2507@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fubR0-0001Bf-Vx
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 10:41:19 +0000
Content-Disposition: inline
In-Reply-To: <5B84205B02000078001E2507@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMTA6MDE6MzFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vTWFrZWZpbGUKPiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9NYWtlZmlsZQo+ID4gQEAgLTEsOSArMSwxMCBAQAo+ID4gIHN1YmRpci15ICs9IHNo
YWRvdwo+ID4gLXN1YmRpci15ICs9IGhhcAo+ID4gK3N1YmRpci0kKENPTkZJR19IVk0pICs9IGhh
cAo+ID4gIAo+ID4gIG9iai15ICs9IHBhZ2luZy5vCj4gPiAtb2JqLXkgKz0gcDJtLm8gcDJtLXB0
Lm8gcDJtLWVwdC5vIHAybS1wb2Qubwo+ID4gLW9iai15ICs9IGFsdHAybS5vCj4gPiArb2JqLXkg
Kz0gcDJtLm8gcDJtLXB0Lm8KPiA+ICtvYmotJChDT05GSUdfSFZNKSArPSBwMm0tZXB0Lm8gcDJt
LXBvZC5vCj4gPiArb2JqLSQoQ09ORklHX0hWTSkgKz0gYWx0cDJtLm8KPiA+ICBvYmoteSArPSBn
dWVzdF93YWxrXzIubwo+ID4gIG9iai15ICs9IGd1ZXN0X3dhbGtfMy5vCj4gPiAgb2JqLXkgKz0g
Z3Vlc3Rfd2Fsa180Lm8KPiAKPiBXb3VsZCB5b3UgbWluZCBvbmNlIGFnYWluIHNvcnRpbmcgdGhp
bmdzIGF0IHRoZSBzYW1lIHRpbWU/CgpTdXJlLgoKPiAKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS9wMm0uYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPiBAQCAtNTM1LDcgKzUz
NSw3IEBAIHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9tX2dmbigKPiA+ICBpbnQg
cDJtX3NldF9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBnZm5fdCBnZm4sIG1mbl90IG1m
biwKPiA+ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlciwgcDJtX3R5
cGVfdCBwMm10LCBwMm1fYWNjZXNzX3QgcDJtYSkKPiA+ICB7Cj4gPiAtICAgIHN0cnVjdCBkb21h
aW4gKmQgPSBwMm0tPmRvbWFpbjsKPiA+ICsgICAgc3RydWN0IGRvbWFpbiAqIF9fbWF5YmVfdW51
c2VkIGQgPSBwMm0tPmRvbWFpbjsKPiAKPiBJbnN0ZWFkIG9mIHRoaXMsIHdoeSBkb24ndCB5b3Ug
c2ltcGx5IGxhdGNoIGhhcF9lbmFibGVkKCkncyByZXR1cm4KPiB2YWx1ZSBpbnRvIGEgbG9jYWwg
Ym9vbCB2YXJpYWJsZT8gKE90aGVyd2lzZSBJIHdvdWxkIGFzayBmb3IgY29uc3QKPiB0byBiZSBh
ZGRlZCBoZXJlIGFzIHlvdSB0b3VjaCB0aGlzIGFueXdheS4pIEFkZGluZwo+IF9fbWF5YmVfdW51
c2VkIHNob3VsZCByZWFsbHkgYmUgYSBsYXN0IHJlc29ydCBvbmx5LgoKT0suIEkgd2lsbCBsYXRj
aCBpdHMgdmFsdWUuCgpXZWkuCgo+IAo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
