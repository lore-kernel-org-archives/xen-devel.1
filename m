From: Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 19/60] hyper_dmabuf: fix the case with
	sharing a buffer with 2 pages
Date: Tue, 19 Dec 2017 11:29:35 -0800
Message-ID: <1513711816-2618-19-git-send-email-dongwon.kim@intel.com>
References: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=edeo=dp=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1eRNgu-0004oo-NA
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 19:36:40 +0000
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

RnJvbTogTWF0ZXVzeiBQb2xyb2xhIDxtYXRldXN6eC5wb3Ryb2xhQGludGVsLmNvbT4KCkNoZWNr
aW5nIHdoZXRoZXIgYnVmZmVyIGhhcyBtb3JlIHRoYW4gdHdvIHBhZ2VzIHNob3VsZCBiZSBkb25l
CmJ5IGV2YWx1YXRpbmcgbmVudHMgPiAxIGluc3RlYWQgb2YgaSA+IDEgdG8gcHJvcGVybHkgY292
ZXIgdGhlCmNhc2Ugd2hlbiBuZW50cyA9PSAyLgoKU2lnbmVkLW9mZi1ieTogRG9uZ3dvbiBLaW0g
PGRvbmd3b24ua2ltQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9oeXBlcl9kbWFidWYvaHlw
ZXJfZG1hYnVmX2ltcC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vaHlwZXJfZG1hYnVmL2h5cGVy
X2RtYWJ1Zl9pbXAuYyBiL2RyaXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9oeXBlcl9kbWFidWZfaW1w
LmMKaW5kZXggYjYxZDI5YS4uOWIwNTA2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vaHlwZXJf
ZG1hYnVmL2h5cGVyX2RtYWJ1Zl9pbXAuYworKysgYi9kcml2ZXJzL3hlbi9oeXBlcl9kbWFidWYv
aHlwZXJfZG1hYnVmX2ltcC5jCkBAIC0xMjksNyArMTI5LDcgQEAgc3RydWN0IHNnX3RhYmxlKiBo
eXBlcl9kbWFidWZfY3JlYXRlX3NndChzdHJ1Y3QgcGFnZSAqKnBhZ2VzLAogCQlzZ19zZXRfcGFn
ZShzZ2wsIHBhZ2VzW2ldLCBQQUdFX1NJWkUsIDApOwogCX0KIAotCWlmIChpID4gMSkgLyogbW9y
ZSB0aGFuIG9uZSBwYWdlICovIHsKKwlpZiAobmVudHMgPiAxKSAvKiBtb3JlIHRoYW4gb25lIHBh
Z2UgKi8gewogCQlzZ2wgPSBzZ19uZXh0KHNnbCk7CiAJCXNnX3NldF9wYWdlKHNnbCwgcGFnZXNb
aV0sIGxhc3RfbGVuLCAwKTsKIAl9Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
