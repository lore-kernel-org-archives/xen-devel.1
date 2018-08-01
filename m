From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [RFC PATCH 05/17] libxl: use xenstore for pci
 hotplug qemu-in-linux-stubdom commands
Date: Wed, 1 Aug 2018 10:29:07 -0400
Message-ID: <CAKf6xpv=PrZbXiOn8WXkHSsbOtUuNMW5J9vUu-pnBCEiorpFLg@mail.gmail.com>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <48966e6760edb8cfa605879fe47290732edce3da.1533009377.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/cet=kq=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1fks7i-0006Iq-V7
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 14:29:10 +0000
Received: by mail-lj1-x22d.google.com with SMTP id l15-v6so17051851lji.6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Aug 2018 07:29:09 -0700 (PDT)
In-Reply-To: <48966e6760edb8cfa605879fe47290732edce3da.1533009377.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMzAsIDIwMTggYXQgMTE6NTYgUE0sIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7Ny
ZWNraQo8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6Cj4gRnJvbTogU2lt
b24gR2Fpc2VyIDxzaW1vbkBpbnZpc2libGV0aGluZ3NsYWIuY29tPgo+Cj4gVGhlcmUgaXMgbm8g
UU1QIHNvY2tldCBhY2Nlc3MsIHJlLXVzZSB0aGUgc2FtZSBtZWNoYW5pc20gYXMgZm9yIE1pbmlP
Uwo+IGJhc2VkIHN0dWJkb20uCgpMYXRlciB5b3UgYWRkIHNvbWUgUU1QIHN1cHBvcnQuICBJcyB0
aGlzIHByZWZlcnJlZCBiZWNhdXNlIHlvdXIgUU1QCnN1cHBvcnQgaXMgdW5yZWxpYWJsZT8KCjxz
bmlwPgoKPiBAQCAtMTAxMCw3ICsxMDExLDE1IEBAIHN0YXRpYyBpbnQgZG9fcGNpX2FkZChsaWJ4
bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2LCBpCj4g
ICAgICAgICAgICAgICAgICByYyA9IHFlbXVfcGNpX2FkZF94ZW5zdG9yZShnYywgZG9taWQsIHBj
aWRldik7Cj4gICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgY2FzZSBMSUJY
TF9ERVZJQ0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTjoKPiAtICAgICAgICAgICAgICAgIHJjID0g
bGlieGxfX3FtcF9wY2lfYWRkKGdjLCBkb21pZCwgcGNpZGV2KTsKPiArICAgICAgICAgICAgICAg
IGRtX2RvbWlkID0gbGlieGxfZ2V0X3N0dWJkb21faWQoY3R4LCBkb21pZCk7Cj4gKwo+ICsgICAg
ICAgICAgICAgICAgaWYgKGRtX2RvbWlkICE9IDAKPiArICAgICAgICAgICAgICAgICAgICAmJiBs
aWJ4bF9fc3R1YmRvbWFpbl92ZXJzaW9uX3J1bm5pbmcoZ2MsIGRtX2RvbWlkKSA9PQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgTElCWExfU1RVQkRPTUFJTl9WRVJTSU9OX0xJTlVYKSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgcmMgPSBxZW11X3BjaV9hZGRfeGVuc3RvcmUoZ2MsIGRvbWlk
LCBwY2lkZXYpOwo+ICsgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAgICAg
ICAgICByYyA9IGxpYnhsX19xbXBfcGNpX2FkZChnYywgZG9taWQsIHBjaWRldik7Cj4gKyAgICAg
ICAgICAgICAgICB9CgpXaGF0IGFib3V0IHJlZmFjdG9yaW5nIHRoZSB3aG9sZSBzd2l0Y2ggc3Rh
dGVtZW50IHRvIHNvbWV0aGluZyBsaWtlOgpib29sIHVzZV9xbXAgPSBsaWJ4bF9fZGV2aWNlX21v
ZGVsX3ZlcnNpb25fcnVubmluZyhnYywgZG9taWQpCiAgICAgICAgICAgICAgICAgPT0gTElCWExf
REVWSUNFX01PREVMX1ZFUlNJT05fUUVNVV9YRU4gJiYKICAgICAgICAgICAgICAgbGlieGxfZ2V0
X3N0dWJkb21faWQoY3R4LCBkb21pZCkgPT0gMDsKaWYgKHVzZV9xbXApIHsKICAgcmMgPSBsaWJ4
bF9fcW1wX3BjaV9hZGQoZ2MsIGRvbWlkLCBwY2lkZXYpOwp9IGVsc2UgewogICAgcmMgPSBxZW11
X3BjaV9hZGRfeGVuc3RvcmUoZ2MsIGRvbWlkLCBwY2lkZXYpOwp9Cgo+ICAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAgICByZXR1
cm4gRVJST1JfSU5WQUw7CgpSZWdhcmRzLApKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
