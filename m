From: Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 38/60] hyper_dmabuf: preventing self
	exporting of dma_buf
Date: Tue, 19 Dec 2017 11:29:54 -0800
Message-ID: <1513711816-2618-38-git-send-email-dongwon.kim__11089.6552484066$1513712486$gmane$org@intel.com>
References: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=edeo=dp=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1eRNn8-0003Pp-3h
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 19:43:06 +0000
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

QWRkaW5nIElEIGNoZWNrIHRvIG1ha2Ugc3VyZSBhIGRtYS1idWYgaXMgZXhwb3J0ZWQgZXh0ZXJu
YWxseQpzaW5jZSBoeXBlcl9kbWFidWYgb25seSBhbGxvd3MgdG8gZXhwb3J0IGEgZG1hYnVmIHRv
IGEgZGlmZmVyZW50ClZNLgoKU2lnbmVkLW9mZi1ieTogRG9uZ3dvbiBLaW0gPGRvbmd3b24ua2lt
QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9oeXBlcl9kbWFidWYvaHlwZXJfZG1hYnVmX2lv
Y3RsLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9oeXBlcl9kbWFidWZfaW9jdGwuYyBiL2Ry
aXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9oeXBlcl9kbWFidWZfaW9jdGwuYwppbmRleCAxMmY3Y2U0
Li5iNzdiMTU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9oeXBlcl9kbWFidWYvaHlwZXJfZG1h
YnVmX2lvY3RsLmMKKysrIGIvZHJpdmVycy94ZW4vaHlwZXJfZG1hYnVmL2h5cGVyX2RtYWJ1Zl9p
b2N0bC5jCkBAIC0xMDMsNiArMTAzLDEyIEBAIHN0YXRpYyBpbnQgaHlwZXJfZG1hYnVmX2V4cG9y
dF9yZW1vdGVfaW9jdGwoc3RydWN0IGZpbGUgKmZpbHAsIHZvaWQgKmRhdGEpCiAKIAlleHBvcnRf
cmVtb3RlX2F0dHIgPSAoc3RydWN0IGlvY3RsX2h5cGVyX2RtYWJ1Zl9leHBvcnRfcmVtb3RlICop
ZGF0YTsKIAorCWlmIChoeXBlcl9kbWFidWZfcHJpdmF0ZS5kb21pZCA9PSBleHBvcnRfcmVtb3Rl
X2F0dHItPnJlbW90ZV9kb21haW4pIHsKKwkJZGV2X2VycihoeXBlcl9kbWFidWZfcHJpdmF0ZS5k
ZXZpY2UsCisJCQkiZXhwb3J0aW5nIHRvIHRoZSBzYW1lIFZNIGlzIG5vdCBwZXJtaXR0ZWRcbiIp
OworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKIAlkbWFfYnVmID0gZG1hX2J1Zl9nZXQoZXhwb3J0
X3JlbW90ZV9hdHRyLT5kbWFidWZfZmQpOwogCiAJaWYgKElTX0VSUihkbWFfYnVmKSkgewotLSAK
Mi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
