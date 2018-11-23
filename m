From: Joerg Roedel <joro@8bytes.org>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Fri, 23 Nov 2018 14:03:13 +0100
Message-ID: <20181123130313.GI1586__48343.7060764574$1542978117$gmane$org@8bytes.org>
References: <20181122140320.24080-1-hch@lst.de>
 <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
 <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
 <20181123104918.GE1586@8bytes.org>
 <20181123110155.GR30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dRFs=OC=8bytes.org=joro@srs-us1.protection.inumbo.net>)
 id 1gQB76-0006D9-0e
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 13:03:16 +0000
Content-Disposition: inline
In-Reply-To: <20181123110155.GR30658@n2100.armlinux.org.uk>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, jdmason@kudzu.us, the arch/x86 maintainers <x86@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, David Woodhouse <dwmw2@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMTE6MDE6NTVBTSArMDAwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IHdyb3RlOgo+IFl1Y2suICBTbywgaWYgd2UgaGF2ZSBhIDRHQiBub24tUEFFIDMy
LWJpdCBzeXN0ZW0sIG9yIGEgUEFFIHN5c3RlbQo+IHdoZXJlIHdlIGhhdmUgdmFsaWQgbWVtb3J5
IGFjcm9zcyB0aGUgNEdCIGJvdW5kYXJ5IGFuZCBubyBJT01NVSwKPiB3ZSBoYXZlIHRvIHJlc2Vy
dmUgdGhlIHRvcCA0SyBwYWdlIGluIHRoZSBmaXJzdCA0R0Igb2YgUkFNPwoKQnV0IHRoYXQgaXMg
b25seSBuZWVkZWQgd2hlbiBkbWFfYWRkcl90IGlzIDMyYml0IGFueXdheSwgbm8/Cgo+IFJhdGhl
ciB0aGFuIGludmVudGluZyBtYWdpYyBjb29raWVzIGxpa2UgdGhpcywgSSdkIG11Y2ggcmF0aGVy
IHdlCj4gc2FuaXRpc2VkIHRoZSBBUEkgc28gdGhhdCB3ZSBoYXZlIGZ1bmN0aW9ucyB0aGF0IHJl
dHVybiBzdWNjZXNzIG9yCj4gYW4gZXJyb3IgY29kZSwgcmF0aGVyIHRoYW4gdHJ5aW5nIHRvIHNo
b2UtaG9ybiBzb21lIGtpbmQgb2YgbWFnaWMKPiBlcnJvciBjb2RlcyBpbnRvIGRtYV9hZGRyX3Qg
YW5kIHN1YnRseSBicmVhayBzeXN0ZW1zIGluIHRoZSBwcm9jZXNzLgoKU3VyZSwgYnV0IGlzIGhh
cyB0aGUgb2J2aW91cyBkb3duc2lkZSB0aGF0IHdlIG5lZWQgdG8gdG91Y2ggZXZlcnkgZHJpdmVy
CnRoYXQgdXNlcyB0aGVzZSBmdW5jdGlvbnMsIGFuZCB0aGF0IGFyZSBwcm9iYWJseSBhIGxvdCBv
ZiBkcml2ZXJzLgoKClJlZ2FyZHMsCgoJSm9lcmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
