From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v1] bump XEN_DOMCTL_INTERFACE_VERSION
Date: Tue, 20 Nov 2018 11:56:12 +0100
Message-ID: <20181120105612.13809-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n6pm=n7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gP3hb-0000A2-6S
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 10:56:19 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2l0aG91dCB0aGlzIGNoYW5nZSB2YWxncmluZCBjYW4gbm90IGRlY2lkZSB3aGF0IHZhcmlhbnQg
b2YKeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gaXMgcHJvdmlkZWQgYXMgaW5wdXQuCgpGaXhlcyBj
b21taXQgNGE4MzQ5NzYzNSAoInhlbi9kb21jdGw6IE1lcmdlIHNldF9tYXhfZXZ0Y2huIGludG8g
Y3JlYXRlZG9tYWluIikKRml4ZXMgY29tbWl0IGE5MDNiZjUyMzMgKCJ0b29sczogUGFzcyBncmFu
dCB0YWJsZSBsaW1pdHMgdG8gWEVOX0RPTUNUTF9zZXRfZ250dGFiX2xpbWl0cyIpCkZpeGVzIGNv
bW1pdCBhZThiOGJjNTk5ICgieGVuL2RvbWN0bDogUmVtb3ZlIFhFTl9ET01DVExfc2V0X2dudHRh
Yl9saW1pdHMiKQpGaXhlcyBjb21taXQgNDczN2ZhNTJjZSAoInRvb2xzOiBQYXNzIG1heF92Y3B1
cyB0byBYRU5fRE9NQ1RMX2NyZWF0ZWRvbWFpbiIpCgpTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmlu
ZyA8b2xhZkBhZXBmbGUuZGU+Ci0tLQogeGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oIGIveGVuL2luY2x1ZGUvcHVibGljL2Rv
bWN0bC5oCmluZGV4IDRhNDZjMjhlZWQuLjNiYmJiYzk5NTEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL3B1YmxpYy9kb21jdGwuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKQEAg
LTM4LDcgKzM4LDcgQEAKICNpbmNsdWRlICJodm0vc2F2ZS5oIgogI2luY2x1ZGUgIm1lbW9yeS5o
IgogCi0jZGVmaW5lIFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAxMAorI2Rl
ZmluZSBYRU5fRE9NQ1RMX0lOVEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAwMTEKIAogLyoKICAqIE5C
LiB4ZW5fZG9tY3RsLmRvbWFpbiBpcyBhbiBJTi9PVVQgcGFyYW1ldGVyIGZvciB0aGlzIG9wZXJh
dGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
