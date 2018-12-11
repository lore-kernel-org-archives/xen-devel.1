From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] x86: remove out label in spurious_interrupt
Date: Tue, 11 Dec 2018 11:55:15 +0000
Message-ID: <20181211115515.4757-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DjN1=OU=citrix.com=prvs=8762858e5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gWgdE-0005KW-0S
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 11:55:20 +0000
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

VGhlIG91dCBsYWJlbCBpcyBmb2xsb3dlZCBieSBhIHNlbWljb2xvbiBvbmx5LiBVc2UgcmV0dXJu
IGRpcmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
LS0tCiB4ZW4vYXJjaC94ODYvYXBpYy5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2FwaWMu
YyBiL3hlbi9hcmNoL3g4Ni9hcGljLmMKaW5kZXggNzEyMDEwN2IwYy4uYjA2ZWVkZjMyNiAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L2FwaWMuYworKysgYi94ZW4vYXJjaC94ODYvYXBpYy5jCkBA
IC0xNDA2LDE1ICsxNDA2LDEzIEBAIHZvaWQgc3B1cmlvdXNfaW50ZXJydXB0KHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzKQogICAgICAgICBpZiAodGhpc19jcHUoc3RhdGVfZHVtcF9wZW5kaW5n
KSkgewogICAgICAgICAgICAgdGhpc19jcHUoc3RhdGVfZHVtcF9wZW5kaW5nKSA9IGZhbHNlOwog
ICAgICAgICAgICAgZHVtcF9leGVjc3RhdGUocmVncyk7Ci0gICAgICAgICAgICBnb3RvIG91dDsK
KyAgICAgICAgICAgIHJldHVybjsKICAgICAgICAgfQogICAgIH0KIAogICAgIC8qIHNlZSBzdy1k
ZXYtbWFuIHZvbCAzLCBjaGFwdGVyIDcuNC4xMy41ICovCiAgICAgcHJpbnRrKEtFUk5fSU5GTyAi
c3B1cmlvdXMgQVBJQyBpbnRlcnJ1cHQgb24gQ1BVIyVkLCBzaG91bGQgIgogICAgICAgICAgICAi
bmV2ZXIgaGFwcGVuLlxuIiwgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKLQotb3V0OiA7CiB9CiAKIC8q
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
