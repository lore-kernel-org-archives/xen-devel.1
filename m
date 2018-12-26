From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [RFC v2 06/16] vgic: move pause_flags check out of vgic
 spinlock
Date: Wed, 26 Dec 2018 13:20:17 +0200
Message-ID: <1545823227-6207-7-git-send-email-andrii.anisov@gmail.com>
References: <1545823227-6207-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tRx+=PD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gc7Ew-00082t-M5
 for xen-devel@lists.xenproject.org; Wed, 26 Dec 2018 11:20:42 +0000
Received: by mail-lj1-x229.google.com with SMTP id l15-v6so13622771lja.9
 for <xen-devel@lists.xenproject.org>; Wed, 26 Dec 2018 03:20:41 -0800 (PST)
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

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClBhdXNlX2ZsYWdz
IGlzIG5vdCByZWxhdGVkIHRvIHZnaWMgc3BpbmxvY2ssIHNvIHJlZHVjZSBjb2RlCnVuZGVyIGxv
Y2suCgpTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29t
PgotLS0KCkNvbW1lbnRzIGZyb20gSnVsaWVuIFsxXSBhcmUgbm90IGFkZHJlc3NlZCB5ZXQuCgpb
MV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8y
MDE4LTExL21zZzAzMzA2Lmh0bWwKCi0tLQogeGVuL2FyY2gvYXJtL3ZnaWMuYyB8IDEzICsrKysr
Ky0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMuYyBiL3hlbi9hcmNoL2FybS92Z2ljLmMK
aW5kZXggMDU3YTcyMS4uYTc5NWI2ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMuYwor
KysgYi94ZW4vYXJjaC9hcm0vdmdpYy5jCkBAIC01ODIsNiArNTgyLDEyIEBAIHZvaWQgdmdpY19p
bmplY3RfaXJxKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQg
dmlycSwKICAgICAgICAgdiA9IHZnaWNfZ2V0X3RhcmdldF92Y3B1KGQtPnZjcHVbMF0sIHZpcnEp
OwogICAgIH07CiAKKyAgICAvKiB2Y3B1IG9mZmxpbmUgKi8KKyAgICBpZiAoIHVubGlrZWx5KHRl
c3RfYml0KF9WUEZfZG93biwgJnYtPnBhdXNlX2ZsYWdzKSkgKQorICAgIHsKKyAgICAgICAgcmV0
dXJuOworICAgIH0KKwogICAgIHNwaW5fbG9ja19pcnFzYXZlKCZ2LT5hcmNoLnZnaWMubG9jaywg
ZmxhZ3MpOwogCiAgICAgbiA9IGlycV90b19wZW5kaW5nKHYsIHZpcnEpOwpAQCAtNTk0LDEzICs2
MDAsNiBAQCB2b2lkIHZnaWNfaW5qZWN0X2lycShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgdmNw
dSAqdiwgdW5zaWduZWQgaW50IHZpcnEsCiAgICAgfQogI2VuZGlmCiAKLSAgICAvKiB2Y3B1IG9m
ZmxpbmUgKi8KLSAgICBpZiAoIHRlc3RfYml0KF9WUEZfZG93biwgJnYtPnBhdXNlX2ZsYWdzKSAp
Ci0gICAgewotICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ2LT5hcmNoLnZnaWMubG9j
aywgZmxhZ3MpOwotICAgICAgICByZXR1cm47Ci0gICAgfQotCiAgICAgc2V0X2JpdChHSUNfSVJR
X0dVRVNUX1FVRVVFRCwgJm4tPnN0YXR1cyk7CiAKICAgICBpZiAoICFsaXN0X2VtcHR5KCZuLT5p
bmZsaWdodCkgKQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
