From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH v2 05/14] x86/spec_ctrl: Add Hygon Dhyana to the
 respective mitigation machinery
Date: Thu, 21 Feb 2019 17:51:35 +0800
Message-ID: <b2e0c2402d6170aff5064ef2f7c49c7732b0c3f9.1550647742.git.puwen@hygon.cn>
References: <cover.1550647742.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hIO5=Q4=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gwl1n-0001Q1-Nt
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 09:52:27 +0000
In-Reply-To: <cover.1550647742.git.puwen@hygon.cn>
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

VGhlIEh5Z29uIERoeWFuYSBDUFUgaGFzIHRoZSBzYW1lIHNwZWN1bGF0aXZlIGV4ZWN1dGlvbiBh
cyBBTUQgZmFtaWx5CjE3aCwgc28gc2hhcmUgQU1EIFJldHBvbGluZSBhbmQgUFRJIG1pdGlnYXRp
b24gY29kZSB3aXRoIEh5Z29uIERoeWFuYS4KClNpZ25lZC1vZmYtYnk6IFB1IFdlbiA8cHV3ZW5A
aHlnb24uY24+Ci0tLQogeGVuL2FyY2gveDg2L3NwZWNfY3RybC5jIHwgNiArKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L3NwZWNfY3RybC5jIGIveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCmluZGV4
IGFkNzJlY2QuLjM4YTZlZDIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYwor
KysgYi94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMKQEAgLTMwNiw3ICszMDYsOCBAQCBzdGF0aWMg
Ym9vbCBfX2luaXQgcmV0cG9saW5lX3NhZmUodWludDY0X3QgY2FwcykKIHsKICAgICB1bnNpZ25l
ZCBpbnQgdWNvZGVfcmV2ID0gdGhpc19jcHUodWNvZGVfY3B1X2luZm8pLmNwdV9zaWcucmV2Owog
Ci0gICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgKQor
ICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EIHx8Cisg
ICAgICAgICBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9IWUdPTiApCiAg
ICAgICAgIHJldHVybiB0cnVlOwogCiAgICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3Ig
IT0gWDg2X1ZFTkRPUl9JTlRFTCB8fApAQCAtNjEyLDcgKzYxMyw4IEBAIGludDhfdCBfX3JlYWRf
bW9zdGx5IG9wdF94cHRpX2RvbXUgPSAtMTsKIAogc3RhdGljIF9faW5pdCB2b2lkIHhwdGlfaW5p
dF9kZWZhdWx0KHVpbnQ2NF90IGNhcHMpCiB7Ci0gICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92
ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgKQorICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVu
ZG9yID09IFg4Nl9WRU5ET1JfQU1EIHx8CisgICAgICAgICBib290X2NwdV9kYXRhLng4Nl92ZW5k
b3IgPT0gWDg2X1ZFTkRPUl9IWUdPTiApCiAgICAgICAgIGNhcHMgPSBBUkNIX0NBUEFCSUxJVElF
U19SRENMX05POwogCiAgICAgaWYgKCBjYXBzICYgQVJDSF9DQVBBQklMSVRJRVNfUkRDTF9OTyAp
Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
