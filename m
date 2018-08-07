From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 7/9] x86: move arch_evtchn_inject to x86 common
 code
Date: Tue, 7 Aug 2018 11:00:50 +0100
Message-ID: <cdb8122af69109bce7ffd9e0b1b16b40f6d25b54.1533636027.git-series.wei.liu2@citrix.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xdgf=kw=citrix.com=prvs=7503460ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fmynS-00047S-EW
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 10:00:58 +0000
In-Reply-To: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SXQgaXMgbm90IHNwZWNpZmljIHRvIEhWTS4gSXQganVzdCBzbyBoYXBwZW5zIHRoYXQgUFYgZG9l
c24ndCBuZWVkCnNwZWNpYWwgaGFuZGxpbmcuIEFsc28gZW5jbG9zZSB0aGUgY29kZSBpbiBDT05G
SUdfSFZNLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0t
CiB4ZW4vYXJjaC94ODYvaHZtL2lycS5jIHwgNiAtLS0tLS0KIHhlbi9hcmNoL3g4Ni9pcnEuYyAg
ICAgfCA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2lycS5jIGIveGVuL2FyY2gv
eDg2L2h2bS9pcnEuYwppbmRleCA4MDk1YzgyLi5kZmU4ZWQ2IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvaHZtL2lycS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaXJxLmMKQEAgLTU3NywxMiAr
NTc3LDYgQEAgaW50IGh2bV9sb2NhbF9ldmVudHNfbmVlZF9kZWxpdmVyeShzdHJ1Y3QgdmNwdSAq
dikKICAgICByZXR1cm4gIWh2bV9pbnRlcnJ1cHRfYmxvY2tlZCh2LCBpbnRhY2spOwogfQogCi12
b2lkIGFyY2hfZXZ0Y2huX2luamVjdChzdHJ1Y3QgdmNwdSAqdikKLXsKLSAgICBpZiAoIGlzX2h2
bV92Y3B1KHYpICkKLSAgICAgICAgaHZtX2Fzc2VydF9ldnRjaG5faXJxKHYpOwotfQotCiBzdGF0
aWMgdm9pZCBpcnFfZHVtcChzdHJ1Y3QgZG9tYWluICpkKQogewogICAgIHN0cnVjdCBodm1faXJx
ICpodm1faXJxID0gaHZtX2RvbWFpbl9pcnEoZCk7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aXJxLmMgYi94ZW4vYXJjaC94ODYvaXJxLmMKaW5kZXggN2QwYjE5Zi4uMWFlYjAyZiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2lycS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwpAQCAtMjcz
MiwzICsyNzMyLDExIEBAIGludCBhbGxvY2F0ZV9hbmRfbWFwX21zaV9waXJxKHN0cnVjdCBkb21h
aW4gKmQsIGludCBpbmRleCwgaW50ICpwaXJxX3AsCiAKICAgICByZXR1cm4gcmV0OwogfQorCit2
b2lkIGFyY2hfZXZ0Y2huX2luamVjdChzdHJ1Y3QgdmNwdSAqdikKK3sKKyNpZiBDT05GSUdfSFZN
CisgICAgaWYgKCBpc19odm1fdmNwdSh2KSApCisgICAgICAgIGh2bV9hc3NlcnRfZXZ0Y2huX2ly
cSh2KTsKKyNlbmRpZgorfQotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
