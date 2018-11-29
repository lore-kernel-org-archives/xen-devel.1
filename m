From: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Thu, 29 Nov 2018 19:31:32 +0100
Message-ID: <20181129183132.GA30281__35672.8449384265$1543516263$gmane$org@lst.de>
References: <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
 <20181123065511.GA17856@lst.de> <20181128074117.GA21126@lst.de>
 <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
 <20181128174545.GJ30658@n2100.armlinux.org.uk>
 <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ@mail.gmail.com>
 <20181128180841.GM30658@n2100.armlinux.org.uk>
 <CAHk-=whcbiSxSUprsKjVPEdN5-+o8WnTGiKxEV-+HbKNDs=iNA@mail.gmail.com>
 <20181129162323.GA27068@lst.de>
 <CAHk-=wi2K7_+dgCbc-sAK9CST5Zh+pOuH7sVT9WW-kqs50HSzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=poby=oi=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1gSR6c-00058A-IN
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 18:32:06 +0000
Content-Disposition: inline
In-Reply-To: <CAHk-=wi2K7_+dgCbc-sAK9CST5Zh+pOuH7sVT9WW-kqs50HSzQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjksIDIwMTggYXQgMDk6NDQ6MDVBTSAtMDgwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gTm8uIFJlYWxseS4gSWYgdGhlcmUncyBubyBpb3RsYiwgdGhlbiB5b3UganVzdCBt
YXJrIHRoYXQgb25lIHBhZ2UKPiByZXNlcnZlZC4gSXQgc2ltcGx5IGRvZXNuJ3QgZ2V0IHVzZWQu
IEl0IGRvZXNuJ3QgbWVhbiB5b3Ugc3VkZGVubHkKPiBuZWVkIGEgc3dpb3RsYi4KClN1cmUsIHdl
IGNvdWxkIGp1c3Qgc2tpcCB0aGF0IHBhZ2UgZW50aXJlbHkgYmFzZWQgb24gZG1hX3RvX3BoeXMu
Cgo+IEJ1dCB3aGF0ZXZlci4gSXQncyBpbmRlcGVuZGVudCBmcm9tIHRoZSBwYXRjaCBzZXJpZXMg
dW5kZXIgZGlzY3Vzc2lvbi4KPiBNYWtlIGRtYV9tYXBwaW5nX2Vycm9yKCkgYXQgbGVhc3QgcmV0
dXJuIGEgcmVhbCBlcnJvciAoZWcgLUVJTlZBTCwgb3IKPiB3aGF0ZXZlciBpcyB0aGUgY29tbW9u
IGVycm9yKSwgYW5kIHdlIGNhbiBtYXliZSBkbyB0aGlzIGxhdGVyLgoKT2ssIEknbGwgZG8gdGhh
dC4KCj4gT3IsIGJldHRlciB5ZXQsIHBsYW4gb24gcmVtb3ZpbmcgdGhlIHNpbmdsZS1wYWdlIGRt
YSBtYXBwaWduIGVudGlyZWx5Cj4gYXQgYSBsYXRlciBkYXRlLCBhbmQgbWFrZSB0aGUgaXNzdWUg
bW9vdC4KCldoYXQgd291bGQgYmUgdGhlIHJlcGxhY2VtZW50PyAgQnVpbGQgYSBTL0cgbGlzdCBm
b3IgZXZlcnkgc2luZ2xlIHBhZ2UKbWFwcGluZz8gIE5vdCBzdXJlIHRoYXQgd291bGQgY3JlYXRl
IGEgbG90IG9mIGhhcHB5IGNhbXBlcnMuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
