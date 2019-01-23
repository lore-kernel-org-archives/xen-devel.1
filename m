From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [RFC] arm/p2m: call iommu iotlb flush if iommu exists
 and enabled
Date: Wed, 23 Jan 2019 12:12:14 +0200
Message-ID: <1548238334-23168-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5y24=P7=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gmFW8-0000xe-BR
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 10:12:20 +0000
Received: by mail-lj1-x244.google.com with SMTP id s5-v6so1363703ljd.12
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 02:12:18 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRha2luZyBkZWNp
c3Npb24gYnkgYG5lZWRfaW9tbXVfcHRfc3luYygpYCBtYWtlIHVzIG5ldmVyIGtpY2tpbmcKYGlv
bW11X2lvdGxiX2ZsdXNoKClgIGZvciBJT01NVXMgd2hpY2ggZG8gc2hhcmUgVExCIHdpdGggQ1BV
LgpTbyBjaGVjayBgaGFzX2lvbW11X3B0KClgIGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
aWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCgpKdWxpZW4sCgpDb3VsZCB5
b3UgcGxlYXNlIGxvb2sgYXQgdGhpcywgSU1PIHRoZXJlIGlzIGEgbWlzdGFrZSBoZXJlLgp4ODYg
dXNlcyBgbmVlZF9pb21tdV9wdF9zeW5jKClgIHRvIG1ha2UgZGVjaXNzaW9uIGlmIGlvbW11J3Mg
bWFwL3VubWFwIHNob3VsZCBiZSBhZGRpdGlvbmFsbHkgY2FsbGVkLgpCdXQgQVJNIGhhcyBubyBu
b24tc2hhcmVkIHB0IHN1cHBvcnQgaW4gdGhlIG1haW5saW5lLCBzbyB1c2luZyBgbmVlZF9pb21t
dV9wdF9zeW5jKClgIHNlZW1zIHRvIGJlIG9kZC4KCiB4ZW4vYXJjaC9hcm0vcDJtLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMKaW5kZXggMjM5NGY5
Ny4uMDU5YTM5MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jCisrKyBiL3hlbi9hcmNo
L2FybS9wMm0uYwpAQCAtMTAxOSw3ICsxMDE5LDcgQEAgc3RhdGljIGludCBfX3AybV9zZXRfZW50
cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwKICAgICAgICAgICFtZm5fZXEobHBhZV9nZXRfbWZu
KCplbnRyeSksIGxwYWVfZ2V0X21mbihvcmlnX3B0ZSkpICkKICAgICAgICAgcDJtX2ZyZWVfZW50
cnkocDJtLCBvcmlnX3B0ZSwgbGV2ZWwpOwogCi0gICAgaWYgKCBuZWVkX2lvbW11X3B0X3N5bmMo
cDJtLT5kb21haW4pICYmCisgICAgaWYgKCBoYXNfaW9tbXVfcHQocDJtLT5kb21haW4pICYmCiAg
ICAgICAgICAobHBhZV9pc192YWxpZChvcmlnX3B0ZSkgfHwgbHBhZV9pc192YWxpZCgqZW50cnkp
KSApCiAgICAgewogICAgICAgICB1bnNpZ25lZCBpbnQgZmx1c2hfZmxhZ3MgPSAwOwotLSAKMi43
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
