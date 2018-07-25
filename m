From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/blkfront: remove unused macros
Date: Wed, 25 Jul 2018 09:42:07 +0200
Message-ID: <20180725074207.6808-1-jgross__29298.0320672088$1532504462$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sdpf=kj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fiER2-0008PL-H3
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 07:42:12 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

UmVtb3ZlIHNvbWUgbWFjcm9zIG5vdCB1c2VkIGFueXdoZXJlLgoKU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvYmxvY2sveGVuLWJsa2Zy
b250LmMgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxr
ZnJvbnQuYwppbmRleCBiNWNlZGNjYjVkN2QuLjk0MzAwZGJlMzU4YiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYworKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9u
dC5jCkBAIC0yNTEsMTQgKzI1MSw5IEBAIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0sobWlub3JfbG9j
ayk7CiAjZGVmaW5lIEdSQU5UU19QRVJfSU5ESVJFQ1RfRlJBTUUgXAogCShYRU5fUEFHRV9TSVpF
IC8gc2l6ZW9mKHN0cnVjdCBibGtpZl9yZXF1ZXN0X3NlZ21lbnQpKQogCi0jZGVmaW5lIFBTRUdT
X1BFUl9JTkRJUkVDVF9GUkFNRQlcCi0JKEdSQU5UU19JTkRJUkVDVF9GUkFNRSAvIEdSQU5UU19Q
U0VHUykKLQogI2RlZmluZSBJTkRJUkVDVF9HUkVGUyhfZ3JhbnRzKQkJXAogCURJVl9ST1VORF9V
UChfZ3JhbnRzLCBHUkFOVFNfUEVSX0lORElSRUNUX0ZSQU1FKQogCi0jZGVmaW5lIEdSRUZTKF9w
c2VncykJKChfcHNlZ3MpICogR1JBTlRTX1BFUl9QU0VHKQotCiBzdGF0aWMgaW50IGJsa2Zyb250
X3NldHVwX2luZGlyZWN0KHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZvKTsKIHN0YXRp
YyB2b2lkIGJsa2Zyb250X2dhdGhlcl9iYWNrZW5kX2ZlYXR1cmVzKHN0cnVjdCBibGtmcm9udF9p
bmZvICppbmZvKTsKIHN0YXRpYyBpbnQgbmVnb3RpYXRlX21xKHN0cnVjdCBibGtmcm9udF9pbmZv
ICppbmZvKTsKLS0gCjIuMTMuNwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
