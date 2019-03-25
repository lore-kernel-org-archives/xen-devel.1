From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH v3 02/14] x86/cpu/mtrr: Add Hygon Dhyana support
 to get TOP_MEM2
Date: Mon, 25 Mar 2019 21:30:05 +0800
Message-ID: <96b4704ee96795f524663fd8671a8bfef9d8baa1.1553520193.git.puwen@hygon.cn>
References: <cover.1553520193.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4Lz9=R4=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1h8Pjs-0002h1-4y
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 13:34:08 +0000
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

VGhlIEh5Z29uIERoeWFuYSBDUFUgc3VwcG9ydHMgdGhlIE1TUiB3YXkgdG8gZ2V0IFRPUF9NRU0y
LiBTbyBhZGQgSHlnb24KRGh5YW5hIHN1cHBvcnQgdG8gcHJpbnQgdGhlIHZhbHVlIG9mIFRPUF9N
RU0yLgoKU2lnbmVkLW9mZi1ieTogUHUgV2VuIDxwdXdlbkBoeWdvbi5jbj4KQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvY3B1L210cnIv
Z2VuZXJpYy5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L210cnIvZ2VuZXJpYy5j
IGIveGVuL2FyY2gveDg2L2NwdS9tdHJyL2dlbmVyaWMuYwppbmRleCA4ZjljZjFiLi45NGVlN2Q2
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L210cnIvZ2VuZXJpYy5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9jcHUvbXRyci9nZW5lcmljLmMKQEAgLTIxNyw4ICsyMTcsOSBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgcHJpbnRfbXRycl9zdGF0ZShjb25zdCBjaGFyICpsZXZlbCkKIAkJCXByaW50aygi
JXMgICV1IGRpc2FibGVkXG4iLCBsZXZlbCwgaSk7CiAJfQogCi0JaWYgKGJvb3RfY3B1X2RhdGEu
eDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0FNRAotCSAgICAmJiBib290X2NwdV9kYXRhLng4NiA+
PSAweGYpIHsKKwlpZiAoKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0FN
RCAmJgorCSAgICAgYm9vdF9jcHVfZGF0YS54ODYgPj0gMHhmKSB8fAorCSAgICAgYm9vdF9jcHVf
ZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfSFlHT04pIHsKIAkJdWludDY0X3Qgc3lzY2Zn
LCB0b20yOwogCiAJCXJkbXNybChNU1JfSzhfU1lTQ0ZHLCBzeXNjZmcpOwotLSAKMi43LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
