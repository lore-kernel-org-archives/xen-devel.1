From: Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: [PATCH] x86: xen: remove the use of VLAIS
Date: Sun, 24 Dec 2017 13:02:47 -0500
Message-ID: <1514138567-20491-1-git-send-email-nick.desaulniers__44326.6905648217$1514138566$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=y6va=du=gmail.com=nick.desaulniers@srs-us1.protection.inumbo.net>)
 id 1eTAcH-0003Tc-2Z
 for xen-devel@lists.xenproject.org; Sun, 24 Dec 2017 18:03:17 +0000
Received: by mail-qt0-x244.google.com with SMTP id 33so41450649qtv.1
 for <xen-devel@lists.xenproject.org>; Sun, 24 Dec 2017 10:03:14 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Nick Desaulniers <nick.desaulniers@gmail.com>, ghackmann@google.com, linux-kernel@vger.kernel.org, mka@google.com, Ingo Molnar <mingo@redhat.com>, srhines@google.com, kees@google.com, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

VmFyaWFibGUgTGVuZ3RoIEFycmF5cyBJbiBTdHJ1Y3RzIChWTEFJUykgaXMgbm90IHN1cHBvcnRl
ZCBieSBDbGFuZywgYW5kCmZyb3duZWQgdXBvbiBieSBvdGhlcnMuCgpodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAxMy85LzIzLzUwMAoKSGVyZSwgdGhlIFZMQUlTIHdhcyB1c2VkIGJlY2F1c2UgdGhl
IHNpemUgb2YgdGhlIGJpdG1hcCByZXR1cm5lZCBmcm9tCnhlbl9tY19lbnRyeSgpIGRlcGVuZGVk
IG9uIHBvc3NpYmx5IChiYXNlZCBvbiBrZXJuZWwgY29uZmlndXJhdGlvbikKcnVudGltZSBzaXpl
ZCBkYXRhLiBSYXRoZXIgdGhhbiBkZWNsYXJpbmcgYXJncyBhcyBhIFZMQUlTIHRoZW4gY2FsbGlu
ZwpzaXplb2Ygb24gKmFyZ3MsIHdlIGNhbiBkZWZpbmUgdGhlIHZhcmlhYmxlIGxlbmd0aCBhcnJh
eSAobWFzaykgdG8gYmUgYQpwb2ludGVyLCBhbmQgY2FsY3VsYXRlIHRoZSBhcHByb3ByaWF0ZSBz
aXplb2YgYXJncyBtYW51YWxseS4gRnVydGhlciwgd2UKY2FuIGdldCByaWQgb2YgdGhlICNpZmRl
ZidzIGFuZCByZWx5IG9uIG51bV9wb3NzaWJsZV9jcHVzKCkgKHRoYW5rcyB0byBhCmhlbHBmdWwg
Y2hlY2twYXRjaCB3YXJuaW5nIGZyb20gYW4gZWFybGllciB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2gp
LgoKU2lnbmVkLW9mZi1ieTogTmljayBEZXNhdWxuaWVycyA8bmljay5kZXNhdWxuaWVyc0BnbWFp
bC5jb20+Ci0tLQogYXJjaC94ODYveGVuL21tdV9wdi5jIHwgMTAgKysrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni94ZW4vbW11X3B2LmMgYi9hcmNoL3g4Ni94ZW4vbW11X3B2LmMKaW5kZXggNGQ2MmMw
Ny4uOTY2OTc2YyAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL21tdV9wdi5jCisrKyBiL2FyY2gv
eDg2L3hlbi9tbXVfcHYuYwpAQCAtMTMyNSwyMCArMTMyNSwxOCBAQCBzdGF0aWMgdm9pZCB4ZW5f
Zmx1c2hfdGxiX290aGVycyhjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cywKIHsKIAlzdHJ1Y3Qg
ewogCQlzdHJ1Y3QgbW11ZXh0X29wIG9wOwotI2lmZGVmIENPTkZJR19TTVAKLQkJREVDTEFSRV9C
SVRNQVAobWFzaywgbnVtX3Byb2Nlc3NvcnMpOwotI2Vsc2UKLQkJREVDTEFSRV9CSVRNQVAobWFz
aywgTlJfQ1BVUyk7Ci0jZW5kaWYKKwkJdW5zaWduZWQgbG9uZyAqbWFzazsKIAl9ICphcmdzOwog
CXN0cnVjdCBtdWx0aWNhbGxfc3BhY2UgbWNzOworCWNvbnN0IHNpemVfdCBtY19lbnRyeV9zaXpl
ID0gc2l6ZW9mKGFyZ3MtPm9wKSArCisJCXNpemVvZigqYXJncy0+bWFzaykgKiBCSVRTX1RPX0xP
TkdTKG51bV9wb3NzaWJsZV9jcHVzKCkpOwogCiAJdHJhY2VfeGVuX21tdV9mbHVzaF90bGJfb3Ro
ZXJzKGNwdXMsIGluZm8tPm1tLCBpbmZvLT5zdGFydCwgaW5mby0+ZW5kKTsKIAogCWlmIChjcHVt
YXNrX2VtcHR5KGNwdXMpKQogCQlyZXR1cm47CQkvKiBub3RoaW5nIHRvIGRvICovCiAKLQltY3Mg
PSB4ZW5fbWNfZW50cnkoc2l6ZW9mKCphcmdzKSk7CisJbWNzID0geGVuX21jX2VudHJ5KG1jX2Vu
dHJ5X3NpemUpOwogCWFyZ3MgPSBtY3MuYXJnczsKIAlhcmdzLT5vcC5hcmcyLnZjcHVtYXNrID0g
dG9fY3B1bWFzayhhcmdzLT5tYXNrKTsKIAotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
