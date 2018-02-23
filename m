From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v4 17/19] xen/arm: vpsci: Update the return type
	for MIGRATE_INFO_TYPE
Date: Fri, 23 Feb 2018 16:47:51 +0000
Message-ID: <20180223164753.27311-18-julien.grall@arm.com>
References: <20180223164753.27311-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180223164753.27311-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, volodymyr_babchuk@epam.com, mirela.simonovic@aggios.com, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

RnJvbSB0aGUgc3BlY2lmaWNhdGlvbiwgdGhlIFBTQ0kgY2FsbCBNSUdSQVRFX0lORk9fVFlQRSB3
aWxsIHJldHVybiBhbgppbnQzMl90LiBVcGRhdGUgdGhlIGZ1bmN0aW9uIHJldHVybiB0eXBlIHRv
IG1hdGNoIGl0LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KQ2M6IG1pcmVsYS5zaW1vbm92aWNAYWdnaW9zLmNvbQoKLS0tCiAgICBDaGFuZ2VzIGlu
IHY0OgogICAgICAgIC0gQWRkIFN0ZWZhbm8ncyByZXZpZXdlZC1ieQoKICAgIENoYW5nZXMgaW4g
djM6CiAgICAgICAgLSBQYXRjaCBhZGRlZAotLS0KIHhlbi9hcmNoL2FybS92cHNjaS5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3Zwc2NpLmMgYi94ZW4vYXJjaC9hcm0vdnBzY2kuYwppbmRleCA3
ZWEzZWE1OGUzLi45YTA4MmFhNmVlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdnBzY2kuYwor
KysgYi94ZW4vYXJjaC9hcm0vdnBzY2kuYwpAQCAtMTg2LDcgKzE4Niw3IEBAIHN0YXRpYyBpbnQz
Ml90IGRvX3BzY2lfMF8yX2FmZmluaXR5X2luZm8ocmVnaXN0ZXJfdCB0YXJnZXRfYWZmaW5pdHks
CiAgICAgcmV0dXJuIFBTQ0lfMF8yX0FGRklOSVRZX0xFVkVMX09GRjsKIH0KIAotc3RhdGljIHVp
bnQzMl90IGRvX3BzY2lfMF8yX21pZ3JhdGVfaW5mb190eXBlKHZvaWQpCitzdGF0aWMgaW50MzJf
dCBkb19wc2NpXzBfMl9taWdyYXRlX2luZm9fdHlwZSh2b2lkKQogewogICAgIHJldHVybiBQU0NJ
XzBfMl9UT1NfTVBfT1JfTk9UX1BSRVNFTlQ7CiB9Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
