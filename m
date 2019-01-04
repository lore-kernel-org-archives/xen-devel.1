From: Huaisheng HS1 Ye <yehs1@lenovo.com>
Subject: Re: [PATCH] dma-mapping: remove unused attrs parameter
 to dma_common_get_sgtable
Date: Fri, 4 Jan 2019 01:45:26 +0000
Message-ID: <HK2PR03MB44183AC87F67594E93F31E75928E0__40223.8088929609$1546566270$gmane$org@HK2PR03MB4418.apcprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YFW6=PM=lenovo.com=yehs1@srs-us1.protection.inumbo.net>)
 id 1gfEYM-0005h0-E2
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 01:45:38 +0000
Content-Language: zh-CN
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "jgross@suse.com" <jgross@suse.com>, Huaisheng Ye <yehs2007@zoho.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, NingTing Cheng <chengnt@lenovo.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpTZW50OiBG
cmlkYXksIEphbnVhcnkgMDQsIDIwMTkgMTo1NSBBTQo+IE9uIFRodSwgMyBKYW4gMjAxOSwgSHVh
aXNoZW5nIFllIHdyb3RlOgo+ID4gRnJvbTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29t
Pgo+ID4KPiA+IGRtYV9jb21tb25fZ2V0X3NndGFibGUgaGFzIHBhcmFtZXRlciBhdHRycyB3aGlj
aCBpcyBub3QgdXNlZCBhdCBhbGwuCj4gPiBSZW1vdmUgaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogSHVhaXNoZW5nIFllIDx5ZWhzMUBsZW5vdm8uY29tPgo+IAo+IEFja2VkLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gCj4gRllJIHRoZSBwYXRjaCBk
b2Vzbid0IGFwcGx5IGNsZWFubHkgdG8gbWFzdGVyLgoKR290IGl0LCBJIHdpbGwgcmViYXNlIGl0
IHRvIGJyYW5jaCBtYXN0ZXIgYW5kIHJlc2VuZCB0aGUgcGF0Y2ggbGF0ZXIuCgpDaGVlcnMsCkh1
YWlzaGVuZyBZZSAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
