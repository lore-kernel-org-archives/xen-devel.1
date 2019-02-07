From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 54/55] x86: switch to use domheap page for
 page tables
Date: Thu, 7 Feb 2019 16:44:55 +0000
Message-ID: <20190207164456.9260-55-wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBy9=QO=citrix.com=prvs=93456468f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1grn1y-0001v7-MR
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 17:00:06 +0000
In-Reply-To: <20190207164456.9260-1-wei.liu2@citrix.com>
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

TW9kaWZ5IGFsbCB0aGUgX25ldyBBUElzIHRvIGhhbmRsZSBkb21oZWFwIHBhZ2VzLgoKU2lnbmVk
LW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYv
bW0uYyB8IDEzICsrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJj
aC94ODYvbW0uYwppbmRleCAyYTM0NDJkODgxLi45N2RkNmE3ZjYzIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtNDcyNywxMCArNDcyNywx
MCBAQCBtZm5fdCBhbGxvY194ZW5fcGFnZXRhYmxlX25ldyh2b2lkKQogewogICAgIGlmICggc3lz
dGVtX3N0YXRlICE9IFNZU19TVEFURV9lYXJseV9ib290ICkKICAgICB7Ci0gICAgICAgIHZvaWQg
KnB0ciA9IGFsbG9jX3hlbmhlYXBfcGFnZSgpOworICAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpw
ZyA9IGFsbG9jX2RvbWhlYXBfcGFnZShOVUxMLCAwKTsKIAotICAgICAgICBCVUdfT04oIWhhcmR3
YXJlX2RvbWFpbiAmJiAhcHRyKTsKLSAgICAgICAgcmV0dXJuIHZpcnRfdG9fbWZuKHB0cik7Cisg
ICAgICAgIEJVR19PTighaGFyZHdhcmVfZG9tYWluICYmICFwZyk7CisgICAgICAgIHJldHVybiBw
ZyA/IHBhZ2VfdG9fbWZuKHBnKSA6IElOVkFMSURfTUZOOwogICAgIH0KIAogICAgIHJldHVybiBh
bGxvY19ib290X3BhZ2VzKDEsIDEpOwpAQCAtNDczOCwyMCArNDczOCwyMSBAQCBtZm5fdCBhbGxv
Y194ZW5fcGFnZXRhYmxlX25ldyh2b2lkKQogCiB2b2lkICptYXBfeGVuX3BhZ2V0YWJsZV9uZXco
bWZuX3QgbWZuKQogewotICAgIHJldHVybiBtZm5fdG9fdmlydChtZm5feChtZm4pKTsKKyAgICBy
ZXR1cm4gbWFwX2RvbWFpbl9wYWdlKG1mbik7CiB9CiAKIC8qIHYgY2FuIHBvaW50IHRvIGFuIGVu
dHJ5IHdpdGhpbiBhIHRhYmxlIG9yIGJlIE5VTEwgKi8KIHZvaWQgdW5tYXBfeGVuX3BhZ2V0YWJs
ZV9uZXcodm9pZCAqdikKIHsKLSAgICAvKiBYWFggc3RpbGwgdXNpbmcgeGVuaGVhcCBwYWdlLCBu
byBuZWVkIHRvIGRvIGFueXRoaW5nLiAgKi8KKyAgICBpZiAoIHYgKQorICAgICAgICB1bm1hcF9k
b21haW5fcGFnZSgoY29uc3Qgdm9pZCAqKSgodW5zaWduZWQgbG9uZyl2ICYgUEFHRV9NQVNLKSk7
CiB9CiAKIC8qIG1mbiBjYW4gYmUgSU5WQUxJRF9NRk4gKi8KIHZvaWQgZnJlZV94ZW5fcGFnZXRh
YmxlX25ldyhtZm5fdCBtZm4pCiB7CiAgICAgaWYgKCBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRF
X2Vhcmx5X2Jvb3QgJiYgIW1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApCi0gICAgICAgIGZyZWVf
eGVuaGVhcF9wYWdlKG1mbl90b192aXJ0KG1mbl94KG1mbikpKTsKKyAgICAgICAgZnJlZV9kb21o
ZWFwX3BhZ2UobWZuX3RvX3BhZ2UobWZuKSk7CiB9CiAKIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0so
bWFwX3BnZGlyX2xvY2spOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
