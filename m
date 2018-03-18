From: Amit Singh Tomar <amittomer25@gmail.com>
Subject: [PATCH v2] xen/arm: Fix platform name to xilinx_zynqmp
	from xgene_storm
Date: Sun, 18 Mar 2018 14:50:26 +0530
Message-ID: <1521364826-25757-1-git-send-email-amittomer25@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vq/t=gi=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1exUUc-0002K6-4a
 for xen-devel@lists.xenproject.org; Sun, 18 Mar 2018 09:20:42 +0000
Received: by mail-pg0-x243.google.com with SMTP id g8so2648945pgq.13
 for <xen-devel@lists.xenproject.org>; Sun, 18 Mar 2018 02:20:40 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: edgar.iglesias@xilinx.com, andre.przywara@arm.com, julien.grall@arm.com, sstabellini@kernel.org, Amit Singh Tomar <amittomer25@gmail.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQW1pdCBTaW5naCBUb21hciA8YW1pdHRvbWVyMjVAZ21haWwuY29tPgot
LS0KQ2hhbmdlcyBzaW5jZSB2MToKCSogQWRkcmVzc2VkIEFuZHJlJ3MgY29tbWVudC4KLS0tCiB4
ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3hpbGlueC16eW5xbXAuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9wbGF0Zm9ybXMveGlsaW54LXp5bnFtcC5jIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy94
aWxpbngtenlucW1wLmMKaW5kZXggMmFkZWU5MS4uZDhjZWRlZCAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gvYXJtL3BsYXRmb3Jtcy94aWxpbngtenlucW1wLmMKKysrIGIveGVuL2FyY2gvYXJtL3BsYXRm
b3Jtcy94aWxpbngtenlucW1wLmMKQEAgLTMyLDcgKzMyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkdF9kZXZpY2VfbWF0Y2ggenlucW1wX2JsYWNrbGlzdF9kZXZbXSBfX2luaXRjb25zdCA9CiAg
ICAgeyAvKiBzZW50aW5lbCAqLyB9LAogfTsKIAotUExBVEZPUk1fU1RBUlQoeGdlbmVfc3Rvcm0s
ICJYaWxpbnggWnlucU1QIikKK1BMQVRGT1JNX1NUQVJUKHhpbGlueF96eW5xbXAsICJYaWxpbngg
WnlucU1QIikKICAgICAuY29tcGF0aWJsZSA9IHp5bnFtcF9kdF9jb21wYXQsCiAgICAgLmJsYWNr
bGlzdF9kZXYgPSB6eW5xbXBfYmxhY2tsaXN0X2RldiwKIFBMQVRGT1JNX0VORAotLSAKMS45LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
