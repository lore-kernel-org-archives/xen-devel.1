From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 2/8] xen/arm: p2m: Provide an helper to
 generate the VTTBR
Date: Wed, 28 Nov 2018 16:49:33 +0000
Message-ID: <20181128164939.8329-3-julien.grall@arm.com>
References: <20181128164939.8329-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=83fl=oh=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gS32a-0001hC-JB
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:50:20 +0000
In-Reply-To: <20181128164939.8329-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

QSBmb2xsb3ctdXAgcGF0Y2ggd2lsbCBuZWVkIHRvIGdlbmVyYXRlIHRoZSBWVFRCUiBpbiBhIGZl
dyBwbGFjZXMuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgotLS0KIHhlbi9hcmNoL2FybS9wMm0uYyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYwppbmRleCA2Yzc2Mjk4ZWJjLi44ZWJmMWU4ZGJh
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vcDJtLmMKKysrIGIveGVuL2FyY2gvYXJtL3AybS5j
CkBAIC00Nyw2ICs0NywxMSBAQCBzdGF0aWMgY29uc3QgcGFkZHJfdCBsZXZlbF9tYXNrc1tdID0K
IHN0YXRpYyBjb25zdCB1aW50OF90IGxldmVsX29yZGVyc1tdID0KICAgICB7IFpFUk9FVEhfT1JE
RVIsIEZJUlNUX09SREVSLCBTRUNPTkRfT1JERVIsIFRISVJEX09SREVSIH07CiAKK3N0YXRpYyB1
aW50NjRfdCBnZW5lcmF0ZV92dHRicih1aW50MTZfdCB2bWlkLCBtZm5fdCByb290X21mbikKK3sK
KyAgICByZXR1cm4gKG1mbl90b19tYWRkcihyb290X21mbikgfCAoKHVpbnQ2NF90KXZtaWQgPDwg
NDgpKTsKK30KKwogLyogVW5sb2NrIHRoZSBmbHVzaCBhbmQgZG8gYSBQMk0gVExCIGZsdXNoIGlm
IG5lY2Vzc2FyeSAqLwogdm9pZCBwMm1fd3JpdGVfdW5sb2NrKHN0cnVjdCBwMm1fZG9tYWluICpw
Mm0pCiB7CkBAIC0xMTQ3LDcgKzExNTIsNyBAQCBzdGF0aWMgaW50IHAybV9hbGxvY190YWJsZShz
dHJ1Y3QgZG9tYWluICpkKQogCiAgICAgcDJtLT5yb290ID0gcGFnZTsKIAotICAgIHAybS0+dnR0
YnIgPSBwYWdlX3RvX21hZGRyKHAybS0+cm9vdCkgfCAoKHVpbnQ2NF90KXAybS0+dm1pZCA8PCA0
OCk7CisgICAgcDJtLT52dHRiciA9IGdlbmVyYXRlX3Z0dGJyKHAybS0+dm1pZCwgcGFnZV90b19t
Zm4ocDJtLT5yb290KSk7CiAKICAgICAvKgogICAgICAqIE1ha2Ugc3VyZSB0aGF0IGFsbCBUTEJz
IGNvcnJlc3BvbmRpbmcgdG8gdGhlIG5ldyBWTUlEIGFyZSBmbHVzaGVkCi0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
