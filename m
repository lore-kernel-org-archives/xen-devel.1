From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 8/9] xen/gntdev: Implement dma-buf import
 functionality
Date: Mon, 4 Jun 2018 18:28:18 -0400
Message-ID: <7ef4f26e-4225-ea7e-8183-9a6c3fe69345__40801.2112639428$1528162789$gmane$org@oracle.com>
References: <20180601114132.22596-1-andr2000@gmail.com>
 <20180601114132.22596-9-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dmdg=ix=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fQ0xk-0004QV-WC
 for xen-devel@lists.xenproject.org; Tue, 05 Jun 2018 01:40:41 +0000
In-Reply-To: <20180601114132.22596-9-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDEvMjAxOCAwNzo0MSBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
IC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSAqLwo+ICAKPiArc3RhdGljIGludAo+ICtkbWFidWZfaW1wX2dyYW50X2Zv
cmVpZ25fYWNjZXNzKHN0cnVjdCBwYWdlICoqcGFnZXMsIHUzMiAqcmVmcywKPiArCQkJCWludCBj
b3VudCwgaW50IGRvbWlkKQo+ICt7Cj4gKwlncmFudF9yZWZfdCBwcml2X2dyZWZfaGVhZDsKPiAr
CWludCBpLCByZXQ7Cj4gKwo+ICsJcmV0ID0gZ250dGFiX2FsbG9jX2dyYW50X3JlZmVyZW5jZXMo
Y291bnQsICZwcml2X2dyZWZfaGVhZCk7Cj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCXByX2Vycigi
Q2Fubm90IGFsbG9jYXRlIGdyYW50IHJlZmVyZW5jZXMsIHJldCAlZFxuIiwgcmV0KTsKPiArCQly
ZXR1cm4gcmV0Owo+ICsJfQo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7Cj4g
KwkJaW50IGN1cl9yZWY7Cj4gKwo+ICsJCWN1cl9yZWYgPSBnbnR0YWJfY2xhaW1fZ3JhbnRfcmVm
ZXJlbmNlKCZwcml2X2dyZWZfaGVhZCk7Cj4gKwkJaWYgKGN1cl9yZWYgPCAwKSB7Cj4gKwkJCXJl
dCA9IGN1cl9yZWY7Cj4gKwkJCXByX2VycigiQ2Fubm90IGNsYWltIGdyYW50IHJlZmVyZW5jZSwg
cmV0ICVkXG4iLCByZXQpOwo+ICsJCQlnb3RvIG91dDsKPiArCQl9Cj4gKwo+ICsJCWdudHRhYl9n
cmFudF9mb3JlaWduX2FjY2Vzc19yZWYoY3VyX3JlZiwgZG9taWQsCj4gKwkJCQkJCXhlbl9wYWdl
X3RvX2dmbihwYWdlc1tpXSksIDApOwo+ICsJCXJlZnNbaV0gPSBjdXJfcmVmOwo+ICsJfQo+ICsK
PiArCXJldCA9IDA7CgpyZXR1cm4gMD8KCj4gKwo+ICtvdXQ6Cj4gKwlnbnR0YWJfZnJlZV9ncmFu
dF9yZWZlcmVuY2VzKHByaXZfZ3JlZl9oZWFkKTsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
