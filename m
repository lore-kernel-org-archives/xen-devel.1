From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 17/23] x86/mm: put paging_update_nestedmode
 under CONFIG_HVM
Date: Sun, 26 Aug 2018 13:19:50 +0100
Message-ID: <4f2a5de72552edce4bafe5d049ee89a18531ed1f.1535285866.git-series.wei.liu2@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpvm=lj=citrix.com=prvs=769521655=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftu9j-0000VR-Rw
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 12:28:35 +0000
In-Reply-To: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

TmVzdGVkIEhWTSBpcyBub3QgZW5hYmxlZCB3aGVuICFDT05GSUdfSFZNLgoKU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0vcGFn
aW5nLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jIGIveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jCmlu
ZGV4IGRjZWU0OTYuLjdmNDYwYmQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wYWdpbmcu
YworKysgYi94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMKQEAgLTkxOSw2ICs5MTksNyBAQCBjb25z
dCBzdHJ1Y3QgcGFnaW5nX21vZGUgKnBhZ2luZ19nZXRfbW9kZShzdHJ1Y3QgdmNwdSAqdikKICAg
ICByZXR1cm4gcGFnaW5nX2dldF9uZXN0ZWRtb2RlKHYpOwogfQogCisjaWZkZWYgQ09ORklHX0hW
TQogdm9pZCBwYWdpbmdfdXBkYXRlX25lc3RlZG1vZGUoc3RydWN0IHZjcHUgKnYpCiB7CiAgICAg
QVNTRVJUKG5lc3RlZGh2bV9lbmFibGVkKHYtPmRvbWFpbikpOwpAQCAtOTMwLDYgKzkzMSw3IEBA
IHZvaWQgcGFnaW5nX3VwZGF0ZV9uZXN0ZWRtb2RlKHN0cnVjdCB2Y3B1ICp2KQogICAgICAgICB2
LT5hcmNoLnBhZ2luZy5uZXN0ZWRtb2RlID0gTlVMTDsKICAgICBodm1fYXNpZF9mbHVzaF92Y3B1
KHYpOwogfQorI2VuZGlmCiAKIHZvaWQgcGFnaW5nX3dyaXRlX3AybV9lbnRyeShzdHJ1Y3QgcDJt
X2RvbWFpbiAqcDJtLCB1bnNpZ25lZCBsb25nIGdmbiwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBsMV9wZ2VudHJ5X3QgKnAsIGwxX3BnZW50cnlfdCBuZXcsCi0tIApnaXQtc2VyaWVzIDAu
OS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
