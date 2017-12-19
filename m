From: Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC PATCH 42/60] hyper_dmabuf: always generate a new
	random keys
Date: Tue, 19 Dec 2017 11:29:58 -0800
Message-ID: <1513711816-2618-42-git-send-email-dongwon.kim@intel.com>
References: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=edeo=dp=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1eRNhE-0005SD-Ff
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 19:37:00 +0000
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

RnJvbTogTWF0ZXVzeiBQb2xyb2xhIDxtYXRldXN6eC5wb3Ryb2xhQGludGVsLmNvbT4KCk5lZWQg
dG8gdXBkYXRlIHJhbmRvbSBrZXlzIHdoZW4gcmV1c2luZyBoeXBlcl9kbWFidWZfaWQKaW4gdGhl
IGxpc3QgdG8gaW5jcmVhc2Ugc2VjdXJpdHkKClNpZ25lZC1vZmYtYnk6IERvbmd3b24gS2ltIDxk
b25nd29uLmtpbUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy94ZW4vaHlwZXJfZG1hYnVmL2h5cGVy
X2RtYWJ1Zl9pZC5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9oeXBlcl9kbWFidWYvaHlw
ZXJfZG1hYnVmX2lkLmMgYi9kcml2ZXJzL3hlbi9oeXBlcl9kbWFidWYvaHlwZXJfZG1hYnVmX2lk
LmMKaW5kZXggZjU5ZGVlMy4uY2NjZGMxOSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vaHlwZXJf
ZG1hYnVmL2h5cGVyX2RtYWJ1Zl9pZC5jCisrKyBiL2RyaXZlcnMveGVuL2h5cGVyX2RtYWJ1Zi9o
eXBlcl9kbWFidWZfaWQuYwpAQCAtMTIwLDEwICsxMjAsMTEgQEAgaHlwZXJfZG1hYnVmX2lkX3Qg
aHlwZXJfZG1hYnVmX2dldF9oaWQodm9pZCkKIAkgKi8KIAlpZiAoaGlkLmlkID09IC0xICYmIGNv
dW50IDwgSFlQRVJfRE1BQlVGX0lEX01BWCkgewogCQloaWQuaWQgPSBIWVBFUl9ETUFCVUZfSURf
Q1JFQVRFKGh5cGVyX2RtYWJ1Zl9wcml2YXRlLmRvbWlkLCBjb3VudCsrKTsKLQkJLyogcmFuZG9t
IGRhdGEgZW1iZWRkZWQgaW4gdGhlIGlkIGZvciBzZWN1cml0eSAqLwotCQlnZXRfcmFuZG9tX2J5
dGVzKCZoaWQucm5nX2tleVswXSwgMTIpOwogCX0KIAorCS8qIHJhbmRvbSBkYXRhIGVtYmVkZGVk
IGluIHRoZSBpZCBmb3Igc2VjdXJpdHkgKi8KKwlnZXRfcmFuZG9tX2J5dGVzKCZoaWQucm5nX2tl
eVswXSwgMTIpOworCiAJcmV0dXJuIGhpZDsKIH0KIAotLSAKMi43LjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
