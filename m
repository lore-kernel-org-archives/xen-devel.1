From: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Fri, 23 Nov 2018 07:55:11 +0100
Message-ID: <20181123065511.GA17856__25429.4914812364$1542956046$gmane$org@lst.de>
References: <20181122140320.24080-1-hch@lst.de>
 <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
 <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
 <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=muTw=OC=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1gQ5Mx-0003Vv-15
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 06:55:15 +0000
Content-Disposition: inline
In-Reply-To: <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, joro@8bytes.org, the arch/x86 maintainers <x86@kernel.org>, linux@armlinux.org.uk, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, jdmason@kudzu.us, robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDk6NTU6MjVBTSAtMDgwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gTm8sIHRoZSBiaWcgaW1tZWRpYXRlIGJlbmVmaXQgb2YgYWxsb3dpbmcgInJldHVy
biAtRUlOVkFMIiBldGMgaXMKPiBzaW1wbHkgbGVnaWJpbGl0eSBhbmQgZXJyb3IgYXZvaWRhbmNl
LgoKV2VsbCwgSSBjYW4gdHdlYWsgdGhlIGxhc3QgcGF0Y2ggdG8gcmV0dXJuIC1FSU5WQUwgZnJv
bSBkbWFfbWFwcGluZ19lcnJvcgppbnN0ZWFkIG9mIHRoZSBvbGQgMSBpcyBhcyBib29sIHRydWUu
ICBUaGUgY2FsbGVycyBzaG91bGQgYWxsIGJlIGZpbmUsCmFsdGhvdWdoIEknZCBoYXZlIHRvIGF1
ZGl0IHRoZW0uICBTdGlsbCB3b3VsZG4ndCBoZWxwIHdpdGggYmVpbmcgYWJsZSB0bwpyZXR1cm4g
ZGlmZmVyZW50IGVycm9ycy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
