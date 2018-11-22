From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 15/24] ia64/sba_iommu: remove the mapping_error
 dma_map_ops method
Date: Thu, 22 Nov 2018 15:03:11 +0100
Message-ID: <20181122140320.24080-16-hch__36049.3673863404$1542895353$gmane$org@lst.de>
References: <20181122140320.24080-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3fjx=ob=bombadil.srs.infradead.org=batv+e7131bbb1f87c094fb8b+5569+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1gPpaf-0002n6-VH
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 14:04:21 +0000
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

UmV0dXJuIERNQV9NQVBQSU5HX0VSUk9SIGluc3RlYWQgb2YgMCBvbiBhIGRtYSBtYXBwaW5nIGZh
aWx1cmUgYW5kIGxldAp0aGUgY29yZSBkbWEtbWFwcGluZyBjb2RlIGhhbmRsZSB0aGUgcmVzdC4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gv
aWE2NC9ocC9jb21tb24vc2JhX2lvbW11LmMgfCA4ICstLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9pYTY0L2hw
L2NvbW1vbi9zYmFfaW9tbXUuYyBiL2FyY2gvaWE2NC9ocC9jb21tb24vc2JhX2lvbW11LmMKaW5k
ZXggYjk1MzI4MmQ0NzA0Li4wMzE2YWYyY2I0MjYgMTAwNjQ0Ci0tLSBhL2FyY2gvaWE2NC9ocC9j
b21tb24vc2JhX2lvbW11LmMKKysrIGIvYXJjaC9pYTY0L2hwL2NvbW1vbi9zYmFfaW9tbXUuYwpA
QCAtOTc0LDcgKzk3NCw3IEBAIHN0YXRpYyBkbWFfYWRkcl90IHNiYV9tYXBfcGFnZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBwYWdlICpwYWdlLAogCiAJcGlkZSA9IHNiYV9hbGxvY19yYW5n
ZShpb2MsIGRldiwgc2l6ZSk7CiAJaWYgKHBpZGUgPCAwKQotCQlyZXR1cm4gMDsKKwkJcmV0dXJu
IERNQV9NQVBQSU5HX0VSUk9SOwogCiAJaW92cCA9IChkbWFfYWRkcl90KSBwaWRlIDw8IGlvdnBf
c2hpZnQ7CiAKQEAgLTIxNTEsMTEgKzIxNTEsNiBAQCBzdGF0aWMgaW50IHNiYV9kbWFfc3VwcG9y
dGVkIChzdHJ1Y3QgZGV2aWNlICpkZXYsIHU2NCBtYXNrKQogCXJldHVybiAoKG1hc2sgJiAweEZG
RkZGRkZGVUwpID09IDB4RkZGRkZGRkZVTCk7CiB9CiAKLXN0YXRpYyBpbnQgc2JhX2RtYV9tYXBw
aW5nX2Vycm9yKHN0cnVjdCBkZXZpY2UgKmRldiwgZG1hX2FkZHJfdCBkbWFfYWRkcikKLXsKLQly
ZXR1cm4gMDsKLX0KLQogX19zZXR1cCgibm9zYmFnYXJ0Iiwgbm9zYmFnYXJ0KTsKIAogc3RhdGlj
IGludCBfX2luaXQKQEAgLTIxODksNyArMjE4NCw2IEBAIGNvbnN0IHN0cnVjdCBkbWFfbWFwX29w
cyBzYmFfZG1hX29wcyA9IHsKIAkubWFwX3NnCQkJPSBzYmFfbWFwX3NnX2F0dHJzLAogCS51bm1h
cF9zZwkJPSBzYmFfdW5tYXBfc2dfYXR0cnMsCiAJLmRtYV9zdXBwb3J0ZWQJCT0gc2JhX2RtYV9z
dXBwb3J0ZWQsCi0JLm1hcHBpbmdfZXJyb3IJCT0gc2JhX2RtYV9tYXBwaW5nX2Vycm9yLAogfTsK
IAogdm9pZCBzYmFfZG1hX2luaXQodm9pZCkKLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
