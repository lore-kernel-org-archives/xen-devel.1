From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 15/62] ts-debian-di-install: use gho to
 pick d-i
Date: Wed, 10 Apr 2019 15:23:21 +0100
Message-ID: <20190410142408.22848-16-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAC-0006Cz-Ru
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:20 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZSBvcmlnaW5hbCBjb2RlIHVz
ZWQgaG8gd2hpY2ggZ2F2ZSB1cyB0aGUgaG9zdCBzdWl0ZSwgYnV0IHdlIHdhbnRlZAp0aGUgZ3Vl
c3Qgc3VpdGUuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpB
Y2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMt
ZGViaWFuLWRpLWluc3RhbGwgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdHMtZGViaWFuLWRpLWluc3RhbGwgYi90
cy1kZWJpYW4tZGktaW5zdGFsbAppbmRleCA2MDA3OTcxMi4uMzYxYTE3MTAgMTAwNzU1Ci0tLSBh
L3RzLWRlYmlhbi1kaS1pbnN0YWxsCisrKyBiL3RzLWRlYmlhbi1kaS1pbnN0YWxsCkBAIC0xNTIs
OCArMTUyLDggQEAgc3ViIHNldHVwX25ldGJvb3QoJCQkKQogCWRpZSBpZiAkcnsgIiRnaG8tPntH
dWVzdH1fbmV0Ym9vdF9rZXJuZWwiIH0KIAl8fCAgICAgJHJ7ICIkZ2hvLT57R3Vlc3R9X25ldGJv
b3RfcmFtZGlzayIgfTsKIAotCW15ICRkaV9wYXRoID0gJGN7VGZ0cFBhdGh9LicvJy4kaG8tPntU
ZnRwfXtEaUJhc2V9LicvJy4ke2FyY2h9LicvJy4KLQkgICAgZGViaWFuX2d1ZXN0X2RpX3ZlcnNp
b24oJGhvKS4nLScuJGhvLT57U3VpdGV9OworCW15ICRkaV9wYXRoID0gJGN7VGZ0cFBhdGh9Licv
Jy4kZ2hvLT57VGZ0cH17RGlCYXNlfS4nLycuJHthcmNofS4nLycuCisJICAgIGRlYmlhbl9ndWVz
dF9kaV92ZXJzaW9uKCRnaG8pLictJy4kZ2hvLT57U3VpdGV9OwogCiAgICAgICAgIGlmICgke2Fy
Y2h9ID1+IG0vYW1kNjR8aTM4Ni8pIHsKIAkgICAgJGtlcm5lbCA9ICIkZGlfcGF0aC92bWxpbnV6
LXhlbiI7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
