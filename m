From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 05/12] xen/arm64: bitops: Match the register
 size with the value size in flsl
Date: Wed, 27 Mar 2019 18:45:24 +0000
Message-ID: <20190327184531.30986-6-julien.grall@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h58V=R6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9DYd-0001jI-0n
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 18:45:51 +0000
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

Q2xhbmcgaXMgcGlja2llciB0aGFuIEdDQyBmb3IgdGhlIHJlZ2lzdGVyIHNpemUgaW4gYXNtIHN0
YXRlbWVudC4gSXQgZXhwZWN0cwp0aGUgcmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUg
c2l6ZS4KClRoZSBpbnN0cnVjdGlvbiBjbHogaXMgZXhwZWN0aW5nIHRoZSB0d28gb3BlcmFuZHMg
dG8gYmUgdGhlIHNhbWUgc2l6ZQooaS5lIDMyLWJpdCBvciA2NC1iaXQpLiBBcyB0aGUgZmxzbCBm
dW5jdGlvbiBpcyBkZWFsaW5nIHdpdGggNjQtYml0CnZhbHVlLCB3ZSBuZWVkIHRvIG1ha2UgdGhl
IGRlc3RpbmF0aW9uIHZhcmlhYmxlIDY0LWJpdCBhcyB3ZWxsLgoKV2hpbGUgYXQgaXQsIGFkZCBh
IG5ld2xpbmUgYmVmb3JlIHRoZSByZXR1cm4gc3RhdGVtZW50LgoKU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJt
L2FybTY0L2JpdG9wcy5oIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2Jp
dG9wcy5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaAppbmRleCA2YmYxOTIy
NjgwLi4wNTA0NWYxMTA5IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2Jp
dG9wcy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYml0b3BzLmgKQEAgLTM0LDEy
ICszNCwxMyBAQCBzdGF0aWMgLypfXyovYWx3YXlzX2lubGluZSB1bnNpZ25lZCBsb25nIF9fZmZz
KHVuc2lnbmVkIGxvbmcgd29yZCkKIAogc3RhdGljIGlubGluZSBpbnQgZmxzbCh1bnNpZ25lZCBs
b25nIHgpCiB7Ci0gICAgICAgIGludCByZXQ7CisgICAgICAgIHVpbnQ2NF90IHJldDsKIAogICAg
ICAgICBpZiAoX19idWlsdGluX2NvbnN0YW50X3AoeCkpCiAgICAgICAgICAgICAgICByZXR1cm4g
Z2VuZXJpY19mbHNsKHgpOwogCiAgICAgICAgIGFzbSgiY2x6XHQlMCwgJTEiIDogIj1yIiAocmV0
KSA6ICJyIiAoeCkpOworCiAgICAgICAgIHJldHVybiBCSVRTX1BFUl9MT05HIC0gcmV0OwogfQog
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
