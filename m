From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 09/23] parisc/sba_iommu: remove the
 mapping_error dma_map_ops method
Date: Fri, 30 Nov 2018 14:22:17 +0100
Message-ID: <20181130132231.16512-10-hch__24781.9284246818$1543584152$gmane$org@lst.de>
References: <20181130132231.16512-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=szaw=oj=bombadil.srs.infradead.org=batv+53158995809e2dfba443+5577+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1gSilj-0006AZ-Pa
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 13:23:43 +0000
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

VGhlIFNCQSBpb21tdSBjb2RlIGFscmVhZHkgcmV0dXJucyAofihkbWFfYWRkcl90KTB4MCkgb24g
bWFwcGluZwpmYWlsdXJlcywgc28gd2UgY2FuIHN3aXRjaCBvdmVyIHRvIHJldHVybmluZyBETUFf
TUFQUElOR19FUlJPUiBhbmQgbGV0CnRoZSBjb3JlIGRtYS1tYXBwaW5nIGNvZGUgaGFuZGxlIHRo
ZSByZXN0LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0t
LQogZHJpdmVycy9wYXJpc2Mvc2JhX2lvbW11LmMgfCAxMCArLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wYXJpc2Mvc2JhX2lvbW11LmMgYi9kcml2ZXJzL3BhcmlzYy9zYmFfaW9tbXUuYwppbmRleCBj
MWU1OTlhNDI5YWYuLjQ1MmQzMDZjZTVjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wYXJpc2Mvc2Jh
X2lvbW11LmMKKysrIGIvZHJpdmVycy9wYXJpc2Mvc2JhX2lvbW11LmMKQEAgLTkzLDggKzkzLDYg
QEAKIAogI2RlZmluZSBERUZBVUxUX0RNQV9ISU5UX1JFRwkwCiAKLSNkZWZpbmUgU0JBX01BUFBJ
TkdfRVJST1IgICAgKH4oZG1hX2FkZHJfdCkwKQotCiBzdHJ1Y3Qgc2JhX2RldmljZSAqc2JhX2xp
c3Q7CiBFWFBPUlRfU1lNQk9MX0dQTChzYmFfbGlzdCk7CiAKQEAgLTcyNSw3ICs3MjMsNyBAQCBz
YmFfbWFwX3NpbmdsZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmFkZHIsIHNpemVfdCBzaXpl
LAogCiAJaW9jID0gR0VUX0lPQyhkZXYpOwogCWlmICghaW9jKQotCQlyZXR1cm4gU0JBX01BUFBJ
TkdfRVJST1I7CisJCXJldHVybiBETUFfTUFQUElOR19FUlJPUjsKIAogCS8qIHNhdmUgb2Zmc2V0
IGJpdHMgKi8KIAlvZmZzZXQgPSAoKGRtYV9hZGRyX3QpIChsb25nKSBhZGRyKSAmIH5JT1ZQX01B
U0s7CkBAIC0xMDgwLDExICsxMDc4LDYgQEAgc2JhX3VubWFwX3NnKHN0cnVjdCBkZXZpY2UgKmRl
diwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZ2xpc3QsIGludCBuZW50cywKIAogfQogCi1zdGF0aWMg
aW50IHNiYV9tYXBwaW5nX2Vycm9yKHN0cnVjdCBkZXZpY2UgKmRldiwgZG1hX2FkZHJfdCBkbWFf
YWRkcikKLXsKLQlyZXR1cm4gZG1hX2FkZHIgPT0gU0JBX01BUFBJTkdfRVJST1I7Ci19Ci0KIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX21hcF9vcHMgc2JhX29wcyA9IHsKIAkuZG1hX3N1cHBvcnRl
ZCA9CXNiYV9kbWFfc3VwcG9ydGVkLAogCS5hbGxvYyA9CQlzYmFfYWxsb2MsCkBAIC0xMDkzLDcg
KzEwODYsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9tYXBfb3BzIHNiYV9vcHMgPSB7CiAJ
LnVubWFwX3BhZ2UgPQkJc2JhX3VubWFwX3BhZ2UsCiAJLm1hcF9zZyA9CQlzYmFfbWFwX3NnLAog
CS51bm1hcF9zZyA9CQlzYmFfdW5tYXBfc2csCi0JLm1hcHBpbmdfZXJyb3IgPQlzYmFfbWFwcGlu
Z19lcnJvciwKIH07CiAKIAotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
