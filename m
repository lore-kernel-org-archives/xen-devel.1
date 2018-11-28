From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [RFC 11/16] irq: skip action avalability check for
 guest's IRQ
Date: Wed, 28 Nov 2018 23:32:06 +0200
Message-ID: <1543440731-21947-12-git-send-email-andrii.anisov@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jfkv=oh=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gS7Rf-0000DX-K7
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 21:32:31 +0000
Received: by mail-lf1-x134.google.com with SMTP id p6so20546119lfc.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 13:32:30 -0800 (PST)
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

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkFuIElSUSBhc3Np
Z25lZCB0byBndWVzdCBhbHdheXMgaGFzIGFuIGFjdGlvbi4gVGhpcyByZW1vdmVzCmFub3RoZXIg
b2RkIGNoZWNrIG9uIGd1ZXN0IElSUSBwYXRoLiBBbHNvIGdldHRpbmcgYW4gdW5rbm93bgppbnRl
cnJ1cHQgaXMgdmVyeSB1bmxpa2VseSBvbiBhIG5vbi1kZWJ1ZyBwbGF0Zm9ybS4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Ci0tLQogeGVuL2Fy
Y2gvYXJtL2lycS5jIHwgMTQgKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2lycS5j
IGIveGVuL2FyY2gvYXJtL2lycS5jCmluZGV4IDU5NmE4YjguLjVkZWJmYzUgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL2FybS9pcnEuYworKysgYi94ZW4vYXJjaC9hcm0vaXJxLmMKQEAgLTIwNSwxMyAr
MjA1LDYgQEAgdm9pZCBkb19JUlEoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVuc2lnbmVk
IGludCBpcnEsIGludCBpc19maXEpCiAgICAgc3Bpbl9sb2NrKCZkZXNjLT5sb2NrKTsKICAgICBk
ZXNjLT5oYW5kbGVyLT5hY2soZGVzYyk7CiAKLSAgICBpZiAoICFkZXNjLT5hY3Rpb24gKQotICAg
IHsKLSAgICAgICAgcHJpbnRrKCJVbmtub3duICVzICUjMy4zeFxuIiwKLSAgICAgICAgICAgICAg
IGlzX2ZpcSA/ICJGSVEiIDogIklSUSIsIGlycSk7Ci0gICAgICAgIGdvdG8gb3V0OwotICAgIH0K
LQogICAgIGlmICggdGVzdF9iaXQoX0lSUV9HVUVTVCwgJmRlc2MtPnN0YXR1cykgKQogICAgIHsK
ICAgICAgICAgc3RydWN0IGlycV9ndWVzdCAqaW5mbyA9IGlycV9nZXRfZ3Vlc3RfaW5mbyhkZXNj
KTsKQEAgLTIyOSw2ICsyMjIsMTMgQEAgdm9pZCBkb19JUlEoc3RydWN0IGNwdV91c2VyX3JlZ3Mg
KnJlZ3MsIHVuc2lnbmVkIGludCBpcnEsIGludCBpc19maXEpCiAgICAgICAgIGdvdG8gb3V0X25v
X2VuZDsKICAgICB9CiAKKyAgICBpZiAoIHVubGlrZWx5KCFkZXNjLT5hY3Rpb24pICkKKyAgICB7
CisgICAgICAgIHByaW50aygiVW5rbm93biAlcyAlIzMuM3hcbiIsCisgICAgICAgICAgICAgICBp
c19maXEgPyAiRklRIiA6ICJJUlEiLCBpcnEpOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisK
ICAgICBzZXRfYml0KF9JUlFfUEVORElORywgJmRlc2MtPnN0YXR1cyk7CiAKICAgICAvKgotLSAK
Mi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
