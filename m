From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Thu, 22 Nov 2018 09:55:25 -0800
Message-ID: <CAHk-=whxf0zqutExPr_j1A625Z3gcL6k_ABzKo1BtzN4F93hkA__46666.7360662997$1542909273$gmane$org@mail.gmail.com>
References: <20181122140320.24080-1-hch@lst.de>
 <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
 <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g4n+=ob=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1gPtCd-0005KD-IR
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 17:55:47 +0000
Received: by mail-lf1-x131.google.com with SMTP id i26so7072117lfc.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Nov 2018 09:55:45 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id r1-v6sm7574355ljb.64.2018.11.22.09.55.42
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Nov 2018 09:55:43 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id v5so7051379lfe.7
 for <xen-devel@lists.xenproject.org>; Thu, 22 Nov 2018 09:55:42 -0800 (PST)
In-Reply-To: <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: robin.murphy@arm.com
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, joro@8bytes.org, the arch/x86 maintainers <x86@kernel.org>, linux@armlinux.org.uk, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, jdmason@kudzu.us, David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgOTo1MiBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKPgo+IFVuZm9ydHVuYXRlbHksIHdpdGggdGhpbmdzIGxpa2UgdGhl
IHRvcC1kb3duIElPVkEgYWxsb2NhdG9yLCBhbmQgMzItYml0Cj4gc3lzdGVtcyBpbiBnZW5lcmFs
LCAidGhlIHRvcCA0MDk1IiB2YWx1ZXMgbWF5IHdlbGwgc3RpbGwgYmUgdmFsaWQKPiBhZGRyZXNz
ZXMgLQoKVWdoLgoKPiBUaGUgb25seSBpbW1lZGlhdGUgYmVuZWZpdCBJIGNhbiBzZWUgaXMgdGhh
dCB3ZSBjb3VsZCBkaXN0aW5ndWlzaCBjYXNlcwo+IGxpa2UgdGhlIGZpcnN0IHdoaWNoIGNhbiBu
ZXZlciBwb3NzaWJseSBzdWNjZWVkLCBhbmQgdGh1cyBjYWxsZXJzIGNvdWxkCj4gYWN0dWFsbHkg
Z2l2ZSB1cCBpbnN0ZWFkIG9mIGRvaW5nIHdoYXQgdmFyaW91cyBzdWJzeXN0ZW1zIGN1cnJlbnRs
eSBkbwo+IGFuZCByZXRyeSB0aGUgZXhhY3Qgc2FtZSBtYXBwaW5nIGluZGVmaW5pdGVseSBvbiB0
aGUgYXBwYXJlbnQgYXNzdW1wdGlvbgo+IHRoYXQgZXJyb3JzIG11c3QgYmUgdHJhbnNpZW50LgoK
Tm8sIHRoZSBiaWcgaW1tZWRpYXRlIGJlbmVmaXQgb2YgYWxsb3dpbmcgInJldHVybiAtRUlOVkFM
IiBldGMgaXMKc2ltcGx5IGxlZ2liaWxpdHkgYW5kIGVycm9yIGF2b2lkYW5jZS4KCkl0J3MgYmFz
aWNhbGx5IGhvdyBwcmV0dHkgbXVjaCBhbGwgdGhlIHJlc3Qgb2YgdGhlIGtlcm5lbCByZXR1cm5z
CmVycm9ycywgc28gbm90IG9ubHkgaXMgaXQgdmVyeSBvYnZpb3VzLCBpdCdzIGFsc28gd2hhdCBw
ZW9wbGUgZG8Kd2l0aG91dCBldmVuIHRoaW5raW5nLi4gU28gaXQgd291bGQgYmUgZ29vZCB0byB3
b3JrLgoKICAgICAgICAgICAgICAgICAgICAgICBMaW51cwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
