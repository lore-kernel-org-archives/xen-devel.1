From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 18/22] xen/arm: Remove unnecessary includes in
 asm-arm/acpi.h
Date: Thu, 18 Oct 2018 14:21:05 +0100
Message-ID: <20181018132109.31192-19-julien.grall@arm.com>
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

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4
ZW4vaW5jbHVkZS9hc20tYXJtL2FjcGkuaCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FjcGkuaCBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vYWNwaS5oCmluZGV4IGZlZWM0ZmIwYWMuLjUwMzQwMjgxYTkgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYWNwaS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0v
YWNwaS5oCkBAIC0yMyw3ICsyMyw2IEBACiAjaWZuZGVmIF9BU01fQVJNX0FDUElfSAogI2RlZmlu
ZSBfQVNNX0FSTV9BQ1BJX0gKIAotI2luY2x1ZGUgPGFzbS9wYWdlLmg+CiAjaW5jbHVkZSA8YXNt
L3NldHVwLmg+CiAKICNkZWZpbmUgQ09NUElMRVJfREVQRU5ERU5UX0lOVDY0ICAgbG9uZyBsb25n
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
