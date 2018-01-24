From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH 3/7] ARM: GICv3: emit optional DT property
 only when necessary
Date: Wed, 24 Jan 2018 16:59:56 +0000
Message-ID: <21d4785f-a0b5-32d6-2f55-ca286cb88b2c@linaro.org>
References: <20180124143517.18469-1-andre.przywara@linaro.org>
 <20180124143517.18469-4-andre.przywara@linaro.org>
 <0344bf88-9c7a-d7ea-e5d6-49343ea666cd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=5dpo=et=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eeOOw-00084R-9i
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 16:59:54 +0000
Received: by mail-wm0-x242.google.com with SMTP id 143so9705362wma.5
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2018 08:59:52 -0800 (PST)
In-Reply-To: <0344bf88-9c7a-d7ea-e5d6-49343ea666cd@linaro.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNC8wMS8xOCAxNjozMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJlLAo+
IAo+IE9uIDI0LzAxLzE4IDE0OjM1LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPj4gVGhlIEFSTSBH
SUN2MyBEVCBwcm9wZXJ0eSAiI3JlZGlzdHJpYnV0b3ItcmVnaW9ucyIgaXMgb3B0aW9uYWwgYW5k
IG9ubHkKPj4gdXNlZnVsIGlmIGl0IGhhcyBhbnkgb3RoZXIgdmFsdWVzIHRoYW4gdGhlIGFyY2hp
dGVjdGVkICIxIi4KPj4gS2VlcCBvdXIgZ2VuZXJhdGVkIERUIG5vZGUgY2xlYW4gYnkgZW1pdHRp
bmcgdGhpcyBwcm9wZXJ0eSBvbmx5IGlmIHdlCj4+IGFjdHVhbGx5IG5lZWQgbW9yZSB0aGFuIG9u
ZSByZWdpb24uCj4gCj4gSSByZWFsbHkgZG9uJ3Qgc2VlIHRoZSBiZW5lZml0cyBvZiB0aGlzIHBh
dGNoLiBJdCBpcyBmaW5lIHRvIGhhdmUKPiAjcmVkaXN0cmlidXRvci1yZWdpb25zIHByb3BlcnR5
IGluIHRoZSBEVC4gWW91IG1pZ2h0ICJjbGVhbiIgdGhlIERUIGJ1dAo+IG1ha2UgdGhlIGNvZGUg
YSBiaXQgbW9yZSBjb21wbGV4LgoKRmFpciBlbm91Z2gsIEkgY2FuIGVhc2lseSBkcm9wIHRoaXMg
cGF0Y2guCldhcyBhIHZpY3RpbSBwYXRjaCBhbnl3YXkgdG8gZ2l2ZSByZXZpZXdlcnMgc29tZSBz
YXRpc2ZhY3Rpb24gOi1ECgpDaGVlcnMsCkFuZHJlLgoKPiAKPiBDaGVlcnMsCj4gCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgo+
PiAtLS0KPj4gwqAgeGVuL2FyY2gvYXJtL2dpYy12My5jIHwgMTEgKysrKysrKy0tLS0KPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdjMuYyBiL3hlbi9hcmNoL2FybS9naWMtdjMuYwo+
PiBpbmRleCBhMGQyOTBiNTVjLi45YWQwY2QxOWVmIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vZ2ljLXYzLmMKPj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy12My5jCj4+IEBAIC0xMTY4LDEw
ICsxMTY4LDEzIEBAIHN0YXRpYyBpbnQgZ2ljdjNfbWFrZV9od2RvbV9kdF9ub2RlKGNvbnN0Cj4+
IHN0cnVjdCBkb21haW4gKmQsCj4+IMKgwqDCoMKgwqAgaWYgKCByZXMgKQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIHJlczsKPj4gwqAgLcKgwqDCoCByZXMgPSBmZHRfcHJvcGVydHlfY2Vs
bChmZHQsICIjcmVkaXN0cmlidXRvci1yZWdpb25zIiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkLT5hcmNoLnZnaWMubnJfcmVnaW9u
cyk7Cj4+IC3CoMKgwqAgaWYgKCByZXMgKQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJlczsK
Pj4gK8KgwqDCoCBpZiAoIGQtPmFyY2gudmdpYy5ucl9yZWdpb25zID4gMSApCj4+ICvCoMKgwqAg
ewo+PiArwqDCoMKgwqDCoMKgwqAgcmVzID0gZmR0X3Byb3BlcnR5X2NlbGwoZmR0LCAiI3JlZGlz
dHJpYnV0b3ItcmVnaW9ucyIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkLT5hcmNoLnZnaWMubnJfcmVnaW9ucyk7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAoIHJlcyApCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiByZXM7Cj4+ICvCoMKgwqAgfQo+PiDCoCDCoMKgwqDCoMKgIGxlbiA9IGR0X2NlbGxzX3Rv
X3NpemUoZHRfbl9hZGRyX2NlbGxzKGdpYykgKwo+PiBkdF9uX3NpemVfY2VsbHMoZ2ljKSk7Cj4+
IMKgwqDCoMKgwqAgLyoKPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
