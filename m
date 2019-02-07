From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 7/8] x86/mm: handle foreign mappings in
 p2m_entry_modify
Date: Thu, 7 Feb 2019 17:53:11 +0100
Message-ID: <20190207165311.p27nl5fj3dka4s7b@mac>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-8-roger.pau@citrix.com>
 <5C5B127202000078002146B6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9m6e=QO=citrix.com=prvs=934266883=roger.pau@srs-us1.protection.inumbo.net>)
 id 1grmvO-0000GU-JB
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 16:53:18 +0000
Content-Disposition: inline
In-Reply-To: <5C5B127202000078002146B6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMDYsIDIwMTkgYXQgMDk6NTk6MzBBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMwLjAxLjE5IGF0IDExOjM2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAo+ID4gKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9wMm0uaAo+ID4gQEAgLTkzMyw5ICs5MzMsMTIgQEAgc3RydWN0IGh2bV9p
b3JlcV9zZXJ2ZXIgKnAybV9nZXRfaW9yZXFfc2VydmVyKHN0cnVjdCBkb21haW4gKmQsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCAqZmxhZ3MpOwo+ID4gIAo+ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBwMm1fZW50cnlfbW9kaWZ5
KHN0cnVjdCBwMm1fZG9tYWluICpwMm0sIHAybV90eXBlX3QgbnQsCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVfdCBvdCwgdW5zaWduZWQgaW50IGxldmVs
KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3Qgb3Qs
IG1mbl90IG5mbiwgbWZuX3Qgb2ZuLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBsZXZlbCkKPiA+ICB7Cj4gPiAtICAgIGlmICggbGV2ZWwgIT0g
MSB8fCBudCA9PSBvdCApCj4gPiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnOwo+ID4gKwo+ID4g
KyAgICBpZiAoIGxldmVsICE9IDEgfHwgKG50ID09IG90ICYmIG1mbl9lcShuZm4sIG9mbikpICkK
PiA+ICAgICAgICAgIHJldHVybjsKPiA+ICAKPiA+ICAgICAgc3dpdGNoICggbnQgKQo+ID4gQEAg
LTk0OCw2ICs5NTEsMTcgQEAgc3RhdGljIGlubGluZSB2b2lkIHAybV9lbnRyeV9tb2RpZnkoc3Ry
dWN0IHAybV9kb21haW4gKnAybSwgcDJtX3R5cGVfdCBudCwKPiA+ICAgICAgICAgIHAybS0+aW9y
ZXEuZW50cnlfY291bnQrKzsKPiA+ICAgICAgICAgIGJyZWFrOwo+ID4gIAo+ID4gKyAgICBjYXNl
IHAybV9tYXBfZm9yZWlnbjoKPiA+ICsgICAgICAgIHBnID0gbWZuX3RvX3BhZ2UobmZuKTsKPiA+
ICsKPiA+ICsgICAgICAgIGlmICggIXBnIHx8ICFwYWdlX2dldF9vd25lcl9hbmRfcmVmZXJlbmNl
KHBnKSApCj4gCj4gbWZuX3RvX3BhZ2UoKSBjYW4ndCByZXR1cm4gTlVMTCwgY2FuIGl0PyBZb3Ug
bWF5IHdhbnQgdG8gQVNTRVJUKCkKPiBiZWZvcmVoYW5kIHRoYXQgdGhlIE1GTiBpcyBub3QgSU5W
QUxJRF9NRk4sIHRob3VnaC4KCkkndmUgYWRkZWQgQVNTRVJUKG1mbl92YWxpZChtZm4pKSBhbmQg
dGhlIHNhbWUgYmVsb3cuIEkgdGhpbmsgaXQncwpzYWZlciB0byB1c2UgbWZuX3ZhbGlkIHJhdGhl
ciB0aGF0IG9ubHkgY2hlY2tpbmcgYWdhaW5zdCBJTlZBTElEX01GTS4KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
