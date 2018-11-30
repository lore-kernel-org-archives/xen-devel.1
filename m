From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 10/23] arm64: remove the dummy_dma_ops
 mapping_error method
Date: Fri, 30 Nov 2018 14:22:18 +0100
Message-ID: <20181130132231.16512-11-hch__44321.3836326779$1543584152$gmane$org@lst.de>
References: <20181130132231.16512-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=szaw=oj=bombadil.srs.infradead.org=batv+53158995809e2dfba443+5577+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1gSilj-0006AY-Pa
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

SnVzdCByZXR1cm4gRE1BX01BUFBJTkdfRVJST1IgZnJvbSBfX2R1bW15X21hcF9wYWdlIGFuZCBs
ZXQgdGhlIGNvcmUKZG1hLW1hcHBpbmcgY29kZSBoYW5kbGUgdGhlIHJlc3QuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNoL2FybTY0L21tL2Rt
YS1tYXBwaW5nLmMgfCA4ICstLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9kbWEtbWFwcGluZy5j
IGIvYXJjaC9hcm02NC9tbS9kbWEtbWFwcGluZy5jCmluZGV4IGEzYWMyNjI4NDg0NS4uZmRjMjZl
YTUwMzZjIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L21tL2RtYS1tYXBwaW5nLmMKKysrIGIvYXJj
aC9hcm02NC9tbS9kbWEtbWFwcGluZy5jCkBAIC0yODIsNyArMjgyLDcgQEAgc3RhdGljIGRtYV9h
ZGRyX3QgX19kdW1teV9tYXBfcGFnZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwYWdlICpw
YWdlLAogCQkJCSAgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpciwKIAkJCQkgICB1bnNpZ25l
ZCBsb25nIGF0dHJzKQogewotCXJldHVybiAwOworCXJldHVybiBETUFfTUFQUElOR19FUlJPUjsK
IH0KIAogc3RhdGljIHZvaWQgX19kdW1teV91bm1hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmRldiwg
ZG1hX2FkZHJfdCBkZXZfYWRkciwKQEAgLTMxNywxMSArMzE3LDYgQEAgc3RhdGljIHZvaWQgX19k
dW1teV9zeW5jX3NnKHN0cnVjdCBkZXZpY2UgKmRldiwKIHsKIH0KIAotc3RhdGljIGludCBfX2R1
bW15X21hcHBpbmdfZXJyb3Ioc3RydWN0IGRldmljZSAqaHdkZXYsIGRtYV9hZGRyX3QgZG1hX2Fk
ZHIpCi17Ci0JcmV0dXJuIDE7Ci19Ci0KIHN0YXRpYyBpbnQgX19kdW1teV9kbWFfc3VwcG9ydGVk
KHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCB1NjQgbWFzaykKIHsKIAlyZXR1cm4gMDsKQEAgLTMzOSw3
ICszMzQsNiBAQCBjb25zdCBzdHJ1Y3QgZG1hX21hcF9vcHMgZHVtbXlfZG1hX29wcyA9IHsKIAku
c3luY19zaW5nbGVfZm9yX2RldmljZSA9IF9fZHVtbXlfc3luY19zaW5nbGUsCiAJLnN5bmNfc2df
Zm9yX2NwdSAgICAgICAgPSBfX2R1bW15X3N5bmNfc2csCiAJLnN5bmNfc2dfZm9yX2RldmljZSAg
ICAgPSBfX2R1bW15X3N5bmNfc2csCi0JLm1hcHBpbmdfZXJyb3IgICAgICAgICAgPSBfX2R1bW15
X21hcHBpbmdfZXJyb3IsCiAJLmRtYV9zdXBwb3J0ZWQgICAgICAgICAgPSBfX2R1bW15X2RtYV9z
dXBwb3J0ZWQsCiB9OwogRVhQT1JUX1NZTUJPTChkdW1teV9kbWFfb3BzKTsKLS0gCjIuMTkuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
