From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 05/12] xen/arm: mm: Only increment mfn when
 valid in xen_pt_update
Date: Wed, 24 Apr 2019 17:59:48 +0100
Message-ID: <20190424165955.23718-6-julien.grall@arm.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJLFk-0007nN-9Z
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 17:00:12 +0000
In-Reply-To: <20190424165955.23718-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudGx5LCB0aGUgTUZOIHdpbGwgYmUgaW5jcmVtZW50ZWQgZXZlbiBpZiBpdCBpcyBpbnZh
bGlkLiBUaGlzIHdpbGwKcmVzdWx0IHRvIGhhdmUgYSB2YWxpZCBNRk4gYWZ0ZXIgdGhlIGZpcnN0
IGl0ZXJhdGlvbi4KCldoaWxlIHRoaXMgaXMgbm90IGEgbWFqb3IgcHJvYmxlbSB0b2RheSwgdGhp
cyB3aWxsIGJlIGluIHRoZSBmdXR1cmUgaWYKdGhlIGNvZGUgZXhwZWN0IGFuIGludmFsaWQgTUZO
IGF0IGV2ZXJ5IGl0ZXJhdGlvbi4KClN1Y2ggYmVoYXZpb3IgaXMgcHJldmVudGVkIGJ5IGF2b2lk
aW5nIHRvIGluY3JlbWVudCBhbiBpbnZhbGlkIE1GTi4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCA1ICsr
KystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCBiNjEy
MTdhYmQwLi5lZWU3MTIyYzg4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94
ZW4vYXJjaC9hcm0vbW0uYwpAQCAtMTA0NiwxMSArMTA0NiwxNCBAQCBzdGF0aWMgaW50IHhlbl9w
dF91cGRhdGUoZW51bSB4ZW5tYXBfb3BlcmF0aW9uIG9wLAogCiAgICAgc3Bpbl9sb2NrKCZ4ZW5f
cHRfbG9jayk7CiAKLSAgICBmb3IoOyBhZGRyIDwgYWRkcl9lbmQ7IGFkZHIgKz0gUEFHRV9TSVpF
LCBtZm4gPSBtZm5fYWRkKG1mbiwgMSkpCisgICAgZm9yKCA7IGFkZHIgPCBhZGRyX2VuZDsgYWRk
ciArPSBQQUdFX1NJWkUgKQogICAgIHsKICAgICAgICAgcmMgPSB4ZW5fcHRfdXBkYXRlX2VudHJ5
KG9wLCBhZGRyLCBtZm4sIGZsYWdzKTsKICAgICAgICAgaWYgKCByYyApCiAgICAgICAgICAgICBi
cmVhazsKKworICAgICAgICBpZiAoICFtZm5fZXEobWZuLCBJTlZBTElEX01GTikgKQorICAgICAg
ICAgICAgbWZuID0gbWZuX2FkZChtZm4sIDEpOwogICAgIH0KIAogICAgIC8qCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
