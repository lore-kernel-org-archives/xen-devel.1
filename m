From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] drm: Replace NULL with error value in
 drm_prime_pages_to_sg
Date: Mon, 18 Jun 2018 15:29:51 +0300
Message-ID: <20180618122951.v55dxtjg4azezjvg__2805.33890841088$1529324955$gmane$org@mwanda>
References: <20180618060709.14290-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sxa4=je=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1fUtIX-0008Bn-Rf
 for xen-devel@lists.xenproject.org; Mon, 18 Jun 2018 12:30:17 +0000
Content-Disposition: inline
In-Reply-To: <20180618060709.14290-1-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, airlied@linux.ie, gustavo@padovan.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, seanpaul@chromium.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMTgsIDIwMTggYXQgMDk6MDc6MDlBTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYyAg
ICB8IDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jIHwgMiAr
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jCj4gaW5kZXggODBhNTExNWMzODQ2Li5j
ZTg2OGNlMjg4ZmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hl
bHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jCj4gQEAg
LTQzNiw3ICs0MzYsNyBAQCBzdHJ1Y3Qgc2dfdGFibGUgKmRybV9nZW1fY21hX3ByaW1lX2dldF9z
Z190YWJsZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiAgCj4gIAlzZ3QgPSBremFsbG9j
KHNpemVvZigqc2d0KSwgR0ZQX0tFUk5FTCk7Cj4gIAlpZiAoIXNndCkKPiAtCQlyZXR1cm4gTlVM
TDsKPiArCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPiAgCj4gIAlyZXQgPSBkbWFfZ2V0X3Nn
dGFibGUob2JqLT5kZXYtPmRldiwgc2d0LCBjbWFfb2JqLT52YWRkciwKPiAgCQkJICAgICAgY21h
X29iai0+cGFkZHIsIG9iai0+c2l6ZSk7CgoKSWYgZG1hX2dldF9zZ3RhYmxlKCkgZmFpbHMgdGhl
biB3ZSByZXR1cm4gTlVMTC4KCkZpeCB0aGF0IGFuZCBpdCBzaG91bGQgYmUgZ29vZC4KCnJlZ2Fy
ZHMsCmRhbiBjYXJwZW50ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
