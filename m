From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 6/6] xen/arm: introduce NO_PLAT
Date: Thu, 23 Aug 2018 16:33:40 -0700
Message-ID: <1535067220-16825-6-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1808231631270.14449@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q4af=lg=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fsz6o-0002ka-Bv
 for xen-devel@lists.xenproject.org; Thu, 23 Aug 2018 23:33:46 +0000
In-Reply-To: <alpine.DEB.2.10.1808231631270.14449@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org, andrii_anisov@epam.com, julien.grall@linaro.org
List-Id: xen-devel@lists.xenproject.org

QWRkIGEgS2NvbmZpZyBvcHRpb24gdG8gc2VsZWN0IG5vIHNwZWNpZmljIHBsYXRmb3JtIHN1cHBv
cnQuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5j
b20+Ci0tLQogeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnIHwgNSArKysrKwogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wbGF0
Zm9ybXMvS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZwppbmRleCA2NDg2
YmY2Li40YzhiMjI1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcK
KysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnCkBAIC02Nyw2ICs2NywxMSBAQCBj
b25maWcgT01BUDUKIAktLS1oZWxwLS0tCiAJRW5hYmxlIGFsbCB0aGUgcmVxdWlyZWQgZHJpdmVy
cyBmb3IgVEkgT01BUDUgYmFzZWQgcGxhdGZvcm1zLgogCitjb25maWcgTk9fUExBVAorCWJvb2wg
Ik5vIFBsYXRmb3JtcyIKKwktLS1oZWxwLS0tCisJRG8gbm90IGVuYWJsZSBzcGVjaWZpYyBzdXBw
b3J0IGZvciBhbnkgcGxhdGZvcm0uCisKIGVuZGNob2ljZQogCiBjb25maWcgQUxMNjRfUExBVAot
LSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
