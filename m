From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 14/22] xen/arm: Remove unnecessary includes in
 asm/vgic.h
Date: Thu, 18 Oct 2018 14:21:01 +0100
Message-ID: <20181018132109.31192-15-julien.grall@arm.com>
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
ZW4vaW5jbHVkZS9hc20tYXJtL3ZnaWMuaCB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3ZnaWMuaCBiL3hlbi9p
bmNsdWRlL2FzbS1hcm0vdmdpYy5oCmluZGV4IDc2MDM5MmY5ZWYuLjAzMTZkODdmNjYgMTAwNjQ0
Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vdmdpYy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vdmdpYy5oCkBAIC0yMiwxMSArMjIsOCBAQAogI2luY2x1ZGUgPGFzbS9uZXdfdmdpYy5oPgog
I2Vsc2UKIAotI2luY2x1ZGUgPHhlbi9iaXRvcHMuaD4KICNpbmNsdWRlIDx4ZW4vcmFkaXgtdHJl
ZS5oPgogI2luY2x1ZGUgPHhlbi9yYnRyZWUuaD4KLSNpbmNsdWRlIDxhc20vZ2ljLmg+Ci0jaW5j
bHVkZSA8YXNtL21taW8uaD4KIAogc3RydWN0IHBlbmRpbmdfaXJxCiB7Ci0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
