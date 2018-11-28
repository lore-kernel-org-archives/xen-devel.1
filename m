From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Wed, 28 Nov 2018 19:31:57 +0000
Message-ID: <20181128193157.GO30658__46082.7014096596$1543433464$gmane$org@n2100.armlinux.org.uk>
References: <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
 <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
 <20181123065511.GA17856@lst.de> <20181128074117.GA21126@lst.de>
 <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
 <20181128174545.GJ30658@n2100.armlinux.org.uk>
 <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ@mail.gmail.com>
 <20181128180841.GM30658@n2100.armlinux.org.uk>
 <CAHk-=whcbiSxSUprsKjVPEdN5-+o8WnTGiKxEV-+HbKNDs=iNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dsg/=oh=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1gS5ZL-0008Hc-7x
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 19:32:19 +0000
Content-Disposition: inline
In-Reply-To: <CAHk-=whcbiSxSUprsKjVPEdN5-+o8WnTGiKxEV-+HbKNDs=iNA@mail.gmail.com>
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

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMTE6MTk6MTVBTSAtMDgwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gT24gV2VkLCBOb3YgMjgsIDIwMTgsIDEwOjA4IFJ1c3NlbGwgS2luZyAtIEFSTSBM
aW51eCA8bGludXhAYXJtbGludXgub3JnLnVrCj4gd3JvdGU6Cj4gCj4gPiA+Cj4gPiA+IFlvdSBh
bHJlYWR5IGNhbm5vdCBkbyB0aGF0IGttYWxsb2MoKSwgZXhhY3RseSBiZWNhdXNlIG9mIEVSUl9Q
VFIoKS4KPiA+Cj4gPiBJJ20gdmVyeSBzb3JyeSwgYnV0IEkgdGhpbmsgeW91IGFyZSBjb25mdXNl
ZC4KPiA+Cj4gPiBrbWFsbG9jKCkgcmV0dXJucyBhIF92aXJ0dWFsXyBhZGRyZXNzLCB3aGljaCBx
dWl0ZSByaWdodGx5IG11c3Qgbm90IGJlCj4gPiBpbiB0aGUgdG9wIDRLIG9mIDRHQiwgZXhhY3Rs
eSBkdWUgdG8gRVJSX1BUUigpLiAgVGhhdCBpcyBmaW5lLgo+ID4KPiA+IEhvd2V2ZXIsIHRoYXQg
aXMgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBrZXR0bGUgb2YgZmlzaCBmcm9tIGEgcGh5c2ljYWwK
PiA+IG9yIERNQSBhZGRyZXNzIC0gbmVpdGhlciBvZiB3aGljaCBhcmUgdmlydHVhbCBhZGRyZXNz
ZXMuCj4gPgo+IAo+IFlvdSBjdXQgYXdheSB0aGUgcGFydCB0aGF0IHNob3dlZCB0aGF0IEknbSBu
b3QgaW4gdGhlIGxlYXN0IGNvbmZ1c2VkLgo+IAo+IExldCBtZSBqdXN0IHBhc3RlIGl0IGJhY2sg
aW4gaGVyZToKPiAKPiAgICJXaGljaCBpcyB3aGF0IHdlIEFMUkVBRFkgZG8gZm9yIHRoZXNlIGV4
YWN0IHJlYXNvbnMuIElmIHRoZSBETUEKPiBtYXBwaW5ncyBtZWFucyB0aGF0IHlvdSdkIG5lZWQg
dG8gYWRkIG9uZSBtb3JlIHBhZ2UgdG8gdGhhdCBsaXN0IG9mCj4gcmVzZXJ2ZWQgcGFnZXMsIHRo
ZW4gc28gYmUgaXQuIgoKV2UncmUgbm90IHRhbGtpbmcgYWJvdXQganVzdCBvbmUgbW9yZSBwYWdl
LiAgV2UncmUgdGFsa2luZyBhYm91dApfZXZlcnlfIHBhZ2UgdGhhdCBfbWF5XyBtYXAgdG8gYSBi
dXMgYWRkcmVzcyBpbiB0aGUgcmFuZ2Ugb2YgNEdCIC0gNEsKKGEgcG9pbnQgSSd2ZSBhbHJlYWR5
IG1hZGUgZWFybGllciBpbiB0aGlzIGRpc2N1c3Npb24uKQoKSXQncyBub3QganVzdCBhYm91dCBw
aHlzaWNhbCBhZGRyZXNzZXMsIGl0J3MgYWJvdXQgYnVzIGFkZHJlc3NlcywKYW5kIHRoZXJlIGFy
ZSBidXNlcyBvdXQgdGhlcmUgdGhhdCBoYXZlIGEgdHJhbnNsYXRpb24gYmV0d2VlbiBwaHlzaWNh
bAphZGRyZXNzIGFuZCBidXMgYWRkcmVzcyB3aXRob3V0IElPTU1VcyBhbmQgdGhlIGxpa2UuCgpD
YW4gd2Uga25vdyBhaGVhZCBvZiB0aW1lIGFib3V0IGFsbCB0aGVzZSB0cmFuc2xhdGlvbnM/ICBJ
dCBtZWFucwptb3ZpbmcgdGhhdCBpbmZvcm1hdGlvbiBvdXQgb2YgdmFyaW91cyBidXMgZHJpdmVy
cyBpbnRvIGNvcmUKYXJjaGl0ZWN0dXJlIGNvZGUgKHl1Y2ssIHdoZW4geW91IGhhdmUgbXVsdGlw
bGUgZGlmZmVyZW50IHBsYXRmb3JtcykKb3IgaW50byBEVCAod2hpY2ggbWVhbnMgZWZmZWN0aXZl
bHkgYnJlYWtpbmcgZXZlcnkgZGFtbiBwbGF0Zm9ybQp0aGF0J3MgdXNpbmcgb2xkZXIgRFQgZmls
ZXMpIC0gc29tZXRoaW5nIHRoYXQgd2UgZG9uJ3QgaGF2ZSB0byBkbwp0b2RheS4KCkkgcmVtYWlu
IDEwMCUgb3Bwb3NlZCB0byB5b3VyIGlkZWEuCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRw
Oi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUQyBicm9hZGJhbmQg
Zm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAxMi4xTWJwcyBkb3duIDYyMmti
cHMgdXAKQWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1
cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
