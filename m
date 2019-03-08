From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] Revert "swiotlb: remove SWIOTLB_MAP_ERROR"
Date: Fri, 8 Mar 2019 17:25:57 +0000
Message-ID: <124f4e49-9eb1-99d9-35f4-c2ef3dff8415__33858.8050844677$1552066019$gmane$org@arm.com>
References: <20190304195951.1118807-1-arnd@arndb.de>
 <b0b995a1-3211-870f-01af-ce837c18e8f9@arm.com>
 <CAK8P3a2KQKTDQCQcFR7ZTFJ+_XhfKpy9W27r+YV=iD6hLVu2xg@mail.gmail.com>
 <957e168a-2589-89c7-3a72-5071a7b6c65a@arm.com>
 <20190308152355.GA20230@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NVb+=RL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h2JFy-0000AJ-Re
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 17:26:02 +0000
In-Reply-To: <20190308152355.GA20230@lst.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQ2hyaXN0b3BoLAoKT24gMDgvMDMvMjAxOSAxNToyMywgQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6Cj4gT24gVHVlLCBNYXIgMDUsIDIwMTkgYXQgMDk6NDE6NDZBTSArMDAwMCwgSnVsaWVuIEdy
YWxsIHdyb3RlOgo+PiBPbiBYZW4sIGRtYV9hZGRyX3Qgd2lsbCBhbHdheXMgYmUgNjQtYml0IHdo
aWxlIHRoZSBwaHlzX2FkZHJfdCB3aWxsIGRlcGVuZAo+PiBvbiB0aGUgTU1VIHR5cGUuIFNvIHdl
IG1heSBoYXZlIHBoeXNfYWRkcl90IHNtYWxsZXIgdGhhbiBkbWFfYWRkcl90IGZyb20KPj4gdGhl
IGtlcm5lbCBwb2ludCBvZiB2aWV3Lgo+IAo+IEhvdyBjYW4gZG1hX2FkZHJfdCBvbiBhcm0gaGF2
ZSB2YWx1ZSA+IDMyLWJpdCB3aGVuIHBoeXNpY2FsCj4gYWRkcmVzc2VzIGFyZSAzMi1iaXQgb25s
eT8KClRoZSBudW1iZXIgb2YgcGxhdGZvcm0gd2l0aCBJT01NVSBwcm90ZWN0ZWQgYWxsIERNQS1j
YXBhYmxlIGRldmljZSBpcyBub3QgeWV0IAp0aGVyZS4gU28gd2UgZGVjaWRlZCB0byBub3QgcmVx
dWlyZSBJT01NVSBmb3IgRG9tMC4gSW5zdGVhZCwgaXRzIG1lbW9yeSBpcyBiZSAKZGlyZWN0bHkg
bWFwcGVkIChpLmUgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyA9PSBob3N0IHBoeXNpY2FsIGFkZHJl
c3MpIGFuZCB3aWxsIAphbHdheXMgYmUgYmVsb3cgNEdCIHRvIGNhdGVyIHRoZSBzaG9ydCBwYWdl
IHRhYmxlIGNhc2UuCgpJbiB0aGUgY29tbW9uIGNhc2UsIERvbTAgYWxzbyBjb250YWlucyB0aGUg
UFYgYmFja2VuZCBkcml2ZXJzLiBUaG9zZSBkcml2ZXJzIG1heSAKZGlyZWN0bHkgdXNlIHRoZSBn
dWVzdCBidWZmZXIgaW4gdGhlIERNQSByZXF1ZXN0IChzbyBhIGNvcHkgaXMgYXZvaWRlZCkuIFRv
IAphdm9pZCB1c2luZyBhIGJvdW5jZSBidWZmZXIgdG9vIG11Y2gsIHhlbi1zd2lvdGxiIHdpbGwg
ZmluZCB0aGUgaG9zdCBwaHlzaWNhbCAKYWRkcmVzcyBhc3NvY2lhdGVkIHRvIHRoZSBndWVzdCBi
dWZmZXIgYW5kIHdpbGwgdXNlIGl0IHRvIGNvbXB1dGUgdGhlIERNQSBhZGRyZXNzLgoKV2hpbGUg
RG9tMCBrZXJuZWwgbWF5IG9ubHkgZGVhbCB3aXRoIDMyLWJpdCBwaHlzaWNhbCBhZGRyZXNzLCB0
aGUgaHlwZXJ2aXNvciBjYW4gCnN0aWxsIGRlYWwgd2l0aCB1cCB0byA0MC1iaXQgcGh5c2ljYWwg
YWRkcmVzcy4gVGhpcyBtZWFucyB0aGUgZ3Vlc3QgbWVtb3J5IGNhbiAKYmUgYWxsb2NhdGVkIGFi
b3ZlIHRoZSA0R0IgdGhyZXNob2xkLiBIZW5jZSB3aHkgdGhlIGRtYV9hZGRyX3QgaXMgYWx3YXlz
IDY0LWJpdCAKd2l0aCBDT05GSUdfWEVOPXkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
