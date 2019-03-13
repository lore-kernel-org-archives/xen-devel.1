From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] Revert "swiotlb: remove SWIOTLB_MAP_ERROR"
Date: Wed, 13 Mar 2019 19:32:54 +0100
Message-ID: <20190313183254.GC4926__48572.4521496863$1552502044$gmane$org@lst.de>
References: <20190304195951.1118807-1-arnd@arndb.de>
 <b0b995a1-3211-870f-01af-ce837c18e8f9@arm.com>
 <CAK8P3a2KQKTDQCQcFR7ZTFJ+_XhfKpy9W27r+YV=iD6hLVu2xg@mail.gmail.com>
 <957e168a-2589-89c7-3a72-5071a7b6c65a@arm.com>
 <20190308152355.GA20230@lst.de>
 <124f4e49-9eb1-99d9-35f4-c2ef3dff8415@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Q2nI=RQ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1h48gZ-0005cr-SA
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 18:33:03 +0000
Content-Disposition: inline
In-Reply-To: <124f4e49-9eb1-99d9-35f4-c2ef3dff8415@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDgsIDIwMTkgYXQgMDU6MjU6NTdQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEluIHRoZSBjb21tb24gY2FzZSwgRG9tMCBhbHNvIGNvbnRhaW5zIHRoZSBQViBiYWNr
ZW5kIGRyaXZlcnMuIFRob3NlIAo+IGRyaXZlcnMgbWF5IGRpcmVjdGx5IHVzZSB0aGUgZ3Vlc3Qg
YnVmZmVyIGluIHRoZSBETUEgcmVxdWVzdCAoc28gYSBjb3B5IGlzIAo+IGF2b2lkZWQpLiBUbyBh
dm9pZCB1c2luZyBhIGJvdW5jZSBidWZmZXIgdG9vIG11Y2gsIHhlbi1zd2lvdGxiIHdpbGwgZmlu
ZCAKPiB0aGUgaG9zdCBwaHlzaWNhbCBhZGRyZXNzIGFzc29jaWF0ZWQgdG8gdGhlIGd1ZXN0IGJ1
ZmZlciBhbmQgd2lsbCB1c2UgaXQgdG8gCj4gY29tcHV0ZSB0aGUgRE1BIGFkZHJlc3MuCj4KPiBX
aGlsZSBEb20wIGtlcm5lbCBtYXkgb25seSBkZWFsIHdpdGggMzItYml0IHBoeXNpY2FsIGFkZHJl
c3MsIHRoZSAKPiBoeXBlcnZpc29yIGNhbiBzdGlsbCBkZWFsIHdpdGggdXAgdG8gNDAtYml0IHBo
eXNpY2FsIGFkZHJlc3MuIFRoaXMgbWVhbnMgCj4gdGhlIGd1ZXN0IG1lbW9yeSBjYW4gYmUgYWxs
b2NhdGVkIGFib3ZlIHRoZSA0R0IgdGhyZXNob2xkLiBIZW5jZSB3aHkgdGhlIAo+IGRtYV9hZGRy
X3QgaXMgYWx3YXlzIDY0LWJpdCB3aXRoIENPTkZJR19YRU49eS4KClRoaXMgYXQgbGVhc3QgbWFr
ZXMgc29tZSBzZW5zZS4gIEJ1dCBpcyBpdCByZWFsbHkgc28gbXVjaCBiZXR0ZXIgdG8KYXZvaWQg
aGF2aW5nIGEgNjQtYml0IHBoeXNfYWRkcl90PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
