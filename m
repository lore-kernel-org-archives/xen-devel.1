From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 1/8] ARM: VGIC: drop unneeded
 gic_restore_pending_irqs()
Date: Tue, 30 Jan 2018 11:48:28 +0000
Message-ID: <d9cc88ba-a9f7-95c1-8482-7977b3a7bdf3@arm.com>
References: <20180124181058.6157-1-andre.przywara@linaro.org>
 <20180124181058.6157-2-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zbpm=ez=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1egUOu-0003m8-LL
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 11:48:32 +0000
In-Reply-To: <20180124181058.6157-2-andre.przywara@linaro.org>
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

SGkgQW5kcmUsCgpPbiAyNC8wMS8xOCAxODoxMCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gSW4g
Z2ljX3Jlc3RvcmVfcGVuZGluZ19pcnFzKCkgd2UgcHVzaCBvdXIgcGVuZGluZyB2aXJ0dWFsIElS
UXMgaW50byB0aGUKPiBsaXN0IHJlZ2lzdGVycy4gVGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgb25j
ZSBmcm9tIGdpY19pbmplY3QoKSwganVzdAo+IGJlZm9yZSB3ZSByZXR1cm4gdG8gdGhlIGd1ZXN0
LCBidXQgYWxzbyBpbiBnaWNfcmVzdG9yZV9zdGF0ZSgpLCB3aGVuCj4gd2UgY29udGV4dC1zd2l0
Y2ggYSBWQ1BVLiBIYXZpbmcgYSBjbG9zZXIgbG9vayBpdCB0dXJucyBvdXQgdGhhdCB0aGUKPiBs
YXRlciBjYWxsIGlzIG5vdCBuZWVkZWQsIHNpbmNlIHdlIHdpbGwgYWx3YXlzIGNhbGwgZ2ljX2lu
amVjdCgpIGFueXdheS4KPiBTbyByZW1vdmUgdGhhdCBjYWxsIChhbmQgdGhlIGZvcndhcmQgZGVj
bGFyYXRpb24pIHRvIHN0cmVhbWxpbmUgdGhpcwo+IGludGVyZmFjZSBhbmQgbWFrZSBzZXBhcmF0
aW5nIHRoZSBHSUMgZnJvbSB0aGUgVkdJQyB3b3JsZCBsYXRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKPiAtLS0KPiAg
IHhlbi9hcmNoL2FybS9naWMuYyB8IDQgLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMuYyBiL3hlbi9hcmNoL2Fy
bS9naWMuYwo+IGluZGV4IGJhYzhhZGEyYmIuLjcyMWExN2E5ZDcgMTAwNjQ0Cj4gLS0tIGEveGVu
L2FyY2gvYXJtL2dpYy5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy5jCj4gQEAgLTM2LDggKzM2
LDYgQEAKPiAgICNpbmNsdWRlIDxhc20vdmdpYy5oPgo+ICAgI2luY2x1ZGUgPGFzbS9hY3BpLmg+
Cj4gICAKPiAtc3RhdGljIHZvaWQgZ2ljX3Jlc3RvcmVfcGVuZGluZ19pcnFzKHN0cnVjdCB2Y3B1
ICp2KTsKPiAtCj4gICBzdGF0aWMgREVGSU5FX1BFUl9DUFUodWludDY0X3QsIGxyX21hc2spOwo+
ICAgCj4gICAjZGVmaW5lIGxyX2FsbF9mdWxsKCkgKHRoaXNfY3B1KGxyX21hc2spID09ICgoMSA8
PCBnaWNfaHdfb3BzLT5pbmZvLT5ucl9scnMpIC0gMSkpCj4gQEAgLTkxLDggKzg5LDYgQEAgdm9p
ZCBnaWNfcmVzdG9yZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdikKPiAgICAgICBnaWNfaHdfb3BzLT5y
ZXN0b3JlX3N0YXRlKHYpOwo+ICAgCj4gICAgICAgaXNiKCk7Cj4gLQo+IC0gICAgZ2ljX3Jlc3Rv
cmVfcGVuZGluZ19pcnFzKHYpOwo+ICAgfQo+ICAgCj4gICAvKiBkZXNjLT5pcnEgbmVlZHMgdG8g
YmUgZGlzYWJsZWQgYmVmb3JlIGNhbGxpbmcgdGhpcyBmdW5jdGlvbiAqLwo+IAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
