From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 43/55] x86_64/mm: map and unmap page tables
 in destroy_compat_m2p_mapping
Date: Thu, 7 Feb 2019 16:44:44 +0000
Message-ID: <20190207164456.9260-44-wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBy9=QO=citrix.com=prvs=93456468f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1grn22-000284-Mw
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 17:00:10 +0000
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
L21tLmMgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKaW5kZXggNTk3ZDhlOWVkOC4uYmQyOThm
ZmYxYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCisrKyBiL3hlbi9hcmNo
L3g4Ni94ODZfNjQvbW0uYwpAQCAtMjUyLDExICsyNTIsMTMgQEAgc3RhdGljIHZvaWQgZGVzdHJv
eV9jb21wYXRfbTJwX21hcHBpbmcoc3RydWN0IG1lbV9ob3RhZGRfaW5mbyAqaW5mbykKICAgICBp
ZiAoIGVtYXAgPiAoKFJEV1JfQ09NUEFUX01QVF9WSVJUX0VORCAtIFJEV1JfQ09NUEFUX01QVF9W
SVJUX1NUQVJUKSA+PiAyKSApCiAgICAgICAgIGVtYXAgPSAoUkRXUl9DT01QQVRfTVBUX1ZJUlRf
RU5EIC0gUkRXUl9DT01QQVRfTVBUX1ZJUlRfU1RBUlQpID4+IDI7CiAKLSAgICBsM19yb19tcHQg
PSBsNGVfdG9fbDNlKGlkbGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0KEhJUk9fQ09NUEFUX01Q
VF9WSVJUX1NUQVJUKV0pOworICAgIGwzX3JvX21wdCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldygK
KyAgICAgICAgbDRlX2dldF9tZm4oaWRsZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQoSElST19D
T01QQVRfTVBUX1ZJUlRfU1RBUlQpXSkpOwogCiAgICAgQVNTRVJUKGwzZV9nZXRfZmxhZ3MobDNf
cm9fbXB0W2wzX3RhYmxlX29mZnNldChISVJPX0NPTVBBVF9NUFRfVklSVF9TVEFSVCldKSAmIF9Q
QUdFX1BSRVNFTlQpOwogCi0gICAgbDJfcm9fbXB0ID0gbDNlX3RvX2wyZShsM19yb19tcHRbbDNf
dGFibGVfb2Zmc2V0KEhJUk9fQ09NUEFUX01QVF9WSVJUX1NUQVJUKV0pOworICAgIGwyX3JvX21w
dCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldygKKyAgICAgICAgbDNlX2dldF9tZm4obDNfcm9fbXB0
W2wzX3RhYmxlX29mZnNldChISVJPX0NPTVBBVF9NUFRfVklSVF9TVEFSVCldKSk7CiAKICAgICBm
b3IgKCBpID0gc21hcDsgaSA8IGVtYXA7ICkKICAgICB7CkBAIC0yNzgsNiArMjgwLDkgQEAgc3Rh
dGljIHZvaWQgZGVzdHJveV9jb21wYXRfbTJwX21hcHBpbmcoc3RydWN0IG1lbV9ob3RhZGRfaW5m
byAqaW5mbykKICAgICAgICAgaSArPSAxVUwgPDwgKEwyX1BBR0VUQUJMRV9TSElGVCAtIDIpOwog
ICAgIH0KIAorICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwyX3JvX21wdCk7CisgICAgVU5N
QVBfWEVOX1BBR0VUQUJMRV9ORVcobDNfcm9fbXB0KTsKKwogICAgIHJldHVybjsKIH0KIAotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
