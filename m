From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 01/15] TestSupport: target_var:
 Refactor to allow for another host case
Date: Wed, 1 May 2019 11:48:25 +0100
Message-ID: <20190501104839.21621-2-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmn8-0005Tv-Fx
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:46 +0000
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
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

TWFrZSBhbiBleHBsaWNpdCBsaXN0IG9mIHRoZSBwcmVmaXhlcyBhbmQgYSBsb29wIHRvIHdhbGsg
b3ZlciB0aGVtLgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQu
cG0gfCAxNiArKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIv
T3NzdGVzdC9UZXN0U3VwcG9ydC5wbQppbmRleCA4ZTIwMjQ0ZC4uZjM1NzQzNGYgMTAwNjQ0Ci0t
LSBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KKysrIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQpA
QCAtMjQ4NSwxMCArMjQ4NSwxOCBAQCBzdWIgdGFyZ2V0X3Zhcl9wcmVmaXggKCQpIHsKIAogc3Vi
IHRhcmdldF92YXIgKCQkKSB7CiAgICAgbXkgKCRobywkdm4pID0gQF87Ci0gICAgbXkgJHBmeCA9
IHRhcmdldF92YXJfcHJlZml4KCRobyk7Ci0gICAgbXkgJGFsbHRoaW5nID0gZXhpc3RzICRoby0+
e0d1ZXN0fSA/ICJndWVzdCIgOiAiaG9zdCI7Ci0gICAgcmV0dXJuICRyeyAkcGZ4LiAkdm4gfSAv
LwotICAgICAgICAgICAkcnsgImFsbF8ke2FsbHRoaW5nfV8ke3ZufSIgfTsKKyAgICBteSBAcHJl
Zml4ZXM7CisgICAgcHVzaCBAcHJlZml4ZXMsIHRhcmdldF92YXJfcHJlZml4KCRobyk7CisgICAg
aWYgKGV4aXN0cyAkaG8tPntHdWVzdH0pIHsKKwlwdXNoIEBwcmVmaXhlcywgJ2FsbF9ndWVzdF8n
OworICAgIH0gZWxzZSB7CisJcHVzaCBAcHJlZml4ZXMsICdhbGxfaG9zdF8nOworICAgIH0KKyAg
ICBmb3JlYWNoIG15ICRwcmVmaXggKEBwcmVmaXhlcykgeworCW15ICR2ID0gJHJ7ICRwcmVmaXgu
JHZuIH07CisJcmV0dXJuICR2IGlmIGRlZmluZWQgJHY7CisgICAgfQorICAgIHJldHVybiB1bmRl
ZjsKIH0KIAogc3ViIHRhcmdldF9rZXJua2luZF9jaGVjayAoJCkgewotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
