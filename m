From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH v4 02/15] x86/cpu: Fix common cpuid faulting
 probing for AMD and Hygon
Date: Sat, 30 Mar 2019 18:42:16 +0800
Message-ID: <96396a5ea9e1acc527705f71e9cd657b16585a75.1553935727.git.puwen@hygon.cn>
References: <cover.1553935727.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FjNl=SB=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hABVX-0004pH-1n
 for xen-devel@lists.xenproject.org; Sat, 30 Mar 2019 10:46:39 +0000
In-Reply-To: <cover.1553935727.git.puwen@hygon.cn>
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
aWxpZXMuIFNvIGRpcmVjdGx5CnJldHVybiBmYWxzZSBpbiB0aGUgZnVuY3Rpb24gcHJvYmVfY3B1
aWRfZmF1bHRpbmcoKSBpZiAhY3B1X2hhc19oeXBlcnZpc29yLgoKU2lnbmVkLW9mZi1ieTogUHUg
V2VuIDxwdXdlbkBoeWdvbi5jbj4KLS0tCiB4ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jIHwgNSAr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9jcHUvY29tbW9uLmMgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCmluZGV4IGRi
MWViZjEuLmEwOGQ0OGYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKKysr
IGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwpAQCAtMTE2LDYgKzExNiwxMSBAQCBib29sIF9f
aW5pdCBwcm9iZV9jcHVpZF9mYXVsdGluZyh2b2lkKQogCXVpbnQ2NF90IHZhbDsKIAlpbnQgcmM7
CiAKKwlpZiAoKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0hZR09OIHx8
CisJICAgICBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQpICYmCisJ
ICAgICFjcHVfaGFzX2h5cGVydmlzb3IpCisJCXJldHVybiBmYWxzZTsKKwogCWlmICgocmMgPSBy
ZG1zcl9zYWZlKE1TUl9JTlRFTF9QTEFURk9STV9JTkZPLCB2YWwpKSA9PSAwKQogCQlyYXdfbXNy
X3BvbGljeS5wbGFmb3JtX2luZm8uY3B1aWRfZmF1bHRpbmcgPQogCQkJdmFsICYgTVNSX1BMQVRG
T1JNX0lORk9fQ1BVSURfRkFVTFRJTkc7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
