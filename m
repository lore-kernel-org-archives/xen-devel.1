From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [RFC 03/16] vgic: move pause_flags check out of vgic
 spinlock
Date: Wed, 28 Nov 2018 23:31:58 +0200
Message-ID: <1543440731-21947-4-git-send-email-andrii.anisov@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jfkv=oh=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gS7RV-0008VN-7n
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 21:32:21 +0000
Received: by mail-lj1-x231.google.com with SMTP id e5-v6so24826094lja.4
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 13:32:19 -0800 (PST)
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

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClBhdXNlX2ZsYWdz
IGlzIG5vdCByZWxhdGVkIHRvIHZnaWMgc3BpbmxvY2ssIHNvIHJlZHVjZSBjb2RlCnVuZGVyIGxv
Y2suCgpTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29t
PgotLS0KIHhlbi9hcmNoL2FybS92Z2ljLmMgfCAxMyArKysrKystLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS92Z2ljLmMgYi94ZW4vYXJjaC9hcm0vdmdpYy5jCmluZGV4IGEyNDE5ZDAuLmE2NDYz
M2YgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS92Z2ljLmMKKysrIGIveGVuL2FyY2gvYXJtL3Zn
aWMuYwpAQCAtNTYzLDYgKzU2MywxMiBAQCB2b2lkIHZnaWNfaW5qZWN0X2lycShzdHJ1Y3QgZG9t
YWluICpkLCBzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHZpcnEsCiAgICAgICAgIHYgPSB2
Z2ljX2dldF90YXJnZXRfdmNwdShkLT52Y3B1WzBdLCB2aXJxKTsKICAgICB9OwogCisgICAgLyog
dmNwdSBvZmZsaW5lICovCisgICAgaWYgKCB1bmxpa2VseSh0ZXN0X2JpdChfVlBGX2Rvd24sICZ2
LT5wYXVzZV9mbGFncykpICkKKyAgICB7CisgICAgICAgIHJldHVybjsKKyAgICB9CisKICAgICBz
cGluX2xvY2tfaXJxc2F2ZSgmdi0+YXJjaC52Z2ljLmxvY2ssIGZsYWdzKTsKIAogICAgIG4gPSBp
cnFfdG9fcGVuZGluZyh2LCB2aXJxKTsKQEAgLTU3NSwxMyArNTgxLDYgQEAgdm9pZCB2Z2ljX2lu
amVjdF9pcnEoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCB2
aXJxLAogICAgIH0KICNlbmRpZgogCi0gICAgLyogdmNwdSBvZmZsaW5lICovCi0gICAgaWYgKCB0
ZXN0X2JpdChfVlBGX2Rvd24sICZ2LT5wYXVzZV9mbGFncykgKQotICAgIHsKLSAgICAgICAgc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmdi0+YXJjaC52Z2ljLmxvY2ssIGZsYWdzKTsKLSAgICAgICAg
cmV0dXJuOwotICAgIH0KLQogICAgIHNldF9iaXQoR0lDX0lSUV9HVUVTVF9RVUVVRUQsICZuLT5z
dGF0dXMpOwogCiAgICAgaWYgKCAhbGlzdF9lbXB0eSgmbi0+aW5mbGlnaHQpICkKLS0gCjIuNy40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
