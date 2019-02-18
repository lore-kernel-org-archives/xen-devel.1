From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-next 2/9] xen/x86: Constify the parameter
 "d" in mfn_to_mfn
Date: Mon, 18 Feb 2019 11:35:53 +0000
Message-ID: <20190218113600.9540-3-julien.grall@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BVaE=QZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gvhDY-0001xf-UZ
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 11:36:12 +0000
In-Reply-To: <20190218113600.9540-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHBhcmFtZXRlciAiZCIgaG9sZHMgdGhlIGRvbWFpbiBhbmQgaXMgbm90IG1vZGlmaWVkIGJ5
IHRoZSBmdW5jdGlvbi4KU28gY29uc3RpZnkgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9wMm0uaAppbmRleCAyMDk1MDc2NTU2Li5iNjg1MmRjMTMzIDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS9hc20teDg2L3AybS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKQEAgLTUw
Niw3ICs1MDYsNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlX2luZm8gKmdldF9wYWdlX2Zy
b21fZ2ZuKAogfQogCiAvKiBHZW5lcmFsIGNvbnZlcnNpb24gZnVuY3Rpb24gZnJvbSBtZm4gdG8g
Z2ZuICovCi1zdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgbWZuX3RvX2dmbihzdHJ1Y3QgZG9t
YWluICpkLCBtZm5fdCBtZm4pCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgbWZuX3RvX2dm
bihjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBtZm5fdCBtZm4pCiB7CiAgICAgaWYgKCBwYWdpbmdf
bW9kZV90cmFuc2xhdGUoZCkgKQogICAgICAgICByZXR1cm4gZ2V0X2dwZm5fZnJvbV9tZm4obWZu
X3gobWZuKSk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
