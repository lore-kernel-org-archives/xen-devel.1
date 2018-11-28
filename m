From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [RFC 05/16] gic-vgic: Drop an excessive clear_lrs
Date: Wed, 28 Nov 2018 23:32:00 +0200
Message-ID: <1543440731-21947-6-git-send-email-andrii.anisov@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jfkv=oh=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gS7RX-000053-EB
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 21:32:23 +0000
Received: by mail-lf1-x12b.google.com with SMTP id a16so20515118lfg.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 13:32:22 -0800 (PST)
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

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoaXMgYWN0aW9u
IGlzIGV4Y2Vzc2l2ZSBiZWNhdXNlIGZvciBhbiBpbnZhbGlkIExSIHRoZXJlIGlzIG5vIG5lZWQK
dG8gd3JpdGUgYW5vdGhlciBpbnZhbGlkIHZhbHVlIHRvIGEgcmVnaXN0ZXIuIFNvIHdlIGNhbiBz
a2lwIGl0IGhlcmUsCnNhdmluZyBhIHBlcmlwaGVyYWwgcmVnaXN0ZXIgYWNjZXNzLgoKU2lnbmVk
LW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KLS0tCiB4ZW4v
YXJjaC9hcm0vZ2ljLXZnaWMuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYyBiL3hlbi9hcmNoL2FybS9naWMt
dmdpYy5jCmluZGV4IDg2OTk4N2EuLjRlMTgxNjkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9n
aWMtdmdpYy5jCisrKyBiL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jCkBAIC0yMjcsNyArMjI3LDYg
QEAgc3RhdGljIHZvaWQgZ2ljX3VwZGF0ZV9vbmVfbHIoc3RydWN0IHZjcHUgKnYsIGludCBpKQog
ICAgIH0KICAgICBlbHNlCiAgICAgewotICAgICAgICBnaWNfaHdfb3BzLT5jbGVhcl9scihpKTsK
ICAgICAgICAgY2xlYXJfYml0KGksICZ0aGlzX2NwdShscl9tYXNrKSk7CiAKICAgICAgICAgaWYg
KCBwLT5kZXNjICE9IE5VTEwgKQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
