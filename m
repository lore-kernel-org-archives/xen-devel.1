From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Thu, 22 Nov 2018 17:14:47 +0000
Message-ID: <20181122171446.GJ30658__43199.7299231172$1542906843$gmane$org@n2100.armlinux.org.uk>
References: <20181122140320.24080-1-hch@lst.de>
 <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
 <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xz9y=ob=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1gPsZP-0001TM-Dt
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 17:15:15 +0000
Content-Disposition: inline
In-Reply-To: <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, robin.murphy@arm.com, joro@8bytes.org, the arch/x86 maintainers <x86@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, jdmason@kudzu.us, David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDk6MDk6NDdBTSAtMDgwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gT24gVGh1LCBOb3YgMjIsIDIwMTggYXQgOTowNyBBTSBSdXNzZWxsIEtpbmcgLSBB
Uk0gTGludXgKPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiBJJ20gYWZy
YWlkIHRoYXQgd29uJ3Qgd29yayB2ZXJ5IHdlbGwgLSAzMiBiaXQgcGxhdGZvcm1zIHdpdGggNjQt
Yml0Cj4gPiBhZGRyZXNzZXMgKExQQUUpIHdvdWxkIGhhdmUgZG1hX2FkZHJfdCBhcyBhIDY0LWJp
dCB2YWx1ZSwgd2hpY2gKPiA+IHdvdWxkbid0IGZpdCBpbnRvIGFuIHVuc2lnbmVkIGxvbmcuCj4g
Cj4gR29vZCBwb2ludC4gU28gd2UnZCBoYXZlIHRvIGhhdmUgYSBzcGVjaWFsIElTX0RNQV9FUlIo
KSBmdW5jdGlvbiB0aGF0Cj4gdGFrZXMgYSBkbWFfYWRkcl90IGFuZCBjaGVja3MgdGhlIHNhbWUg
ImlzIGl0IHRoZSB0b3AgNDA5NSB2YWx1ZXMiLgoKTm8gcHJvYmxlbSB3aXRoIHRoYXQuCgotLSAK
Uk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIv
cGF0Y2hlcy8KRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJpYTogc3lu
YyBhdCAxMi4xTWJwcyBkb3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6
IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
