From: Amit Singh Tomar <amittomer25@gmail.com>
Subject: [PATCH] xen/arm: Fix platform name for Xilinx ZynqMP
Date: Thu, 25 Jan 2018 20:33:49 +0530
Message-ID: <1516892629-11398-1-git-send-email-amittomer25@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ieqt=eu=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1eej4Y-0008P0-EB
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 15:04:14 +0000
Received: by mail-pg0-x244.google.com with SMTP id w17so5212020pgv.6
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2018 07:04:12 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, Amit Singh Tomar <amittomer25@gmail.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzZWVtcyB0byBiZSBjb3B5L3Bhc3RlIGVycm9yLlRoaXMgcGF0Y2ggc2ltcGx5CnJlcGxh
Y2Ugc3RyaW5nIHhnZW5lX3N0b3JtIHdpdGggeGlsaW5rX3p5bXAgZm9yIHhpbGluawpwbGF0Zm9y
bS4KClNpZ25lZC1vZmYtYnk6IEFtaXQgU2luZ2ggVG9tYXIgPGFtaXR0b21lcjI1QGdtYWlsLmNv
bT4KLS0tCiB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3hpbGlueC16eW5xbXAuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMveGlsaW54LXp5bnFtcC5jIGIveGVuL2FyY2gvYXJtL3Bs
YXRmb3Jtcy94aWxpbngtenlucW1wLmMKaW5kZXggMmFkZWU5MS4uMzhmMmMxNiAxMDA2NDQKLS0t
IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy94aWxpbngtenlucW1wLmMKKysrIGIveGVuL2FyY2gv
YXJtL3BsYXRmb3Jtcy94aWxpbngtenlucW1wLmMKQEAgLTMyLDcgKzMyLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggenlucW1wX2JsYWNrbGlzdF9kZXZbXSBfX2luaXRj
b25zdCA9CiAgICAgeyAvKiBzZW50aW5lbCAqLyB9LAogfTsKIAotUExBVEZPUk1fU1RBUlQoeGdl
bmVfc3Rvcm0sICJYaWxpbnggWnlucU1QIikKK1BMQVRGT1JNX1NUQVJUKHhpbGlua196eW5xbXAs
ICJYaWxpbnggWnlucU1QIikKICAgICAuY29tcGF0aWJsZSA9IHp5bnFtcF9kdF9jb21wYXQsCiAg
ICAgLmJsYWNrbGlzdF9kZXYgPSB6eW5xbXBfYmxhY2tsaXN0X2RldiwKIFBMQVRGT1JNX0VORAot
LSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
