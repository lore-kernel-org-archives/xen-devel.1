From: "hch@lst.de" <hch@lst.de>
Subject: Re: [PATCH] dma-mapping: remove unused attrs parameter
 to dma_common_get_sgtable
Date: Fri, 4 Jan 2019 08:26:51 +0100
Message-ID: <20190104072651.GA14560__13572.9374982931$1546586761$gmane$org@lst.de>
References: <HK2PR03MB44183AC87F67594E93F31E75928E0@HK2PR03MB4418.apcprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RUgY=PM=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1gfJsd-0007GP-WC
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 07:26:56 +0000
Content-Disposition: inline
In-Reply-To: <HK2PR03MB44183AC87F67594E93F31E75928E0@HK2PR03MB4418.apcprd03.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Huaisheng HS1 Ye <yehs1@lenovo.com>
Cc: "jgross@suse.com" <jgross@suse.com>, Huaisheng Ye <yehs2007@zoho.com>, Stefano Stabellini <sstabellini@kernel.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, NingTing Cheng <chengnt@lenovo.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMDQsIDIwMTkgYXQgMDE6NDU6MjZBTSArMDAwMCwgSHVhaXNoZW5nIEhTMSBZ
ZSB3cm90ZToKPiBGcm9tOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+Cj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDA0LCAyMDE5IDE6NTUgQU0KPiA+IE9uIFRodSwg
MyBKYW4gMjAxOSwgSHVhaXNoZW5nIFllIHdyb3RlOgo+ID4gPiBGcm9tOiBIdWFpc2hlbmcgWWUg
PHllaHMxQGxlbm92by5jb20+Cj4gPiA+Cj4gPiA+IGRtYV9jb21tb25fZ2V0X3NndGFibGUgaGFz
IHBhcmFtZXRlciBhdHRycyB3aGljaCBpcyBub3QgdXNlZCBhdCBhbGwuCj4gPiA+IFJlbW92ZSBp
dC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8u
Y29tPgo+ID4gCj4gPiBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPgo+ID4gCj4gPiBGWUkgdGhlIHBhdGNoIGRvZXNuJ3QgYXBwbHkgY2xlYW5seSB0
byBtYXN0ZXIuCj4gCj4gR290IGl0LCBJIHdpbGwgcmViYXNlIGl0IHRvIGJyYW5jaCBtYXN0ZXIg
YW5kIHJlc2VuZCB0aGUgcGF0Y2ggbGF0ZXIuCgpJIHRoaW5rIHdlIGNhbiBza2lwIGl0LiAgRm9y
IHRoZSBuZXh0IG1lcmdlIHdpbmRvdyBJIHBsYW4gdG8gcmVtb3ZlCnRoZSBmYWxsYmFja3MgZm9y
IGdldF9zZ3RhYmxlIGFuZCBtbWFwIGFuZCBpbnN0ZWFkIHdpcmUgZXZlcnl0aGluZyB1cApleHBs
aWNpdGx5LiAgQW5kIHRvIGJlIGEgcG9zc2libGUgbWV0aG9kIGluc3RhbmNlIGl0IHdpbGwgaGF2
ZSB0byBtYXRjaAp0aGUgcHJvdG90eXBlIGFuZCB0aHVzIGtlZXAgdGhlIHVudXNlZCBhcmd1bWVu
dC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
