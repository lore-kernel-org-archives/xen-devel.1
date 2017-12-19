From: Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 55/60] hyper_dmabuf: fixed wrong send_req
	call
Date: Tue, 19 Dec 2017 11:30:11 -0800
Message-ID: <1513711816-2618-55-git-send-email-dongwon.kim__41298.6676944003$1513712258$gmane$org@intel.com>
References: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=edeo=dp=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1eRNjL-0000rY-Ct
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 19:39:11 +0000
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

RnJvbTogTWF0ZXVzeiBQb2xyb2xhIDxtYXRldXN6eC5wb3Ryb2xhQGludGVsLmNvbT4KCldyb25n
IHZtaWQgaXMgdXNlZCBpbiBjYXNlIG9mIHNlbmRpbmcgSFlQRVJfRE1BQlVGX0VYUE9SVF9GRF9G
QUlMRUQKbWVzc2FnZS4gSW5zdGVhZCBvZiB2bWlkLCBoeXBkZXIgZG1hYnVmIGlkIGlzIGJlaW5n
IHVzZWQuCgpTaWduZWQtb2ZmLWJ5OiBNYXRldXN6IFBvbHJvbGEgPG1hdGV1c3p4LnBvdHJvbGFA
aW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBEb25nd29uIEtpbSA8ZG9uZ3dvbi5raW1AaW50ZWwu
Y29tPgotLS0KIGRyaXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9oeXBlcl9kbWFidWZfaW9jdGwuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9oeXBlcl9kbWFidWZfaW9jdGwuYyBi
L2RyaXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9oeXBlcl9kbWFidWZfaW9jdGwuYwppbmRleCBkMTk3
MGM4Li5jYTZlZGYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9oeXBlcl9kbWFidWYvaHlwZXJf
ZG1hYnVmX2lvY3RsLmMKKysrIGIvZHJpdmVycy94ZW4vaHlwZXJfZG1hYnVmL2h5cGVyX2RtYWJ1
Zl9pb2N0bC5jCkBAIC00NzMsNyArNDczLDcgQEAgc3RhdGljIGludCBoeXBlcl9kbWFidWZfZXhw
b3J0X2ZkX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLCB2b2lkICpkYXRhKQogCQkgKi8KIAkJaHlw
ZXJfZG1hYnVmX2NyZWF0ZV9yZXEocmVxLCBIWVBFUl9ETUFCVUZfRVhQT1JUX0ZEX0ZBSUxFRCwK
IAkJCQkJJm9wWzBdKTsKLQkJYmtuZF9vcHMtPnNlbmRfcmVxKG9wWzBdLCByZXEsIGZhbHNlKTsK
KwkJYmtuZF9vcHMtPnNlbmRfcmVxKEhZUEVSX0RNQUJVRl9ET01fSUQoaW1wb3J0ZWQtPmhpZCks
IHJlcSwgZmFsc2UpOwogCQlrZnJlZShyZXEpOwogCQlkZXZfZXJyKGh5X2Rydl9wcml2LT5kZXYs
CiAJCQkiRmFpbGVkIHRvIGNyZWF0ZSBzZ3Qgb3Igbm90aWZ5IGV4cG9ydGVyXG4iKTsKLS0gCjIu
Ny40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
