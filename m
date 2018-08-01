From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 1/5] x86/cpuidle: replace a pointless NULL check
Date: Wed, 01 Aug 2018 08:31:20 -0600
Message-ID: <5B61C43802000078001D9F5F@prv1-mh.provo.novell.com>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qz6i=kq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fks9s-0007Gr-NZ
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 14:31:24 +0000
In-Reply-To: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGFkZHJlc3Mgb2YgYW4gYXJyYXkgc2xvdCBjYW4ndCBiZSBOVUxMLiBJbnN0ZWFkIGFkZCBh
IGJvdW5kcyBjaGVjawp0byBtYWtlIHN1cmUgdGhlIGFycmF5IGluZGV4aW5nIGlzIHZhbGlkICh0
aGUgY2hlY2sgaXMgYWdhaW5zdCAyIHNpbmNlCnNsb3QgemVybyBvZiB0aGUgYXJyYXkgLSBjb3Jy
ZXNwb25kaW5nIHRvIEMwIC0gaXMgb2Ygbm8gaW50ZXJlc3QgaGVyZSkuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvYWNw
aS9jcHVfaWRsZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMKQEAgLTc1OSwx
MSArNzU5LDExIEBAIHZvaWQgYWNwaV9kZWFkX2lkbGUodm9pZCkKICAgICBzdHJ1Y3QgYWNwaV9w
cm9jZXNzb3JfcG93ZXIgKnBvd2VyOwogICAgIHN0cnVjdCBhY3BpX3Byb2Nlc3Nvcl9jeCAqY3g7
CiAKLSAgICBpZiAoIChwb3dlciA9IHByb2Nlc3Nvcl9wb3dlcnNbc21wX3Byb2Nlc3Nvcl9pZCgp
XSkgPT0gTlVMTCApCisgICAgaWYgKCAocG93ZXIgPSBwcm9jZXNzb3JfcG93ZXJzW3NtcF9wcm9j
ZXNzb3JfaWQoKV0pID09IE5VTEwgfHwKKyAgICAgICAgIHBvd2VyLT5jb3VudCA8IDIgKQogICAg
ICAgICBnb3RvIGRlZmF1bHRfaGFsdDsKIAotICAgIGlmICggKGN4ID0gJnBvd2VyLT5zdGF0ZXNb
cG93ZXItPmNvdW50LTFdKSA9PSBOVUxMICkKLSAgICAgICAgZ290byBkZWZhdWx0X2hhbHQ7Cisg
ICAgY3ggPSAmcG93ZXItPnN0YXRlc1twb3dlci0+Y291bnQgLSAxXTsKIAogICAgIGlmICggY3gt
PmVudHJ5X21ldGhvZCA9PSBBQ1BJX0NTVEFURV9FTV9GRkggKQogICAgIHsKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
