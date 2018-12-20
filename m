From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 v2 6/8] xen/arm: Initialize trace buffer
Date: Thu, 20 Dec 2018 19:23:36 +0000
Message-ID: <20181220192338.17526-7-julien.grall@arm.com>
References: <20181220192338.17526-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZIHg=O5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ga3vI-0001yE-Gz
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 19:23:56 +0000
In-Reply-To: <20181220192338.17526-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii Anisov <andrii_anisov@epam.com>, Benjamin Sanda <ben.sanda@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQmVuamFtaW4gU2FuZGEgPGJlbi5zYW5kYUBkb3JuZXJ3b3Jrcy5jb20+CgpOb3cgdGhh
dCB3ZSBhbGxvdyBhIHByaXZpbGVnZWQgZG9tYWluIHRvIG1hcCB0cmFjaW5nIGJ1ZmZlciwgaW5p
dGlhbGl6ZQp0aGVtIHNvIGEgdXNlciBjYW4gZWZmZWN0aXZlbHkgdHJhY2UgWGVuLgoKU2lnbmVk
LW9mZi1ieTogQmVuamFtaW4gU2FuZGEgPGJlbi5zYW5kYUBkb3JuZXJ3b3Jrcy5jb20+CltqdWxp
ZW46IHJld29yayBjb21taXQgbWVzc2FnZV0KU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9h
bmlzb3ZAZXBhbS5jb20+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBBZGQgQW5k
cmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyB8IDMgKysrCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Nl
dHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRleCBmYjkyM2NkZjY3Li40NDQ4NTdhOTY3
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYworKysgYi94ZW4vYXJjaC9hcm0vc2V0
dXAuYwpAQCAtMzYsNiArMzYsNyBAQAogI2luY2x1ZGUgPHhlbi9wZm4uaD4KICNpbmNsdWRlIDx4
ZW4vdmlydHVhbF9yZWdpb24uaD4KICNpbmNsdWRlIDx4ZW4vdm1hcC5oPgorI2luY2x1ZGUgPHhl
bi90cmFjZS5oPgogI2luY2x1ZGUgPHhlbi9saWJmZHQvbGliZmR0Lmg+CiAjaW5jbHVkZSA8eGVu
L2FjcGkuaD4KICNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4KQEAgLTg5OSw2ICs5MDAsOCBA
QCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAog
CiAgICAgaGVhcF9pbml0X2xhdGUoKTsKIAorICAgIGluaXRfdHJhY2VfYnVmcygpOworCiAgICAg
aW5pdF9jb25zdHJ1Y3RvcnMoKTsKIAogICAgIGNvbnNvbGVfZW5kYm9vdCgpOwotLSAKMi4xMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
