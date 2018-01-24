From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH v3 1/8] ARM: VGIC: drop unneeded
	gic_restore_pending_irqs()
Date: Wed, 24 Jan 2018 18:10:51 +0000
Message-ID: <20180124181058.6157-2-andre.przywara@linaro.org>
References: <20180124181058.6157-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=5dpo=et=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eePVg-00077C-Qj
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 18:10:57 +0000
Received: by mail-wr0-x243.google.com with SMTP id f11so4987854wre.4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2018 10:10:55 -0800 (PST)
In-Reply-To: <20180124181058.6157-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SW4gZ2ljX3Jlc3RvcmVfcGVuZGluZ19pcnFzKCkgd2UgcHVzaCBvdXIgcGVuZGluZyB2aXJ0dWFs
IElSUXMgaW50byB0aGUKbGlzdCByZWdpc3RlcnMuIFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIG9u
Y2UgZnJvbSBnaWNfaW5qZWN0KCksIGp1c3QKYmVmb3JlIHdlIHJldHVybiB0byB0aGUgZ3Vlc3Qs
IGJ1dCBhbHNvIGluIGdpY19yZXN0b3JlX3N0YXRlKCksIHdoZW4Kd2UgY29udGV4dC1zd2l0Y2gg
YSBWQ1BVLiBIYXZpbmcgYSBjbG9zZXIgbG9vayBpdCB0dXJucyBvdXQgdGhhdCB0aGUKbGF0ZXIg
Y2FsbCBpcyBub3QgbmVlZGVkLCBzaW5jZSB3ZSB3aWxsIGFsd2F5cyBjYWxsIGdpY19pbmplY3Qo
KSBhbnl3YXkuClNvIHJlbW92ZSB0aGF0IGNhbGwgKGFuZCB0aGUgZm9yd2FyZCBkZWNsYXJhdGlv
bikgdG8gc3RyZWFtbGluZSB0aGlzCmludGVyZmFjZSBhbmQgbWFrZSBzZXBhcmF0aW5nIHRoZSBH
SUMgZnJvbSB0aGUgVkdJQyB3b3JsZCBsYXRlci4KClNpZ25lZC1vZmYtYnk6IEFuZHJlIFByenl3
YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgotLS0KIHhlbi9hcmNoL2FybS9naWMuYyB8
IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2dpYy5jIGIveGVuL2FyY2gvYXJtL2dpYy5jCmluZGV4IGJhYzhhZGEyYmIuLjcy
MWExN2E5ZDcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9naWMuYworKysgYi94ZW4vYXJjaC9h
cm0vZ2ljLmMKQEAgLTM2LDggKzM2LDYgQEAKICNpbmNsdWRlIDxhc20vdmdpYy5oPgogI2luY2x1
ZGUgPGFzbS9hY3BpLmg+CiAKLXN0YXRpYyB2b2lkIGdpY19yZXN0b3JlX3BlbmRpbmdfaXJxcyhz
dHJ1Y3QgdmNwdSAqdik7Ci0KIHN0YXRpYyBERUZJTkVfUEVSX0NQVSh1aW50NjRfdCwgbHJfbWFz
ayk7CiAKICNkZWZpbmUgbHJfYWxsX2Z1bGwoKSAodGhpc19jcHUobHJfbWFzaykgPT0gKCgxIDw8
IGdpY19od19vcHMtPmluZm8tPm5yX2xycykgLSAxKSkKQEAgLTkxLDggKzg5LDYgQEAgdm9pZCBn
aWNfcmVzdG9yZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdikKICAgICBnaWNfaHdfb3BzLT5yZXN0b3Jl
X3N0YXRlKHYpOwogCiAgICAgaXNiKCk7Ci0KLSAgICBnaWNfcmVzdG9yZV9wZW5kaW5nX2lycXMo
dik7CiB9CiAKIC8qIGRlc2MtPmlycSBuZWVkcyB0byBiZSBkaXNhYmxlZCBiZWZvcmUgY2FsbGlu
ZyB0aGlzIGZ1bmN0aW9uICovCi0tIAoyLjE0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
