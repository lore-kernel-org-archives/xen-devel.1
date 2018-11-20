From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] x86/acpi,
 x86/boot: Take RSDP address from boot params if available
Date: Tue, 20 Nov 2018 08:22:45 +0100
Message-ID: <20181120072245.5378-3-jgross__28235.1521928378$1542698499$gmane$org@suse.com>
References: <20181120072245.5378-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vCZp=N7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gP0N2-0007Lp-4F
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 07:22:52 +0000
In-Reply-To: <20181120072245.5378-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, dkiper@oracle.com, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

SW4gY2FzZSB0aGUgUlNEUCBhZGRyZXNzIGluIHN0cnVjdCBib290X3BhcmFtcyBpcyBzcGVjaWZp
ZWQgZG9uJ3QgdHJ5CnRvIGZpbmQgdGhlIHRhYmxlIGJ5IHNlYXJjaGluZywgYnV0IHRha2UgdGhl
IGFkZHJlc3MgZGlyZWN0bHkgYXMgc2V0CmJ5IHRoZSBib290IGxvYWRlci4KClNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRl
L3VhcGkvYXNtL2Jvb3RwYXJhbS5oIHwgMyArKy0KIGFyY2gveDg2L2tlcm5lbC9hY3BpL2Jvb3Qu
YyAgICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2Jvb3Rw
YXJhbS5oIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9ib290cGFyYW0uaAppbmRleCBhMDZj
YmYwMTk3NDQuLjYwNzMzZjEzN2U5YSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS91YXBp
L2FzbS9ib290cGFyYW0uaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2Jvb3RwYXJh
bS5oCkBAIC0xNTUsNyArMTU1LDggQEAgc3RydWN0IGJvb3RfcGFyYW1zIHsKIAlfX3U4ICBfcGFk
Mls0XTsJCQkJCS8qIDB4MDU0ICovCiAJX191NjQgIHRib290X2FkZHI7CQkJCS8qIDB4MDU4ICov
CiAJc3RydWN0IGlzdF9pbmZvIGlzdF9pbmZvOwkJCS8qIDB4MDYwICovCi0JX191OCAgX3BhZDNb
MTZdOwkJCQkvKiAweDA3MCAqLworCV9fdTY0IGFjcGlfcnNkcF9hZGRyOwkJCQkvKiAweDA3MCAq
LworCV9fdTggIF9wYWQzWzhdOwkJCQkJLyogMHgwNzggKi8KIAlfX3U4ICBoZDBfaW5mb1sxNl07
CS8qIG9ic29sZXRlISAqLwkJLyogMHgwODAgKi8KIAlfX3U4ICBoZDFfaW5mb1sxNl07CS8qIG9i
c29sZXRlISAqLwkJLyogMHgwOTAgKi8KIAlzdHJ1Y3Qgc3lzX2Rlc2NfdGFibGUgc3lzX2Rlc2Nf
dGFibGU7IC8qIG9ic29sZXRlISAqLwkvKiAweDBhMCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
a2VybmVsL2FjcGkvYm9vdC5jIGIvYXJjaC94ODYva2VybmVsL2FjcGkvYm9vdC5jCmluZGV4IGZi
M2IxZjNhNWFiYS4uMDY2MzVmYmNhODFjIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvYWNw
aS9ib290LmMKKysrIGIvYXJjaC94ODYva2VybmVsL2FjcGkvYm9vdC5jCkBAIC0xNzc2LDUgKzE3
NzYsNSBAQCB2b2lkIF9faW5pdCBhcmNoX3Jlc2VydmVfbWVtX2FyZWEoYWNwaV9waHlzaWNhbF9h
ZGRyZXNzIGFkZHIsIHNpemVfdCBzaXplKQogCiB1NjQgeDg2X2RlZmF1bHRfZ2V0X3Jvb3RfcG9p
bnRlcih2b2lkKQogewotCXJldHVybiAwOworCXJldHVybiBib290X3BhcmFtcy5hY3BpX3JzZHBf
YWRkcjsKIH0KLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
