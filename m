From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Fri, 23 Nov 2018 15:04:38 +0200
Message-ID: <d69c131b-9ff0-6fbe-6c6d-0e46d334bbbb@gmail.com>
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
 <d260c074-6107-a5d1-94c8-fdb019585135@gmail.com>
 <4ceea0f6-ede1-420a-d3b7-80c4584739ce@arm.com>
 <2199be43-ef12-28c3-4dcb-cac404be1e4d@gmail.com>
 <0c381f5d-59f8-fcee-4a25-8a29af3f2d73@arm.com>
 <a9f3a72f-37cc-9097-e93e-df7d0d47aa01@gmail.com>
 <20181123121819.1b1c7655@donnerap.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181123121819.1b1c7655@donnerap.cambridge.arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Julien Grall <julien.grall@gmail.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMy4xMS4xOCAxNDoxOCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gRnVuZGFtZW50YWxs
eSB0aGVyZSBpcyBhIHNlbWFudGljIGRpZmZlcmVuY2UgYmV0d2VlbiBlZGdlIGFuZCBsZXZlbAo+
IHRyaWdnZXJlZCBJUlFzOgo+IFdoZW4gdGhlIGd1ZXN0IGhhcyBoYW5kbGVkIGFuICplZGdlKiBJ
UlEgKEVPSWVkIHNvIHRoZSBMUidzIHN0YXRlIGdvZXMKPiB0byAwKSwgdGhpcyBpcyBkb25lIGFu
ZCBkdXN0ZWQsIGFuZCBYZW4gZG9lc24ndCBuZWVkIHRvIGNhcmUKPiBhYm91dCB0aGlzIGFueW1v
cmUgdW50aWwgdGhlIG5leHQgSVJRIG9jY3Vycy4KPiAKPiBGb3IgbGV2ZWwgdHJpZ2dlcmVkIElS
UXMsIGV2ZW4gdGhvdWdoIHRoZSBndWVzdCBoYXMgaGFuZGxlZCBpdCwgd2UgbmVlZAo+IHRvIHJl
c2FtcGxlIHRoZSAocG90ZW50aWFsbHkgdmlydHVhbCkgSVJRIGxpbmUsIGFzIGl0IG1heSBjb21l
IHVwIG9yCj4gZG93biBhdCB0aGUgKmRldmljZSoncyBkaXNjcmV0aW9uOiB0aGUgaW50ZXJydXB0
IHJlYXNvbiBtaWdodCBoYXZlIGdvbmUKPiBhd2F5IChHUElPIGNvbmRpdGlvbiBubyBsb25nZXIg
dHJ1ZSksIGV2ZW4gYmVmb3JlIHdlIHdlcmUgYWJsZSB0bwo+IGluamVjdCBpdCwgb3IgdGhlcmUg
bWlnaHQgYmUgYW5vdGhlciBpbnRlcnJ1cHQgcmVhc29uIG5vdCB5ZXQgaGFuZGxlZAo+IChpbmNv
bWluZyBzZXJpYWwgY2hhcmFjdGVyIHdoaWxlIHNlcnZpbmcgYSB0cmFuc21pdCBpbnRlcnJ1cHQp
LiBBbHNvCj4gdHlwaWNhbGx5IGl0J3MgdXAgdG8gdGhlIGludGVycnVwdCBoYW5kbGVyIHRvIGNv
bmZpcm0gaGFuZGxpbmcgdGhlCj4gaW50ZXJydXB0LCBlaXRoZXIgZXhwbGljaXRseSBieSBjbGVh
cmluZyBhbiBpbnRlcnJ1cHQgYml0IGluIHNvbWUKPiBzdGF0dXMgcmVnaXN0ZXIgb3IgaW1wbGlj
aXRseSwgZm9yIGluc3RhbmNlIGJ5IGRyYWluaW5nIGEgRklGTywgc2F5IG9uCj4gYSBzZXJpYWwg
ZGV2aWNlLiBTbyBldmVuIHRob3VnaCBmcm9tIHRoZSAoVilHSUMncyBwb2ludCBvZiB2aWV3IHRo
ZQo+IGludGVycnVwdCBoYXMgYmVlbiBwcm9jZXNzZWQgKEVPSWVkKSwgaXQgbWlnaHQgc3RpbGwg
YmUgcGVuZGluZy4KPiAKPiBNeSBpbnRpbWF0ZSAib2xkIFhlbiBWR0lDIiBrbm93bGVkZ2UgaGFz
IGJlZW4gc3dhcHBlZCBvdXQgZnJvbSBteSBicmFpbgo+IG1lYW53aGlsZSwgYnV0IElJUkMgWGVu
IHRyZWF0cyBldmVyeSBJUlEgYXMgaWYgaXQgd291bGQgYmUgYW4gZWRnZSBJUlEuCj4gV2hpY2gg
d29ya3MgaWYgdGhlIGd1ZXN0J3MgaW50ZXJydXB0IGhhbmRsZXIgYmVoYXZlcyBjb3JyZWN0bHku
IE1vc3QKPiBJUlEgaGFuZGxlcnMgaGF2ZSBhIGxvb3AgdG8gaXRlcmF0ZSBvdmVyIGFsbCBwb3Nz
aWJsZSBpbnRlcnJ1cHQKPiByZWFzb25zIGFuZCBwcm9jZXNzIHRoZW0sIHNvIHRoZSBsaW5lIGdv
ZXMgaW5kZWVkIGRvd24gYmVmb3JlIHRoZXkgRU9JCj4gdGhlIElSUS4KVGhhbmsgeW91IGZvciB0
aGUgZXhwbGFuYXRpb24uIEknbGwgcmVhZCBpdCBjYXJlZnVsbHkuCgoKLS0gClNpbmNlcmVseSwK
QW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
