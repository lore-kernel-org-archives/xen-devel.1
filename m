From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v21 1/2] common: add a new mappable resource
 type: XENMEM_resource_grant_table
Date: Wed, 8 Aug 2018 14:17:49 +0100
Message-ID: <b50364a1-1063-496a-6513-0870d455e73a@citrix.com>
References: <20180808090032.2713-1-paul.durrant@citrix.com>
 <20180808090032.2713-2-paul.durrant@citrix.com>
 <5B6AC62F02000078001DBF2B@prv1-mh.provo.novell.com>
 <211629bf48134e848f3ea97b1fe5156b@AMSPEX02CL03.citrite.net>
 <5B6AC93D02000078001DBF4F@prv1-mh.provo.novell.com>
 <32be8df30741468585dd198fd11f2d19@AMSPEX02CL03.citrite.net>
 <f70524fa9bf44da5a5d7cb15b4a1c3a9@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rtkw=kx=citrix.com=prvs=751d397f3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fnOLY-00027x-O1
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 13:17:52 +0000
In-Reply-To: <f70524fa9bf44da5a5d7cb15b4a1c3a9@AMSPEX02CL03.citrite.net>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDgvMTggMTQ6MTUsIFBhdWwgRHVycmFudCB3cm90ZToKPj4KPj4+Pj4+IEBAIC0zOTA2
LDYgKzM5NDMsMzggQEAgaW50IGdudHRhYl9tYXBfZnJhbWUoc3RydWN0IGRvbWFpbiAqZCwKPj4+
Pj4gdW5zaWduZWQgbG9uZyBpZHgsIGdmbl90IGdmbiwKPj4+Pj4+ICAgICAgcmV0dXJuIHJjOwo+
Pj4+Pj4gIH0KPj4+Pj4+Cj4+Pj4+PiAraW50IGdudHRhYl9nZXRfc2hhcmVkX2ZyYW1lKHN0cnVj
dCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgaWR4LAo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtZm5fdCAqbWZuKQo+Pj4+Pj4gK3sKPj4+Pj4+ICsgICAgc3RydWN0IGdyYW50
X3RhYmxlICpndCA9IGQtPmdyYW50X3RhYmxlOwo+Pj4+Pj4gKyAgICBpbnQgcmM7Cj4+Pj4+PiAr
Cj4+Pj4+PiArICAgIGdyYW50X3dyaXRlX2xvY2soZ3QpOwo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgICBp
ZiAoIGd0LT5ndF92ZXJzaW9uID09IDAgKQo+Pj4+Pj4gKyAgICAgICAgZ3QtPmd0X3ZlcnNpb24g
PSAxOwo+Pj4+PiBTaW5jZSB5b3UndmUgbW92ZWQgdGhpcyBoZXJlIGluc3RlYWQgb2YgZHJvcHBp
bmcgaXQsIHdoYXQgcmVxdWlyZW1lbnQKPj4+Pj4gaGF2ZSB5b3UgZm91bmQgZm9yIHRoaXMgdG8g
YmUgc2V0IChvdGhlciB0aGFuIHRoZSBBU1NFUlQoKSB5b3UgcHV0IGluCj4+Pj4+IGdudHRhYl9n
ZXRfc2hhcmVkX2ZyYW1lX21mbigpPwo+Pj4+Pgo+Pj4+IFRoZSBjb2RlIGluIHBhdGNoICMyIGlz
IGV4ZWN1dGVkIGJlZm9yZSB0aGUgZ3JhbnQgdGFibGUgdmVyc2lvbiBpcyBzZXQuIEkKPj4+PiBj
b3VsZCBhbHRlcm5hdGl2ZWx5IGhhdmUgbGlieGwgZXhwbGljaXRseSBzZXQgdGhlIHZlcnNpb24g
dG8gMSBiZWZvcmUgdHJ5aW5nCj4+Pj4gdG8gc2VlZCB0aGUgdGFibGUuCj4+PiBCdXQgdGhhdCdz
IG5vdCBteSBwb2ludC4gV2hhdCdzIHdyb25nIHdpdGggbGVhdmluZyBpdCBhdCB6ZXJvPwo+Pj4K
Pj4gSSdtIG5vdCBwYXJ0aWN1bGFybHkgaGFwcHkgY2FsbGluZyBnbnR0YWJfZ3Jvd190YWJsZSgp
IHdpdGggdmVyc2lvbiBsZWZ0IGF0IDAKPj4gYnV0IEkgY2FuIHRyeSBpdCBhbmQgc2VlIGlmIGl0
IGJyZWFrcy4KPiBBY3R1YWxseSwgbm8uIFRoZXJlIGlzIG5vd2hlcmUgZWxzZSB0aGF0IGxlYXZl
cyBpdCBhdCAwIGFuZCBJIGZpbmQgdGhhdCBJIGNhbid0IHNldCB0aGUgdmVyc2lvbiBleHBsaWNp
dGx5IGZyb20gdGhlIHRvb2xzdGFjayBhcyBnbnR0YWJfc2V0X3ZlcnNpb24gZG9lc24ndCB0YWtl
IGEgZG9taWQgYXMgYSBwYXJhbWV0ZXIuIEknbGwgbGVhdmUgdGhlIHZlcnNpb24gc2V0dGluZyBh
cy1pcy4KClllYWggLSB0aGlzIGxvb2tzIGxpa2UgdGhlIGJlc3Qgb3B0aW9uIGZvciBub3csIGFu
ZCBJJ2xsIGZpeCB0aGUKZGVmYXVsdGluZy10by0xIGluIGR1ZSBjb3Vyc2UuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
