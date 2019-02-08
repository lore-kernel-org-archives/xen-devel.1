From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 7/8] x86/mm: handle foreign mappings in
 p2m_entry_modify
Date: Fri, 8 Feb 2019 10:37:49 +0100
Message-ID: <20190208093749.txpnnqerogb7rsd6@mac>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-8-roger.pau@citrix.com>
 <781554d1-1133-e510-ee69-e18dff1f155c@citrix.com>
 <20190207175732.4qr56vhuwud6y4xt@mac>
 <88fed20f-b643-6ea1-3306-60fe1ed18314@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vjt5=QP=citrix.com=prvs=93599dd81=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gs2ba-0000gW-4g
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 09:37:54 +0000
Content-Disposition: inline
In-Reply-To: <88fed20f-b643-6ea1-3306-60fe1ed18314@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDcsIDIwMTkgYXQgMDY6MDU6MjRQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiAyLzcvMTkgNTo1NyBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgRmViIDA3LCAyMDE5IGF0IDA1OjQ5OjE2UE0gKzAwMDAsIEdlb3JnZSBEdW5sYXAgd3Jv
dGU6Cj4gPj4gT24gMS8zMC8xOSAxMDozNiBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4+
PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaCBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvcDJtLmgKPiA+Pj4gaW5kZXggODM0ZDQ5ZDJkNC4uMWNjOGFjYjNmZSAxMDA2NDQKPiA+
Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAo+ID4+PiArKysgYi94ZW4vaW5jbHVk
ZS9hc20teDg2L3AybS5oCj4gPj4+IEBAIC05MzMsOSArOTMzLDEyIEBAIHN0cnVjdCBodm1faW9y
ZXFfc2VydmVyICpwMm1fZ2V0X2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWluICpkLAo+ID4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCAqZmxhZ3MpOwo+ID4+PiAgCj4gPj4+ICBzdGF0aWMgaW5saW5lIHZvaWQgcDJtX2VudHJ5X21v
ZGlmeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBwMm1fdHlwZV90IG50LAo+ID4+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVfdCBvdCwgdW5zaWduZWQgaW50
IGxldmVsKQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3R5
cGVfdCBvdCwgbWZuX3QgbmZuLCBtZm5fdCBvZm4sCj4gPj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbGV2ZWwpCj4gPj4+ICB7Cj4gPj4+IC0gICAg
aWYgKCBsZXZlbCAhPSAxIHx8IG50ID09IG90ICkKPiA+Pj4gKyAgICBzdHJ1Y3QgcGFnZV9pbmZv
ICpwZzsKPiA+Pj4gKwo+ID4+PiArICAgIGlmICggbGV2ZWwgIT0gMSB8fCAobnQgPT0gb3QgJiYg
bWZuX2VxKG5mbiwgb2ZuKSkgKQo+ID4+PiAgICAgICAgICByZXR1cm47Cj4gPj4KPiA+PiBBcmUg
eW91IHN1cmUgdGhhdCBmb3JlaWduIG1hcHBpbmdzIChvciBpb3JlcSBzZXJ2ZXIgcGFnZXMsIGZv
ciB0aGF0Cj4gPj4gbWF0dGVyKSBjYW4gbmV2ZXIgYmUgbGV2ZWwgPiAxPwo+ID4gCj4gPiBOb3Qg
Z2l2ZW4gdGhlIGN1cnJlbnQgWGVuIGludGVyZmFjZSwgc2VlCj4gPiBYRU5NRU1fYWRkX3RvX3Bo
eXNtYXB7X2JhdGNofS4gVGhpcyB3aWxsIGhhdmUgdG8gY2hhbmdlIGlmIHRoZQo+ID4gaW50ZXJm
YWNlIGlzIGV4cGFuZGVkIHRvIGFsbG93IDJNIG9yIDFHIG1hcHBpbmdzLgo+IAo+IFJpZ2h0OyBi
dXQgdGhlIHF1ZXN0aW9uIHJlYWxseSBtZWFudCB0byBzYXk6IElmIHN1Y2ggYW4gaW50ZXJmYWNl
Cj4gZXhwYW5zaW9uIGhhcHBlbmVkLCBhcmUgeW91IHN1cmUgdGhlIHBlcnNvbiB3aG8gZGlkIGl0
IHdvdWxkIHJlbWVtYmVyIHRvCj4gaGFuZGxlIGxhcmdlciBwYWdlcyBkb3duIGhlcmU/CgpJJ3Zl
IGFkZGVkOgoKQlVHX09OKGxldmVsID4gMSAmJiAobnQgPT0gcDJtX2lvcmVxX3NlcnZlciB8fMKg
bnQgPT0gcDJtX21hcF9mb3JlaWduKSk7CgpBdCB0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbi4gVGhp
cyB3aWxsIGNhdGNoIGFueSBhdHRlbXB0IHRvIGFkZCBhbnkgb2YKc3VjaCBtYXBwaW5ncyB3aXRo
IGFuIG9yZGVyIGRpZmZlcmVudCB0aGFuIDRLLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
