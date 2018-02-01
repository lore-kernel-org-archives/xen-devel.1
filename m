From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH v3 8/8] ARM: make nr_irqs a constant
Date: Thu, 1 Feb 2018 13:43:09 +0000
Message-ID: <ed2665f9-9c46-7df0-e372-085ece0ce766@linaro.org>
References: <20180124181058.6157-1-andre.przywara@linaro.org>
 <20180124181058.6157-9-andre.przywara@linaro.org>
 <20180130143603.2uzxacs2vq47oxev@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=df/b=e3=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ehF90-0008IW-Nd
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 13:43:14 +0000
Received: by mail-wm0-x242.google.com with SMTP id f3so5795614wmc.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2018 05:43:12 -0800 (PST)
In-Reply-To: <20180130143603.2uzxacs2vq47oxev@MacBook-Pro-de-Roger.local>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAzMC8wMS8xOCAxNDozNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQs
IEphbiAyNCwgMjAxOCBhdCAwNjoxMDo1OFBNICswMDAwLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
Pj4gT24gQVJNIHRoZSBtYXhpbXVtIG51bWJlciBvZiBJUlFzIGlzIGEgY29uc3RhbnQsIGJ1dCB3
ZSBzaGFyZSBpdCBiZWluZwo+PiBhIHZhcmlhYmxlIHRvIG1hdGNoIHg4Ni4gU2luY2Ugd2UgYXJl
IG5vdCBzdXBwb3NlZCB0byBhbHRlciBpdCwgbGV0J3MKPj4gbWFyayBpdCBhcyAiY29uc3QiIHRv
IGF2b2lkIGFjY2lkZW50YWwgY2hhbmdlLgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGxpbmFyby5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlIFByenl3
YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgo+PiAtLS0KPj4gIHhlbi9hcmNoL2FybS9p
cnEuYyAgICAgICAgfCAyICstCj4+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2lycS5oIHwgMiArLQo+
PiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMKPj4g
aW5kZXggNjIxMDNhMjBlMy4uZDIyOWNiNjg3MSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJt
L2lycS5jCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pcnEuYwo+PiBAQCAtMjcsNyArMjcsNyBAQAo+
PiAgI2luY2x1ZGUgPGFzbS9naWMuaD4KPj4gICNpbmNsdWRlIDxhc20vdmdpYy5oPgo+PiAgCj4+
IC11bnNpZ25lZCBpbnQgX19yZWFkX21vc3RseSBucl9pcnFzID0gTlJfSVJRUzsKPj4gK2NvbnN0
IHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IG5yX2lycXMgPSBOUl9JUlFTOwo+IAo+IFNob3Vs
ZG4ndCB5b3UgcmVtb3ZlIHRoZSBfX3JlYWRfbW9zdGx5IGF0dHJpYnV0ZSwgc28gdGhlIHN5bWJv
bCBpdCdzCj4gcGxhY2VkIGF0IHRoZSAucm9kYXRhIHNlY3Rpb24gYnkgdGhlIGNvbXBpbGVyPwoK
WWVzLCBtYWtlcyBzZW5zZSwgdGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dCEKY29uc3QgLi4u
IF9fcmVhZF9tb3N0bHkgc291bmRzIHNvbWV3aGF0IHJlZHVuZGFudC4KCkl0IGxvb2tzIGxpa2Ug
dGhlIGNvbXBpbGVyIGRvZXMgdGhlIHJpZ2h0IHRoaW5nIGFueXdheSwgYXMgSSBjYW4ndCBmaW5k
Cm5yX2lycXMgaW4gdGhlIEVMRiBpbiBhbnkgY2FzZS4gQm90aCB3aXRoIGFuZCB3aXRob3V0IF9f
cmVhZF9tb3N0bHkgaXQKcmVzdWx0cyBpbnRvIHRoZSB2ZXJ5IHNhbWUgYmluYXJ5LCBhY3R1YWxs
eSBldmVuIHdpdGhvdXQgdGhlIGNvbnN0LgpCdXQgSSB3aWxsIGluY2x1ZGUgdGhlIGNoYW5nZSBh
bnl3YXkuCgpDaGVlcnMsCkFuZHJlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
