From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12] xen/arm: psci: Populate arm_smccc_res
 on PSCI_FEATURES call
Date: Mon, 18 Feb 2019 09:42:27 +0000
Message-ID: <20190218094227.27176-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BVaE=QZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gvfRg-0007lx-5M
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 09:42:40 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, jgross@suse.com, sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDBiYzZhNjhkYTUgInhlbi9hcm06IFJlcGxhY2UgY2FsbF9zbWMgd2l0aCBhcm1fc21j
Y2Nfc21jIgptaXN0YWtlbmx5IGZvcmdvdCB0byBwb3B1bGF0ZSBhcm1fc21jY2NfcmVzLiBTbyBh
IGdhcmJhZ2dlIHZhbHVlIHdhcwp1c2VkIGFzIHJldHVybiB2YWx1ZS4KCkNvdmVyaXR5LUlEOiAx
NDc2ODI3ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Ci0tLQogeGVuL2FyY2gvYXJtL3BzY2kuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wc2NpLmMg
Yi94ZW4vYXJjaC9hcm0vcHNjaS5jCmluZGV4IGQyM2NiOGU3NmUuLjBjOTBjMjMwNWMgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL2FybS9wc2NpLmMKKysrIGIveGVuL2FyY2gvYXJtL3BzY2kuYwpAQCAt
ODcsNyArODcsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBwc2NpX2ZlYXR1cmVzKHVpbnQzMl90IHBz
Y2lfZnVuY19pZCkKICAgICBpZiAoIHBzY2lfdmVyIDwgUFNDSV9WRVJTSU9OKDEsIDApICkKICAg
ICAgICAgcmV0dXJuIFBTQ0lfTk9UX1NVUFBPUlRFRDsKIAotICAgIGFybV9zbWNjY19zbWMoUFND
SV8xXzBfRk4zMl9QU0NJX0ZFQVRVUkVTLCBwc2NpX2Z1bmNfaWQsIE5VTEwpOworICAgIGFybV9z
bWNjY19zbWMoUFNDSV8xXzBfRk4zMl9QU0NJX0ZFQVRVUkVTLCBwc2NpX2Z1bmNfaWQsICZyZXMp
OwogCiAgICAgcmV0dXJuIFBTQ0lfUkVUKHJlcyk7CiB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
