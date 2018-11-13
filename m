From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 2/3] x86/HVM: make hvmemul_map_linear_addr()
 honor p2m_ioreq_server
Date: Tue, 13 Nov 2018 03:14:09 -0700
Message-ID: <5BEAA3F102000078001FB5D0@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k8x1=ny=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMVi0-0001f3-Ed
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:14:12 +0000
In-Reply-To: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V3JpdGUgYWNjZXNzZXMgdG8gcDJtX2lvcmVxX3NlcnZlciBwYWdlcyBzaG91bGQgZ2V0IHJlZGly
ZWN0ZWQgdG8gdGhlCmVtdWxhdG9yIGFsc28gd2hlbiB1c2luZyB0aGUgbWFwcGluZyBhcHByb2Fj
aC4gRXh0ZW5kIHRoZQpwMm1faXNfZGlzY2FyZF93cml0ZSgpIGNoZWNrIHRoZXJlLCBhbmQgcmVz
dHJpY3QgYm90aCB0byB0aGUgd3JpdGUKYWNjZXNzIGNhc2UgKHRoaXMgaXMganVzdCBhIGxhdGVu
dCBidWcgYXMgY3VycmVudGx5IHdlIGdvIHRoaXMgcm91dGUKb25seSBmb3Igd3JpdGUgYWNjZXNz
ZXMpLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0t
IGEveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVs
YXRlLmMKQEAgLTYxMywxMCArNjEzLDIxIEBAIHN0YXRpYyB2b2lkICpodm1lbXVsX21hcF9saW5l
YXJfYWRkcigKIAogICAgICAgICAqbWZuKysgPSBwYWdlX3RvX21mbihwYWdlKTsKIAotICAgICAg
ICBpZiAoIHAybV9pc19kaXNjYXJkX3dyaXRlKHAybXQpICkKKyAgICAgICAgaWYgKCBwZmVjICYg
UEZFQ193cml0ZV9hY2Nlc3MgKQogICAgICAgICB7Ci0gICAgICAgICAgICBlcnIgPSBFUlJfUFRS
KH5YODZFTVVMX09LQVkpOwotICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAgICAgICBpZiAo
IHAybV9pc19kaXNjYXJkX3dyaXRlKHAybXQpICkKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAg
ICAgICBlcnIgPSBFUlJfUFRSKH5YODZFTVVMX09LQVkpOworICAgICAgICAgICAgICAgIGdvdG8g
b3V0OworICAgICAgICAgICAgfQorCisgICAgICAgICAgICBpZiAoIHAybXQgPT0gcDJtX2lvcmVx
X3NlcnZlciApCisgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgZXJyID0gTlVMTDsKKyAg
ICAgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgICAgIH0KKworICAgICAgICAgICAgQVNT
RVJUKHAybXQgPT0gcDJtX3JhbV9sb2dkaXJ0eSB8fCAhcDJtX2lzX3JlYWRvbmx5KHAybXQpKTsK
ICAgICAgICAgfQogICAgIH0KIAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
