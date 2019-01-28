From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH for-4.12] arm/p2m: do not invalidate p2m root if
 it is shared with IOMMU
Date: Mon, 28 Jan 2019 17:34:54 +0200
Message-ID: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M9ZJ=QE=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1go8w8-0000Sm-1J
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 15:35:00 +0000
Received: by mail-lj1-x243.google.com with SMTP id n18-v6so14591790lji.7
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jan 2019 07:34:59 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkluIGNhc2UgaWYg
dGhlIHAybSB0YWJsZSBpcyBzaGFyZWQgdG8gSU9NTVUsIGludmFsaWRhdGluZyBpdCB0dXJucyBJ
T01NVSB0bwp0cmFuc2xhdGlvbiBmYXVsdHMgdGhhdCBjb3VsZCBiZSBub3QgcmVwYWlyZWQuCgpG
aXhlZCBwYXRjaCBjaGVjayBmb3IgdGhlIGNvcnJlc3BvbmRlZCBjb25kaXRpb24gYW5kIGhhcyBh
IGNvbW1lbnQgZm9yIG9uZQppbnRyb2R1Y2VkIHAybV9pbnZhbGlkYXRlX3Jvb3QoKSBjYWxsLCBi
dXQgbWlzcyB0aGVtIGZvciBhbm90aGVyLiBTbyBwdXQgdGhlCmBpZmAgYW5kIHRoZSBjb21tZW50
IGluIHBsYWNlLgoKRml4ZXM6IDIxNDhhMTIgKCJ4ZW4vYXJtOiBUcmFjayBwYWdlIGFjY2Vzc2Vk
IGJldHdlZW4gYmF0Y2ggb2YgU2V0L1dheSBvcGVyYXRpb25zIikKU2lnbmVkLW9mZi1ieTogQW5k
cmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vcDJt
LmMgfCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJt
LmMKaW5kZXggMDU5YTM5MS4uMjM2N2UwOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3AybS5j
CisrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwpAQCAtMTcwOCw4ICsxNzA4LDEzIEBAIHZvaWQgcDJt
X2ZsdXNoX3ZtKHN0cnVjdCB2Y3B1ICp2KQogICAgIC8qCiAgICAgICogSW52YWxpZGF0ZSB0aGUg
cDJtIHRvIHRyYWNrIHdoaWNoIHBhZ2Ugd2FzIG1vZGlmaWVkIGJ5IHRoZSBndWVzdAogICAgICAq
IGJldHdlZW4gY2FsbCBvZiBwMm1fZmx1c2hfdm0oKS4KKyAgICAgKgorICAgICAqIFRoaXMgaXMg
b25seSB0dXJuZWQgd2hlbiBJT01NVSBpcyBub3QgdXNlZCBvciB0aGUgcGFnZS10YWJsZSBhcmUK
KyAgICAgKiBub3Qgc2hhcmVkIGJlY2F1c2UgYml0WzBdIChlLmcgdmFsaWQgYml0KSB1bnNldCB3
aWxsIHJlc3VsdAorICAgICAqIElPTU1VIGZhdWx0IHRoYXQgY291bGQgYmUgbm90IGZpeGVkLXVw
LgogICAgICAqLwotICAgIHAybV9pbnZhbGlkYXRlX3Jvb3QocDJtKTsKKyAgICBpZiAoICFpb21t
dV91c2VfaGFwX3B0KHYtPmRvbWFpbikgKQorICAgICAgICBwMm1faW52YWxpZGF0ZV9yb290KHAy
bSk7CiAKICAgICB2LT5hcmNoLm5lZWRfZmx1c2hfdG9fcmFtID0gZmFsc2U7CiB9Ci0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
