From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 23/34] x86/oprofile: put SVM only code under
 CONFIG_HVM
Date: Fri, 17 Aug 2018 16:12:41 +0100
Message-ID: <d0ceec5357860e692c6cec2edbb3b99bfbc59ccd.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqggR-0001yD-7z
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:29:03 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvZGUgc25pcHBldCBpbiBxdWVzdGlvbiBpcyB0byBkZXRlY3QgTk1JIGhlbGQgYnkgU1ZN
IHVudGlsIFNUR0kKaXMgY2FsbGVkLiBXaGVuIFhlbiBkb2Vzbid0IGV2ZW4gc3VwcG9ydCBIVk0g
Z3Vlc3RzIHRoZXJlIGlzIG5vIG5lZWQKdG8gY2hlY2sgc3ZtX3N0Z2lfbGFiZWwuCgpTaWduZWQt
b2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9v
cHJvZmlsZS9vcF9tb2RlbF9hdGhsb24uYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvb3By
b2ZpbGUvb3BfbW9kZWxfYXRobG9uLmMgYi94ZW4vYXJjaC94ODYvb3Byb2ZpbGUvb3BfbW9kZWxf
YXRobG9uLmMKaW5kZXggMmQzNzYzYy4uM2Q2ZTI2ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L29wcm9maWxlL29wX21vZGVsX2F0aGxvbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9vcHJvZmlsZS9v
cF9tb2RlbF9hdGhsb24uYwpAQCAtMzE5LDkgKzMxOSwxMSBAQCBzdGF0aWMgaW50IGF0aGxvbl9j
aGVja19jdHJzKHVuc2lnbmVkIGludCBjb25zdCBjcHUsCiAJdW5zaWduZWQgbG9uZyBlaXAgPSBy
ZWdzLT5yaXA7CiAJaW50IG1vZGUgPSAwOwogCXN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsKLQlz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqZ3Vlc3RfcmVncyA9IGd1ZXN0X2NwdV91c2VyX3JlZ3MoKTsK
IAl1bnNpZ25lZCBpbnQgY29uc3QgbnJfY3RycyA9IG1vZGVsLT5udW1fY291bnRlcnM7CiAKKyNp
ZiBDT05GSUdfSFZNCisJc3RydWN0IGNwdV91c2VyX3JlZ3MgKmd1ZXN0X3JlZ3MgPSBndWVzdF9j
cHVfdXNlcl9yZWdzKCk7CisKIAlpZiAoIWd1ZXN0X21vZGUocmVncykgJiYKIAkgICAgKGVpcCA9
PSAodW5zaWduZWQgbG9uZylzdm1fc3RnaV9sYWJlbCkpIHsKIAkJLyogU1ZNIGd1ZXN0IHdhcyBy
dW5uaW5nIHdoZW4gTk1JIG9jY3VycmVkICovCkBAIC0zMjksNiArMzMxLDcgQEAgc3RhdGljIGlu
dCBhdGhsb25fY2hlY2tfY3Rycyh1bnNpZ25lZCBpbnQgY29uc3QgY3B1LAogCQllaXAgPSBndWVz
dF9yZWdzLT5yaXA7CiAJCW1vZGUgPSB4ZW5vcHJvZmlsZV9nZXRfbW9kZSh2LCBndWVzdF9yZWdz
KTsKIAl9IGVsc2UKKyNlbmRpZgogCQltb2RlID0geGVub3Byb2ZpbGVfZ2V0X21vZGUodiwgcmVn
cyk7CiAKIAlmb3IgKGkgPSAwIDsgaSA8IG5yX2N0cnM7ICsraSkgewotLSAKZ2l0LXNlcmllcyAw
LjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
