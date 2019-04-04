From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH v5 02/15] x86/cpu: Fix common cpuid faulting
 probing for AMD and Hygon
Date: Thu, 4 Apr 2019 21:45:42 +0800
Message-ID: <1a5980e4c873b562ef23c84117f0daa5ad42b122.1554382869.git.puwen@hygon.cn>
References: <cover.1554382869.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2cXD=SG=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hC2kA-0007GM-Q9
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 13:49:26 +0000
In-Reply-To: <cover.1554382869.git.puwen@hygon.cn>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Pu Wen <puwen@hygon.cn>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgaXMgbm8gTVNSX0lOVEVMX1BMQVRGT1JNX0lORk8gZm9yIEFNRCBhbmQgSHlnb24gZmFt
aWxpZXMuIFJlYWQKdGhpcyBNU1Igd2lsbCBzdG9wIHRoZSBYZW4gaW5pdGlhbGl6YXRpb24gcHJv
Y2VzcyBpbiBzb21lIEh5Z29uCnN5c3RlbXMgb3IgcHJvZHVjZSBHUEYoMCkuIFNvIGRpcmVjdGx5
IHJldHVybiBmYWxzZSBpbiB0aGUgZnVuY3Rpb24KcHJvYmVfY3B1aWRfZmF1bHRpbmcoKSBpZiAh
Y3B1X2hhc19oeXBlcnZpc29yLgoKU2lnbmVkLW9mZi1ieTogUHUgV2VuIDxwdXdlbkBoeWdvbi5j
bj4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvY3B1L2NvbW1vbi5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMgYi94ZW4vYXJjaC94
ODYvY3B1L2NvbW1vbi5jCmluZGV4IDc0Yzk0MjYuLjFhMDk1ZmMgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9jcHUvY29tbW9uLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwpAQCAt
MTE2LDYgKzExNiwxMSBAQCBib29sIF9faW5pdCBwcm9iZV9jcHVpZF9mYXVsdGluZyh2b2lkKQog
CXVpbnQ2NF90IHZhbDsKIAlpbnQgcmM7CiAKKwlpZiAoKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRv
ciA9PSBYODZfVkVORE9SX0hZR09OIHx8CisJICAgICBib290X2NwdV9kYXRhLng4Nl92ZW5kb3Ig
PT0gWDg2X1ZFTkRPUl9BTUQpICYmCisJICAgICFjcHVfaGFzX2h5cGVydmlzb3IpCisJCXJldHVy
biBmYWxzZTsKKwogCWlmICgocmMgPSByZG1zcl9zYWZlKE1TUl9JTlRFTF9QTEFURk9STV9JTkZP
LCB2YWwpKSA9PSAwKQogCQlyYXdfbXNyX3BvbGljeS5wbGFmb3JtX2luZm8uY3B1aWRfZmF1bHRp
bmcgPQogCQkJdmFsICYgTVNSX1BMQVRGT1JNX0lORk9fQ1BVSURfRkFVTFRJTkc7Ci0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
