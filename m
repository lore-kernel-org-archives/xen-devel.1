From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] xen,
 fbfront: mark expected switch fall-through
Date: Thu, 28 Feb 2019 13:51:53 +0200
Message-ID: <f8ff03de-9d7c-233a-cd86-37269667db0c__12037.1579470643$1551354768$gmane$org@gmail.com>
References: <20190227205303.GA1231@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K0lv=RD=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gzKEI-0002hX-C4
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 11:51:58 +0000
Received: by mail-lf1-x143.google.com with SMTP id g12so14983273lfb.13
 for <xen-devel@lists.xenproject.org>; Thu, 28 Feb 2019 03:51:57 -0800 (PST)
In-Reply-To: <20190227205303.GA1231@embeddedor>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, linux-fbdev@vger.kernel.org, Kees Cook <keescook@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

K1hlbi1kZXZlbCBsaXN0CgpPbiAyLzI3LzE5IDEwOjUzIFBNLCBHdXN0YXZvIEEuIFIuIFNpbHZh
IHdyb3RlOgo+IEluIHByZXBhcmF0aW9uIHRvIGVuYWJsaW5nIC1XaW1wbGljaXQtZmFsbHRocm91
Z2gsIG1hcmsgc3dpdGNoCj4gY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRo
cm91Z2guCj4KPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKPgo+IGRy
aXZlcnMvdmlkZW8vZmJkZXYveGVuLWZiZnJvbnQuYzogSW4gZnVuY3Rpb24g4oCYeGVuZmJfYmFj
a2VuZF9jaGFuZ2Vk4oCZOgo+IGRyaXZlcnMvdmlkZW8vZmJkZXYveGVuLWZiZnJvbnQuYzo2Nzg6
Njogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1m
YWxsdGhyb3VnaD1dCj4gICAgIGlmIChkZXYtPnN0YXRlID09IFhlbmJ1c1N0YXRlQ2xvc2VkKQo+
ICAgICAgICBeCj4gZHJpdmVycy92aWRlby9mYmRldi94ZW4tZmJmcm9udC5jOjY4MToyOiBub3Rl
OiBoZXJlCj4gICAgY2FzZSBYZW5idXNTdGF0ZUNsb3Npbmc6Cj4gICAgXn5+fgo+Cj4gV2Fybmlu
ZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKPgo+IE5vdGljZSB0
aGF0LCBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIGNvZGUgY29tbWVudCBpcyBtb2RpZmll
ZAo+IGluIGFjY29yZGFuY2Ugd2l0aCB3aGF0IEdDQyBpcyBleHBlY3RpbmcgdG8gZmluZC4KPgo+
IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsZQo+IC1X
aW1wbGljaXQtZmFsbHRocm91Z2guCj4KPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNp
bHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+IC0tLQo+ICAgZHJpdmVycy92aWRlby9mYmRl
di94ZW4tZmJmcm9udC5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi94ZW4t
ZmJmcm9udC5jIGIvZHJpdmVycy92aWRlby9mYmRldi94ZW4tZmJmcm9udC5jCj4gaW5kZXggNmE0
YmJjOWUxZmIwLi5hM2Q2YjZkYjIyMWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRl
di94ZW4tZmJmcm9udC5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi94ZW4tZmJmcm9udC5j
Cj4gQEAgLTY3Nyw3ICs2NzcsNyBAQCBzdGF0aWMgdm9pZCB4ZW5mYl9iYWNrZW5kX2NoYW5nZWQo
c3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKPiAgIAljYXNlIFhlbmJ1c1N0YXRlQ2xvc2VkOgo+
ICAgCQlpZiAoZGV2LT5zdGF0ZSA9PSBYZW5idXNTdGF0ZUNsb3NlZCkKPiAgIAkJCWJyZWFrOwo+
IC0JCS8qIE1pc3NlZCB0aGUgYmFja2VuZCdzIENMT1NJTkcgc3RhdGUgLS0gZmFsbHRocm91Z2gg
Ki8KPiArCQkvKiBmYWxsIHRocm91Z2ggLSBNaXNzZWQgdGhlIGJhY2tlbmQncyBDTE9TSU5HIHN0
YXRlLiAqLwo+ICAgCWNhc2UgWGVuYnVzU3RhdGVDbG9zaW5nOgo+ICAgCQl4ZW5idXNfZnJvbnRl
bmRfY2xvc2VkKGRldik7Cj4gICAJCWJyZWFrOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
