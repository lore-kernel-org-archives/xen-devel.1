From: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Fri, 23 Nov 2018 07:57:20 +0100
Message-ID: <20181123065720.GB17856__22516.1123475575$1542956163$gmane$org@lst.de>
References: <20181122140320.24080-1-hch@lst.de>
 <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
 <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
 <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
 <20181122180526.GL30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=muTw=OC=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1gQ5P2-0003cD-6P
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 06:57:24 +0000
Content-Disposition: inline
In-Reply-To: <20181122180526.GL30658@n2100.armlinux.org.uk>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, joro@8bytes.org, the arch/x86 maintainers <x86@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, jdmason@kudzu.us, robin.murphy@arm.com, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDY6MDU6MjZQTSArMDAwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IHdyb3RlOgo+IEFuIGFsdGVybmF0aXZlIGlkZWEgd291bGQgYmUgdG8gbWlncmF0
ZSBhd2F5IGZyb20gdGhlCj4gZG1hX21hcF9zaW5nbGUoKSBhbmQgZG1hX21hcF9wYWdlKCkgaW50
ZXJmYWNlcyB0aGF0IHJldHVybiBhCj4gZG1hX2FkZHJfdCwgYW5kIGluc3RlYWQgaGF2ZSB0aGVt
IHJldHVybiBhbiBlcnJvciBjb2RlIG9yIHplcm8KPiBvbiBzdWNjZXNzLgoKU2VlIGhlcmUgZm9y
IGEgcHJvcG9zYWw6CgpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvcGlwZXJtYWls
L2lvbW11LzIwMTgtTm92ZW1iZXIvMDMwOTEyLmh0bWwKClRoYXQgaXMganVzdCB0aGUgYXR0ciB2
YXJpYW50cywgYnV0IHRoYXQgd291bGQgYmUgYSBzdGFydC4gIERhdmUgZGlkbid0CnBhcnRpY3Vs
YXJseSBsaWtlIGl0LCB0aG91Z2guCgo+IG5vdGUgdGhlIHNpbXBsZXIgdW5tYXAgQVBJLCB3aGlj
aCBpbmhlcmVudGx5IGd1YXJhbnRlZXMgdGhhdCB0aGUKPiBwYXJhbWV0ZXJzIHRvIHRoZSBtYXAg
Y291bGQgYmUgY2FycmllZCBvdmVyIHRvIHRoZSB1bm1hcCAtIHdpdGhvdXQKPiBvdXIgbWFueSBk
cml2ZXIgYXV0aG9ycyBoYXZpbmcgdG8gdGhpbmsgYWJvdXQgaXQuCgpUaGUgcHJvYmxlbSBpcyB0
aGF0IHdlIGNhbiBvZnRlbiBkZXJpdmUgc29tZSBvciBhbGwgcGFyYW1ldGVycyBmcm9tCmZpZWxk
IGFscmVhZHkgaW5oZXJlbnQgaW4gdGhlIHVwcGVyIGxheWVyIG9yIGhhcmR3YXJlIGludGVyZmFj
ZS4gIFNvCmZvciB0aGVzZSBjYXNlcyB5b3VyIHZlcnNpb24gd291bGQgYmxvYXQgdGhlIHJlcXVp
cmVkIGRhdGEgc3RydWN0dXJlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
