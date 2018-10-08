From: Julien Grall <julien.grall@arm.com>
Subject: [RFC 13/16] xen/arm: p2m: Allow to flush cache on any
 RAM region
Date: Mon,  8 Oct 2018 19:33:49 +0100
Message-ID: <20181008183352.16291-14-julien.grall@arm.com>
References: <20181008183352.16291-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181008183352.16291-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudGx5LCB3ZSBvbmx5IGFsbG93IHRvIGZsdXNoIGNhY2hlIG9uIHJlZ2lvbiBtYXBwZWQg
YXMgcDJtX3JhbV97cncscm99LgoKVGhlcmUgYXJlIG5vIHJlYWwgcHJvYmxlbSB0byBmbHVzaCBj
YWNoZSBvbiBhbnkgUkFNIHJlZ2lvbiBzdWNoIGFzIGdyYW50cwphbmQgZm9yZWlnbiBtYXBwaW5n
LiBUaGVyZWZvcmUsIHJlbGF4IHRoZSBjYWNoZSB0byBhbGxvdyBmbHVzaGluZyB0aGUKY2FjaGUg
b24gYW55IFJBTSByZWdpb24uCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9wMm0uYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYwppbmRleCA4NTM3YjdiYWIxLi4xMmI0NTk5
MjRiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vcDJtLmMKKysrIGIveGVuL2FyY2gvYXJtL3Ay
bS5jCkBAIC0xNTMyLDcgKzE1MzIsNyBAQCBpbnQgcDJtX2NhY2hlX2ZsdXNoX3JhbmdlKHN0cnVj
dCBkb21haW4gKmQsIGdmbl90IHN0YXJ0LCBnZm5fdCBlbmQpCiAgICAgICAgIG5leHRfZ2ZuID0g
Z2ZuX25leHRfYm91bmRhcnkoc3RhcnQsIG9yZGVyKTsKIAogICAgICAgICAvKiBTa2lwIGhvbGUg
YW5kIG5vbi1SQU0gcGFnZSAqLwotICAgICAgICBpZiAoIG1mbl9lcShtZm4sIElOVkFMSURfTUZO
KSB8fCAhcDJtX2lzX3JhbSh0KSApCisgICAgICAgIGlmICggbWZuX2VxKG1mbiwgSU5WQUxJRF9N
Rk4pIHx8ICFwMm1faXNfYW55X3JhbSh0KSApCiAgICAgICAgICAgICBjb250aW51ZTsKIAogICAg
ICAgICAvKiBYWFg6IEltcGxlbWVudCBwcmVlbXB0aW9uICovCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
