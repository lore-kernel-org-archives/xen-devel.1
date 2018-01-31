From: Martin Kelly <mkelly@xevo.com>
Subject: Re: GPU passthrough on ARM
Date: Tue, 30 Jan 2018 16:37:24 -0800
Message-ID: <974cb4cf-4891-4609-749c-09b8fc9eb137@xevo.com>
References: <7a4b5e6c-c66d-115f-d6c7-e30d7b36c3ef@xevo.com>
 <5fae3c3b-41e5-1930-3abc-a3d1f051aa05@linaro.org>
 <366c2b28-fecc-4725-5fa9-fd563010f64f@xevo.com>
 <808e9d86-82c9-9eed-8752-3294c1df74f2@linaro.org>
 <CAPD2p-=aFOY24NpZuwfnq=xS0r9BPFrZry=h8buc5UCXuHtZ0Q@mail.gmail.com>
 <CAPD2p-nYe305YPenOFTQfptVHnNQ2ms=UJ0O7cb4pJHUkeXFrw@mail.gmail.com>
 <ec3f44df-2a4e-f418-f15e-610891cbcb24@xevo.com>
 <CAPD2p-=VOfjVCKhcCo7jzKkdUY7YCtW9yNEJyGbXqWZw3ZRxDQ@mail.gmail.com>
 <1e844b3a-ad36-8bfe-d49d-acfcf67b472e@xevo.com>
 <CAPD2p-mNB0o=wMjLqBn41A8=nGsZY1Vgm-Y7nOD-WX2TVtbzaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ywvg=e2=xevo.com=mkelly@srs-us1.protection.inumbo.net>)
 id 1eggPC-0006xZ-Tw
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2018 00:37:39 +0000
In-Reply-To: <CAPD2p-mNB0o=wMjLqBn41A8=nGsZY1Vgm-Y7nOD-WX2TVtbzaA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@linaro.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMzAvMjAxOCAxMTo1MyBBTSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+Cj4+
IEknbSB3b25kZXJpbmcgd2hhdCB0aGUgR1BVIHdvdWxkIGxpa2UgdG8gdGhlIGd1ZXN0LiBXb3Vs
ZCBpdCBiZSB0aGUgc2FtZQo+PiBpbnRlcmZhY2UgYXMgb24gYSBuYXRpdmUgbWFjaGluZSwgb3Ig
d291bGQgSSBuZWVkIFBWIGRyaXZlcnM/Cj4gCj4gSXQgZGVwZW5kcyBvbiB3aGF0IGd1ZXN0IGRv
bWFpbiBjb250YWlucy4KPiAKPiBJZiBEb21VIGhhcyBib3RoIERpc3BsYXkgVW5pdCBhbmQgR1BV
IGFzc2lnbmVkIHRoZW4gUFYgZHJpdmVyIGlzIG5vdCBuZWVkZWQuCj4gU28sIGhlcmUgd2UgaGF2
ZSB0aGUgc2FtZSBpbnRlcmZhY2UgYXMgb24gYSBuYXRpdmUgbWFjaGluZS4KPiAKPiBCdXQgaWYg
RG9tVSBoYXMgb25seSBHUFUgYXNzaWduZWQgdGhlbiBzb21ldGhpbmcgbGlrZSBQViBkaXNwbGF5
Cj4gZnJvbnRlbmQgaXMgbmVlZGVkIGhlcmUsCj4gcGx1cyBQViBkaXNwbGF5IGJhY2tlbmQgcnVu
bmluZyBpbiBhIGd1ZXN0IGRvbWFpbiB3aGljaCBvd25zIERpc3BsYXkgVW5pdC4KPiAKPiBUaGUg
cG9zc2libGUgaGludCBpcyB0aGF0IGlmIERpc3BsYXkgVW5pdCBoYXMgaW5kZXBlbmRlbnQgY3J0
Y3MsCj4gY29ubmVjdG9ycywgZXRjIGl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIHNwbGl0IGl0Cj4g
aW50byB0aGUgc2VwYXJhdGUgdW5pdHMgYW5kIGFzc2lnbiB0aGVtIHRvIGRpZmZlcmVudCBndWVz
dCBkb21haW5zIChvZgo+IGNvdXJzZSwgdGhlIEhXIG11c3QgYmUgc3BsaXR0YWJsZSkuCj4gSSB0
aGluaywgdGhpcyB3b3VsZCBhdm9pZCBQViBkcml2ZXIgdXNhZ2UuCj4gCgpUaGF0IG1ha2VzIHNl
bnNlLiBUaGFua3MgYWdhaW4gZm9yIHlvdXIgaGVscCB1bmRlcnN0YW5kaW5nIHRoaXMgYmV0dGVy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
