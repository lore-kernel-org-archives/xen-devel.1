From: Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 33/60] hyper_dmabuf: error checking on the
	result of dma_buf_map_attachment
Date: Tue, 19 Dec 2017 11:29:49 -0800
Message-ID: <1513711816-2618-33-git-send-email-dongwon.kim@intel.com>
References: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=edeo=dp=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1eRNh5-000590-8b
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 19:36:51 +0000
In-Reply-To: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, mateuszx.potrola@intel.com, dri-devel@lists.freedesktop.org, dongwon.kim@intel.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTWF0ZXVzeiBQb2xyb2xhIDxtYXRldXN6eC5wb3Ryb2xhQGludGVsLmNvbT4KCkFkZGVk
IGVycm9yIGNoZWNraW5nIG9uIHRoZSByZXN1bHQgb2YgZnVuY3Rpb24gY2FsbCwKZG1hX2J1Zl9t
YXBfYXR0YWNobWVudAoKU2lnbmVkLW9mZi1ieTogRG9uZ3dvbiBLaW0gPGRvbmd3b24ua2ltQGlu
dGVsLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9oeXBlcl9kbWFidWYvaHlwZXJfZG1hYnVmX2lvY3Rs
LmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy94ZW4vaHlwZXJfZG1hYnVmL2h5cGVyX2RtYWJ1Zl9pb2N0bC5jIGIvZHJpdmVy
cy94ZW4vaHlwZXJfZG1hYnVmL2h5cGVyX2RtYWJ1Zl9pb2N0bC5jCmluZGV4IGMwMDQ4ZDkuLjQ3
NmMwZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9oeXBlcl9kbWFidWZf
aW9jdGwuYworKysgYi9kcml2ZXJzL3hlbi9oeXBlcl9kbWFidWYvaHlwZXJfZG1hYnVmX2lvY3Rs
LmMKQEAgLTE0OSw2ICsxNDksMTEgQEAgc3RhdGljIGludCBoeXBlcl9kbWFidWZfZXhwb3J0X3Jl
bW90ZShzdHJ1Y3QgZmlsZSAqZmlscCwgdm9pZCAqZGF0YSkKIAogCXNndCA9IGRtYV9idWZfbWFw
X2F0dGFjaG1lbnQoYXR0YWNobWVudCwgRE1BX0JJRElSRUNUSU9OQUwpOwogCisJaWYgKElTX0VS
UihzZ3QpKSB7CisJCWRldl9lcnIoaHlwZXJfZG1hYnVmX3ByaXZhdGUuZGV2aWNlLCAiQ2Fubm90
IG1hcCBhdHRhY2htZW50XG4iKTsKKwkJcmV0dXJuIFBUUl9FUlIoc2d0KTsKKwl9CisKIAlzZ3Rf
aW5mbyA9IGtjYWxsb2MoMSwgc2l6ZW9mKCpzZ3RfaW5mbyksIEdGUF9LRVJORUwpOwogCiAJaWYo
IXNndF9pbmZvKSB7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
