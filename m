From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 51/74] xen/pvshim: don't allow access to
	iomem or ioports
Date: Thu, 4 Jan 2018 13:06:02 +0000
Message-ID: <20180104130625.28605-52-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5aZ-0006OK-2i
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:29:43 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNo
L3g4Ni9kb20wX2J1aWxkLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jIGIveGVuL2FyY2gveDg2
L2RvbTBfYnVpbGQuYwppbmRleCBiZjk5MmZlZjZkLi4zNTdmZDg3ZjM5IDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMK
QEAgLTE2LDYgKzE2LDcgQEAKICNpbmNsdWRlIDxhc20vaHBldC5oPgogI2luY2x1ZGUgPGFzbS9p
b19hcGljLmg+CiAjaW5jbHVkZSA8YXNtL3AybS5oPgorI2luY2x1ZGUgPGFzbS9wdi9zaGltLmg+
CiAjaW5jbHVkZSA8YXNtL3NldHVwLmg+CiAKIHN0YXRpYyBsb25nIF9faW5pdGRhdGEgZG9tMF9u
cnBhZ2VzOwpAQCAtMzg1LDYgKzM4Niw5IEBAIGludCBfX2luaXQgZG9tMF9zZXR1cF9wZXJtaXNz
aW9ucyhzdHJ1Y3QgZG9tYWluICpkKQogICAgIHVuc2lnbmVkIGludCBpOwogICAgIGludCByYzsK
IAorICAgIGlmICggcHZfc2hpbSApCisgICAgICAgIHJldHVybiAwOworCiAgICAgLyogVGhlIGhh
cmR3YXJlIGRvbWFpbiBpcyBpbml0aWFsbHkgcGVybWl0dGVkIGZ1bGwgSS9PIGNhcGFiaWxpdGll
cy4gKi8KICAgICByYyA9IGlvcG9ydHNfcGVybWl0X2FjY2VzcyhkLCAwLCAweEZGRkYpOwogICAg
IHJjIHw9IGlvbWVtX3Blcm1pdF9hY2Nlc3MoZCwgMFVMLCAoMVVMIDw8IChwYWRkcl9iaXRzIC0g
UEFHRV9TSElGVCkpIC0gMSk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
