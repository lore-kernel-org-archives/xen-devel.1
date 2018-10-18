From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 16/22] xen/arm: Remove unnecessary includes in
 traps.c
Date: Thu, 18 Oct 2018 14:21:03 +0100
Message-ID: <20181018132109.31192-17-julien.grall@arm.com>
References: <20181018132109.31192-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181018132109.31192-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

QWxzbywgaW5jbHVkZSBzbWNjYy5oIGluc3RlYWQgb2YgcHNjaS5oLgoKU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vdHJh
cHMuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3Ry
YXBzLmMKaW5kZXggMGRkNjY0Y2MwOC4uOWMzYmUxN2RmOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL3RyYXBzLmMKKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKQEAgLTQyLDEyICs0MiwxMCBA
QAogI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+CiAjaW5jbHVkZSA8YXNtL2RlYnVnZ2VyLmg+
CiAjaW5jbHVkZSA8YXNtL2V2ZW50Lmg+Ci0jaW5jbHVkZSA8YXNtL2ZsdXNodGxiLmg+CiAjaW5j
bHVkZSA8YXNtL2hzci5oPgogI2luY2x1ZGUgPGFzbS9tbWlvLmg+Ci0jaW5jbHVkZSA8YXNtL21v
bml0b3IuaD4KLSNpbmNsdWRlIDxhc20vcHNjaS5oPgogI2luY2x1ZGUgPGFzbS9yZWdzLmg+Cisj
aW5jbHVkZSA8YXNtL3NtY2NjLmg+CiAjaW5jbHVkZSA8YXNtL3RyYXBzLmg+CiAjaW5jbHVkZSA8
YXNtL3ZnaWMuaD4KICNpbmNsdWRlIDxhc20vdnRpbWVyLmg+Ci0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
