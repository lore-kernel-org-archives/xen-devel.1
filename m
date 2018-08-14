From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 04/15] xen/arm: p2m: Reduce the locking
 section in get_page_from_gva
Date: Tue, 14 Aug 2018 13:49:39 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808141349270.15066@sstabellini-ThinkPad-X260>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-5-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pgrk=k5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fpgG7-0005ib-Pi
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 20:49:43 +0000
In-Reply-To: <20180716172712.20294-5-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxNiBKdWwgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBwMm0gbG9jayBp
cyBvbmx5IG5lY2Vzc2FyeSB0byBwcmV2ZW50IGd2aXJ0X3RvX21hZGRyIGZhaWxpbmcgd2hlbgo+
IGJyZWFrLWJlZm9yZS1tYWtlIHNlcXVlbmNlIGlzIHVzZWQgaW4gdGhlIFAyTSB1cGRhdGUgY29u
Y3VycmVudGx5IG9uCj4gYW5vdGhlciBwQ1BVLiBTbyByZWR1Y2UgdGhlIGxvY2tpbmcgc2VjdGlv
bi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KCj4gLS0tCj4gCj4gICAgIE5vdGUgYSBuZXdsaW5lIGhhcyBiZWVuIGRyb3BwZWQgdG8ga2Vl
cCB0aGUgYmxvY2sgdG9nZXRoZXIuCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9wMm0uYyB8IDggKysr
KystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5j
Cj4gaW5kZXggMTQ3OTEzODhhZC4uNWNhN2ZmZTQxYiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9h
cm0vcDJtLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPiBAQCAtMTQxNSw5ICsxNDE1LDEz
IEBAIHN0cnVjdCBwYWdlX2luZm8gKmdldF9wYWdlX2Zyb21fZ3ZhKHN0cnVjdCB2Y3B1ICp2LCB2
YWRkcl90IHZhLAo+ICAgICAgaWYgKCB2ICE9IGN1cnJlbnQgKQo+ICAgICAgICAgIHJldHVybiBO
VUxMOwo+ICAKPiArICAgIC8qCj4gKyAgICAgKiBUaGUgbG9jayBpcyBoZXJlIHRvIHByb3RlY3Qg
dXMgYWdhaW5zdCB0aGUgYnJlYWstYmVmb3JlLW1ha2UKPiArICAgICAqIHNlcXVlbmNlIHVzZWQg
d2hlbiB1cGRhdGluZyB0aGUgZW50cnkuCj4gKyAgICAgKi8KPiAgICAgIHAybV9yZWFkX2xvY2so
cDJtKTsKPiAtCj4gICAgICBwYXIgPSBndmlydF90b19tYWRkcih2YSwgJm1hZGRyLCBmbGFncyk7
Cj4gKyAgICBwMm1fcmVhZF91bmxvY2socDJtKTsKPiAgCj4gICAgICBpZiAoIHBhciApCj4gICAg
ICB7Cj4gQEAgLTE0NDUsOCArMTQ0OSw2IEBAIHN0cnVjdCBwYWdlX2luZm8gKmdldF9wYWdlX2Zy
b21fZ3ZhKHN0cnVjdCB2Y3B1ICp2LCB2YWRkcl90IHZhLAo+ICAgICAgfQo+ICAKPiAgZXJyOgo+
IC0gICAgcDJtX3JlYWRfdW5sb2NrKHAybSk7Cj4gLQo+ICAgICAgaWYgKCAhcGFnZSAmJiBwMm0t
Pm1lbV9hY2Nlc3NfZW5hYmxlZCApCj4gICAgICAgICAgcGFnZSA9IHAybV9tZW1fYWNjZXNzX2No
ZWNrX2FuZF9nZXRfcGFnZSh2YSwgZmxhZ3MsIHYpOwo+ICAKPiAtLSAKPiAyLjExLjAKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
