From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [RFC 06/16] gic: drop interrupts enabling on interrupts
 processing
Date: Wed, 28 Nov 2018 23:32:01 +0200
Message-ID: <1543440731-21947-7-git-send-email-andrii.anisov@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jfkv=oh=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gS7RY-00006F-La
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 21:32:24 +0000
Received: by mail-lj1-x242.google.com with SMTP id v1-v6so24845415ljd.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 13:32:23 -0800 (PST)
In-Reply-To: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoaXMgcmVkdWNl
cyB0aGUgbnVtYmVyIG9mIGNvbnRleHQgc3dpdGNoZXMgaW4gY2FzZSB3ZSBoYXZlIGFuCmludGVy
cnVwdCBzdG9ybS4gV2Ugd2lsbCByZWFkIG91dCBhbGwgb2YgdGhvc2UgaW50ZXJydXB0IGluIHRo
ZQpsb29wIGFueXdheS4KClNpZ25lZC1vZmYtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlz
b3ZAZXBhbS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2dpYy5jIHwgMiAtLQogMSBmaWxlIGNoYW5n
ZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy5jIGIveGVu
L2FyY2gvYXJtL2dpYy5jCmluZGV4IDc3ZmMwNmYuLmIxMDc4M2IgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL2FybS9naWMuYworKysgYi94ZW4vYXJjaC9hcm0vZ2ljLmMKQEAgLTM5MCwxMCArMzkwLDgg
QEAgdm9pZCBnaWNfaW50ZXJydXB0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCBpbnQgaXNf
ZmlxKQogCiAgICAgICAgIGlmICggbGlrZWx5KGlycSA+PSAxNiAmJiBpcnEgPCAxMDIwKSApCiAg
ICAgICAgIHsKLSAgICAgICAgICAgIGxvY2FsX2lycV9lbmFibGUoKTsKICAgICAgICAgICAgIGlz
YigpOwogICAgICAgICAgICAgZG9fSVJRKHJlZ3MsIGlycSwgaXNfZmlxKTsKLSAgICAgICAgICAg
IGxvY2FsX2lycV9kaXNhYmxlKCk7CiAgICAgICAgIH0KICNpZmRlZiBDT05GSUdfR0lDVjMKICAg
ICAgICAgZWxzZSBpZiAoIGlzX2xwaShpcnEpICkKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
