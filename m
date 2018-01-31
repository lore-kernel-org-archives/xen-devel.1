From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH v3 6/8] ARM: VGIC: factor out
	vgic_get_hw_irq_desc()
Date: Wed, 31 Jan 2018 16:16:02 +0000
Message-ID: <41c4cb64-9504-f52d-56c3-1acc89e64c12@linaro.org>
References: <20180124181058.6157-1-andre.przywara@linaro.org>
 <20180124181058.6157-7-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7zm5=e2=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1egv3O-0000gc-QZ
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2018 16:16:06 +0000
Received: by mail-wm0-x243.google.com with SMTP id g1so129405wmg.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2018 08:16:04 -0800 (PST)
In-Reply-To: <20180124181058.6157-7-andre.przywara@linaro.org>
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

SGksCgpPbiAyNC8wMS8xOCAxODoxMCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gQXQgdGhlIG1v
bWVudCB3ZSBoYXBwaWx5IGFjY2VzcyB0aGUgVkdJQyBpbnRlcm5hbCBzdHJ1Y3QgcGVuZGluZ19p
cnEKPiAod2hpY2ggZGVzY3JpYmVzIGEgdmlydHVhbCBJUlEpIGluIGlycS5jLgo+IEZhY3RvciBv
dXQgdGhlIGFjdHVhbGx5IG5lZWRlZCBmdW5jdGlvbmFsaXR5IHRvIGxlYXJuIHRoZSBhc3NvY2lh
dGVkCj4gaGFyZHdhcmUgSVJRIGFuZCBtb3ZlIHRoYXQgaW50byBnaWMtdmdpYy5jIHRvIGltcHJv
dmUgYWJzdHJhY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJl
LnByenl3YXJhQGxpbmFyby5vcmc+Cj4gQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9naWMtdmdpYy5jICAg
IHwgMTUgKysrKysrKysrKysrKysrCj4gICB4ZW4vYXJjaC9hcm0vaXJxLmMgICAgICAgICB8ICA3
ICsrLS0tLS0KPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vdmdpYy5oIHwgIDIgKysKPiAgIDMgZmls
ZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwo+
IGluZGV4IGQ0NGU0ZGFjZDMuLjNhZDk4ZGNkM2EgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJt
L2dpYy12Z2ljLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwo+IEBAIC00MTEsNiAr
NDExLDIxIEBAIHZvaWQgZ2ljX2R1bXBfdmdpY19pbmZvKHN0cnVjdCB2Y3B1ICp2KQo+ICAgICAg
ICAgICBwcmludGsoIlBlbmRpbmcgaXJxPSVkXG4iLCBwLT5pcnEpOwo+ICAgfQo+ICAgCj4gK3N0
cnVjdCBpcnFfZGVzYyAqdmdpY19nZXRfaHdfaXJxX2Rlc2Moc3RydWN0IGRvbWFpbiAqZCwgc3Ry
dWN0IHZjcHUgKnYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IHZpcnEpCj4gK3sKPiArICAgIHN0cnVjdCBwZW5kaW5nX2lycSAqcDsKPiArCj4g
KyAgICBpZiAoICF2ICkKPiArICAgICAgICB2ID0gZC0+dmNwdVswXTsKCkkgZGlzbGlrZSB0aGlz
IG5ldyBmdW5jdGlvbiBpbiB0aGUgY3VycmVudCBzdGF0ZS4gTGV0J3MgaW1hZ2luZSBzb21lb25l
IApkZWNpZGUgdG8gcGFzcyBhIFBQSSBidXQgbm8gdkNQVS4gVGhlIHZDUFUgd291bGQgbm93IGJl
IGRlZmF1bHQgdG8gdkNQVTAgCmFuZCBwb3RlbnRpYWxseSByZXR1cm5pbmcgdGhlIHdyb25nIGly
cV9kZXNjIChpbWFnaW5lIFBQSSBwYXNzdGhyb3VnaCAKc3VjaCBhcyBmb3IgdGhlIHZ0aW1lciku
CgpTbyB0aGUgY29kZSBuZWVkcyBhdCBsZWFzdCBjaGVja2luZyB0aGUgdkNQVSBpcyBwYXNzZWQg
aW4gdGhlIGNhc2Ugb2YgYSAKUFBJLiBJIHdvdWxkIGJlIGhhcHB5IHdpdGggYW4gQVNTRVJUKCku
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
