From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH 2/2] xen/gntdev: Check and release imported
 dma-bufs on close
Date: Thu, 14 Feb 2019 16:23:21 +0200
Message-ID: <20190214142321.1138-2-andr2000__11978.8205878407$1550154269$gmane$org@gmail.com>
References: <20190214142321.1138-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U2wJ=QV=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1guHvJ-0002J2-63
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 14:23:33 +0000
Received: by mail-lj1-x243.google.com with SMTP id s5-v6so5354527ljd.12
 for <xen-devel@lists.xenproject.org>; Thu, 14 Feb 2019 06:23:32 -0800 (PST)
In-Reply-To: <20190214142321.1138-1-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, jgross@suse.com, boris.ostrovsky@oracle.com
Cc: andr2000@gmail.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKQ2hlY2sgaWYgdGhlcmUgYXJlIGFueSBpbXBvcnRlZCBkbWEtYnVmcyBsZWZ0IG5v
dCByZWxlYXNlZCBieQp1c2VyLXNwYWNlIHdoZW4gZ3JhbnQgZGV2aWNlJ3MgcmVsZWFzZSBjYWxs
YmFjayBpcyBjYWxsZWQgYW5kCmZyZWUgdGhvc2UgaWYgdGhpcyBpcyB0aGUgY2FzZS4gVGhpcyBj
YW4gaGFwcGVuIGlmIHVzZXItc3BhY2UKbGVha3MgdGhlIGJ1ZmZlcnMgYmVjYXVzZSBvZiBhIGJ1
ZyBvciBhcHBsaWNhdGlvbiBoYXMgYmVlbgp0ZXJtaW5hdGVkIGZvciBhbnkgcmVhc29uLgoKU2ln
bmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hl
bmtvQGVwYW0uY29tPgotLS0KIGRyaXZlcnMveGVuL2dudGRldi1kbWFidWYuYyB8IDkgKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy94ZW4vZ250ZGV2LWRtYWJ1Zi5jIGIvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jCmluZGV4
IGQ5N2ZjZmM1ZTU1OC4uMmM0ZjMyNGY4NjI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9nbnRk
ZXYtZG1hYnVmLmMKKysrIGIvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jCkBAIC03NDUsNiAr
NzQ1LDE0IEBAIHN0YXRpYyBpbnQgZG1hYnVmX2ltcF9yZWxlYXNlKHN0cnVjdCBnbnRkZXZfZG1h
YnVmX3ByaXYgKnByaXYsIHUzMiBmZCkKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHZvaWQgZG1h
YnVmX2ltcF9yZWxlYXNlX2FsbChzdHJ1Y3QgZ250ZGV2X2RtYWJ1Zl9wcml2ICpwcml2KQorewor
CXN0cnVjdCBnbnRkZXZfZG1hYnVmICpxLCAqZ250ZGV2X2RtYWJ1ZjsKKworCWxpc3RfZm9yX2Vh
Y2hfZW50cnlfc2FmZShnbnRkZXZfZG1hYnVmLCBxLCAmcHJpdi0+aW1wX2xpc3QsIG5leHQpCisJ
CWRtYWJ1Zl9pbXBfcmVsZWFzZShwcml2LCBnbnRkZXZfZG1hYnVmLT5mZCk7Cit9CisKIC8qIERN
QSBidWZmZXIgSU9DVEwgc3VwcG9ydC4gKi8KIAogbG9uZyBnbnRkZXZfaW9jdGxfZG1hYnVmX2V4
cF9mcm9tX3JlZnMoc3RydWN0IGdudGRldl9wcml2ICpwcml2LCBpbnQgdXNlX3B0ZW1vZCwKQEAg
LTg2Miw1ICs4NzAsNiBAQCBzdHJ1Y3QgZ250ZGV2X2RtYWJ1Zl9wcml2ICpnbnRkZXZfZG1hYnVm
X2luaXQoc3RydWN0IGZpbGUgKmZpbHApCiAKIHZvaWQgZ250ZGV2X2RtYWJ1Zl9maW5pKHN0cnVj
dCBnbnRkZXZfZG1hYnVmX3ByaXYgKnByaXYpCiB7CisJZG1hYnVmX2ltcF9yZWxlYXNlX2FsbChw
cml2KTsKIAlrZnJlZShwcml2KTsKIH0KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
