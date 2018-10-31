From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v2 16/21] xen/arm: Remove unnecessary includes
 in traps.c
Date: Wed, 31 Oct 2018 18:13:08 +0000
Message-ID: <20181031181313.8028-17-julien.grall@arm.com>
References: <20181031181313.8028-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181031181313.8028-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, andrii_anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

QWxzbywgaW5jbHVkZSBzbWNjYy5oIGluc3RlYWQgb2YgcHNjaS5oLgoKU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAg
ICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4vYXJjaC9hcm0vdHJhcHMu
YyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBz
LmMKaW5kZXggMGI4ZDM0MmMxYS4uODhmZmVlYjQ4MCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJt
L3RyYXBzLmMKKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKQEAgLTQyLDEyICs0MiwxMCBAQAog
I2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+CiAjaW5jbHVkZSA8YXNtL2RlYnVnZ2VyLmg+CiAj
aW5jbHVkZSA8YXNtL2V2ZW50Lmg+Ci0jaW5jbHVkZSA8YXNtL2ZsdXNodGxiLmg+CiAjaW5jbHVk
ZSA8YXNtL2hzci5oPgogI2luY2x1ZGUgPGFzbS9tbWlvLmg+Ci0jaW5jbHVkZSA8YXNtL21vbml0
b3IuaD4KLSNpbmNsdWRlIDxhc20vcHNjaS5oPgogI2luY2x1ZGUgPGFzbS9yZWdzLmg+CisjaW5j
bHVkZSA8YXNtL3NtY2NjLmg+CiAjaW5jbHVkZSA8YXNtL3RyYXBzLmg+CiAjaW5jbHVkZSA8YXNt
L3ZnaWMuaD4KICNpbmNsdWRlIDxhc20vdnRpbWVyLmg+Ci0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
