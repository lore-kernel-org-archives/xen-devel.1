From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH 05/22] char: optionally redirect {,
 g}printk output to QEMU debug log
Date: Sat, 6 Jan 2018 16:18:46 -0800
Message-ID: <CA+aC4ktF8XtQUnY67EWmsb-kWMZYZgA2d6G6SHi63sB4zN0H_Q@mail.gmail.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-6-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=swlg=ec=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eXyfq-0007Ye-JH
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 00:18:50 +0000
Received: by mail-lf0-x244.google.com with SMTP id o76so2224087lfi.10
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jan 2018 16:18:48 -0800 (PST)
In-Reply-To: <1515279277-16301-6-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKYW4gNiwgMjAxOCBhdCAyOjU0IFBNLCBBbnRob255IExpZ3VvcmkgPGFsaWd1b3Jp
QGFtem4uY29tPiB3cm90ZToKPiBGcm9tOiBNYXR0IFdpbHNvbiA8bXN3QGFtYXpvbi5jb20+Cj4K
PiBXaGVuIHVzaW5nIFZpeGVuLCBpdCBpcyBoZWxwZnVsIHRvIGdldCB0aGUgWGVuIG1lc3NhZ2Vz
IGluIGEKPiBzZXBhcmF0ZSBjaGFubmVsIHRoYW4gdGhlIGNvbnNvbGUgb3V0cHV0LiAgQWRkIGFu
IG9wdGlvbiB0bwo+IG91dHB1dCB0byB0aGUgUUVNVSBiYWNrZG9vciBsb2dnaW5nIHBvcnQuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFdpbHNvbiA8bXN3QGFtYXpvbi5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogQW50aG9ueSBMaWd1b3JpIDxhbGlndW9yaUBhbWF6b24uY29tPgo+IC0tLQo+ICB4ZW4v
ZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKy0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyBiL3hlbi9kcml2ZXJzL2NoYXIvY29u
c29sZS5jCj4gaW5kZXggMTlkMGU3NC4uYjk0MTJjNSAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVy
cy9jaGFyL2NvbnNvbGUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4gQEAg
LTg1LDYgKzg1LDExIEBAIHN0YXRpYyBpbnQgX19yZWFkX21vc3RseSBzZXJjb25faGFuZGxlID0g
LTE7Cj4KPiAgc3RhdGljIERFRklORV9TUElOTE9DSyhjb25zb2xlX2xvY2spOwo+Cj4gKy8qIHNl
bmQgYWxsIHByaW50ayBvdXRwdXQgdG8gUUVNVSBkZWJ1ZyBsb2cuIElucHV0IGRvZXMgbm90IGNo
YW5nZSwKPiArICogbm9yIGRvZXMgZG9tMCBvdXRwdXQuCj4gKyAqLwo+ICtzdGF0aWMgYm9vbF90
IF9fcmVhZF9tb3N0bHkgcWVtdV9kZWJ1ZyA9IGZhbHNlOwo+ICsKPiAgLyoKPiAgICogVG8gY29u
dHJvbCB0aGUgYW1vdW50IG9mIHByaW50aW5nLCB0aHJlc2hvbGRzIGFyZSBhZGRlZC4KPiAgICog
VGhlc2UgdGhyZXNob2xkcyBjb3JyZXNwb25kIHRvIHRoZSBYRU5MT0cgbG9nZ2luZyBsZXZlbHMu
Cj4gQEAgLTU2NCwxMCArNTY5LDIxIEBAIHN0YXRpYyB2b2lkIF9fcHV0c3RyKGNvbnN0IGNoYXIg
KnN0cikKPiAgewo+ICAgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZjb25zb2xlX2xvY2spKTsK
Pgo+IC0gICAgc2VyY29uX3B1dHMoc3RyKTsKPiAtICAgIHZpZGVvX3B1dHMoc3RyKTsKPiArICAg
IGlmICggcWVtdV9kZWJ1ZyApCj4gKyAgICB7Cj4gKyAgICAgICAgY2hhciBjOwo+ICsgICAgICAg
IHdoaWxlICggKGMgPSAqc3RyKyspICE9ICdcMCcgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAg
ICAgb3V0YihjLCAweDEyKTsKPiArICAgICAgICB9CgpZZWFoLCB0aGlzIGhhcyBubyBob3BlIG9m
IHdvcmtpbmcgb24gQVJNIE1hdHQuICBTaGFtZSBvbiB5b3UgOy1QCgpSZWdhcmRzLAoKQW50aG9u
eSBMaWd1b3JpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
