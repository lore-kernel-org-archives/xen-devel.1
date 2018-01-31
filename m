From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH v3 6/8] ARM: VGIC: factor out
	vgic_get_hw_irq_desc()
Date: Wed, 31 Jan 2018 16:24:14 +0000
Message-ID: <4e43fe67-2618-0085-fd9b-f0209afa7983@linaro.org>
References: <20180124181058.6157-1-andre.przywara@linaro.org>
 <20180124181058.6157-7-andre.przywara@linaro.org>
 <41c4cb64-9504-f52d-56c3-1acc89e64c12@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=+q94=e2=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1egvBL-0001Qp-NS
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2018 16:24:19 +0000
Received: by mail-wm0-x242.google.com with SMTP id t74so173403wme.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2018 08:24:17 -0800 (PST)
In-Reply-To: <41c4cb64-9504-f52d-56c3-1acc89e64c12@linaro.org>
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

SGksCgpPbiAzMS8wMS8xOCAxNjoxNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDI0LzAxLzE4IDE4OjEwLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPj4gQXQgdGhlIG1vbWVudCB3
ZSBoYXBwaWx5IGFjY2VzcyB0aGUgVkdJQyBpbnRlcm5hbCBzdHJ1Y3QgcGVuZGluZ19pcnEKPj4g
KHdoaWNoIGRlc2NyaWJlcyBhIHZpcnR1YWwgSVJRKSBpbiBpcnEuYy4KPj4gRmFjdG9yIG91dCB0
aGUgYWN0dWFsbHkgbmVlZGVkIGZ1bmN0aW9uYWxpdHkgdG8gbGVhcm4gdGhlIGFzc29jaWF0ZWQK
Pj4gaGFyZHdhcmUgSVJRIGFuZCBtb3ZlIHRoYXQgaW50byBnaWMtdmdpYy5jIHRvIGltcHJvdmUg
YWJzdHJhY3Rpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5w
cnp5d2FyYUBsaW5hcm8ub3JnPgo+PiBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPgo+PiAtLS0KPj4gwqAgeGVuL2FyY2gvYXJtL2dpYy12Z2ljLmPC
oMKgwqAgfCAxNSArKysrKysrKysrKysrKysKPj4gwqAgeGVuL2FyY2gvYXJtL2lycS5jwqDCoMKg
wqDCoMKgwqDCoCB8wqAgNyArKy0tLS0tCj4+IMKgIHhlbi9pbmNsdWRlL2FzbS1hcm0vdmdpYy5o
IHzCoCAyICsrCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdmdpYy5jIGIveGVu
L2FyY2gvYXJtL2dpYy12Z2ljLmMKPj4gaW5kZXggZDQ0ZTRkYWNkMy4uM2FkOThkY2QzYSAxMDA2
NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMKPj4gKysrIGIveGVuL2FyY2gvYXJt
L2dpYy12Z2ljLmMKPj4gQEAgLTQxMSw2ICs0MTEsMjEgQEAgdm9pZCBnaWNfZHVtcF92Z2ljX2lu
Zm8oc3RydWN0IHZjcHUgKnYpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwcmludGsoIlBlbmRpbmcg
aXJxPSVkXG4iLCBwLT5pcnEpOwo+PiDCoCB9Cj4+IMKgICtzdHJ1Y3QgaXJxX2Rlc2MgKnZnaWNf
Z2V0X2h3X2lycV9kZXNjKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2Y3B1Cj4+ICp2LAo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHZpcnEpCj4+ICt7Cj4+ICvCoMKgwqAgc3Ry
dWN0IHBlbmRpbmdfaXJxICpwOwo+PiArCj4+ICvCoMKgwqAgaWYgKCAhdiApCj4+ICvCoMKgwqDC
oMKgwqDCoCB2ID0gZC0+dmNwdVswXTsKPiAKPiBJIGRpc2xpa2UgdGhpcyBuZXcgZnVuY3Rpb24g
aW4gdGhlIGN1cnJlbnQgc3RhdGUuIExldCdzIGltYWdpbmUgc29tZW9uZQo+IGRlY2lkZSB0byBw
YXNzIGEgUFBJIGJ1dCBubyB2Q1BVLiBUaGUgdkNQVSB3b3VsZCBub3cgYmUgZGVmYXVsdCB0byB2
Q1BVMAo+IGFuZCBwb3RlbnRpYWxseSByZXR1cm5pbmcgdGhlIHdyb25nIGlycV9kZXNjIChpbWFn
aW5lIFBQSSBwYXNzdGhyb3VnaAo+IHN1Y2ggYXMgZm9yIHRoZSB2dGltZXIpLgo+IAo+IFNvIHRo
ZSBjb2RlIG5lZWRzIGF0IGxlYXN0IGNoZWNraW5nIHRoZSB2Q1BVIGlzIHBhc3NlZCBpbiB0aGUg
Y2FzZSBvZiBhCj4gUFBJLiBJIHdvdWxkIGJlIGhhcHB5IHdpdGggYW4gQVNTRVJUKCkuCgpZZWFo
LCBnb29kIHBvaW50LiBTb21ldGhpbmcgbGlrZSBBU1NFUlQoIXYgJiYgdmlycSA+PSAzMiksIEkg
Z3Vlc3M/CgpDaGVlcnMsCkFuZHJlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
