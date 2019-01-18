From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] libxl: fix error message for unsharing
 namespaces
Date: Fri, 18 Jan 2019 12:47:45 +0000
Message-ID: <20190118124745.19990-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0nkm=P2=citrix.com=prvs=914c507ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gkTZp-0008PI-Le
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 12:48:49 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9s
aWJ4bC9saWJ4bF9saW51eC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfbGludXguYyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX2xpbnV4LmMKaW5kZXggNTlkZDk0NWJjMS4uODczYjAyNzFhZiAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfbGludXguYworKysgYi90b29scy9saWJ4bC9s
aWJ4bF9saW51eC5jCkBAIC0zNDQsNyArMzQ0LDcgQEAgaW50IGxpYnhsX19sb2NhbF9kbV9wcmVl
eGVjX3Jlc3RyaWN0KGxpYnhsX19nYyAqZ2MpCiAgICAgLyogVW5zaGFyZSBtb3VudCBhbmQgSVBD
IG5hbWVzcGFjZXMuICBUaGVzZSBhcmUgdW51c2VkIGJ5IFFFTVUuICovCiAgICAgciA9IHVuc2hh
cmUoQ0xPTkVfTkVXTlMgfCBDTE9ORV9ORVdJUEMpOwogICAgIGlmIChyKSB7Ci0gICAgICAgIExP
R0UoRVJST1IsICJsaWJ4bDogTW91bnQgYW5kIElQQyBuYW1lc3BhY2UgdW5mYWlsZWQiKTsKKyAg
ICAgICAgTE9HRShFUlJPUiwgImxpYnhsOiB1bnNoYXJlIE1vdW50IGFuZCBJUEMgbmFtZXNwYWNl
IGZhaWxlZCIpOwogICAgICAgICByZXR1cm4gRVJST1JfRkFJTDsKICAgICB9CiAKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
