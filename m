From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 11/12] xen/arm: traps: Mark
 check_stack_alignment_constraints as unused
Date: Wed, 27 Mar 2019 18:45:30 +0000
Message-ID: <20190327184531.30986-12-julien.grall@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h58V=R6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9DYl-0001mT-Ht
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 18:45:59 +0000
In-Reply-To: <20190327184531.30986-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

Q2xhbmcgd2lsbCB0aHJvdyBhbiBlcnJvciBpZiBhIGZ1bmN0aW9uIGlzIHVudXNlZCB1bmxlc3Mg
eW91IHRlbGwKdG8gaWdub3JlIGl0LiBUaGlzIGNhbiBiZSBkb25lIHVzaW5nIF9fbWF5YmVfdW51
c2VkLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
LS0tCiB4ZW4vYXJjaC9hcm0vdHJhcHMuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RyYXBz
LmMgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwppbmRleCBkOGI5YThhMGYwLi42NjE0NzU2NjZhIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYworKysgYi94ZW4vYXJjaC9hcm0vdHJhcHMu
YwpAQCAtNTQsNyArNTQsOCBAQAogICogdGhhdCBib3RoIHRoZSBrZXJuZWwgaGFsZiBvZiBzdHJ1
Y3QgY3B1X3VzZXJfcmVncyAod2hpY2ggaXMgcHVzaGVkIGluCiAgKiBlbnRyeS5TKSBhbmQgc3Ry
dWN0IGNwdV9pbmZvICh3aGljaCBsaXZlcyBhdCB0aGUgYm90dG9tIG9mIGEgWGVuCiAgKiBzdGFj
aykgbXVzdCBiZSBkb3VibGV3b3JkLWFsaWduZWQgaW4gc2l6ZS4gICovCi1zdGF0aWMgaW5saW5l
IHZvaWQgY2hlY2tfc3RhY2tfYWxpZ25tZW50X2NvbnN0cmFpbnRzKHZvaWQpIHsKK3N0YXRpYyB2
b2lkIF9fbWF5YmVfdW51c2VkIGNoZWNrX3N0YWNrX2FsaWdubWVudF9jb25zdHJhaW50cyh2b2lk
KQorewogI2lmZGVmIENPTkZJR19BUk1fNjQKICAgICBCVUlMRF9CVUdfT04oKHNpemVvZiAoc3Ry
dWN0IGNwdV91c2VyX3JlZ3MpKSAmIDB4Zik7CiAgICAgQlVJTERfQlVHX09OKChvZmZzZXRvZihz
dHJ1Y3QgY3B1X3VzZXJfcmVncywgc3Bzcl9lbDEpKSAmIDB4Zik7Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
