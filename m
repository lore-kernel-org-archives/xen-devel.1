From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 1/2] Revert "libxl: fix build on rather old
 systems"
Date: Fri, 11 Jan 2019 18:12:10 +0000
Message-ID: <20190111181211.24073-1-ian.jackson@eu.citrix.com>
References: <23608.54527.696432.275991@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ayr2=PT=citrix.com=prvs=9077728fb=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gi1IA-0007wT-HJ
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 18:12:26 +0000
In-Reply-To: <23608.54527.696432.275991@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyByZXZlcnRzIGNvbW1pdCAxYmNlNWY5YmFmMGY0YTRlNTA3MjJmMzJiNDRhZmU0ZmRlZmM2
YjM1LgoKVGhpcyBzaXR1YXRpb24gc2hvdWxkIGJlIGhhbmRsZWQgYnkgZGlzYWJsaW5nIHRoZSBk
bSByZXN0cmljdApmZWF0dXJlLCBub3Qgc2lsZW50bHkgZmFsbGluZyBiYWNrIHRvIGxvd2VyIHBy
b3RlY3Rpb24uCgpBbHNvIHRoaXMgI2lmZGVmZmVyeSBpcyBiYWQgc3R5bGUuCgpTaWduZWQtb2Zm
LWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9s
aWJ4bC9saWJ4bF9saW51eC5jIHwgMTYgKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfbGludXguYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2xpbnV4LmMKaW5kZXggYTRjMmYy
OGRiZi4uNjQ3NWNjYTY0YiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfbGludXguYwor
KysgYi90b29scy9saWJ4bC9saWJ4bF9saW51eC5jCkBAIC0zMzQsMjQgKzMzNCwxMiBAQCBpbnQg
bGlieGxfX2xvY2FsX2RtX3ByZWV4ZWNfcmVzdHJpY3QobGlieGxfX2djICpnYykKICAgICB1bnNp
Z25lZCBpOwogCiAgICAgLyogVW5zaGFyZSBtb3VudCBhbmQgSVBDIG5hbWVzcGFjZXMuICBUaGVz
ZSBhcmUgdW51c2VkIGJ5IFFFTVUuICovCi0gICAgciA9IHVuc2hhcmUoQ0xPTkVfTkVXTlMpOwor
ICAgIHIgPSB1bnNoYXJlKENMT05FX05FV05TIHwgQ0xPTkVfTkVXSVBDKTsKICAgICBpZiAocikg
ewotICAgICAgICBMT0dFKEVSUk9SLCAibGlieGw6IE1vdW50IG5hbWVzcGFjZSB1bnNoYXJlIGZh
aWxlZCIpOworICAgICAgICBMT0dFKEVSUk9SLCAibGlieGw6IE1vdW50IGFuZCBJUEMgbmFtZXNw
YWNlIHVuZmFpbGVkIik7CiAgICAgICAgIHJldHVybiBFUlJPUl9GQUlMOwogICAgIH0KIAotI2lm
bmRlZiBDTE9ORV9ORVdJUEMgLyogQXZhaWxhYmxlIGFzIG9mIExpbnV4IDIuNi4xOSAvIGdsaWJj
IDIuOCAqLwotIyBkZWZpbmUgQ0xPTkVfTkVXSVBDIDB4MDgwMDAwMDAKLSNlbmRpZgotICAgIHIg
PSB1bnNoYXJlKENMT05FX05FV0lQQyk7Ci0gICAgaWYgKHIpIHsKLSAgICAgICAgaWYgKHIgJiYg
ZXJybm8gIT0gRUlOVkFMKSB7Ci0gICAgICAgICAgICBMT0dFKEVSUk9SLCAibGlieGw6IElQQyBu
YW1lc3BhY2UgdW5zaGFyZSBmYWlsZWQiKTsKLSAgICAgICAgICAgIHJldHVybiBFUlJPUl9GQUlM
OwotICAgICAgICB9Ci0gICAgICAgIExPRyhXQVJOLCAibGlieGw6IElQQyBuYW1lc3BhY2UgdW5z
aGFyZSB1bmF2YWlsYWJsZSIpOwotICAgIH0KLQogICAgIC8qIFNldCB2YXJpb3VzICJlYXN5IiBy
bGltaXRzICovCiAgICAgZm9yIChpID0gMDsgcmxpbWl0c1tpXS5yZXNvdXJjZSAhPSBSTElNSVRf
TkxJTUlUUzsgaSsrKSB7CiAgICAgICAgIHN0cnVjdCBybGltaXQgcmxpbTsKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
