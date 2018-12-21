From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 v3 6/8] xen/arm: Initialize trace buffer
Date: Fri, 21 Dec 2018 16:26:48 +0000
Message-ID: <20181221162650.11515-7-julien.grall@arm.com>
References: <20181221162650.11515-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mGA=O6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gaNdk-00069x-1D
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 16:27:08 +0000
In-Reply-To: <20181221162650.11515-1-julien.grall@arm.com>
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
bmlzb3ZAZXBhbS5jb20+CkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CgotLS0KICAgIENoYW5nZXMgaW4gdjM6CiAgICAgICAgLSBBZGQgU3RlZmFu
bydzIGFja2VkLWJ5CgogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIEFkZCBBbmRyaWkncyBy
ZXZpZXdlZC1ieQotLS0KIHhlbi9hcmNoL2FybS9zZXR1cC5jIHwgMyArKysKIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBi
L3hlbi9hcmNoL2FybS9zZXR1cC5jCmluZGV4IGZiOTIzY2RmNjcuLjQ0NDg1N2E5NjcgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCkBA
IC0zNiw2ICszNiw3IEBACiAjaW5jbHVkZSA8eGVuL3Bmbi5oPgogI2luY2x1ZGUgPHhlbi92aXJ0
dWFsX3JlZ2lvbi5oPgogI2luY2x1ZGUgPHhlbi92bWFwLmg+CisjaW5jbHVkZSA8eGVuL3RyYWNl
Lmg+CiAjaW5jbHVkZSA8eGVuL2xpYmZkdC9saWJmZHQuaD4KICNpbmNsdWRlIDx4ZW4vYWNwaS5o
PgogI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPgpAQCAtODk5LDYgKzkwMCw4IEBAIHZvaWQg
X19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQsCiAKICAgICBo
ZWFwX2luaXRfbGF0ZSgpOwogCisgICAgaW5pdF90cmFjZV9idWZzKCk7CisKICAgICBpbml0X2Nv
bnN0cnVjdG9ycygpOwogCiAgICAgY29uc29sZV9lbmRib290KCk7Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
