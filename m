From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH v2 for-4.12] arm/p2m: call iommu iotlb flush if
 iommu exists and enabled
Date: Wed, 23 Jan 2019 14:50:07 +0200
Message-ID: <1548247807-20400-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5y24=P7=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gmHyu-0000GR-Sf
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 12:50:12 +0000
Received: by mail-lf1-x142.google.com with SMTP id p6so1513662lfc.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 04:50:11 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRha2luZyBkZWNp
c2lvbiBieSBgbmVlZF9pb21tdV9wdF9zeW5jKClgIG1ha2UgdXMgbmV2ZXIga2lja2luZwpgaW9t
bXVfaW90bGJfZmx1c2goKWAgZm9yIElPTU1VcyB3aGljaCBkbyBzaGFyZSBQMk0gd2l0aCBDUFUu
ClNvIGNoZWNrIGBoYXNfaW9tbXVfcHQoKWAgaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IEFuZHJp
aSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgogICAg
Rml4ZWQgYSBtaXNzcHJpbnQgYW5kIGEgbml0IGluIGEgY29tbWl0IG1lc3NhZ2UKCiB4ZW4vYXJj
aC9hcm0vcDJtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0v
cDJtLmMKaW5kZXggMjM5NGY5Ny4uMDU5YTM5MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3Ay
bS5jCisrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwpAQCAtMTAxOSw3ICsxMDE5LDcgQEAgc3RhdGlj
IGludCBfX3AybV9zZXRfZW50cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwKICAgICAgICAgICFt
Zm5fZXEobHBhZV9nZXRfbWZuKCplbnRyeSksIGxwYWVfZ2V0X21mbihvcmlnX3B0ZSkpICkKICAg
ICAgICAgcDJtX2ZyZWVfZW50cnkocDJtLCBvcmlnX3B0ZSwgbGV2ZWwpOwogCi0gICAgaWYgKCBu
ZWVkX2lvbW11X3B0X3N5bmMocDJtLT5kb21haW4pICYmCisgICAgaWYgKCBoYXNfaW9tbXVfcHQo
cDJtLT5kb21haW4pICYmCiAgICAgICAgICAobHBhZV9pc192YWxpZChvcmlnX3B0ZSkgfHwgbHBh
ZV9pc192YWxpZCgqZW50cnkpKSApCiAgICAgewogICAgICAgICB1bnNpZ25lZCBpbnQgZmx1c2hf
ZmxhZ3MgPSAwOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
