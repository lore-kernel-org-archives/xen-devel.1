From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 7/8] x86/mm: handle foreign mappings in
 p2m_entry_modify
Date: Thu, 07 Feb 2019 09:59:53 -0700
Message-ID: <5C5C64090200007800214C87@prv1-mh.provo.novell.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-8-roger.pau@citrix.com>
 <5C5B127202000078002146B6@prv1-mh.provo.novell.com>
 <20190207165311.p27nl5fj3dka4s7b@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grn1p-0001XF-Ei
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 16:59:57 +0000
In-Reply-To: <20190207165311.p27nl5fj3dka4s7b@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE5IGF0IDE3OjUzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgRmViIDA2LCAyMDE5IGF0IDA5OjU5OjMwQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMzAuMDEuMTkgYXQgMTE6MzYsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAo+PiA+ICsrKyBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKPj4gPiBAQCAtOTMzLDkgKzkzMywxMiBAQCBzdHJ1Y3Qg
aHZtX2lvcmVxX3NlcnZlciAqcDJtX2dldF9pb3JlcV9zZXJ2ZXIoc3RydWN0IGRvbWFpbiAqZCwK
Pj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCAqZmxhZ3MpOwo+PiA+ICAKPj4gPiAgc3RhdGljIGlubGluZSB2b2lkIHAybV9lbnRy
eV9tb2RpZnkoc3RydWN0IHAybV9kb21haW4gKnAybSwgcDJtX3R5cGVfdCBudCwKPj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVfdCBvdCwgdW5zaWduZWQg
aW50IGxldmVsKQo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1f
dHlwZV90IG90LCBtZm5fdCBuZm4sIG1mbl90IG9mbiwKPj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGxldmVsKQo+PiA+ICB7Cj4+ID4gLSAgICBp
ZiAoIGxldmVsICE9IDEgfHwgbnQgPT0gb3QgKQo+PiA+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAq
cGc7Cj4+ID4gKwo+PiA+ICsgICAgaWYgKCBsZXZlbCAhPSAxIHx8IChudCA9PSBvdCAmJiBtZm5f
ZXEobmZuLCBvZm4pKSApCj4+ID4gICAgICAgICAgcmV0dXJuOwo+PiA+ICAKPj4gPiAgICAgIHN3
aXRjaCAoIG50ICkKPj4gPiBAQCAtOTQ4LDYgKzk1MSwxNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
cDJtX2VudHJ5X21vZGlmeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBwMm1fdHlwZV90IG50LAo+
PiA+ICAgICAgICAgIHAybS0+aW9yZXEuZW50cnlfY291bnQrKzsKPj4gPiAgICAgICAgICBicmVh
azsKPj4gPiAgCj4+ID4gKyAgICBjYXNlIHAybV9tYXBfZm9yZWlnbjoKPj4gPiArICAgICAgICBw
ZyA9IG1mbl90b19wYWdlKG5mbik7Cj4+ID4gKwo+PiA+ICsgICAgICAgIGlmICggIXBnIHx8ICFw
YWdlX2dldF9vd25lcl9hbmRfcmVmZXJlbmNlKHBnKSApCj4+IAo+PiBtZm5fdG9fcGFnZSgpIGNh
bid0IHJldHVybiBOVUxMLCBjYW4gaXQ/IFlvdSBtYXkgd2FudCB0byBBU1NFUlQoKQo+PiBiZWZv
cmVoYW5kIHRoYXQgdGhlIE1GTiBpcyBub3QgSU5WQUxJRF9NRk4sIHRob3VnaC4KPiAKPiBJJ3Zl
IGFkZGVkIEFTU0VSVChtZm5fdmFsaWQobWZuKSkgYW5kIHRoZSBzYW1lIGJlbG93LiBJIHRoaW5r
IGl0J3MKPiBzYWZlciB0byB1c2UgbWZuX3ZhbGlkIHJhdGhlciB0aGF0IG9ubHkgY2hlY2tpbmcg
YWdhaW5zdCBJTlZBTElEX01GTS4KClRoYW5rcywgaW5kZWVkIEkgdG9vIGRpZCBjb25zaWRlciB0
aGlzIGFmdGVyd2FyZHMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
