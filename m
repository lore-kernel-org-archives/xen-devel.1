From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v2 14/21] xen/arm: Remove unnecessary includes
 in asm/vgic.h
Date: Wed, 31 Oct 2018 18:13:06 +0000
Message-ID: <20181031181313.8028-15-julien.grall@arm.com>
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

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3
ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLS0KICAgIENo
YW5nZXMgaW4gdjI6CiAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4v
aW5jbHVkZS9hc20tYXJtL3ZnaWMuaCB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3ZnaWMuaCBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vdmdpYy5oCmluZGV4IDc2MDM5MmY5ZWYuLjAzMTZkODdmNjYgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vdmdpYy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0v
dmdpYy5oCkBAIC0yMiwxMSArMjIsOCBAQAogI2luY2x1ZGUgPGFzbS9uZXdfdmdpYy5oPgogI2Vs
c2UKIAotI2luY2x1ZGUgPHhlbi9iaXRvcHMuaD4KICNpbmNsdWRlIDx4ZW4vcmFkaXgtdHJlZS5o
PgogI2luY2x1ZGUgPHhlbi9yYnRyZWUuaD4KLSNpbmNsdWRlIDxhc20vZ2ljLmg+Ci0jaW5jbHVk
ZSA8YXNtL21taW8uaD4KIAogc3RydWN0IHBlbmRpbmdfaXJxCiB7Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
