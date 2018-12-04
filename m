From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: [PATCH 2/2] xen/arm32: Remove __init prefixes from
 funcs that are used within CPU up flow
Date: Tue,  4 Dec 2018 13:42:25 +0200
Message-ID: <1543923745-29877-3-git-send-email-olekstysh@gmail.com>
References: <1543923745-29877-1-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=es3t=on=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gU96G-0005jQ-K7
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 11:42:48 +0000
Received: by mail-lf1-x142.google.com with SMTP id p86so11699417lfg.5
 for <xen-devel@lists.xenproject.org>; Tue, 04 Dec 2018 03:42:47 -0800 (PST)
In-Reply-To: <1543923745-29877-1-git-send-email-olekstysh@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com, sstabellini@kernel.org, mirela.simonovic@aggios.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhpcyBpcyBhIGZvbGxvdy11cCBwYXRjaCB0bwpjb21taXQgMDFhN2U4Y2NlZjZlN2Q1NzE4
YTI1MWFkNTg3NTY3YWZiZTcyMzMzMAp4ZW4vYXJtOiBSZW1vdmUgX19pbml0ZGF0YSBhbmQgX19p
bml0IHRvIGVuYWJsZSBDUFUgaG90cGx1ZwoKU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hj
aGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9h
cm0zMi9zbXBib290LmMgfCAyICstCiB4ZW4vYXJjaC9hcm0vcGxhdGZvcm0uYyAgICAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL3NtcGJvb3QuYyBiL3hlbi9hcmNoL2FybS9hcm0z
Mi9zbXBib290LmMKaW5kZXggMmE3N2YyOS4uZTczNjg2NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL2FybTMyL3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvc21wYm9vdC5jCkBA
IC0xNiw3ICsxNiw3IEBAIGludCBfX2luaXQgYXJjaF9jcHVfaW5pdChpbnQgY3B1LCBzdHJ1Y3Qg
ZHRfZGV2aWNlX25vZGUgKmRuKQogICAgIHJldHVybiAwOwogfQogCi1pbnQgX19pbml0IGFyY2hf
Y3B1X3VwKGludCBjcHUpCitpbnQgYXJjaF9jcHVfdXAoaW50IGNwdSkKIHsKICAgICByZXR1cm4g
cGxhdGZvcm1fY3B1X3VwKGNwdSk7CiB9CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZv
cm0uYyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybS5jCmluZGV4IDY5ODllNTguLjBiYTIwMDEgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybS5jCisrKyBiL3hlbi9hcmNoL2FybS9wbGF0
Zm9ybS5jCkBAIC05NSw3ICs5NSw3IEBAIGludCBfX2luaXQgcGxhdGZvcm1fc3BlY2lmaWNfbWFw
cGluZyhzdHJ1Y3QgZG9tYWluICpkKQogfQogCiAjaWZkZWYgQ09ORklHX0FSTV8zMgotaW50IF9f
aW5pdCBwbGF0Zm9ybV9jcHVfdXAoaW50IGNwdSkKK2ludCBwbGF0Zm9ybV9jcHVfdXAoaW50IGNw
dSkKIHsKICAgICBpZiAoIHBzY2lfdmVyICkKICAgICAgICAgcmV0dXJuIGNhbGxfcHNjaV9jcHVf
b24oY3B1KTsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
