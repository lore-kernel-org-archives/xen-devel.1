From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [RFC v2 05/16] gic-vgic: skip irqs locking in
 gic_restore_pending_irqs()
Date: Wed, 26 Dec 2018 13:20:16 +0200
Message-ID: <1545823227-6207-6-git-send-email-andrii.anisov@gmail.com>
References: <1545823227-6207-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tRx+=PD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gc7Ev-00082X-Ex
 for xen-devel@lists.xenproject.org; Wed, 26 Dec 2018 11:20:41 +0000
Received: by mail-lj1-x241.google.com with SMTP id t18-v6so13628334ljd.4
 for <xen-devel@lists.xenproject.org>; Wed, 26 Dec 2018 03:20:40 -0800 (PST)
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

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoaXMgZnVuY3Rp
b24gaXMgY2FsbGVkIHVuZGVyIElSUXMgZGlzYWJsZWQgYWxyZWFkeSwgc28gZHJvcCBhZGRpdGlv
bmFsCmZsYWdzIHNhdmUgYW5kIHJlc3RvcmUuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292
IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgotLS0KClRoaXMgcGF0Y2ggaXMgYSBwYXJ0IG9mIFsx
XSBhbmQgYWxyZWFkeSBzZW50IHRvIHRoZSBsaXN0IFsyXS4KClsxXSBodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTEvbXNnMDMyOTMuaHRt
bApbMl0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDE4LTEyL21zZzAyMTg4Lmh0bWwKCi0tLQogeGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgfCA3
ICsrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2lj
LXZnaWMuYwppbmRleCAwZjhmOGQ1Li43NGFiMzU3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0v
Z2ljLXZnaWMuYworKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwpAQCAtMzAyLDExICszMDIs
MTIgQEAgc3RhdGljIHZvaWQgZ2ljX3Jlc3RvcmVfcGVuZGluZ19pcnFzKHN0cnVjdCB2Y3B1ICp2
KQogICAgIGludCBsciA9IDA7CiAgICAgc3RydWN0IHBlbmRpbmdfaXJxICpwLCAqdCwgKnBfcjsK
ICAgICBzdHJ1Y3QgbGlzdF9oZWFkICppbmZsaWdodF9yOwotICAgIHVuc2lnbmVkIGxvbmcgZmxh
Z3M7CiAgICAgdW5zaWduZWQgaW50IG5yX2xycyA9IGdpY19nZXRfbnJfbHJzKCk7CiAgICAgaW50
IGxycyA9IG5yX2xyczsKIAotICAgIHNwaW5fbG9ja19pcnFzYXZlKCZ2LT5hcmNoLnZnaWMubG9j
aywgZmxhZ3MpOworICAgIEFTU0VSVCghbG9jYWxfaXJxX2lzX2VuYWJsZWQoKSk7CisKKyAgICBz
cGluX2xvY2soJnYtPmFyY2gudmdpYy5sb2NrKTsKIAogICAgIGlmICggbGlzdF9lbXB0eSgmdi0+
YXJjaC52Z2ljLmxyX3BlbmRpbmcpICkKICAgICAgICAgZ290byBvdXQ7CkBAIC0zNTAsNyArMzUx
LDcgQEAgZm91bmQ6CiAgICAgfQogCiBvdXQ6Ci0gICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgm
di0+YXJjaC52Z2ljLmxvY2ssIGZsYWdzKTsKKyAgICBzcGluX3VubG9jaygmdi0+YXJjaC52Z2lj
LmxvY2spOwogfQogCiB2b2lkIGdpY19jbGVhcl9wZW5kaW5nX2lycXMoc3RydWN0IHZjcHUgKnYp
Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
