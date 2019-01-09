From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] x86/p2m: fix
 p2m_finish_type_change()
Date: Wed, 09 Jan 2019 04:16:18 -0700
Message-ID: <5C35D802020000780020BC2B@prv1-mh.provo.novell.com>
References: <1547030466-3547-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7QHe=PR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ghBqT-0006pG-6n
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 11:16:25 +0000
In-Reply-To: <1547030466-3547-1-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAxLjE5IGF0IDExOjQxLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gZmluaXNoX3R5cGVfY2hhbmdlKCkgcmV0dXJucyBhIG5lZ2F0aXZlIGludCBvbiBlcnJv
ciwgYnV0IHRoZQo+IGN1cnJlbnQgY29kZSBjaGVja3MgaWYgKCAhcmMgKS4KCkZvciB0aGUgcHVy
cG9zZSBvZiBkZXRlcm1pbmluZyB0aGUgYmFja3BvcnRpbmcgc2NvcGUgKG5vbmUgaGVyZSkKaXQg
d291bGQgYmUgbmljZSBpZiBpbiBzdWNoIGEgY2FzZSB5b3UgY291bGQgcG9pbnQgb3V0IHRoZSBj
b21taXQKaW50cm9kdWNpbmcgdGhlIGJyZWFrYWdlLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0v
cDJtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBAQCAtMTE3Niw3ICsxMTc2LDcg
QEAgaW50IHAybV9maW5pc2hfdHlwZV9jaGFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwKPiAgCj4gICAg
ICByYyA9IGZpbmlzaF90eXBlX2NoYW5nZShob3N0cDJtLCBmaXJzdF9nZm4sIG1heF9ucik7Cj4g
IAo+IC0gICAgaWYgKCAhcmMgKQo+ICsgICAgaWYgKCByYyA8IDAgKQo+ICAgICAgICAgIGdvdG8g
b3V0Owo+ICAKPiAgI2lmZGVmIENPTkZJR19IVk0KPiBAQCAtMTE5MywxMyArMTE5MywxMyBAQCBp
bnQgcDJtX2ZpbmlzaF90eXBlX2NoYW5nZShzdHJ1Y3QgZG9tYWluICpkLAo+ICAgICAgICAgICAg
ICAgICAgcmMgPSBmaW5pc2hfdHlwZV9jaGFuZ2UoYWx0cDJtLCBmaXJzdF9nZm4sIG1heF9ucik7
Cj4gICAgICAgICAgICAgICAgICBwMm1fdW5sb2NrKGFsdHAybSk7Cj4gIAo+IC0gICAgICAgICAg
ICAgICAgaWYgKCAhcmMgKQo+ICsgICAgICAgICAgICAgICAgaWYgKCByYyA8IDAgKQo+ICAgICAg
ICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICAgICAgICAgICAgICB9Cj4gICAgICB9Cj4gICNl
bmRpZgoKTWF5IEkgYXNrIHRoYXQgeW91IGFsc28gZml4IHRoZSBvdGhlciByZXR1cm4gdmFsdWUg
aXNzdWUgaGVyZTogRWl0aGVyCndlIG1lYW4gdG8gaW5kaWNhdGUgdG8gdGhlIGNhbGxlciB0aGUg
MC8xIGRpc3RpbmN0aW9uIChpbiB3aGljaCBjYXNlCml0IHNob3VsZCBiZSBjb3JyZWN0LCBpLmUu
IGN1bXVsYXRpdmUgYWNyb3NzIGFsbCBmaW5pc2hfdHlwZV9jaGFuZ2UoKQpjYWxscyBtYWRlIGhl
cmUpLCB3aGljaCB3YXMgdGhlIGJlaGF2aW9yIGJlZm9yZSAwZmI0YjU4YzhiCigieDg2L2FsdHAy
bTogZml4IGRpc3BsYXkgZnJvemVuIHdoZW4gc3dpdGNoaW5nIHRvIGEgbmV3IHZpZXcgZWFybHki
KSwKb3Igd2UgbWVhbiB0byBzaWduYWwgc3VjY2VzcyB0byB0aGUgY2FsbGVyIG9ubHkgYnkgaGFu
ZGluZyBiYWNrIHplcm8uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
