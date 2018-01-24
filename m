From: Julien Grall <julien.grall@linaro.org>
Subject: [PATCH v2 0/2] xen/arm: GICv3: Only initialize ITS when
	LPIs are available
Date: Wed, 24 Jan 2018 18:26:14 +0000
Message-ID: <20180124182616.3384-1-julien.grall@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: sstabellini@kernel.org, Julien Grall <julien.grall@linaro.org>, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBzbWFsbCBwYXRjaCBzZXJpZXMgZml4IGFuIGlzc3VlIEkgZGlzY292ZXJl
ZCB3aGVuIHVzaW5nIHRoZSBGb3VuZGF0aW9uCm1vZGVsIGFuZCB0aGUgRFQgcHJvdmlkZWQgYnkg
TGludXggdXBzdHJlYW0uCgpJbmRlZWQgdGhlIERldmljZS1UcmVlIGlzIGV4cG9zaW5nIGFuIElU
UyBidXQgTFBJcyBhcmUgbm90IGF2YWlsYWJsZS4KUmVzdWx0aW5nIHRvIGFuIGVhcmx5IGNyYXNo
IG9uIFhlbi4KCldoaWxzdCB0aGlzIGxvb2tzIGEgRFQgaXNzdWUsIExpbnV4IGlzIGFibGUgdG8g
Y29wZSB3aXRoIGl0LiBTbyBJIHRoaW5rIFhlbgpzaG91bGQgYWxzbyBjb3BlIHdpdGggc3VjaCBE
VC4KCkNoZWVycywKCkp1bGllbiBHcmFsbCAoMik6CiAgeGVuL2FybTogR0lDdjM6IFBhcnNlIElU
UyBpbmZvcm1hdGlvbiBmcm9tIHRoZSBmaXJtd2FyZSB0YWJsZXMgbGF0ZXIKICAgIG9uCiAgeGVu
L2FybTogR0lDdjM6IE9ubHkgaW5pdGlhbGl6ZSBJVFMgd2hlbiB0aGUgZGlzdHJpYnV0b3Igc3Vw
cG9ydHMKICAgIExQSXMuCgogeGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYyAgICAgICAgfCA0NyAr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC9hcm0vZ2lj
LXYzLmMgICAgICAgICAgICB8IDE5ICsrKysrKysrKy0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1h
cm0vZ2ljX3YzX2l0cy5oIHwgMTIgLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNl
cnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
