From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 8/8] ARM: make nr_irqs a constant
Date: Tue, 30 Jan 2018 14:36:03 +0000
Message-ID: <20180130143603.2uzxacs2vq47oxev@MacBook-Pro-de-Roger.local>
References: <20180124181058.6157-1-andre.przywara@linaro.org>
 <20180124181058.6157-9-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/cio=ez=citrix.com=prvs=561c7975c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1egX1l-00084Z-Rj
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 14:36:49 +0000
Content-Disposition: inline
In-Reply-To: <20180124181058.6157-9-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMDY6MTA6NThQTSArMDAwMCwgQW5kcmUgUHJ6eXdhcmEg
d3JvdGU6Cj4gT24gQVJNIHRoZSBtYXhpbXVtIG51bWJlciBvZiBJUlFzIGlzIGEgY29uc3RhbnQs
IGJ1dCB3ZSBzaGFyZSBpdCBiZWluZwo+IGEgdmFyaWFibGUgdG8gbWF0Y2ggeDg2LiBTaW5jZSB3
ZSBhcmUgbm90IHN1cHBvc2VkIHRvIGFsdGVyIGl0LCBsZXQncwo+IG1hcmsgaXQgYXMgImNvbnN0
IiB0byBhdm9pZCBhY2NpZGVudGFsIGNoYW5nZS4KPiAKPiBTdWdnZXN0ZWQtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6
eXdhcmEgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+Cj4gLS0tCj4gIHhlbi9hcmNoL2FybS9p
cnEuYyAgICAgICAgfCAyICstCj4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vaXJxLmggfCAyICstCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMKPiBpbmRl
eCA2MjEwM2EyMGUzLi5kMjI5Y2I2ODcxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9pcnEu
Ywo+ICsrKyBiL3hlbi9hcmNoL2FybS9pcnEuYwo+IEBAIC0yNyw3ICsyNyw3IEBACj4gICNpbmNs
dWRlIDxhc20vZ2ljLmg+Cj4gICNpbmNsdWRlIDxhc20vdmdpYy5oPgo+ICAKPiAtdW5zaWduZWQg
aW50IF9fcmVhZF9tb3N0bHkgbnJfaXJxcyA9IE5SX0lSUVM7Cj4gK2NvbnN0IHVuc2lnbmVkIGlu
dCBfX3JlYWRfbW9zdGx5IG5yX2lycXMgPSBOUl9JUlFTOwoKU2hvdWxkbid0IHlvdSByZW1vdmUg
dGhlIF9fcmVhZF9tb3N0bHkgYXR0cmlidXRlLCBzbyB0aGUgc3ltYm9sIGl0J3MKcGxhY2VkIGF0
IHRoZSAucm9kYXRhIHNlY3Rpb24gYnkgdGhlIGNvbXBpbGVyPwoKUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
