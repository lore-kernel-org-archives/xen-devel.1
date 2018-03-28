From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 26/39] ARM: new VGIC: Add SGIPENDR
 register handlers
Date: Wed, 28 Mar 2018 10:22:21 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803281021280.15200@sstabellini-ThinkPad-X260>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-19-andre.przywara@linaro.org>
 <alpine.DEB.2.10.1803271329370.12360@sstabellini-ThinkPad-X260>
 <22aabd4d-df1b-0743-5453-c453e9754784@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yb8v=gs=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f1EmG-0000Qt-9Y
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 17:22:24 +0000
In-Reply-To: <22aabd4d-df1b-0743-5453-c453e9754784@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyOCBNYXIgMjAxOCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gPj4gK3N0YXRpYyB2
b2lkIHZnaWNfbW1pb193cml0ZV9zZ2lwZW5kcyhzdHJ1Y3QgdmNwdSAqdmNwdSwKPiA+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgYWRkciwgdW5zaWduZWQg
aW50IGxlbiwKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgdmFsKQo+ID4+ICt7Cj4gPj4gKyAgICB1aW50MzJfdCBpbnRpZCA9IFZHSUNfQURE
Ul9UT19JTlRJRChhZGRyLCA4KTsKPiA+PiArICAgIHVuc2lnbmVkIGludCBpOwo+ID4+ICsgICAg
dW5zaWduZWQgbG9uZyBmbGFnczsKPiA+PiArCj4gPj4gKyAgICBBU1NFUlQoaW50aWQgPCBWR0lD
X05SX1NHSVMpOwo+ID4+ICsKPiA+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgbGVuOyBpKysgKQo+
ID4+ICsgICAgewo+ID4+ICsgICAgICAgIHN0cnVjdCB2Z2ljX2lycSAqaXJxID0gdmdpY19nZXRf
aXJxKHZjcHUtPmRvbWFpbiwgdmNwdSwgaW50aWQgKyBpKTsKPiA+PiArCj4gPj4gKyAgICAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJmlycS0+aXJxX2xvY2ssIGZsYWdzKTsKPiA+PiArCj4gPj4gKyAg
ICAgICAgaXJxLT5zb3VyY2UgfD0gKHZhbCA+PiAoaSAqIDgpKSAmIDB4ZmY7Cj4gPj4gKwo+ID4+
ICsgICAgICAgIGlmICggaXJxLT5zb3VyY2UgKQo+ID4+ICsgICAgICAgIHsKPiA+PiArICAgICAg
ICAgICAgaXJxLT5wZW5kaW5nX2xhdGNoID0gdHJ1ZTsKPiA+PiArICAgICAgICAgICAgdmdpY19x
dWV1ZV9pcnFfdW5sb2NrKHZjcHUtPmRvbWFpbiwgaXJxLCBmbGFncyk7Cj4gPj4gKyAgICAgICAg
fQo+ID4+ICsgICAgICAgIGVsc2UKPiA+PiArICAgICAgICB7Cj4gPj4gKyAgICAgICAgICAgIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmlycS0+aXJxX2xvY2ssIGZsYWdzKTsKPiA+PiArICAgICAg
ICB9Cj4gPiAKPiA+IE5JVDogaXQgc2hvdWxkIGJlIHNhZmUgdG8gY2FsbCB2Z2ljX3F1ZXVlX2ly
cV91bmxvY2sgcmVnYXJkbGVzcywgcmlnaHQ/Cj4gCj4gSSBkb24ndCB0aGluayB2Z2ljX3F1ZXVl
X2lycV91bmxvY2soKSBhbmQgc3Vic2VxdWVudCBmdW5jdGlvbnMgY2FuIGRlYWwKPiB3aXRoIHRo
ZSBJUlEgYmVpbmcgcGVuZGluZywgYnV0IG5vdCBoYXZpbmcgYSBzb3VyY2UgYml0IHNldDoKPiBo
dHRwOi8vd3d3LmxpbnV4LWFybS5vcmcvZ2l0P3A9eGVuLWFwLmdpdDthPWJsb2I7Zj14ZW4vYXJj
aC9hcm0vdmdpYy92Z2ljLXYyLmM7aD02YTg0ZTc0MWVlMGEjbDIwNQo+IAo+IEJlc2lkZXMsIHRo
aXMgc2NoZW1lIG9mOgo+IAlpZiAoIG5lZWRzIHRvIGJlIGluamVjdGVkICkKPiAJewo+IAkJbWFr
ZV9wZW5kaW5nKCk7Cj4gCQl2Z2ljX3F1ZXVlX2lycV91bmxvY2soKTsKPiAJfQo+IAllbHNlCj4g
CXsKPiAJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoKTsKPiAJfQo+IAo+IGlzIGFsbCBvdmVyIHRo
ZSBwbGFjZSwgYW5kIEkgZG9uJ3Qgd2FudCB0byBkZXZpYXRlIGZyb20gdGhhdCBhbmQgdGhlIEtW
TQo+IGltcGxlbWVudGF0aW9uIG5lZWRsZXNzbHkuCgpPSwoKQWNrZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
