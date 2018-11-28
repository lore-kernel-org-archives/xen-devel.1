From: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Wed, 28 Nov 2018 08:41:17 +0100
Message-ID: <20181128074117.GA21126__18709.1300068007$1543390812$gmane$org@lst.de>
References: <20181122140320.24080-1-hch@lst.de>
 <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
 <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
 <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
 <20181123065511.GA17856@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qaal=oh=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1gRuTJ-0007vA-Ox
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 07:41:21 +0000
Content-Disposition: inline
In-Reply-To: <20181123065511.GA17856@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, robin.murphy@arm.com, the arch/x86 maintainers <x86@kernel.org>, linux@armlinux.org.uk, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDc6NTU6MTFBTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDk6NTU6MjVBTSAtMDgwMCwgTGlu
dXMgVG9ydmFsZHMgd3JvdGU6Cj4gPiBObywgdGhlIGJpZyBpbW1lZGlhdGUgYmVuZWZpdCBvZiBh
bGxvd2luZyAicmV0dXJuIC1FSU5WQUwiIGV0YyBpcwo+ID4gc2ltcGx5IGxlZ2liaWxpdHkgYW5k
IGVycm9yIGF2b2lkYW5jZS4KPiAKPiBXZWxsLCBJIGNhbiB0d2VhayB0aGUgbGFzdCBwYXRjaCB0
byByZXR1cm4gLUVJTlZBTCBmcm9tIGRtYV9tYXBwaW5nX2Vycm9yCj4gaW5zdGVhZCBvZiB0aGUg
b2xkIDEgaXMgYXMgYm9vbCB0cnVlLiAgVGhlIGNhbGxlcnMgc2hvdWxkIGFsbCBiZSBmaW5lLAo+
IGFsdGhvdWdoIEknZCBoYXZlIHRvIGF1ZGl0IHRoZW0uICBTdGlsbCB3b3VsZG4ndCBoZWxwIHdp
dGggYmVpbmcgYWJsZSB0bwo+IHJldHVybiBkaWZmZXJlbnQgZXJyb3JzLgoKQW55IG9waW5pb25z
PyAgSSdkIHJlYWxseSBsaWtlIHRvIG1ha2Ugc29tZSBmb3J3YXJkIHByb2dyZXNzIG9uIHRoaXMK
c2VyaWVzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
