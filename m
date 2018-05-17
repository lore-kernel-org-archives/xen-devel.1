From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 01/10] Osstest/TestSupport: Use right
 arch for UEFI grub setup
Date: Thu, 17 May 2018 12:16:50 +0100
Message-ID: <1526555819-29883-2-git-send-email-ian.jackson@eu.citrix.com>
References: <1526555819-29883-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sats=ie=citrix.com=prvs=668e6091f=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fJGuV-0001nn-NW
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 11:17:27 +0000
In-Reply-To: <1526555819-29883-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rlc3RTdXBw
b3J0LnBtIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQppbmRleCA2ZDVlNjY3Li45ODNiYjE3IDEw
MDY0NAotLS0gYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCisrKyBiL09zc3Rlc3QvVGVzdFN1cHBv
cnQucG0KQEAgLTI2NDYsOCArMjY0Niw4IEBAIG1lbnVlbnRyeSAnbG9jYWwnIHsKICAgaW5zbW9k
IHBhcnRfZ3B0CiAgIGluc21vZCBwYXJ0X21zZG9zCiAgIHNldCByb290PShoZDAsZ3B0MSkKLSAg
ZWNobyAiQ2hhaW5sb2FkaW5nIChcJHtyb290fSkvRUZJL0JPT1QvQk9PVEFBNjQuRUZJIgotICBj
aGFpbmxvYWRlciAoXCR7cm9vdH0pL0VGSS9CT09UL0JPT1RBQTY0LkVGSQorICBlY2hvICJDaGFp
bmxvYWRpbmcgKFwke3Jvb3R9KS9FRkkvQk9PVC9CT09UJGVmaS5FRkkiCisgIGNoYWlubG9hZGVy
IChcJHtyb290fSkvRUZJL0JPT1QvQk9PVCRlZmkuRUZJCiAgIGJvb3QKIH0KIEVORAotLSAKMi4x
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
