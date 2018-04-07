From: Paul Semel <semelpaul@gmail.com>
Subject: [XTF] [PATCH] lib.c: added unsigned 64bits division for
 32 bits arch
Date: Sat,  7 Apr 2018 19:07:19 +0200
Message-ID: <20180407170719.17377-1-semelpaul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q0iy=g4=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1f4qwh-0004zm-HB
 for xen-devel@lists.xenproject.org; Sat, 07 Apr 2018 16:44:07 +0000
Received: by mail-wm0-x241.google.com with SMTP id u189so8984957wmd.1
 for <xen-devel@lists.xenproject.org>; Sat, 07 Apr 2018 09:44:05 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Semel <semelpaul@gmail.com>, andrew.cooper3@citrix.com, wipawel@amazon.de
List-Id: xen-devel@lists.xenproject.org

dGhpcyBpcyBhIHNpbXBsZSBpbXBsZW1lbnRhdGlvbiBvZiB1bnNpZ25lZCA2NGJpdHMgZGl2aXNp
b25zCmZvciAzMiBiaXRzIGFyY2hzLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBTZW1lbCA8c2VtZWxw
YXVsQGdtYWlsLmNvbT4KLS0tCiBjb21tb24vbGliLmMgICAgICB8IDIxICsrKysrKysrKysrKysr
KysrKysrKwogaW5jbHVkZS94dGYvbGliLmggfCAgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9jb21tb24vbGliLmMgYi9jb21tb24vbGliLmMK
aW5kZXggYWNmNGRhMS4uMzZkNTYwMCAxMDA2NDQKLS0tIGEvY29tbW9uL2xpYi5jCisrKyBiL2Nv
bW1vbi9saWIuYwpAQCAtNjgsNiArNjgsMjcgQEAgaW50IHh0Zl9nZXRfZG9taWQodm9pZCkKICAg
ICByZXR1cm4gZG9taWQ7CiB9CiAKKyNpZiBkZWZpbmVkKF9faTM4Nl9fKQordWludDMyX3QgX191
ZGl2NjRfMzIodWludDY0X3QgKm4sIHVpbnQzMl90IGJhc2UpCit7CisgICAgdWludDMyX3QgcmVt
OworICAgIHVpbnQzMl90IGhpZ2ggPSAoKHVpbnQzMl90ICopbilbMV07CisKKyAgICAoKHVpbnQz
Ml90ICopbilbMV0gPSAwOworICAgIGlmIChoaWdoID49IGJhc2UpIHsKKyAgICAgICAgKCh1aW50
MzJfdCAqKW4pWzFdID0gaGlnaCAvIGJhc2U7CisgICAgICAgIGhpZ2ggJT0gYmFzZTsKKyAgICB9
CisKKyAgICBfX2FzbV9fKCJkaXZsICUyIgorICAgICAgICAgICAgOiAiPWEiKCgodWludDMyX3Qq
KW4pWzBdKSwgIj1kIihyZW0pCisgICAgICAgICAgICA6ICJybSIoYmFzZSksICIwIigoKHVpbnQz
Ml90KiluKVswXSksICIxIihoaWdoKSk7CisKKyAgICByZXR1cm4gcmVtOworfQorCisjZW5kaWYK
KwogLyoKICAqIExvY2FsIHZhcmlhYmxlczoKICAqIG1vZGU6IEMKZGlmZiAtLWdpdCBhL2luY2x1
ZGUveHRmL2xpYi5oIGIvaW5jbHVkZS94dGYvbGliLmgKaW5kZXggYWJmOGYyNS4uNDQ3OTI4NiAx
MDA2NDQKLS0tIGEvaW5jbHVkZS94dGYvbGliLmgKKysrIGIvaW5jbHVkZS94dGYvbGliLmgKQEAg
LTEwMSw2ICsxMDEsMTAgQEAgaW50IHh0Zl9wcm9iZV9zeXNjdGxfaW50ZXJmYWNlX3ZlcnNpb24o
dm9pZCk7CiAgKi8KIGludCB4dGZfZ2V0X2RvbWlkKHZvaWQpOwogCisjaWYgZGVmaW5lZChfX2kz
ODZfXykKK3VpbnQzMl90IF9fdWRpdjY0XzMyKHVpbnQ2NF90ICpuLCB1aW50MzJfdCBiYXNlKTsK
KyNlbmRpZgorCiAjZW5kaWYgLyogWFRGX0xJQl9IICovCiAKIC8qCi0tIAoyLjE2LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
