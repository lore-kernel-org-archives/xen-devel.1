From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] drm/xen-front: xen_drm_front_platform_info
	can be static
Date: Wed, 14 Mar 2018 08:09:32 +0800
Message-ID: <20180314000932.GA75578__21251.4109480709$1520986167$gmane$org@lkp-sb-ep06>
References: <1520958066-22875-2-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ozvj=ge=intel.com=fengguang.wu@srs-us1.protection.inumbo.net>)
 id 1evu05-0004rC-OH
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 00:10:37 +0000
Content-Disposition: inline
In-Reply-To: <1520958066-22875-2-git-send-email-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: jgross@suse.com, airlied@linux.ie, gustavo@padovan.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, andr2000@gmail.com, seanpaul@chromium.org, kbuild-all@01.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

CkZpeGVzOiBkYjgxMDg0ZjkwODQgKCJkcm0veGVuLWZyb250OiBBZGQgc3VwcG9ydCBmb3IgWGVu
IFBWIGRpc3BsYXkgZnJvbnRlbmQiKQpTaWduZWQtb2ZmLWJ5OiBGZW5nZ3VhbmcgV3UgPGZlbmdn
dWFuZy53dUBpbnRlbC5jb20+Ci0tLQogeGVuX2RybV9mcm9udC5jICAgICB8ICAgIDIgKy0KIHhl
bl9kcm1fZnJvbnRfZHJ2LmMgfCAgICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hl
bl9kcm1fZnJvbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCmluZGV4
IGRiYWJkZjkuLmY0MjFkMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2Ry
bV9mcm9udC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCkBAIC00
MTcsNyArNDE3LDcgQEAgc3RhdGljIGludCB4ZW5fZHJtX2Rydl9yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4geGVuX2RybV9mcm9udF9kcnZfcmVtb3ZlKHBkZXYp
OwogfQogCi1zdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2luZm8geGVuX2RybV9mcm9udF9wbGF0Zm9y
bV9pbmZvID0geworc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaW5mbyB4ZW5fZHJtX2Zy
b250X3BsYXRmb3JtX2luZm8gPSB7CiAJLm5hbWUgPSBYRU5ESVNQTF9EUklWRVJfTkFNRSwKIAku
aWQgPSAwLAogCS5udW1fcmVzID0gMCwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4v
eGVuX2RybV9mcm9udF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9k
cnYuYwppbmRleCAzZWRlZmEyLi4wNGVlMzg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGVuL3hlbl9kcm1fZnJvbnRfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJt
X2Zyb250X2Rydi5jCkBAIC0xMjIsNyArMTIyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2bV9v
cGVyYXRpb25zX3N0cnVjdCB4ZW5fZHJtX3ZtX29wcyA9IHsKIAkuY2xvc2UgICAgICAgICAgPSBk
cm1fZ2VtX3ZtX2Nsb3NlLAogfTsKIAotc3RydWN0IGRybV9kcml2ZXIgeGVuX2RybV9kcml2ZXIg
PSB7CitzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgeGVuX2RybV9kcml2ZXIgPSB7CiAJLmRyaXZl
cl9mZWF0dXJlcyAgICAgICAgICAgPSBEUklWRVJfR0VNIHwgRFJJVkVSX01PREVTRVQgfAogCQkJ
CSAgICAgRFJJVkVSX1BSSU1FIHwgRFJJVkVSX0FUT01JQywKIAkubGFzdGNsb3NlICAgICAgICAg
ICAgICAgICA9IGxhc3RjbG9zZSwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
