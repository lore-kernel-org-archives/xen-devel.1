From: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Thu, 29 Nov 2018 17:23:23 +0100
Message-ID: <20181129162323.GA27068__12216.3597996861$1543508538$gmane$org@lst.de>
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
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=POby=OI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1gSP66-00029M-U0
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 16:23:26 +0000
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMTE6MTk6MTVBTSAtMDgwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gTGV0IG1lIGp1c3QgcGFzdGUgaXQgYmFjayBpbiBoZXJlOgo+IAo+ICAgIldoaWNo
IGlzIHdoYXQgd2UgQUxSRUFEWSBkbyBmb3IgdGhlc2UgZXhhY3QgcmVhc29ucy4gSWYgdGhlIERN
QQo+IG1hcHBpbmdzIG1lYW5zIHRoYXQgeW91J2QgbmVlZCB0byBhZGQgb25lIG1vcmUgcGFnZSB0
byB0aGF0IGxpc3Qgb2YKPiByZXNlcnZlZCBwYWdlcywgdGhlbiBzbyBiZSBpdC4iCj4gCj4gU28g
bm8sIEknbSBub3QgYXQgYWxsIGNvbmZ1c2VkLgo+IAo+IExldCBtZSByZS1pdGVyYXRlOiB0aGUg
YXJndW1lbnQgdGhhdCBhbGwgYWRkcmVzc2VzIGhhdmUgdG8gYmUgZG1hJ2FibGUgaXMKPiBnYXJi
YWdlLgo+IAo+ICpFeGFjdGx5KiBhcyB3aXRoIGttYWxsb2MgYW5kIGxpbWl0ZWQgdmlydHVhbCBh
ZGRyZXNzZXMsIHdlIGNhbiBsaW1pdAo+IHBoeXNpY2FsIGFkZHJlc3Nlcy4KCldlIGNhbi4gIEF0
IGxlYXN0IGluIHRoZW9yeS4gIFRoZSBwcm9ibGVtIGlzIHRoYXQgZGVwZW5kaW5nIG9uIHRoZQpj
cmF6eSBtYXBwaW5nIGZyb20gcGh5c2ljYWwgYW5kIGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3MgdG8g
ZG1hIGFkZHJlc3Nlcwp0aGVzZSBtaWdodCBiZSBwYWdlcyBhdCBwcmV0dHkgcmFuZG9tIHBsYWNl
cy4gIExvb2sgYXQgZnVuIGxpa2UKYXJjaC94ODYvcGNpL3N0YTJ4MTEtZml4dXAuYyBmb3IgaG93
IHVnbHkgdGhlc2UgbWFwcGluZ3MgY291bGQgbG9vay4KCkl0IGFsc28gbWVhbnMgdGhhdCB3ZSBt
aWdodCBoYXZlIHNldHVwIHN3aW90bGIgb24ganVzdCBhYm91dCBldmVyeQozMi1iaXQgYXJjaGl0
ZWN0dXJlLCBldmVuIGlmIGl0IGhhcyBubyByZWFsIGFkZHJlc3NpbmcgbGltaXQgZXhjZXB0IGZv
cgp0aGUgb25lIHdlIGltcG9zZWQuICBJIGRvbid0IHJlYWxseSBzZWUgaG93IHRoaXMgaXMgYSB3
aW4gZm9yIHVzIGp1c3QKdG8gYmUgYWJsZSB0byByZXBvcnQgbW9yZSBkZXRhaWxlZCBlcnJvciBj
b2Rlcywgd2hpY2ggd291bGQgYmUgbmljZQp0byBoYXZlLCBidXQgdGhlIGxhY2sgb2Ygd2hpY2gg
aGFzbid0IHJlYWxseSBoYXJtZWQgdXMuCgpTbyBhcyBmYXIgYXMgSSdtIGNvbmNlcm5lZCBJJ2Qg
Z28gZWl0aGVyIHdpdGggdGhlIHNlcmllcyB0aGF0IHdlIGFyZQpkaXNjdXNzaW5nIGhlcmUsIG9y
IGNoYW5nZSB0aGUgbWFwX3BhZ2UgbWV0aG9kIHRvIHJldHVybiBhbiBlcnJubwphbmQgdGhlIGRt
YV9hZGRyX3QgaW4gdGhlIGFyZ3VtZW50LiAgQXMgRGF2ZW0gcG9pbnRlZCBvdXQgdGhhdCBjYW4g
bGVhZAp0byBsZXNzIG9wdGltYWwgY29kZSwgYnV0IGl0IHdvdWxkIHN0aWxsIGJlIGJldHRlciB0
aGFuIHRoZSBpbmRpcmVjdApjYWxsIHdlIGhhdmUuICBCdXQgdGhlbiBhZ2FpbiBJIHRoaW5rIHRo
ZSBzZXJpZXMgYXMgcG9zdGVkIGhlcmUgbWlnaHQKYW5kIHVwIG11Y2ggc2ltcGxlciBhbmQgZ29v
ZCBlbm91Z2ggd2l0aG91dCBvcGVuaW5nIHVwIHRoaXMgcmF0aG9sZS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
