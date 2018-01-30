From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 8/8] ARM: make nr_irqs a constant
Date: Tue, 30 Jan 2018 13:24:14 +0000
Message-ID: <cbebfba6-93d1-385d-2885-caa26e2e5943@arm.com>
References: <20180124181058.6157-1-andre.przywara@linaro.org>
 <20180124181058.6157-9-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zbpm=ez=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1egVtf-0002Tr-NZ
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 13:24:23 +0000
In-Reply-To: <20180124181058.6157-9-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAyNC8wMS8xOCAxODoxMCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gT24g
QVJNIHRoZSBtYXhpbXVtIG51bWJlciBvZiBJUlFzIGlzIGEgY29uc3RhbnQsIGJ1dCB3ZSBzaGFy
ZSBpdCBiZWluZwo+IGEgdmFyaWFibGUgdG8gbWF0Y2ggeDg2LiBTaW5jZSB3ZSBhcmUgbm90IHN1
cHBvc2VkIHRvIGFsdGVyIGl0LCBsZXQncwo+IG1hcmsgaXQgYXMgImNvbnN0IiB0byBhdm9pZCBh
Y2NpZGVudGFsIGNoYW5nZS4KPiAKPiBTdWdnZXN0ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJl
LnByenl3YXJhQGxpbmFyby5vcmc+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KCkNoZWVycywKCj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vaXJxLmMgICAgICAg
IHwgMiArLQo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9pcnEuaCB8IDIgKy0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMKPiBpbmRleCA2MjEwM2Ey
MGUzLi5kMjI5Y2I2ODcxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9pcnEuYwo+ICsrKyBi
L3hlbi9hcmNoL2FybS9pcnEuYwo+IEBAIC0yNyw3ICsyNyw3IEBACj4gICAjaW5jbHVkZSA8YXNt
L2dpYy5oPgo+ICAgI2luY2x1ZGUgPGFzbS92Z2ljLmg+Cj4gICAKPiAtdW5zaWduZWQgaW50IF9f
cmVhZF9tb3N0bHkgbnJfaXJxcyA9IE5SX0lSUVM7Cj4gK2NvbnN0IHVuc2lnbmVkIGludCBfX3Jl
YWRfbW9zdGx5IG5yX2lycXMgPSBOUl9JUlFTOwo+ICAgCj4gICBzdGF0aWMgdW5zaWduZWQgaW50
IGxvY2FsX2lycXNfdHlwZVtOUl9MT0NBTF9JUlFTXTsKPiAgIHN0YXRpYyBERUZJTkVfU1BJTkxP
Q0sobG9jYWxfaXJxc190eXBlX2xvY2spOwo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
YXJtL2lycS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9pcnEuaAo+IGluZGV4IDBkMTEwZWNiMDgu
LjlkNTVlOWIxMjIgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9pcnEuaAo+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaXJxLmgKPiBAQCAtMzQsNyArMzQsNyBAQCBzdHJ1Y3Qg
YXJjaF9pcnFfZGVzYyB7Cj4gICAvKiBUaGlzIGlzIGEgc3B1cmlvdXMgaW50ZXJydXB0IElEIHdo
aWNoIG5ldmVyIG1ha2VzIGl0IGludG8gdGhlIEdJQyBjb2RlLiAqLwo+ICAgI2RlZmluZSBJTlZB
TElEX0lSUSAgICAgMTAyMwo+ICAgCj4gLWV4dGVybiB1bnNpZ25lZCBpbnQgbnJfaXJxczsKPiAr
ZXh0ZXJuIGNvbnN0IHVuc2lnbmVkIGludCBucl9pcnFzOwo+ICAgI2RlZmluZSBucl9zdGF0aWNf
aXJxcyBOUl9JUlFTCj4gICAjZGVmaW5lIGFyY2hfaHdkb21faXJxcyhkb21pZCkgTlJfSVJRUwo+
ICAgCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
