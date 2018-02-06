From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 1/2] xen/arm: Extend the number of memory banks
	supported
Date: Tue,  6 Feb 2018 19:56:54 +0000
Message-ID: <20180206195655.7097-2-julien.grall@arm.com>
References: <20180206195655.7097-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180206195655.7097-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, ian.jackson@eu.citrix.com, mjaggi@caviumnetworks.com
List-Id: xen-devel@lists.xenproject.org

V2hlbiBib290aW5nIHVzaW5nIEdydWIgb24gVGh1bmRlci1YLCB0aGUgbnVtYmVyIG9mIG1lbW9y
eSBhdmFpbGFibGUgaXMKZ3JlYXRlciB0aGFuIDY0LiBCdW1wIHRoZSBudW1iZXIgdG8gMTI4LCBz
byB3ZSBjYW4gdGFrZSBhZHZhbnRhZ2Ugb2YgYWxsCnRoZSBtZW1vcnkuCgpTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCgogICAgTm90ZSB0aGF0
IEkgd2Fzbid0IGFibGUgdG8gYm9vdCB3aXRob3V0IHRoaXMgcGF0Y2gsIGJlY2F1c2UgRUZJIHN0
dWIKICAgIGlzIHByaW50aW5nIGFuIGVycm9yIHdoZW4gdGhlIG51bWJlciBvZiByZWdpb24gZXhj
ZWVkIDY0LiBUaGlzIHdpbGwKICAgIHJlc3VsdCB0byBmcmFnbWVudCBpbiBiaXQgbW9yZSB0aGUg
bWVtb3J5IChzb3VuZHMgbGlrZSBwcmludAogICAgYWxsb2NhdGUgbWVtb3J5KSBhbmQgd2lsbCBm
YWlsIHRvIGdldCB0aGUgbWVtb3J5IG9uIHJldHJ5LgotLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0v
c2V0dXAuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vc2V0dXAuaCBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vc2V0dXAuaAppbmRleCA3ZmYyYzM0ZGFiLi4wY2MzMzMwODA3IDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9zZXR1cC5oCkBAIC02LDcgKzYsNyBAQAogI2RlZmluZSBNSU5fRkRUX0FMSUdOIDgKICNkZWZp
bmUgTUFYX0ZEVF9TSVpFIFNaXzJNCiAKLSNkZWZpbmUgTlJfTUVNX0JBTktTIDY0CisjZGVmaW5l
IE5SX01FTV9CQU5LUyAxMjgKIAogI2RlZmluZSBNQVhfTU9EVUxFUyA1IC8qIEN1cnJlbnQgbWF4
aW11bSB1c2VmdWwgbW9kdWxlcyAqLwogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
