From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Wed, 28 Nov 2018 17:45:45 +0000
Message-ID: <20181128174545.GJ30658__1966.16232065043$1543427093$gmane$org@n2100.armlinux.org.uk>
References: <20181122140320.24080-1-hch@lst.de>
 <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
 <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
 <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
 <20181123065511.GA17856@lst.de> <20181128074117.GA21126@lst.de>
 <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dsg/=oh=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1gS3uY-0007cO-39
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 17:46:06 +0000
Content-Disposition: inline
In-Reply-To: <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDg6NDc6MDVBTSAtMDgwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gT24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMTE6NDEgUE0gQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgTm92IDIzLCAyMDE4IGF0IDA3
OjU1OjExQU0gKzAxMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gPiBXZWxsLCBJIGNh
biB0d2VhayB0aGUgbGFzdCBwYXRjaCB0byByZXR1cm4gLUVJTlZBTCBmcm9tIGRtYV9tYXBwaW5n
X2Vycm9yCj4gPiA+IGluc3RlYWQgb2YgdGhlIG9sZCAxIGlzIGFzIGJvb2wgdHJ1ZS4gIFRoZSBj
YWxsZXJzIHNob3VsZCBhbGwgYmUgZmluZSwKPiA+ID4gYWx0aG91Z2ggSSdkIGhhdmUgdG8gYXVk
aXQgdGhlbS4gIFN0aWxsIHdvdWxkbid0IGhlbHAgd2l0aCBiZWluZyBhYmxlIHRvCj4gPiA+IHJl
dHVybiBkaWZmZXJlbnQgZXJyb3JzLgo+ID4KPiA+IEFueSBvcGluaW9ucz8gIEknZCByZWFsbHkg
bGlrZSB0byBtYWtlIHNvbWUgZm9yd2FyZCBwcm9ncmVzcyBvbiB0aGlzCj4gPiBzZXJpZXMuCj4g
Cj4gU28gSSBkbyB0aGluayB0aGF0IHllcywgZG1hX21hcHBpbmdfZXJyb3IoKSBzaG91bGQgcmV0
dXJuIGFuIGVycm9yCj4gY29kZSwgbm90IDAvMS4KPiAKPiBCdXQgSSB3YXMgcmVhbGx5IGhvcGlu
ZyB0aGF0IHRoZSBpbmRpdmlkdWFsIGRyaXZlcnMgdGhlbXNlbHZlcyBjb3VsZAo+IHJldHVybiBl
cnJvciBjb2Rlcy4gUmlnaHQgbm93IHRoZSBwYXRjaC1zZXJpZXMgaGFzIGNvZGUgbGlrZSB0aGlz
Ogo+IAo+ICAgICAgIHJldCA9IG5lZWRzX2JvdW5jZShkZXYsIGRtYV9hZGRyLCBzaXplKTsKPiAg
ICAgICBpZiAocmV0IDwgMCkKPiAtICAgICAgICAgcmV0dXJuIEFSTV9NQVBQSU5HX0VSUk9SOwo+
ICsgICAgICAgICByZXR1cm4gRE1BX01BUFBJTkdfRVJST1I7Cj4gCj4gd2hpY2ggd2hpbGUgaXQg
YWxsIG1ha2VzIHNlbnNlIGluIHRoZSBjb250ZXh0IG9mIHRoaXMgcGF0Y2gtc2VyaWVzLCBJCj4g
KnJlYWxseSogdGhpbmsgaXQgd291bGQgaGF2ZSBiZWVuIHNvIG11Y2ggbmljZXIgdG8gcmV0dXJu
IHRoZSBlcnJvcgo+IGNvZGUgJ3JldCcgaW5zdGVhZCAod2hpY2ggaW4gdGhpcyBjYXNlIGlzIC1F
MkJJRykuCj4gCj4gSSBkb24ndCB0aGluayB0aGlzIGlzIGEgaHVnZSBkZWFsLCBidXQgRVJSX1BU
UigpIGhhcyBiZWVuIGh1Z2VseQo+IHN1Y2Nlc3NmdWwgZWxzZXdoZXJlLiBBbmQgSSdtIG5vdCBo
dWdlbHkgY29udmluY2VkIGFib3V0IGFsbCB0aGVzZQo+ICJhbnkgYWRkcmVzcyBjYW4gYmUgdmFs
aWQiIGFyZ3VtZW50cy4gSG93IHRoZSBoZWxsIGRvIHlvdSBnZW5lcmF0ZSBhCj4gcmFuZG9tIGRt
YSBhZGRyZXNzIGluIHRoZSBsYXN0IHBhZ2UgdGhhdCBpc24ndCBldmVuIHBhZ2UtYWxpZ25lZD8K
CmttYWxsb2MoKSBhIDY0LWJ5dGUgYnVmZmVyLCBkbWFfbWFwX3NpbmdsZSgpIHRoYXQgYnVmZmVy
LiAgSWYgeW91CmhhdmUgUkFNIHRoYXQgbWFwcyB0byBhIF9idXNfIGFkZHJlc3MgaW4gdGhlIHRv
cCBwYWdlIG9mIDRHQiBvZiBhCjMyLWJpdCBidXMgYWRkcmVzcywgdGhlbiB5b3UgbG9zZS4gIFNp
bXBsZXMuCgpTdWJzeXN0ZW1zIGxpa2UgSTJDLCBTUEksIFVTQiBldGMgYWxsIGRlYWwgd2l0aCBz
bWFsbCBrbWFsbG9jJ2QKYnVmZmVycyBhbmQgdGhlaXIgZHJpdmVycyBtYWtlIHVzZSBvZiBETUEu
CgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZl
bG9wZXIvcGF0Y2hlcy8KRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJp
YTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRvIHNwZWVkdGVz
dC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
