From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 38/74] x86/pv-shim: Force CPUID faulting
	in pv-shim mode
Date: Thu, 4 Jan 2018 13:05:49 +0000
Message-ID: <20180104130625.28605-39-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5eN-0002BA-RT
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:33:39 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRoaXMgaXMg
bmVjZXNzYXJ5IHRvIHByZXZlbnQgdGhlIFBWIGd1ZXN0IHNlZWluZyBIVk0gWGVuIGxlYXZlcyB2
aWEgbmF0aXZlCmNwdWlkLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jIHwgNCArKyst
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYyBiL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9u
LmMKaW5kZXggYTFmMWEwNDc3Ni4uNjU0MzY5MDk4OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2NwdS9jb21tb24uYworKysgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCkBAIC0xMiw2ICsx
Miw3IEBACiAjaW5jbHVkZSA8bWFjaF9hcGljLmg+CiAjaW5jbHVkZSA8YXNtL3NldHVwLmg+CiAj
aW5jbHVkZSA8cHVibGljL3N5c2N0bC5oPiAvKiBmb3IgWEVOX0lOVkFMSURfe1NPQ0tFVCxDT1JF
fV9JRCAqLworI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgogCiAjaW5jbHVkZSAiY3B1LmgiCiAKQEAg
LTE3Nyw3ICsxNzgsOCBAQCB2b2lkIGN0eHRfc3dpdGNoX2xldmVsbGluZyhjb25zdCBzdHJ1Y3Qg
dmNwdSAqbmV4dCkKIAkJICogZ2VuZXJhdGluZyB0aGUgbWF4aW11bSBmdWxsIGNwdWlkIHBvbGlj
eSBpbnRvIFhlbiwgYXQgd2hpY2gKIAkJICogdGhpcyBwcm9ibGVtIHdpbGwgZGlzYXBwZWFyLgog
CQkgKi8KLQkJc2V0X2NwdWlkX2ZhdWx0aW5nKG5leHRkICYmICFpc19jb250cm9sX2RvbWFpbihu
ZXh0ZCkgJiYKKwkJc2V0X2NwdWlkX2ZhdWx0aW5nKG5leHRkICYmCisJCQkJICAgKHB2X3NoaW0g
fHwgIWlzX2NvbnRyb2xfZG9tYWluKG5leHRkKSkgJiYKIAkJCQkgICAoaXNfcHZfZG9tYWluKG5l
eHRkKSB8fAogCQkJCSAgICBuZXh0LT5hcmNoLm1zci0+CiAJCQkJICAgIG1pc2NfZmVhdHVyZXNf
ZW5hYmxlcy5jcHVpZF9mYXVsdGluZykpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
