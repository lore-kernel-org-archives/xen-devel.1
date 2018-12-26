From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [RFC v2 10/16] gic-vgic: skip irqs locking in
 vgic_sync_from_lrs
Date: Wed, 26 Dec 2018 13:20:21 +0200
Message-ID: <1545823227-6207-11-git-send-email-andrii.anisov@gmail.com>
References: <1545823227-6207-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tRx+=PD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gc7F2-00088N-EQ
 for xen-devel@lists.xenproject.org; Wed, 26 Dec 2018 11:20:48 +0000
Received: by mail-lf1-x143.google.com with SMTP id f23so10663032lfc.13
 for <xen-devel@lists.xenproject.org>; Wed, 26 Dec 2018 03:20:47 -0800 (PST)
In-Reply-To: <1545823227-6207-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andre Przywara <andre.przywara@arm.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkFmdGVyIHRoZSBw
YXRjaCAieGVuL2FybTogUmUtZW5hYmxlIGludGVycnVwdCBsYXRlciBpbiB0aGUgdHJhcCBwYXRo
Igp0aGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCB3aXRoIGlycXMgYWxyZWFkeSBsb2NrZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgotLS0KIHhl
bi9hcmNoL2FybS9naWMtdmdpYy5jIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMt
dmdpYy5jIGIveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMKaW5kZXggYTU5Mjk1YS4uNjEwZTNiYiAx
MDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMKKysrIGIveGVuL2FyY2gvYXJtL2dp
Yy12Z2ljLmMKQEAgLTI3MSw5ICsyNzEsMTAgQEAgc3RhdGljIHZvaWQgZ2ljX3VwZGF0ZV9vbmVf
bHIoc3RydWN0IHZjcHUgKnYsIGludCBpKQogdm9pZCB2Z2ljX3N5bmNfZnJvbV9scnMoc3RydWN0
IHZjcHUgKnYpCiB7CiAgICAgaW50IGkgPSAwOwotICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAg
ICAgdW5zaWduZWQgaW50IG5yX2xycyA9IGdpY19nZXRfbnJfbHJzKCk7CiAKKyAgICBBU1NFUlQo
IWxvY2FsX2lycV9pc19lbmFibGVkKCkpOworCiAgICAgLyogVGhlIGlkbGUgZG9tYWluIGhhcyBu
byBMUnMgdG8gYmUgY2xlYXJlZC4gU2luY2UgZ2ljX3Jlc3RvcmVfc3RhdGUKICAgICAgKiBkb2Vz
bid0IHdyaXRlIGFueSBMUiByZWdpc3RlcnMgZm9yIHRoZSBpZGxlIGRvbWFpbiB0aGV5IGNvdWxk
IGJlCiAgICAgICogbm9uLXplcm8uICovCkBAIC0yODIsNyArMjgzLDcgQEAgdm9pZCB2Z2ljX3N5
bmNfZnJvbV9scnMoc3RydWN0IHZjcHUgKnYpCiAKICAgICBnaWNfaHdfb3BzLT51cGRhdGVfaGNy
X3N0YXR1cyhHSUNIX0hDUl9VSUUsIGZhbHNlKTsKIAotICAgIHNwaW5fbG9ja19pcnFzYXZlKCZ2
LT5hcmNoLnZnaWMubG9jaywgZmxhZ3MpOworICAgIHNwaW5fbG9jaygmdi0+YXJjaC52Z2ljLmxv
Y2spOwogCiAgICAgd2hpbGUgKChpID0gZmluZF9uZXh0X2JpdCgoY29uc3QgdW5zaWduZWQgbG9u
ZyAqKSAmdGhpc19jcHUobHJfbWFzayksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBu
cl9scnMsIGkpKSA8IG5yX2xycyApIHsKQEAgLTI5MCw3ICsyOTEsNyBAQCB2b2lkIHZnaWNfc3lu
Y19mcm9tX2xycyhzdHJ1Y3QgdmNwdSAqdikKICAgICAgICAgaSsrOwogICAgIH0KIAotICAgIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJnYtPmFyY2gudmdpYy5sb2NrLCBmbGFncyk7CisgICAgc3Bp
bl91bmxvY2soJnYtPmFyY2gudmdpYy5sb2NrKTsKIH0KIAogc3RhdGljIHZvaWQgZ2ljX3Jlc3Rv
cmVfcGVuZGluZ19pcnFzKHN0cnVjdCB2Y3B1ICp2KQotLSAKMi43LjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
