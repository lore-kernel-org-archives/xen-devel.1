From: Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 34/60] hyper_dmabuf: extend DMA bitmask to
	64-bits.
Date: Tue, 19 Dec 2017 11:29:50 -0800
Message-ID: <1513711816-2618-34-git-send-email-dongwon.kim@intel.com>
References: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=edeo=dp=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1eRNhB-0005DK-Ns
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 19:36:57 +0000
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

RnJvbTogTWF0ZXVzeiBQb2xyb2xhIDxtYXRldXN6eC5wb3Ryb2xhQGludGVsLmNvbT4KCkV4dGVu
ZGluZyBETUEgYml0bWFzayBvZiBoeXBlcl9kbWFidWYgZGV2aWNlIHRvIGNvdmVyIHdob2xlCmFk
ZHJlc3Mgc3BhY2UgZHJpdmVyIG1heSBhY2Nlc3MuCgpTaWduZWQtb2ZmLWJ5OiBEb25nd29uIEtp
bSA8ZG9uZ3dvbi5raW1AaW50ZWwuY29tPgotLS0KIGRyaXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9o
eXBlcl9kbWFidWZfaW9jdGwuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9o
eXBlcl9kbWFidWZfaW9jdGwuYyBiL2RyaXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9oeXBlcl9kbWFi
dWZfaW9jdGwuYwppbmRleCA0NzZjMGQ3Li5mN2Q5OGMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hl
bi9oeXBlcl9kbWFidWYvaHlwZXJfZG1hYnVmX2lvY3RsLmMKKysrIGIvZHJpdmVycy94ZW4vaHlw
ZXJfZG1hYnVmL2h5cGVyX2RtYWJ1Zl9pb2N0bC5jCkBAIC03MjMsNyArNzIzLDcgQEAgaW50IHJl
Z2lzdGVyX2RldmljZSh2b2lkKQogCWh5cGVyX2RtYWJ1Zl9wcml2YXRlLmRldmljZSA9IGh5cGVy
X2RtYWJ1Zl9taXNjZGV2LnRoaXNfZGV2aWNlOwogCiAJLyogVE9ETzogQ2hlY2sgaWYgdGhlcmUg
aXMgYSBkaWZmZXJlbnQgd2F5IHRvIGluaXRpYWxpemUgZG1hIG1hc2sgbmljZWx5ICovCi0JZG1h
X2NvZXJjZV9tYXNrX2FuZF9jb2hlcmVudChoeXBlcl9kbWFidWZfcHJpdmF0ZS5kZXZpY2UsIDB4
RkZGRkZGRkYpOworCWRtYV9jb2VyY2VfbWFza19hbmRfY29oZXJlbnQoaHlwZXJfZG1hYnVmX3By
aXZhdGUuZGV2aWNlLCBETUFfQklUX01BU0soNjQpKTsKIAogCXJldHVybiByZXQ7CiB9Ci0tIAoy
LjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
