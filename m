From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: Re: [Qemu-devel] [PATCH 4/8] xen: Remove useless casts
Date: Thu, 5 Jul 2018 12:36:33 -0300
Message-ID: <ceb3a31b-f7d5-70fb-c02a-798ec446d881@amsat.org>
References: <20180704153919.12432-1-f4bug@amsat.org>
 <20180704153919.12432-5-f4bug@amsat.org>
 <CAFEAcA-mhvAxF4bG3Zxx_w57Rkf4xnpTBuPrjekNzEK1vB0j9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ezc6=jv=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1fb6JF-00008j-1Z
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 15:36:41 +0000
Received: by mail-qt0-x241.google.com with SMTP id q12-v6so7444493qtp.6
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jul 2018 08:36:39 -0700 (PDT)
In-Reply-To: <CAFEAcA-mhvAxF4bG3Zxx_w57Rkf4xnpTBuPrjekNzEK1vB0j9Q@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>, "open list:X86" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDUvMjAxOCAwNzoxNiBBTSwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToKPiBPbiA0IEp1bHkg
MjAxOCBhdCAxNjozOSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4g
d3JvdGU6Cj4+IFBhdGNoIGNyZWF0ZWQgbWVjaGFuaWNhbGx5IGJ5IHJlcnVubmluZzoKPj4KPj4g
ICAkICBzcGF0Y2ggLS1zcC1maWxlIHNjcmlwdHMvY29jY2luZWxsZS90eXBlY2FzdC5jb2NjaSBc
Cj4+ICAgICAgICAgICAgIC0tbWFjcm8tZmlsZSBzY3JpcHRzL2NvY2NpLW1hY3JvLWZpbGUuaCBc
Cj4+ICAgICAgICAgICAgIC0tZGlyIC4gLS1pbi1wbGFjZQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgo+PiAtLS0KPj4gIGh3L3hl
bi94ZW5fcHRfY29uZmlnX2luaXQuYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaHcveGVuL3hlbl9wdF9j
b25maWdfaW5pdC5jIGIvaHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5jCj4+IGluZGV4IGFlZTMx
YzYyYmIuLjU1YTgzMzMzZjIgMTAwNjQ0Cj4+IC0tLSBhL2h3L3hlbi94ZW5fcHRfY29uZmlnX2lu
aXQuYwo+PiArKysgYi9ody94ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMKPj4gQEAgLTU0Myw3ICs1
NDMsNyBAQCBzdGF0aWMgaW50IHhlbl9wdF9leHBfcm9tX2Jhcl9yZWdfd3JpdGUoWGVuUENJUGFz
c3Rocm91Z2hTdGF0ZSAqcywKPj4gIHsKPj4gICAgICBYZW5QVFJlZ0luZm8gKnJlZyA9IGNmZ19l
bnRyeS0+cmVnOwo+PiAgICAgIFhlblBUUmVnaW9uICpiYXNlID0gTlVMTDsKPj4gLSAgICBQQ0lE
ZXZpY2UgKmQgPSAoUENJRGV2aWNlICopJnMtPmRldjsKPj4gKyAgICBQQ0lEZXZpY2UgKmQgPSAm
cy0+ZGV2Owo+IAo+IFRoaXMgbGluZSBvZiBjb2RlIGlzIG9kZCBldmVuIHdpdGhvdXQgdGhlIGNh
c3QuIFhlblBDSVBhc3N0aHJvdWdoU3RhdGUqCj4gaXMgYSBRT00gb2JqZWN0IChUWVBFX1hFTl9Q
VF9ERVZJQ0UpIHdoaWNoIGlzIGEgc3ViY2xhc3Mgb2YgVFlQRV9QQ0lfREVWSUNFLAo+IHNvIHRo
ZSBzdGFuZGFyZCB3YXkgdG8gZ2V0IHRoZSBQQ0lEZXZpY2UgcG9pbnRlciBmb3IgcyB3b3VsZCBi
ZQo+ICAgUENJRGV2aWNlICpkID0gUENJX0RFVklDRShzKTsKCllvdSBoYXZlIGVhZ2xlIGV5ZXMu
Li4KClRoYW5rcyBmb3IgeW91ciByZXZpZXcgOikKClBoaWwuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
