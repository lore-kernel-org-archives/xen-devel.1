From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 23/23] dma-mapping: return an error code from
 dma_mapping_error
Date: Fri, 30 Nov 2018 14:22:31 +0100
Message-ID: <20181130132231.16512-24-hch__32206.9666618065$1543584187$gmane$org@lst.de>
References: <20181130132231.16512-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=szaw=oj=bombadil.srs.infradead.org=batv+53158995809e2dfba443+5577+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1gSimN-0006xE-9x
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 13:24:23 +0000
In-Reply-To: <20181130132231.16512-1-hch@lst.de>
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

Q3VycmVudGx5IGRtYV9tYXBwaW5nX2Vycm9yIHJldHVybnMgYSBib29sZWFuIGFzIGludCwgd2l0
aCAxIG1lYW5pbmcKZXJyb3IuICBUaGlzIGlzIHJhdGhlciB1bnVzdWFsIGFuZCBtYW55IGNhbGxl
cnMgaGF2ZSB0byBjb252ZXJ0IGl0IHRvCmVycm5vIHZhbHVlLiAgVGhlIGNhbGxlcnMgYXJlIGhp
Z2hseSBpbmNvbnNpc3RlbnQgd2l0aCBlcnJvciBjb2RlcwpyYW5naW5nIGZyb20gLUVOT01FTSBv
dmVyIC1FSU8sIC1FSU5WQUwgYW5kIC1FRkFVTFQgcmFuZ2luZyB0byAtRUFHQUlOLgpSZXR1cm4g
LUVOT01FTSB3aGljaCBzZWVtcyB0byBiZSB3aGF0IHRoZSBsYXJnZXN0IG51bWJlciBvZiBjYWxs
ZXJzCmNvbnZlcnQgaXQgdG8sIGFuZCB3aGljaCBhbHNvIG1hdGNoZXMgdGhlIHR5cGljYWwgZXJy
b3IgY2FzZSB3aGVyZQp3ZSBhcmUgb3V0IG9mIHJlc291cmNlcy4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGluY2x1ZGUvbGludXgvZG1hLW1hcHBp
bmcuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLW1hcHBpbmcuaCBiL2luY2x1ZGUvbGlu
dXgvZG1hLW1hcHBpbmcuaAppbmRleCAyYWRlZjU2YzYwNjkuLmI1YmQyNWZjMWY4MSAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9saW51eC9kbWEtbWFwcGluZy5oCisrKyBiL2luY2x1ZGUvbGludXgvZG1h
LW1hcHBpbmcuaApAQCAtNTc2LDcgKzU3Niw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGRtYV9tYXBw
aW5nX2Vycm9yKHN0cnVjdCBkZXZpY2UgKmRldiwgZG1hX2FkZHJfdCBkbWFfYWRkcikKIHsKIAlk
ZWJ1Z19kbWFfbWFwcGluZ19lcnJvcihkZXYsIGRtYV9hZGRyKTsKIAlpZiAoZG1hX2FkZHIgPT0g
RE1BX01BUFBJTkdfRVJST1IpCi0JCXJldHVybiAxOworCQlyZXR1cm4gLUVOT01FTTsKIAlyZXR1
cm4gMDsKIH0KIAotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
