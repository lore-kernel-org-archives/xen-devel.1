From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v21 1/2] common: add a new mappable resource
 type: XENMEM_resource_grant_table
Date: Wed, 08 Aug 2018 04:43:09 -0600
Message-ID: <5B6AC93D02000078001DBF4F@prv1-mh.provo.novell.com>
References: <20180808090032.2713-1-paul.durrant@citrix.com>
 <20180808090032.2713-2-paul.durrant@citrix.com>
 <5B6AC62F02000078001DBF2B@prv1-mh.provo.novell.com>
 <211629bf48134e848f3ea97b1fe5156b@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wdim=kx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fnLvu-00064x-0f
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 10:43:14 +0000
In-Reply-To: <211629bf48134e848f3ea97b1fe5156b@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA4LjE4IGF0IDEyOjM4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAwOCBBdWd1c3QgMjAxOCAxMTozMAo+PiAKPj4gPj4+IE9uIDA4LjA4LjE4IGF0IDExOjAwLCA8
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+IEBAIC0zODYwLDYgKzM4NjYsNDcg
QEAgaW50IG1lbV9zaGFyaW5nX2dyZWZfdG9fZ2ZuKHN0cnVjdAo+PiBncmFudF90YWJsZSAqZ3Qs
IGdyYW50X3JlZl90IHJlZiwKPj4gPiAgfQo+PiA+ICAjZW5kaWYKPj4gPgo+PiA+ICsvKiBjYWxs
ZXIgbXVzdCBob2xkIHdyaXRlIGxvY2sgKi8KPj4gPiArc3RhdGljIGludCBnbnR0YWJfZ2V0X3N0
YXR1c19mcmFtZV9tZm4oc3RydWN0IGRvbWFpbiAqZCwKPj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBpZHgsIG1mbl90ICptZm4pCj4+ID4g
K3sKPj4gPiArICAgIHN0cnVjdCBncmFudF90YWJsZSAqZ3QgPSBkLT5ncmFudF90YWJsZTsKPj4g
Cj4+IGNvbnN0Pwo+PiAKPiAKPiBJSVJDIHRoYXQgZGlkbid0IHdvcmsgYmVjYXVzZSBnbnR0YWJf
Z3Jvd190YWJsZSgpIG1vZGlmaWVzIHRoZSBjb250ZW50LgoKQnV0IHlvdSBkb24ndCBwYXNzIGd0
IHRvIHRoZSBmdW5jdGlvbjoKCj4+ID4gKyAgICBBU1NFUlQoZ3QtPmd0X3ZlcnNpb24gPT0gMik7
Cj4+ID4gKwo+PiA+ICsgICAgaWYgKCBpZHggPj0gbnJfc3RhdHVzX2ZyYW1lcyhndCkgKQo+PiA+
ICsgICAgewo+PiA+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgbnIgPSBzdGF0dXNfdG9fZ3JhbnRf
ZnJhbWVzKGlkeCArIDEpOwo+PiA+ICsKPj4gPiArICAgICAgICBpZiAoIG5yIDw9IGd0LT5tYXhf
Z3JhbnRfZnJhbWVzICkKPj4gPiArICAgICAgICAgICAgZ250dGFiX2dyb3dfdGFibGUoZCwgbnIp
OwoKXl5eCgo+PiA+IEBAIC0zOTA2LDYgKzM5NDMsMzggQEAgaW50IGdudHRhYl9tYXBfZnJhbWUo
c3RydWN0IGRvbWFpbiAqZCwKPj4gdW5zaWduZWQgbG9uZyBpZHgsIGdmbl90IGdmbiwKPj4gPiAg
ICAgIHJldHVybiByYzsKPj4gPiAgfQo+PiA+Cj4+ID4gK2ludCBnbnR0YWJfZ2V0X3NoYXJlZF9m
cmFtZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGlkeCwKPj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG1mbl90ICptZm4pCj4+ID4gK3sKPj4gPiArICAgIHN0cnVjdCBn
cmFudF90YWJsZSAqZ3QgPSBkLT5ncmFudF90YWJsZTsKPj4gPiArICAgIGludCByYzsKPj4gPiAr
Cj4+ID4gKyAgICBncmFudF93cml0ZV9sb2NrKGd0KTsKPj4gPiArCj4+ID4gKyAgICBpZiAoIGd0
LT5ndF92ZXJzaW9uID09IDAgKQo+PiA+ICsgICAgICAgIGd0LT5ndF92ZXJzaW9uID0gMTsKPj4g
Cj4+IFNpbmNlIHlvdSd2ZSBtb3ZlZCB0aGlzIGhlcmUgaW5zdGVhZCBvZiBkcm9wcGluZyBpdCwg
d2hhdCByZXF1aXJlbWVudAo+PiBoYXZlIHlvdSBmb3VuZCBmb3IgdGhpcyB0byBiZSBzZXQgKG90
aGVyIHRoYW4gdGhlIEFTU0VSVCgpIHlvdSBwdXQgaW4KPj4gZ250dGFiX2dldF9zaGFyZWRfZnJh
bWVfbWZuKCk/Cj4+IAo+IAo+IFRoZSBjb2RlIGluIHBhdGNoICMyIGlzIGV4ZWN1dGVkIGJlZm9y
ZSB0aGUgZ3JhbnQgdGFibGUgdmVyc2lvbiBpcyBzZXQuIEkgCj4gY291bGQgYWx0ZXJuYXRpdmVs
eSBoYXZlIGxpYnhsIGV4cGxpY2l0bHkgc2V0IHRoZSB2ZXJzaW9uIHRvIDEgYmVmb3JlIHRyeWlu
ZyAKPiB0byBzZWVkIHRoZSB0YWJsZS4KCkJ1dCB0aGF0J3Mgbm90IG15IHBvaW50LiBXaGF0J3Mg
d3Jvbmcgd2l0aCBsZWF2aW5nIGl0IGF0IHplcm8/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
