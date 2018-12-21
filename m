From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH v2] gic-vgic: skip irqs locking in
 gic_restore_pending_irqs()
Date: Fri, 21 Dec 2018 20:54:16 +0200
Message-ID: <1545418456-9207-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/5Gq=O6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gaPwD-0000Vi-93
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 18:54:21 +0000
Received: by mail-lj1-x243.google.com with SMTP id k15-v6so5615547ljc.8
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 10:54:19 -0800 (PST)
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
OC0xMS9tc2cwMzI5My5odG1sCgogICAgQ2hhbmdlcyBpbiB2MjoKICAgIEFkZGVkIGFuIEFTU0VS
VCgpIHRvIHZlcmlmeSB0aGUgZnVuY3Rpb24gc2hvdWxkIGJlIGNhbGxlZCB3aXRoIGludGVycnVw
dHMKICAgIGRpc2FibGVkLgoKLS0tCiB4ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYyB8IDcgKysrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYyBiL3hlbi9hcmNoL2FybS9naWMtdmdpYy5j
CmluZGV4IDQ4OTIyZjUuLmY5MDk4YzggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9naWMtdmdp
Yy5jCisrKyBiL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jCkBAIC0yNzksMTEgKzI3OSwxMiBAQCBz
dGF0aWMgdm9pZCBnaWNfcmVzdG9yZV9wZW5kaW5nX2lycXMoc3RydWN0IHZjcHUgKnYpCiAgICAg
aW50IGxyID0gMDsKICAgICBzdHJ1Y3QgcGVuZGluZ19pcnEgKnAsICp0LCAqcF9yOwogICAgIHN0
cnVjdCBsaXN0X2hlYWQgKmluZmxpZ2h0X3I7Ci0gICAgdW5zaWduZWQgbG9uZyBmbGFnczsKICAg
ICB1bnNpZ25lZCBpbnQgbnJfbHJzID0gZ2ljX2dldF9ucl9scnMoKTsKICAgICBpbnQgbHJzID0g
bnJfbHJzOwogCi0gICAgc3Bpbl9sb2NrX2lycXNhdmUoJnYtPmFyY2gudmdpYy5sb2NrLCBmbGFn
cyk7CisgICAgQVNTRVJUKCFsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKKworICAgIHNwaW5fbG9j
aygmdi0+YXJjaC52Z2ljLmxvY2spOwogCiAgICAgaWYgKCBsaXN0X2VtcHR5KCZ2LT5hcmNoLnZn
aWMubHJfcGVuZGluZykgKQogICAgICAgICBnb3RvIG91dDsKQEAgLTMyNyw3ICszMjgsNyBAQCBm
b3VuZDoKICAgICB9CiAKIG91dDoKLSAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ2LT5hcmNo
LnZnaWMubG9jaywgZmxhZ3MpOworICAgIHNwaW5fdW5sb2NrKCZ2LT5hcmNoLnZnaWMubG9jayk7
CiB9CiAKIHZvaWQgZ2ljX2NsZWFyX3BlbmRpbmdfaXJxcyhzdHJ1Y3QgdmNwdSAqdikKLS0gCjIu
Ny40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
