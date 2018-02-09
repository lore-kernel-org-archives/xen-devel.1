From: Andre Przywara <andre.przywara@linaro.org>
Subject: [RFC PATCH 26/49] ARM: new VGIC: Implement
	vgic_vcpu_pending_irq
Date: Fri,  9 Feb 2018 14:39:14 +0000
Message-ID: <20180209143937.28866-27-andre.przywara@linaro.org>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vdwz=fd=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ek9qY-0000pG-Me
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 14:40:14 +0000
Received: by mail-wm0-x244.google.com with SMTP id j21so4255560wmh.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2018 06:40:13 -0800 (PST)
In-Reply-To: <20180209143937.28866-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGVsbCBYZW4gd2hldGhlciBhIHBhcnRpY3VsYXIgVkNQVSBoYXMgYW4gSVJRIHRoYXQgbmVlZHMg
aGFuZGxpbmcKaW4gdGhlIGd1ZXN0LiBUaGlzIGlzIHVzZWQgdG8gZGVjaWRlIHdoZXRoZXIgYSBW
Q1BVIGlzIHJ1bm5hYmxlLgoKVGhpcyBpcyBiYXNlZCBvbiBMaW51eCBjb21taXQgOTBlZWU1NmM1
ZjkwLCB3cml0dGVuIGJ5IEVyaWMgQXVnZXIuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2Fy
YSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4KLS0tCiB4ZW4vYXJjaC9hcm0vdmdpYy92Z2lj
LmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDMyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMg
Yi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKaW5kZXggZjRmMmEwNGE2MC4uOWU3ZmIxZWRjYiAx
MDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCisrKyBiL3hlbi9hcmNoL2FybS92
Z2ljL3ZnaWMuYwpAQCAtNjQ2LDYgKzY0NiwzOCBAQCB2b2lkIGdpY19pbmplY3Qodm9pZCkKICAg
ICB2Z2ljX3Jlc3RvcmVfc3RhdGUoY3VycmVudCk7CiB9CiAKK3N0YXRpYyBpbnQgdmdpY192Y3B1
X3BlbmRpbmdfaXJxKHN0cnVjdCB2Y3B1ICp2Y3B1KQoreworICAgIHN0cnVjdCB2Z2ljX2NwdSAq
dmdpY19jcHUgPSAmdmNwdS0+YXJjaC52Z2ljX2NwdTsKKyAgICBzdHJ1Y3QgdmdpY19pcnEgKmly
cTsKKyAgICBib29sIHBlbmRpbmcgPSBmYWxzZTsKKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwor
CisgICAgaWYgKCAhdmNwdS0+ZG9tYWluLT5hcmNoLnZnaWMuZW5hYmxlZCApCisgICAgICAgIHJl
dHVybiBmYWxzZTsKKworICAgIHNwaW5fbG9ja19pcnFzYXZlKCZ2Z2ljX2NwdS0+YXBfbGlzdF9s
b2NrLCBmbGFncyk7CisKKyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KGlycSwgJnZnaWNfY3B1LT5h
cF9saXN0X2hlYWQsIGFwX2xpc3QpCisgICAgeworICAgICAgICBzcGluX2xvY2soJmlycS0+aXJx
X2xvY2spOworICAgICAgICBwZW5kaW5nID0gaXJxX2lzX3BlbmRpbmcoaXJxKSAmJiBpcnEtPmVu
YWJsZWQ7CisgICAgICAgIHNwaW5fdW5sb2NrKCZpcnEtPmlycV9sb2NrKTsKKworICAgICAgICBp
ZiAoIHBlbmRpbmcgKQorICAgICAgICAgICAgYnJlYWs7CisgICAgfQorCisgICAgc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZSgmdmdpY19jcHUtPmFwX2xpc3RfbG9jaywgZmxhZ3MpOworCisgICAgcmV0
dXJuIHBlbmRpbmc7Cit9CisKK2ludCBnaWNfZXZlbnRzX25lZWRfZGVsaXZlcnkodm9pZCkKK3sK
KyAgICByZXR1cm4gdmdpY192Y3B1X3BlbmRpbmdfaXJxKGN1cnJlbnQpOworfQorCiAvKgogICog
TG9jYWwgdmFyaWFibGVzOgogICogbW9kZTogQwotLSAKMi4xNC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
