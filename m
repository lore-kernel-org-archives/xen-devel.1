From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: [PATCH 2/3] libxl: Improve logging in libxl__build_dom()
Date: Thu,  8 Feb 2018 22:49:09 +0100
Message-ID: <20180208214910.10699-3-simon@invisiblethingslab.com>
References: <20180208214910.10699-1-simon@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/l4d=fc=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1eju5Z-000126-D4
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 21:50:41 +0000
In-Reply-To: <20180208214910.10699-1-simon@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

eGNfZG9tX3BhcnNlX2ltYWdlKCkgZG9lcyBub3Qgc2V0IGVycm5vIChhdCBsZWFzdCBpbiBtYW55
IGNvZGUgcGF0aHMpLgpTbyBMT0dFKCkgaXMgbm90IHVzZWZ1bC4KClNpZ25lZC1vZmYtYnk6IFNp
bW9uIEdhaXNlciA8c2ltb25AaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KLS0tCiB0b29scy9saWJ4
bC9saWJ4bF9kb20uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5jIGIvdG9vbHMv
bGlieGwvbGlieGxfZG9tLmMKaW5kZXggZWY4MzRlNjUyZC4uNTJiNjEzNzk0MyAxMDA2NDQKLS0t
IGEvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tLmMK
QEAgLTcxNSw3ICs3MTUsNyBAQCBzdGF0aWMgaW50IGxpYnhsX19idWlsZF9kb20obGlieGxfX2dj
ICpnYywgdWludDMyX3QgZG9taWQsCiAgICAgfQogI2VuZGlmCiAgICAgaWYgKCAocmV0ID0geGNf
ZG9tX3BhcnNlX2ltYWdlKGRvbSkpICE9IDAgKSB7Ci0gICAgICAgIExPR0UoRVJST1IsICJ4Y19k
b21fcGFyc2VfaW1hZ2UgZmFpbGVkIik7CisgICAgICAgIExPRyhFUlJPUiwgInhjX2RvbV9wYXJz
ZV9pbWFnZSBmYWlsZWQiKTsKICAgICAgICAgZ290byBvdXQ7CiAgICAgfQogICAgIGlmICggKHJl
dCA9IGxpYnhsX19hcmNoX2RvbWFpbl9pbml0X2h3X2Rlc2NyaXB0aW9uKGdjLCBpbmZvLCBzdGF0
ZSwgZG9tKSkgIT0gMCApIHsKLS0gCjIuMTUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
