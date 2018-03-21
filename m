From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v3 07/39] ARM: vPL011: Use the VGIC's level
 triggered IRQs handling if available
Date: Wed, 21 Mar 2018 16:32:03 +0000
Message-ID: <20180321163235.12529-8-andre.przywara@linaro.org>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p7ro=gl=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eygfa-00024L-4i
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 16:32:58 +0000
Received: by mail-wm0-x241.google.com with SMTP id i189so7155253wmf.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Mar 2018 09:32:56 -0700 (PDT)
In-Reply-To: <20180321163235.12529-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIGVtdWxhdGVkIEFSTSBTQlNBIFVBUlQgaXMgdXNpbmcgbGV2ZWwgdHJpZ2dlcmVkIElSUSBz
ZW1hbnRpY3MsCmhvd2V2ZXIgdGhlIGN1cnJlbnQgVkdJQyBjYW4gb25seSBoYW5kbGUgZWRnZSB0
cmlnZ2VyZWQgSVJRcywgcmVhbGx5LgpEaXNhYmxlIHRoZSBleGlzdGluZyB3b3JrYXJvdW5kIGZv
ciB0aGlzIHByb2JsZW0gaW4gY2FzZSB3ZSBoYXZlIHRoZQpuZXcgVkdJQyBpbiBwbGFjZSwgd2hp
Y2ggY2FuIHByb3Blcmx5IGhhbmRsZSBsZXZlbCB0cmlnZ2VyZWQgSVJRcy4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgpSZXZpZXdlZC1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0v
dnBsMDExLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vdnBsMDExLmMgYi94ZW4vYXJjaC9hcm0vdnBsMDExLmMKaW5k
ZXggNWRjZjRiZWMxOC4uYTI4MWVhYmQ3ZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3ZwbDAx
MS5jCisrKyBiL3hlbi9hcmNoL2FybS92cGwwMTEuYwpAQCAtNTQsNiArNTQsNyBAQCBzdGF0aWMg
dm9pZCB2cGwwMTFfdXBkYXRlX2ludGVycnVwdF9zdGF0dXMoc3RydWN0IGRvbWFpbiAqZCkKICAg
ICAgKi8KICAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoJnZwbDAxMS0+bG9jaykpOwogCisjaWZu
ZGVmIENPTkZJR19ORVdfVkdJQwogICAgIC8qCiAgICAgICogVE9ETzogUEwwMTEgaW50ZXJydXB0
cyBhcmUgbGV2ZWwgdHJpZ2dlcmVkIHdoaWNoIG1lYW5zCiAgICAgICogdGhhdCBpbnRlcnJ1cHQg
bmVlZHMgdG8gYmUgc2V0L2NsZWFyIGluc3RlYWQgb2YgYmVpbmcKQEAgLTcxLDYgKzcyLDkgQEAg
c3RhdGljIHZvaWQgdnBsMDExX3VwZGF0ZV9pbnRlcnJ1cHRfc3RhdHVzKHN0cnVjdCBkb21haW4g
KmQpCiAgICAgICAgIHZnaWNfaW5qZWN0X2lycShkLCBOVUxMLCBHVUVTVF9WUEwwMTFfU1BJLCB0
cnVlKTsKIAogICAgIHZwbDAxMS0+c2hhZG93X3VhcnRtaXMgPSB1YXJ0bWlzOworI2Vsc2UKKyAg
ICB2Z2ljX2luamVjdF9pcnEoZCwgTlVMTCwgR1VFU1RfVlBMMDExX1NQSSwgdWFydG1pcyk7Cisj
ZW5kaWYKIH0KIAogc3RhdGljIHVpbnQ4X3QgdnBsMDExX3JlYWRfZGF0YShzdHJ1Y3QgZG9tYWlu
ICpkKQotLSAKMi4xNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
