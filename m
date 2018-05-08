From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 3/3] drm/xen-front: Fix loop timeout
Date: Tue, 8 May 2018 12:37:52 +0300
Message-ID: <46af16e5-4b59-6071-9f78-95fd4d46f5ed__179.904656443064$1525772218$gmane$org@gmail.com>
References: <20180508092829.GC661@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180508092829.GC661@mwanda>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDgvMjAxOCAxMjoyOCBQTSwgRGFuIENhcnBlbnRlciB3cm90ZToKPiBJZiB0aGUgbG9v
cCB0aW1lcyBvdXQgdGhlbiB3ZSB3YW50IHRvIGV4aXQgd2l0aCAidG8iIHNldCB0byB6ZXJvLCBi
dXQgaW4KPiB0aGUgY3VycmVudCBjb2RlIGl0J3Mgc2V0IHRvIC0xLgo+Cj4gRml4ZXM6IGM1NzVi
N2VlYjg5ZiAoImRybS94ZW4tZnJvbnQ6IEFkZCBzdXBwb3J0IGZvciBYZW4gUFYgZGlzcGxheSBm
cm9udGVuZCIpCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBv
cmFjbGUuY29tPgpUaGFuayB5b3UsClJldmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5f
ZHJtX2Zyb250LmMKPiBpbmRleCAzNzhjYjdjZTBkYjUuLjMzNDVhYzcxYjM5MSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCj4gQEAgLTc3OCw3ICs3NzgsNyBAQCBzdGF0aWMg
aW50IHhlbl9kcnZfcmVtb3ZlKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpCj4gICAJICovCj4g
ICAJd2hpbGUgKCh4ZW5idXNfcmVhZF91bnNpZ25lZChmcm9udF9pbmZvLT54Yl9kZXYtPm90aGVy
ZW5kLCAic3RhdGUiLAo+ICAgCQkJCSAgICAgWGVuYnVzU3RhdGVVbmtub3duKSAhPSBYZW5idXNT
dGF0ZUluaXRXYWl0KSAmJgo+IC0JCQkJICAgICB0by0tKQo+ICsJCQkJICAgICAtLXRvKQo+ICAg
CQltc2xlZXAoMTApOwo+ICAgCj4gICAJaWYgKCF0bykgewo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
