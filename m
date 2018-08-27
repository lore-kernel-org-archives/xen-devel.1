From: Adrian Pop <apop@bitdefender.com>
Subject: Re: [PATCH v3] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Mon, 27 Aug 2018 13:47:47 +0300
Message-ID: <20180827104747.GA7088@hel>
References: <20180725111601.22524-1-apop@bitdefender.com>
 <5B6049FA02000078001D967A@prv1-mh.provo.novell.com>
 <20180827093807.GA1307@hel>
 <5B83CB7402000078001E2169@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pdfo=lk=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fuF3m-0005DI-Re
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 10:47:50 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 9EF913011F2B
 for <xen-devel@lists.xenproject.org>; Mon, 27 Aug 2018 13:47:48 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 87D137FE6C
 for <xen-devel@lists.xenproject.org>; Mon, 27 Aug 2018 13:47:48 +0300 (EEST)
Content-Disposition: inline
In-Reply-To: <5B83CB7402000078001E2169@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMDM6NTk6MTZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI3LjA4LjE4IGF0IDExOjM4LCA8YXBvcEBiaXRkZWZlbmRlci5jb20+IHdy
b3RlOgo+ID4gT24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDU6Mzc6MzBBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDI1LjA3LjE4IGF0IDEzOjE2LCA8YXBvcEBiaXRkZWZl
bmRlci5jb20+IHdyb3RlOgo+ID4+ID4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1f
b3AuaAo+ID4+ID4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaAo+ID4+ID4g
QEAgLTIzNCw3ICsyMzQsNyBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fdmlldyB7Cj4gPj4gPiAg
dHlwZWRlZiBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fdmlldyB4ZW5faHZtX2FsdHAybV92aWV3X3Q7
Cj4gPj4gPiAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX2h2bV9hbHRwMm1fdmlld190KTsK
PiA+PiA+ICAKPiA+PiA+IC1zdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc2V0X21lbV9hY2Nlc3Mgewo+
ID4+ID4gK3N0cnVjdCB4ZW5faHZtX2FsdHAybV9tZW1fYWNjZXNzIHsKPiA+PiA+ICAgICAgLyog
dmlldyAqLwo+ID4+ID4gICAgICB1aW50MTZfdCB2aWV3Owo+ID4+ID4gICAgICAvKiBNZW1vcnkg
dHlwZSAqLwo+ID4+ID4gQEAgLTI0Myw4ICsyNDMsOCBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1f
c2V0X21lbV9hY2Nlc3Mgewo+ID4+ID4gICAgICAvKiBnZm4gKi8KPiA+PiA+ICAgICAgdWludDY0
X3QgZ2ZuOwo+ID4+ID4gIH07Cj4gPj4gPiAtdHlwZWRlZiBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1f
c2V0X21lbV9hY2Nlc3MgeGVuX2h2bV9hbHRwMm1fc2V0X21lbV9hY2Nlc3NfdDsKPiA+PiA+IC1E
RUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5faHZtX2FsdHAybV9zZXRfbWVtX2FjY2Vzc190KTsK
PiA+PiA+ICt0eXBlZGVmIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9tZW1fYWNjZXNzIHhlbl9odm1f
YWx0cDJtX21lbV9hY2Nlc3NfdDsKPiA+PiA+ICtERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5f
aHZtX2FsdHAybV9tZW1fYWNjZXNzX3QpOwo+ID4+ID4gIAo+ID4+ID4gIHN0cnVjdCB4ZW5faHZt
X2FsdHAybV9zZXRfbWVtX2FjY2Vzc19tdWx0aSB7Cj4gPj4gPiAgICAgIC8qIHZpZXcgKi8KPiA+
PiA+IEBAIC0yOTYsNiArMjk2LDggQEAgc3RydWN0IHhlbl9odm1fYWx0cDJtX29wIHsKPiA+PiA+
ICAjZGVmaW5lIEhWTU9QX2FsdHAybV9jaGFuZ2VfZ2ZuICAgICAgICAgICA4Cj4gPj4gPiAgLyog
U2V0IGFjY2VzcyBmb3IgYW4gYXJyYXkgb2YgcGFnZXMgKi8KPiA+PiA+ICAjZGVmaW5lIEhWTU9Q
X2FsdHAybV9zZXRfbWVtX2FjY2Vzc19tdWx0aSA5Cj4gPj4gPiArLyogR2V0IHRoZSBhY2Nlc3Mg
b2YgYSBwYWdlIG9mIG1lbW9yeSBmcm9tIGEgY2VydGFpbiB2aWV3ICovCj4gPj4gPiArI2RlZmlu
ZSBIVk1PUF9hbHRwMm1fZ2V0X21lbV9hY2Nlc3MgICAgICAgMTAKPiA+PiA+ICAgICAgZG9taWRf
dCBkb21haW47Cj4gPj4gPiAgICAgIHVpbnQxNl90IHBhZDE7Cj4gPj4gPiAgICAgIHVpbnQzMl90
IHBhZDI7Cj4gPj4gPiBAQCAtMzAzLDcgKzMwNSw3IEBAIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9v
cCB7Cj4gPj4gPiAgICAgICAgICBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fZG9tYWluX3N0YXRlICAg
ICAgICAgZG9tYWluX3N0YXRlOwo+ID4+ID4gICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJt
X3ZjcHVfZW5hYmxlX25vdGlmeSAgIGVuYWJsZV9ub3RpZnk7Cj4gPj4gPiAgICAgICAgICBzdHJ1
Y3QgeGVuX2h2bV9hbHRwMm1fdmlldyAgICAgICAgICAgICAgICAgdmlldzsKPiA+PiA+IC0gICAg
ICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zZXRfbWVtX2FjY2VzcyAgICAgICBzZXRfbWVtX2Fj
Y2VzczsKPiA+PiA+ICsgICAgICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9tZW1fYWNjZXNzICAg
ICAgICAgICBtZW1fYWNjZXNzOwo+ID4+ID4gICAgICAgICAgc3RydWN0IHhlbl9odm1fYWx0cDJt
X2NoYW5nZV9nZm4gICAgICAgICAgIGNoYW5nZV9nZm47Cj4gPj4gPiAgICAgICAgICBzdHJ1Y3Qg
eGVuX2h2bV9hbHRwMm1fc2V0X21lbV9hY2Nlc3NfbXVsdGkgc2V0X21lbV9hY2Nlc3NfbXVsdGk7
Cj4gPj4gPiAgICAgICAgICB1aW50OF90IHBhZFs2NF07Cj4gPj4gCj4gPj4gVGhpcyBiZWluZyBl
eHBvc2VkIHRvIGd1ZXN0cywgdGhlIGludGVyZmFjZSBoYXMgdG8gYmUgY29uc2lkZXJlZAo+ID4+
IHN0YWJsZSBpbW8sIGluIHdoaWNoIGNhc2UgeW91IGNhbid0IHJlbmFtZSB0aGluZ3MgbGlrZSB0
aGlzLiBZb3UnZAo+ID4+IG5lZWQgX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXyBkZXBlbmRlbnQg
bG9naWMgKGp1c3QgbGlrZSBpcyB0aGUKPiA+PiBjYXNlIGZ1cnRoZXIgdXAgaW4gdGhlIGZpbGUp
Lgo+ID4gCj4gPiBSaWdodC4gIFNvcnJ5IGFib3V0IHRoYXQuICBNYXliZSBqdXN0IGhhdmluZyBz
ZXBhcmF0ZSBzdHJ1Y3RzIGZvcgo+ID4gZ2V0L3NldCB3b3VsZCBiZSBjbGVhbmVyIGluIHRoaXMg
Y2FzZSwgZXZlbiB0aG91Z2ggdGhleSB3b3VsZCBiZQo+ID4gc2ltaWxhci4KPiAKPiBQZXJzb25h
bGx5IEknZCBwcmVmZXIgdG8gYXZvaWQgaGF2aW5nIHR3byBzdHJ1Y3R1cmVzIHdpdGggaWRlbnRp
Y2FsCj4gbGF5b3V0IGJ1dCBkaWZmZXJlbnQgdGFncy4gQnV0IGlmIG90aGVycyB0aGluayBkaWZm
ZXJlbnRseSwgSSdtIG5vdAo+IG1lYW5pbmcgdG8gc3RhbmQgaW4gdGhlIHdheS4KCk9rIHRoZW4u
ICBJIGhhdmUgbm8gc3Ryb25nIHByZWZlcmVuY2UgZWl0aGVyIHdheS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
