From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 02/24] swiotlb: Skip cache maintenance on map
 error
Date: Thu, 22 Nov 2018 15:02:58 +0100
Message-ID: <20181122140320.24080-3-hch__15604.4111856774$1542895360$gmane$org@lst.de>
References: <20181122140320.24080-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3fjx=ob=bombadil.srs.infradead.org=batv+e7131bbb1f87c094fb8b+5569+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1gPpa3-0002HR-6g
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 14:03:43 +0000
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

RnJvbTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KCklmIHN3aW90bGJfYm91
bmNlX3BhZ2UoKSBmYWlsZWQsIGNhbGxpbmcgYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKCkgbWF5
CmxlYWQgdG8gc3VjaCBkZWxpZ2h0cyBhcyBwZXJmb3JtaW5nIGNhY2hlIG1haW50ZW5hbmNlIG9u
IHdoYXRldmVyCmFkZHJlc3MgcGh5c190b192aXJ0KFNXSU9UTEJfTUFQX0VSUk9SKSBsb29rcyBs
aWtlLCB3aGljaCBpcyB0eXBpY2FsbHkKb3V0c2lkZSB0aGUga2VybmVsIG1lbW9yeSBtYXAgYW5k
IGdvZXMgYWJvdXQgYXMgd2VsbCBhcyBleHBlY3RlZC4KCkRvbid0IGRvIHRoYXQuCgpGaXhlczog
YTRhNDMzMGRiNDZhICgic3dpb3RsYjogYWRkIHN1cHBvcnQgZm9yIG5vbi1jb2hlcmVudCBETUEi
KQpUZXN0ZWQtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgpTaWduZWQt
b2ZmLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBrZXJuZWwvZG1hL3N3aW90bGIu
YyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEva2VybmVsL2RtYS9zd2lvdGxiLmMgYi9rZXJuZWwvZG1hL3N3aW90bGIu
YwppbmRleCA1NzMxZGFhMDlhMzIuLjA0NTkzMGUzMmMwZSAxMDA2NDQKLS0tIGEva2VybmVsL2Rt
YS9zd2lvdGxiLmMKKysrIGIva2VybmVsL2RtYS9zd2lvdGxiLmMKQEAgLTY3OSw3ICs2NzksOCBA
QCBkbWFfYWRkcl90IHN3aW90bGJfbWFwX3BhZ2Uoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qg
cGFnZSAqcGFnZSwKIAl9CiAKIAlpZiAoIWRldl9pc19kbWFfY29oZXJlbnQoZGV2KSAmJgotCSAg
ICAoYXR0cnMgJiBETUFfQVRUUl9TS0lQX0NQVV9TWU5DKSA9PSAwKQorCSAgICAoYXR0cnMgJiBE
TUFfQVRUUl9TS0lQX0NQVV9TWU5DKSA9PSAwICYmCisJICAgIGRldl9hZGRyICE9IERJUkVDVF9N
QVBQSU5HX0VSUk9SKQogCQlhcmNoX3N5bmNfZG1hX2Zvcl9kZXZpY2UoZGV2LCBwaHlzLCBzaXpl
LCBkaXIpOwogCiAJcmV0dXJuIGRldl9hZGRyOwotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
