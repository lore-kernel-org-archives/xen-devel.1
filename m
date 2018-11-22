From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 01/24] dma-direct: Make DIRECT_MAPPING_ERROR
 viable for SWIOTLB
Date: Thu, 22 Nov 2018 15:02:57 +0100
Message-ID: <20181122140320.24080-2-hch__29166.0759402022$1542895362$gmane$org@lst.de>
References: <20181122140320.24080-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3fjx=ob=bombadil.srs.infradead.org=batv+e7131bbb1f87c094fb8b+5569+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1gPpZy-0002Gu-W0
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 14:03:39 +0000
In-Reply-To: <20181122140320.24080-1-hch@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: iommu@lists.linux-foundation.org
Cc: linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, Jon Mason <jdmason@kudzu.us>, xen-devel@lists.xenproject.org, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KCldpdGggdGhlIG92ZXJm
bG93IGJ1ZmZlciByZW1vdmVkLCB3ZSBubyBsb25nZXIgaGF2ZSBhIHVuaXF1ZSBhZGRyZXNzCndo
aWNoIGlzIGd1YXJhbnRlZWQgbm90IHRvIGJlIGEgdmFsaWQgRE1BIHRhcmdldCB0byB1c2UgYXMg
YW4gZXJyb3IKdG9rZW4uIFRoZSBESVJFQ1RfTUFQUElOR19FUlJPUiB2YWx1ZSBvZiAwIHRyaWVz
IHRvIGF0IGxlYXN0IHJlcHJlc2VudAphbiB1bmxpa2VseSBETUEgdGFyZ2V0LCBidXQgdW5mb3J0
dW5hdGVseSB0aGVyZSBhcmUgYWxyZWFkeSBTV0lPVExCCnVzZXJzIHdpdGggRE1BLWFibGUgbWVt
b3J5IGF0IHBoeXNpY2FsIGFkZHJlc3MgMCB3aGljaCBub3cgZ2V0cyBmYWxzZWx5CnRyZWF0ZWQg
YXMgYSBtYXBwaW5nIGZhaWx1cmUgYW5kIGxlYWRzIHRvIGFsbCBtYW5uZXIgb2YgbWlzYmVoYXZp
b3VyLgoKVGhlIGJlc3Qgd2UgY2FuIGRvIHRvIG1pdGlnYXRlIHRoYXQgaXMgZmxpcCBESVJFQ1Rf
TUFQUElOR19FUlJPUiB0byB0aGUKb3RoZXIgY29tbW9ubHktdXNlZCBlcnJvciB2YWx1ZSBvZiBh
bGwtYml0cy1zZXQsIHNpbmNlIHRoZSBsYXN0IHNpbmdsZQpieXRlIG9mIG1lbW9yeSBpcyBieSBm
YXIgdGhlIGxlYXN0LWxpa2VseS12YWxpZCBETUEgdGFyZ2V0LgoKRml4ZXM6IGRmZjhkNmMxZWQ1
OCAoInN3aW90bGI6IHJlbW92ZSB0aGUgb3ZlcmZsb3cgYnVmZmVyIikKUmVwb3J0ZWQtYnk6IEpv
aG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgpUZXN0ZWQtYnk6IEpvaG4gU3R1bHR6
IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgpBY2tlZC1ieTogS29ucmFkIFJ6ZXN6dXRlayBXaWxr
IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2JpbiBNdXJwaHkgPHJv
YmluLm11cnBoeUBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4KLS0tCiBpbmNsdWRlL2xpbnV4L2RtYS1kaXJlY3QuaCB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvZG1hLWRpcmVjdC5oIGIvaW5jbHVkZS9saW51eC9kbWEtZGlyZWN0LmgKaW5kZXgg
YmQ3M2U3YTkxNDEwLi45ZTY2YmZlMzY5YWEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZG1h
LWRpcmVjdC5oCisrKyBiL2luY2x1ZGUvbGludXgvZG1hLWRpcmVjdC5oCkBAIC01LDcgKzUsNyBA
QAogI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+CiAjaW5jbHVkZSA8bGludXgvbWVtX2Vu
Y3J5cHQuaD4KIAotI2RlZmluZSBESVJFQ1RfTUFQUElOR19FUlJPUgkJMAorI2RlZmluZSBESVJF
Q1RfTUFQUElOR19FUlJPUgkJKH4oZG1hX2FkZHJfdCkwKQogCiAjaWZkZWYgQ09ORklHX0FSQ0hf
SEFTX1BIWVNfVE9fRE1BCiAjaW5jbHVkZSA8YXNtL2RtYS1kaXJlY3QuaD4KLS0gCjIuMTkuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
