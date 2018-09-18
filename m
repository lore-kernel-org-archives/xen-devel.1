From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 5/7] memory: add
 check_get_page_from_gfn() as a wrapper...
Date: Tue, 18 Sep 2018 07:16:39 -0600
Message-ID: <5BA0FAB702000078001E9779@prv1-mh.provo.novell.com>
References: <20180913152128.6114-1-paul.durrant@citrix.com>
 <20180913152128.6114-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xuki=ma=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2Frx-0000p7-Qy
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 13:16:45 +0000
In-Reply-To: <20180913152128.6114-6-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDE3OjIxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmgKPiArKysgYi94ZW4vaW5jbHVkZS9h
c20tYXJtL3AybS5oCj4gQEAgLTMwMyw2ICszMDMsMTAgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3Qg
cGFnZV9pbmZvICpnZXRfcGFnZV9mcm9tX2dmbigKPiAgICAgIHJldHVybiBwYWdlOwo+ICB9Cj4g
IAo+ICtpbnQgX19tdXN0X2NoZWNrIGNoZWNrX2dldF9wYWdlX2Zyb21fZ2ZuKHN0cnVjdCBkb21h
aW4gKmQsIGdmbl90IGdmbiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBib29sIHJlYWRvbmx5LCBwMm1fdHlwZV90ICpwMm10X3AsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqKnBhZ2VfcCk7Cj4g
Kwo+ICBpbnQgZ2V0X3BhZ2VfdHlwZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLCB1bnNpZ25lZCBs
b25nIHR5cGUpOwo+ICBib29sIGlzX2lvbWVtX3BhZ2UobWZuX3QgbWZuKTsKPiAgc3RhdGljIGlu
bGluZSBpbnQgZ2V0X3BhZ2VfYW5kX3R5cGUoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwKPiAtLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9w
Mm0uaAo+IEBAIC00OTIsNiArNDkyLDkgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFnZV9pbmZv
ICpnZXRfcGFnZV9mcm9tX2dmbigKPiAgICAgIHJldHVybiBtZm5fdmFsaWQoX21mbihnZm4pKSAm
JiBnZXRfcGFnZShwYWdlLCBkKSA/IHBhZ2UgOiBOVUxMOwo+ICB9Cj4gIAo+ICtpbnQgX19tdXN0
X2NoZWNrIGNoZWNrX2dldF9wYWdlX2Zyb21fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdm
biwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHJlYWRv
bmx5LCBwMm1fdHlwZV90ICpwMm10X3AsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqKnBhZ2VfcCk7Cj4gIAo+ICAvKiBHZW5lcmFs
IGNvbnZlcnNpb24gZnVuY3Rpb24gZnJvbSBtZm4gdG8gZ2ZuICovCj4gIHN0YXRpYyBpbmxpbmUg
dW5zaWduZWQgbG9uZyBtZm5fdG9fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIG1mbl90IG1mbikKCldo
eSB0d2ljZSB0aGUgc2FtZSBkZWNsYXJhdGlvbj8gQ2FuJ3QgdGhpcyBiZSBwdXQgaW4geGVuL3Ay
bS1jb21tb24uaD8KT3Igc29tZSBvdGhlciBzdWl0YWJsZSBjb21tb24gaGVhZGVyPyBXaXRoIHRo
YXQKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
