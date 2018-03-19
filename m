From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 05/20] arm/boot: Mark construct_dom0() as __init
Date: Mon, 19 Mar 2018 19:13:44 +0000
Message-ID: <1521486839-25617-6-git-send-email-andrew.cooper3@citrix.com>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SXRzIHNvbGUgY2FsbGVyLCBzdGFydF94ZW4oKSwgaXMgX19pbml0LgoKU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYwppbmRleCAyOGVlODc2Li45ZWY5MDMwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMKKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCkBAIC0yMDk0
LDcgKzIwOTQsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZmluZF9nbnR0YWJfcmVnaW9uKHN0cnVj
dCBkb21haW4gKmQsCiAgICAgICAgICAgIGtpbmZvLT5nbnR0YWJfc3RhcnQsIGtpbmZvLT5nbnR0
YWJfc3RhcnQgKyBraW5mby0+Z250dGFiX3NpemUpOwogfQogCi1pbnQgY29uc3RydWN0X2RvbTAo
c3RydWN0IGRvbWFpbiAqZCkKK2ludCBfX2luaXQgY29uc3RydWN0X2RvbTAoc3RydWN0IGRvbWFp
biAqZCkKIHsKICAgICBzdHJ1Y3Qga2VybmVsX2luZm8ga2luZm8gPSB7fTsKICAgICBzdHJ1Y3Qg
dmNwdSAqc2F2ZWRfY3VycmVudDsKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
