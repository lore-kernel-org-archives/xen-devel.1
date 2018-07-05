From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 4/8] xen: Remove useless casts
Date: Thu, 5 Jul 2018 11:16:53 +0100
Message-ID: <CAFEAcA-mhvAxF4bG3Zxx_w57Rkf4xnpTBuPrjekNzEK1vB0j9Q@mail.gmail.com>
References: <20180704153919.12432-1-f4bug@amsat.org>
 <20180704153919.12432-5-f4bug@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dnh9=jv=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1fb1K8-0000eO-MF
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 10:17:16 +0000
Received: by mail-oi0-x243.google.com with SMTP id v8-v6so15824737oie.5
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jul 2018 03:17:14 -0700 (PDT)
In-Reply-To: <20180704153919.12432-5-f4bug@amsat.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>, "open list:X86" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gNCBKdWx5IDIwMTggYXQgMTY6MzksIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0Bh
bXNhdC5vcmc+IHdyb3RlOgo+IFBhdGNoIGNyZWF0ZWQgbWVjaGFuaWNhbGx5IGJ5IHJlcnVubmlu
ZzoKPgo+ICAgJCAgc3BhdGNoIC0tc3AtZmlsZSBzY3JpcHRzL2NvY2NpbmVsbGUvdHlwZWNhc3Qu
Y29jY2kgXAo+ICAgICAgICAgICAgIC0tbWFjcm8tZmlsZSBzY3JpcHRzL2NvY2NpLW1hY3JvLWZp
bGUuaCBcCj4gICAgICAgICAgICAgLS1kaXIgLiAtLWluLXBsYWNlCj4KPiBTaWduZWQtb2ZmLWJ5
OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgo+IC0tLQo+ICBody94
ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW5fcHRfY29u
ZmlnX2luaXQuYyBiL2h3L3hlbi94ZW5fcHRfY29uZmlnX2luaXQuYwo+IGluZGV4IGFlZTMxYzYy
YmIuLjU1YTgzMzMzZjIgMTAwNjQ0Cj4gLS0tIGEvaHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5j
Cj4gKysrIGIvaHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5jCj4gQEAgLTU0Myw3ICs1NDMsNyBA
QCBzdGF0aWMgaW50IHhlbl9wdF9leHBfcm9tX2Jhcl9yZWdfd3JpdGUoWGVuUENJUGFzc3Rocm91
Z2hTdGF0ZSAqcywKPiAgewo+ICAgICAgWGVuUFRSZWdJbmZvICpyZWcgPSBjZmdfZW50cnktPnJl
ZzsKPiAgICAgIFhlblBUUmVnaW9uICpiYXNlID0gTlVMTDsKPiAtICAgIFBDSURldmljZSAqZCA9
IChQQ0lEZXZpY2UgKikmcy0+ZGV2Owo+ICsgICAgUENJRGV2aWNlICpkID0gJnMtPmRldjsKClRo
aXMgbGluZSBvZiBjb2RlIGlzIG9kZCBldmVuIHdpdGhvdXQgdGhlIGNhc3QuIFhlblBDSVBhc3N0
aHJvdWdoU3RhdGUqCmlzIGEgUU9NIG9iamVjdCAoVFlQRV9YRU5fUFRfREVWSUNFKSB3aGljaCBp
cyBhIHN1YmNsYXNzIG9mIFRZUEVfUENJX0RFVklDRSwKc28gdGhlIHN0YW5kYXJkIHdheSB0byBn
ZXQgdGhlIFBDSURldmljZSBwb2ludGVyIGZvciBzIHdvdWxkIGJlCiAgUENJRGV2aWNlICpkID0g
UENJX0RFVklDRShzKTsKCnRoYW5rcwotLSBQTU0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
