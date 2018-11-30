From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 14/23] ia64/sn: remove the mapping_error
 dma_map_ops method
Date: Fri, 30 Nov 2018 14:22:22 +0100
Message-ID: <20181130132231.16512-15-hch__28499.393844004$1543584152$gmane$org@lst.de>
References: <20181130132231.16512-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=szaw=oj=bombadil.srs.infradead.org=batv+53158995809e2dfba443+5577+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1gSilq-0006H2-P6
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 13:23:50 +0000
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

UmV0dXJuIERNQV9NQVBQSU5HX0VSUk9SIGluc3RlYWQgb2YgMCBvbiBhIGRtYSBtYXBwaW5nIGZh
aWx1cmUgYW5kIGxldAp0aGUgY29yZSBkbWEtbWFwcGluZyBjb2RlIGhhbmRsZSB0aGUgcmVzdC4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gv
aWE2NC9zbi9wY2kvcGNpX2RtYS5jIHwgOCArLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvaWE2NC9zbi9wY2kv
cGNpX2RtYS5jIGIvYXJjaC9pYTY0L3NuL3BjaS9wY2lfZG1hLmMKaW5kZXggNGNlNGVlNGVmOWYy
Li5iN2Q0MmU0ZWRjMWYgMTAwNjQ0Ci0tLSBhL2FyY2gvaWE2NC9zbi9wY2kvcGNpX2RtYS5jCisr
KyBiL2FyY2gvaWE2NC9zbi9wY2kvcGNpX2RtYS5jCkBAIC0xOTYsNyArMTk2LDcgQEAgc3RhdGlj
IGRtYV9hZGRyX3Qgc25fZG1hX21hcF9wYWdlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBh
Z2UgKnBhZ2UsCiAKIAlpZiAoIWRtYV9hZGRyKSB7CiAJCXByaW50ayhLRVJOX0VSUiAiJXM6IG91
dCBvZiBBVEVzXG4iLCBfX2Z1bmNfXyk7Ci0JCXJldHVybiAwOworCQlyZXR1cm4gRE1BX01BUFBJ
TkdfRVJST1I7CiAJfQogCXJldHVybiBkbWFfYWRkcjsKIH0KQEAgLTMxNCwxMSArMzE0LDYgQEAg
c3RhdGljIGludCBzbl9kbWFfbWFwX3NnKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNjYXR0
ZXJsaXN0ICpzZ2wsCiAJcmV0dXJuIG5od2VudHJpZXM7CiB9CiAKLXN0YXRpYyBpbnQgc25fZG1h
X21hcHBpbmdfZXJyb3Ioc3RydWN0IGRldmljZSAqZGV2LCBkbWFfYWRkcl90IGRtYV9hZGRyKQot
ewotCXJldHVybiAwOwotfQotCiBzdGF0aWMgdTY0IHNuX2RtYV9nZXRfcmVxdWlyZWRfbWFzayhz
dHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJcmV0dXJuIERNQV9CSVRfTUFTSyg2NCk7CkBAIC00NDEs
NyArNDM2LDYgQEAgc3RhdGljIHN0cnVjdCBkbWFfbWFwX29wcyBzbl9kbWFfb3BzID0gewogCS51
bm1hcF9wYWdlCQk9IHNuX2RtYV91bm1hcF9wYWdlLAogCS5tYXBfc2cJCQk9IHNuX2RtYV9tYXBf
c2csCiAJLnVubWFwX3NnCQk9IHNuX2RtYV91bm1hcF9zZywKLQkubWFwcGluZ19lcnJvcgkJPSBz
bl9kbWFfbWFwcGluZ19lcnJvciwKIAkuZG1hX3N1cHBvcnRlZAkJPSBzbl9kbWFfc3VwcG9ydGVk
LAogCS5nZXRfcmVxdWlyZWRfbWFzawk9IHNuX2RtYV9nZXRfcmVxdWlyZWRfbWFzaywKIH07Ci0t
IAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
