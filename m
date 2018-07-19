From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] drm/xen-front: Fix error code in
 xen_drm_front_gem_get_sg_table()
Date: Thu, 19 Jul 2018 11:11:33 +0300
Message-ID: <20180719081133.k7asay4fl2qhhpjf__29611.0489326113$1531987905$gmane$org@mwanda>
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

VGhlIHhlbl9kcm1fZnJvbnRfZ2VtX2dldF9zZ190YWJsZSgpIGZ1bmN0aW9uIGlzIHN1cHBvc2Vk
IHRvIHJldHVybgplcnJvciBwb2ludGVyLiAgVGhlIGN1cnJlbnQgY29kZSwgd291bGQgdHJpZ2dl
ciBhIE5VTEwgZGVyZWZlcmVuY2UgaW4KZHJtX2dlbV9tYXBfZG1hX2J1ZigpLgoKRml4ZXM6IGM1
NzViN2VlYjg5ZiAoImRybS94ZW4tZnJvbnQ6IEFkZCBzdXBwb3J0IGZvciBYZW4gUFYgZGlzcGxh
eSBmcm9udGVuZCIpClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJA
b3JhY2xlLmNvbT4KCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJv
bnRfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmMKaW5kZXgg
Yzg1YmZlNzU3MWNiLi40NTA3YmMwM2VkOGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZW4veGVuX2RybV9mcm9udF9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1f
ZnJvbnRfZ2VtLmMKQEAgLTE3OSw3ICsxNzksNyBAQCBzdHJ1Y3Qgc2dfdGFibGUgKnhlbl9kcm1f
ZnJvbnRfZ2VtX2dldF9zZ190YWJsZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbV9vYmopCiAJ
c3RydWN0IHhlbl9nZW1fb2JqZWN0ICp4ZW5fb2JqID0gdG9feGVuX2dlbV9vYmooZ2VtX29iaik7
CiAKIAlpZiAoIXhlbl9vYmotPnBhZ2VzKQotCQlyZXR1cm4gTlVMTDsKKwkJcmV0dXJuIEVSUl9Q
VFIoLUVJTlZBTCk7CiAKIAlyZXR1cm4gZHJtX3ByaW1lX3BhZ2VzX3RvX3NnKHhlbl9vYmotPnBh
Z2VzLCB4ZW5fb2JqLT5udW1fcGFnZXMpOwogfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
