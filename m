From: Colin King <colin.king@canonical.com>
Subject: [PATCH] xen-netback: remove redundant assignment to err
Date: Thu, 30 May 2019 20:04:38 +0100
Message-ID: <20190530190438.9571-1-colin.king__33863.5371228278$1559243158$gmane$org@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yI+1=T6=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1hWQM0-0001uN-Sp
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 19:04:44 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, "David S . Miller" <davem@davemloft.net>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSB2YXJp
YWJsZSBlcnIgaXMgYXNzaWduZWQgd2l0aCB0aGUgdmFsdWUgLUVOT01FTSB0aGF0IGlzIG5ldmVy
CnJlYWQgYW5kIGl0IGlzIHJlLWFzc2lnbmVkIGEgbmV3IHZhbHVlIGxhdGVyIG9uLiAgVGhlIGFz
c2lnbm1lbnQgaXMKcmVkdW5kYW50IGFuZCBjYW4gYmUgcmVtb3ZlZC4KCkFkZHJlc3Nlcy1Db3Zl
cml0eTogKCJVbnVzZWQgdmFsdWUiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29s
aW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2ludGVy
ZmFjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMgYi9k
cml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwppbmRleCA3ODMxOTg4NDRkZDcuLjI0
MGY3NjJiMzc0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNl
LmMKKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svaW50ZXJmYWNlLmMKQEAgLTYzMyw3ICs2
MzMsNyBAQCBpbnQgeGVudmlmX2Nvbm5lY3RfZGF0YShzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1
ZSwKIAkJCXVuc2lnbmVkIGludCByeF9ldnRjaG4pCiB7CiAJc3RydWN0IHRhc2tfc3RydWN0ICp0
YXNrOwotCWludCBlcnIgPSAtRU5PTUVNOworCWludCBlcnI7CiAKIAlCVUdfT04ocXVldWUtPnR4
X2lycSk7CiAJQlVHX09OKHF1ZXVlLT50YXNrKTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
