From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 3/3] drm/xen-front: Fix loop timeout
Date: Tue, 8 May 2018 12:28:29 +0300
Message-ID: <20180508092829.GC661__902.420425745909$1525771710$gmane$org@mwanda>
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

SWYgdGhlIGxvb3AgdGltZXMgb3V0IHRoZW4gd2Ugd2FudCB0byBleGl0IHdpdGggInRvIiBzZXQg
dG8gemVybywgYnV0IGluCnRoZSBjdXJyZW50IGNvZGUgaXQncyBzZXQgdG8gLTEuCgpGaXhlczog
YzU3NWI3ZWViODlmICgiZHJtL3hlbi1mcm9udDogQWRkIHN1cHBvcnQgZm9yIFhlbiBQViBkaXNw
bGF5IGZyb250ZW5kIikKU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRl
ckBvcmFjbGUuY29tPgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9m
cm9udC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKaW5kZXggMzc4Y2I3
Y2UwZGI1Li4zMzQ1YWM3MWIzOTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVu
X2RybV9mcm9udC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCkBA
IC03NzgsNyArNzc4LDcgQEAgc3RhdGljIGludCB4ZW5fZHJ2X3JlbW92ZShzdHJ1Y3QgeGVuYnVz
X2RldmljZSAqZGV2KQogCSAqLwogCXdoaWxlICgoeGVuYnVzX3JlYWRfdW5zaWduZWQoZnJvbnRf
aW5mby0+eGJfZGV2LT5vdGhlcmVuZCwgInN0YXRlIiwKIAkJCQkgICAgIFhlbmJ1c1N0YXRlVW5r
bm93bikgIT0gWGVuYnVzU3RhdGVJbml0V2FpdCkgJiYKLQkJCQkgICAgIHRvLS0pCisJCQkJICAg
ICAtLXRvKQogCQltc2xlZXAoMTApOwogCiAJaWYgKCF0bykgewoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
