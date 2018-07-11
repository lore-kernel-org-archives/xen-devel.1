From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 3/4] PDU: ipmi: Only log the first cmd
 run
Date: Wed, 11 Jul 2018 15:54:06 +0100
Message-ID: <1531320847-10243-3-git-send-email-ian.jackson@eu.citrix.com>
References: <1531320847-10243-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ygtr=j3=citrix.com=prvs=723fa8a25=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fdGYH-00030X-H3
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 14:57:09 +0000
In-Reply-To: <1531320847-10243-1-git-send-email-ian.jackson@eu.citrix.com>
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

VGhpcyBxdWlldGVucyB0aGUgb3V0cHV0IGFnYWluLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9QRFUvaXBtaS5wbSB8
IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9QRFUvaXBtaS5wbSBiL09zc3Rlc3QvUERVL2lwbWkucG0K
aW5kZXggZjNhNTBjOS4uYjY2MjFkYiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9QRFUvaXBtaS5wbQor
KysgYi9Pc3N0ZXN0L1BEVS9pcG1pLnBtCkBAIC01MCwxMSArNTAsMTIgQEAgc3ViIHBkdV9wb3dl
cl9zdGF0ZSB7CiAgICAgbXkgJG9ub2ZmPSAkb24gPyAib24iIDogIm9mZiI7CiAKICAgICBteSBA
Y21kID0gKHF3KGlwbWl0b29sIC1IKSwgJG1vLT57TWdtdH0sCi0gICAgICAgICAgICAgICAnLVUn
LCRtby0+e1VzZXJ9LCAnLVAnLCRtby0+e1Bhc3N9KTsKKworICAgIG15ICRjbWRfbG9nZ2VkOwog
CiAgICAgbXkgJGdldHN0YXR1cyA9IHN1YiB7CiAgICAgICAgIG15IEBzY21kID0gKEBjbWQsIHF3
KHBvd2VyIHN0YXR1cykpOwotICAgICAgICBsb2dtKCJQRFUgSU1QSTogQHNjbWQiKTsKKyAgICAg
ICAgbG9nbSgiUERVIElNUEk6IEBzY21kIikgdW5sZXNzICRjbWRfbG9nZ2VkKys7CiAgICAgICAg
IG9wZW4gSVBNSSwgIi18IiwgQHNjbWQgb3IgZGllICQhOwogICAgICAgICBteSAkc3RhdHVzID0g
ZG8geyBsb2NhbCAkLz11bmRlZjsgPElQTUk+OyB9OwogICAgICAgICAkPz0wOyAkIT0wOwotLSAK
Mi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
