From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 6/8] xen/arm: Initialize trace buffer
Date: Tue,  6 Nov 2018 19:14:52 +0000
Message-ID: <20181106191454.22143-7-julien.grall@arm.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7q02=nr=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gK6oi-0003cp-GU
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 19:15:12 +0000
In-Reply-To: <20181106191454.22143-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Benjamin Sanda <ben.sanda@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQmVuamFtaW4gU2FuZGEgPGJlbi5zYW5kYUBkb3JuZXJ3b3Jrcy5jb20+CgpOb3cgdGhh
dCB3ZSBhbGxvdyBhIHByaXZpbGVnZWQgZG9tYWluIHRvIG1hcCB0cmFjaW5nIGJ1ZmZlciwgaW5p
dGlhbGl6ZQp0aGVtIHNvIGEgdXNlciBjYW4gZWZmZWN0aXZlbHkgdHJhY2UgWGVuLgoKU2lnbmVk
LW9mZi1ieTogQmVuamFtaW4gU2FuZGEgPGJlbi5zYW5kYUBkb3JuZXJ3b3Jrcy5jb20+CltqdWxp
ZW46IHJld29yayBjb21taXQgbWVzc2FnZV0KU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyB8IDMgKysrCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRleCA4MGYwMDI4NmQzLi43MDIyOTA0
Y2MzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYworKysgYi94ZW4vYXJjaC9hcm0v
c2V0dXAuYwpAQCAtMzYsNiArMzYsNyBAQAogI2luY2x1ZGUgPHhlbi9wZm4uaD4KICNpbmNsdWRl
IDx4ZW4vdmlydHVhbF9yZWdpb24uaD4KICNpbmNsdWRlIDx4ZW4vdm1hcC5oPgorI2luY2x1ZGUg
PHhlbi90cmFjZS5oPgogI2luY2x1ZGUgPHhlbi9saWJmZHQvbGliZmR0Lmg+CiAjaW5jbHVkZSA8
eGVuL2FjcGkuaD4KICNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4KQEAgLTg2Myw2ICs4NjQs
OCBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0
LAogCiAgICAgaGVhcF9pbml0X2xhdGUoKTsKIAorICAgIGluaXRfdHJhY2VfYnVmcygpOworCiAg
ICAgaW5pdF9jb25zdHJ1Y3RvcnMoKTsKIAogICAgIGNvbnNvbGVfZW5kYm9vdCgpOwotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
