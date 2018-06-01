From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 03/31] libxl_qmp: Fix use of DEBUG_RECEIVED
Date: Fri, 1 Jun 2018 15:36:52 +0100
Message-ID: <20180601143720.24637-4-anthony.perard@citrix.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rmms=it=citrix.com=prvs=6833cd46b=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fOlBF-0007jS-9m
 for xen-devel@lists.xenproject.org; Fri, 01 Jun 2018 14:37:25 +0000
In-Reply-To: <20180601143720.24637-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBmaXggY29tcGxpbGF0aW9uIGVycm9yIHdpdGggI2RlZmluZSBERUJVR19SRUNF
SVZFRCBvZiB0aGUKbWFjcm8gREVCVUdfUkVQT1JUX1JFQ0VJVkVELgoKICBlcnJvcjogZmllbGQg
cHJlY2lzaW9uIHNwZWNpZmllciDigJguKuKAmSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCY
aW504oCZLCBidXQgYXJndW1lbnQgOSBoYXMgdHlwZSDigJhzc2l6ZV90IHtha2EgbG9uZyBpbnR9
4oCZCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQoKTm90ZXM6
CiAgICBOZXcgaW4gUkZDIHYyCgogdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF9xbXAuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCmluZGV4IDM2
YjE4M2M4YzQuLmM0MmUyYmY0YjggMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5j
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCkBAIC01MjgsNyArNTI4LDcgQEAgc3RhdGlj
IGludCBxbXBfbmV4dChsaWJ4bF9fZ2MgKmdjLCBsaWJ4bF9fcW1wX2hhbmRsZXIgKnFtcCkKICAg
ICAgICAgfQogICAgICAgICBxbXAtPmJ1ZmZlcltyZF0gPSAnXDAnOwogCi0gICAgICAgIERFQlVH
X1JFUE9SVF9SRUNFSVZFRChxbXAtPmRvbWlkLCBxbXAtPmJ1ZmZlciwgcmQpOworICAgICAgICBE
RUJVR19SRVBPUlRfUkVDRUlWRUQocW1wLT5kb21pZCwgcW1wLT5idWZmZXIsIChpbnQpcmQpOwog
CiAgICAgICAgIGRvIHsKICAgICAgICAgICAgIGNoYXIgKmVuZCA9IE5VTEw7Ci0tIApBbnRob255
IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
