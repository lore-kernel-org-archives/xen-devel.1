From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 03/32] libxl_qmp: Fix use of DEBUG_RECEIVED
Date: Fri, 27 Jul 2018 15:05:45 +0100
Message-ID: <20180727140614.13256-4-anthony.perard@citrix.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jnga=kl=citrix.com=prvs=739d1796c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fj3Ns-0005Rn-S3
 for xen-devel@lists.xenproject.org; Fri, 27 Jul 2018 14:06:20 +0000
In-Reply-To: <20180727140614.13256-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBmaXggY29tcGxpbGF0aW9uIGVycm9yIHdpdGggI2RlZmluZSBERUJVR19SRUNF
SVZFRCBvZiB0aGUKbWFjcm8gREVCVUdfUkVQT1JUX1JFQ0VJVkVELgoKICBlcnJvcjogZmllbGQg
cHJlY2lzaW9uIHNwZWNpZmllciDigJguKuKAmSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCY
aW504oCZLCBidXQgYXJndW1lbnQgOSBoYXMgdHlwZSDigJhzc2l6ZV90IHtha2EgbG9uZyBpbnR9
4oCZCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCgpOb3RlczoKICAgIE5l
dyBpbiBSRkMgdjIKCiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX3FtcC5jIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKaW5kZXggNDU1NWQ2YWUz
Ni4uMjcyMjc4MDJlNCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKKysrIGIv
dG9vbHMvbGlieGwvbGlieGxfcW1wLmMKQEAgLTUyOCw3ICs1MjgsNyBAQCBzdGF0aWMgaW50IHFt
cF9uZXh0KGxpYnhsX19nYyAqZ2MsIGxpYnhsX19xbXBfaGFuZGxlciAqcW1wKQogICAgICAgICB9
CiAgICAgICAgIHFtcC0+YnVmZmVyW3JkXSA9ICdcMCc7CiAKLSAgICAgICAgREVCVUdfUkVQT1JU
X1JFQ0VJVkVEKHFtcC0+ZG9taWQsIHFtcC0+YnVmZmVyLCByZCk7CisgICAgICAgIERFQlVHX1JF
UE9SVF9SRUNFSVZFRChxbXAtPmRvbWlkLCBxbXAtPmJ1ZmZlciwgKGludClyZCk7CiAKICAgICAg
ICAgZG8gewogICAgICAgICAgICAgY2hhciAqZW5kID0gTlVMTDsKLS0gCkFudGhvbnkgUEVSQVJE
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
