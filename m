From: Julien Grall <julien.grall@linaro.org>
Subject: [PATCH] xen/arm: cpuerrata: Remove percpu.h include
Date: Mon, 22 Jan 2018 14:35:42 +0000
Message-ID: <20180122143542.1207-1-julien.grall@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=r/hy=er=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eddCU-000428-Nd
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 14:35:54 +0000
Received: by mail-wm0-x243.google.com with SMTP id t74so16825974wme.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2018 06:35:52 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Julien Grall <julien.grall@linaro.org>, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

VGhlIGluY2x1ZGUgcGVyY3B1Lmggd2FzIGFkZGVkIGJ5IG1pc3Rha2UgaW4gY3B1ZXJyYXRhLmgg
KHNlZSBjb21taXQKNGM0ZmRkYzE2NiAieGVuL2FybTY0OiBBZGQgc2tlbGV0b24gdG8gaGFyZGVu
IHRoZSBicmFuY2ggYWxpYXNpbmcKYXR0YWNrcyIpLiBTbyByZW1vdmUgaXQuCgpTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgotLS0KIHhlbi9pbmNs
dWRlL2FzbS1hcm0vY3B1ZXJyYXRhLmggfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVlcnJhdGEuaCBiL3hlbi9p
bmNsdWRlL2FzbS1hcm0vY3B1ZXJyYXRhLmgKaW5kZXggMjNlYmYzNjdlYS4uN2RlNjgzNjFmZiAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVlcnJhdGEuaAorKysgYi94ZW4vaW5j
bHVkZS9hc20tYXJtL2NwdWVycmF0YS5oCkBAIC0xLDcgKzEsNiBAQAogI2lmbmRlZiBfX0FSTV9D
UFVFUlJBVEFfSF9fCiAjZGVmaW5lIF9fQVJNX0NQVUVSUkFUQV9IX18KIAotI2luY2x1ZGUgPHhl
bi9wZXJjcHUuaD4KICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgogI2luY2x1ZGUgPGFzbS9h
bHRlcm5hdGl2ZS5oPgogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
