From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 4/8] xen: Remove useless casts
Date: Wed,  4 Jul 2018 12:39:15 -0300
Message-ID: <20180704153919.12432-5-f4bug@amsat.org>
References: <20180704153919.12432-1-f4bug@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qusl=ju=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1fajt0-0001jQ-8p
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 15:40:06 +0000
Received: by mail-qk0-x22b.google.com with SMTP id o2-v6so3039666qkc.13
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jul 2018 08:40:05 -0700 (PDT)
In-Reply-To: <20180704153919.12432-1-f4bug@amsat.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Laurent Vivier <laurent@vivier.eu>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-devel@nongnu.org
List-Id: xen-devel@lists.xenproject.org

UGF0Y2ggY3JlYXRlZCBtZWNoYW5pY2FsbHkgYnkgcmVydW5uaW5nOgoKICAkICBzcGF0Y2ggLS1z
cC1maWxlIHNjcmlwdHMvY29jY2luZWxsZS90eXBlY2FzdC5jb2NjaSBcCiAgICAgICAgICAgIC0t
bWFjcm8tZmlsZSBzY3JpcHRzL2NvY2NpLW1hY3JvLWZpbGUuaCBcCiAgICAgICAgICAgIC0tZGly
IC4gLS1pbi1wbGFjZQoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0
YnVnQGFtc2F0Lm9yZz4KLS0tCiBody94ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9ody94ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMgYi9ody94ZW4veGVuX3B0X2NvbmZpZ19pbml0
LmMKaW5kZXggYWVlMzFjNjJiYi4uNTVhODMzMzNmMiAxMDA2NDQKLS0tIGEvaHcveGVuL3hlbl9w
dF9jb25maWdfaW5pdC5jCisrKyBiL2h3L3hlbi94ZW5fcHRfY29uZmlnX2luaXQuYwpAQCAtNTQz
LDcgKzU0Myw3IEBAIHN0YXRpYyBpbnQgeGVuX3B0X2V4cF9yb21fYmFyX3JlZ193cml0ZShYZW5Q
Q0lQYXNzdGhyb3VnaFN0YXRlICpzLAogewogICAgIFhlblBUUmVnSW5mbyAqcmVnID0gY2ZnX2Vu
dHJ5LT5yZWc7CiAgICAgWGVuUFRSZWdpb24gKmJhc2UgPSBOVUxMOwotICAgIFBDSURldmljZSAq
ZCA9IChQQ0lEZXZpY2UgKikmcy0+ZGV2OworICAgIFBDSURldmljZSAqZCA9ICZzLT5kZXY7CiAg
ICAgdWludDMyX3Qgd3JpdGFibGVfbWFzayA9IDA7CiAgICAgdWludDMyX3QgdGhyb3VnaGFibGVf
bWFzayA9IGdldF90aHJvdWdoYWJsZV9tYXNrKHMsIHJlZywgdmFsaWRfbWFzayk7CiAgICAgcGNp
YnVzX3Qgcl9zaXplID0gMDsKLS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
