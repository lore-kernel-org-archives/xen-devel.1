From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH] gic-vgic: skip irqs locking in
 gic_restore_pending_irqs()
Date: Fri, 21 Dec 2018 20:16:35 +0200
Message-ID: <1545416195-23917-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/5Gq=O6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gaPLl-0003e7-R5
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 18:16:41 +0000
Received: by mail-lj1-x243.google.com with SMTP id x85-v6so5546295ljb.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 10:16:40 -0800 (PST)
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

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoaXMgZnVuY3Rp
b24gaXMgY2FsbGVkIHVuZGVyIElSUXMgZGlzYWJsZWQgYWxyZWFkeSwgc28gZHJvcCBhZGRpdGlv
bmFsCmZsYWdzIHNhdmUgYW5kIHJlc3RvcmUuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292
IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCgpUaGlzIGlzIGEgaGFsZiBvZiBhbiBSRkMg
cGF0Y2ggWzFdIHdoaWNoIHJlbGllcyBvbiB0aGUgYWxyZWFkeQpleGlzdGluZyBjb2RlLgoKWzFd
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAx
OC0xMS9tc2cwMzI5My5odG1sCgotLS0KIHhlbi9hcmNoL2FybS9naWMtdmdpYy5jIHwgNSArKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYyBiL3hlbi9hcmNoL2FybS9naWMtdmdpYy5j
CmluZGV4IDQ4OTIyZjUuLjM0MTc5YzAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9naWMtdmdp
Yy5jCisrKyBiL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jCkBAIC0yNzksMTEgKzI3OSwxMCBAQCBz
dGF0aWMgdm9pZCBnaWNfcmVzdG9yZV9wZW5kaW5nX2lycXMoc3RydWN0IHZjcHUgKnYpCiAgICAg
aW50IGxyID0gMDsKICAgICBzdHJ1Y3QgcGVuZGluZ19pcnEgKnAsICp0LCAqcF9yOwogICAgIHN0
cnVjdCBsaXN0X2hlYWQgKmluZmxpZ2h0X3I7Ci0gICAgdW5zaWduZWQgbG9uZyBmbGFnczsKICAg
ICB1bnNpZ25lZCBpbnQgbnJfbHJzID0gZ2ljX2dldF9ucl9scnMoKTsKICAgICBpbnQgbHJzID0g
bnJfbHJzOwogCi0gICAgc3Bpbl9sb2NrX2lycXNhdmUoJnYtPmFyY2gudmdpYy5sb2NrLCBmbGFn
cyk7CisgICAgc3Bpbl9sb2NrKCZ2LT5hcmNoLnZnaWMubG9jayk7CiAKICAgICBpZiAoIGxpc3Rf
ZW1wdHkoJnYtPmFyY2gudmdpYy5scl9wZW5kaW5nKSApCiAgICAgICAgIGdvdG8gb3V0OwpAQCAt
MzI3LDcgKzMyNiw3IEBAIGZvdW5kOgogICAgIH0KIAogb3V0OgotICAgIHNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJnYtPmFyY2gudmdpYy5sb2NrLCBmbGFncyk7CisgICAgc3Bpbl91bmxvY2soJnYt
PmFyY2gudmdpYy5sb2NrKTsKIH0KIAogdm9pZCBnaWNfY2xlYXJfcGVuZGluZ19pcnFzKHN0cnVj
dCB2Y3B1ICp2KQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
