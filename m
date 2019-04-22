From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 13/20] xen/arm32: mm: Avoid to zero and clean
 cache for CPU0 domheap
Date: Mon, 22 Apr 2019 17:49:30 +0100
Message-ID: <20190422164937.21350-14-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8v-000591-VL
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:09 +0000
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

VGhlIHBhZ2UtdGFibGUgd2Fsa2VyIGlzIGNvbmZpZ3VyZWQgdG8gdXNlIHRoZSBzYW1lIHNoYXJl
YWJpbGl0eSBhbmQKY2FjaGVhYmlsaXR5IGFzIHRoZSBhY2Nlc3MgcGVyZm9ybWVkIHdoZW4gdXBk
YXRpbmcgdGhlIHBhZ2UtdGFibGVzLiBUaGlzCm1lYW5zIGNsZWFuaW5nIHRoZSBjYWNoZSBmb3Ig
Q1BVMCBkb21oZWFwIGlzIHVubmVjZXNzYXJ5LgoKRnVydGhlcm1vcmUsIENQVTAgcGFnZS10YWJs
ZXMgYXJlIHBhcnQgb2YgWGVuIGJpbmFyeSBhbmQgd2lsbCBhbHJlYWR5IGJlCnplcm9lZCBiZWZv
cmVoYW5kLiBTbyBpdCBpcyBwb2ludGxlc3MgdG8gemVybyB0aGUgZG9taGVhcCBhZ2Fpbi4KClNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVu
L2FyY2gvYXJtL21tLmMgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCmluZGV4
IGUwOTBhZmI5NzYuLmNkYTI4NDdkMDAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCisr
KyBiL3hlbi9hcmNoL2FybS9tbS5jCkBAIC03MjQsMTEgKzcyNCw2IEBAIHZvaWQgX19pbml0IHNl
dHVwX3BhZ2V0YWJsZXModW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0KQogI2lmZGVmIENP
TkZJR19BUk1fMzIKICAgICBwZXJfY3B1KHhlbl9wZ3RhYmxlLCAwKSA9IGNwdTBfcGd0YWJsZTsK
ICAgICBwZXJfY3B1KHhlbl9kb21tYXAsIDApID0gY3B1MF9kb21tYXA7Ci0KLSAgICAvKiBNYWtl
IHN1cmUgaXQgaXMgY2xlYXIgKi8KLSAgICBtZW1zZXQodGhpc19jcHUoeGVuX2RvbW1hcCksIDAs
IERPTUhFQVBfU0VDT05EX1BBR0VTKlBBR0VfU0laRSk7Ci0gICAgY2xlYW5fZGNhY2hlX3ZhX3Jh
bmdlKHRoaXNfY3B1KHhlbl9kb21tYXApLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
RE9NSEVBUF9TRUNPTkRfUEFHRVMqUEFHRV9TSVpFKTsKICNlbmRpZgogfQogCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
