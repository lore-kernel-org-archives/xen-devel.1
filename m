From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH 02/15] x86/cpu/mtrr: Add Hygon Dhyana support to
 get TOP_MEM2
Date: Thu, 20 Dec 2018 21:12:06 +0800
Message-ID: <9df3ea1072c9b0c3cc0422fce4adf0cb7cb48c9a.1545284932.git.puwen@hygon.cn>
References: <cover.1545284932.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VrHp=O5=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gZy8m-0001kc-1Q
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 13:13:28 +0000
In-Reply-To: <cover.1545284932.git.puwen@hygon.cn>
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

VGhlIEh5Z29uIERoeWFuYSBDUFUgc3VwcG9ydHMgdGhlIE1TUiB3YXkgdG8gZ2V0IFRPUF9NRU0y
LiBTbyBhZGQgSHlnb24KRGh5YW5hIHN1cHBvcnQgdG8gcHJpbnQgdGhlIHZhbHVlIG9mIFRPUF9N
RU0yLgoKU2lnbmVkLW9mZi1ieTogUHUgV2VuIDxwdXdlbkBoeWdvbi5jbj4KLS0tCiB4ZW4vYXJj
aC94ODYvY3B1L210cnIvZ2VuZXJpYy5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1
L210cnIvZ2VuZXJpYy5jIGIveGVuL2FyY2gveDg2L2NwdS9tdHJyL2dlbmVyaWMuYwppbmRleCA4
ZjljZjFiLi45NGVlN2Q2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L210cnIvZ2VuZXJp
Yy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbXRyci9nZW5lcmljLmMKQEAgLTIxNyw4ICsyMTcs
OSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJpbnRfbXRycl9zdGF0ZShjb25zdCBjaGFyICpsZXZl
bCkKIAkJCXByaW50aygiJXMgICV1IGRpc2FibGVkXG4iLCBsZXZlbCwgaSk7CiAJfQogCi0JaWYg
KGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0FNRAotCSAgICAmJiBib290
X2NwdV9kYXRhLng4NiA+PSAweGYpIHsKKwlpZiAoKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9
PSBYODZfVkVORE9SX0FNRCAmJgorCSAgICAgYm9vdF9jcHVfZGF0YS54ODYgPj0gMHhmKSB8fAor
CSAgICAgYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfSFlHT04pIHsKIAkJ
dWludDY0X3Qgc3lzY2ZnLCB0b20yOwogCiAJCXJkbXNybChNU1JfSzhfU1lTQ0ZHLCBzeXNjZmcp
OwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
