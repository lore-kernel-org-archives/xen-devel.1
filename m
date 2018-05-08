From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 1/3] drm/xen-front: checking for NULL instead of
 IS_ERR
Date: Tue, 8 May 2018 12:26:50 +0300
Message-ID: <20180508092650.GA661__22990.0763057687$1525771620$gmane$org@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

ZHJtX2Rldl9hbGxvYygpIHJldHVybnMgZXJyb3IgcG9pbnRlcnMsIGl0IG5ldmVyIHJldHVybnMg
TlVMTC4KCkZpeGVzOiBjNTc1YjdlZWI4OWYgKCJkcm0veGVuLWZyb250OiBBZGQgc3VwcG9ydCBm
b3IgWGVuIFBWIGRpc3BsYXkgZnJvbnRlbmQiKQpTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVy
IDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlbi94ZW5fZHJtX2Zyb250LmMgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQu
YwppbmRleCAxYjBlYTlhYzMzMGUuLjg2MTVlODUyMmM3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5f
ZHJtX2Zyb250LmMKQEAgLTU0Myw4ICs1NDMsOCBAQCBzdGF0aWMgaW50IHhlbl9kcm1fZHJ2X2lu
aXQoc3RydWN0IHhlbl9kcm1fZnJvbnRfaW5mbyAqZnJvbnRfaW5mbykKIAlmcm9udF9pbmZvLT5k
cm1faW5mbyA9IGRybV9pbmZvOwogCiAJZHJtX2RldiA9IGRybV9kZXZfYWxsb2MoJnhlbl9kcm1f
ZHJpdmVyLCBkZXYpOwotCWlmICghZHJtX2RldikgewotCQlyZXQgPSAtRU5PTUVNOworCWlmIChJ
U19FUlIoZHJtX2RldikpIHsKKwkJcmV0ID0gUFRSX0VSUihkcm1fZGV2KTsKIAkJZ290byBmYWls
OwogCX0KIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
