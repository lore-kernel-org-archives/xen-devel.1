From: zhong jiang <zhongjiang@huawei.com>
Subject: [PATCH] xen-netback: remove unecessary condition check
 before debugfs_remove_recursive
Date: Sat, 8 Sep 2018 21:53:42 +0800
Message-ID: <1536414822-32911-1-git-send-email-zhongjiang__37406.0405222282$1536516773$gmane$org@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gf4b=lw=huawei.com=zhongjiang@srs-us1.protection.inumbo.net>)
 id 1fyds6-00079U-3T
 for xen-devel@lists.xenproject.org; Sat, 08 Sep 2018 14:05:58 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: davem@davemloft.net, paul.durrant@citrix.com, wei.liu2@citrix.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

ZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlIGhhcyB0YWtlbiBJU19FUlJfT1JfTlVMTCBpbnRvIGFj
Y291bnQuIFNvIGp1c3QKcmVtb3ZlIHRoZSBjb25kaXRpb24gY2hlY2sgYmVmb3JlIGRlYnVnZnNf
cmVtb3ZlX3JlY3Vyc2l2ZS4KClNpZ25lZC1vZmYtYnk6IHpob25nIGppYW5nIDx6aG9uZ2ppYW5n
QGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9uZXQveGVuLW5ldGJhY2svbmV0YmFjay5jIHwgMyAr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9uZXRiYWNrLmMgYi9kcml2ZXJzL25ldC94
ZW4tbmV0YmFjay9uZXRiYWNrLmMKaW5kZXggMzYyMWUwNS4uODBhYWUzYSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9uZXQveGVuLW5ldGJhY2svbmV0YmFjay5jCisrKyBiL2RyaXZlcnMvbmV0L3hlbi1u
ZXRiYWNrL25ldGJhY2suYwpAQCAtMTY2MCw4ICsxNjYwLDcgQEAgc3RhdGljIGludCBfX2luaXQg
bmV0YmFja19pbml0KHZvaWQpCiBzdGF0aWMgdm9pZCBfX2V4aXQgbmV0YmFja19maW5pKHZvaWQp
CiB7CiAjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCi0JaWYgKCFJU19FUlJfT1JfTlVMTCh4ZW5fbmV0
YmFja19kYmdfcm9vdCkpCi0JCWRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZSh4ZW5fbmV0YmFja19k
Ymdfcm9vdCk7CisJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKHhlbl9uZXRiYWNrX2RiZ19yb290
KTsKICNlbmRpZiAvKiBDT05GSUdfREVCVUdfRlMgKi8KIAl4ZW52aWZfeGVuYnVzX2ZpbmkoKTsK
IH0KLS0gCjEuNy4xMi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
