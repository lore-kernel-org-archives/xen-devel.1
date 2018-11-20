From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Tue, 20 Nov 2018 20:10:46 +0200
Message-ID: <d260c074-6107-a5d1-94c8-fdb019585135@gmail.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-2-julien.grall@arm.com>
 <6098937f-98de-bff9-6c48-5575a45875e0@epam.com>
 <57ee191b-be21-701e-ef19-4ed4df1cf289@arm.com>
 <77f72cc9-6548-afd9-3766-23326b3551d9@epam.com>
 <6acf65ef-4302-c403-32ba-1d88ab954265@epam.com>
 <22f7ebc8-c74b-0d8e-4847-9d3df9bcf5db@arm.com>
 <3622e468-8f44-1e31-138f-db58ca3835ff@epam.com>
 <2090f5b4-22ff-38bc-3d47-6dbb6d7fccfb@epam.com>
 <6d1c980b-b316-f634-7793-0aca4b34aa85@arm.com>
 <VI1PR0302MB26882FD1B2445807F8C2B026E6C60@VI1PR0302MB2688.eurprd03.prod.outlook.com>
 <5ad76791-075d-e588-2669-e01c79674f0d@gmail.com>
 <CAF3u54CmW32NwN0q73LaXwnj2wUt72uuq9LGPRQ3RNMzZTV==Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAF3u54CmW32NwN0q73LaXwnj2wUt72uuq9LGPRQ3RNMzZTV==Q@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKCk9uIDE5LjExLjE4IDE4OjQyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4g
VGhlcmUgYXJlIG5vIGlzc3VlIGFib3V0IHByb2Nlc3NpbmcgSVJRcyBiZWZvcmUgdGhlIHN5bmNz
LiBJdCBpcyB0aGUgCj4gc2FtZSBhcyBpZiBhbiBJUlEgd2FzIHJhaXNlZCBmcm9tIGlsYSBkaWZm
ZXJlbnQgcENQVXMuCj4gU28gd2h5IGRvIHlvdSBuZWVkIHRoYXQ/CgogRnJvbSBteSB1bmRlcnN0
YW5kaW5nIG9mIGdpYy12Z2ljIGNvZGUgKG9sZCB2Z2ljKSwgZm9yIHRoZSBJUlFzIAp0YXJnZXRp
bmcgdGhlIGBjdXJyZW50YCB2Y3B1LCBpdCBsZWFkcyB0byBhIGZhc3RlciBwcm9jZXNzaW5nIHVu
ZGVyIAppbnRlcnJ1cHRzIHN0b3JtIGNvbmRpdGlvbnMuIElmIGl0IHdhcyBhbGwgTFJzIHNldCBv
biBwcmV2aW91cyBzd2l0Y2ggdG8gCmEgZ3Vlc3QsIGEgdGhlIElSUSB3aWxsIGhhdmUgYSBjaGFu
Y2UgdG8gZ28gZGlyZWN0bHkgdG8gTFIgaW5zdGVhZCBvZiAKc2V0dGluZyBvbiBscl9wZW5kaW5n
IHF1ZXVlLiBBbHNvIGluZmxpZ2h0X2lycXMgcXVldWUgaGF2ZSBhIGNoYW5jZSB0byAKYmUgc2hv
cnRlciB0byBpbnNlcnQuCgoKTW9yZW92ZXIsIG1heWJlIHlvdSBjYW4gZXhwbGFpbiBtZSwgd2hh
dCdzIHRoZSBwb2ludCBvZiBpbnRlcnJ1cHRzIAplbmFibGluZyBiZWZvcmUgZm9yIGBkb19JUlEo
KWAgY2FsbD8gVGhvc2UgaW50ZXJydXB0cyB3b3VsZCBiZSBncmFiYmVkIAphbmQgcHJvY2Vzc2Vk
IGFueXdheSwgZHVyaW5nIHJ1biB0aHJvdWdoIHRoZSBsb29wIGluIGBnaWNfaW50ZXJydXB0KClg
LiAKU28gSSBzZWUgdGhlIG9ubHkgb3V0Y29tZSBvZiBpbnRlcnJ1cHRzIGVuYWJsaW5nIC0gc3Bl
bmRpbmcgbW9yZSB0aW1lIApmb3IgY29udGV4dCBzd2l0Y2hlcy4KCgotLSAKU2luY2VyZWx5LApB
bmRyaWkgQW5pc292LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
