From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
Date: Fri, 31 May 2019 13:38:11 +0200
Message-ID: <2fbfc6a7-572c-1ce2-3323-802f9a77500e__31690.4999943048$1559302755$gmane$org@suse.com>
References: <20190529090407.1225-1-jgross@suse.com>
 <20190529090407.1225-4-jgross@suse.com>
 <20190530090409.GB30428@infradead.org>
 <eebb0275-9418-717f-97d7-5e55917f46fd@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hWfrT-0007mJ-7K
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 11:38:15 +0000
In-Reply-To: <eebb0275-9418-717f-97d7-5e55917f46fd@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Christoph Hellwig <hch@infradead.org>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDUvMjAxOSAxNDo0NiwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDUvMzAvMTkg
NTowNCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+IFBsZWFzZSBkb24ndCBhZGQgeW91
ciBwcml2YXRlIGZsYWcgdG8gcGFnZS1mbGFncy5oLiAgVGhlIHdob2xlIHBvaW50IG9mCj4+IHRo
ZSBwcml2YXRlIGZsYWcgaXMgdGhhdCB5b3UgY2FuIHVzZSBpdCBpbiBhbnkgd2F5IHlvdSB3YW50
IHdpdGhvdQo+PiB0b3VjaGluZyB0aGUgY29tbW9uIGNvZGUuCj4gCj4gCj4gVGhlcmUgaXMgYWxy
ZWFkeSBhIGJ1bmNoIG9mIGFsaWFzZXMgZm9yIHZhcmlvdXMgc3ViLWNvbXBvbmVudHMKPiAoaW5j
bHVkaW5nIFhlbikgaW4gcGFnZS1mbGFncy5oIGZvciBwcml2YXRlIGZsYWdzLCB3aGljaCBpcyB3
aHkgSQo+IHN1Z2dlc3RlZCB3ZSBkbyB0aGUgc2FtZSBmb3IgdGhlIG5ldyB1c2UgY2FzZS4gQWRk
aW5nIHRoaXMgbmV3IGFsaWFzCj4gd2lsbCBrZWVwIGZsYWcgdXNhZ2UgY29uc2lzdGVudC4KCldo
YXQgYWJvdXQgbWUgYWRkaW5nIGFub3RoZXIgcGF0Y2ggbW92aW5nIHRob3NlIFhlbiBwcml2YXRl
IGFsaWFzZXMKaW50byBhcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcGFnZS5oID8KCgpKdWVyZ2Vu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
