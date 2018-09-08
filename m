From: zhong jiang <zhongjiang@huawei.com>
Subject: [PATCH] net: xenbus: remove redundant condition check
 before debugfs_remove_recursive
Date: Sat, 8 Sep 2018 21:35:06 +0800
Message-ID: <1536413706-31838-1-git-send-email-zhongjiang__11519.8967665949$1536516771$gmane$org@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gf4b=lw=huawei.com=zhongjiang@srs-us1.protection.inumbo.net>)
 id 1fyda6-0005oM-NA
 for xen-devel@lists.xenproject.org; Sat, 08 Sep 2018 13:47:22 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: davem@davemloft.net, paul.durrant@citrix.com, wei.liu2@citrix.com
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

ZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlIGhhcyB0YWtlbiB0aGUgSVNfRVJSX09SX05VTEwgaW50
byBhY2NvdW50LiBKdXN0CnJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgY29uZGl0aW9uIGNoZWNrLgoK
U2lnbmVkLW9mZi1ieTogemhvbmcgamlhbmcgPHpob25namlhbmdAaHVhd2VpLmNvbT4KLS0tCiBk
cml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
eGVuLW5ldGJhY2sveGVuYnVzLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMuYwpp
bmRleCBjZDUxNDkyLi5mZTFkNTIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFj
ay94ZW5idXMuYworKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay94ZW5idXMuYwpAQCAtMjU0
LDggKzI1NCw3IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl9kZWJ1Z2ZzX2RlbGlmKHN0cnVjdCB4ZW52
aWYgKnZpZikKIAlpZiAoSVNfRVJSX09SX05VTEwoeGVuX25ldGJhY2tfZGJnX3Jvb3QpKQogCQly
ZXR1cm47CiAKLQlpZiAoIUlTX0VSUl9PUl9OVUxMKHZpZi0+eGVudmlmX2RiZ19yb290KSkKLQkJ
ZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKHZpZi0+eGVudmlmX2RiZ19yb290KTsKKwlkZWJ1Z2Zz
X3JlbW92ZV9yZWN1cnNpdmUodmlmLT54ZW52aWZfZGJnX3Jvb3QpOwogCXZpZi0+eGVudmlmX2Ri
Z19yb290ID0gTlVMTDsKIH0KICNlbmRpZiAvKiBDT05GSUdfREVCVUdfRlMgKi8KLS0gCjEuNy4x
Mi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
