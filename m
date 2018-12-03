From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Mon, 3 Dec 2018 12:17:20 +0000
Message-ID: <e3c48fd4-12ae-bada-07b2-85b8ee674c41@arm.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
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
 <20181122180401.0f1d21a0@donnerap.cambridge.arm.com>
 <969c7156-162b-09b0-f328-03dadee06461@gmail.com>
 <9a5c5731-50fe-76ca-354a-3eb05fba41e6@arm.com>
 <bad74dba-41d1-2f16-9542-ad8431793886@gmail.com>
 <cafe59b5-acfd-7899-f2d6-60c39f47a992@arm.com>
 <88f3cf3a-1f1f-2217-9926-375b3ad62ab4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <88f3cf3a-1f1f-2217-9926-375b3ad62ab4@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Julien Grall <julien.grall@gmail.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmlpLAoKT24gMDMvMTIvMjAxOCAxMjowOCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBP
biAyNy4xMS4xOCAxNzoxMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBUaGUgc3RlcHMgZm9yIFhl
biBJUlEgaXMgcm91Z2hseToKPj4gwqDCoMKgwqDCoC0+IHJlYWRfaXJxCj4+IMKgwqDCoMKgwqAt
PiBsb2NhbF9pcnFfZW5hYmxlCj4+IMKgwqDCoMKgwqAtPiBkb19JUlEKPj4gwqDCoMKgwqDCoMKg
wqAgLT4gbG9jYWxfaXJxX2VuYWJsZSAodmlhIHNwaW5fdW5sb2NrX2lycSkKPj4gwqDCoMKgwqDC
oMKgwqAgLT4gY2FsbCBoYW5kbGVycwo+PiDCoMKgwqDCoMKgwqDCoCAtPiBsb2NhbF9pcnFfZGlz
YWJsZSAodmlhIHNwaW5fbG9ja19pcnEpCj4+IMKgwqDCoMKgwqDCoMKgIC0+IEVPSQo+PiDCoMKg
wqDCoMKgwqDCoCAtPiBESVIKPj4gwqDCoMKgwqDCoC0+IGxvY2FsX2lycV9kaXNhYmxlCj4+Cj4+
IFRoZSBzdGVwcyBvZiBmb3IgR3Vlc3QgSVJRIGlzIHJvdWdobHk6Cj4+IMKgwqDCoMKgwqAtPiBy
ZWFkX2lycQo+PiDCoMKgwqDCoMKgLT4gbG9jYWxfaXJxX2VuYWJsZQo+PiDCoMKgwqDCoMKgLT4g
ZG9fSVJRCj4+IMKgwqDCoMKgwqDCoMKgwqAgLT4gRU9JCj4gU28gaGVyZSB3ZSBtaWdodCBoYXZl
IGxvd2VyIHByaW9yaXR5IGludGVycnVwdCBmaXJlZCwgZ2V0dGluZyB1cyBiYWNrIHRvIAo+IGBo
eXBfaXJxKClgIHRvIHJ1biBgZG9fdHJhcF9pcnEoKWAgYWdhaW4uCj4gCj4+IMKgwqDCoMKgwqDC
oMKgwqAgLT4gdmdpY19pbmplY3RfaXJxCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtPiBs
b2NhbF9pcnFfZGlzYWJsZcKgICh2aWEgc3Bpbl9sb2NrX2lycXNhdmUpCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAtPiBsb2NhbF9pcnFfZW5hYmxlwqDCoCAodmlhIHNwaW5fbG9ja19pcnFy
ZXN0b3JlKQo+PiDCoMKgwqDCoMKgLT4gbG9jYWxfaXJxX2Rpc2FibGUKPj4KPj4gQWxsIHZnaWNf
aW5qZWN0X2lycSBpcyBwcmV0dHkgbXVjaCBydW5uaW5nIHdpdGggaW50ZXJydXB0cyBkaXNhYmxl
ZC4gVGhlIFhlbiAKPj4gSVJRIHBhdGggc2VlbSB0byBjb250aW51ZSBwb2ludGxlc3MgZW5hYmxl
L2Rpc2FibGUuCj4+Cj4+IFNvIEkgdGhpbmsgdGhlIGZvbGxvd2luZyBzdGVwcyBzaG91bGQgc3Vp
dCB5b3UuCj4gV2VsbCwgZG8geW91IHN0YXRlIHRoZXkgZG8gbm90IHN1aXQgbWFpbmxpbmU/CgpO
by4gSSBtZWFudCB0aGF0IEkgd291bGQgYmUgaGFwcHkgd2l0aCB0aGF0IGFuZCBJIHRoaW5rIHNo
b3VsZCBhbHNvIHN1aXQgeW91LgoKPiAKPj4gWGVuIElSUToKPj4gwqDCoMKgwqDCoC0+IHJlYWRf
aXJxCj4+IMKgwqDCoMKgwqAtPiBkb19JUlEKPj4gwqDCoMKgwqDCoMKgwqDCoCAtPiBsb2NhbF9p
cnFfZW5hYmxlICh2aWEgc3Bpbl91bmxvY2tfaXJxKQo+IEkgc3VwcG9zZSwgaXNiKCkgc2hvdWxk
IGJlIG1vdmVkIGhlcmUgZnJvbSBgZG9fdHJhcF9pcnEoKWAgYXMgd2VsbAoKVGhlcmUgYXJlIG5v
IGlzYigpIGluIGRvX3RyYXBfaXJxKCkuIFNvIGRpZCB5b3UgbWVhbiBnaWNfaW50ZXJydXB0KCk/
CgpCdXQgdGhlbiwgSSBhbSBub3Qgc3VyZSB3aHkgeW91IHdhbnQgdG8gYXZvaWQgdGhlIGlzYigp
IGluIHRoZSBndWVzdCBwYXRoLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
