From: Julien Grall <julien.grall@linaro.org>
Subject: [PATCH 2/2] xen/arm: GICv3: Only initialize ITS when
	the distributor supports LPIs.
Date: Mon, 22 Jan 2018 18:22:47 +0000
Message-ID: <20180122182247.18490-3-julien.grall@linaro.org>
References: <20180122182247.18490-1-julien.grall@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=r/hy=er=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1edgkF-0005zo-EW
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 18:22:59 +0000
Received: by mail-wm0-x244.google.com with SMTP id 141so18617463wme.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2018 10:22:57 -0800 (PST)
In-Reply-To: <20180122182247.18490-1-julien.grall@linaro.org>
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

VGhlcmUgYXJlIGZpcm13YXJlIHRhYmxlcyBvdXQgZGVzY3JpYmluZyB0aGUgSVRTIGJ1dCBkb2Vz
IG5vdCBzdXBwb3J0CkxQSXMuIFRoaXMgd2lsbCByZXN1bHQgdG8gYSBkYXRhIGFib3J0IHdoZW4g
dHJ5aW5nIHRvIGluaXRpYWxpemUgSVRTLgoKV2hpbGUgdGhpcyBjYW4gYmUgY29uc2lkZXIgYSBi
dWcgaW4gdGhlIERldmljZS1UcmVlLCBzYW1lIGNvbmZpZ3VyYXRpb24KYm9vdHMgb24gTGludXgu
IFNvIGdhdGUgdGhlIElUUyBpbml0aWFsaXphdGlvbiB3aXRoIHRoZSBzdXBwb3J0IG9mIExQSXMK
aW4gdGhlIGRpc3RyaWJ1dG9yLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAbGluYXJvLm9yZz4KLS0tCiB4ZW4vYXJjaC9hcm0vZ2ljLXYzLmMgfCAxNCArKysrKysr
KysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12My5jIGIveGVuL2FyY2gvYXJtL2dpYy12
My5jCmluZGV4IDlmOWNmNTlmODIuLjczMDQ1MGUzNGIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2Fy
bS9naWMtdjMuYworKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMKQEAgLTE2MzcsNiArMTYzNywx
MSBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBnaWN2M19nZXRfaHdkb21fZXh0cmFfbWFkdF9zaXpl
KGNvbnN0IHN0cnVjdCBkb21haW4gKmQpCiB9CiAjZW5kaWYKIAorc3RhdGljIGJvb2wgZ2ljX2Rp
c3Rfc3VwcG9ydHNfbHBpcyh2b2lkKQoreworICAgIHJldHVybiAocmVhZGxfcmVsYXhlZChHSUNE
ICsgR0lDRF9UWVBFUikgJiBHSUNEX1RZUEVfTFBJUyk7Cit9CisKIC8qIFNldCB1cCB0aGUgR0lD
ICovCiBzdGF0aWMgaW50IF9faW5pdCBnaWN2M19pbml0KHZvaWQpCiB7CkBAIC0xNjk5LDkgKzE3
MDQsMTIgQEAgc3RhdGljIGludCBfX2luaXQgZ2ljdjNfaW5pdCh2b2lkKQogCiAgICAgZ2ljdjNf
ZGlzdF9pbml0KCk7CiAKLSAgICByZXMgPSBnaWN2M19pdHNfaW5pdCgpOwotICAgIGlmICggcmVz
ICkKLSAgICAgICAgcGFuaWMoIkdJQ3YzOiBJVFM6IGluaXRpYWxpemF0aW9uIGZhaWxlZDogJWRc
biIsIHJlcyk7CisgICAgaWYgKCBnaWNfZGlzdF9zdXBwb3J0c19scGlzKCkgKQorICAgIHsKKyAg
ICAgICAgcmVzID0gZ2ljdjNfaXRzX2luaXQoKTsKKyAgICAgICAgaWYgKCByZXMgKQorICAgICAg
ICAgICAgcGFuaWMoIkdJQ3YzOiBJVFM6IGluaXRpYWxpemF0aW9uIGZhaWxlZDogJWRcbiIsIHJl
cyk7CisgICAgfQogCiAgICAgcmVzID0gZ2ljdjNfY3B1X2luaXQoKTsKICAgICBpZiAoIHJlcyAp
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
