From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: [PATCH 1/1] x86/boot: Allocate one extra module slot
 for Xen image placement
Date: Thu, 27 Sep 2018 12:05:07 +0200
Message-ID: <1538042707-31855-1-git-send-email-daniel.kiper@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fvyv=mj=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1g5TAj-00072I-Tq
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 10:05:25 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDk1ODk5MjcgKHg4Ni9tYjI6IGF2b2lkIFhlbiBpbWFnZSB3aGVuIGxvb2tpbmcgZm9y
Cm1vZHVsZS9jcmFzaGtlcm5lbCBwb3NpdGlvbikgZml4ZWQgcmVsb2NhdGlvbiBpc3N1ZXMgZm9y
Ck11bHRpYm9vdDIgcHJvdG9jb2wuIFVuZm9ydHVuYXRlbHkgaXQgbWlzc2VkIHRvIGFsbG9jYXRl
Cm1vZHVsZSBzbG90IGZvciBYZW4gaW1hZ2UgcGxhY2VtZW50IGluIGVhcmx5IGJvb3QgcGF0aC4K
U28sIGxldCdzIGZpeCBpdCByaWdodCBub3cuCgpSZXBvcnRlZC1ieTogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIEtpcGVyIDxkYW5pZWwua2lwZXJA
b3JhY2xlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvYm9vdC9yZWxvYy5jIHwgICAgNyArKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2Jvb3QvcmVsb2MuYyBiL3hlbi9hcmNoL3g4Ni9ib290L3JlbG9j
LmMKaW5kZXggYTU2ZWM3Ny4uNGY0MDM5YiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3Qv
cmVsb2MuYworKysgYi94ZW4vYXJjaC94ODYvYm9vdC9yZWxvYy5jCkBAIC0xNzcsNyArMTc3LDEy
IEBAIHN0YXRpYyBtdWx0aWJvb3RfaW5mb190ICptYmkyX3JlbG9jKHUzMiBtYmlfaW4pCiAgICAg
aWYgKCBtYmlfb3V0LT5tb2RzX2NvdW50ICkKICAgICB7CiAgICAgICAgIG1iaV9vdXQtPmZsYWdz
IHw9IE1CSV9NT0RVTEVTOwotICAgICAgICBtYmlfb3V0LT5tb2RzX2FkZHIgPSBhbGxvY19tZW0o
bWJpX291dC0+bW9kc19jb3VudCAqIHNpemVvZigqbWJpX291dF9tb2RzKSk7CisgICAgICAgIC8q
CisgICAgICAgICAqIFdlIGhhdmUgdG8gYWxsb2NhdGUgb25lIG1vcmUgbW9kdWxlIHNsb3QgaGVy
ZS4gQXQgc29tZSBwb2ludAorICAgICAgICAgKiBfX3N0YXJ0X3hlbigpIG1heSBwdXQgWGVuIGlt
YWdlIHBsYWNlbWVudCBpbnRvIGl0LgorICAgICAgICAgKi8KKyAgICAgICAgbWJpX291dC0+bW9k
c19hZGRyID0gYWxsb2NfbWVtKChtYmlfb3V0LT5tb2RzX2NvdW50ICsgMSkgKgorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKCptYmlfb3V0X21vZHMpKTsKICAg
ICAgICAgbWJpX291dF9tb2RzID0gX3AobWJpX291dC0+bW9kc19hZGRyKTsKICAgICB9CiAKLS0g
CjEuNy4xMC40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
