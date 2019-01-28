From: Chao Gao <chao.gao@intel.com>
Subject: [PATCH v5 1/8] microcode/intel: remove redundent check
 against ucode size
Date: Mon, 28 Jan 2019 15:06:43 +0800
Message-ID: <1548659210-16870-2-git-send-email-chao.gao@intel.com>
References: <1548659210-16870-1-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lx6j=QE=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1go0wX-0000Ei-BS
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 07:02:53 +0000
In-Reply-To: <1548659210-16870-1-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBjaGVjayBoYXMgYmVlbiBkb25lIGluIG1pY3JvY29kZV9zYW5pdHlfY2hlY2soKS4gTmVl
ZG4ndCBkbyBpdAphZ2FpbiBpbiBnZXRfbWF0Y2hpbmdfbWljcm9jb2RlKCkuCgpTaWduZWQtb2Zm
LWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9taWNy
b2NvZGVfaW50ZWwuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2ludGVsLmMgYi94ZW4vYXJjaC94ODYv
bWljcm9jb2RlX2ludGVsLmMKaW5kZXggOTY1NzU3NS4uNGY2OWY0YSAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVf
aW50ZWwuYwpAQCAtMjQ2LDkgKzI0Niw2IEBAIHN0YXRpYyBpbnQgZ2V0X21hdGNoaW5nX21pY3Jv
Y29kZShjb25zdCB2b2lkICptYywgdW5zaWduZWQgaW50IGNwdSkKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbWNfaGVhZGVyLT5zaWcsIG1jX2hlYWRlci0+cGYpICkKICAgICAgICAg
Z290byBmaW5kOwogCi0gICAgaWYgKCB0b3RhbF9zaXplIDw9IChnZXRfZGF0YXNpemUobWNfaGVh
ZGVyKSArIE1DX0hFQURFUl9TSVpFKSApCi0gICAgICAgIHJldHVybiAwOwotCiAgICAgZXh0X2hl
YWRlciA9IG1jICsgZ2V0X2RhdGFzaXplKG1jX2hlYWRlcikgKyBNQ19IRUFERVJfU0laRTsKICAg
ICBleHRfc2lnY291bnQgPSBleHRfaGVhZGVyLT5jb3VudDsKICAgICBleHRfc2lnID0gKHZvaWQg
KilleHRfaGVhZGVyICsgRVhUX0hFQURFUl9TSVpFOwotLSAKMS44LjMuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
