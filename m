From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC] x86/cpu: fix vendor string for Shanghai CPU
Date: Thu, 4 Apr 2019 15:11:32 +0100
Message-ID: <20190404141132.1417-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VYWF=SG=citrix.com=prvs=9901e81f4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hC37y-00030i-29
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 14:14:02 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: DavidWang <davidwang@zhaoxin.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNjOiBEYXZp
ZFdhbmcgPGRhdmlkd2FuZ0B6aGFveGluLmNvbT4KCk9yIHBlcmhhcHMgaXQgc2hvdWxkIGhhdmUg
YmVlbiBaaGFveGluPwotLS0KIHhlbi9hcmNoL3g4Ni9jcHUvc2hhbmdoYWkuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9jcHUvc2hhbmdoYWkuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvc2hhbmdoYWku
YwppbmRleCAyNGFmNWM4MjU5Li4zNmMxNzYzYzgxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
Y3B1L3NoYW5naGFpLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9zaGFuZ2hhaS5jCkBAIC0xNiw3
ICsxNiw3IEBAIHN0YXRpYyB2b2lkIGluaXRfc2hhbmdoYWkoc3RydWN0IGNwdWluZm9feDg2ICpj
KQogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGNwdV9kZXYgc2hhbmdoYWlfY3B1X2RldiA9IHsK
LSAgICAuY192ZW5kb3IgICA9ICIgIFNoYW5nIiwKKyAgICAuY192ZW5kb3IgICA9ICJTaGFuZ2hh
aSIsCiAgICAgLmNfaW5pdCAgICAgPSBpbml0X3NoYW5naGFpLAogfTsKIAotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
