From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH v2 2/2] arm/irq: skip action availability check
 for non-debug build
Date: Wed, 12 Dec 2018 20:20:55 +0200
Message-ID: <1544638855-9432-3-git-send-email-andrii.anisov@gmail.com>
References: <1544638855-9432-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX983-0008ED-8Q
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 18:21:03 +0000
Received: by mail-lj1-x22c.google.com with SMTP id s5-v6so17101752ljd.12
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 10:21:02 -0800 (PST)
In-Reply-To: <1544638855-9432-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClVuZGVyIGRlc2Mt
PmxvY2sgdGFrZW46CkFuIElSUSB3aXRoIF9JUlFfR1VFU1QgZmxhZyBzZXQgYWx3YXlzIGhhcyBh
biBhY3Rpb24uCkFuIElSUSB3aXRoIF9JUlFfRElTQUJMRUQgZmxhZyBjbGVhcmVkIGFsd2F5cyBo
YXMgYW4gYWN0aW9uLgpUaG9zZSBmbGFncyBjaGVja3MgY292ZXIgYWxsIGFjY2Vzc2VzIHRvIGRl
c2MtPmFjdGlvbiBpbiBkb19JUlEsCnNvIHdlIGNhbiBza2lwIGRlc2MtPmFjdGlvbiBjaGVjayBp
biBub24tZGVidWcgYnVpbGQuCktlZXAgaW4gcGxhY2UgZm9yIGRlYnVnIGJ1aWxkIHRvIGhlbHAg
ZGlhZ25vc3RpY3MgcG90ZW50aWFsCm1pc2NvbmZpZ3VyYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBB
bmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9p
cnEuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMKaW5kZXggZDZhMDI3My4u
NGEwMmNjMSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2lycS5jCisrKyBiL3hlbi9hcmNoL2Fy
bS9pcnEuYwpAQCAtMjA5LDEyICsyMDksMTQgQEAgdm9pZCBkb19JUlEoc3RydWN0IGNwdV91c2Vy
X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGludCBpcnEsIGludCBpc19maXEpCiAgICAgc3Bpbl9sb2Nr
KCZkZXNjLT5sb2NrKTsKICAgICBkZXNjLT5oYW5kbGVyLT5hY2soZGVzYyk7CiAKKyNpZm5kZWYg
TkRFQlVHCiAgICAgaWYgKCAhZGVzYy0+YWN0aW9uICkKICAgICB7CiAgICAgICAgIHByaW50aygi
VW5rbm93biAlcyAlIzMuM3hcbiIsCiAgICAgICAgICAgICAgICBpc19maXEgPyAiRklRIiA6ICJJ
UlEiLCBpcnEpOwogICAgICAgICBnb3RvIG91dDsKICAgICB9CisjZW5kaWYKIAogICAgIGlmICgg
dGVzdF9iaXQoX0lSUV9HVUVTVCwgJmRlc2MtPnN0YXR1cykgKQogICAgIHsKLS0gCjIuNy40CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
