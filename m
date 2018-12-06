From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 v2 14/17] xen/arm: domctl: Use
 typesafe gfn in XEN_DOMCTL_cacheflush
Date: Thu, 6 Dec 2018 15:13:00 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812061512150.18779@sstabellini-ThinkPad-X260>
References: <20181204202651.8836-1-julien.grall@arm.com>
 <20181204202651.8836-15-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ba80=OP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gV2pK-00046C-TF
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 23:13:02 +0000
In-Reply-To: <20181204202651.8836-15-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCA0IERlYyAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gVGhpcyB3aWxsIG1ha2Ug
Y2hhbmdlcyBpbiBhIGZvbGxvdy11cCBwYXRjaCBlYXNpZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICAgICBDaGFuZ2VzIGlu
IHYyOgo+ICAgICAgICAgLSBQYXRjaCBhZGRlZAo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vZG9tY3Rs
LmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21jdGwuYyBiL3hlbi9h
cmNoL2FybS9kb21jdGwuYwo+IGluZGV4IGMxMGY1NjhhYWQuLjIwNjkxNTI4YTYgMTAwNjQ0Cj4g
LS0tIGEveGVuL2FyY2gvYXJtL2RvbWN0bC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWN0bC5j
Cj4gQEAgLTUyLDE2ICs1MiwxNiBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKHN0cnVjdCB4ZW5fZG9t
Y3RsICpkb21jdGwsIHN0cnVjdCBkb21haW4gKmQsCj4gICAgICB7Cj4gICAgICBjYXNlIFhFTl9E
T01DVExfY2FjaGVmbHVzaDoKPiAgICAgIHsKPiAtICAgICAgICB1bnNpZ25lZCBsb25nIHMgPSBk
b21jdGwtPnUuY2FjaGVmbHVzaC5zdGFydF9wZm47Cj4gLSAgICAgICAgdW5zaWduZWQgbG9uZyBl
ID0gcyArIGRvbWN0bC0+dS5jYWNoZWZsdXNoLm5yX3BmbnM7Cj4gKyAgICAgICAgZ2ZuX3QgcyA9
IF9nZm4oZG9tY3RsLT51LmNhY2hlZmx1c2guc3RhcnRfcGZuKTsKPiArICAgICAgICBnZm5fdCBl
ID0gZ2ZuX2FkZChzLCBkb21jdGwtPnUuY2FjaGVmbHVzaC5ucl9wZm5zKTsKPiAgCj4gICAgICAg
ICAgaWYgKCBkb21jdGwtPnUuY2FjaGVmbHVzaC5ucl9wZm5zID4gKDFVPDxNQVhfT1JERVIpICkK
PiAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gIAo+IC0gICAgICAgIGlmICggZSA8IHMg
KQo+ICsgICAgICAgIGlmICggZ2ZuX3goZSkgPCBnZm5feChzKSApCj4gICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ICAKPiAtICAgICAgICByZXR1cm4gcDJtX2NhY2hlX2ZsdXNoX3Jhbmdl
KGQsIF9nZm4ocyksIF9nZm4oZSkpOwo+ICsgICAgICAgIHJldHVybiBwMm1fY2FjaGVfZmx1c2hf
cmFuZ2UoZCwgcywgZSk7Cj4gICAgICB9Cj4gICAgICBjYXNlIFhFTl9ET01DVExfYmluZF9wdF9p
cnE6Cj4gICAgICB7Cj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
