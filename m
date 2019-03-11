From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v3 2/7] pygrub/fsimage: drop unused struct
Date: Mon, 11 Mar 2019 13:04:29 +0000
Message-ID: <20190311130434.10437-3-wei.liu2@citrix.com>
References: <20190311130434.10437-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZGF3=RO=citrix.com=prvs=966959e1a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h3Kbj-0004JG-LV
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 13:04:43 +0000
In-Reply-To: <20190311130434.10437-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9w
eWdydWIvc3JjL2ZzaW1hZ2UvZnNpbWFnZS5jIHwgNyAtLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9weWdydWIvc3JjL2ZzaW1hZ2UvZnNp
bWFnZS5jIGIvdG9vbHMvcHlncnViL3NyYy9mc2ltYWdlL2ZzaW1hZ2UuYwppbmRleCA3NDNhM2Zi
N2I4Li43ODAyMDc3OTFjIDEwMDY0NAotLS0gYS90b29scy9weWdydWIvc3JjL2ZzaW1hZ2UvZnNp
bWFnZS5jCisrKyBiL3Rvb2xzL3B5Z3J1Yi9zcmMvZnNpbWFnZS9mc2ltYWdlLmMKQEAgLTQzLDEz
ICs0Myw2IEBAIHR5cGVkZWYgc3RydWN0IGZzaW1hZ2VfZmlsZSB7CiAJZnNpX2ZpbGVfdCAqZmls
ZTsKIH0gZnNpbWFnZV9maWxlX3Q7CiAKLXN0cnVjdCBmb28gewotCWludCByZWY7Ci0JaW50IHNp
emU7Ci0JbG9uZyBoYXNoOwotCWludCBzdGF0ZTsKLX07Ci0KIHN0YXRpYyBQeU9iamVjdCAqCiBm
c2ltYWdlX2ZpbGVfcmVhZChmc2ltYWdlX2ZpbGVfdCAqZmlsZSwgUHlPYmplY3QgKmFyZ3MsIFB5
T2JqZWN0ICprd2FyZ3MpCiB7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
