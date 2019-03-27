From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 05/12] xen/arm64: bitops: Match the register
 size with the value size in flsl
Date: Wed, 27 Mar 2019 19:03:10 +0000
Message-ID: <2af3ed7f-00d4-2eb7-0dde-c9570578dd4e@citrix.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-6-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kI0R=R6=citrix.com=prvs=9824fb700=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9DpT-0004X9-3M
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 19:03:15 +0000
In-Reply-To: <20190327184531.30986-6-julien.grall@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDMvMjAxOSAxODo0NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENsYW5nIGlzIHBpY2tp
ZXIgdGhhbiBHQ0MgZm9yIHRoZSByZWdpc3RlciBzaXplIGluIGFzbSBzdGF0ZW1lbnQuIEl0IGV4
cGVjdHMKPiB0aGUgcmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUgc2l6ZS4KPgo+IFRo
ZSBpbnN0cnVjdGlvbiBjbHogaXMgZXhwZWN0aW5nIHRoZSB0d28gb3BlcmFuZHMgdG8gYmUgdGhl
IHNhbWUgc2l6ZQo+IChpLmUgMzItYml0IG9yIDY0LWJpdCkuIEFzIHRoZSBmbHNsIGZ1bmN0aW9u
IGlzIGRlYWxpbmcgd2l0aCA2NC1iaXQKPiB2YWx1ZSwgd2UgbmVlZCB0byBtYWtlIHRoZSBkZXN0
aW5hdGlvbiB2YXJpYWJsZSA2NC1iaXQgYXMgd2VsbC4KPgo+IFdoaWxlIGF0IGl0LCBhZGQgYSBu
ZXdsaW5lIGJlZm9yZSB0aGUgcmV0dXJuIHN0YXRlbWVudC4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0tCj4gIHhlbi9pbmNsdWRlL2Fz
bS1hcm0vYXJtNjQvYml0b3BzLmggfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFy
bS9hcm02NC9iaXRvcHMuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYml0b3BzLmgKPiBp
bmRleCA2YmYxOTIyNjgwLi4wNTA0NWYxMTA5IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vYXJtNjQvYml0b3BzLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2Jp
dG9wcy5oCj4gQEAgLTM0LDEyICszNCwxMyBAQCBzdGF0aWMgLypfXyovYWx3YXlzX2lubGluZSB1
bnNpZ25lZCBsb25nIF9fZmZzKHVuc2lnbmVkIGxvbmcgd29yZCkKPiAgCj4gIHN0YXRpYyBpbmxp
bmUgaW50IGZsc2wodW5zaWduZWQgbG9uZyB4KQo+ICB7Cj4gLSAgICAgICAgaW50IHJldDsKPiAr
ICAgICAgICB1aW50NjRfdCByZXQ7Cj4gIAo+ICAgICAgICAgIGlmIChfX2J1aWx0aW5fY29uc3Rh
bnRfcCh4KSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGdlbmVyaWNfZmxzbCh4KTsKPiAgCj4g
ICAgICAgICAgYXNtKCJjbHpcdCUwLCAlMSIgOiAiPXIiIChyZXQpIDogInIiICh4KSk7CgpBcyB4
IGlzIGZpeGVkIGJ5IHRoZSBBQkksIHJldCBzaG91bGQgYmUgdW5zaWduZWQgbG9uZyB0byBtYXRj
aCwgc3VyZWx5PwoKVGhpcyB3aWxsIGNvbXBpbGUgYXMgaXQgaXMgYXJtNjQgc3BlY2lmaWMsIGJ1
dCBpdCBsb29rcyBqdXN0IGFzIHdyb25nCihwZXIgdGhlIGNvbW1pdCBtZXNzYWdlKSBhcyB1c2lu
ZyBpbnQgaW4gdGhlIGZpcnN0IHBsYWNlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
