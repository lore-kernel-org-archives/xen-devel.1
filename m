From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 5/8] x86/iommu: switch the hwdom mapping
 function to use page_get_type
Date: Fri, 17 Aug 2018 04:59:21 -0600
Message-ID: <5B76AA8902000078001DF5EC@prv1-mh.provo.novell.com>
References: <20180814134336.75539-1-roger.pau@citrix.com>
 <20180814134336.75539-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfk=la=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqcTU-0000dL-Mo
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 10:59:24 +0000
In-Reply-To: <20180814134336.75539-6-roger.pau@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA4LjE4IGF0IDE1OjQzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jCj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKPiBAQCAtMTM0LDYgKzEzNCwzNyBAQCB2b2lk
IGFyY2hfaW9tbXVfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkKPiAgewo+ICB9Cj4g
IAo+ICtzdGF0aWMgYm9vbCBfX2h3ZG9tX2luaXQgaHdkb21faW9tbXVfbWFwKGNvbnN0IHN0cnVj
dCBkb21haW4gKmQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBwZm4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBtYXhfcGZuKQo+ICt7Cj4gKyAgICAvKgo+ICsgICAgICogU2V0
IHVwIDE6MSBtYXBwaW5nIGZvciBkb20wLiBEZWZhdWx0IHRvIGluY2x1ZGUgb25seSBjb252ZW50
aW9uYWwgUkFNCj4gKyAgICAgKiBhcmVhcyBhbmQgbGV0IFJNUlJzIGluY2x1ZGUgbmVlZGVkIHJl
c2VydmVkIHJlZ2lvbnMuIFdoZW4gc2V0LCB0aGUKPiArICAgICAqIGluY2x1c2l2ZSBtYXBwaW5n
IGFkZGl0aW9uYWxseSBtYXBzIGluIGV2ZXJ5IHBmbiB1cCB0byA0R0IgZXhjZXB0IHRob3NlCj4g
KyAgICAgKiB0aGF0IGZhbGwgaW4gdW51c2FibGUgcmFuZ2VzLgo+ICsgICAgICovCj4gKyAgICBp
ZiAoIChwZm4gPiBtYXhfcGZuICYmICFtZm5fdmFsaWQoX21mbihwZm4pKSkgfHwgeGVuX2luX3Jh
bmdlKHBmbikgKQo+ICsgICAgICAgIHJldHVybiBmYWxzZTsKPiArCj4gKyAgICBzd2l0Y2ggKCBw
YWdlX2dldF90eXBlKHBmbikgKQo+ICsgICAgewo+ICsgICAgY2FzZSBSQU1fVFlQRV9VTlVTQUJM
RToKPiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsgICAgY2FzZSBSQU1fVFlQRV9DT05W
RU5USU9OQUw6Cj4gKyAgICAgICAgaWYgKCBpb21tdV9od2RvbV9zdHJpY3QgKQo+ICsgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4gKyAgICAgICAgYnJlYWs7Cj4gKwo+ICsgICAgZGVmYXVsdDoK
PiArICAgICAgICBpZiAoICFpb21tdV9od2RvbV9pbmNsdXNpdmUgfHwgcGZuID4gbWF4X3BmbiAp
Cj4gKyAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArICAgIH0KCkFoLCBpbiBwYXRjaCA4IGl0
IGJlY29tZXMgY2xlYXIgd2h5IHlvdSB3YW50IGV4ZWN1dGlvbiB0byBmYWxsIG91dApvZiB0aGUg
c3dpdGNoKCkgaW4gdGhlICJ0cnVlIiBjYXNlLiBQbGVhc2UgZGlzcmVnYXJkIHRoZSByZXNwZWN0
aXZlCmVhcmxpZXIgY29tbWVudHMgdGhlbi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
