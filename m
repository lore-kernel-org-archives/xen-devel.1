From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] drm/xen-front: Drop pointless static
 qualifier in fb_destroy()
Date: Sat, 26 Jan 2019 12:05:38 +0000
Message-ID: <1548504338-114487-1-git-send-email-yuehaibing__46315.1920515642$1548504095$gmane$org@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgaXMgbm8gbmVlZCB0byBoYXZlIHRoZSAnc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIn
IHZhcmlhYmxlCnN0YXRpYyBzaW5jZSBuZXcgdmFsdWUgYWx3YXlzIGJlIGFzc2lnbmVkIGJlZm9y
ZSB1c2UgaXQuCgpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jCmluZGV4IDg2MGRhMDUuLmMyOTU1ZDMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMKQEAgLTU0LDcgKzU0LDcgQEAgc3Rh
dGljIHZvaWQgZmJfZGVzdHJveShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYikKIAkgIGNvbnN0
IHN0cnVjdCBkcm1fbW9kZV9mYl9jbWQyICptb2RlX2NtZCkKIHsKIAlzdHJ1Y3QgeGVuX2RybV9m
cm9udF9kcm1faW5mbyAqZHJtX2luZm8gPSBkZXYtPmRldl9wcml2YXRlOwotCXN0YXRpYyBzdHJ1
Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYjsKKwlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYjsKIAlz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbV9vYmo7CiAJaW50IHJldDsKIAoKCgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
