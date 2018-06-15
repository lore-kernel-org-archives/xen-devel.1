From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH] drm/xen-front: Replace NULL with error value in
 xen_drm_front_gem_get_sg_table
Date: Fri, 15 Jun 2018 12:54:09 +0300
Message-ID: <20180615095409.5685-1-andr2000__5515.76490183852$1529056395$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=egn1=jb=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fTlR0-0006iH-Dn
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 09:54:22 +0000
Received: by mail-lf0-x244.google.com with SMTP id q11-v6so13758028lfc.7
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jun 2018 02:54:20 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel.vetter@intel.com, seanpaul@chromium.org, gustavo@padovan.org, jgross@suse.com, boris.ostrovsky@oracle.com, dan.carpenter@oracle.com
Cc: andr2000@gmail.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKRGFuIENhcnBlbnRlciBoYXMgcmVwb3J0ZWQgdGhhdCB0aGVyZSBpcyB0aGUgZm9s
bG93aW5nIHN0YXRpYyBjaGVja2VyCndhcm5pbmc6Cglkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1l
LmM6MzE3IGRybV9nZW1fbWFwX2RtYV9idWYoKQoJd2FybjogJ3NndCcgY2FuIGFsc28gYmUgTlVM
TAoKMzE0CXNndCA9IG9iai0+ZGV2LT5kcml2ZXItPmdlbV9wcmltZV9nZXRfc2dfdGFibGUob2Jq
KTsKMzE1CjMxNglpZiAoIUlTX0VSUihzZ3QpKSB7CjMxNwkJaWYgKCFkbWFfbWFwX3NnX2F0dHJz
KGF0dGFjaC0+ZGV2LCBzZ3QtPnNnbCwgc2d0LT5uZW50cywgZGlyLAoKQW5kIG9uZSBvZiB0aGUg
cHJvYmxlbWF0aWMgZnVuY3Rpb25zIGlzIHhlbl9kcm1fZnJvbnRfZ2VtX2dldF9zZ190YWJsZS4K
Rml4IHRoaXMgYnkgcmVwbGFjaW5nIE5VTEwgd2l0aCBlcnJvciB2YWx1ZS4KClNpZ25lZC1vZmYt
Ynk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFt
LmNvbT4KUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmMgYi9kcml2ZXJzL2dwdS9k
cm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmMKaW5kZXggYzg1YmZlNzU3MWNiLi40N2ZmMDE5ZDNh
ZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmMKQEAgLTE3OSw3ICsx
NzksNyBAQCBzdHJ1Y3Qgc2dfdGFibGUgKnhlbl9kcm1fZnJvbnRfZ2VtX2dldF9zZ190YWJsZShz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbV9vYmopCiAJc3RydWN0IHhlbl9nZW1fb2JqZWN0ICp4
ZW5fb2JqID0gdG9feGVuX2dlbV9vYmooZ2VtX29iaik7CiAKIAlpZiAoIXhlbl9vYmotPnBhZ2Vz
KQotCQlyZXR1cm4gTlVMTDsKKwkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CiAKIAlyZXR1cm4g
ZHJtX3ByaW1lX3BhZ2VzX3RvX3NnKHhlbl9vYmotPnBhZ2VzLCB4ZW5fb2JqLT5udW1fcGFnZXMp
OwogfQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
