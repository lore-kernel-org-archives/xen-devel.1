From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH v3 8/8] ARM: make nr_irqs a constant
Date: Thu, 1 Feb 2018 13:47:19 +0000
Message-ID: <eb6f5d64-7e18-8abb-02a6-b5e4fd9efdc2@linaro.org>
References: <20180124181058.6157-1-andre.przywara@linaro.org>
 <20180124181058.6157-9-andre.przywara@linaro.org>
 <20180130143603.2uzxacs2vq47oxev@MacBook-Pro-de-Roger.local>
 <ed2665f9-9c46-7df0-e372-085ece0ce766@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=z+tp=e3=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ehFD5-0000ER-Fh
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 13:47:27 +0000
Received: by mail-wm0-x242.google.com with SMTP id i186so5954912wmi.4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2018 05:47:26 -0800 (PST)
In-Reply-To: <ed2665f9-9c46-7df0-e372-085ece0ce766@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwMS8wMi8xOCAxMzo0MywgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gT24g
MzAvMDEvMTggMTQ6MzYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIFdlZCwgSmFuIDI0
LCAyMDE4IGF0IDA2OjEwOjU4UE0gKzAwMDAsIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+Pj4gT24g
QVJNIHRoZSBtYXhpbXVtIG51bWJlciBvZiBJUlFzIGlzIGEgY29uc3RhbnQsIGJ1dCB3ZSBzaGFy
ZSBpdCBiZWluZwo+Pj4gYSB2YXJpYWJsZSB0byBtYXRjaCB4ODYuIFNpbmNlIHdlIGFyZSBub3Qg
c3VwcG9zZWQgdG8gYWx0ZXIgaXQsIGxldCdzCj4+PiBtYXJrIGl0IGFzICJjb25zdCIgdG8gYXZv
aWQgYWNjaWRlbnRhbCBjaGFuZ2UuCj4+Pgo+Pj4gU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgo+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdh
cmEgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+Cj4+PiAtLS0KPj4+ICAgeGVuL2FyY2gvYXJt
L2lycS5jICAgICAgICB8IDIgKy0KPj4+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9pcnEuaCB8IDIg
Ky0KPj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pcnEuYyBiL3hlbi9hcmNoL2FybS9p
cnEuYwo+Pj4gaW5kZXggNjIxMDNhMjBlMy4uZDIyOWNiNjg3MSAxMDA2NDQKPj4+IC0tLSBhL3hl
bi9hcmNoL2FybS9pcnEuYwo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2lycS5jCj4+PiBAQCAtMjcs
NyArMjcsNyBAQAo+Pj4gICAjaW5jbHVkZSA8YXNtL2dpYy5oPgo+Pj4gICAjaW5jbHVkZSA8YXNt
L3ZnaWMuaD4KPj4+ICAgCj4+PiAtdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgbnJfaXJxcyA9
IE5SX0lSUVM7Cj4+PiArY29uc3QgdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgbnJfaXJxcyA9
IE5SX0lSUVM7Cj4+Cj4+IFNob3VsZG4ndCB5b3UgcmVtb3ZlIHRoZSBfX3JlYWRfbW9zdGx5IGF0
dHJpYnV0ZSwgc28gdGhlIHN5bWJvbCBpdCdzCj4+IHBsYWNlZCBhdCB0aGUgLnJvZGF0YSBzZWN0
aW9uIGJ5IHRoZSBjb21waWxlcj8KPiAKPiBZZXMsIG1ha2VzIHNlbnNlLCB0aGFua3MgZm9yIHBv
aW50aW5nIHRoaXMgb3V0IQo+IGNvbnN0IC4uLiBfX3JlYWRfbW9zdGx5IHNvdW5kcyBzb21ld2hh
dCByZWR1bmRhbnQuCj4gCj4gSXQgbG9va3MgbGlrZSB0aGUgY29tcGlsZXIgZG9lcyB0aGUgcmln
aHQgdGhpbmcgYW55d2F5LCBhcyBJIGNhbid0IGZpbmQKPiBucl9pcnFzIGluIHRoZSBFTEYgaW4g
YW55IGNhc2UuIEJvdGggd2l0aCBhbmQgd2l0aG91dCBfX3JlYWRfbW9zdGx5IGl0Cj4gcmVzdWx0
cyBpbnRvIHRoZSB2ZXJ5IHNhbWUgYmluYXJ5LCBhY3R1YWxseSBldmVuIHdpdGhvdXQgdGhlIGNv
bnN0LgoKUmVhbGx5PyBJIHdhcyBleHBlY3RpbmcgY29uc3QgZGF0YSB0byBiZSBpbiB0aGUgc2Vj
dGlvbi5yb2RhdGEuIEFyZSB5b3UgCnN1Z2dlc3RpbmcgdGhpcyBpcyBsYW5kaW5nIGluIHRoZSBz
ZWN0aW9uIC5kYXRhIGluc3RlYWQ/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
