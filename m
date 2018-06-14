From: Zhouyang Jia <jiazhouyang09@gmail.com>
Subject: [PATCH v2] xen: add error handling for xenbus_printf
Date: Fri, 15 Jun 2018 07:34:52 +0800
Message-ID: <1529019293-55493-1-git-send-email-jiazhouyang09__19117.3161766075$1529019228$gmane$org@gmail.com>
References: <1528775073-39322-1-git-send-email-jiazhouyang09@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2aoe=ja=gmail.com=jiazhouyang09@srs-us1.protection.inumbo.net>)
 id 1fTblj-0002Qf-Nu
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 23:35:07 +0000
Received: by mail-pg0-x242.google.com with SMTP id w12-v6so3605003pgc.6
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jun 2018 16:35:06 -0700 (PDT)
In-Reply-To: <1528775073-39322-1-git-send-email-jiazhouyang09@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Zhouyang Jia <jiazhouyang09@gmail.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

V2hlbiB4ZW5idXNfcHJpbnRmIGZhaWxzLCB0aGUgbGFjayBvZiBlcnJvci1oYW5kbGluZyBjb2Rl
IG1heQpjYXVzZSB1bmV4cGVjdGVkIHJlc3VsdHMuCgpUaGlzIHBhdGNoIGFkZHMgZXJyb3ItaGFu
ZGxpbmcgY29kZSBhZnRlciBjYWxsaW5nIHhlbmJ1c19wcmludGYuCgpTaWduZWQtb2ZmLWJ5OiBa
aG91eWFuZyBKaWEgPGppYXpob3V5YW5nMDlAZ21haWwuY29tPgotLS0KdjEtPnYyOgotIEFkZCBf
X2Z1bmNfXy4KLS0tCiBkcml2ZXJzL3hlbi9tYW5hZ2UuYyB8IDE4ICsrKysrKysrKysrKysrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy94ZW4vbWFuYWdlLmMgYi9kcml2ZXJzL3hlbi9tYW5hZ2UuYwppbmRl
eCA4ODM1MDY1Li5jOTNkOGVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9tYW5hZ2UuYworKysg
Yi9kcml2ZXJzL3hlbi9tYW5hZ2UuYwpAQCAtMjg5LDggKzI4OSwxNSBAQCBzdGF0aWMgdm9pZCBz
eXNycV9oYW5kbGVyKHN0cnVjdCB4ZW5idXNfd2F0Y2ggKndhdGNoLCBjb25zdCBjaGFyICpwYXRo
LAogCQlyZXR1cm47CiAJfQogCi0JaWYgKHN5c3JxX2tleSAhPSAnXDAnKQotCQl4ZW5idXNfcHJp
bnRmKHhidCwgImNvbnRyb2wiLCAic3lzcnEiLCAiJWMiLCAnXDAnKTsKKwlpZiAoc3lzcnFfa2V5
ICE9ICdcMCcpIHsKKwkJZXJyID0geGVuYnVzX3ByaW50Zih4YnQsICJjb250cm9sIiwgInN5c3Jx
IiwgIiVjIiwgJ1wwJyk7CisJCWlmIChlcnIpIHsKKwkJCXByX2VycigiJXM6IEVycm9yICVkIHdy
aXRpbmcgc3lzcnEgaW4gY29udHJvbC9zeXNycVxuIiwKKwkJCSAgICAgICBfX2Z1bmNfXywgZXJy
KTsKKwkJCXhlbmJ1c190cmFuc2FjdGlvbl9lbmQoeGJ0LCAxKTsKKwkJCXJldHVybjsKKwkJfQor
CX0KIAogCWVyciA9IHhlbmJ1c190cmFuc2FjdGlvbl9lbmQoeGJ0LCAwKTsKIAlpZiAoZXJyID09
IC1FQUdBSU4pCkBAIC0zNDIsNyArMzQ5LDEyIEBAIHN0YXRpYyBpbnQgc2V0dXBfc2h1dGRvd25f
d2F0Y2hlcih2b2lkKQogCQkJY29udGludWU7CiAJCXNucHJpbnRmKG5vZGUsIEZFQVRVUkVfUEFU
SF9TSVpFLCAiZmVhdHVyZS0lcyIsCiAJCQkgc2h1dGRvd25faGFuZGxlcnNbaWR4XS5jb21tYW5k
KTsKLQkJeGVuYnVzX3ByaW50ZihYQlRfTklMLCAiY29udHJvbCIsIG5vZGUsICIldSIsIDEpOwor
CQllcnIgPSB4ZW5idXNfcHJpbnRmKFhCVF9OSUwsICJjb250cm9sIiwgbm9kZSwgIiV1IiwgMSk7
CisJCWlmIChlcnIpIHsKKwkJCXByX2VycigiJXM6IEVycm9yICVkIHdyaXRpbmcgJXNcbiIsIF9f
ZnVuY19fLAorCQkJCWVyciwgbm9kZSk7CisJCQlyZXR1cm4gZXJyOworCQl9CiAJfQogCiAJcmV0
dXJuIDA7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
