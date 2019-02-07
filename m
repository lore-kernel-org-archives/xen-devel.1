From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 45/55] x86_64/mm: map and unmap page tables
 in setup_compat_m2p_table
Date: Thu, 7 Feb 2019 16:44:46 +0000
Message-ID: <20190207164456.9260-46-wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBy9=QO=citrix.com=prvs=93456468f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1grn1r-0001aI-I7
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 16:59:59 +0000
In-Reply-To: <20190207164456.9260-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYveDg2XzY0L21tLmMgfCA5ICsrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0
L21tLmMgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKaW5kZXggMzZmMjU1ODNmMi4uNjA4Nzg1
MWU2OSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCisrKyBiL3hlbi9hcmNo
L3g4Ni94ODZfNjQvbW0uYwpAQCAtMzgyLDExICszODIsMTMgQEAgc3RhdGljIGludCBzZXR1cF9j
b21wYXRfbTJwX3RhYmxlKHN0cnVjdCBtZW1faG90YWRkX2luZm8gKmluZm8pCiAKICAgICB2YSA9
IEhJUk9fQ09NUEFUX01QVF9WSVJUX1NUQVJUICsKICAgICAgICAgIHNtYXAgKiBzaXplb2YoKmNv
bXBhdF9tYWNoaW5lX3RvX3BoeXNfbWFwcGluZyk7Ci0gICAgbDNfcm9fbXB0ID0gbDRlX3RvX2wz
ZShpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldCh2YSldKTsKKyAgICBsM19yb19tcHQgPSBt
YXBfeGVuX3BhZ2V0YWJsZV9uZXcoCisgICAgICAgIGw0ZV9nZXRfbWZuKGlkbGVfcGdfdGFibGVb
bDRfdGFibGVfb2Zmc2V0KHZhKV0pKTsKIAogICAgIEFTU0VSVChsM2VfZ2V0X2ZsYWdzKGwzX3Jv
X21wdFtsM190YWJsZV9vZmZzZXQodmEpXSkgJiBfUEFHRV9QUkVTRU5UKTsKIAotICAgIGwyX3Jv
X21wdCA9IGwzZV90b19sMmUobDNfcm9fbXB0W2wzX3RhYmxlX29mZnNldCh2YSldKTsKKyAgICBs
Ml9yb19tcHQgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcoCisgICAgICAgIGwzZV9nZXRfbWZuKGwz
X3JvX21wdFtsM190YWJsZV9vZmZzZXQodmEpXSkpOwogCiAjZGVmaW5lIE1GTih4KSAoKCh4KSA8
PCBMMl9QQUdFVEFCTEVfU0hJRlQpIC8gc2l6ZW9mKHVuc2lnbmVkIGludCkpCiAjZGVmaW5lIENO
VCAoKHNpemVvZigqZnJhbWVfdGFibGUpICYgLXNpemVvZigqZnJhbWVfdGFibGUpKSAvIFwKQEAg
LTQyNCw2ICs0MjYsOSBAQCBzdGF0aWMgaW50IHNldHVwX2NvbXBhdF9tMnBfdGFibGUoc3RydWN0
IG1lbV9ob3RhZGRfaW5mbyAqaW5mbykKICAgICB9CiAjdW5kZWYgQ05UCiAjdW5kZWYgTUZOCisK
KyAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMl9yb19tcHQpOworICAgIFVOTUFQX1hFTl9Q
QUdFVEFCTEVfTkVXKGwzX3JvX21wdCk7CiAgICAgcmV0dXJuIGVycjsKIH0KIAotLSAKMi4xMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
