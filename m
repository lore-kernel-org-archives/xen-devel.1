From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC v2 3/9] libxl_qmp: Fix use of DEBUG_RECEIVED
Date: Mon, 16 Apr 2018 18:32:21 +0100
Message-ID: <20180416173227.22671-4-anthony.perard@citrix.com>
References: <20180416173227.22671-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vmis=hf=citrix.com=prvs=6372a2554=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1f87zU-0006i7-Fv
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 17:32:32 +0000
In-Reply-To: <20180416173227.22671-1-anthony.perard@citrix.com>
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
LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX3FtcC5jIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKaW5kZXggYmUyM2ZmZWE2YS4u
NGQyMDdjMzg0MiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKKysrIGIvdG9v
bHMvbGlieGwvbGlieGxfcW1wLmMKQEAgLTUyMiw3ICs1MjIsNyBAQCBzdGF0aWMgaW50IHFtcF9u
ZXh0KGxpYnhsX19nYyAqZ2MsIGxpYnhsX19xbXBfaGFuZGxlciAqcW1wKQogICAgICAgICB9CiAg
ICAgICAgIHFtcC0+YnVmZmVyW3JkXSA9ICdcMCc7CiAKLSAgICAgICAgREVCVUdfUkVQT1JUX1JF
Q0VJVkVEKHFtcC0+ZG9taWQsIHFtcC0+YnVmZmVyLCByZCk7CisgICAgICAgIERFQlVHX1JFUE9S
VF9SRUNFSVZFRChxbXAtPmRvbWlkLCBxbXAtPmJ1ZmZlciwgKGludClyZCk7CiAKICAgICAgICAg
ZG8gewogICAgICAgICAgICAgY2hhciAqZW5kID0gTlVMTDsKLS0gCkFudGhvbnkgUEVSQVJECgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
