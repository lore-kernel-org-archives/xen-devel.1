From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/4] xen/arm: initialize access
Date: Wed, 17 Oct 2018 22:31:14 +0800
Message-ID: <1539786676-8797-2-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1810172229070.3835@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ehpq=m5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gCmru-00057C-JE
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 14:32:14 +0000
In-Reply-To: <alpine.DEB.2.10.1810172229070.3835@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com, sstabellini@kernel.org, Tamas K Lengyel <tamas@tklengyel.com>, rcojocaru@bitdefender.com
List-Id: xen-devel@lists.xenproject.org

SW5pdGlhbGl6ZSB2YXJpYWJsZSAqYWNjZXNzIGJlZm9yZSByZXR1cm5pbmcgaXQgYmFjayB0byB0
aGUgY2FsbGVyLgpJdCBtYWtlcyB0aGUgY29kZSBhIGJpdCBuaWNlciBhbmQgaXQgaXMgYSBzYWZl
dHkgY2VydGlmaWNhdGlvbgpyZXF1aXJlbWVudC4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KQ0M6IHJjb2pvY2FydUBiaXRkZWZlbmRlci5j
b20KQ0M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KLS0tCkNoYW5nZXMg
aW4gdjI6Ci0gaW1wcm92ZSBjb21tZW50Ci0gdXNlIHAybS0+ZGVmYXVsdF9hY2Nlc3MKLS0tCiB4
ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gv
YXJtL21lbV9hY2Nlc3MuYwppbmRleCBiYTRlYzc4Li44NmYwODgyIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC9hcm0vbWVtX2FjY2Vzcy5jCisrKyBiL3hlbi9hcmNoL2FybS9tZW1fYWNjZXNzLmMKQEAg
LTQ3LDYgKzQ3LDcgQEAgc3RhdGljIGludCBfX3AybV9nZXRfbWVtX2FjY2VzcyhzdHJ1Y3QgZG9t
YWluICpkLCBnZm5fdCBnZm4sCiAgICAgfTsKIAogICAgIEFTU0VSVChwMm1faXNfbG9ja2VkKHAy
bSkpOworICAgICphY2Nlc3MgPSBwMm0tPmRlZmF1bHRfYWNjZXNzOwogCiAgICAgLyogSWYgbm8g
c2V0dGluZyB3YXMgZXZlciBzZXQsIGp1c3QgcmV0dXJuIHJ3eC4gKi8KICAgICBpZiAoICFwMm0t
Pm1lbV9hY2Nlc3NfZW5hYmxlZCApCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
