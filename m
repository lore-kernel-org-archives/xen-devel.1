From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] xen: Fix format string
Date: Wed, 16 Jan 2019 13:00:41 +0100
Message-ID: <20190116120041.17095-1-philmd__13358.4604519003$1547639976$gmane$org@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9Uzx=PY=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gjjsH-0005bC-HX
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 12:00:49 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
List-Id: xen-devel@lists.xenproject.org

VHJpdmlhbCBmb3JtYXQgc3RyaW5nIGZpeCB0byBzb2x2ZToKCiAgaHcvYmxvY2sveGVuLWJsb2Nr
LmM6IEluIGZ1bmN0aW9uICd4ZW5fYmxvY2tfcmVhbGl6ZSc6CiAgaHcvYmxvY2sveGVuLWJsb2Nr
LmM6MjE4OjUzOiBlcnJvcjogZm9ybWF0ICclbHUnIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSAn
bG9uZyB1bnNpZ25lZCBpbnQnLCBidXQgYXJndW1lbnQgNCBoYXMgdHlwZSAnaW50NjRfdCB7YWth
IGxvbmcgbG9uZyBpbnR9JyBbLVdlcnJvcj1mb3JtYXQ9XQogICAgICB4ZW5fZGV2aWNlX2JhY2tl
bmRfcHJpbnRmKHhlbmRldiwgInNlY3RvcnMiLCAiJWx1IiwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJsa19nZXRsZW5ndGgoY29uZi0+YmxrKSAvCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uZi0+bG9naWNhbF9ibG9ja19zaXplKTsKCmJsa19nZXRsZW5ndGgoKSBy
ZXR1cm5zIGFuIGludDY0X3QuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvYmxvY2sveGVuLWJsb2NrLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9ody9ibG9jay94ZW4tYmxvY2suYyBiL2h3L2Jsb2NrL3hlbi1ibG9jay5jCmluZGV4IGJlMjhi
NjM0NDIuLjNjZjIxNWI3MzAgMTAwNjQ0Ci0tLSBhL2h3L2Jsb2NrL3hlbi1ibG9jay5jCisrKyBi
L2h3L2Jsb2NrL3hlbi1ibG9jay5jCkBAIC0yMTUsNyArMjE1LDcgQEAgc3RhdGljIHZvaWQgeGVu
X2Jsb2NrX3JlYWxpemUoWGVuRGV2aWNlICp4ZW5kZXYsIEVycm9yICoqZXJycCkKIAogICAgIHhl
bl9kZXZpY2VfYmFja2VuZF9wcmludGYoeGVuZGV2LCAic2VjdG9yLXNpemUiLCAiJXUiLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZi0+bG9naWNhbF9ibG9ja19zaXplKTsKLSAg
ICB4ZW5fZGV2aWNlX2JhY2tlbmRfcHJpbnRmKHhlbmRldiwgInNlY3RvcnMiLCAiJWx1IiwKKyAg
ICB4ZW5fZGV2aWNlX2JhY2tlbmRfcHJpbnRmKHhlbmRldiwgInNlY3RvcnMiLCAiJWxsZCIsCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibGtfZ2V0bGVuZ3RoKGNvbmYtPmJsaykgLwog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uZi0+bG9naWNhbF9ibG9ja19zaXplKTsK
IAotLSAKMi4xNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
