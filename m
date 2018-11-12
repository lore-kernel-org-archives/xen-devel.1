From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] x86: fix hvm_migrate_irq assertion
Date: Mon, 12 Nov 2018 14:04:59 +0000
Message-ID: <20181112140459.23480-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v6tt=nx=citrix.com=prvs=847216550=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gMCqQ-0008MU-BT
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 14:05:38 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

NzgyY2Y4YmE0NiAoInBhc3MtdGhyb3VnaDogYWRqdXN0IHBJUlEgbWlncmF0aW9uIikgYWRkZWQg
YW4gYXNzZXJ0aW9uCnRvIGh2bV9taWdyYXRlX2lycS4KClBWSCBEb20wIGlzIGJyb2tlbiBiZWNh
dXNlIGl0IGRvZXNuJ3QgaGF2ZSBkcGNpIGFsbG9jYXRlZC4gQWRkIGFuCmlzX2hhcmR3YXJlX2Rv
bWFpbiBjaGVjayB0byB0aGUgYXNzZXJ0aW9uLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jIHwgMyArKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwppbmRleCA1
MTkyODI5MzdiLi41ZDI2M2M0MDkwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAgLTQ2NCw3ICs0NjQsOCBAQCB2b2lkIGh2
bV9taWdyYXRlX3RpbWVycyhzdHJ1Y3QgdmNwdSAqdikKIAogdm9pZCBodm1fbWlncmF0ZV9waXJx
KHN0cnVjdCBodm1fcGlycV9kcGNpICpwaXJxX2RwY2ksIGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQog
ewotICAgIEFTU0VSVChpb21tdV9lbmFibGVkICYmIGh2bV9kb21haW5faXJxKHYtPmRvbWFpbikt
PmRwY2kpOworICAgIEFTU0VSVChpb21tdV9lbmFibGVkICYmCisgICAgICAgICAgIChpc19oYXJk
d2FyZV9kb21haW4odi0+ZG9tYWluKSB8fCBodm1fZG9tYWluX2lycSh2LT5kb21haW4pLT5kcGNp
KSk7CiAKICAgICBpZiAoIChwaXJxX2RwY2ktPmZsYWdzICYgSFZNX0lSUV9EUENJX01BQ0hfTVNJ
KSAmJgogICAgICAgICAgLyogTmVlZG4ndCBtaWdyYXRlIHBpcnEgaWYgdGhpcyBwaXJxIGlzIGRl
bGl2ZXJlZCB0byBndWVzdCBkaXJlY3RseS4qLwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
