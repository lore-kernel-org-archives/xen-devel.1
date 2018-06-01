From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 11/31] libxl_qmp: Remove unused yajl_ctx form
 handler
Date: Fri, 1 Jun 2018 15:37:00 +0100
Message-ID: <20180601143720.24637-12-anthony.perard@citrix.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rmms=it=citrix.com=prvs=6833cd46b=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fOlW5-0002Zj-Dk
 for xen-devel@lists.xenproject.org; Fri, 01 Jun 2018 14:58:57 +0000
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

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9xbXAuYyBiL3Rvb2xz
L2xpYnhsL2xpYnhsX3FtcC5jCmluZGV4IDRkYTg0ZGNmMTYuLjExODRjYTgyM2YgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5j
CkBAIC0xMTEsOCArMTExLDYgQEAgc3RydWN0IGxpYnhsX19xbXBfaGFuZGxlciB7CiAgICAgLyog
d2FpdF9mb3JfaWQgd2lsbCBiZSB1c2VkIGJ5IHRoZSBzeW5jaHJvbm91cyBzZW5kIGZ1bmN0aW9u
ICovCiAgICAgaW50IHdhaXRfZm9yX2lkOwogCi0gICAgbGlieGxfX3lhamxfY3R4ICp5YWpsX2N0
eDsKLQogICAgIGxpYnhsX2N0eCAqY3R4OwogICAgIHVpbnQzMl90IGRvbWlkOwogCi0tIApBbnRo
b255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
