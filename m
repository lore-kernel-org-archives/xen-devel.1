From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH v3 05/14] x86/spec_ctrl: Add Hygon Dhyana to the
 respective mitigation machinery
Date: Mon, 25 Mar 2019 21:30:35 +0800
Message-ID: <61342ea12a448e2bc0f340643ff4c802399f155e.1553520193.git.puwen@hygon.cn>
References: <cover.1553520193.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4Lz9=R4=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1h8Pk1-0002iV-GH
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 13:34:17 +0000
In-Reply-To: <cover.1553520193.git.puwen@hygon.cn>
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
aHlnb24uY24+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQog
eGVuL2FyY2gveDg2L3NwZWNfY3RybC5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3Nw
ZWNfY3RybC5jIGIveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCmluZGV4IDExNzFjMDIuLjFjZDc5
MDMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYworKysgYi94ZW4vYXJjaC94
ODYvc3BlY19jdHJsLmMKQEAgLTMwNiw3ICszMDYsOCBAQCBzdGF0aWMgYm9vbCBfX2luaXQgcmV0
cG9saW5lX3NhZmUodWludDY0X3QgY2FwcykKIHsKICAgICB1bnNpZ25lZCBpbnQgdWNvZGVfcmV2
ID0gdGhpc19jcHUodWNvZGVfY3B1X2luZm8pLmNwdV9zaWcucmV2OwogCi0gICAgaWYgKCBib290
X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgKQorICAgIGlmICggYm9vdF9j
cHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EIHx8CisgICAgICAgICBib290X2Nw
dV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9IWUdPTiApCiAgICAgICAgIHJldHVybiB0
cnVlOwogCiAgICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9J
TlRFTCB8fApAQCAtNjMyLDcgKzYzMyw4IEBAIGludDhfdCBfX3JlYWRfbW9zdGx5IG9wdF94cHRp
X2RvbXUgPSAtMTsKIAogc3RhdGljIF9faW5pdCB2b2lkIHhwdGlfaW5pdF9kZWZhdWx0KHVpbnQ2
NF90IGNhcHMpCiB7Ci0gICAgaWYgKCBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZF
TkRPUl9BTUQgKQorICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5E
T1JfQU1EIHx8CisgICAgICAgICBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRP
Ul9IWUdPTiApCiAgICAgICAgIGNhcHMgPSBBUkNIX0NBUFNfUkRDTF9OTzsKIAogICAgIGlmICgg
Y2FwcyAmIEFSQ0hfQ0FQU19SRENMX05PICkKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
