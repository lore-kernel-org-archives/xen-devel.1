From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 04/15] xen/arm: p2m: Reduce the locking section
 in get_page_from_gva
Date: Mon, 16 Jul 2018 18:27:01 +0100
Message-ID: <20180716172712.20294-5-julien.grall@arm.com>
References: <20180716172712.20294-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j3cc=ka=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ff7HQ-0006RC-Op
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 17:27:24 +0000
In-Reply-To: <20180716172712.20294-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

VGhlIHAybSBsb2NrIGlzIG9ubHkgbmVjZXNzYXJ5IHRvIHByZXZlbnQgZ3ZpcnRfdG9fbWFkZHIg
ZmFpbGluZyB3aGVuCmJyZWFrLWJlZm9yZS1tYWtlIHNlcXVlbmNlIGlzIHVzZWQgaW4gdGhlIFAy
TSB1cGRhdGUgY29uY3VycmVudGx5IG9uCmFub3RoZXIgcENQVS4gU28gcmVkdWNlIHRoZSBsb2Nr
aW5nIHNlY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgoKLS0tCgogICAgTm90ZSBhIG5ld2xpbmUgaGFzIGJlZW4gZHJvcHBlZCB0byBrZWVw
IHRoZSBibG9jayB0b2dldGhlci4KLS0tCiB4ZW4vYXJjaC9hcm0vcDJtLmMgfCA4ICsrKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYwppbmRleCAxNDc5
MTM4OGFkLi41Y2E3ZmZlNDFiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vcDJtLmMKKysrIGIv
eGVuL2FyY2gvYXJtL3AybS5jCkBAIC0xNDE1LDkgKzE0MTUsMTMgQEAgc3RydWN0IHBhZ2VfaW5m
byAqZ2V0X3BhZ2VfZnJvbV9ndmEoc3RydWN0IHZjcHUgKnYsIHZhZGRyX3QgdmEsCiAgICAgaWYg
KCB2ICE9IGN1cnJlbnQgKQogICAgICAgICByZXR1cm4gTlVMTDsKIAorICAgIC8qCisgICAgICog
VGhlIGxvY2sgaXMgaGVyZSB0byBwcm90ZWN0IHVzIGFnYWluc3QgdGhlIGJyZWFrLWJlZm9yZS1t
YWtlCisgICAgICogc2VxdWVuY2UgdXNlZCB3aGVuIHVwZGF0aW5nIHRoZSBlbnRyeS4KKyAgICAg
Ki8KICAgICBwMm1fcmVhZF9sb2NrKHAybSk7Ci0KICAgICBwYXIgPSBndmlydF90b19tYWRkcih2
YSwgJm1hZGRyLCBmbGFncyk7CisgICAgcDJtX3JlYWRfdW5sb2NrKHAybSk7CiAKICAgICBpZiAo
IHBhciApCiAgICAgewpAQCAtMTQ0NSw4ICsxNDQ5LDYgQEAgc3RydWN0IHBhZ2VfaW5mbyAqZ2V0
X3BhZ2VfZnJvbV9ndmEoc3RydWN0IHZjcHUgKnYsIHZhZGRyX3QgdmEsCiAgICAgfQogCiBlcnI6
Ci0gICAgcDJtX3JlYWRfdW5sb2NrKHAybSk7Ci0KICAgICBpZiAoICFwYWdlICYmIHAybS0+bWVt
X2FjY2Vzc19lbmFibGVkICkKICAgICAgICAgcGFnZSA9IHAybV9tZW1fYWNjZXNzX2NoZWNrX2Fu
ZF9nZXRfcGFnZSh2YSwgZmxhZ3MsIHYpOwogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
