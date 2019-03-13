From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Revert "swiotlb: remove SWIOTLB_MAP_ERROR"
Date: Wed, 13 Mar 2019 20:44:55 +0100
Message-ID: <CAK8P3a0yj5TqP95KNwM3uhYuhVSuiLkwYWQe-nLyyVd0j7sGtw__12809.2478540324$1552506368$gmane$org@mail.gmail.com>
References: <20190304195951.1118807-1-arnd@arndb.de>
 <b0b995a1-3211-870f-01af-ce837c18e8f9@arm.com>
 <CAK8P3a2KQKTDQCQcFR7ZTFJ+_XhfKpy9W27r+YV=iD6hLVu2xg@mail.gmail.com>
 <957e168a-2589-89c7-3a72-5071a7b6c65a@arm.com> <20190308152355.GA20230@lst.de>
 <124f4e49-9eb1-99d9-35f4-c2ef3dff8415@arm.com> <20190313183254.GC4926@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sije=RQ=gmail.com=arndbergmann@srs-us1.protection.inumbo.net>)
 id 1h49oT-0002dK-8e
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 19:45:17 +0000
Received: by mail-qt1-f195.google.com with SMTP id v10so3368986qtp.8
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2019 12:45:13 -0700 (PDT)
In-Reply-To: <20190313183254.GC4926@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Julien Grall <julien.grall@arm.com>, Joerg Roedel <jroedel@suse.de>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTMsIDIwMTkgYXQgNzozMyBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4gT24gRnJpLCBNYXIgMDgsIDIwMTkgYXQgMDU6MjU6NTdQTSArMDAwMCwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gSW4gdGhlIGNvbW1vbiBjYXNlLCBEb20wIGFsc28gY29u
dGFpbnMgdGhlIFBWIGJhY2tlbmQgZHJpdmVycy4gVGhvc2UKPiA+IGRyaXZlcnMgbWF5IGRpcmVj
dGx5IHVzZSB0aGUgZ3Vlc3QgYnVmZmVyIGluIHRoZSBETUEgcmVxdWVzdCAoc28gYSBjb3B5IGlz
Cj4gPiBhdm9pZGVkKS4gVG8gYXZvaWQgdXNpbmcgYSBib3VuY2UgYnVmZmVyIHRvbyBtdWNoLCB4
ZW4tc3dpb3RsYiB3aWxsIGZpbmQKPiA+IHRoZSBob3N0IHBoeXNpY2FsIGFkZHJlc3MgYXNzb2Np
YXRlZCB0byB0aGUgZ3Vlc3QgYnVmZmVyIGFuZCB3aWxsIHVzZSBpdCB0bwo+ID4gY29tcHV0ZSB0
aGUgRE1BIGFkZHJlc3MuCj4gPgo+ID4gV2hpbGUgRG9tMCBrZXJuZWwgbWF5IG9ubHkgZGVhbCB3
aXRoIDMyLWJpdCBwaHlzaWNhbCBhZGRyZXNzLCB0aGUKPiA+IGh5cGVydmlzb3IgY2FuIHN0aWxs
IGRlYWwgd2l0aCB1cCB0byA0MC1iaXQgcGh5c2ljYWwgYWRkcmVzcy4gVGhpcyBtZWFucwo+ID4g
dGhlIGd1ZXN0IG1lbW9yeSBjYW4gYmUgYWxsb2NhdGVkIGFib3ZlIHRoZSA0R0IgdGhyZXNob2xk
LiBIZW5jZSB3aHkgdGhlCj4gPiBkbWFfYWRkcl90IGlzIGFsd2F5cyA2NC1iaXQgd2l0aCBDT05G
SUdfWEVOPXkuCj4KPiBUaGlzIGF0IGxlYXN0IG1ha2VzIHNvbWUgc2Vuc2UuICBCdXQgaXMgaXQg
cmVhbGx5IHNvIG11Y2ggYmV0dGVyIHRvCj4gYXZvaWQgaGF2aW5nIGEgNjQtYml0IHBoeXNfYWRk
cl90PwoKSSBsaWtlIHRoZSB3YXkgd2UgdGllIHBoeXNfYWRkcl90IHRvIHRoZSBwYWdlIHRhYmxl
IGZvcm1hdCwgYXMgaXQgc2VlbXMKY29uc2lzdGVudCB0byBoYXZlIHBoeXNfYWRkcl90IGJlIHdo
aWNoZXZlciBkYXRhIHR5cGUgY2FuIGJlIGFkZHJlc3NlZAp0aHJvdWdoIHZpcnR1YWwgbWVtb3J5
LgoKVGhlIG1haW4gcHJhY3RpY2FsIGFkdmFudGFnZSBJIHNlZSBpbiBhbGxvd2luZyBwaHlzX2Fk
ZHJfdCBhbmQgZG1hX2FkZHJfdAp0byBiZSBpbmRlcGVuZGVudCByYXRoZXIgdGhhbiBoYXZpbmcg
Ym90aCBvZiB0aGVtIGJlIHRoZSBzYW1lIGFuZCBncm93CnRvIGFzIG11Y2ggYXMgaXMgbmVlZGVk
IGlzIHRoYXQgbW9zdCByYW5kY29uZmlnIGlzc3VlcyBJIGZvdW5kIHRoYXQKcmVzdWx0IGZyb20g
YSB0eXBlIG1pc21hdGNoIGFyZSBmb3IgcmVhbCBidWdzLCB0eXBpY2FsbHkgaW4gZHJpdmVyIGNv
ZGUgdGhhdAppcyB3cml0dGVuIHVuZGVyIHRoZSBhc3N1bXB0aW9uIHRoYXQgYm90aCBoYXZlIG5v
dCBvbmx5IHRoZSBzYW1lIHNpemUKYnV0IGFsc28gdGhlIHNhbWUgYmluYXJ5IHJlcHJlc2VudGF0
aW9uIGZvciBhIGdpdmVuIG1lbW9yeSBhZGRyZXNzLgoKICAgICAgQXJuZAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
