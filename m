From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v3 12/16] x86/mm: put paging_update_nestedmode
 under CONFIG_HVM
Date: Tue, 4 Sep 2018 17:15:29 +0100
Message-ID: <20180904161533.11575-13-wei.liu2@citrix.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6dpj=ls=citrix.com=prvs=77871bf46=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fxECK-0005I9-AB
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 16:29:00 +0000
In-Reply-To: <20180904161533.11575-1-wei.liu2@citrix.com>
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
ZGV4IGRjZWU0OTZlYjAuLjdmNDYwYmQzMjEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9w
YWdpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMKQEAgLTkxOSw2ICs5MTksNyBA
QCBjb25zdCBzdHJ1Y3QgcGFnaW5nX21vZGUgKnBhZ2luZ19nZXRfbW9kZShzdHJ1Y3QgdmNwdSAq
dikKICAgICByZXR1cm4gcGFnaW5nX2dldF9uZXN0ZWRtb2RlKHYpOwogfQogCisjaWZkZWYgQ09O
RklHX0hWTQogdm9pZCBwYWdpbmdfdXBkYXRlX25lc3RlZG1vZGUoc3RydWN0IHZjcHUgKnYpCiB7
CiAgICAgQVNTRVJUKG5lc3RlZGh2bV9lbmFibGVkKHYtPmRvbWFpbikpOwpAQCAtOTMwLDYgKzkz
MSw3IEBAIHZvaWQgcGFnaW5nX3VwZGF0ZV9uZXN0ZWRtb2RlKHN0cnVjdCB2Y3B1ICp2KQogICAg
ICAgICB2LT5hcmNoLnBhZ2luZy5uZXN0ZWRtb2RlID0gTlVMTDsKICAgICBodm1fYXNpZF9mbHVz
aF92Y3B1KHYpOwogfQorI2VuZGlmCiAKIHZvaWQgcGFnaW5nX3dyaXRlX3AybV9lbnRyeShzdHJ1
Y3QgcDJtX2RvbWFpbiAqcDJtLCB1bnNpZ25lZCBsb25nIGdmbiwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsMV9wZ2VudHJ5X3QgKnAsIGwxX3BnZW50cnlfdCBuZXcsCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
