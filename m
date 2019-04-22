From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 16/20] xen/arm: mm: Protect Xen page-table
 update with a spinlock
Date: Mon, 22 Apr 2019 17:49:33 +0100
Message-ID: <20190422164937.21350-17-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8z-0005Ie-Sj
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:13 +0000
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
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

VGhlIGZ1bmN0aW9uIGNyZWF0ZV94ZW5fZW50cmllcyBtYXkgYmUgY29uY3VycmVudGx5IGNhbGxl
ZC4gU28gd2UgbmVlZAp0byBwcm90ZWN0IHdpdGggYSBzcGlubG9jayB0byBhdm9pZCBjb3JydXB0
aW9uIHRoZSBwYWdlLXRhYmxlcy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCA2ICsrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5j
IGIveGVuL2FyY2gvYXJtL21tLmMKaW5kZXggZmEwZjQxYmQwNy4uZWNkZTRlMzRkZiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTk2OSw2
ICs5NjksOCBAQCBlbnVtIHhlbm1hcF9vcGVyYXRpb24gewogICAgIFJFU0VSVkUKIH07CiAKK3N0
YXRpYyBERUZJTkVfU1BJTkxPQ0soeGVuX3B0X2xvY2spOworCiBzdGF0aWMgaW50IGNyZWF0ZV94
ZW5fZW50cmllcyhlbnVtIHhlbm1hcF9vcGVyYXRpb24gb3AsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIHZpcnQsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtZm5fdCBtZm4sCkBAIC05ODAsNiArOTgyLDggQEAgc3RhdGljIGludCBjcmVhdGVfeGVu
X2VudHJpZXMoZW51bSB4ZW5tYXBfb3BlcmF0aW9uIG9wLAogICAgIGxwYWVfdCBwdGUsICplbnRy
eTsKICAgICBscGFlX3QgKnRoaXJkID0gTlVMTDsKIAorICAgIHNwaW5fbG9jaygmeGVuX3B0X2xv
Y2spOworCiAgICAgZm9yKDsgYWRkciA8IGFkZHJfZW5kOyBhZGRyICs9IFBBR0VfU0laRSwgbWZu
ID0gbWZuX2FkZChtZm4sIDEpKQogICAgIHsKICAgICAgICAgZW50cnkgPSAmeGVuX3NlY29uZFtz
ZWNvbmRfbGluZWFyX29mZnNldChhZGRyKV07CkBAIC0xMDU0LDYgKzEwNTgsOCBAQCBvdXQ6CiAg
ICAgICovCiAgICAgZmx1c2hfeGVuX3RsYl9yYW5nZV92YSh2aXJ0LCBQQUdFX1NJWkUgKiBucl9t
Zm5zKTsKIAorICAgIHNwaW5fdW5sb2NrKCZ4ZW5fcHRfbG9jayk7CisKICAgICByZXR1cm4gcmM7
CiB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
