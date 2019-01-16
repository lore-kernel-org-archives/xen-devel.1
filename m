From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] hw/block/xen: use proper format string for
 printing sectors
Date: Wed, 16 Jan 2019 12:13:50 +0000
Message-ID: <20190116121350.23863-1-alex.bennee__19448.1201855981$1547640771$gmane$org@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Y6T=PY=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1gjk53-0006cq-AB
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 12:14:01 +0000
Received: by mail-wm1-x343.google.com with SMTP id p6so1741525wmc.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 04:13:59 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: peter.maydell@linaro.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:Block layer core" <qemu-block@nongnu.org>, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
List-Id: xen-devel@lists.xenproject.org

VGhlICVsdSBmb3JtYXQgc3RyaW5nIGlzIGRpZmZlcmVudCBkZXBlbmRpbmcgb24gdGhlIGhvc3Qg
YXJjaGl0ZWN0dXJlCndoaWNoIGNhdXNlcyBidWlsZHMgbGlrZSB0aGUgZGViaWFuLWFybWhmLWNy
b3NzIGJ1aWxkIHRvIGZhaWwuIFVzZSB0aGUKY29ycmVjdCBQUmk2NCBmb3JtYXQgc3RyaW5nLgoK
U2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgotLS0K
IGh3L2Jsb2NrL3hlbi1ibG9jay5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaHcvYmxvY2sveGVuLWJsb2NrLmMgYi9o
dy9ibG9jay94ZW4tYmxvY2suYwppbmRleCBiZTI4YjYzNDQyLi5hNjM2NDg3YjNlIDEwMDY0NAot
LS0gYS9ody9ibG9jay94ZW4tYmxvY2suYworKysgYi9ody9ibG9jay94ZW4tYmxvY2suYwpAQCAt
MjE1LDcgKzIxNSw3IEBAIHN0YXRpYyB2b2lkIHhlbl9ibG9ja19yZWFsaXplKFhlbkRldmljZSAq
eGVuZGV2LCBFcnJvciAqKmVycnApCiAKICAgICB4ZW5fZGV2aWNlX2JhY2tlbmRfcHJpbnRmKHhl
bmRldiwgInNlY3Rvci1zaXplIiwgIiV1IiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbmYtPmxvZ2ljYWxfYmxvY2tfc2l6ZSk7Ci0gICAgeGVuX2RldmljZV9iYWNrZW5kX3ByaW50
Zih4ZW5kZXYsICJzZWN0b3JzIiwgIiVsdSIsCisgICAgeGVuX2RldmljZV9iYWNrZW5kX3ByaW50
Zih4ZW5kZXYsICJzZWN0b3JzIiwgIiUiUFJJaTY0LAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYmxrX2dldGxlbmd0aChjb25mLT5ibGspIC8KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbmYtPmxvZ2ljYWxfYmxvY2tfc2l6ZSk7CiAKLS0gCjIuMTcuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
