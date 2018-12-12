From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH 2/2] arm/irq: skip action avalability check for
 non-debug build
Date: Wed, 12 Dec 2018 18:55:25 +0200
Message-ID: <1544633725-7243-3-git-send-email-andrii.anisov@gmail.com>
References: <1544633725-7243-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX7nK-0005TG-DN
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 16:55:34 +0000
Received: by mail-lj1-x232.google.com with SMTP id e5-v6so16915204lja.4
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 08:55:32 -0800 (PST)
In-Reply-To: <1544633725-7243-1-git-send-email-andrii.anisov@gmail.com>
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

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkFuIElSUSB3aXRo
IF9JUlFfR1VFU1QgZmxhZyBzZXQgYWx3YXlzIGhhcyBhbiBhY3Rpb24uCkFuIElSUSB3aXRoIF9J
UlFfRElTQUJMRUQgZmxhZyBjbGVhcmVkIGFsd2F5cyBoYXZlIGFuIGFjdGlvbi4KVGhvc2UgZmxh
Z3MgY2hlY2tzIGNvdmVyIGFsbCBhY2Nlc3NlcyB0byBkZXNjLT5hY3Rpb24gaW4gZG9fSVJRLApz
byB3ZSBjYW4gc2tpcCBkZXNjLT5hY3Rpb24gY2hlY2suClN0aWxsIGtlZXAgaXQgaW4gcGxhY2Ug
Zm9yIGRlYnVnIGJ1aWxkLgoKU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2Fu
aXNvdkBlcGFtLmNvbT4KUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2lycS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pcnEuYyBiL3hlbi9hcmNo
L2FybS9pcnEuYwppbmRleCBkNmEwMjczLi40YTAyY2MxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9h
cm0vaXJxLmMKKysrIGIveGVuL2FyY2gvYXJtL2lycS5jCkBAIC0yMDksMTIgKzIwOSwxNCBAQCB2
b2lkIGRvX0lSUShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdW5zaWduZWQgaW50IGlycSwg
aW50IGlzX2ZpcSkKICAgICBzcGluX2xvY2soJmRlc2MtPmxvY2spOwogICAgIGRlc2MtPmhhbmRs
ZXItPmFjayhkZXNjKTsKIAorI2lmbmRlZiBOREVCVUcKICAgICBpZiAoICFkZXNjLT5hY3Rpb24g
KQogICAgIHsKICAgICAgICAgcHJpbnRrKCJVbmtub3duICVzICUjMy4zeFxuIiwKICAgICAgICAg
ICAgICAgIGlzX2ZpcSA/ICJGSVEiIDogIklSUSIsIGlycSk7CiAgICAgICAgIGdvdG8gb3V0Owog
ICAgIH0KKyNlbmRpZgogCiAgICAgaWYgKCB0ZXN0X2JpdChfSVJRX0dVRVNULCAmZGVzYy0+c3Rh
dHVzKSApCiAgICAgewotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
