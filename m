From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] Revert "swiotlb: remove SWIOTLB_MAP_ERROR"
Date: Fri, 8 Mar 2019 16:23:55 +0100
Message-ID: <20190308152355.GA20230__9129.86774217046$1552058697$gmane$org@lst.de>
References: <20190304195951.1118807-1-arnd@arndb.de>
 <b0b995a1-3211-870f-01af-ce837c18e8f9@arm.com>
 <CAK8P3a2KQKTDQCQcFR7ZTFJ+_XhfKpy9W27r+YV=iD6hLVu2xg@mail.gmail.com>
 <957e168a-2589-89c7-3a72-5071a7b6c65a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mPFN=RL=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1h2HLv-0006Y4-LD
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 15:24:03 +0000
Content-Disposition: inline
In-Reply-To: <957e168a-2589-89c7-3a72-5071a7b6c65a@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, Christoph Hellwig <hch@lst.de>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMDUsIDIwMTkgYXQgMDk6NDE6NDZBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IE9uIFhlbiwgZG1hX2FkZHJfdCB3aWxsIGFsd2F5cyBiZSA2NC1iaXQgd2hpbGUgdGhl
IHBoeXNfYWRkcl90IHdpbGwgZGVwZW5kIAo+IG9uIHRoZSBNTVUgdHlwZS4gU28gd2UgbWF5IGhh
dmUgcGh5c19hZGRyX3Qgc21hbGxlciB0aGFuIGRtYV9hZGRyX3QgZnJvbSAKPiB0aGUga2VybmVs
IHBvaW50IG9mIHZpZXcuCgpIb3cgY2FuIGRtYV9hZGRyX3Qgb24gYXJtIGhhdmUgdmFsdWUgPiAz
Mi1iaXQgd2hlbiBwaHlzaWNhbAphZGRyZXNzZXMgYXJlIDMyLWJpdCBvbmx5PwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
