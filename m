From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH 6/7] tools/gdbsx: fix -Wstringop-truncation
 warning
Date: Thu,  5 Apr 2018 03:50:54 +0200
Message-ID: <2fa6aed63cc1243f5d3af779d27b8382ceae25da.1522893038.git-series.marmarek@invisiblethingslab.com>
References: <cover.c71341b28191a3808896e82914eb11c1472687b2.1522893038.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <cover.c71341b28191a3808896e82914eb11c1472687b2.1522893038.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.c71341b28191a3808896e82914eb11c1472687b2.1522893038.git-series.marmarek@invisiblethingslab.com>
References: <cover.c71341b28191a3808896e82914eb11c1472687b2.1522893038.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

Z2NjLTggY29tcGxhaW5zOgoKICAgIGd4X21haW4uYzogSW4gZnVuY3Rpb24gJ3ByZXBhcmVfc3Rv
cF9yZXBseSc6CiAgICBneF9tYWluLmM6Mzg1Ojk6IGVycm9yOiAnc3RybmNweScgb3V0cHV0IHRy
dW5jYXRlZCBiZWZvcmUgdGVybWluYXRpbmcgbnVsIGNvcHlpbmcgNiBieXRlcyBmcm9tIGEgc3Ry
aW5nIG9mIHRoZSBzYW1lIGxlbmd0aCBbLVdlcnJvcj1zdHJpbmdvcC10cnVuY2F0aW9uXQogICAg
ICAgICAgICAgc3RybmNweShidWYsICJ3YXRjaDoiLCA2KTsKICAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KClNpbmNlIHRlcm1pbmF0aW5nICdcMCcgaXNuJ3QgbmVlZGVkIGhl
cmUgYXQgYWxsLCBzd2l0Y2ggdG8gbWVtY3B5LgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5
a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0KIHRv
b2xzL2RlYnVnZ2VyL2dkYnN4L2d4L2d4X21haW4uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2RlYnVnZ2Vy
L2dkYnN4L2d4L2d4X21haW4uYyBiL3Rvb2xzL2RlYnVnZ2VyL2dkYnN4L2d4L2d4X21haW4uYwpp
bmRleCBhOTA4YzQ1Li42ZGZhNTAxIDEwMDY0NAotLS0gYS90b29scy9kZWJ1Z2dlci9nZGJzeC9n
eC9neF9tYWluLmMKKysrIGIvdG9vbHMvZGVidWdnZXIvZ2Ric3gvZ3gvZ3hfbWFpbi5jCkBAIC0z
ODIsNyArMzgyLDcgQEAgcHJlcGFyZV9zdG9wX3JlcGx5KGVudW0gdGFyZ2V0X3NpZ25hbCBzaWcs
IGNoYXIgKmJ1ZiwgdmNwdWlkX3QgdmNwdSkKIAogICAgIC8qIFRCRDogY2hlY2sgaWYgd2Ugc3Rv
cHBlZCBiZWNhdXNlIG9mIHdhdGNocG9pbnQgKi8KICAgICBpZiAod2F0Y2hwb2ludF9zdG9wKCkp
IHsKLSAgICAgICAgc3RybmNweShidWYsICJ3YXRjaDoiLCA2KTsKKyAgICAgICAgbWVtY3B5KGJ1
ZiwgIndhdGNoOiIsIDYpOwogICAgICAgICBidWYgKz0gNjsKICAgICAgICAgLyogVEJEOiAqKi8K
ICAgICB9Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
